Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhJ1w-0007YR-Rk
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 14:06:21 +0000
Received: by mail-wi0-f171.google.com with SMTP id em10so4237891wid.16
 for <ath10k@lists.infradead.org>; Thu, 23 Oct 2014 07:05:57 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: fix pm resume after suspend
Date: Thu, 23 Oct 2014 16:05:49 +0200
Message-Id: <1414073150-11593-1-git-send-email-bartosz.markowski@tieto.com>
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

Firmware was crashing when we were trying to warm reset it
after suspend. This was due to the fact that target registeres
can be accessed only if the hardware is awaken.

This patch makes sure to awake the device also on the hif up,
not only in case of probe call path.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 86f734e..4dee319 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1858,10 +1858,16 @@ static int ath10k_pci_hif_power_up_warm(struct ath10k *ar)
 
 static int ath10k_pci_hif_power_up(struct ath10k *ar)
 {
-	int ret;
+	int ret = 0;
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif power up\n");
 
+	ret = ath10k_pci_wake(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to wake up target: %d\n", ret);
+		return ret;
+	}
+
 	/*
 	 * Hardware CUS232 version 2 has some issues with cold reset and the
 	 * preferred (and safer) way to perform a device reset is through a
@@ -1876,7 +1882,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 			    ret);
 
 		if (ath10k_pci_reset_mode == ATH10K_PCI_RESET_WARM_ONLY)
-			return ret;
+			goto err_sleep;
 
 		ath10k_warn(ar, "trying cold reset\n");
 
@@ -1884,11 +1890,15 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 		if (ret) {
 			ath10k_err(ar, "failed to power up target using cold reset too (%d)\n",
 				   ret);
-			return ret;
+			goto err_sleep;
 		}
 	}
 
-	return 0;
+	return ret;
+
+err_sleep:
+	ath10k_pci_sleep(ar);
+	return ret;
 }
 
 static void ath10k_pci_hif_power_down(struct ath10k *ar)
@@ -1896,6 +1906,7 @@ static void ath10k_pci_hif_power_down(struct ath10k *ar)
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif power down\n");
 
 	ath10k_pci_warm_reset(ar);
+	ath10k_pci_sleep(ar);
 }
 
 #ifdef CONFIG_PM
@@ -2513,6 +2524,8 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	/* This shouldn't race as the device has been reset above. */
 	ath10k_pci_irq_disable(ar);
 
+	ath10k_pci_sleep(ar);
+
 	ret = ath10k_core_register(ar, chip_id);
 	if (ret) {
 		ath10k_err(ar, "failed to register driver core: %d\n", ret);
@@ -2564,7 +2577,6 @@ static void ath10k_pci_remove(struct pci_dev *pdev)
 	ath10k_pci_deinit_irq(ar);
 	ath10k_pci_ce_deinit(ar);
 	ath10k_pci_free_ce(ar);
-	ath10k_pci_sleep(ar);
 	ath10k_pci_release(ar);
 	ath10k_core_destroy(ar);
 }
-- 
1.8.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
