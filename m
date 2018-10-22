Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEeRI-0004RN-Tn
 for ath10k@lists.infradead.org; Mon, 22 Oct 2018 17:56:34 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCH 3/4] mac80211: Add api to support configuring TID specific
 configuration
Date: Mon, 22 Oct 2018 23:25:17 +0530
Message-Id: <1540230918-27712-4-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
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
To: ath10k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, Tamizh chelvam <tamizhr@codeaurora.org>

Implement drv_set_tid_conf api to allow TID specific
retry count for data frames and aggregation enable/disable
configuration. If the retry_short and/or
retry_long value is default (-1), use the nedev wide retry
configuration for the station. This per-TID configuration
will be applied for all the connected stations when MAC is NULL.
enum ieee80211_tid_conf_change introduced to notify the the driver
about which configuration parameter got changed in
ieee80211_tid_conf structure.

Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
---
 include/net/mac80211.h    |   40 +++++++++++++++++++++++++
 net/mac80211/cfg.c        |   71 +++++++++++++++++++++++++++++++++++++++++++++
 net/mac80211/driver-ops.h |   16 ++++++++++
 net/mac80211/trace.h      |   34 ++++++++++++++++++++++
 4 files changed, 161 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index b6cc3e33..7fa7e25 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1478,6 +1478,35 @@ struct ieee80211_channel_switch {
 	u8 count;
 };
 
+/*
+ * enum ieee80211_tid_conf_change - TID change configuration notification flags
+ *
+ * These flags are used with the set_tid_conf() callback
+ * to indicate which TID configuration parameter changed.
+ *
+ * @TID_RETRY_CONF_CHANGED: retry configuration changed.
+ * @TID_AGGR_CONF_CHANGED: Aggregation config changed for the TID.
+ */
+enum ieee80211_tid_conf_change {
+	TID_RETRY_CONF_CHANGED		= BIT(0),
+	TID_AGGR_CONF_CHANGED		= BIT(1),
+};
+
+/*
+ * struct ieee80211_tid_conf - holds the tid configiuration data
+ * The information provided in the structure is required for the driver
+ * to configure TID specific configuration.
+ * @tid: TID number
+ * @retry_short: retry count value
+ * @retry_long: retry count value
+ * @aggr: enable/disable aggregation
+ */
+struct ieee80211_tid_conf {
+	u8 tid;
+	int retry_short;
+	int retry_long;
+	bool aggr;
+};
 /**
  * enum ieee80211_vif_flags - virtual interface flags
  *
@@ -1565,6 +1594,8 @@ struct ieee80211_vif {
 
 	bool txqs_stopped[IEEE80211_NUM_ACS];
 
+	struct ieee80211_tid_conf tid_conf;
+
 	/* must be last */
 	u8 drv_priv[0] __aligned(sizeof(void *));
 };
