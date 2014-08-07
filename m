Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJme-0002oj-2u
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:14:52 +0000
Received: by mail-we0-f170.google.com with SMTP id w62so3826279wes.29
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:14:30 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 4/5] ath10k: remove ar_pci->started
Date: Thu,  7 Aug 2014 11:05:07 +0200
Message-Id: <1407402308-29899-5-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
References: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
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

There are basically no more uses for
ar_pci->started. It is also perfectly safe to call
hif_stop without hif_start.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/hif.h |  3 +--
 drivers/net/wireless/ath/ath10k/pci.c | 30 ++++++++----------------------
 drivers/net/wireless/ath/ath10k/pci.h |  2 --
 3 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hif.h b/drivers/net/wireless/ath/ath10k/hif.h
index 2ac7bea..bd97f4a 100644
--- a/drivers/net/wireless/ath/ath10k/hif.h
+++ b/drivers/net/wireless/ath/ath10k/hif.h
@@ -83,8 +83,7 @@ struct ath10k_hif_ops {
 	/* Power up the device and enter BMI transfer mode for FW download */
 	int (*power_up)(struct ath10k *ar);
 
-	/* Power down the device and free up resources. stop() must be called
-	 * before this if start() was called earlier */
+	/* Power down the device and free up resources. */
 	void (*power_down)(struct ath10k *ar);
 
 	int (*suspend)(struct ath10k *ar);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 8244658..4131cc7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1053,7 +1053,6 @@ static void ath10k_pci_hif_get_default_pipe(struct ath10k *ar,
 
 static int ath10k_pci_hif_start(struct ath10k *ar)
 {
-	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int ret;
 
 	ath10k_dbg(ATH10K_DBG_BOOT, "boot hif start\n");
@@ -1066,7 +1065,6 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 	}
 
 	ath10k_ce_enable_interrupts(ar);
-	ar_pci->started = 1;
 
 	return 0;
 }
@@ -1162,29 +1160,17 @@ static void ath10k_pci_ce_deinit(struct ath10k *ar)
 		ath10k_ce_deinit_pipe(ar, i);
 }
 
-static void ath10k_pci_hif_stop(struct ath10k *ar)
+static void ath10k_pci_flush(struct ath10k *ar)
 {
-	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	int ret;
-
-	ath10k_dbg(ATH10K_DBG_BOOT, "boot hif stop\n");
-
-	if (WARN_ON(!ar_pci->started))
-		return;
-
-	ret = ath10k_ce_disable_interrupts(ar);
-	if (ret)
-		ath10k_warn("failed to disable CE interrupts: %d\n", ret);
-
+	ath10k_ce_disable_interrupts(ar);
 	ath10k_pci_kill_tasklet(ar);
-
-	/* At this point, asynchronous threads are stopped, the target should
-	 * not DMA nor interrupt. We process the leftovers and then free
-	 * everything else up. */
-
 	ath10k_pci_buffer_cleanup(ar);
+}
 
-	ar_pci->started = 0;
+static void ath10k_pci_hif_stop(struct ath10k *ar)
+{
+	ath10k_dbg(ATH10K_DBG_BOOT, "boot hif stop\n");
+	ath10k_pci_flush(ar);
 }
 
 static int ath10k_pci_hif_exchange_bmi_msg(struct ath10k *ar,
@@ -1892,7 +1878,7 @@ static void ath10k_pci_hif_power_down(struct ath10k *ar)
 {
 	ath10k_dbg(ATH10K_DBG_BOOT, "boot hif power down\n");
 
-	ath10k_pci_kill_tasklet(ar);
+	ath10k_pci_flush(ar);
 	ath10k_pci_warm_reset(ar);
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 68fcb4f..899e5db 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -171,8 +171,6 @@ struct ath10k_pci {
 	struct tasklet_struct msi_fw_err;
 	struct tasklet_struct early_irq_tasklet;
 
-	int started;
-
 	struct ath10k_pci_pipe pipe_info[CE_COUNT_MAX];
 
 	struct ath10k_hif_cb msg_callbacks_current;
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
