Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfoCz-0003Fz-EE
 for ath10k@lists.infradead.org; Mon, 20 Feb 2017 13:40:56 +0000
Received: by mail-lf0-x232.google.com with SMTP id g134so6506744lfe.1
 for <ath10k@lists.infradead.org>; Mon, 20 Feb 2017 05:40:32 -0800 (PST)
From: Marcin Rokicki <marcin.rokicki@tieto.com>
Subject: [PATCH] ath10k: use octal permission representation
Date: Mon, 20 Feb 2017 14:40:27 +0100
Message-Id: <1487598027-17324-1-git-send-email-marcin.rokicki@tieto.com>
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
Cc: Marcin Rokicki <marcin.rokicki@tieto.com>

Fix output from checkpatch.pl like:
 Symbolic permissions 'S_IRUSR' are not preferred.
 Consider using octal permissions '0400'.

Signed-off-by: Marcin Rokicki <marcin.rokicki@tieto.com>
---
 drivers/net/wireless/ath/ath10k/debug.c       | 88 +++++++++++++--------------
 drivers/net/wireless/ath/ath10k/debugfs_sta.c |  9 ++-
 drivers/net/wireless/ath/ath10k/spectral.c    |  6 +-
 drivers/net/wireless/ath/ath10k/thermal.c     |  2 +-
 4 files changed, 50 insertions(+), 55 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 35bdf1e..31bf71d 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -2438,86 +2438,82 @@ int ath10k_debug_register(struct ath10k *ar)
 	init_completion(&ar->debug.tpc_complete);
 	init_completion(&ar->debug.fw_stats_complete);
 
