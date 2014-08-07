Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJlN-00028v-G7
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:13:34 +0000
Received: by mail-wg0-f47.google.com with SMTP id b13so3883773wgh.30
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:13:08 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/6] ath10k: remove pci features var
Date: Thu,  7 Aug 2014 11:03:29 +0200
Message-Id: <1407402212-29809-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
References: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
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

The ATH10K_PCI_FEATURE_MSI_X was originally
introduced to support both chips QCA988Xv1 and
QCA988Xv2. Since v1 isn't supported anymore it
doesn't make sense to keep the feature flag
around. Since this is the last one remove the
whole thing.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 33 +--------------------------------
 drivers/net/wireless/ath/ath10k/pci.h |  9 ---------
 2 files changed, 1 insertion(+), 41 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 5fa45db..c31edb6 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2318,8 +2318,6 @@ static void ath10k_pci_init_irq_tasklets(struct ath10k *ar)
 static int ath10k_pci_init_irq(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	bool msix_supported = test_bit(ATH10K_PCI_FEATURE_MSI_X,
-				       ar_pci->features);
 	int ret;
 
 	ath10k_pci_init_irq_tasklets(ar);
@@ -2329,7 +2327,7 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 		ath10k_info("limiting irq mode to: %d\n", ath10k_pci_irq_mode);
 
 	/* Try MSI-X */
-	if (ath10k_pci_irq_mode == ATH10K_PCI_IRQ_AUTO && msix_supported) {
+	if (ath10k_pci_irq_mode == ATH10K_PCI_IRQ_AUTO) {
 		ar_pci->num_msi_intrs = MSI_NUM_REQUEST;
 		ret = pci_enable_msi_range(ar_pci->pdev, ar_pci->num_msi_intrs,
 							 ar_pci->num_msi_intrs);
@@ -2485,22 +2483,6 @@ static int ath10k_pci_cold_reset(struct ath10k *ar)
 	return 0;
 }
 
-static void ath10k_pci_dump_features(struct ath10k_pci *ar_pci)
-{
-	int i;
-
-	for (i = 0; i < ATH10K_PCI_FEATURE_COUNT; i++) {
-		if (!test_bit(i, ar_pci->features))
-			continue;
-
-		switch (i) {
-		case ATH10K_PCI_FEATURE_MSI_X:
-			ath10k_dbg(ATH10K_DBG_BOOT, "device supports MSI-X\n");
-			break;
-		}
-	}
-}
-
 static int ath10k_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *pci_dev)
 {
@@ -2522,19 +2504,6 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	ar_pci = ath10k_pci_priv(ar);
 	ar_pci->pdev = pdev;
 	ar_pci->dev = &pdev->dev;
-
-	switch (pci_dev->device) {
-	case QCA988X_2_0_DEVICE_ID:
-		set_bit(ATH10K_PCI_FEATURE_MSI_X, ar_pci->features);
-		break;
-	default:
-		ret = -ENODEV;
-		ath10k_err("Unknown device ID: %d\n", pci_dev->device);
-		goto err_core_destroy;
-	}
-
-	ath10k_pci_dump_features(ar_pci);
-
 	ar_pci->ar = ar;
 
 	pci_set_drvdata(pdev, ar);
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 65b1b90..662bca3 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -135,13 +135,6 @@ struct service_to_pipe {
 	u32 pipenum;
 };
 
-enum ath10k_pci_features {
-	ATH10K_PCI_FEATURE_MSI_X		= 0,
-
-	/* keep last */
-	ATH10K_PCI_FEATURE_COUNT
-};
-
 /* Per-pipe state. */
 struct ath10k_pci_pipe {
 	/* Handle of underlying Copy Engine */
@@ -168,8 +161,6 @@ struct ath10k_pci {
 	struct ath10k *ar;
 	void __iomem *mem;
 
-	DECLARE_BITMAP(features, ATH10K_PCI_FEATURE_COUNT);
-
 	/*
 	 * Number of MSI interrupts granted, 0 --> using legacy PCI line
 	 * interrupts.
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
