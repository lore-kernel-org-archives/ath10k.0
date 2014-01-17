Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4CAE-0006Vi-4d
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 16:21:00 +0000
From: Alexander Gordeev <agordeev@redhat.com>
Subject: [PATCH v2 8/9] ath10k: Use pci_enable_msi_range()
Date: Fri, 17 Jan 2014 17:02:22 +0100
Message-Id: <ad5cc6d6bdf4c8f5ce4681ec27674d07fbda089e.1389904167.git.agordeev@redhat.com>
In-Reply-To: <cover.1389904166.git.agordeev@redhat.com>
References: <cover.1389904166.git.agordeev@redhat.com>
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
To: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, Alexander Gordeev <agordeev@redhat.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

As result deprecation of MSI-X/MSI enablement functions
pci_enable_msix() and pci_enable_msi_block() all drivers
using these two interfaces need to be updated to use the
new pci_enable_msi_range() and pci_enable_msix_range()
interfaces.

This update also fixes a stylistic (naming and messaging only)
confusion of MSI-X vs multiple MSIs which are not the same.

Signed-off-by: Alexander Gordeev <agordeev@redhat.com>
Acked-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 9e86a81..873f50c 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2073,14 +2073,14 @@ static void ath10k_pci_tasklet(unsigned long data)
 	}
 }
 
-static int ath10k_pci_start_intr_msix(struct ath10k *ar, int num)
+static int ath10k_pci_start_intr_multi_msi(struct ath10k *ar, int num)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int ret;
 	int i;
 
-	ret = pci_enable_msi_block(ar_pci->pdev, num);
-	if (ret)
+	ret = pci_enable_msi_range(ar_pci->pdev, num, num);
+	if (ret < 0)
 		return ret;
 
 	ret = request_irq(ar_pci->pdev->irq + MSI_ASSIGN_FW,
@@ -2111,11 +2111,11 @@ static int ath10k_pci_start_intr_msix(struct ath10k *ar, int num)
 		}
 	}
 
-	ath10k_info("MSI-X interrupt handling (%d intrs)\n", num);
+	ath10k_info("Multi MSI interrupt handling (%d intrs)\n", num);
 	return 0;
 }
 
-static int ath10k_pci_start_intr_msi(struct ath10k *ar)
+static int ath10k_pci_start_intr_single_msi(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int ret;
@@ -2132,7 +2132,7 @@ static int ath10k_pci_start_intr_msi(struct ath10k *ar)
 		return ret;
 	}
 
-	ath10k_info("MSI interrupt handling\n");
+	ath10k_info("Single MSI interrupt handling\n");
 	return 0;
 }
 
@@ -2199,20 +2199,20 @@ static int ath10k_pci_start_intr(struct ath10k *ar)
 		num = 1;
 
 	if (num > 1) {
-		ret = ath10k_pci_start_intr_msix(ar, num);
+		ret = ath10k_pci_start_intr_multi_msi(ar, num);
 		if (ret == 0)
 			goto exit;
 
-		ath10k_warn("MSI-X didn't succeed (%d), trying MSI\n", ret);
+		ath10k_warn("Multi MSI failed (%d), trying single MSI\n", ret);
 		num = 1;
 	}
 
 	if (num == 1) {
-		ret = ath10k_pci_start_intr_msi(ar);
+		ret = ath10k_pci_start_intr_single_msi(ar);
 		if (ret == 0)
 			goto exit;
 
-		ath10k_warn("MSI didn't succeed (%d), trying legacy INTR\n",
+		ath10k_warn("Single MSI failed (%d), trying legacy INTR\n",
 			    ret);
 		num = 0;
 	}
-- 
1.7.7.6


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