-	debugfs_create_file("fw_stats", S_IRUSR, ar->debug.debugfs_phy, ar,
+	debugfs_create_file("fw_stats", 0400, ar->debug.debugfs_phy, ar,
 			    &fops_fw_stats);
 
-	debugfs_create_file("fw_reset_stats", S_IRUSR, ar->debug.debugfs_phy,
-			    ar, &fops_fw_reset_stats);
+	debugfs_create_file("fw_reset_stats", 0400, ar->debug.debugfs_phy, ar,
+			    &fops_fw_reset_stats);
 
-	debugfs_create_file("wmi_services", S_IRUSR, ar->debug.debugfs_phy, ar,
+	debugfs_create_file("wmi_services", 0400, ar->debug.debugfs_phy, ar,
 			    &fops_wmi_services);
 
-	debugfs_create_file("simulate_fw_crash", S_IRUSR | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_simulate_fw_crash);
+	debugfs_create_file("simulate_fw_crash", 0600, ar->debug.debugfs_phy, ar,
+			    &fops_simulate_fw_crash);
 
-	debugfs_create_file("fw_crash_dump", S_IRUSR, ar->debug.debugfs_phy,
-			    ar, &fops_fw_crash_dump);
+	debugfs_create_file("fw_crash_dump", 0400, ar->debug.debugfs_phy, ar,
+			    &fops_fw_crash_dump);
 
-	debugfs_create_file("reg_addr", S_IRUSR | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_reg_addr);
+	debugfs_create_file("reg_addr", 0600, ar->debug.debugfs_phy, ar,
+			    &fops_reg_addr);
 
-	debugfs_create_file("reg_value", S_IRUSR | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_reg_value);
+	debugfs_create_file("reg_value", 0600, ar->debug.debugfs_phy, ar,
+			    &fops_reg_value);
 
-	debugfs_create_file("mem_value", S_IRUSR | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_mem_value);
+	debugfs_create_file("mem_value", 0600, ar->debug.debugfs_phy, ar,
+			    &fops_mem_value);
 
-	debugfs_create_file("chip_id", S_IRUSR, ar->debug.debugfs_phy,
-			    ar, &fops_chip_id);
+	debugfs_create_file("chip_id", 0400, ar->debug.debugfs_phy, ar,
+			    &fops_chip_id);
 
-	debugfs_create_file("htt_stats_mask", S_IRUSR | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_htt_stats_mask);
+	debugfs_create_file("htt_stats_mask", 0600, ar->debug.debugfs_phy, ar,
+			    &fops_htt_stats_mask);
 
-	debugfs_create_file("htt_max_amsdu_ampdu", S_IRUSR | S_IWUSR,
-			    ar->debug.debugfs_phy, ar,
+	debugfs_create_file("htt_max_amsdu_ampdu", 0600, ar->debug.debugfs_phy, ar,
 			    &fops_htt_max_amsdu_ampdu);
 
-	debugfs_create_file("fw_dbglog", S_IRUSR | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_fw_dbglog);
+	debugfs_create_file("fw_dbglog", 0600, ar->debug.debugfs_phy, ar,
+			    &fops_fw_dbglog);
 
-	debugfs_create_file("cal_data", S_IRUSR, ar->debug.debugfs_phy,
-			    ar, &fops_cal_data);
+	debugfs_create_file("cal_data", 0400, ar->debug.debugfs_phy, ar,
+			    &fops_cal_data);
 
-	debugfs_create_file("ani_enable", S_IRUSR | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_ani_enable);
+	debugfs_create_file("ani_enable", 0600, ar->debug.debugfs_phy, ar,
+			    &fops_ani_enable);
 
-	debugfs_create_file("nf_cal_period", S_IRUSR | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_nf_cal_period);
+	debugfs_create_file("nf_cal_period", 0600, ar->debug.debugfs_phy, ar,
+			    &fops_nf_cal_period);
 
 	if (IS_ENABLED(CONFIG_ATH10K_DFS_CERTIFIED)) {
-		debugfs_create_file("dfs_simulate_radar", S_IWUSR,
-				    ar->debug.debugfs_phy, ar,
-				    &fops_simulate_radar);
+		debugfs_create_file("dfs_simulate_radar", 0200, ar->debug.debugfs_phy,
+				ar, &fops_simulate_radar);
 
-		debugfs_create_bool("dfs_block_radar_events", S_IWUSR,
+		debugfs_create_bool("dfs_block_radar_events", 0200,
 				    ar->debug.debugfs_phy,
 				    &ar->dfs_block_radar_events);
 
-		debugfs_create_file("dfs_stats", S_IRUSR,
-				    ar->debug.debugfs_phy, ar,
+		debugfs_create_file("dfs_stats", 0400, ar->debug.debugfs_phy, ar,
 				    &fops_dfs_stats);
 	}
 
-	debugfs_create_file("pktlog_filter", S_IRUGO | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_pktlog_filter);
+	debugfs_create_file("pktlog_filter", 0644, ar->debug.debugfs_phy, ar,
+			    &fops_pktlog_filter);
 
-	debugfs_create_file("quiet_period", S_IRUGO | S_IWUSR,
-			    ar->debug.debugfs_phy, ar, &fops_quiet_period);
+	debugfs_create_file("quiet_period", 0644, ar->debug.debugfs_phy, ar,
+			    &fops_quiet_period);
 
-	debugfs_create_file("tpc_stats", S_IRUSR,
-			    ar->debug.debugfs_phy, ar, &fops_tpc_stats);
+	debugfs_create_file("tpc_stats", 0400, ar->debug.debugfs_phy, ar,
+			    &fops_tpc_stats);
 
 	if (test_bit(WMI_SERVICE_COEX_GPIO, ar->wmi.svc_map))
-		debugfs_create_file("btcoex", S_IRUGO | S_IWUSR,
-				    ar->debug.debugfs_phy, ar, &fops_btcoex);
+		debugfs_create_file("btcoex", 0644, ar->debug.debugfs_phy, ar,
+				    &fops_btcoex);
 
 	if (test_bit(WMI_SERVICE_PEER_STATS, ar->wmi.svc_map))
-		debugfs_create_file("peer_stats", S_IRUGO | S_IWUSR,
-				    ar->debug.debugfs_phy, ar,
+		debugfs_create_file("peer_stats", 0644, ar->debug.debugfs_phy, ar,
 				    &fops_peer_stats);
 
-	debugfs_create_file("fw_checksums", S_IRUSR,
-			    ar->debug.debugfs_phy, ar, &fops_fw_checksums);
+	debugfs_create_file("fw_checksums", 0400, ar->debug.debugfs_phy, ar,
+			    &fops_fw_checksums);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 7353e7e..d59ac6b 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -372,11 +372,10 @@ static const struct file_operations fops_peer_debug_trigger = {
 void ath10k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir)
 {
-	debugfs_create_file("aggr_mode", S_IRUGO | S_IWUSR, dir, sta,
-			    &fops_aggr_mode);
-	debugfs_create_file("addba", S_IWUSR, dir, sta, &fops_addba);
-	debugfs_create_file("addba_resp", S_IWUSR, dir, sta, &fops_addba_resp);
-	debugfs_create_file("delba", S_IWUSR, dir, sta, &fops_delba);
+	debugfs_create_file("aggr_mode", 0644, dir, sta, &fops_aggr_mode);
+	debugfs_create_file("addba", 0200, dir, sta, &fops_addba);
+	debugfs_create_file("addba_resp", 0200, dir, sta, &fops_addba_resp);
+	debugfs_create_file("delba", 0200, dir, sta, &fops_delba);
 	debugfs_create_file("peer_debug_trigger", 0600, dir, sta,
 			    &fops_peer_debug_trigger);
 }
diff --git a/drivers/net/wireless/ath/ath10k/spectral.c b/drivers/net/wireless/ath/ath10k/spectral.c
index c061d69..46471ed 100644
--- a/drivers/net/wireless/ath/ath10k/spectral.c
+++ b/drivers/net/wireless/ath/ath10k/spectral.c
@@ -536,15 +536,15 @@ int ath10k_spectral_create(struct ath10k *ar)
 						     1140, 2500,
 						     &rfs_spec_scan_cb, NULL);
 	debugfs_create_file("spectral_scan_ctl",
-			    S_IRUSR | S_IWUSR,
+			    0600,
 			    ar->debug.debugfs_phy, ar,
 			    &fops_spec_scan_ctl);
 	debugfs_create_file("spectral_count",
-			    S_IRUSR | S_IWUSR,
+			    0600,
 			    ar->debug.debugfs_phy, ar,
 			    &fops_spectral_count);
 	debugfs_create_file("spectral_bins",
-			    S_IRUSR | S_IWUSR,
+			    0600,
 			    ar->debug.debugfs_phy, ar,
 			    &fops_spectral_bins);
 
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index f719d7d..87948af 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -124,7 +124,7 @@ void ath10k_thermal_event_temperature(struct ath10k *ar, int temperature)
 	complete(&ar->thermal.wmi_sync);
 }
 
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, ath10k_thermal_show_temp,
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, ath10k_thermal_show_temp,
 			  NULL, 0);
 
 static struct attribute *ath10k_hwmon_attrs[] = {
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
