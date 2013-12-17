Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsxbq-0003FO-71
 for ath10k@lists.infradead.org; Tue, 17 Dec 2013 16:35:04 +0000
Received: by mail-ee0-f54.google.com with SMTP id e51so2522545eek.41
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2013 08:34:00 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: add DFS_CERTIFIED option
Date: Tue, 17 Dec 2013 17:33:45 +0100
Message-Id: <1387298026-2599-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Add Kconfig option that allow DFS functionality.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/Kconfig |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index 82e8088..a6f5285 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -37,3 +37,10 @@ config ATH10K_TRACING
 	---help---
 	  Select this to ath10k use tracing infrastructure.
 
+config ATH10K_DFS_CERTIFIED
+	bool "Atheros DFS support for certified platforms"
+	depends on ATH10K && CFG80211_CERTIFICATION_ONUS
+	default n
+	---help---
+	This option enables DFS support for initiating radiation on
+	ath10k.
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
