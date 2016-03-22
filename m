Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiKsJ-0003bH-OA
 for ath10k@lists.infradead.org; Tue, 22 Mar 2016 11:53:28 +0000
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: [PATCH 2/9] ath10k: copy tx fetch indication message
Date: Tue, 22 Mar 2016 17:22:12 +0530
Message-ID: <1458647539-17213-3-git-send-email-rmanohar@qti.qualcomm.com>
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

To optmize CPU usage htt rx descriptors will be reused instead of
refilling it for htt rx copy engine (CE5). To support that all htt rx
indications should be proecssed at same context. Instead of queueing
actual indication message, queue copied message for txrx processing.

Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 855ff4a..b888e3a 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2449,10 +2449,17 @@ void ath10k_htt_t2h_msg_handler(struct ath10k *ar, struct sk_buff *skb)
 	}
 	case HTT_T2H_MSG_TYPE_AGGR_CONF:
 		break;
-	case HTT_T2H_MSG_TYPE_TX_FETCH_IND:
-		skb_queue_tail(&htt->tx_fetch_ind_q, skb);
+	case HTT_T2H_MSG_TYPE_TX_FETCH_IND: {
+		struct sk_buff *tx_fetch_ind = skb_copy(skb, GFP_ATOMIC);
+
+		if (!tx_fetch_ind) {
+			ath10k_warn(ar, "failed to copy htt tx fetch ind\n");
+			break;
+		}
+		skb_queue_tail(&htt->tx_fetch_ind_q, tx_fetch_ind);
 		tasklet_schedule(&htt->txrx_compl_task);
-		return;
+		break;
+	}
 	case HTT_T2H_MSG_TYPE_TX_FETCH_CONFIRM:
 		ath10k_htt_rx_tx_fetch_confirm(ar, skb);
 		break;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
