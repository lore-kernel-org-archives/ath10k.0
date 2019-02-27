Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyxIe-000707-6N
 for ath10k@lists.infradead.org; Wed, 27 Feb 2019 11:22:57 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH 1/2] ath10k: Extended the HTT stats support to retrieve
 Mu-MIMO related stats
Date: Wed, 27 Feb 2019 16:54:41 +0530
Message-Id: <1551266682-32073-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, vikpatel@codeaurora.org, arnagara@codeaurora.org, linux-wireless@vger.kernel.org

Extended the bit mask value of the HTT stats to get the Mu-MIMO
related stats via tracing.

Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/debug.c  | 4 ++--
 drivers/net/wireless/ath/ath10k/htt.h    | 3 ++-
 drivers/net/wireless/ath/ath10k/htt_tx.c | 8 ++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 1b8903280d42..ca1af0e1623c 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -922,8 +922,8 @@ static ssize_t ath10k_write_htt_stats_mask(struct file *file,
 	if (ret)
 		return ret;
 
-	/* max 8 bit masks (for now) */
-	if (mask > 0xff)
+	/* max 17 bit masks (for now) */
+	if (mask > HTT_STATS_BIT_MASK)
 		return -E2BIG;
 
 	mutex_lock(&ar->conf_mutex);
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index fef716aa8f3a..8ff432bb2e86 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -315,6 +315,7 @@ struct htt_stats_req {
 } __packed;
 
 #define HTT_STATS_REQ_CFG_STAT_TYPE_INVALID 0xff
+#define HTT_STATS_BIT_MASK GENMASK(16, 0)
 
 /*
  * htt_oob_sync_req - request out-of-band sync
@@ -2109,7 +2110,7 @@ void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff *skb);
 void ath10k_htt_htc_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb);
 bool ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb);
 int ath10k_htt_h2t_ver_req_msg(struct ath10k_htt *htt);
-int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u8 mask, u64 cookie);
+int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u32 mask, u64 cookie);
 int ath10k_htt_h2t_aggr_cfg_msg(struct ath10k_htt *htt,
 				u8 max_subfrms_ampdu,
 				u8 max_subfrms_amsdu);
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index d8e9cc0bb772..7e5f0eba043b 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -580,7 +580,7 @@ int ath10k_htt_h2t_ver_req_msg(struct ath10k_htt *htt)
 	return 0;
 }
 
-int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u8 mask, u64 cookie)
+int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u32 mask, u64 cookie)
 {
 	struct ath10k *ar = htt->ar;
 	struct htt_stats_req *req;
@@ -603,11 +603,11 @@ int ath10k_htt_h2t_stats_req(struct ath10k_htt *htt, u8 mask, u64 cookie)
 
 	memset(req, 0, sizeof(*req));
 
-	/* currently we support only max 8 bit masks so no need to worry
+	/* currently we support only max 24 bit masks so no need to worry
 	 * about endian support
 	 */
-	req->upload_types[0] = mask;
-	req->reset_types[0] = mask;
+	memcpy(req->upload_types, &mask, 3);
+	memcpy(req->reset_types, &mask, 3);
 	req->stat_type = HTT_STATS_REQ_CFG_STAT_TYPE_INVALID;
 	req->cookie_lsb = cpu_to_le32(cookie & 0xffffffff);
 	req->cookie_msb = cpu_to_le32((cookie & 0xffffffff00000000ULL) >> 32);
-- 
2.20.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
