Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ab7UR-0003ux-G5
 for ath10k@lists.infradead.org; Wed, 02 Mar 2016 14:11:01 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH 1/2] ath10k: Add support for ath10k_sta_statistics support
Date: Wed, 2 Mar 2016 19:40:12 +0530
Message-ID: <1456927812-32193-1-git-send-email-mohammed@qca.qualcomm.com>
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
Cc: mohammed@codeaurora.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, kvalo@codeaurora.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Enable support for 'drv_sta_statistics' callback.
Export rx_duration support if available to cfg80211/nl80211

This can also act as a placeholder for any new per STA stats support

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
Dependencies:

1. cfg80211/nl80211: Add support for NL80211_STA_INFO_RX_DURATION
2. iw: Add support for NL80211_STA_INFO_RX_DURATION netlink
 attribute

 drivers/net/wireless/ath/ath10k/debug.h       |    4 ++++
 drivers/net/wireless/ath/ath10k/debugfs_sta.c |   22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c         |    1 +
 3 files changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.h b/drivers/net/wireless/ath/ath10k/debug.h
index 6206edd..01c500f 100644
--- a/drivers/net/wireless/ath/ath10k/debug.h
+++ b/drivers/net/wireless/ath/ath10k/debug.h
@@ -155,6 +155,10 @@ ath10k_debug_get_new_fw_crash_data(struct ath10k *ar)
 void ath10k_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir);
 void ath10k_sta_update_rx_duration(struct ath10k *ar, struct list_head *peer);
+void ath10k_sta_statistics(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta,
+			   struct station_info *sinfo);
+
 #else
 static inline void ath10k_sta_update_rx_duration(struct ath10k *ar,
 						 struct list_head *peer)
diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
index 67ef75b..8502cdb 100644
--- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
@@ -35,6 +35,28 @@ void ath10k_sta_update_rx_duration(struct ath10k *ar, struct list_head *head)
 	rcu_read_unlock();
 }
 
+void ath10k_sta_statistics(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			   struct ieee80211_sta *sta,
+			   struct station_info *sinfo)
+{
+	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
+	struct ath10k *ar = arsta->arvif->ar;
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state != ATH10K_STATE_ON ||
+	    ar->state != ATH10K_STATE_RESTARTED)
+		goto out;
+
+	if (!test_bit(WMI_SERVICE_PEER_STATS, ar->wmi.svc_map))
+		goto out;
+
+	sinfo->rx_duration = arsta->rx_duration;
+	sinfo->filled |= 1ULL << NL80211_STA_INFO_RX_DURATION;
+out:
+	mutex_unlock(&ar->conf_mutex);
+}
+
 static ssize_t ath10k_dbg_sta_read_aggr_mode(struct file *file,
 					     char __user *user_buf,
 					     size_t count, loff_t *ppos)
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index d5ef201..69a1dcf 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -6852,6 +6852,7 @@ static const struct ieee80211_ops ath10k_ops = {
 #endif
 #ifdef CONFIG_MAC80211_DEBUGFS
 	.sta_add_debugfs		= ath10k_sta_add_debugfs,
+	.sta_statistics			= ath10k_sta_statistics,
 #endif
 };
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
