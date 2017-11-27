Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from chaos.universe-factory.net ([31.24.148.19])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJNeN-0007AO-4j
 for ath10k@lists.infradead.org; Mon, 27 Nov 2017 17:57:01 +0000
From: Matthias Schiffer <mschiffer@universe-factory.net>
Subject: [PATCH 1/3] ath9k: remove stray backslash in Makefile
Date: Mon, 27 Nov 2017 18:56:21 +0100
Message-Id: <e60138924429ca428efc6e3154606887b3bc5201.1511804622.git.mschiffer@universe-factory.net>
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
To: kvalo@qca.qualcomm.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, nbd@nbd.name

Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
 drivers/net/wireless/ath/ath9k/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/Makefile b/drivers/net/wireless/ath/ath9k/Makefile
index 36a40ffdce15..90e4a341076c 100644
--- a/drivers/net/wireless/ath/ath9k/Makefile
+++ b/drivers/net/wireless/ath/ath9k/Makefile
@@ -59,7 +59,7 @@ obj-$(CONFIG_ATH9K_HW) += ath9k_hw.o
 obj-$(CONFIG_ATH9K_COMMON) += ath9k_common.o
 ath9k_common-y:=	common.o \
 			common-init.o \
-			common-beacon.o \
+			common-beacon.o
 
 ath9k_common-$(CONFIG_ATH9K_COMMON_DEBUG) += common-debug.o \
 					     common-spectral.o
-- 
2.15.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
