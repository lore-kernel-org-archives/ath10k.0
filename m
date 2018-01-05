Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-f67.google.com ([209.85.214.67])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXPd4-0001fL-1z
 for ath10k@lists.infradead.org; Fri, 05 Jan 2018 10:53:40 +0000
Received: by mail-it0-f67.google.com with SMTP id m11so4230181iti.1
 for <ath10k@lists.infradead.org>; Fri, 05 Jan 2018 02:53:26 -0800 (PST)
Date: Fri, 5 Jan 2018 18:53:20 +0800
From: Louie Lu <git@louie.lu>
Subject: [PATCH] ath10k: Add independent prio sta queue
Message-ID: <20180105105317.GA17563@nems_nctu_lu>
MIME-Version: 1.0
Content-Disposition: inline
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
To: ath10k@lists.infradead.org, make-wifi-fast@lists.bufferbloat.net

Hi all,

this is not a formal submit of the patch, I'm trying to learn
how ath10k driver work with mac80211, and hope to get some feedback
to see if I'm getting correct or not.

The target of this patch is to let a selectable station to be the first
priority to send when it use `wake_tx_queue`. There is an independent `txqs_prio_sta`
for this stations' queue. And it can use pram `prio_sta_aid` to setting which
station you want to make it more piror to others.

For what currently I understanding, is mac80211 will use `drv_wake_tx_queue`
to call drvier to send the per-sta per-tid queue's data. `ar` is the driver
instance, `artxq` is `txq` in driver, when artxq-list is empty, it will
add to `ar->txqs` to prepare for transmit. And driver will take out this
round which txq to send inside `ar->txqs` by list_first_entry, remove
it from `ar->txqs`. 

Then the while-loop will start to push that queu (f_txq) onto driver, `max` is
for maximum time this queue can send. Under `ath10k_mac_tx_push_txq` will
then dequeue an skb in the txq and pass it to htt_tx.

Using what I understand now, I using aid to select which txq will be
priority and sent out first. But when I testing this code with iperf,
it is not working as I think. 2 station both sending -b 400M -t 0 packet,
(maximum about 250M)I  exepct the station I setup in param will take all the
bandwidth, but the result is 120M/120M, where did I get wrong?

Thanks,
Louie.

---
 drivers/net/wireless/ath/ath10k/core.c |  7 +++++++
 drivers/net/wireless/ath/ath10k/core.h |  2 ++
 drivers/net/wireless/ath/ath10k/mac.c  | 38 ++++++++++++++++++++++++++++------
 3 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 51444d34a06c..f7a4cc1396a7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -35,6 +35,8 @@
 #include "coredump.h"
 
 unsigned int ath10k_debug_mask;
+unsigned int ath10k_wake_tx_queue_max = 16;
+unsigned int ath10k_prio_sta_aid = 0;
 static unsigned int ath10k_cryptmode_param;
 static bool uart_print;
 static bool skip_otp;
@@ -47,6 +49,8 @@ unsigned long ath10k_coredump_mask = 0x3;
 
 /* FIXME: most of these should be readonly */
 module_param_named(debug_mask, ath10k_debug_mask, uint, 0644);
+module_param_named(wake_tx_queue_max, ath10k_wake_tx_queue_max, uint, 0644);
+module_param_named(prio_sta_aid, ath10k_prio_sta_aid, uint, 0644);
 module_param_named(cryptmode, ath10k_cryptmode_param, uint, 0644);
 module_param(uart_print, bool, 0644);
 module_param(skip_otp, bool, 0644);
@@ -54,6 +58,7 @@ module_param(rawmode, bool, 0644);
 module_param_named(coredump_mask, ath10k_coredump_mask, ulong, 0444);
 
 MODULE_PARM_DESC(debug_mask, "Debugging mask");
+MODULE_PARM_DESC(wake_tx_queue_max, "Max time for wake_tx_queue send txq");
 MODULE_PARM_DESC(uart_print, "Uart target debugging");
 MODULE_PARM_DESC(skip_otp, "Skip otp failure for calibration in testmode");
 MODULE_PARM_DESC(cryptmode, "Crypto mode: 0-hardware, 1-software");
