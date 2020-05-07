Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWZTW-00033E-0r
 for ath10k@lists.infradead.org; Thu, 07 May 2020 05:53:42 +0000
From: Govind Singh <govinds@codeaurora.org>
Subject: [PATCH] ath10k: Remove experimental tag from ath10k Kconfig
Date: Thu,  7 May 2020 11:23:24 +0530
Message-Id: <20200507055324.15564-1-govinds@codeaurora.org>
MIME-Version: 1.0
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
To: ath10k@lists.infradead.org
Cc: Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

ath10k(sdio/snoc) is no longer experimental.
Remove experimental tag for SDIO/SNOC from ath10k Kconfig.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 6b3ff02a373d..b99fd0eff994 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -28,11 +28,10 @@ config ATH10K_AHB
 	  This module adds support for AHB bus
 
 config ATH10K_SDIO
-	tristate "Atheros ath10k SDIO support (EXPERIMENTAL)"
+	tristate "Atheros ath10k SDIO support"
 	depends on ATH10K && MMC
 	---help---
-	  This module adds experimental support for SDIO/MMC bus. Currently
-	  work in progress and will not fully work.
+	  This module adds support for SDIO/MMC bus.
 
 config ATH10K_USB
 	tristate "Atheros ath10k USB support (EXPERIMENTAL)"
@@ -42,7 +41,7 @@ config ATH10K_USB
 	  work in progress and will not fully work.
 
 config ATH10K_SNOC
-	tristate "Qualcomm ath10k SNOC support (EXPERIMENTAL)"
+	tristate "Qualcomm ath10k SNOC support"
 	depends on ATH10K
 	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_QMI_HELPERS
-- 
2.22.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
