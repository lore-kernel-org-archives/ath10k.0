Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTRHc-0003UX-Jm
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 07:32:57 +0000
Subject: [PATCH v2 3/8] ath10k: fix name of target_ps module parameter
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 28 Mar 2014 09:32:33 +0200
Message-ID: <20140328073233.30438.28666.stgit@potku.adurom.net>
In-Reply-To: <20140328073040.30438.17966.stgit@potku.adurom.net>
References: <20140328073040.30438.17966.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

The parameter name was ath10k_target_ps, but actually it should be just
target_ps. Module parameter names should not use the ath10k_ prefix.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 9dab859ed77b..670e6734a46b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -44,12 +44,12 @@ enum ath10k_pci_reset_mode {
 	ATH10K_PCI_RESET_WARM_ONLY = 1,
 };
 
-static unsigned int ath10k_target_ps;
+static unsigned int ath10k_pci_target_ps;
 static unsigned int ath10k_pci_irq_mode = ATH10K_PCI_IRQ_AUTO;
 static unsigned int ath10k_pci_reset_mode = ATH10K_PCI_RESET_AUTO;
 
-module_param(ath10k_target_ps, uint, 0644);
-MODULE_PARM_DESC(ath10k_target_ps, "Enable ath10k Target (SoC) PS option");
+module_param_named(target_ps, ath10k_pci_target_ps, uint, 0644);
+MODULE_PARM_DESC(target_ps, "Enable ath10k Target (SoC) PS option");
 
 module_param_named(irq_mode, ath10k_pci_irq_mode, uint, 0644);
 MODULE_PARM_DESC(irq_mode, "0: auto, 1: legacy, 2: msi (default: 0)");
@@ -2531,7 +2531,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		goto err_ar_pci;
 	}
 
-	if (ath10k_target_ps)
+	if (ath10k_pci_target_ps)
 		set_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features);
 
 	ath10k_pci_dump_features(ar_pci);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
