Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH0w4-00036r-Lf
 for ath10k@lists.infradead.org; Mon, 29 Oct 2018 06:22:02 +0000
From: Yu Wang <yyuwang@codeaurora.org>
Subject: [PATCH] ath10k: add amsdu support for monitor mode
Date: Mon, 29 Oct 2018 14:21:44 +0800
Message-Id: <1540794104-30957-2-git-send-email-yyuwang@codeaurora.org>
In-Reply-To: <1540794104-30957-1-git-send-email-yyuwang@codeaurora.org>
References: <1540794104-30957-1-git-send-email-yyuwang@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

When processing HTT_T2H_MSG_TYPE_RX_IN_ORD_PADDR_IND,
if the length of a msdu is larger than the tailroom
of the rx skb, skb_over_panic issue will happen when
calling skb_put.
In monitor mode, amsdu will be handled in this path,
and msdu_len of the first msdu_desc is the length of
the entire amsdu, which might be larger than the
maximum length of a skb, in such case, it will hit
the issue upon.
To fix this issue, processing msdu list separately
for monitor mode.

Successfully tested with:
QCA6174 (FW version: RM.4.4.1.c2-00057-QCARMSWP-1).

Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 187 +++++++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index ffec98f..8f88229 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -469,6 +469,167 @@ static struct sk_buff *ath10k_htt_rx_pop_paddr(struct ath10k_htt *htt,
 	return msdu;
 }
 
