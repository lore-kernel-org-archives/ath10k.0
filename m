Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aU6x4-0004Cp-Op
 for ath10k@lists.infradead.org; Fri, 12 Feb 2016 06:11:35 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: reduce rx_lock contention for htt rx indication
Date: Fri, 12 Feb 2016 11:40:58 +0530
Message-ID: <1455257459-13343-1-git-send-email-rmanohar@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Received frame indications are queued into a skb list and latest
processed by txrx tasklet. This skb queue is protected by htt rx lock.
Since the entire rx processing till delivering frame to mac80211 and
replenish tasks are processed under rx_lock protection, there might be
some delay in queuing newly received rx frame into that list on
multicore systems. Optimize this by using skb list lock while accessing
rx completion queue instead of htt rx lock.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index cc957a6..bedd8c3 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2011,9 +2011,7 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_RX_IND:
-		spin_lock_bh(&htt->rx_ring.lock);
-		__skb_queue_tail(&htt->rx_compl_q, skb);
-		spin_unlock_bh(&htt->rx_ring.lock);
+		skb_queue_tail(&htt->rx_compl_q, skb);
 		tasklet_schedule(&htt->txrx_compl_task);
 		return;
 	case HTT_T2H_MSG_TYPE_PEER_MAP: {
@@ -2111,9 +2109,7 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 		break;
 	}
 	case HTT_T2H_MSG_TYPE_RX_IN_ORD_PADDR_IND: {
-		spin_lock_bh(&htt->rx_ring.lock);
-		__skb_queue_tail(&htt->rx_in_ord_compl_q, skb);
-		spin_unlock_bh(&htt->rx_ring.lock);
+		skb_queue_tail(&htt->rx_in_ord_compl_q, skb);
 		tasklet_schedule(&htt->txrx_compl_task);
 		return;
 	}
@@ -2174,16 +2170,18 @@ static void ath10k_htt_txrx_compl_task(unsigned long ptr)
 		dev_kfree_skb_any(skb);
 	}
 
-	spin_lock_bh(&htt->rx_ring.lock);
-	while ((skb = __skb_dequeue(&htt->rx_compl_q))) {
+	while ((skb = skb_dequeue(&htt->rx_compl_q))) {
 		resp = (struct htt_resp *)skb->data;
+		spin_lock_bh(&htt->rx_ring.lock);
 		ath10k_htt_rx_handler(htt, &resp->rx_ind);
+		spin_unlock_bh(&htt->rx_ring.lock);
 		dev_kfree_skb_any(skb);
 	}
 
-	while ((skb = __skb_dequeue(&htt->rx_in_ord_compl_q))) {
+	while ((skb = skb_dequeue(&htt->rx_in_ord_compl_q))) {
+		spin_lock_bh(&htt->rx_ring.lock);
 		ath10k_htt_rx_in_ord_ind(ar, skb);
+		spin_unlock_bh(&htt->rx_ring.lock);
 		dev_kfree_skb_any(skb);
 	}
-	spin_unlock_bh(&htt->rx_ring.lock);
 }
-- 
2.7.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
