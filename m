Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g83ND-0003Db-BL
 for ath10k@lists.infradead.org; Thu, 04 Oct 2018 13:09:23 +0000
From: Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH] ath10k: Add support for WCN3990 firmware crash recovery
Date: Thu,  4 Oct 2018 18:38:32 +0530
Message-Id: <1538658512-31867-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, linux-wireless@vger.kernel.org, Surabhi Vishnoi <svishnoi@codeaurora.org>

From: Surabhi Vishnoi <svishnoi@codeaurora.org>

Whenever the WCN3990 firmware becomes unavailable,
the host driver receives a FW down indication, post
which all the direct hardware register access should
be avoided, in order to prevent improper behavior in
the host driver.

Set the crash_flush flag when the host driver receives
a FW_DOWN_IND via qmi, in order to stop the untimely
hardware register access. Also handle the case, where
we need to do core register only for the first FW_READY
indication, which is when we initialize the host driver.
All the subsequent FW_READY indication will be received
in subsystem recovery case and we only need to do the
restart work. The state of driver is maintained using
flags to distinguish between first and subsequent FW_READY
indication received.

Tested HW: WCN3990
Tested FW: WLAN.HL.2.0-01188-QCAHLSWMTPLZ-1

Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c |  3 +++
 drivers/net/wireless/ath/ath10k/core.h |  1 +
 drivers/net/wireless/ath/ath10k/snoc.c | 39 +++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.h |  7 ++++++
 4 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9aa72da..9d0b351 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2184,6 +2184,8 @@ static void ath10k_core_restart(struct work_struct *work)
 	if (ret)
 		ath10k_warn(ar, "failed to send firmware crash dump via devcoredump: %d",
 			    ret);
+
+	complete(&ar->driver_recovery);
 }
 
 static void ath10k_core_set_coverage_class_work(struct work_struct *work)
@@ -3047,6 +3049,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
 	init_completion(&ar->target_suspend);
+	init_completion(&ar->driver_recovery);
 	init_completion(&ar->wow.wakeup_completed);
 
 	init_completion(&ar->install_key_done);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index f66b46b..1376fc5 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -962,6 +962,7 @@ struct ath10k {
 	} hif;
 
 	struct completion target_suspend;
+	struct completion driver_recovery;
 
 	const struct ath10k_hw_regs *regs;
 	const struct ath10k_hw_ce_regs *hw_ce_regs;
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index bdffc4e..178840a 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -918,7 +918,9 @@ static void ath10k_snoc_buffer_cleanup(struct ath10k *ar)
 
 static void ath10k_snoc_hif_stop(struct ath10k *ar)
 {
-	ath10k_snoc_irq_disable(ar);
+	if (!test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags))
+		ath10k_snoc_irq_disable(ar);
+
 	napi_synchronize(&ar->napi);
 	napi_disable(&ar->napi);
 	ath10k_snoc_buffer_cleanup(ar);
@@ -927,10 +929,14 @@ static void ath10k_snoc_hif_stop(struct ath10k *ar)
 
 static int ath10k_snoc_hif_start(struct ath10k *ar)
 {
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
+
 	napi_enable(&ar->napi);
 	ath10k_snoc_irq_enable(ar);
 	ath10k_snoc_rx_post(ar);
 
+	clear_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags);
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif start\n");
 
 	return 0;
@@ -994,7 +1000,8 @@ static int ath10k_snoc_wlan_enable(struct ath10k *ar)
 
 static void ath10k_snoc_wlan_disable(struct ath10k *ar)
 {
-	ath10k_qmi_wlan_disable(ar);
+	if (!test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags))
+		ath10k_qmi_wlan_disable(ar);
 }
 
 static void ath10k_snoc_hif_power_down(struct ath10k *ar)
@@ -1091,6 +1098,11 @@ static int ath10k_snoc_napi_poll(struct napi_struct *ctx, int budget)
 	struct ath10k *ar = container_of(ctx, struct ath10k, napi);
 	int done = 0;
 
+	if (test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags)) {
+		napi_complete(ctx);
+		return done;
+	}
+
 	ath10k_ce_per_engine_service_any(ar);
 	done = ath10k_htt_txrx_compl_task(ar, budget);
 
@@ -1187,17 +1199,29 @@ int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
 	struct ath10k_bus_params bus_params;
 	int ret;
 
+	if (test_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags))
+		return 0;
+
 	bus_params.chip_id = ar_snoc->target_info.soc_version;
 
 	switch (type) {
 	case ATH10K_QMI_EVENT_FW_READY_IND:
+		if (test_bit(ATH10K_SNOC_FLAG_REGISTERED, &ar_snoc->flags)) {
+			queue_work(ar->workqueue, &ar->restart_work);
+			break;
+		}
+
 		ret = ath10k_core_register(ar, &bus_params);
 		if (ret) {
-			ath10k_err(ar, "failed to register driver core: %d\n",
+			ath10k_err(ar, "Failed to register driver core: %d\n",
 				   ret);
+			return ret;
 		}
+		set_bit(ATH10K_SNOC_FLAG_REGISTERED, &ar_snoc->flags);
 		break;
 	case ATH10K_QMI_EVENT_FW_DOWN_IND:
+		set_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags);
+		set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 		break;
 	default:
 		ath10k_err(ar, "invalid fw indication: %llx\n", type);
@@ -1631,8 +1655,17 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 static int ath10k_snoc_remove(struct platform_device *pdev)
 {
 	struct ath10k *ar = platform_get_drvdata(pdev);
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc remove\n");
+
+	reinit_completion(&ar->driver_recovery);
+
+	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
+		wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
+
+	set_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
+
 	ath10k_core_unregister(ar);
 	ath10k_hw_power_off(ar);
 	ath10k_snoc_free_irq(ar);
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index e1d2d66..3a44e30 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -70,6 +70,12 @@ struct ath10k_wcn3990_clk_info {
 	bool required;
 };
 
+enum ath10k_snoc_flags {
+	ATH10K_SNOC_FLAG_REGISTERED,
+	ATH10K_SNOC_FLAG_UNREGISTERING,
+	ATH10K_SNOC_FLAG_RECOVERY,
+};
+
 struct ath10k_snoc {
 	struct platform_device *dev;
 	struct ath10k *ar;
@@ -84,6 +90,7 @@ struct ath10k_snoc {
 	struct ath10k_wcn3990_vreg_info *vreg;
 	struct ath10k_wcn3990_clk_info *clk;
 	struct ath10k_qmi *qmi;
+	unsigned long int flags;
 };
 
 static inline struct ath10k_snoc *ath10k_snoc_priv(struct ath10k *ar)
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
