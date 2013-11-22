Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjqTr-0005xC-A0
 for ath10k@lists.infradead.org; Fri, 22 Nov 2013 13:09:16 +0000
Received: by mail-ea0-f175.google.com with SMTP id z10so502042ead.34
 for <ath10k@lists.infradead.org>; Fri, 22 Nov 2013 05:08:45 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 6/8] ath10k: extract functions for legacy irq handling
Date: Fri, 22 Nov 2013 14:05:16 +0100
Message-Id: <1385125518-13461-7-git-send-email-michal.kazior@tieto.com>
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

Preparation for code re-use. Also use ioread/write
wrappers.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 68 +++++++++++++++++------------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index fa1162e..a9bc290 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2096,6 +2096,34 @@ static bool ath10k_pci_irq_pending(struct ath10k *ar)
 	return false;
 }
 
+static void ath10k_pci_disable_and_clear_legacy_irq(struct ath10k *ar)
+{
+	/* IMPORTANT: INTR_CLR register has to be set after
+	 * INTR_ENABLE is set to 0, otherwise interrupt can not be
+	 * really cleared. */
+	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_ENABLE_ADDRESS,
+			   0);
+	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_CLR_ADDRESS,
+			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
+
+	/* IMPORTANT: this extra read transaction is required to
+	 * flush the posted write buffer. */
+	(void) ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
+				 PCIE_INTR_ENABLE_ADDRESS);
+}
+
+static void ath10k_pci_enable_legacy_irq(struct ath10k *ar)
+{
+	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS +
+			   PCIE_INTR_ENABLE_ADDRESS,
+			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
+
+	/* IMPORTANT: this extra read transaction is required to
+	 * flush the posted write buffer. */
+	(void) ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
+				 PCIE_INTR_ENABLE_ADDRESS);
+}
+
 /*
  * Top-level interrupt handler for all PCI interrupts from a Target.
  * When a block of MSI interrupts is allocated, this top-level handler
@@ -2109,27 +2137,8 @@ static irqreturn_t ath10k_pci_interrupt_handler(int irq, void *arg)
 	if (!ath10k_pci_irq_pending(ar))
 		return IRQ_NONE;
 
-	if (ar_pci->num_msi_intrs == 0) {
-		/*
-		 * IMPORTANT: INTR_CLR regiser has to be set after
-		 * INTR_ENABLE is set to 0, otherwise interrupt can not be
-		 * really cleared.
-		 */
-		iowrite32(0, ar_pci->mem +
-			  (SOC_CORE_BASE_ADDRESS |
-			   PCIE_INTR_ENABLE_ADDRESS));
-		iowrite32(PCIE_INTR_FIRMWARE_MASK |
-			  PCIE_INTR_CE_MASK_ALL,
-			  ar_pci->mem + (SOC_CORE_BASE_ADDRESS |
-					 PCIE_INTR_CLR_ADDRESS));
-		/*
-		 * IMPORTANT: this extra read transaction is required to
-		 * flush the posted write buffer.
-		 */
-		(void) ioread32(ar_pci->mem +
-				(SOC_CORE_BASE_ADDRESS |
-				 PCIE_INTR_ENABLE_ADDRESS));
-	}
+	if (ar_pci->num_msi_intrs == 0)
+		ath10k_pci_disable_and_clear_legacy_irq(ar);
 
 	tasklet_schedule(&ar_pci->intr_tq);
 
@@ -2144,20 +2153,9 @@ static void ath10k_pci_tasklet(unsigned long data)
 	ath10k_pci_fw_interrupt_handler(ar); /* FIXME: Handle FW error */
 	ath10k_ce_per_engine_service_any(ar);
 
-	if (ar_pci->num_msi_intrs == 0) {
-		/* Enable Legacy PCI line interrupts */
-		iowrite32(PCIE_INTR_FIRMWARE_MASK |
-			  PCIE_INTR_CE_MASK_ALL,
-			  ar_pci->mem + (SOC_CORE_BASE_ADDRESS |
-					 PCIE_INTR_ENABLE_ADDRESS));
-		/*
-		 * IMPORTANT: this extra read transaction is required to
-		 * flush the posted write buffer
-		 */
-		(void) ioread32(ar_pci->mem +
-				(SOC_CORE_BASE_ADDRESS |
-				 PCIE_INTR_ENABLE_ADDRESS));
-	}
+	/* Re-enable legacy irq that was disabled in the irq handler */
+	if (ar_pci->num_msi_intrs == 0)
+		ath10k_pci_enable_legacy_irq(ar);
 }
 
 static int ath10k_pci_request_irq_msix(struct ath10k *ar)
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
