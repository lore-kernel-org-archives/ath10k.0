Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkDrt-0001he-8M
 for ath10k@lists.infradead.org; Thu, 08 Oct 2015 16:16:33 +0000
From: Jeff Johnson <jjohnson@qca.qualcomm.com>
Subject: [PATCH] ath10k: Cleanup ath10k_mac_register() error handling
Date: Thu,  8 Oct 2015 09:15:53 -0700
Message-Id: <1444320953-2154-1-git-send-email-jjohnson@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@qca.qualcomm.com>

The logic in the error-handling path of ath10k_mac_register() is
divergent from the logic in ath10k_mac_unregister().  Update the
ath10k_mac_register() error handling logic to align with the
ath10k_mac_unregister() logic.

Signed-off-by: Jeff Johnson <jjohnson@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 79490ad..a37aad3c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -7301,7 +7301,7 @@ int ath10k_mac_register(struct ath10k *ar)
 			    ath10k_reg_notifier);
 	if (ret) {
 		ath10k_err(ar, "failed to initialise regulatory: %i\n", ret);
-		goto err_free;
+		goto err_dfs_detector_exit;
 	}
 
 	ar->hw->wiphy->cipher_suites = cipher_suites;
@@ -7310,7 +7310,7 @@ int ath10k_mac_register(struct ath10k *ar)
 	ret = ieee80211_register_hw(ar->hw);
 	if (ret) {
 		ath10k_err(ar, "failed to register ieee80211: %d\n", ret);
-		goto err_free;
+		goto err_dfs_detector_exit;
 	}
 
 	if (!ath_is_world_regd(&ar->ath_common.regulatory)) {
@@ -7324,10 +7324,16 @@ int ath10k_mac_register(struct ath10k *ar)
 
 err_unregister:
 	ieee80211_unregister_hw(ar->hw);
+
+err_dfs_detector_exit:
+	if (config_enabled(CONFIG_ATH10K_DFS_CERTIFIED) && ar->dfs_detector)
+		ar->dfs_detector->exit(ar->dfs_detector);
+
 err_free:
 	kfree(ar->mac.sbands[IEEE80211_BAND_2GHZ].channels);
 	kfree(ar->mac.sbands[IEEE80211_BAND_5GHZ].channels);
 
+	SET_IEEE80211_DEV(ar->hw, NULL);
 	return ret;
 }
 
-- 
1.8.5.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
