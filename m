Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x235.google.com ([2a00:1450:4013:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjqTp-0005x7-H7
 for ath10k@lists.infradead.org; Fri, 22 Nov 2013 13:09:10 +0000
Received: by mail-ea0-f181.google.com with SMTP id m10so513184eaj.12
 for <ath10k@lists.infradead.org>; Fri, 22 Nov 2013 05:08:41 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/8] ath10k: don't consume other's shared interrupts
Date: Fri, 22 Nov 2013 14:05:11 +0100
Message-Id: <1385125518-13461-2-git-send-email-michal.kazior@tieto.com>
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

ath10k assumed all interrupts were directed to it.
This isn't the case for legacy shared interrupts.
ath10k consumed interrupts for other devices.

Check device irq status and return IRQ_NONE when
appropriate.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/hw.h  |  1 +
 drivers/net/wireless/ath/ath10k/pci.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 8aeb46d..9535eaa 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -269,6 +269,7 @@ enum ath10k_mcast2ucast_mode {
 #define CORE_CTRL_CPU_INTR_MASK			0x00002000
 #define CORE_CTRL_ADDRESS			0x0000
 #define PCIE_INTR_ENABLE_ADDRESS		0x0008
+#define PCIE_INTR_CAUSE_ADDRESS			0x000c
 #define PCIE_INTR_CLR_ADDRESS			0x0014
 #define SCRATCH_3_ADDRESS			0x0030
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 2457c8b..ed752d6 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2075,6 +2075,24 @@ static irqreturn_t ath10k_pci_msi_fw_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static bool ath10k_pci_irq_pending(struct ath10k *ar)
+{
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	u32 cause;
+
+	/* MSIs are always exclusive */
+	if (ar_pci->num_msi_intrs > 0)
+		return true;
+
+	/* Check if the shared legacy irq is for us */
+	cause = ath10k_pci_read32(ar, SOC_CORE_BASE_ADDRESS +
+				  PCIE_INTR_CAUSE_ADDRESS);
+	if (cause & (PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL))
+		return true;
+
+	return false;
+}
+
 /*
  * Top-level interrupt handler for all PCI interrupts from a Target.
  * When a block of MSI interrupts is allocated, this top-level handler
@@ -2085,6 +2103,9 @@ static irqreturn_t ath10k_pci_interrupt_handler(int irq, void *arg)
 	struct ath10k *ar = arg;
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 
+	if (!ath10k_pci_irq_pending(ar))
+		return IRQ_NONE;
+
 	if (ar_pci->num_msi_intrs == 0) {
 		/*
 		 * IMPORTANT: INTR_CLR regiser has to be set after
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
