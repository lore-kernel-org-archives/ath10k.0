Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCdiB-0006gL-To
 for ath10k@lists.infradead.org; Fri, 02 Dec 2016 02:36:32 +0000
From: greearb@candelatech.com
Subject: [PATCH 2/2] ath10k:  work-around for stale txq in ar->txqs
Date: Thu,  1 Dec 2016 18:30:00 -0800
Message-Id: <1480645800-2148-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1480645800-2148-1-git-send-email-greearb@candelatech.com>
References: <1480645800-2148-1-git-send-email-greearb@candelatech.com>
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
To: linux-wireless@vger.kernel.org
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

Due to reasons I do not fully understand, when ath10k firmware
crashes when trying to bring up lots of vdevs, the ar->txqs
may still have references to the txq struct when mac80211 re-adds
the network devices.

The device add logic was re-initializing the list members, but
if they were already in the ar->txqs, then that meant the list
was broken and trying to walk the list would end up in an infinite
loop.

So, check for this particular isue, and remove the reference from
ar->txqs before re-initializing the list-head.  There must be
a cleaner way to do this, but I am not sure exactly what that would
be.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 48 ++++++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath10k/wmi.c |  9 +++++++
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 784cf2b..2f50915 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4190,13 +4190,37 @@ void ath10k_mgmt_over_wmi_tx_work(struct work_struct *work)
 	}
 }
 
-static void ath10k_mac_txq_init(struct ieee80211_txq *txq)
+static void ath10k_mac_txq_init(struct ath10k *ar, struct ieee80211_txq *txq)
 {
 	struct ath10k_txq *artxq = (void *)txq->drv_priv;
+	struct ath10k_txq *tmp, *walker;
+	struct ieee80211_txq *txq_tmp;
+	int i = 0;
 
 	if (!txq)
 		return;
 
+	spin_lock_bh(&ar->txqs_lock);
+
+	/* Remove from ar->txqs in case it still exists there. */
+	list_for_each_entry_safe(walker, tmp, &ar->txqs, list) {
+		txq_tmp = container_of((void *)walker, struct ieee80211_txq,
+				       drv_priv);
+		if ((++i % 10000) == 0) {
+			ath10k_err(ar, "txq-init: Checking txq_tmp: %p i: %d\n", txq_tmp, i);
+			ath10k_err(ar, "txq-init: txqs: %p walker->list: %p w->next: %p  w->prev: %p ar->txqs: %p\n",
+				   &ar->txqs, &(walker->list), walker->list.next, walker->list.prev, &ar->txqs);
+		}
+
+		if (txq_tmp == txq) {
+			WARN_ON_ONCE(1);
+			ath10k_err(ar, "txq-init: Found txq when it should be deleted, txq_tmp: %p  txq: %p\n",
+				   txq_tmp, txq);
+			list_del(&walker->list);
+		}
+	}
+	spin_unlock_bh(&ar->txqs_lock);
+
 	INIT_LIST_HEAD(&artxq->list);
 }
 
@@ -4208,6 +4232,7 @@ static void ath10k_mac_txq_unref(struct ath10k *ar, struct ieee80211_txq *txq)
 	struct sk_buff *msdu;
 	struct ieee80211_txq *txq_tmp;
 	int msdu_id;
+	int i = 0;
 
 	if (!txq)
 		return;
@@ -4220,8 +4245,18 @@ static void ath10k_mac_txq_unref(struct ath10k *ar, struct ieee80211_txq *txq)
 	list_for_each_entry_safe(walker, tmp, &ar->txqs, list) {
 		txq_tmp = container_of((void *)walker, struct ieee80211_txq,
 				       drv_priv);
-		if (txq_tmp == txq)
+		if ((++i % 10000) == 0) {
+			ath10k_err(ar, "Checking txq_tmp: %p i: %d\n", txq_tmp, i);
+			ath10k_err(ar, "txqs: %p walker->list: %p w->next: %p  w->prev: %p ar->txqs: %p\n",
+				   &ar->txqs, &(walker->list), walker->list.next, walker->list.prev, &ar->txqs);
+		}
+
+		if (txq_tmp == txq) {
+			WARN_ON_ONCE(1);
+			ath10k_err(ar, "Found txq when it should be deleted, txq_tmp: %p  txq: %p\n",
+				   txq_tmp, txq);
 			list_del(&walker->list);
+		}
 	}
 	spin_unlock_bh(&ar->txqs_lock);
 
@@ -5255,7 +5290,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 	mutex_lock(&ar->conf_mutex);
 
 	memset(arvif, 0, sizeof(*arvif));
-	ath10k_mac_txq_init(vif->txq);
+	ath10k_mac_txq_init(ar, vif->txq);
 
 	memset(&arvif->bcast_rate, WMI_FIXED_RATE_NONE, sizeof(arvif->bcast_rate));
 	memset(&arvif->mcast_rate, WMI_FIXED_RATE_NONE, sizeof(arvif->mcast_rate));
@@ -5620,8 +5655,9 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 		kfree(arvif->u.ap.noa_data);
 	}
 
-	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev %i delete (remove interface)\n",
-		   arvif->vdev_id);
+	ath10k_dbg(ar, ATH10K_DBG_MAC,
+		   "mac vdev %i delete (remove interface), vif: %p  arvif: %p\n",
+		   arvif->vdev_id, vif, arvif);
 
 	ret = ath10k_wmi_vdev_delete(ar, arvif->vdev_id);
 	if (ret)
@@ -6437,7 +6473,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		INIT_WORK(&arsta->update_wk, ath10k_sta_rc_update_wk);
 
 		for (i = 0; i < ARRAY_SIZE(sta->txq); i++)
-			ath10k_mac_txq_init(sta->txq[i]);
+			ath10k_mac_txq_init(ar, sta->txq[i]);
 	}
 
 	/* cancel must be done outside the mutex to avoid deadlock */
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index fd685c4..1c8ceb2 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1771,6 +1771,15 @@ static void ath10k_wmi_tx_beacon_nowait(struct ath10k_vif *arvif)
 	bool deliver_cab;
 	int ret;
 
+	/* I saw a kasan warning here, looks like arvif and/or ar might have been
+	 * NULL, add something to catch this if it happens again.
+	 */
+	if ((((unsigned long)(arvif)) < 8000) || (((unsigned long)(ar)) < 8000)) {
+		pr_err("tx-beacon-nowait:  arvif: %p  ar: %p\n", arvif, ar);
+		BUG_ON(((unsigned long)(arvif)) < 8000);
+		BUG_ON(((unsigned long)(ar)) < 8000);
+	}
+
 	spin_lock_bh(&ar->data_lock);
 
 	bcn = arvif->beacon;
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
