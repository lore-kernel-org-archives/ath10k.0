Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqIyi-0005Hs-SE
 for ath10k@lists.infradead.org; Fri, 30 May 2014 09:19:57 +0000
Received: by mail-we0-f176.google.com with SMTP id q59so1636780wes.7
 for <ath10k@lists.infradead.org>; Fri, 30 May 2014 02:19:34 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: print Kconfig options
Date: Fri, 30 May 2014 11:19:23 +0200
Message-Id: <1401441563-9921-1-git-send-email-janusz.dziedzic@tieto.com>
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

Print Kconfig options enabled/disabled in the build.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 82017f5..68bed4e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -798,7 +798,7 @@ int ath10k_core_start(struct ath10k *ar)
 	ar->free_vdev_map = (1 << TARGET_NUM_VDEVS) - 1;
 	INIT_LIST_HEAD(&ar->arvifs);
 
-	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags))
+	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags)) {
 		ath10k_info("%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d\n",
 			    ar->hw_params.name,
 			    ar->target_version,
@@ -807,6 +807,12 @@ int ath10k_core_start(struct ath10k *ar)
 			    ar->fw_api,
 			    ar->htt.target_version_major,
 			    ar->htt.target_version_minor);
+		ath10k_info("debug %d debugfs %d tracing %d dfs %d\n",
+			    config_enabled(CONFIG_ATH10K_DEBUG),
+			    config_enabled(CONFIG_ATH10K_DEBUGFS),
+			    config_enabled(CONFIG_ATH10K_TRACING),
+			    config_enabled(CONFIG_ATH10K_DFS_CERTIFIED));
+	}
 
 	__set_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags);
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
