Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22a.google.com ([2a00:1450:4013:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIvLT-0003FN-ME
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 07:25:32 +0000
Received: by mail-ea0-f170.google.com with SMTP id g15so1538085eak.15
 for <ath10k@lists.infradead.org>; Wed, 26 Feb 2014 23:25:05 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v3 6/8] ath10k: reduce htt tx/rx spinlock overhead
Date: Thu, 27 Feb 2014 08:19:45 +0100
Message-Id: <1393485587-16879-7-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1393485587-16879-1-git-send-email-michal.kazior@tieto.com>
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1393485587-16879-1-git-send-email-michal.kazior@tieto.com>
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

It is inefficient to grab irqsave spinlocks for
skb lists for each queue/dequeue action.

Using rx_ring.lock and tx_lock allows to use less
heavy bh spinlock functions and moving locking
upwards allows to toggle spinlocks less often.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 24 +++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/htt_tx.c |  5 ++---
 drivers/net/wireless/ath/ath10k/txrx.c   |  4 ++--
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 1141f6c..1cb88bf 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -274,7 +274,7 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
 	int idx;
 	struct sk_buff *msdu;
 
-	spin_lock_bh(&htt->rx_ring.lock);
+	lockdep_assert_held(&htt->rx_ring.lock);
 
 	if (ath10k_htt_rx_ring_elems(htt) == 0)
 		ath10k_warn("htt rx ring is empty!\n");
@@ -287,7 +287,6 @@ static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt *htt)
 	htt->rx_ring.sw_rd_idx.msdu_payld = idx;
 	htt->rx_ring.fill_cnt--;
 
-	spin_unlock_bh(&htt->rx_ring.lock);
 	return msdu;
 }
 
@@ -311,6 +310,8 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 	struct sk_buff *msdu;
 	struct htt_rx_desc *rx_desc;
 
+	lockdep_assert_held(&htt->rx_ring.lock);
+
 	if (ath10k_htt_rx_ring_elems(htt) == 0)
 		ath10k_warn("htt rx ring is empty!\n");
 
@@ -904,6 +905,8 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 	u8 *fw_desc;
 	int i, j;
 
+	lockdep_assert_held(&htt->rx_ring.lock);
+
 	memset(&info, 0, sizeof(info));
 
 	fw_desc_len = __le16_to_cpu(rx->prefix.fw_rx_desc_bytes);
@@ -1040,8 +1043,11 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 
 	msdu_head = NULL;
 	msdu_tail = NULL;
+
+	spin_lock_bh(&htt->rx_ring.lock);
 	msdu_chaining = ath10k_htt_rx_amsdu_pop(htt, &fw_desc, &fw_desc_len,
 						&msdu_head, &msdu_tail);
+	spin_unlock_bh(&htt->rx_ring.lock);
 
 	ath10k_dbg(ATH10K_DBG_HTT_DUMP, "htt rx frag ahead\n");
 
@@ -1143,6 +1149,8 @@ static void ath10k_htt_rx_frm_tx_compl(struct ath10k *ar,
 	__le16 msdu_id;
 	int i;
 
+	lockdep_assert_held(&htt->tx_lock);
+
 	switch (status) {
 	case HTT_DATA_TX_STATUS_NO_ACK:
 		tx_done.no_ack = true;
@@ -1189,7 +1197,9 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_RX_IND:
-		skb_queue_tail(&htt->rx_compl_q, skb);
+		spin_lock_bh(&htt->rx_ring.lock);
+		__skb_queue_tail(&htt->rx_compl_q, skb);
+		spin_unlock_bh(&htt->rx_ring.lock);
 		tasklet_schedule(&htt->txrx_compl_task);
 		return;
 	case HTT_T2H_MSG_TYPE_PEER_MAP: {
@@ -1283,14 +1293,18 @@ void ath10k_htt_txrx_compl_task(unsigned long ptr)
 	struct htt_resp *resp;
 	struct sk_buff *skb;
 
-	while ((skb = skb_dequeue(&htt->tx_compl_q))) {
+	spin_lock_bh(&htt->tx_lock);
+	while ((skb = __skb_dequeue(&htt->tx_compl_q))) {
 		ath10k_htt_rx_frm_tx_compl(htt->ar, skb);
 		dev_kfree_skb_any(skb);
 	}
+	spin_unlock_bh(&htt->tx_lock);
 
-	while ((skb = skb_dequeue(&htt->rx_compl_q))) {
+	spin_lock_bh(&htt->rx_ring.lock);
+	while ((skb = __skb_dequeue(&htt->rx_compl_q))) {
 		resp = (struct htt_resp *)skb->data;
 		ath10k_htt_rx_handler(htt, &resp->rx_ind);
 		dev_kfree_skb_any(skb);
 	}
+	spin_unlock_bh(&htt->rx_ring.lock);
 }
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 20b7a44..7a3e2e4 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -125,9 +125,7 @@ static void ath10k_htt_tx_cleanup_pending(struct ath10k_htt *htt)
 	struct htt_tx_done tx_done = {0};
 	int msdu_id;
 
-	/* No locks needed. Called after communication with the device has
-	 * been stopped. */
-
+	spin_lock_bh(&htt->tx_lock);
 	for (msdu_id = 0; msdu_id < htt->max_num_pending_tx; msdu_id++) {
 		if (!test_bit(msdu_id, htt->used_msdu_ids))
 			continue;
@@ -140,6 +138,7 @@ static void ath10k_htt_tx_cleanup_pending(struct ath10k_htt *htt)
 
 		ath10k_txrx_tx_unref(htt, &tx_done);
 	}
+	spin_unlock_bh(&htt->tx_lock);
 }
 
 void ath10k_htt_tx_detach(struct ath10k_htt *htt)
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 2993ca7..0541dd9 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -52,6 +52,8 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 	struct ath10k_skb_cb *skb_cb;
 	struct sk_buff *msdu;
 
+	lockdep_assert_held(&htt->tx_lock);
+
 	ath10k_dbg(ATH10K_DBG_HTT, "htt tx completion msdu_id %u discard %d no_ack %d\n",
 		   tx_done->msdu_id, !!tx_done->discard, !!tx_done->no_ack);
 
@@ -91,13 +93,11 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 	/* we do not own the msdu anymore */
 
 exit:
-	spin_lock_bh(&htt->tx_lock);
 	htt->pending_tx[tx_done->msdu_id] = NULL;
 	ath10k_htt_tx_free_msdu_id(htt, tx_done->msdu_id);
 	__ath10k_htt_tx_dec_pending(htt);
 	if (htt->num_pending_tx == 0)
 		wake_up(&htt->empty_tx_wq);
-	spin_unlock_bh(&htt->tx_lock);
 }
 
 static const u8 rx_legacy_rate_idx[] = {
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