+static inline void
+ath10k_htt_append_frag_list(struct sk_buff *skb_head,
+			    struct sk_buff *frag_list,
+			    unsigned int frag_len)
+{
+	skb_shinfo(skb_head)->frag_list = frag_list;
+	skb_head->data_len = frag_len;
+	skb_head->len += skb_head->data_len;
+}
+
+static int
+ath10k_htt_rx_handle_amsdu_mon_32(struct ath10k_htt *htt, struct sk_buff *msdu,
+				  struct htt_rx_in_ord_msdu_desc **msdu_desc)
+{
+	struct ath10k *ar = htt->ar;
+	u32 paddr;
+	struct sk_buff *frag_buf;
+	struct sk_buff *prev_frag_buf;
+	u8 last_frag;
+	struct htt_rx_in_ord_msdu_desc *ind_desc = *msdu_desc;
+	struct htt_rx_desc *rxd;
+	int amsdu_len = __le16_to_cpu(ind_desc->msdu_len);
+
+	rxd = (void *)msdu->data;
+	trace_ath10k_htt_rx_desc(ar, rxd, sizeof(*rxd));
+
+	skb_put(msdu, sizeof(struct htt_rx_desc));
+	skb_pull(msdu, sizeof(struct htt_rx_desc));
+	skb_put(msdu, min(amsdu_len, HTT_RX_MSDU_SIZE));
+	amsdu_len -= msdu->len;
+
+	last_frag = ind_desc->reserved;
+	if (last_frag) {
+		if (amsdu_len) {
+			ath10k_warn(ar, "invalid amsdu len %u, left %d",
+				    __le16_to_cpu(ind_desc->msdu_len),
+				    amsdu_len);
+		}
+		return 0;
+	}
+
+	ind_desc++;
+	paddr = __le32_to_cpu(ind_desc->msdu_paddr);
+	frag_buf = ath10k_htt_rx_pop_paddr(htt, paddr);
+	if (!frag_buf) {
+		ath10k_warn(ar, "failed to pop frag-1 paddr: 0x%x", paddr);
+		return -ENOENT;
+	}
+
+	skb_put(frag_buf, min(amsdu_len, HTT_RX_BUF_SIZE));
+	ath10k_htt_append_frag_list(msdu, frag_buf, amsdu_len);
+
+	amsdu_len -= frag_buf->len;
+	prev_frag_buf = frag_buf;
+	last_frag = ind_desc->reserved;
+	while (!last_frag) {
+		ind_desc++;
+		paddr = __le32_to_cpu(ind_desc->msdu_paddr);
+		frag_buf = ath10k_htt_rx_pop_paddr(htt, paddr);
+		if (!frag_buf) {
+			ath10k_warn(ar, "failed to pop frag-n paddr: 0x%x",
+				    paddr);
+			prev_frag_buf->next = NULL;
+			return -ENOENT;
+		}
+
+		skb_put(frag_buf, min(amsdu_len, HTT_RX_BUF_SIZE));
+		last_frag = ind_desc->reserved;
+		amsdu_len -= frag_buf->len;
+
+		prev_frag_buf->next = frag_buf;
+		prev_frag_buf = frag_buf;
+	}
+
+	if (amsdu_len) {
+		ath10k_warn(ar, "invalid amsdu len %u, left %d",
+			    __le16_to_cpu(ind_desc->msdu_len), amsdu_len);
+	}
+
+	*msdu_desc = ind_desc;
+
+	prev_frag_buf->next = NULL;
+	return 0;
+}
+
+static int
+ath10k_htt_rx_handle_amsdu_mon_64(struct ath10k_htt *htt, struct sk_buff *msdu,
+				  struct htt_rx_in_ord_msdu_desc_ext
+				  **msdu_desc)
+{
+	struct ath10k *ar = htt->ar;
+	u64 paddr;
+	struct sk_buff *frag_buf;
+	struct sk_buff *prev_frag_buf;
+	u8 last_frag;
+	struct htt_rx_in_ord_msdu_desc_ext *ind_desc = *msdu_desc;
+	struct htt_rx_desc *rxd;
+	int amsdu_len = __le16_to_cpu(ind_desc->msdu_len);
+
+	rxd = (void *)msdu->data;
+	trace_ath10k_htt_rx_desc(ar, rxd, sizeof(*rxd));
+
+	skb_put(msdu, sizeof(struct htt_rx_desc));
+	skb_pull(msdu, sizeof(struct htt_rx_desc));
+	skb_put(msdu, min(amsdu_len, HTT_RX_MSDU_SIZE));
+	amsdu_len -= msdu->len;
+
+	last_frag = ind_desc->reserved;
+	if (last_frag) {
+		if (amsdu_len) {
+			ath10k_warn(ar, "invalid amsdu len %u, left %d",
+				    __le16_to_cpu(ind_desc->msdu_len),
+				    amsdu_len);
+		}
+		return 0;
+	}
+
+	ind_desc++;
+	paddr = __le64_to_cpu(ind_desc->msdu_paddr);
+	frag_buf = ath10k_htt_rx_pop_paddr(htt, paddr);
+	if (!frag_buf) {
+		ath10k_warn(ar, "failed to pop frag-1 paddr: 0x%llx", paddr);
+		return -ENOENT;
+	}
+
+	skb_put(frag_buf, min(amsdu_len, HTT_RX_BUF_SIZE));
+	ath10k_htt_append_frag_list(msdu, frag_buf, amsdu_len);
+
+	amsdu_len -= frag_buf->len;
+	prev_frag_buf = frag_buf;
+	last_frag = ind_desc->reserved;
+	while (!last_frag) {
+		ind_desc++;
+		paddr = __le64_to_cpu(ind_desc->msdu_paddr);
+		frag_buf = ath10k_htt_rx_pop_paddr(htt, paddr);
+		if (!frag_buf) {
+			ath10k_warn(ar, "failed to pop frag-n paddr: 0x%llx",
+				    paddr);
+			prev_frag_buf->next = NULL;
+			return -ENOENT;
+		}
+
+		skb_put(frag_buf, min(amsdu_len, HTT_RX_BUF_SIZE));
+		last_frag = ind_desc->reserved;
+		amsdu_len -= frag_buf->len;
+
+		prev_frag_buf->next = frag_buf;
+		prev_frag_buf = frag_buf;
+	}
+
+	if (amsdu_len) {
+		ath10k_warn(ar, "invalid amsdu len %u, left %d",
+			    __le16_to_cpu(ind_desc->msdu_len), amsdu_len);
+	}
+
+	*msdu_desc = ind_desc;
+
+	prev_frag_buf->next = NULL;
+	return 0;
+}
+
 static int ath10k_htt_rx_pop_paddr32_list(struct ath10k_htt *htt,
 					  struct htt_rx_in_ord_ind *ev,
 					  struct sk_buff_head *list)
@@ -495,6 +656,19 @@ static int ath10k_htt_rx_pop_paddr32_list(struct ath10k_htt *htt,
 			return -ENOENT;
 		}
 
+		if (!is_offload && ar->monitor_arvif) {
+			int ret =
+				ath10k_htt_rx_handle_amsdu_mon_32(htt, msdu,
+								  &msdu_desc);
+			if (ret) {
+				__skb_queue_purge(list);
+				return ret;
+			}
+			__skb_queue_tail(list, msdu);
+			msdu_desc++;
+			continue;
+		}
+
 		__skb_queue_tail(list, msdu);
 
 		if (!is_offload) {
@@ -544,6 +718,19 @@ static int ath10k_htt_rx_pop_paddr64_list(struct ath10k_htt *htt,
 			return -ENOENT;
 		}
 
+		if (!is_offload && ar->monitor_arvif) {
+			int ret =
+				ath10k_htt_rx_handle_amsdu_mon_64(htt, msdu,
+								  &msdu_desc);
+			if (ret) {
+				__skb_queue_purge(list);
+				return ret;
+			}
+			__skb_queue_tail(list, msdu);
+			msdu_desc++;
+			continue;
+		}
+
 		__skb_queue_tail(list, msdu);
 
 		if (!is_offload) {
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
