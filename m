Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x22a.google.com ([2a00:1450:4013:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjqTs-0005xG-L5
 for ath10k@lists.infradead.org; Fri, 22 Nov 2013 13:09:16 +0000
Received: by mail-ea0-f170.google.com with SMTP id k10so511132eaj.15
 for <ath10k@lists.infradead.org>; Fri, 22 Nov 2013 05:08:46 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 8/8] ath10k: allow explicit MSI/MSI-X disabling
Date: Fri, 22 Nov 2013 14:05:18 +0100
Message-Id: <1385125518-13461-9-git-send-email-michal.kazior@tieto.com>
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

This can be useful for testing and debugging.

Two new ath10k_pci module options are now available:

 disable_msix - disable just MSI-X
 disable_msi - disable MSI (along with MSI-X)

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 43 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 47d9b6e..b89fd7b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -34,9 +34,18 @@
 #include "pci.h"
 
 static unsigned int ath10k_target_ps;
+static bool ath10k_disable_msix;
+static bool ath10k_disable_msi;
+
 module_param(ath10k_target_ps, uint, 0644);
 MODULE_PARM_DESC(ath10k_target_ps, "Enable ath10k Target (SoC) PS option");
 
+module_param_named(disable_msix, ath10k_disable_msix, bool, 0644);
+MODULE_PARM_DESC(disable_msix, "Disable MSI-X support");
+
+module_param_named(disable_msi, ath10k_disable_msi, bool, 0644);
+MODULE_PARM_DESC(disable_msi, "Disable MSI support");
+
 #define QCA988X_2_0_DEVICE_ID	(0x003c)
 
 static DEFINE_PCI_DEVICE_TABLE(ath10k_pci_id_table) = {
@@ -2367,27 +2376,33 @@ static void ath10k_pci_init_irq_tasklets(struct ath10k *ar)
 static int ath10k_pci_init_irq(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	bool msix_supported = test_bit(ATH10K_PCI_FEATURE_MSI_X,
+				       ar_pci->features);
 	int ret;
 
 	ath10k_pci_init_irq_tasklets(ar);
 
-	if (!test_bit(ATH10K_PCI_FEATURE_MSI_X, ar_pci->features))
-		goto msi;
-
 	/* Try MSI-X */
-	ar_pci->num_msi_intrs = MSI_NUM_REQUEST;
-	ret = pci_enable_msi_block(ar_pci->pdev, ar_pci->num_msi_intrs);
-	if (ret == 0)
-		return 0;
-	if (ret > 0)
-		pci_disable_msi(ar_pci->pdev);
+	if (msix_supported && !ath10k_disable_msix && !ath10k_disable_msi) {
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
+	if (!ath10k_disable_msi) {
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
