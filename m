Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiKsl-0003fg-6u
 for ath10k@lists.infradead.org; Tue, 22 Mar 2016 11:53:56 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 4/9] ath10k: cleanup amsdu processing for rx indication
Date: Tue, 22 Mar 2016 17:22:14 +0530
Message-ID: <1458647539-17213-5-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1458647539-17213-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1458647539-17213-1-git-send-email-rmanohar@qti.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, rmanohar@codeaurora.org

Make amsdu handlers (i.e amsdu_pop and rx_h_handler) common to both
rx_ind and frag_ind htt events. It is sufficient to hold rx_ring lock
for amsdu_pop alone and no need to hold it until the packets are
delivered to mac80211. This helps to reduce rx_lock contention as well.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 100 +++++++++++++------------------
 1 file changed, 41 insertions(+), 59 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index abb712f..3fdbfee 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1528,20 +1528,49 @@ static void ath10k_htt_rx_h_filter(struct ath10k *ar,
 	__skb_queue_purge(amsdu);
 }
 
+static int ath10k_htt_rx_handle_amsdu(struct ath10k_htt *htt)
+{
+	struct ath10k *ar = htt->ar;
+	static struct ieee80211_rx_status rx_status;
+	struct sk_buff_head amsdu;
+	int ret;
+
+	__skb_queue_head_init(&amsdu);
+
+	spin_lock_bh(&htt->rx_ring.lock);
+	if (htt->rx_confused) {
+		spin_unlock_bh(&htt->rx_ring.lock);
+		return -EIO;
+	}
+	ret = ath10k_htt_rx_amsdu_pop(htt, &amsdu);
+	spin_unlock_bh(&htt->rx_ring.lock);
+
+	if (ret < 0) {
+		ath10k_warn(ar, "rx ring became corrupted: %d\n", ret);
+		__skb_queue_purge(&amsdu);
+		/* FIXME: It's probably a good idea to reboot the
+		 * device instead of leaving it inoperable.
+		 */
+		htt->rx_confused = true;
+		return ret;
+	}
+
+	ath10k_htt_rx_h_ppdu(ar, &amsdu, &rx_status, 0xffff);
+	ath10k_htt_rx_h_unchain(ar, &amsdu, ret > 0);
+	ath10k_htt_rx_h_filter(ar, &amsdu, &rx_status);
+	ath10k_htt_rx_h_mpdu(ar, &amsdu, &rx_status);
+	ath10k_htt_rx_h_deliver(ar, &amsdu, &rx_status);
+
+	return 0;
+}
+
 static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 				  struct htt_rx_indication *rx)
 {
 	struct ath10k *ar = htt->ar;
-	struct ieee80211_rx_status *rx_status = &htt->rx_status;
 	struct htt_rx_indication_mpdu_range *mpdu_ranges;
-	struct sk_buff_head amsdu;
 	int num_mpdu_ranges;
-	int i, ret, mpdu_count = 0;
-
-	lockdep_assert_held(&htt->rx_ring.lock);
-
-	if (htt->rx_confused)
-		return;
+	int i, mpdu_count = 0;
 
 	num_mpdu_ranges = MS(__le32_to_cpu(rx->hdr.info1),
 			     HTT_RX_INDICATION_INFO1_NUM_MPDU_RANGES);
@@ -1556,63 +1585,18 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 		mpdu_count += mpdu_ranges[i].mpdu_count;
 
 	while (mpdu_count--) {
-		__skb_queue_head_init(&amsdu);
-		ret = ath10k_htt_rx_amsdu_pop(htt, &amsdu);
-		if (ret < 0) {
-			ath10k_warn(ar, "rx ring became corrupted: %d\n", ret);
-			__skb_queue_purge(&amsdu);
-			/* FIXME: It's probably a good idea to reboot the
-			 * device instead of leaving it inoperable.
-			 */
-			htt->rx_confused = true;
+		if (ath10k_htt_rx_handle_amsdu(htt) < 0)
 			break;
-		}
-
-		ath10k_htt_rx_h_ppdu(ar, &amsdu, rx_status, 0xffff);
-		ath10k_htt_rx_h_unchain(ar, &amsdu, ret > 0);
-		ath10k_htt_rx_h_filter(ar, &amsdu, rx_status);
-		ath10k_htt_rx_h_mpdu(ar, &amsdu, rx_status);
-		ath10k_htt_rx_h_deliver(ar, &amsdu, rx_status);
 	}
 
 	tasklet_schedule(&htt->rx_replenish_task);
 }
 
-static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
-				       struct htt_rx_fragment_indication *frag)
+static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt)
 {
-	struct ath10k *ar = htt->ar;
-	struct ieee80211_rx_status *rx_status = &htt->rx_status;
-	struct sk_buff_head amsdu;
-	int ret;
-
-	__skb_queue_head_init(&amsdu);
-
-	spin_lock_bh(&htt->rx_ring.lock);
-	ret = ath10k_htt_rx_amsdu_pop(htt, &amsdu);
-	spin_unlock_bh(&htt->rx_ring.lock);
+	ath10k_htt_rx_handle_amsdu(htt);
 
 	tasklet_schedule(&htt->rx_replenish_task);
-
-	ath10k_dbg(ar, ATH10K_DBG_HTT_DUMP, "htt rx frag ahead\n");
-
-	if (ret) {
-		ath10k_warn(ar, "failed to pop amsdu from httr rx ring for fragmented rx %d\n",
-			    ret);
-		__skb_queue_purge(&amsdu);
-		return;
-	}
-
-	if (skb_queue_len(&amsdu) != 1) {
-		ath10k_warn(ar, "failed to pop frag amsdu: too many msdus\n");
-		__skb_queue_purge(&amsdu);
-		return;
-	}
-
-	ath10k_htt_rx_h_ppdu(ar, &amsdu, rx_status, 0xffff);
-	ath10k_htt_rx_h_filter(ar, &amsdu, rx_status);
-	ath10k_htt_rx_h_mpdu(ar, &amsdu, rx_status);
-	ath10k_htt_rx_h_deliver(ar, &amsdu, rx_status);
 }
 
 static void ath10k_htt_rx_tx_compl_ind(struct ath10k *ar,
@@ -2331,7 +2315,7 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 	case HTT_T2H_MSG_TYPE_RX_FRAG_IND: {
 		ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL, "htt event: ",
 				skb->data, skb->len);
-		ath10k_htt_rx_frag_handler(htt, &resp->rx_frag_ind);
+		ath10k_htt_rx_frag_handler(htt);
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_TEST:
@@ -2473,9 +2457,7 @@ static void ath10k_htt_txrx_compl_task(unsigned long ptr)
 
 	while ((skb = __skb_dequeue(&rx_q))) {
 		resp = (struct htt_resp *)skb->data;
-		spin_lock_bh(&htt->rx_ring.lock);
 		ath10k_htt_rx_handler(htt, &resp->rx_ind);
-		spin_unlock_bh(&htt->rx_ring.lock);
 		dev_kfree_skb_any(skb);
 	}
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
