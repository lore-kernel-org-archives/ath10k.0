Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x235.google.com ([2a00:1450:400c:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPWXL-0004og-3L
 for ath10k@lists.infradead.org; Thu, 04 Sep 2014 12:53:15 +0000
Received: by mail-we0-f181.google.com with SMTP id x48so10058466wes.26
 for <ath10k@lists.infradead.org>; Thu, 04 Sep 2014 05:52:51 -0700 (PDT)
From: Matteo Croce <matteo@openwrt.org>
Subject: [PATCH] ath10k: ATH10K_DEBUGFS depends on DEBUG_FS
Date: Thu,  4 Sep 2014 14:51:09 +0200
Message-Id: <1409835069-2246-1-git-send-email-matteo@openwrt.org>
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
Cc: Matteo Croce <matteo@openwrt.org>, linux-wireless@vger.kernel.org

ATH10K_DEBUGFS must depend on DEBUG_FS, otherwise
ath10k will generate an invalid pointer on module load

Signed-off-by: Matteo Croce <matteo@openwrt.org>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 1053bb5..72acb82 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -24,7 +24,7 @@ config ATH10K_DEBUG
 
 config ATH10K_DEBUGFS
 	bool "Atheros ath10k debugfs support"
-	depends on ATH10K
+	depends on ATH10K && DEBUG_FS
 	select RELAY
 	---help---
 	  Enabled debugfs support
-- 
2.1.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
