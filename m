Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKSJY-0003sJ-7E
 for ath10k@lists.infradead.org; Fri, 13 Sep 2013 12:17:36 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCHv2 1/7] ath10k: simplify HTC credits calculation
Date: Fri, 13 Sep 2013 14:16:52 +0200
Message-ID: <1379074618-30534-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1379074618-30534-1-git-send-email-michal.kazior@tieto.com>
References: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
 <1379074618-30534-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Credit calculation was overly complex
unnecessarily. Now skb dequeing is more unified.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
v2:
 * use DIV_ROUND_UP

 drivers/net/wireless/ath/ath10k/htc.c |   58 ++++++---------------------------
 1 file changed, 10 insertions(+), 48 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index f03fd8d..1da0f82 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -167,49 +167,6 @@ err:
 	return ret;
 }
 
-static struct sk_buff *ath10k_htc_get_skb_credit_based(struct ath10k_htc *htc,
-						       struct ath10k_htc_ep *ep,
-						       u8 *credits)
-{
-	struct sk_buff *skb;
-	struct ath10k_skb_cb *skb_cb;
-	int credits_required;
-	int remainder;
-	unsigned int transfer_len;
-
-	lockdep_assert_held(&htc->tx_lock);
-
-	skb = __skb_dequeue(&ep->tx_queue);
-	if (!skb)
-		return NULL;
-
-	skb_cb = ATH10K_SKB_CB(skb);
-	transfer_len = skb->len;
-
-	if (likely(transfer_len <= htc->target_credit_size)) {
-		credits_required = 1;
-	} else {
-		/* figure out how many credits this message requires */
-		credits_required = transfer_len / htc->target_credit_size;
-		remainder = transfer_len % htc->target_credit_size;
-
-		if (remainder)
-			credits_required++;
-	}
-
-	ath10k_dbg(ATH10K_DBG_HTC, "Credits required %d got %d\n",
-		   credits_required, ep->tx_credits);
-
-	if (ep->tx_credits < credits_required) {
-		__skb_queue_head(&ep->tx_queue, skb);
-		return NULL;
-	}
-
-	ep->tx_credits -= credits_required;
-	*credits = credits_required;
-	return skb;
-}
-
 static void ath10k_htc_send_work(struct work_struct *work)
 {
 	struct ath10k_htc_ep *ep = container_of(work,
@@ -224,11 +181,16 @@ static void ath10k_htc_send_work(struct work_struct *work)
 			ath10k_htc_send_complete_check(ep, 0);
 
 		spin_lock_bh(&htc->tx_lock);
-		if (ep->tx_credit_flow_enabled)
-			skb = ath10k_htc_get_skb_credit_based(htc, ep,
-							      &credits);
-		else
-			skb = __skb_dequeue(&ep->tx_queue);
+		skb = __skb_dequeue(&ep->tx_queue);
+
+		if (ep->tx_credit_flow_enabled) {
+			credits = DIV_ROUND_UP(skb->len,
+					       htc->target_credit_size);
+			if (ep->tx_credits < credits) {
+				__skb_queue_head(&ep->tx_queue, skb);
+				skb = NULL;
+			}
+		}
 		spin_unlock_bh(&htc->tx_lock);
 
 		if (!skb)
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
