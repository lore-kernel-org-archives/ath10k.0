Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x232.google.com ([2a00:1450:4013:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXUG8-000115-C9
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 11:32:09 +0000
Received: by mail-ee0-f50.google.com with SMTP id c13so553100eek.37
 for <ath10k@lists.infradead.org>; Tue, 08 Apr 2014 04:31:08 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: improve htc tx credit debugging prints
Date: Tue,  8 Apr 2014 13:18:40 +0200
Message-Id: <1396955920-25863-1-git-send-email-michal.kazior@tieto.com>
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

This way it's easier to track and debug htc tx
credit issues.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 7f1bccd..d083198 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -157,7 +157,11 @@ int ath10k_htc_send(struct ath10k_htc *htc,
 			goto err_pull;
 		}
 		ep->tx_credits -= credits;
+		ath10k_dbg(ATH10K_DBG_HTC,
+			   "htc ep %d consumed %d credits (total %d)\n",
+			   eid, credits, ep->tx_credits);
 		spin_unlock_bh(&htc->tx_lock);
+
 	}
 
 	ath10k_htc_prepare_tx_skb(ep, skb);
@@ -185,6 +189,9 @@ err_credits:
 	if (ep->tx_credit_flow_enabled) {
 		spin_lock_bh(&htc->tx_lock);
 		ep->tx_credits += credits;
+		ath10k_dbg(ATH10K_DBG_HTC,
+			   "htc ep %d reverted %d credits back (total %d)\n",
+			   eid, credits, ep->tx_credits);
 		spin_unlock_bh(&htc->tx_lock);
 
 		if (ep->ep_ops.ep_tx_credits)
@@ -234,12 +241,12 @@ ath10k_htc_process_credit_report(struct ath10k_htc *htc,
 		if (report->eid >= ATH10K_HTC_EP_COUNT)
 			break;
 
-		ath10k_dbg(ATH10K_DBG_HTC, "ep %d got %d credits\n",
-			   report->eid, report->credits);
-
 		ep = &htc->endpoint[report->eid];
 		ep->tx_credits += report->credits;
 
+		ath10k_dbg(ATH10K_DBG_HTC, "htc ep %d got %d credits (total %d)\n",
+			   report->eid, report->credits, ep->tx_credits);
+
 		if (ep->ep_ops.ep_tx_credits) {
 			spin_unlock_bh(&htc->tx_lock);
 			ep->ep_ops.ep_tx_credits(htc->ar);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
