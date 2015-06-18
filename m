Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5TrV-0005Uq-EZ
 for ath10k@lists.infradead.org; Thu, 18 Jun 2015 07:03:46 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: [PATCH V2 06/10] ath10k: Add chip reset sequence for QCA99X0
Date: Thu, 18 Jun 2015 12:31:06 +0530
Message-ID: <1434610870-5505-7-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1434610870-5505-1-git-send-email-vthiagar@qti.qualcomm.com>
References: <1434610870-5505-1-git-send-email-vthiagar@qti.qualcomm.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless@vger.kernel.org

QCA99X0 supports only cold reset. Also, made
ath10k_pci_irq_msi_fw_mask() and ath10k_pci_irq_msi_fw_unmask()
non-99X0 specific till we get proper register configuration
to mask/unmask irq/MSI.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 81 ++++++++++++++++++++++++++++++-----
 1 file changed, 71 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index df7d74e..1b4634a 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -82,7 +82,7 @@ static const struct ath10k_pci_supp_chip ath10k_pci_supp_chips[] = {
 
 static void ath10k_pci_buffer_cleanup(struct ath10k *ar);
 static int ath10k_pci_cold_reset(struct ath10k *ar);
-static int ath10k_pci_warm_reset(struct ath10k *ar);
+static int ath10k_pci_safe_chip_reset(struct ath10k *ar);
 static int ath10k_pci_wait_for_target_init(struct ath10k *ar);
 static int ath10k_pci_init_irq(struct ath10k *ar);
 static int ath10k_pci_deinit_irq(struct ath10k *ar);
@@ -91,6 +91,7 @@ static void ath10k_pci_free_irq(struct ath10k *ar);
 static int ath10k_pci_bmi_wait(struct ath10k_ce_pipe *tx_pipe,
 			       struct ath10k_ce_pipe *rx_pipe,
 			       struct bmi_xfer *xfer);
+static int ath10k_pci_qca99x0_chip_reset(struct ath10k *ar);
 
 static const struct ce_attr host_ce_config_wlan[] = {
 	/* CE0: host->target HTC control and raw streams */
@@ -1427,20 +1428,42 @@ static void ath10k_pci_irq_msi_fw_mask(struct ath10k *ar)
 {
 	u32 val;
 
-	val = ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS + CORE_CTRL_ADDRESS);
-	val &= ~CORE_CTRL_PCIE_REG_31_MASK;
-
-	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + CORE_CTRL_ADDRESS, val);
+	switch (ar->hw_rev) {
+	case ATH10K_HW_QCA988X:
+	case ATH10K_HW_QCA6174:
+		val = ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
+					CORE_CTRL_ADDRESS);
+		val &= ~CORE_CTRL_PCIE_REG_31_MASK;
+		ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS +
+				   CORE_CTRL_ADDRESS, val);
+		break;
+	case ATH10K_HW_QCA99X0:
+		/* TODO: Find appropriate register configuration for QCA99X0
+		 *  to mask irq/MSI.
+		 */
+		 break;
+	}
 }
 
 static void ath10k_pci_irq_msi_fw_unmask(struct ath10k *ar)
 {
 	u32 val;
 
-	val = ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS + CORE_CTRL_ADDRESS);
-	val |= CORE_CTRL_PCIE_REG_31_MASK;
-
-	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + CORE_CTRL_ADDRESS, val);
+	switch (ar->hw_rev) {
+	case ATH10K_HW_QCA988X:
+	case ATH10K_HW_QCA6174:
+		val = ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
+					CORE_CTRL_ADDRESS);
+		val |= CORE_CTRL_PCIE_REG_31_MASK;
+		ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS +
+				   CORE_CTRL_ADDRESS, val);
+		break;
+	case ATH10K_HW_QCA99X0:
+		/* TODO: Find appropriate register configuration for QCA99X0
+		 *  to unmask irq/MSI.
+		 */
+		break;
+	}
 }
 
 static void ath10k_pci_irq_disable(struct ath10k *ar)
@@ -1602,7 +1625,7 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 	 * masked. To prevent the device from asserting the interrupt reset it
 	 * before proceeding with cleanup.
 	 */
-	ath10k_pci_warm_reset(ar);
+	ath10k_pci_safe_chip_reset(ar);
 
 	ath10k_pci_irq_disable(ar);
 	ath10k_pci_irq_sync(ar);
@@ -2114,6 +2137,18 @@ static int ath10k_pci_warm_reset(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_pci_safe_chip_reset(struct ath10k *ar)
+{
+	if (QCA_REV_988X(ar) || QCA_REV_6174(ar)) {
+		return ath10k_pci_warm_reset(ar);
+	} else if (QCA_REV_99X0(ar)) {
+		ath10k_pci_irq_disable(ar);
+		return ath10k_pci_qca99x0_chip_reset(ar);
+	} else {
+		return -ENOTSUPP;
+	}
+}
+
 static int ath10k_pci_qca988x_chip_reset(struct ath10k *ar)
 {
 	int i, ret;
@@ -2220,12 +2255,38 @@ static int ath10k_pci_qca6174_chip_reset(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_pci_qca99x0_chip_reset(struct ath10k *ar)
+{
+	int ret;
+
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot qca99x0 chip reset\n");
+
+	ret = ath10k_pci_cold_reset(ar);
+	if (ret) {
+		ath10k_warn(ar, "failed to cold reset: %d\n", ret);
+		return ret;
+	}
+
+	ret = ath10k_pci_wait_for_target_init(ar);
+	if (ret) {
+		ath10k_warn(ar, "failed to wait for target after cold reset: %d\n",
+			    ret);
+		return ret;
+	}
+
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot qca99x0 chip reset complete (cold)\n");
+
+	return 0;
+}
+
 static int ath10k_pci_chip_reset(struct ath10k *ar)
 {
 	if (QCA_REV_988X(ar))
 		return ath10k_pci_qca988x_chip_reset(ar);
 	else if (QCA_REV_6174(ar))
 		return ath10k_pci_qca6174_chip_reset(ar);
+	else if (QCA_REV_99X0(ar))
+		return ath10k_pci_qca99x0_chip_reset(ar);
 	else
 		return -ENOTSUPP;
 }
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
