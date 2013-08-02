Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x230.google.com ([2a00:1450:4013:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5AGm-0000mj-43
 for ath10k@lists.infradead.org; Fri, 02 Aug 2013 07:59:28 +0000
Received: by mail-ee0-f48.google.com with SMTP id l10so154928eei.21
 for <ath10k@lists.infradead.org>; Fri, 02 Aug 2013 00:59:05 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH v2] ath10k: add SoC power save option to PCI features map
Date: Fri,  2 Aug 2013 09:58:49 +0200
Message-Id: <1375430329-23352-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Unify the PCI options location.

By default the SoC PS option is disabled to boost the
performance and due to poor stability on early HW revisions.
In future we can remove the module parameter and turn on/off
the PS for given hardware.

This change also makes the pci module parameter for SoC PS static.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |   21 +++++++++++++--------
 drivers/net/wireless/ath/ath10k/pci.h |   11 +++++++----
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index d95439b..b351e23 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -32,7 +32,7 @@
 #include "ce.h"
 #include "pci.h"
 
-unsigned int ath10k_target_ps;
+static unsigned int ath10k_target_ps;
 module_param(ath10k_target_ps, uint, 0644);
 MODULE_PARM_DESC(ath10k_target_ps, "Enable ath10k Target (SoC) PS option");
 
@@ -1740,6 +1740,7 @@ static void ath10k_pci_fw_interrupt_handler(struct ath10k *ar)
 
 static int ath10k_pci_hif_power_up(struct ath10k *ar)
 {
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int ret;
 
 	/*
@@ -1758,13 +1759,9 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 	if (ret)
 		goto err;
 
-	if (ath10k_target_ps) {
-		ath10k_dbg(ATH10K_DBG_PCI, "on-chip power save enabled\n");
-	} else {
+	if (!test_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features))
 		/* Force AWAKE forever */
-		ath10k_dbg(ATH10K_DBG_PCI, "on-chip power save disabled\n");
 		ath10k_do_pci_wake(ar);
-	}
 
 	ret = ath10k_pci_ce_init(ar);
 	if (ret)
@@ -1785,7 +1782,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 err_ce:
 	ath10k_pci_ce_deinit(ar);
 err_ps:
-	if (!ath10k_target_ps)
+	if (!test_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features))
 		ath10k_do_pci_sleep(ar);
 err:
 	return ret;
@@ -1793,8 +1790,10 @@ err:
 
 static void ath10k_pci_hif_power_down(struct ath10k *ar)
 {
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+
 	ath10k_pci_ce_deinit(ar);
-	if (!ath10k_target_ps)
+	if (!test_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features))
 		ath10k_do_pci_sleep(ar);
 }
 
@@ -2244,6 +2243,9 @@ static void ath10k_pci_dump_features(struct ath10k_pci *ar_pci)
 		case ATH10K_PCI_FEATURE_HW_1_0_WORKAROUND:
 			ath10k_dbg(ATH10K_DBG_PCI, "QCA988X_1.0 workaround enabled\n");
 			break;
+		case ATH10K_PCI_FEATURE_SOC_POWER_SAVE:
+			ath10k_dbg(ATH10K_DBG_PCI, "QCA98XX SoC power save enabled\n");
+			break;
 		}
 	}
 }
@@ -2279,6 +2281,9 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		goto err_ar_pci;
 	}
 
+	if (ath10k_target_ps)
+		set_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features);
+
 	ath10k_pci_dump_features(ar_pci);
 
 	ar = ath10k_core_create(ar_pci, ar_pci->dev, &ath10k_pci_hif_ops);
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index d3a2e6c..871bb33 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -153,6 +153,7 @@ struct service_to_pipe {
 enum ath10k_pci_features {
 	ATH10K_PCI_FEATURE_MSI_X		= 0,
 	ATH10K_PCI_FEATURE_HW_1_0_WORKAROUND	= 1,
+	ATH10K_PCI_FEATURE_SOC_POWER_SAVE	= 2,
 
 	/* keep last */
 	ATH10K_PCI_FEATURE_COUNT
@@ -335,20 +336,22 @@ static inline u32 ath10k_pci_read32(struct ath10k *ar, u32 offset)
 	return ioread32(ar_pci->mem + offset);
 }
 
-extern unsigned int ath10k_target_ps;
-
 void ath10k_do_pci_wake(struct ath10k *ar);
 void ath10k_do_pci_sleep(struct ath10k *ar);
 
 static inline void ath10k_pci_wake(struct ath10k *ar)
 {
-	if (ath10k_target_ps)
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+
+	if (test_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features))
 		ath10k_do_pci_wake(ar);
 }
 
 static inline void ath10k_pci_sleep(struct ath10k *ar)
 {
-	if (ath10k_target_ps)
+	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+
+	if (test_bit(ATH10K_PCI_FEATURE_SOC_POWER_SAVE, ar_pci->features))
 		ath10k_do_pci_sleep(ar);
 }
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