@@ -3632,6 +3663,10 @@ enum ieee80211_reconfig_type {
  *	level. Drivers mplementing this callback must take care of setting NoAck
  *	policy in QOS control field based on the configured TID bitmap.
  *	This callback may sleep.
+ * @set_tid_conf: TID specific configuration like number of retries for
+ *	the given TID. Apply this configuration for a particular station when
+ *	@sta is non-NULL. When @sta is NULL, the configuration will be for all
+ *	the connected clients in the vif. This callback may sleep.
  */
 struct ieee80211_ops {
 	void (*tx)(struct ieee80211_hw *hw,
@@ -3924,6 +3959,11 @@ struct ieee80211_ops {
 	int (*set_noack_tid_bitmap)(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif,
 				    struct ieee80211_sta *sta, int noack_map);
+	int (*set_tid_conf)(struct ieee80211_hw *hw,
+			    struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta,
+			    struct ieee80211_tid_conf *tid_conf,
+			    u8 changed);
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 02e6d49..786b561 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -3889,6 +3889,75 @@ static int ieee80211_get_txq_stats(struct wiphy *wiphy,
 	return drv_get_ftm_responder_stats(local, sdata, ftm_stats);
 }
 
+static int ieee80211_set_data_retry_count(struct wiphy *wiphy,
+					  struct net_device *dev,
+					  const u8 *peer, u8 tid,
+					  int retry_short, int retry_long)
+{
+	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
+	struct sta_info *sta;
+	int ret;
+
+	if (!sdata->local->ops->set_tid_conf)
+		return -EOPNOTSUPP;
+
+	sdata->vif.tid_conf.tid = tid;
+	sdata->vif.tid_conf.retry_short = retry_short;
+	sdata->vif.tid_conf.retry_long = retry_long;
+
+	if (!peer)
+		return drv_set_tid_conf(sdata->local, sdata, NULL,
+					TID_RETRY_CONF_CHANGED);
+
+	mutex_lock(&sdata->local->sta_mtx);
+
+	sta = sta_info_get_bss(sdata, peer);
+	if (!sta) {
+		mutex_unlock(&sdata->local->sta_mtx);
+		return -ENOENT;
+	}
+
+	ret = drv_set_tid_conf(sdata->local, sdata, &sta->sta,
+			       TID_RETRY_CONF_CHANGED);
+
+	mutex_unlock(&sdata->local->sta_mtx);
+	return ret;
+}
+
+static int ieee80211_set_tid_aggr_config(struct wiphy *wiphy,
+					 struct net_device *dev,
+					 const u8 *peer, u8 tid,
+					 bool aggr)
+{
+	struct ieee80211_sub_if_data *sdata = IEEE80211_DEV_TO_SUB_IF(dev);
+	struct sta_info *sta;
+	int ret;
+
+	if (!sdata->local->ops->set_tid_conf)
+		return -EOPNOTSUPP;
+
+	sdata->vif.tid_conf.tid = tid;
+	sdata->vif.tid_conf.aggr = aggr;
+
+	if (!peer)
+		return drv_set_tid_conf(sdata->local, sdata, NULL,
+					TID_AGGR_CONF_CHANGED);
+
+	mutex_lock(&sdata->local->sta_mtx);
+
+	sta = sta_info_get_bss(sdata, peer);
+	if (!sta) {
+		mutex_unlock(&sdata->local->sta_mtx);
+		return -ENOENT;
+	}
+
+	ret = drv_set_tid_conf(sdata->local, sdata, &sta->sta,
+			       TID_AGGR_CONF_CHANGED);
+
+	mutex_unlock(&sdata->local->sta_mtx);
+	return ret;
+}
+
 const struct cfg80211_ops mac80211_config_ops = {
 	.add_virtual_intf = ieee80211_add_iface,
 	.del_virtual_intf = ieee80211_del_iface,
@@ -3984,4 +4053,6 @@ static int ieee80211_get_txq_stats(struct wiphy *wiphy,
 	.tx_control_port = ieee80211_tx_control_port,
 	.get_txq_stats = ieee80211_get_txq_stats,
 	.get_ftm_responder_stats = ieee80211_get_ftm_responder_stats,
+	.set_data_retry_count = ieee80211_set_data_retry_count,
+	.set_tid_aggr_config = ieee80211_set_tid_aggr_config,
 };
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index ed9bd59..e717cc0 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1300,4 +1300,20 @@ static inline int drv_set_noack_tid_bitmap(struct ieee80211_local *local,
 	return ret;
 }
 
+static inline int drv_set_tid_conf(struct ieee80211_local *local,
+				   struct ieee80211_sub_if_data *sdata,
+				   struct ieee80211_sta *sta,
+				   u8 changed)
+{
+	int ret;
+
+	might_sleep();
+	trace_drv_set_tid_conf(local, sdata, sta, changed);
+	ret = local->ops->set_tid_conf(&local->hw, &sdata->vif, sta,
+				       &sdata->vif.tid_conf, changed);
+	trace_drv_return_int(local, ret);
+
+	return ret;
+}
+
 #endif /* __MAC80211_DRIVER_OPS */
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index e0e6c9a..5aed6ad 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -2648,6 +2648,40 @@ struct trace_switch_entry {
 	)
 );
 
+TRACE_EVENT(drv_set_tid_conf,
+	TP_PROTO(struct ieee80211_local *local,
+		 struct ieee80211_sub_if_data *sdata,
+		 struct ieee80211_sta *sta,
+		 u8 changed),
+
+	TP_ARGS(local, sdata, sta, changed),
+
+	TP_STRUCT__entry(
+		LOCAL_ENTRY
+		VIF_ENTRY
+		STA_ENTRY
+		__field(u8, tid)
+		__field(int, retry_short)
+		__field(int, retry_long)
+		__field(u8, changed)
+	),
+
+	TP_fast_assign(
+		LOCAL_ASSIGN;
+		VIF_ASSIGN;
+		STA_ASSIGN;
+		__entry->tid = sdata->vif.tid_conf.tid;
+		__entry->retry_short = sdata->vif.tid_conf.retry_short;
+		__entry->retry_long = sdata->vif.tid_conf.retry_long;
+		__entry->changed = changed;
+	),
+
+	TP_printk(
+		LOCAL_PR_FMT VIF_PR_FMT STA_PR_FMT " changed: %#x",
+		LOCAL_PR_ARG, VIF_PR_ARG, STA_PR_ARG, __entry->changed
+	)
+);
+
 #endif /* !__MAC80211_DRIVER_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
