Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dpZvg-0007kO-Bp
 for ath10k@lists.infradead.org; Wed, 06 Sep 2017 12:59:42 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ath10: mark PM functions as __maybe_unused
Date: Wed,  6 Sep 2017 14:58:53 +0200
Message-Id: <20170906125904.2588620-1-arnd@arndb.de>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Govind Singh <govinds@qti.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Colin Ian King <colin.king@canonical.com>, Ben Greear <greearb@candelatech.com>, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, Bartosz Markowski <bartosz.markowski@tieto.com>

When CONFIG_PM_SLEEP is disabled, we get a compile-time
warning:

drivers/net/wireless/ath/ath10k/pci.c:3417:12: error: 'ath10k_pci_pm_resume' defined but not used [-Werror=unused-function]
 static int ath10k_pci_pm_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/ath/ath10k/pci.c:3401:12: error: 'ath10k_pci_pm_suspend' defined but not used [-Werror=unused-function]
 static int ath10k_pci_pm_suspend(struct device *dev)

Rather than fixing the #ifdef, this just marks both functions
as __maybe_unused, which is a more robust way to do this.

Fixes: 32faa3f0ee50 ("ath10k: add the PCI PM core suspend/resume ops")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index bc1633945a56..195dafb98131 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3396,9 +3396,7 @@ static void ath10k_pci_remove(struct pci_dev *pdev)
 
 MODULE_DEVICE_TABLE(pci, ath10k_pci_id_table);
 
-#ifdef CONFIG_PM
-
-static int ath10k_pci_pm_suspend(struct device *dev)
+static __maybe_unused int ath10k_pci_pm_suspend(struct device *dev)
 {
 	struct ath10k *ar = dev_get_drvdata(dev);
 	int ret;
@@ -3414,7 +3412,7 @@ static int ath10k_pci_pm_suspend(struct device *dev)
 	return ret;
 }
 
-static int ath10k_pci_pm_resume(struct device *dev)
+static __maybe_unused int ath10k_pci_pm_resume(struct device *dev)
 {
 	struct ath10k *ar = dev_get_drvdata(dev);
 	int ret;
@@ -3433,7 +3431,6 @@ static int ath10k_pci_pm_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(ath10k_pci_pm_ops,
 			 ath10k_pci_pm_suspend,
 			 ath10k_pci_pm_resume);
-#endif
 
 static struct pci_driver ath10k_pci_driver = {
 	.name = "ath10k_pci",
-- 
2.9.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
