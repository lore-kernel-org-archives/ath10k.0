Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x234.google.com ([2a00:1450:4013:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkXod-0002EM-4H
 for ath10k@lists.infradead.org; Wed, 14 May 2014 11:57:44 +0000
Received: by mail-ee0-f52.google.com with SMTP id e53so1294021eek.39
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 04:57:17 -0700 (PDT)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: get rid of pci_assign_resource() call from pci_probe
Date: Wed, 14 May 2014 13:57:07 +0200
Message-Id: <1400068627-4076-1-git-send-email-bartosz.markowski@tieto.com>
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

On ARM-based (MSM mach), the pci_assign_resource() is passing
some invalid pointers and leading to L2 cache errors,
what prevents the PCI communication completly.

So far I have not found this funtion to be directly called by
any other wifi driver and did not found this assigning needed
on any other platform. So removing it completly.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 66b1f30..9a579cd 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2602,18 +2602,6 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, ar);
 
-	/*
-	 * Without any knowledge of the Host, the Target may have been reset or
-	 * power cycled and its Config Space may no longer reflect the PCI
-	 * address space that was assigned earlier by the PCI infrastructure.
-	 * Refresh it now.
-	 */
-	ret = pci_assign_resource(pdev, BAR_NUM);
-	if (ret) {
-		ath10k_err("failed to assign PCI space: %d\n", ret);
-		goto err_ar;
-	}
-
 	ret = pci_enable_device(pdev);
 	if (ret) {
 		ath10k_err("failed to enable PCI device: %d\n", ret);
-- 
1.8.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
