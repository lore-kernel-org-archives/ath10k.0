Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aU6xH-0004EJ-LK
 for ath10k@lists.infradead.org; Fri, 12 Feb 2016 06:11:48 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: process htt rx indication as batch mode
Date: Fri, 12 Feb 2016 11:40:59 +0530
Message-ID: <1455257459-13343-2-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1455257459-13343-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1455257459-13343-1-git-send-email-rmanohar@qti.qualcomm.com>
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

On multicore systems, it is possible that txrx tasket can run
in parallel with pci tasklet (i.e smp affinity of ath10k irq is
assigned to multiple CPUs). Feeding and consuming from the same
rx completion list leads to txrx tasklet runs for longer period.
Prevent this by processing a snapshot of rx queue by moving list
into temporary list. Consecutive received frames will be processed
in next batch.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index bedd8c3..61d9507 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2155,22 +2155,34 @@ static void ath10k_htt_txrx_compl_task(unsigned long ptr)
 	struct ath10k_htt *htt = (struct ath10k_htt *)ptr;
 	struct ath10k *ar = htt->ar;
 	struct sk_buff_head tx_q;
+	struct sk_buff_head rx_q;
+	struct sk_buff_head rx_ind_q;
 	struct htt_resp *resp;
 	struct sk_buff *skb;
 	unsigned long flags;
 
 	__skb_queue_head_init(&tx_q);
+	__skb_queue_head_init(&rx_q);
+	__skb_queue_head_init(&rx_ind_q);
 
 	spin_lock_irqsave(&htt->tx_compl_q.lock, flags);
 	skb_queue_splice_init(&htt->tx_compl_q, &tx_q);
 	spin_unlock_irqrestore(&htt->tx_compl_q.lock, flags);
 
+	spin_lock_irqsave(&htt->rx_compl_q.lock, flags);
+	skb_queue_splice_init(&htt->rx_compl_q, &rx_q);
+	spin_unlock_irqrestore(&htt->rx_compl_q.lock, flags);
+
+	spin_lock_irqsave(&htt->rx_in_ord_compl_q.lock, flags);
+	skb_queue_splice_init(&htt->rx_in_ord_compl_q, &rx_ind_q);
+	spin_unlock_irqrestore(&htt->rx_in_ord_compl_q.lock, flags);
+
 	while ((skb = __skb_dequeue(&tx_q))) {
 		ath10k_htt_rx_frm_tx_compl(htt->ar, skb);
 		dev_kfree_skb_any(skb);
 	}
 
-	while ((skb = skb_dequeue(&htt->rx_compl_q))) {
+	while ((skb = __skb_dequeue(&rx_q))) {
 		resp = (struct htt_resp *)skb->data;
 		spin_lock_bh(&htt->rx_ring.lock);
 		ath10k_htt_rx_handler(htt, &resp->rx_ind);
@@ -2178,7 +2190,7 @@ static void ath10k_htt_txrx_compl_task(unsigned long ptr)
 		dev_kfree_skb_any(skb);
 	}
 
-	while ((skb = skb_dequeue(&htt->rx_in_ord_compl_q))) {
+	while ((skb = __skb_dequeue(&rx_ind_q))) {
 		spin_lock_bh(&htt->rx_ring.lock);
 		ath10k_htt_rx_in_ord_ind(ar, skb);
 		spin_unlock_bh(&htt->rx_ring.lock);
-- 
2.7.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
