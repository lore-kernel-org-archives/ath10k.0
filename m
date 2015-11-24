Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1GuM-0003Hs-4g
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 16:57:34 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH v2] ath10k: Fix write permission on few debugfs files
Date: Tue, 24 Nov 2015 22:26:37 +0530
Message-ID: <1448384198-19964-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Fix write permission for few of the debugfs entries
which support write file operations as well.

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/debug.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 145c066..b502b7f 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2185,8 +2185,8 @@ int ath10k_debug_register(struct ath10k *ar)
 	debugfs_create_file("wmi_services", S_IRUSR, ar->debug.debugfs_phy, ar,
 			    &fops_wmi_services);
 
-	debugfs_create_file("simulate_fw_crash", S_IRUSR, ar->debug.debugfs_phy,
-			    ar, &fops_simulate_fw_crash);
+	debugfs_create_file("simulate_fw_crash", S_IRUSR | S_IWUSR,
+			    ar->debug.debugfs_phy, ar, &fops_simulate_fw_crash);
 
 	debugfs_create_file("fw_crash_dump", S_IRUSR, ar->debug.debugfs_phy,
 			    ar, &fops_fw_crash_dump);
@@ -2203,15 +2203,15 @@ int ath10k_debug_register(struct ath10k *ar)
 	debugfs_create_file("chip_id", S_IRUSR, ar->debug.debugfs_phy,
 			    ar, &fops_chip_id);
 
-	debugfs_create_file("htt_stats_mask", S_IRUSR, ar->debug.debugfs_phy,
-			    ar, &fops_htt_stats_mask);
+	debugfs_create_file("htt_stats_mask", S_IRUSR | S_IWUSR,
+			    ar->debug.debugfs_phy, ar, &fops_htt_stats_mask);
 
 	debugfs_create_file("htt_max_amsdu_ampdu", S_IRUSR | S_IWUSR,
 			    ar->debug.debugfs_phy, ar,
 			    &fops_htt_max_amsdu_ampdu);
 
-	debugfs_create_file("fw_dbglog", S_IRUSR, ar->debug.debugfs_phy,
-			    ar, &fops_fw_dbglog);
+	debugfs_create_file("fw_dbglog", S_IRUSR | S_IWUSR,
+			    ar->debug.debugfs_phy, ar, &fops_fw_dbglog);
 
 	debugfs_create_file("cal_data", S_IRUSR, ar->debug.debugfs_phy,
 			    ar, &fops_cal_data);
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
