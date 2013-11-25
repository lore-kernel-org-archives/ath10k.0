Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22c.google.com ([2a00:1450:4013:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkvw2-0006CN-Ue
 for ath10k@lists.infradead.org; Mon, 25 Nov 2013 13:10:44 +0000
Received: by mail-ea0-f172.google.com with SMTP id q10so2337551ead.17
 for <ath10k@lists.infradead.org>; Mon, 25 Nov 2013 05:10:25 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 6/8] ath10k: extract functions for legacy irq handling
Date: Mon, 25 Nov 2013 14:06:25 +0100
Message-Id: <1385384787-12470-7-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1385384787-12470-1-git-send-email-michal.kazior@tieto.com>
References: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
 <1385384787-12470-1-git-send-email-michal.kazior@tieto.com>
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
v2:
 * move function definitions up to avoid forward
   declarations in subsequent patches

 drivers/net/wireless/ath/ath10k/pci.c | 65 +++++++++++++++++------------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index bd67311..1d2939c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -220,6 +220,34 @@ static bool ath10k_pci_irq_pending(struct ath10k *ar)
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
  * Diagnostic read/write access is provided for startup/config/debug usage.
  * Caller must guarantee proper alignment, when applicable, and single user
@@ -2128,25 +2156,7 @@ static irqreturn_t ath10k_pci_interrupt_handler(int irq, void *arg)
 		if (!ath10k_pci_irq_pending(ar))
 			return IRQ_NONE;
 
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
+		ath10k_pci_disable_and_clear_legacy_irq(ar);
 	}
 
 	tasklet_schedule(&ar_pci->intr_tq);
@@ -2162,20 +2172,9 @@ static void ath10k_pci_tasklet(unsigned long data)
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
