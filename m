Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x232.google.com ([2a00:1450:4013:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbUDT-0000D8-BU
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 11:45:44 +0000
Received: by mail-ee0-f50.google.com with SMTP id l10so564761eei.37
 for <ath10k@lists.infradead.org>; Wed, 30 Oct 2013 04:45:17 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH/RFT 08/12] ath10k: use ath10k_do_pci_wake/sleep
Date: Wed, 30 Oct 2013 12:42:22 +0100
Message-Id: <1383133346-8135-9-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

This removes some remaining direct use of the wake
register which could interfere with power state
tracking of the target device. This will allow
initialization code reordering.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 84 +++++++++++------------------------
 1 file changed, 26 insertions(+), 58 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5a1ac9e..ffc63cc 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -52,7 +52,7 @@ static int ath10k_pci_post_rx_pipe(struct ath10k_pci_pipe *pipe_info,
 					     int num);
 static void ath10k_pci_rx_pipe_cleanup(struct ath10k_pci_pipe *pipe_info);
 static void ath10k_pci_stop_ce(struct ath10k *ar);
-static void ath10k_pci_device_reset(struct ath10k *ar);
+static int ath10k_pci_device_reset(struct ath10k *ar);
 static int ath10k_pci_wait_for_target_init(struct ath10k *ar);
 static int ath10k_pci_start_intr(struct ath10k *ar);
 static void ath10k_pci_stop_intr(struct ath10k *ar);
@@ -526,21 +526,6 @@ static bool ath10k_pci_target_is_awake(struct ath10k *ar)
 	return (RTC_STATE_V_GET(val) == RTC_STATE_V_ON);
 }
 
-static int ath10k_pci_wait(struct ath10k *ar)
-{
-	int n = 100;
-
-	while (n-- && !ath10k_pci_target_is_awake(ar))
-		msleep(10);
-
-	if (n < 0) {
-		ath10k_warn("Unable to wakeup target\n");
-		return -ETIMEDOUT;
-	}
-
-	return 0;
-}
-
 int ath10k_do_pci_wake(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
@@ -1855,7 +1840,11 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 	 * is in an unexpected state. We try to catch that here in order to
 	 * reset the Target and retry the probe.
 	 */
-	ath10k_pci_device_reset(ar);
+	ret = ath10k_pci_device_reset(ar);
+	if (ret) {
+		ath10k_err("failed to reset target (%d)\n", ret);
+		goto err_irq;
+	}
 
 	ret = ath10k_pci_wait_for_target_init(ar);
 	if (ret)
@@ -2156,19 +2145,10 @@ static int ath10k_pci_start_intr_legacy(struct ath10k *ar)
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Make sure to wake the Target before enabling Legacy
-	 * Interrupt.
-	 */
-	iowrite32(PCIE_SOC_WAKE_V_MASK,
-		  ar_pci->mem + PCIE_LOCAL_BASE_ADDRESS +
-		  PCIE_SOC_WAKE_ADDRESS);
-
-	ret = ath10k_pci_wait(ar);
+	ret = ath10k_do_pci_wake(ar);
 	if (ret) {
-		ath10k_warn("Failed to enable legacy interrupt, target did not wake up: %d\n",
-			    ret);
 		free_irq(ar_pci->pdev->irq, ar);
+		ath10k_err("target didn't wake up (%d)\n", ret);
 		return ret;
 	}
 
@@ -2184,10 +2164,8 @@ static int ath10k_pci_start_intr_legacy(struct ath10k *ar)
 		  PCIE_INTR_CE_MASK_ALL,
 		  ar_pci->mem + (SOC_CORE_BASE_ADDRESS |
 				 PCIE_INTR_ENABLE_ADDRESS));
-	iowrite32(PCIE_SOC_WAKE_RESET,
-		  ar_pci->mem + PCIE_LOCAL_BASE_ADDRESS +
-		  PCIE_SOC_WAKE_ADDRESS);
 
+	ath10k_do_pci_sleep(ar);
 	ath10k_info("legacy interrupt handling\n");
 	return 0;
 }
@@ -2263,15 +2241,9 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 	int wait_limit = 300; /* 3 sec */
 	int ret;
 
-	/* Wait for Target to finish initialization before we proceed. */
-	iowrite32(PCIE_SOC_WAKE_V_MASK,
-		  ar_pci->mem + PCIE_LOCAL_BASE_ADDRESS +
-		  PCIE_SOC_WAKE_ADDRESS);
-
-	ret = ath10k_pci_wait(ar);
+	ret = ath10k_do_pci_wake(ar);
 	if (ret) {
-		ath10k_warn("Failed to reset target, target did not wake up: %d\n",
-			    ret);
+		ath10k_err("target didn't wake up (%d)\n", ret);
 		return ret;
 	}
 
@@ -2288,31 +2260,26 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 	}
 
 	if (wait_limit < 0) {
-		ath10k_err("Target stalled\n");
-		iowrite32(PCIE_SOC_WAKE_RESET,
-			  ar_pci->mem + PCIE_LOCAL_BASE_ADDRESS +
-			  PCIE_SOC_WAKE_ADDRESS);
-		return -EIO;
+		ath10k_err("target stalled\n");
+		ret = -EIO;
+		goto out;
 	}
 
-	iowrite32(PCIE_SOC_WAKE_RESET,
-		  ar_pci->mem + PCIE_LOCAL_BASE_ADDRESS +
-		  PCIE_SOC_WAKE_ADDRESS);
-
-	return 0;
+out:
+	ath10k_do_pci_sleep(ar);
+	return ret;
 }
 
-static void ath10k_pci_device_reset(struct ath10k *ar)
+static int ath10k_pci_device_reset(struct ath10k *ar)
 {
-	int i;
+	int i, ret;
 	u32 val;
 
-	ath10k_pci_reg_write32(ar, PCIE_SOC_WAKE_ADDRESS,
-			       PCIE_SOC_WAKE_V_MASK);
-	for (i = 0; i < ATH_PCI_RESET_WAIT_MAX; i++) {
-		if (ath10k_pci_target_is_awake(ar))
-			break;
-		msleep(1);
+	ret = ath10k_do_pci_wake(ar);
+	if (ret) {
+		ath10k_err("failed to reset target - couldn't wake target (%d)\n",
+			   ret);
+		return ret;
 	}
 
 	/* Put Target, including PCIe, into RESET. */
@@ -2338,7 +2305,8 @@ static void ath10k_pci_device_reset(struct ath10k *ar)
 		msleep(1);
 	}
 
-	ath10k_pci_reg_write32(ar, PCIE_SOC_WAKE_ADDRESS, PCIE_SOC_WAKE_RESET);
+	ath10k_do_pci_sleep(ar);
+	return 0;
 }
 
 static void ath10k_pci_dump_features(struct ath10k_pci *ar_pci)
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
