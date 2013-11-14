Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x232.google.com ([2a00:1450:400c:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgsOw-0001Fs-BZ
 for ath10k@lists.infradead.org; Thu, 14 Nov 2013 08:35:46 +0000
Received: by mail-we0-f178.google.com with SMTP id u57so1089902wes.9
 for <ath10k@lists.infradead.org>; Thu, 14 Nov 2013 00:35:24 -0800 (PST)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH v2 3/3] ath10k: add debugfs file to control radar events
 blocking
Date: Thu, 14 Nov 2013 09:33:38 +0100
Message-Id: <1384418018-4973-3-git-send-email-marek.puzyniak@tieto.com>
In-Reply-To: <1384418018-4973-1-git-send-email-marek.puzyniak@tieto.com>
References: <1384418018-4973-1-git-send-email-marek.puzyniak@tieto.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Sometimes for DFS testing is required to stay on current channel even after
radar detected. This patch allows to enable/disable radar detected event to be
passed to mac80211.

By default radar detected event in not blocked.

To block it:
echo 1 > /sys/kernel/debug/ieee80211/phyX/ath10k/dfs_block_radar_events

To unblock again:
echo 0 > /sys/kernel/debug/ieee80211/phyX/ath10k/dfs_block_radar_events

Inform about blocking radar detected event even when logs are disabled
for throughput/performance reasons.

Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/core.h  | 1 +
 drivers/net/wireless/ath/ath10k/debug.c | 4 ++++
 drivers/net/wireless/ath/ath10k/wmi.c   | 8 ++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index d5fd74b..cdedcbf 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -409,6 +409,7 @@ struct ath10k {
 	bool monitor_present;
 	unsigned int filter_flags;
 	unsigned long dev_flags;
+	u32 dfs_block_radar_events;
 
 	struct wmi_pdev_set_wmm_params_arg wmm_params;
 	struct completion install_key_done;
diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 13705d4..6bdfad3 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -752,6 +752,10 @@ int ath10k_debug_create(struct ath10k *ar)
 				    ar->debug.debugfs_phy, ar,
 				    &fops_simulate_radar);
 
+		debugfs_create_bool("dfs_block_radar_events", S_IWUSR,
+				    ar->debug.debugfs_phy,
+				    &ar->dfs_block_radar_events);
+
 		debugfs_create_file("dfs_stats", S_IRUSR,
 				    ar->debug.debugfs_phy, ar,
 				    &fops_dfs_stats);
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index aea81d9..c654137 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1453,6 +1453,14 @@ static void ath10k_dfs_radar_report(struct ath10k *ar,
 
 	ath10k_dbg(ATH10K_DBG_REGULATORY, "dfs radar detected\n");
 	ATH10K_DFS_STAT_INC(ar, radar_detected);
+
+	/* Control radar events reporting in debugfs file
+	   dfs_block_radar_events */
+	if (ar->dfs_block_radar_events) {
+		ath10k_info("DFS Radar detected, but ignored as requested\n");
+		return;
+	}
+
 	ieee80211_radar_detected(ar->hw);
 }
 
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
