Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJM4k-0000le-Qu
 for ath10k@lists.infradead.org; Tue, 10 Sep 2013 11:25:44 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSW004KIQE07GJ0@mailout1.samsung.com> for
 ath10k@lists.infradead.org; Tue, 10 Sep 2013 20:25:12 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
References: <00b101ceae16$ecb87c30$c6297490$%han@samsung.com>
In-reply-to: <00b101ceae16$ecb87c30$c6297490$%han@samsung.com>
Subject: [PATCH 06/12] wireless: ath10k: remove unnecessary pci_set_drvdata()
Date: Tue, 10 Sep 2013 20:25:11 +0900
Message-id: <00b701ceae18$69cd1860$3d674920$%han@samsung.com>
MIME-version: 1.0
Content-language: ko
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
To: "'John W. Linville'" <linville@tuxdriver.com>
Cc: 'Kalle Valo' <kvalo@qca.qualcomm.com>, 'Jingoo Han' <jg1.han@samsung.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

The driver core clears the driver data to NULL after device_release
or on probe failure. Thus, it is not needed to manually clear the
device driver data to NULL.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index e2f9ef5..5ef0422 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2414,7 +2414,6 @@ err_region:
 err_device:
 	pci_disable_device(pdev);
 err_ar:
-	pci_set_drvdata(pdev, NULL);
 	ath10k_core_destroy(ar);
 err_ar_pci:
 	/* call HIF PCI free here */
@@ -2442,7 +2441,6 @@ static void ath10k_pci_remove(struct pci_dev *pdev)
 
 	ath10k_core_unregister(ar);
 
-	pci_set_drvdata(pdev, NULL);
 	pci_iounmap(pdev, ar_pci->mem);
 	pci_release_region(pdev, BAR_NUM);
 	pci_clear_master(pdev);
-- 
1.7.10.4



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