@@ -2732,6 +2737,8 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	spin_lock_init(&ar->txqs_lock);
 
 	INIT_LIST_HEAD(&ar->txqs);
+	INIT_LIST_HEAD(&ar->txqs_prio_sta);
+	ar->is_txqs_prio_sta = 0;
 	INIT_LIST_HEAD(&ar->peers);
 	init_waitqueue_head(&ar->peer_mapping_wq);
 	init_waitqueue_head(&ar->htt.empty_tx_wq);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index fe6b30356d3b..0c8e39adb022 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -907,6 +907,8 @@ struct ath10k {
 	spinlock_t txqs_lock;
 
 	struct list_head txqs;
+	struct list_head txqs_prio_sta;
+	int is_txqs_prio_sta;
 	struct list_head arvifs;
 	struct list_head peers;
 	struct ath10k_peer *peer_map[ATH10K_MAX_NUM_PEER_IDS];
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ebb3f1b046f3..38cd364d4ca0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -33,6 +33,10 @@
 #include "wmi-ops.h"
 #include "wow.h"
 
+
+extern unsigned int ath10k_wake_tx_queue_max;
+extern unsigned int ath10k_prio_sta_aid;
+
 /*********/
 /* Rates */
 /*********/
@@ -4260,23 +4264,45 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	struct ieee80211_txq *f_txq;
 	struct ath10k_txq *f_artxq;
 	int ret = 0;
-	int max = 16;
+	unsigned  max = 16;
+	int txqs_prio_sta = 0;
+	int txq_sta_aid = txq->sta ? txq->sta->aid : -1;
+
+	/* Claim there is an prio station txq */
+	if (txq_sta_aid == ath10k_prio_sta_aid)
+		ar->is_txqs_prio_sta = 1;
 
 	spin_lock_bh(&ar->txqs_lock);
-	if (list_empty(&artxq->list))
-		list_add_tail(&artxq->list, &ar->txqs);
+	max = ath10k_wake_tx_queue_max;
+	ar->is_txqs_prio_sta = 0;
+	if (list_empty(&artxq->list)) {
+		if (txq_sta_aid == ath10k_prio_sta_aid) {
+			list_add_tail(&artxq->list, &ar->txqs_prio_sta);
+		} else {
+			list_add_tail(&artxq->list, &ar->txqs);
+		}
+	}
 
-	f_artxq = list_first_entry(&ar->txqs, struct ath10k_txq, list);
+	txqs_prio_sta = !list_empty(&ar->txqs_prio_sta);
+	f_artxq = list_first_entry(txqs_prio_sta ? &ar->txqs_prio_sta : &ar->txqs, struct ath10k_txq, list);
 	f_txq = container_of((void *)f_artxq, struct ieee80211_txq, drv_priv);
 	list_del_init(&f_artxq->list);
 
+	ret = 0;
+	txq_sta_aid = f_txq->sta ? f_txq->sta->aid : -1;
+	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac wake aid:%d ac:%d tid:%d\n",
+		txq_sta_aid, f_txq->ac, f_txq->tid);
 	while (ath10k_mac_tx_can_push(hw, f_txq) && max--) {
+		if (ar->is_txqs_prio_sta == 1 && txq_sta_aid != ath10k_prio_sta_aid)
+			break;
 		ret = ath10k_mac_tx_push_txq(hw, f_txq);
 		if (ret)
 			break;
 	}
-	if (ret != -ENOENT)
-		list_add_tail(&f_artxq->list, &ar->txqs);
+
+	if (ret != -ENOENT && ret) {
+		list_add_tail(&f_artxq->list, txqs_prio_sta ? &ar->txqs_prio_sta : &ar->txqs);
+	}
 	spin_unlock_bh(&ar->txqs_lock);
 
 	ath10k_htt_tx_txq_update(hw, f_txq);
-- 
2.15.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
