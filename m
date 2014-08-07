Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJlM-00027j-KL
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:13:33 +0000
Received: by mail-wg0-f46.google.com with SMTP id m15so3811545wgh.29
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:13:07 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/6] ath10k: embed ar_pci inside ar
Date: Thu,  7 Aug 2014 11:03:27 +0200
Message-Id: <1407402212-29809-2-git-send-email-michal.kazior@tieto.com>
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

Use the common convention of embedding private
structures inside parent structures. This
reduces allocations and simplifies pci probing
code.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c |  5 ++---
 drivers/net/wireless/ath/ath10k/core.h |  6 ++++--
 drivers/net/wireless/ath/ath10k/mac.c  |  4 ++--
 drivers/net/wireless/ath/ath10k/mac.h  |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c  | 25 +++++++++----------------
 drivers/net/wireless/ath/ath10k/pci.h  |  2 +-
 6 files changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 440c3ff..2790aad 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1060,12 +1060,12 @@ void ath10k_core_unregister(struct ath10k *ar)
 }
 EXPORT_SYMBOL(ath10k_core_unregister);
 
-struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
+struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 				  const struct ath10k_hif_ops *hif_ops)
 {
 	struct ath10k *ar;
 
-	ar = ath10k_mac_create();
+	ar = ath10k_mac_create(priv_size);
 	if (!ar)
 		return NULL;
 
@@ -1075,7 +1075,6 @@ struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
 	ar->p2p = !!ath10k_p2p;
 	ar->dev = dev;
 
-	ar->hif.priv = hif_priv;
 	ar->hif.ops = hif_ops;
 
 	init_completion(&ar->scan.started);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index d5c95d4..2694bd6 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -375,7 +375,6 @@ struct ath10k {
 	bool p2p;
 
 	struct {
-		void *priv;
 		const struct ath10k_hif_ops *ops;
 	} hif;
 
@@ -510,9 +509,12 @@ struct ath10k {
 		enum ath10k_spectral_mode mode;
 		struct ath10k_spec_scan config;
 	} spectral;
+
+	/* must be last */
+	u8 drv_priv[0] __aligned(sizeof(void *));
 };
 
-struct ath10k *ath10k_core_create(void *hif_priv, struct device *dev,
+struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 				  const struct ath10k_hif_ops *hif_ops);
 void ath10k_core_destroy(struct ath10k *ar);
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3c794203..908d5f5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4514,12 +4514,12 @@ static struct ieee80211_rate ath10k_rates[] = {
 #define ath10k_g_rates (ath10k_rates + 0)
 #define ath10k_g_rates_size (ARRAY_SIZE(ath10k_rates))
 
-struct ath10k *ath10k_mac_create(void)
+struct ath10k *ath10k_mac_create(size_t priv_size)
 {
 	struct ieee80211_hw *hw;
 	struct ath10k *ar;
 
-	hw = ieee80211_alloc_hw(sizeof(struct ath10k), &ath10k_ops);
+	hw = ieee80211_alloc_hw(sizeof(struct ath10k) + priv_size, &ath10k_ops);
 	if (!hw)
 		return NULL;
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.h b/drivers/net/wireless/ath/ath10k/mac.h
index ef4f843..720cb1a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.h
+++ b/drivers/net/wireless/ath/ath10k/mac.h
@@ -26,7 +26,7 @@ struct ath10k_generic_iter {
 	int ret;
 };
 
-struct ath10k *ath10k_mac_create(void);
+struct ath10k *ath10k_mac_create(size_t priv_size);
 void ath10k_mac_destroy(struct ath10k *ar);
 int ath10k_mac_register(struct ath10k *ar);
 void ath10k_mac_unregister(struct ath10k *ar);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 2d340cc..a2003b6 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2621,10 +2621,14 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 
 	ath10k_dbg(ATH10K_DBG_PCI, "pci probe\n");
 
-	ar_pci = kzalloc(sizeof(*ar_pci), GFP_KERNEL);
-	if (ar_pci == NULL)
+	ar = ath10k_core_create(sizeof(*ar_pci), &pdev->dev,
+				&ath10k_pci_hif_ops);
+	if (!ar) {
+		ath10k_err("failed to allocate core\n");
 		return -ENOMEM;
+	}
 
+	ar_pci = ath10k_pci_priv(ar);
 	ar_pci->pdev = pdev;
 	ar_pci->dev = &pdev->dev;
 
@@ -2635,7 +2639,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	default:
 		ret = -ENODEV;
 		ath10k_err("Unknown device ID: %d\n", pci_dev->device);
-		goto err_ar_pci;
+		goto err_core_destroy;
 	}
 
 	if (ath10k_pci_target_ps)
@@ -2643,13 +2647,6 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 
 	ath10k_pci_dump_features(ar_pci);
 
-	ar = ath10k_core_create(ar_pci, ar_pci->dev, &ath10k_pci_hif_ops);
-	if (!ar) {
-		ath10k_err("failed to create driver core\n");
-		ret = -EINVAL;
-		goto err_ar_pci;
-	}
-
 	ar_pci->ar = ar;
 	atomic_set(&ar_pci->keep_awake_count, 0);
 
@@ -2658,7 +2655,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	ret = pci_enable_device(pdev);
 	if (ret) {
 		ath10k_err("failed to enable PCI device: %d\n", ret);
-		goto err_ar;
+		goto err_core_destroy;
 	}
 
 	/* Request MMIO resources */
@@ -2742,11 +2739,8 @@ err_region:
 	pci_release_region(pdev, BAR_NUM);
 err_device:
 	pci_disable_device(pdev);
-err_ar:
+err_core_destroy:
 	ath10k_core_destroy(ar);
-err_ar_pci:
-	/* call HIF PCI free here */
-	kfree(ar_pci);
 
 	return ret;
 }
@@ -2775,7 +2769,6 @@ static void ath10k_pci_remove(struct pci_dev *pdev)
 	pci_disable_device(pdev);
 
 	ath10k_core_destroy(ar);
-	kfree(ar_pci);
 }
 
 MODULE_DEVICE_TABLE(pci, ath10k_pci_id_table);
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index 9401292..531c98a 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -202,7 +202,7 @@ struct ath10k_pci {
 
 static inline struct ath10k_pci *ath10k_pci_priv(struct ath10k *ar)
 {
-	return ar->hif.priv;
+	return (struct ath10k_pci *)ar->drv_priv;
 }
 
 static inline u32 ath10k_pci_reg_read32(struct ath10k *ar, u32 addr)
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
