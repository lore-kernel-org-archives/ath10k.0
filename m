Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkGyW-00088R-87
 for ath10k@lists.infradead.org; Tue, 22 Aug 2017 21:44:42 +0000
From: <ryanhsu@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix napi_poll budget overflow
Date: Tue, 22 Aug 2017 14:44:02 -0700
Message-ID: <1503438242-5657-1-git-send-email-ryanhsu@qti.qualcomm.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@qti.qualcomm.com

From: Ryan Hsu <ryanhsu@qti.qualcomm.com>

In napi_poll, the budget number is used to control the amount of packets
we should handle per poll to balance the resource in the system.

In the list of the amsdu packets reception, we check if there is budget
count left and handle the complete list of the packets, that it will have
chances the very last list will over the budget leftover.

So adding one more parameter - budget_left, this would help while
traversing the list to avoid handling more than the budget given.

Reported-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Fix-suggested-by: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>

Signed-off-by: Ryan Hsu <ryanhsu@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 0b4c156..95a5a18 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1718,7 +1718,8 @@ static void ath10k_htt_rx_delba(struct ath10k *ar, struct htt_resp *resp)
 }
 
 static int ath10k_htt_rx_extract_amsdu(struct sk_buff_head *list,
-				       struct sk_buff_head *amsdu)
+				       struct sk_buff_head *amsdu,
+				       int budget_left)
 {
 	struct sk_buff *msdu;
 	struct htt_rx_desc *rxd;
@@ -1729,8 +1730,9 @@ static int ath10k_htt_rx_extract_amsdu(struct sk_buff_head *list,
 	if (WARN_ON(!skb_queue_empty(amsdu)))
 		return -EINVAL;
 
-	while ((msdu = __skb_dequeue(list))) {
+	while ((msdu = __skb_dequeue(list)) && budget_left) {
 		__skb_queue_tail(amsdu, msdu);
+		budget_left--;
 
 		rxd = (void *)msdu->data - sizeof(*rxd);
 		if (rxd->msdu_end.common.info0 &
@@ -1821,7 +1823,8 @@ static int ath10k_htt_rx_h_rx_offload(struct ath10k *ar,
 	return num_msdu;
 }
 
-static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
+static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb,
+				    int budget_left)
 {
 	struct ath10k_htt *htt = &ar->htt;
 	struct htt_resp *resp = (void *)skb->data;
@@ -1878,9 +1881,9 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 	if (offload)
 		num_msdus = ath10k_htt_rx_h_rx_offload(ar, &list);
 
-	while (!skb_queue_empty(&list)) {
+	while (!skb_queue_empty(&list) && budget_left) {
 		__skb_queue_head_init(&amsdu);
-		ret = ath10k_htt_rx_extract_amsdu(&list, &amsdu);
+		ret = ath10k_htt_rx_extract_amsdu(&list, &amsdu, budget_left);
 		switch (ret) {
 		case 0:
 			/* Note: The in-order indication may report interleaved
@@ -1890,6 +1893,7 @@ static int ath10k_htt_rx_in_ord_ind(struct ath10k *ar, struct sk_buff *skb)
 			 * should still give an idea about rx rate to the user.
 			 */
 			num_msdus += skb_queue_len(&amsdu);
+			budget_left -= skb_queue_len(&amsdu);
 			ath10k_htt_rx_h_ppdu(ar, &amsdu, status, vdev_id);
 			ath10k_htt_rx_h_filter(ar, &amsdu, status);
 			ath10k_htt_rx_h_mpdu(ar, &amsdu, status);
@@ -2400,7 +2404,8 @@ int ath10k_htt_txrx_compl_task(struct ath10k *ar, int budget)
 		}
 
 		spin_lock_bh(&htt->rx_ring.lock);
-		num_rx_msdus = ath10k_htt_rx_in_ord_ind(ar, skb);
+		num_rx_msdus = ath10k_htt_rx_in_ord_ind(ar, skb,
+							(budget - quota));
 		spin_unlock_bh(&htt->rx_ring.lock);
 		if (num_rx_msdus < 0) {
 			resched_napi = true;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
