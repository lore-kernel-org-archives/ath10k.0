Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x235.google.com ([2a00:1450:4013:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjqTp-0005xD-Tn
 for ath10k@lists.infradead.org; Fri, 22 Nov 2013 13:09:14 +0000
Received: by mail-ea0-f181.google.com with SMTP id m10so498408eaj.26
 for <ath10k@lists.infradead.org>; Fri, 22 Nov 2013 05:08:46 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 7/8] ath10k: re-add support for early fw indication
Date: Fri, 22 Nov 2013 14:05:17 +0100
Message-Id: <1385125518-13461-8-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
References: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
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

It's possible for FW to panic during early boot or
at driver teardown in some rare cases.

The patch re-introduces support to detect and
print those crashes.

This introduces an additional irq handler that is
set for the duration of early boot and shutdown.
The handler is then overriden with regular
handlers upon hif start().

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 107 ++++++++++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath10k/pci.h |   1 +
 2 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index a9bc290..47d9b6e 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -59,6 +59,8 @@ static int ath10k_pci_init_irq(struct ath10k *ar);
 static int ath10k_pci_deinit_irq(struct ath10k *ar);
 static int ath10k_pci_request_irq(struct ath10k *ar);
 static void ath10k_pci_free_irq(struct ath10k *ar);
+static int ath10k_pci_request_early_irq(struct ath10k *ar);
+static void ath10k_pci_free_early_irq(struct ath10k *ar);
 static int ath10k_pci_bmi_wait(struct ath10k_ce_pipe *tx_pipe,
 			       struct ath10k_ce_pipe *rx_pipe,
 			       struct bmi_xfer *xfer);
@@ -876,6 +878,7 @@ static void ath10k_pci_kill_tasklet(struct ath10k *ar)
 
 	tasklet_kill(&ar_pci->intr_tq);
 	tasklet_kill(&ar_pci->msi_fw_err);
+	tasklet_kill(&ar_pci->early_irq_tasklet);
 
 	for (i = 0; i < CE_COUNT; i++)
 		tasklet_kill(&ar_pci->pipe_info[i].intr);
@@ -1188,12 +1191,15 @@ static int ath10k_pci_post_rx(struct ath10k *ar)
 static int ath10k_pci_hif_start(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	int ret;
+	int ret, ret2;
+
+	ath10k_pci_free_early_irq(ar);
+	ath10k_pci_kill_tasklet(ar);
 
 	ret = ath10k_pci_start_ce(ar);
 	if (ret) {
 		ath10k_warn("failed to start CE: %d\n", ret);
-		return ret;
+		goto err_early_irq;
 	}
 
 	ret = ath10k_pci_request_irq(ar);
@@ -1219,6 +1225,11 @@ err_free_irq:
 	ath10k_pci_kill_tasklet(ar);
 err_stop_ce:
 	ath10k_pci_stop_ce(ar);
+err_early_irq:
+	ret2 = ath10k_pci_request_early_irq(ar);
+	if (ret2)
+		ath10k_warn("failed to re-enable early irq: %d\n", ret2);
+
 	return ret;
 }
 
@@ -1352,6 +1363,10 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 	ath10k_pci_kill_tasklet(ar);
 	ath10k_pci_stop_ce(ar);
 
+	ret = ath10k_pci_request_early_irq(ar);
+	if (ret)
+		ath10k_warn("failed to re-enable early irq: %d\n", ret);
+
 	/* At this point, asynchronous threads are stopped, the target should
 	 * not DMA nor interrupt. We process the leftovers and then free
 	 * everything else up. */
@@ -1900,28 +1915,34 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 		goto err_ce;
 	}
 
+	ret = ath10k_pci_request_early_irq(ar);
+	if (ret) {
+		ath10k_err("failed to request early irq: %d\n", ret);
+		goto err_deinit_irq;
+	}
+
 	ret = ath10k_pci_wait_for_target_init(ar);
 	if (ret) {
 		ath10k_err("failed to wait for target to init: %d\n", ret);
-		goto err_deinit_irq;
+		goto err_free_early_irq;
 	}
 
 	ret = ath10k_ce_enable_err_irq(ar);
 	if (ret) {
 		ath10k_err("failed to enable CE error irq: %d\n", ret);
-		goto err_deinit_irq;
+		goto err_free_early_irq;
 	}
 
 	ret = ath10k_pci_init_config(ar);
 	if (ret) {
 		ath10k_err("failed to setup init config: %d\n", ret);
-		goto err_deinit_irq;
+		goto err_free_early_irq;
 	}
 
 	ret = ath10k_pci_wake_target_cpu(ar);
 	if (ret) {
 		ath10k_err("could not wake up target CPU: %d\n", ret);
-		goto err_deinit_irq;
+		goto err_free_early_irq;
 	}
 
 	if (ar_pci->num_msi_intrs > 1)
