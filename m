Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC4xy-00065V-Sa
 for ath10k@lists.infradead.org; Fri, 16 Jan 2015 11:21:28 +0000
Received: by mail-wi0-f173.google.com with SMTP id r20so1575563wiv.0
 for <ath10k@lists.infradead.org>; Fri, 16 Jan 2015 03:21:04 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/3] ath10k: reset chip before reading chip_id in probe
Date: Fri, 16 Jan 2015 12:20:35 +0100
Message-Id: <1421407237-24159-1-git-send-email-michal.kazior@tieto.com>
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

There are some very rare cases with some hardware
configuration that the device doesn't init quickly
enough in which case reading chip_id yielded 0.
This caused driver to subsequently fail to setup
the device.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 3b40a86..6a512fb 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2544,18 +2544,6 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		goto err_release;
 	}
 
-	chip_id = ath10k_pci_soc_read32(ar, SOC_CHIP_ID_ADDRESS);
-	if (chip_id == 0xffffffff) {
-		ath10k_err(ar, "failed to get chip id\n");
-		goto err_sleep;
-	}
-
-	if (!ath10k_pci_chip_is_supported(pdev->device, chip_id)) {
-		ath10k_err(ar, "device %04x with chip_id %08x isn't supported\n",
-			   pdev->device, chip_id);
-		goto err_sleep;
-	}
-
 	ret = ath10k_pci_alloc_pipes(ar);
 	if (ret) {
 		ath10k_err(ar, "failed to allocate copy engine pipes: %d\n",
@@ -2582,6 +2570,24 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 		goto err_deinit_irq;
 	}
 
+	ret = ath10k_pci_chip_reset(ar);
+	if (ret) {
+		ath10k_err(ar, "failed to reset chip: %d\n", ret);
+		goto err_free_irq;
+	}
+
+	chip_id = ath10k_pci_soc_read32(ar, SOC_CHIP_ID_ADDRESS);
+	if (chip_id == 0xffffffff) {
+		ath10k_err(ar, "failed to get chip id\n");
+		goto err_free_irq;
+	}
+
+	if (!ath10k_pci_chip_is_supported(pdev->device, chip_id)) {
+		ath10k_err(ar, "device %04x with chip_id %08x isn't supported\n",
+			   pdev->device, chip_id);
+		goto err_sleep;
+	}
+
 	ath10k_pci_sleep(ar);
 
 	ret = ath10k_core_register(ar, chip_id);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
