Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agUYU-0003Nt-HC
 for ath10k@lists.infradead.org; Thu, 17 Mar 2016 09:49:24 +0000
Received: by mail-lb0-x22f.google.com with SMTP id oe12so64914117lbc.0
 for <ath10k@lists.infradead.org>; Thu, 17 Mar 2016 02:49:02 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: fix pull-push tx threshold handling
Date: Thu, 17 Mar 2016 10:51:05 +0100
Message-Id: <1458208265-16715-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1458208265-16715-1-git-send-email-michal.kazior@tieto.com>
References: <1458208265-16715-1-git-send-email-michal.kazior@tieto.com>
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

This prevents tx hangs or hiccups if pull-push
supporting firmware defines per-txq thresholds or
switches modes dynamically.

Fixes: 299468782d94 ("ath10k: implement wake_tx_queue")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 74dd010a9188..4d51b92e67e0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3772,7 +3772,8 @@ void ath10k_mac_tx_push_pending(struct ath10k *ar)
 
 		/* Prevent aggressive sta/tid taking over tx queue */
 		max = 16;
-		while (max--) {
+		ret = 0;
+		while (ath10k_mac_tx_can_push(hw, txq) && max--) {
 			ret = ath10k_mac_tx_push_txq(hw, txq);
 			if (ret < 0)
 				break;
@@ -4015,14 +4016,13 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	struct ath10k *ar = hw->priv;
 	struct ath10k_txq *artxq = (void *)txq->drv_priv;
 
-	if (ath10k_mac_tx_can_push(hw, txq)) {
-		spin_lock_bh(&ar->txqs_lock);
-		if (list_empty(&artxq->list))
-			list_add_tail(&artxq->list, &ar->txqs);
-		spin_unlock_bh(&ar->txqs_lock);
+	spin_lock_bh(&ar->txqs_lock);
+	if (list_empty(&artxq->list))
+		list_add_tail(&artxq->list, &ar->txqs);
+	spin_unlock_bh(&ar->txqs_lock);
 
+	if (ath10k_mac_tx_can_push(hw, txq))
 		tasklet_schedule(&ar->htt.txrx_compl_task);
-	}
 
 	ath10k_htt_tx_txq_update(hw, txq);
 }
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
