Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlfC4-0007vV-6J
 for ath10k@lists.infradead.org; Tue, 04 Nov 2014 14:34:49 +0000
Received: by mail-lb0-f169.google.com with SMTP id 10so1057636lbg.28
 for <ath10k@lists.infradead.org>; Tue, 04 Nov 2014 06:34:27 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 5/7] ath10k: remove unused function argument
Date: Tue,  4 Nov 2014 15:22:09 +0100
Message-Id: <1415110931-10945-6-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
References: <1415110931-10945-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

The original fix has been moved into a different
place in the code.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 6abfea7..55e4568 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -306,8 +306,7 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
 /* return: < 0 fatal error, 0 - non chained msdu, 1 chained msdu */
 static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 				   u8 **fw_desc, int *fw_desc_len,
-				   struct sk_buff_head *amsdu,
-				   u32 *attention)
+				   struct sk_buff_head *amsdu)
 {
 	struct ath10k *ar = htt->ar;
 	int msdu_len, msdu_chaining = 0;
@@ -348,11 +347,6 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 			return -EIO;
 		}
 
-		*attention |= __le32_to_cpu(rx_desc->attention.flags) &
-					    (RX_ATTENTION_FLAGS_TKIP_MIC_ERR |
-					     RX_ATTENTION_FLAGS_DECRYPT_ERR |
-					     RX_ATTENTION_FLAGS_FCS_ERR |
-					     RX_ATTENTION_FLAGS_MGMT_TYPE);
 		/*
 		 * Copy the FW rx descriptor for this MSDU from the rx
 		 * indication message into the MSDU's netbuf. HL uses the
@@ -1362,7 +1356,6 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 	struct htt_rx_indication_mpdu_range *mpdu_ranges;
 	struct sk_buff_head amsdu;
 	int num_mpdu_ranges;
-	u32 attention;
 	int fw_desc_len;
 	u8 *fw_desc;
 	bool channel_set;
@@ -1412,11 +1405,9 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 		mpdu_count += mpdu_ranges[i].mpdu_count;
 
 	while (mpdu_count--) {
-		attention = 0;
 		__skb_queue_head_init(&amsdu);
 		ret = ath10k_htt_rx_amsdu_pop(htt, &fw_desc,
-					      &fw_desc_len, &amsdu,
-					      &attention);
+					      &fw_desc_len, &amsdu);
 		if (ret < 0) {
 			ath10k_warn(ar, "rx ring became corrupted: %d\n", ret);
 			__skb_queue_purge(&amsdu);
@@ -1445,7 +1436,6 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 	int ret;
 	u8 *fw_desc;
 	int fw_desc_len;
-	u32 attention = 0;
 
 	fw_desc_len = __le16_to_cpu(frag->fw_rx_desc_bytes);
 	fw_desc = (u8 *)frag->fw_msdu_rx_desc;
@@ -1454,7 +1444,7 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 
 	spin_lock_bh(&htt->rx_ring.lock);
 	ret = ath10k_htt_rx_amsdu_pop(htt, &fw_desc, &fw_desc_len,
-				      &amsdu, &attention);
+				      &amsdu);
 	spin_unlock_bh(&htt->rx_ring.lock);
 
 	tasklet_schedule(&htt->rx_replenish_task);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
