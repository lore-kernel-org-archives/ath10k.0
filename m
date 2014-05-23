Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wnmpq-0004pI-RR
 for ath10k@lists.infradead.org; Fri, 23 May 2014 10:36:25 +0000
Received: by mail-ee0-f49.google.com with SMTP id e53so3501063eek.36
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 03:35:57 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 1/3] ath10k: relocate core create/destroy functions
Date: Fri, 23 May 2014 12:28:45 +0200
Message-Id: <1400840927-14272-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1400840927-14272-1-git-send-email-michal.kazior@tieto.com>
References: <1400767955-16313-1-git-send-email-michal.kazior@tieto.com>
 <1400840927-14272-1-git-send-email-michal.kazior@tieto.com>
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

This will avoid unnecessary forward declaration of
any kind in the future.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 128 ++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 75b3dfb..bd4d1cc 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -701,70 +701,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	mutex_unlock(&ar->conf_mutex);
 }
 
-struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
-				  const struct ath10k_hif_ops *hif_ops)
-{
-	struct ath10k *ar;
-
-	ar = ath10k_mac_create();
-	if (!ar)
-		return NULL;
-
-	ar->ath_common.priv = ar;
-	ar->ath_common.hw = ar->hw;
-
-	ar->p2p = !!ath10k_p2p;
-	ar->dev = dev;
-
-	ar->hif.priv = hif_priv;
-	ar->hif.ops = hif_ops;
-
-	init_completion(&ar->scan.started);
-	init_completion(&ar->scan.completed);
-	init_completion(&ar->scan.on_channel);
-	init_completion(&ar->target_suspend);
-
-	init_completion(&ar->install_key_done);
-	init_completion(&ar->vdev_setup_done);
-
-	setup_timer(&ar->scan.timeout, ath10k_reset_scan, (unsigned long)ar);
-
-	ar->workqueue = create_singlethread_workqueue("ath10k_wq");
-	if (!ar->workqueue)
-		goto err_wq;
-
-	mutex_init(&ar->conf_mutex);
-	spin_lock_init(&ar->data_lock);
-
-	INIT_LIST_HEAD(&ar->peers);
-	init_waitqueue_head(&ar->peer_mapping_wq);
-
-	init_completion(&ar->offchan_tx_completed);
-	INIT_WORK(&ar->offchan_tx_work, ath10k_offchan_tx_work);
-	skb_queue_head_init(&ar->offchan_tx_queue);
-
-	INIT_WORK(&ar->wmi_mgmt_tx_work, ath10k_mgmt_over_wmi_tx_work);
-	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
-
-	INIT_WORK(&ar->restart_work, ath10k_core_restart);
-
-	return ar;
-
-err_wq:
-	ath10k_mac_destroy(ar);
-	return NULL;
-}
-EXPORT_SYMBOL(ath10k_core_create);
-
-void ath10k_core_destroy(struct ath10k *ar)
-{
-	flush_workqueue(ar->workqueue);
-	destroy_workqueue(ar->workqueue);
-
-	ath10k_mac_destroy(ar);
-}
-EXPORT_SYMBOL(ath10k_core_destroy);
-
 int ath10k_core_start(struct ath10k *ar)
 {
 	int status;
@@ -1058,6 +994,70 @@ void ath10k_core_unregister(struct ath10k *ar)
 }
 EXPORT_SYMBOL(ath10k_core_unregister);
 
+struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
+				  const struct ath10k_hif_ops *hif_ops)
+{
+	struct ath10k *ar;
+
+	ar = ath10k_mac_create();
+	if (!ar)
+		return NULL;
+
+	ar->ath_common.priv = ar;
+	ar->ath_common.hw = ar->hw;
+
+	ar->p2p = !!ath10k_p2p;
+	ar->dev = dev;
+
+	ar->hif.priv = hif_priv;
+	ar->hif.ops = hif_ops;
+
+	init_completion(&ar->scan.started);
+	init_completion(&ar->scan.completed);
+	init_completion(&ar->scan.on_channel);
+	init_completion(&ar->target_suspend);
+
+	init_completion(&ar->install_key_done);
+	init_completion(&ar->vdev_setup_done);
+
+	setup_timer(&ar->scan.timeout, ath10k_reset_scan, (unsigned long)ar);
+
+	ar->workqueue = create_singlethread_workqueue("ath10k_wq");
+	if (!ar->workqueue)
+		goto err_wq;
+
+	mutex_init(&ar->conf_mutex);
+	spin_lock_init(&ar->data_lock);
+
+	INIT_LIST_HEAD(&ar->peers);
+	init_waitqueue_head(&ar->peer_mapping_wq);
+
+	init_completion(&ar->offchan_tx_completed);
+	INIT_WORK(&ar->offchan_tx_work, ath10k_offchan_tx_work);
+	skb_queue_head_init(&ar->offchan_tx_queue);
+
+	INIT_WORK(&ar->wmi_mgmt_tx_work, ath10k_mgmt_over_wmi_tx_work);
+	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
+
+	INIT_WORK(&ar->restart_work, ath10k_core_restart);
+
+	return ar;
+
+err_wq:
+	ath10k_mac_destroy(ar);
+	return NULL;
+}
+EXPORT_SYMBOL(ath10k_core_create);
+
+void ath10k_core_destroy(struct ath10k *ar)
+{
+	flush_workqueue(ar->workqueue);
+	destroy_workqueue(ar->workqueue);
+
+	ath10k_mac_destroy(ar);
+}
+EXPORT_SYMBOL(ath10k_core_destroy);
+
 MODULE_AUTHOR("Qualcomm Atheros");
 MODULE_DESCRIPTION("Core module for QCA988X PCIe devices.");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