@@ -1936,6 +1957,8 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 
 	return 0;
 
+err_free_early_irq:
+	ath10k_pci_free_early_irq(ar);
 err_deinit_irq:
 	ath10k_pci_deinit_irq(ar);
 err_ce:
@@ -1952,6 +1975,9 @@ static void ath10k_pci_hif_power_down(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 
+	ath10k_ce_disable_interrupts(ar);
+	ath10k_pci_free_early_irq(ar);
+	ath10k_pci_kill_tasklet(ar);
 	ath10k_pci_deinit_irq(ar);
 	ath10k_pci_device_reset(ar);
 
@@ -2145,6 +2171,50 @@ static irqreturn_t ath10k_pci_interrupt_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t ath10k_pci_early_irq_handler(int irq, void *arg)
+{
+	struct ath10k *ar = arg;
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+
+	if (!ath10k_pci_irq_pending(ar))
+		return IRQ_NONE;
+
+	if (ar_pci->num_msi_intrs == 0)
+		ath10k_pci_disable_and_clear_legacy_irq(ar);
+
+	tasklet_schedule(&ar_pci->early_irq_tasklet);
+
+	return IRQ_HANDLED;
+}
+
+static void ath10k_pci_early_irq_tasklet(unsigned long data)
+{
+	struct ath10k *ar = (struct ath10k *)data;
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	u32 fw_ind;
+	int ret;
+
+	ret = ath10k_pci_wake(ar);
+	if (ret) {
+		ath10k_warn("failed to wake target in early irq tasklet: %d\n",
+			    ret);
+		return;
+	}
+
+	fw_ind = ath10k_pci_read32(ar, ar_pci->fw_indicator_address);
+	if (fw_ind & FW_IND_EVENT_PENDING) {
+		ath10k_pci_write32(ar, ar_pci->fw_indicator_address,
+				   fw_ind & ~FW_IND_EVENT_PENDING);
+
+		/* Some structures are unavailable during early boot or at
+		 * driver teardown so just print that the device has crashed. */
+		ath10k_warn("device crashed - no diagnostics available\n");
+	}
+
+	ath10k_pci_sleep(ar);
+	ath10k_pci_enable_legacy_irq(ar);
+}
+
 static void ath10k_pci_tasklet(unsigned long data)
 {
 	struct ath10k *ar = (struct ath10k *)data;
@@ -2253,6 +2323,29 @@ static void ath10k_pci_free_irq(struct ath10k *ar)
 		free_irq(ar_pci->pdev->irq + i, ar);
 }
 
+static int ath10k_pci_request_early_irq(struct ath10k *ar)
+{
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	int ret;
+
+	/* Regardless whether MSI-X/MSI/legacy irqs have been set up the first
+	 * interrupt from irq vector is triggered in all cases for FW
+	 * indication/errors */
+	ret = request_irq(ar_pci->pdev->irq, ath10k_pci_early_irq_handler,
+			  IRQF_SHARED, "ath10k_pci (early)", ar);
+	if (ret) {
+		ath10k_warn("failed to request early irq: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ath10k_pci_free_early_irq(struct ath10k *ar)
+{
+	free_irq(ath10k_pci_priv(ar)->pdev->irq, ar);
+}
+
 static void ath10k_pci_init_irq_tasklets(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
@@ -2261,6 +2354,8 @@ static void ath10k_pci_init_irq_tasklets(struct ath10k *ar)
 	tasklet_init(&ar_pci->intr_tq, ath10k_pci_tasklet, (unsigned long)ar);
 	tasklet_init(&ar_pci->msi_fw_err, ath10k_msi_err_tasklet,
 		     (unsigned long)ar);
+	tasklet_init(&ar_pci->early_irq_tasklet, ath10k_pci_early_irq_tasklet,
+		     (unsigned long)ar);
 
 	for (i = 0; i < CE_COUNT; i++) {
 		ar_pci->pipe_info[i].ar_pci = ar_pci;
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 73a3d4e..a4f3203 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -198,6 +198,7 @@ struct ath10k_pci {
 
 	struct tasklet_struct intr_tq;
 	struct tasklet_struct msi_fw_err;
+	struct tasklet_struct early_irq_tasklet;
 
 	int started;
 
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
