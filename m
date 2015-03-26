Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yb5uZ-0006vA-NO
 for ath10k@lists.infradead.org; Thu, 26 Mar 2015 11:25:21 +0000
Received: by labto5 with SMTP id to5so42922496lab.0
 for <ath10k@lists.infradead.org>; Thu, 26 Mar 2015 04:24:56 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: replenish htc tx credits always
Date: Thu, 26 Mar 2015 11:22:23 +0000
Message-Id: <1427368943-29526-1-git-send-email-michal.kazior@tieto.com>
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

There's always at most 2 credits and it makes
little sense to set the
ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE flag
conditionally.

This seems to fix some random issues with tx
credit starvation on WLAN.RM.2.0-00073 I've been
seeing. Note: this isn't related to wmi mgmt tx.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index d33d5c4397f6..0eab8a2ffefe 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -86,21 +86,6 @@ static void ath10k_htc_notify_tx_completion(struct ath10k_htc_ep *ep,
 	ep->ep_ops.ep_tx_complete(ep->htc->ar, skb);
 }
 
-/* assumes tx_lock is held */
-static bool ath10k_htc_ep_need_credit_update(struct ath10k_htc_ep *ep)
-{
-	struct ath10k *ar = ep->htc->ar;
-
-	if (!ep->tx_credit_flow_enabled)
-		return false;
-	if (ep->tx_credits >= ep->tx_credits_per_max_message)
-		return false;
-
-	ath10k_dbg(ar, ATH10K_DBG_HTC, "HTC: endpoint %d needs credit update\n",
-		   ep->eid);
-	return true;
-}
-
 static void ath10k_htc_prepare_tx_skb(struct ath10k_htc_ep *ep,
 				      struct sk_buff *skb)
 {
@@ -111,13 +96,10 @@ static void ath10k_htc_prepare_tx_skb(struct ath10k_htc_ep *ep,
 	hdr->eid = ep->eid;
 	hdr->len = __cpu_to_le16(skb->len - sizeof(*hdr));
 	hdr->flags = 0;
+	hdr->flags |= ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE;
 
 	spin_lock_bh(&ep->htc->tx_lock);
 	hdr->seq_no = ep->seq_no++;
-
-	if (ath10k_htc_ep_need_credit_update(ep))
-		hdr->flags |= ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE;
-
 	spin_unlock_bh(&ep->htc->tx_lock);
 }
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
