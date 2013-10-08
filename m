Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh02.mail.saunalahti.fi ([62.142.5.108])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTcI3-0001tY-2e
 for ath10k@lists.infradead.org; Tue, 08 Oct 2013 18:45:52 +0000
Subject: [PATCH] ath10k: fix ath10k_debug_start() locking
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 08 Oct 2013 21:45:25 +0300
Message-ID: <20131008184525.32604.64051.stgit@localhost6.localdomain6>
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
Cc: linux-wireless@vger.kernel.org

ath10k_debug_start() was not called with conf_mutex, fix that. Also there was a
deadlock in ath10k_debug_stop(), rename it to ath10k_debug_destroy() and call
it only when the device is destroyed.

Reported-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c  |   12 ++++++++++++
 drivers/net/wireless/ath/ath10k/debug.c |   15 ++++++++++++++-
 drivers/net/wireless/ath/ath10k/debug.h |    5 +++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5acb404..e016f51 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -737,6 +737,8 @@ EXPORT_SYMBOL(ath10k_core_create);
 
 void ath10k_core_destroy(struct ath10k *ar)
 {
+	ath10k_debug_destroy(ar);
+
 	flush_workqueue(ar->workqueue);
 	destroy_workqueue(ar->workqueue);
 
@@ -748,6 +750,8 @@ int ath10k_core_start(struct ath10k *ar)
 {
 	int status;
 
+	lockdep_assert_held(&ar->conf_mutex);
+
 	ath10k_bmi_start(ar);
 
 	if (ath10k_init_configure_target(ar)) {
@@ -836,6 +840,8 @@ EXPORT_SYMBOL(ath10k_core_start);
 
 void ath10k_core_stop(struct ath10k *ar)
 {
+	lockdep_assert_held(&ar->conf_mutex);
+
 	ath10k_debug_stop(ar);
 	ath10k_htc_stop(&ar->htc);
 	ath10k_htt_detach(&ar->htt);
@@ -883,15 +889,21 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		return ret;
 	}
 
+	mutex_lock(&ar->conf_mutex);
+
 	ret = ath10k_core_start(ar);
 	if (ret) {
 		ath10k_err("could not init core (%d)\n", ret);
 		ath10k_core_free_firmware_files(ar);
 		ath10k_hif_power_down(ar);
+		mutex_unlock(&ar->conf_mutex);
 		return ret;
 	}
 
 	ath10k_core_stop(ar);
+
+	mutex_unlock(&ar->conf_mutex);
+
 	ath10k_hif_power_down(ar);
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 59615c7..760ff22 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -618,6 +618,8 @@ int ath10k_debug_start(struct ath10k *ar)
 {
 	int ret;
 
+	lockdep_assert_held(&ar->conf_mutex);
+
 	ret = ath10k_debug_htt_stats_req(ar);
 	if (ret)
 		/* continue normally anyway, this isn't serious */
@@ -628,7 +630,13 @@ int ath10k_debug_start(struct ath10k *ar)
 
 void ath10k_debug_stop(struct ath10k *ar)
 {
-	cancel_delayed_work_sync(&ar->debug.htt_stats_dwork);
+	lockdep_assert_held(&ar->conf_mutex);
+
+	/* Must not use _sync to avoid deadlock, we do that in
+	 * ath10k_debug_destroy(). The check for htt_stats_mask is to avoid
+	 * warning from del_timer(). */
+	if (ar->debug.htt_stats_mask != 0)
+		cancel_delayed_work(&ar->debug.htt_stats_dwork);
 }
 
 int ath10k_debug_create(struct ath10k *ar)
@@ -662,6 +670,11 @@ int ath10k_debug_create(struct ath10k *ar)
 	return 0;
 }
 
+void ath10k_debug_destroy(struct ath10k *ar)
+{
+	cancel_delayed_work_sync(&ar->debug.htt_stats_dwork);
+}
+
 #endif /* CONFIG_ATH10K_DEBUGFS */
 
 #ifdef CONFIG_ATH10K_DEBUG
diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index fa58148..46e640a 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -46,6 +46,7 @@ extern __printf(1, 2) int ath10k_warn(const char *fmt, ...);
 int ath10k_debug_start(struct ath10k *ar);
 void ath10k_debug_stop(struct ath10k *ar);
 int ath10k_debug_create(struct ath10k *ar);
+void ath10k_debug_destroy(struct ath10k *ar);
 void ath10k_debug_read_service_map(struct ath10k *ar,
 				   void *service_map,
 				   size_t map_size);
@@ -67,6 +68,10 @@ static inline int ath10k_debug_create(struct ath10k *ar)
 	return 0;
 }
 
+static inline void ath10k_debug_destroy(struct ath10k *ar)
+{
+}
+
 static inline void ath10k_debug_read_service_map(struct ath10k *ar,
 						 void *service_map,
 						 size_t map_size)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
