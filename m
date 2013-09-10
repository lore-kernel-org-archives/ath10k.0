Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJOKu-0005XU-DD
 for ath10k@lists.infradead.org; Tue, 10 Sep 2013 13:50:34 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/7] ath10k: add HTC TX credits replenishing notification
Date: Tue, 10 Sep 2013 15:49:58 +0200
Message-ID: <1378821003-22925-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
References: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
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

This will allow higher layers to anticipate and
act upon TX credits renewal. This will be
important for some future rework of WMI command
submission.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |    9 +++++++++
 drivers/net/wireless/ath/ath10k/htc.h |    1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 65c6e0c..030748e 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -150,6 +150,9 @@ err:
 	ep->tx_credits += credits;
 	spin_unlock_bh(&htc->tx_lock);
 
+	if (ep->ep_ops.ep_tx_credits)
+		ep->ep_ops.ep_tx_credits(htc->ar);
+
 	/* this is the simplest way to handle out-of-resources for non-credit
 	 * based endpoints. credit based endpoints can still get -ENOSR, but
 	 * this is highly unlikely as credit reservation should prevent that */
@@ -303,6 +306,12 @@ ath10k_htc_process_credit_report(struct ath10k_htc *htc,
 		ep = &htc->endpoint[report->eid];
 		ep->tx_credits += report->credits;
 
+		if (ep->ep_ops.ep_tx_credits) {
+			spin_unlock_bh(&htc->tx_lock);
+			ep->ep_ops.ep_tx_credits(htc->ar);
+			spin_lock_bh(&htc->tx_lock);
+		}
+
 		if (ep->tx_credits && !skb_queue_empty(&ep->tx_queue))
 			queue_work(htc->ar->workqueue, &ep->send_work);
 	}
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index e1dd8c7..92ca29b 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -276,6 +276,7 @@ struct ath10k_htc_ops {
 struct ath10k_htc_ep_ops {
 	void (*ep_tx_complete)(struct ath10k *, struct sk_buff *);
 	void (*ep_rx_complete)(struct ath10k *, struct sk_buff *);
+	void (*ep_tx_credits)(struct ath10k *);
 };
 
 /* service connection information */
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
