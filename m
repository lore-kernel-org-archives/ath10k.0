Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22c.google.com ([2a00:1450:4013:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wik8x-0000zF-HF
 for ath10k@lists.infradead.org; Fri, 09 May 2014 12:43:16 +0000
Received: by mail-ee0-f44.google.com with SMTP id c41so2606301eek.17
 for <ath10k@lists.infradead.org>; Fri, 09 May 2014 05:42:53 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/7] ath10k: introduce core restart symbol
Date: Fri,  9 May 2014 14:35:52 +0200
Message-Id: <1399638957-20449-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
References: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
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

This makes it easier to have an extra preparation
code before restart work is scheduled.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 10 ++++++++--
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/pci.c  |  2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7034c72..acc22cc 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -672,7 +672,7 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 	return 0;
 }
 
-static void ath10k_core_restart(struct work_struct *work)
+static void ath10k_core_restart_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 
@@ -704,6 +704,12 @@ static void ath10k_core_restart(struct work_struct *work)
 	mutex_unlock(&ar->conf_mutex);
 }
 
+void ath10k_core_restart(struct ath10k *ar)
+{
+	queue_work(ar->workqueue, &ar->restart_work);
+}
+EXPORT_SYMBOL(ath10k_core_restart);
+
 struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
 				  const struct ath10k_hif_ops *hif_ops)
 {
@@ -749,7 +755,7 @@ struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
 	INIT_WORK(&ar->wmi_mgmt_tx_work, ath10k_mgmt_over_wmi_tx_work);
 	skb_queue_head_init(&ar->wmi_mgmt_tx_queue);
 
-	INIT_WORK(&ar->restart_work, ath10k_core_restart);
+	INIT_WORK(&ar->restart_work, ath10k_core_restart_work);
 
 	return ar;
 
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 2c1dfd7..170094d 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -494,5 +494,6 @@ int ath10k_wait_for_suspend(struct ath10k *ar, u32 suspend_opt);
 void ath10k_core_stop(struct ath10k *ar);
 int ath10k_core_register(struct ath10k *ar, u32 chip_id);
 void ath10k_core_unregister(struct ath10k *ar);
+void ath10k_core_restart(struct ath10k *ar);
 
 #endif /* _CORE_H_ */
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 438d3cf..7be5784 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1788,7 +1788,7 @@ static void ath10k_pci_fw_interrupt_handler(struct ath10k *ar)
 
 		if (ar_pci->started) {
 			ath10k_pci_hif_dump_area(ar);
-			queue_work(ar->workqueue, &ar->restart_work);
+			ath10k_core_restart(ar);
 		} else {
 			/*
 			 * Probable Target failure before we're prepared
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
