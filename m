Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22b.google.com ([2a00:1450:4013:c00::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vb84t-0002hR-LC
 for ath10k@lists.infradead.org; Tue, 29 Oct 2013 12:07:20 +0000
Received: by mail-ee0-f43.google.com with SMTP id b47so2604765eek.30
 for <ath10k@lists.infradead.org>; Tue, 29 Oct 2013 05:06:56 -0700 (PDT)
From: Marek Puzyniak <marek.puzyniak@tieto.com>
Subject: [PATCH 3/3] ath10k: add debugfs file to control radar events blocking
Date: Tue, 29 Oct 2013 13:06:34 +0100
Message-Id: <1383048394-15256-3-git-send-email-marek.puzyniak@tieto.com>
In-Reply-To: <1383048394-15256-1-git-send-email-marek.puzyniak@tieto.com>
References: <1383048394-15256-1-git-send-email-marek.puzyniak@tieto.com>
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
index d4d0cdd..2cfe96b 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -749,6 +749,10 @@ int ath10k_debug_create(struct ath10k *ar)
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
index 8a7ebcc..8600465 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1456,6 +1456,14 @@ static void ath10k_dfs_radar_report(struct ath10k *ar,
 
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
