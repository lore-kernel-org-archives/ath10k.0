Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk7Bw-00065g-21
 for ath10k@lists.infradead.org; Fri, 31 Oct 2014 08:04:16 +0000
Received: by mail-wi0-f178.google.com with SMTP id q5so569326wiv.17
 for <ath10k@lists.infradead.org>; Fri, 31 Oct 2014 01:03:48 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH v3] ath10k: fix pm resume after suspend
Date: Fri, 31 Oct 2014 09:03:43 +0100
Message-Id: <1414742623-308-1-git-send-email-bartosz.markowski@tieto.com>
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
not only in case of probe call.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index f5e426e..3a6b8a5 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1875,6 +1875,12 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif power up\n");
 
+	ret = ath10k_pci_wake(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to wake up target: %d\n", ret);
+		return ret;
+	}
+
 	/*
 	 * Bring the target up cleanly.
 	 *
@@ -1888,13 +1894,13 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 	ret = ath10k_pci_chip_reset(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to reset chip: %d\n", ret);
-		goto err;
+		goto err_sleep;
 	}
 
 	ret = ath10k_pci_init_pipes(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to initialize CE: %d\n", ret);
-		goto err;
+		goto err_sleep;
 	}
 
 	ret = ath10k_pci_init_config(ar);
@@ -1914,7 +1920,8 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
 err_ce:
 	ath10k_pci_ce_deinit(ar);
 
-err:
+err_sleep:
+	ath10k_pci_sleep(ar);
 	return ret;
 }
 
@@ -1925,6 +1932,8 @@ static void ath10k_pci_hif_power_down(struct ath10k *ar)
 	/* Currently hif_power_up performs effectively a reset and hif_stop
 	 * resets the chip as well so there's no point in resetting here.
 	 */
+
+	ath10k_pci_sleep(ar);
 }
 
 #ifdef CONFIG_PM
@@ -2526,6 +2535,8 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		goto err_deinit_irq;
 	}
 
+	ath10k_pci_sleep(ar);
+
 	ret = ath10k_core_register(ar, chip_id);
 	if (ret) {
 		ath10k_err(ar, "failed to register driver core: %d\n", ret);
@@ -2577,7 +2588,6 @@ static void ath10k_pci_remove(struct pci_dev *pdev)
 	ath10k_pci_deinit_irq(ar);
 	ath10k_pci_ce_deinit(ar);
 	ath10k_pci_free_pipes(ar);
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
