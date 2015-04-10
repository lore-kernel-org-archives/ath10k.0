Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgYbw-0006AO-1D
 for ath10k@lists.infradead.org; Fri, 10 Apr 2015 13:04:41 +0000
Received: by labbd9 with SMTP id bd9so12730211lab.2
 for <ath10k@lists.infradead.org>; Fri, 10 Apr 2015 06:04:16 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix error handling in pci_probe
Date: Fri, 10 Apr 2015 13:01:27 +0000
Message-Id: <1428670887-7533-1-git-send-email-michal.kazior@tieto.com>
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

If chip_id wasn't recognized clean up code wasn't
executed properly. It would skip freeing memory
causing a leak and irqs causing possibly MSI
warning splats later or even kernel crashes.

Fixes: 1a7fecb766c8 ("ath10k: reset chip before reading chip_id in probe")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 262a84f67f62..1f770ac28df4 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2684,7 +2684,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	if (!ath10k_pci_chip_is_supported(pdev->device, chip_id)) {
 		ath10k_err(ar, "device %04x with chip_id %08x isn't supported\n",
 			   pdev->device, chip_id);
-		goto err_sleep;
+		goto err_free_irq;
 	}
 
 	ret = ath10k_core_register(ar, chip_id);
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
