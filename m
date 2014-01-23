Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W67p6-0000yX-94
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 00:07:08 +0000
From: greearb@candelatech.com
Subject: [PATCH 4/4] ath10k:  Better tx/rx debugging.
Date: Wed, 22 Jan 2014 16:06:02 -0800
Message-Id: <1390435562-15473-4-git-send-email-greearb@candelatech.com>
In-Reply-To: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

Make it easier to grep for htt rx errors.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 18 ++++++++++--------
 drivers/net/wireless/ath/ath10k/htt_tx.c |  4 ++--
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 49e6c4e..7b0b51f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -324,7 +324,7 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 				 msdu->len + skb_tailroom(msdu),
 				 DMA_FROM_DEVICE);
 
-		ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "htt rx: ",
+		ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "htt rx pop: ",
 				msdu->data, msdu->len + skb_tailroom(msdu));
 
 		rx_desc = (struct htt_rx_desc *)msdu->data;
@@ -417,8 +417,8 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 					 next->len + skb_tailroom(next),
 					 DMA_FROM_DEVICE);
 
-			ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "htt rx: ",
-					next->data,
+			ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL,
+					"htt rx chained: ", next->data,
 					next->len + skb_tailroom(next));
 
 			skb_trim(next, 0);
@@ -751,7 +751,7 @@ static void ath10k_htt_rx_msdu(struct ath10k_htt *htt, struct htt_rx_info *info)
 
 	/* This shouldn't happen. If it does than it may be a FW bug. */
 	if (skb->next) {
-		ath10k_warn("received chained non A-MSDU frame\n");
+		ath10k_warn("htt rx: received chained non A-MSDU frame\n");
 		ath10k_htt_rx_free_msdu_chain(skb->next);
 		skb->next = NULL;
 	}
@@ -937,7 +937,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			}
 
 			if (ath10k_htt_rx_has_decrypt_err(msdu_head)) {
-				ath10k_warn("htt rx dropping due to decrypt-err\n");
+				ath10k_warn("htt rx dropping due to decrypt error\n");
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
@@ -946,6 +946,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 
 			/* Skip mgmt frames while we handle this in WMI */
 			if (status == HTT_RX_IND_MPDU_STATUS_MGMT_CTRL) {
+				ath10k_dbg(ATH10K_DBG_HTT, "htt rx mgmt ctrl\n");
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
@@ -961,6 +962,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			}
 
 			if (test_bit(ATH10K_CAC_RUNNING, &htt->ar->dev_flags)) {
+				ath10k_warn("htt rx: CAC running\n");
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
@@ -968,7 +970,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			/* FIXME: we do not support chaining yet.
 			 * this needs investigation */
 			if (msdu_chaining) {
-				ath10k_warn("msdu_chaining is true\n");
+				ath10k_warn("htt rx: msdu_chaining is true\n");
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
@@ -1103,7 +1105,7 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 
 	skb_trim(info.skb, info.skb->len - trim);
 
-	ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "htt frag mpdu: ",
+	ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "htt rx frag mpdu: ",
 			info.skb->data, info.skb->len);
 	ath10k_process_rx(htt->ar, &info);
 
@@ -1124,7 +1126,7 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 	if (!IS_ALIGNED((unsigned long)skb->data, 4))
 		ath10k_warn("unaligned htt message, expect trouble\n");
 
-	ath10k_dbg(ATH10K_DBG_HTT, "HTT RX, msg_type: 0x%0X\n",
+	ath10k_dbg(ATH10K_DBG_HTT, "htt rx, msg_type: 0x%0X\n",
 		   resp->hdr.msg_type);
 	switch (resp->hdr.msg_type) {
 	case HTT_T2H_MSG_TYPE_VERSION_CONF: {
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index f1d36d2..acaa046 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -460,9 +460,9 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 					   DMA_TO_DEVICE);
 	}
 
-	ath10k_dbg(ATH10K_DBG_HTT, "msdu 0x%llx\n",
+	ath10k_dbg(ATH10K_DBG_HTT, "tx-msdu 0x%llx\n",
 		   (unsigned long long) ATH10K_SKB_CB(msdu)->paddr);
-	ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "msdu: ",
+	ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "tx-msdu: ",
 			msdu->data, msdu->len);
 
 	skb_put(txdesc, desc_len);
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
