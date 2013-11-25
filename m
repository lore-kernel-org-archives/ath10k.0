Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x234.google.com ([2a00:1450:4013:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkvw9-0006CX-0x
 for ath10k@lists.infradead.org; Mon, 25 Nov 2013 13:10:53 +0000
Received: by mail-ea0-f180.google.com with SMTP id f15so2385089eak.11
 for <ath10k@lists.infradead.org>; Mon, 25 Nov 2013 05:10:27 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 8/8] ath10k: allow explicit MSI/MSI-X disabling
Date: Mon, 25 Nov 2013 14:06:27 +0100
Message-Id: <1385384787-12470-9-git-send-email-michal.kazior@tieto.com>
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

This can be useful for testing and debugging.

This introduces new ath10k_pci module parameter
`irq_mode`. By default it is 0, meaning automatic
irq mode (MSI-X as long as both target HW and host
platform supports it). The parameter works on a
best effort basis.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
v2:
 * merge 2 parameters into 1
 * add info print if the mode is != auto

 drivers/net/wireless/ath/ath10k/pci.c | 47 +++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 0a2d1c2..9606b9b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -33,10 +33,21 @@
 #include "ce.h"
 #include "pci.h"
 
+enum ath10k_pci_irq_mode {
+	ATH10K_PCI_IRQ_AUTO = 0,
+	ATH10K_PCI_IRQ_LEGACY = 1,
+	ATH10K_PCI_IRQ_MSI = 2,
+};
+
 static unsigned int ath10k_target_ps;
+static unsigned int ath10k_pci_irq_mode = ATH10K_PCI_IRQ_AUTO;
+
 module_param(ath10k_target_ps, uint, 0644);
 MODULE_PARM_DESC(ath10k_target_ps, "Enable ath10k Target (SoC) PS option");
 
+module_param_named(irq_mode, ath10k_pci_irq_mode, uint, 0644);
+MODULE_PARM_DESC(irq_mode, "0: ayto, 1: legacy, 2: msi (default: 0)");
+
 #define QCA988X_2_0_DEVICE_ID	(0x003c)
 
 static DEFINE_PCI_DEVICE_TABLE(ath10k_pci_id_table) = {
@@ -2387,27 +2398,37 @@ static void ath10k_pci_init_irq_tasklets(struct ath10k *ar)
 static int ath10k_pci_init_irq(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	bool msix_supported = test_bit(ATH10K_PCI_FEATURE_MSI_X,
+				       ar_pci->features);
 	int ret;
 
 	ath10k_pci_init_irq_tasklets(ar);
 
-	if (!test_bit(ATH10K_PCI_FEATURE_MSI_X, ar_pci->features))
-		goto msi;
+	if (ath10k_pci_irq_mode != ATH10K_PCI_IRQ_AUTO &&
+	    !test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags))
+		ath10k_info("limiting irq mode to: %d\n", ath10k_pci_irq_mode);
 
 	/* Try MSI-X */
-	ar_pci->num_msi_intrs = MSI_NUM_REQUEST;
-	ret = pci_enable_msi_block(ar_pci->pdev, ar_pci->num_msi_intrs);
-	if (ret == 0)
-		return 0;
-	if (ret > 0)
-		pci_disable_msi(ar_pci->pdev);
+	if (ath10k_pci_irq_mode == ATH10K_PCI_IRQ_AUTO && msix_supported) {
+		ar_pci->num_msi_intrs = MSI_NUM_REQUEST;
+		ret = pci_enable_msi_block(ar_pci->pdev, ar_pci->num_msi_intrs);
+		if (ret == 0)
+			return 0;
+		if (ret > 0)
+			pci_disable_msi(ar_pci->pdev);
+
+		/* fall-through */
+	}
 
-msi:
 	/* Try MSI */
-	ar_pci->num_msi_intrs = 1;
-	ret = pci_enable_msi(ar_pci->pdev);
-	if (ret == 0)
-		return 0;
+	if (ath10k_pci_irq_mode != ATH10K_PCI_IRQ_LEGACY) {
+		ar_pci->num_msi_intrs = 1;
+		ret = pci_enable_msi(ar_pci->pdev);
+		if (ret == 0)
+			return 0;
+
+		/* fall-through */
+	}
 
 	/* Try legacy irq
 	 *
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
