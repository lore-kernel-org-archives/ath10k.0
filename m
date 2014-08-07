Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJlO-00029m-SN
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:13:35 +0000
Received: by mail-wi0-f173.google.com with SMTP id f8so10220359wiw.12
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:13:11 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 6/6] ath10k: move fw init print
Date: Thu,  7 Aug 2014 11:03:32 +0200
Message-Id: <1407402212-29809-7-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
References: <1407402212-29809-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Firmware probing is done only once when driver is
registered and firmware version is guaranteed to
remain the same until driver is unregistered.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 8eae2aa..b5161c8 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -816,24 +816,6 @@ int ath10k_core_start(struct ath10k *ar)
 
 	INIT_LIST_HEAD(&ar->arvifs);
 
-	if (!test_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags)) {
-		ath10k_info("%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d\n",
-			    ar->hw_params.name,
-			    ar->target_version,
-			    ar->chip_id,
-			    ar->hw->wiphy->fw_version,
-			    ar->fw_api,
-			    ar->htt.target_version_major,
-			    ar->htt.target_version_minor);
-		ath10k_info("debug %d debugfs %d tracing %d dfs %d\n",
-			    config_enabled(CONFIG_ATH10K_DEBUG),
-			    config_enabled(CONFIG_ATH10K_DEBUGFS),
-			    config_enabled(CONFIG_ATH10K_TRACING),
-			    config_enabled(CONFIG_ATH10K_DFS_CERTIFIED));
-	}
-
-	__set_bit(ATH10K_FLAG_FIRST_BOOT_DONE, &ar->dev_flags);
-
 	return 0;
 
 err_hif_stop:
@@ -938,6 +920,20 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		return ret;
 	}
 
+	ath10k_info("%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d\n",
+		    ar->hw_params.name,
+		    ar->target_version,
+		    ar->chip_id,
+		    ar->hw->wiphy->fw_version,
+		    ar->fw_api,
+		    ar->htt.target_version_major,
+		    ar->htt.target_version_minor);
+	ath10k_info("debug %d debugfs %d tracing %d dfs %d\n",
+		    config_enabled(CONFIG_ATH10K_DEBUG),
+		    config_enabled(CONFIG_ATH10K_DEBUGFS),
+		    config_enabled(CONFIG_ATH10K_TRACING),
+		    config_enabled(CONFIG_ATH10K_DFS_CERTIFIED));
+
 	ath10k_core_stop(ar);
 
 	mutex_unlock(&ar->conf_mutex);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
