Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eADNU-0003Ha-7Y
 for ath10k@lists.infradead.org; Thu, 02 Nov 2017 11:09:43 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ath10k: move pci suspend/resume functions
Date: Thu,  2 Nov 2017 12:08:53 +0100
Message-Id: <20171102110903.2886660-1-arnd@arndb.de>
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
Cc: Govind Singh <govinds@qti.qualcomm.com>, Ryan Hsu <ryanhsu@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Colin Ian King <colin.king@canonical.com>, Ben Greear <greearb@candelatech.com>, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>

The combination of two patches has led to a build failure:

drivers/net/wireless/ath/ath10k/pci.c: In function 'ath10k_pci_pm_suspend':
drivers/net/wireless/ath/ath10k/pci.c:3416:8: error: implicit declaration of function 'ath10k_pci_suspend'; did you mean 'ath10k_pci_pm_suspend'? [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath10k/pci.c: In function 'ath10k_pci_pm_resume':
drivers/net/wireless/ath/ath10k/pci.c:3428:8: error: implicit declaration of function 'ath10k_pci_resume'; did you mean 'ath10k_pci_pm_resume'? [-Werror=implicit-function-declaration]

This moves the functions outside of the now incorrect #ifdef.

Fixes: 96378bd2c6cd ("ath10k: fix core PCI suspend when WoWLAN is supported but disabled")
Fixes: 6af1de2e4ec4 ("ath10k: mark PM functions as __maybe_unused")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/pci.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index b18a9b690df4..6513edbd86e6 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2585,6 +2585,13 @@ static int ath10k_pci_hif_suspend(struct ath10k *ar)
 	return 0;
 }
 
+static int ath10k_pci_hif_resume(struct ath10k *ar)
+{
+	/* Nothing to do; the important stuff is in the driver resume. */
+	return 0;
+}
+#endif
+
 static int ath10k_pci_suspend(struct ath10k *ar)
 {
 	/* The grace timer can still be counting down and ar->ps_awake be true.
@@ -2597,12 +2604,6 @@ static int ath10k_pci_suspend(struct ath10k *ar)
 	return 0;
 }
 
-static int ath10k_pci_hif_resume(struct ath10k *ar)
-{
-	/* Nothing to do; the important stuff is in the driver resume. */
-	return 0;
-}
-
 static int ath10k_pci_resume(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
@@ -2627,7 +2628,6 @@ static int ath10k_pci_resume(struct ath10k *ar)
 
 	return ret;
 }
-#endif
 
 static bool ath10k_pci_validate_cal(void *data, size_t size)
 {
-- 
2.9.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
