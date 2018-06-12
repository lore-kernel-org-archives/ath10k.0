Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSheO-0006U9-DS
 for ath10k@lists.infradead.org; Tue, 12 Jun 2018 11:39:49 +0000
Received: by mail-lf0-x241.google.com with SMTP id t134-v6so35494868lff.6
 for <ath10k@lists.infradead.org>; Tue, 12 Jun 2018 04:39:37 -0700 (PDT)
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH 1/2] ath10k: do not mix spaces and tabs in Kconfig
Date: Tue, 12 Jun 2018 13:39:05 +0200
Message-Id: <20180612113907.15043-1-niklas.cassel@linaro.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Do not mix spaces and tabs in Kconfig.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 84f071ac0d84..54ff5930126c 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -1,15 +1,15 @@
 config ATH10K
-        tristate "Atheros 802.11ac wireless cards support"
-        depends on MAC80211 && HAS_DMA
+	tristate "Atheros 802.11ac wireless cards support"
+	depends on MAC80211 && HAS_DMA
 	select ATH_COMMON
 	select CRC32
 	select WANT_DEV_COREDUMP
 	select ATH10K_CE
-        ---help---
-          This module adds support for wireless adapters based on
-          Atheros IEEE 802.11ac family of chipsets.
+	---help---
+	  This module adds support for wireless adapters based on
+	  Atheros IEEE 802.11ac family of chipsets.
 
-          If you choose to build a module, it'll be called ath10k.
+	  If you choose to build a module, it'll be called ath10k.
 
 config ATH10K_CE
 	bool
@@ -41,12 +41,12 @@ config ATH10K_USB
 	  work in progress and will not fully work.
 
 config ATH10K_SNOC
-        tristate "Qualcomm ath10k SNOC support (EXPERIMENTAL)"
-        depends on ATH10K && ARCH_QCOM
-        ---help---
-          This module adds support for integrated WCN3990 chip connected
-          to system NOC(SNOC). Currently work in progress and will not
-          fully work.
+	tristate "Qualcomm ath10k SNOC support (EXPERIMENTAL)"
+	depends on ATH10K && ARCH_QCOM
+	---help---
+	  This module adds support for integrated WCN3990 chip connected
+	  to system NOC(SNOC). Currently work in progress and will not
+	  fully work.
 
 config ATH10K_DEBUG
 	bool "Atheros ath10k debugging"
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
