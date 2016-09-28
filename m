Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpOko-0006fA-26
 for ath10k@lists.infradead.org; Wed, 28 Sep 2016 23:59:11 +0000
From: Thomas Pedersen <twp@qca.qualcomm.com>
Subject: [PATCH 1/4] mac80211: add offset_tsf driver op
Date: Wed, 28 Sep 2016 16:56:28 -0700
Message-ID: <20160928235631.9197-2-twp@qca.qualcomm.com>
In-Reply-To: <20160928235631.9197-1-twp@qca.qualcomm.com>
References: <20160928235631.9197-1-twp@qca.qualcomm.com>
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
To: ath10k <ath10k@lists.infradead.org>
Cc: Thomas Pedersen <twp@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>

Allows ie. mesh sync code to make incremental TSF
adjustments, avoiding any uncertainty introduced by delay
in programming absolute TSF.

Signed-off-by: Thomas Pedersen <twp@qca.qualcomm.com>
---
 include/net/mac80211.h        |  8 ++++++++
 net/mac80211/debugfs_netdev.c | 12 +++++++++---
 net/mac80211/driver-ops.c     | 15 +++++++++++++++
 net/mac80211/driver-ops.h     |  3 +++
 net/mac80211/mesh_sync.c      | 10 +++++++---
 net/mac80211/trace.h          | 26 ++++++++++++++++++++++++++
 6 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 5296100..6312cbda9f 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3166,6 +3166,12 @@ enum ieee80211_reconfig_type {
  *	required function.
  *	The callback can sleep.
  *
+ * @offset_tsf: Offset the TSF timer by the specified value in the
+ *	firmware/hardware.  Preferred to set_tsf as it avoids delay between
+ *	calling set_tsf() and hardware getting programmed, which will show up
+ *	as TSF delay. Is not a required function.
+ *	The callback can sleep.
+ *
  * @reset_tsf: Reset the TSF timer and allow firmware/hardware to synchronize
  *	with other STAs in the IBSS. This is only used in IBSS mode. This
  *	function is optional if the firmware/hardware takes full care of
@@ -3531,6 +3537,8 @@ struct ieee80211_ops {
 	u64 (*get_tsf)(struct ieee80211_hw *hw, struct ieee80211_vif *vif);
 	void (*set_tsf)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			u64 tsf);
+	void (*offset_tsf)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			   s64 offset);
 	void (*reset_tsf)(struct ieee80211_hw *hw, struct ieee80211_vif *vif);
 	int (*tx_last_beacon)(struct ieee80211_hw *hw);
 	int (*ampdu_action)(struct ieee80211_hw *hw,
diff --git a/net/mac80211/debugfs_netdev.c b/net/mac80211/debugfs_netdev.c
index 5d35c0f..bcec124 100644
--- a/net/mac80211/debugfs_netdev.c
+++ b/net/mac80211/debugfs_netdev.c
@@ -556,9 +556,15 @@ static ssize_t ieee80211_if_parse_tsf(
 		ret = kstrtoull(buf, 10, &tsf);
 		if (ret < 0)
 			return ret;
-		if (tsf_is_delta)
-			tsf = drv_get_tsf(local, sdata) + tsf_is_delta * tsf;
-		if (local->ops->set_tsf) {
+		if (tsf_is_delta && local->ops->offset_tsf) {
+			drv_offset_tsf(local, sdata, tsf_is_delta * tsf);
+			wiphy_info(local->hw.wiphy,
+				   "debugfs offset TSF by %018lld\n",
+				   tsf_is_delta * tsf);
+		} else if (local->ops->set_tsf) {
+			if (tsf_is_delta)
+				tsf = drv_get_tsf(local, sdata) +
+				      tsf_is_delta * tsf;
 			drv_set_tsf(local, sdata, tsf);
 			wiphy_info(local->hw.wiphy,
 				   "debugfs set TSF to %#018llx\n", tsf);
diff --git a/net/mac80211/driver-ops.c b/net/mac80211/driver-ops.c
index c701b64..bb886e7 100644
--- a/net/mac80211/driver-ops.c
+++ b/net/mac80211/driver-ops.c
@@ -215,6 +215,21 @@ void drv_set_tsf(struct ieee80211_local *local,
 	trace_drv_return_void(local);
 }
 
+void drv_offset_tsf(struct ieee80211_local *local,
+		    struct ieee80211_sub_if_data *sdata,
+		    s64 offset)
+{
+	might_sleep();
+
+	if (!check_sdata_in_driver(sdata))
+		return;
+
+	trace_drv_offset_tsf(local, sdata, offset);
+	if (local->ops->offset_tsf)
+		local->ops->offset_tsf(&local->hw, &sdata->vif, offset);
+	trace_drv_return_void(local);
+}
+
 void drv_reset_tsf(struct ieee80211_local *local,
 		   struct ieee80211_sub_if_data *sdata)
 {
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index fe35a1c..f47781ab1 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -568,6 +568,9 @@ u64 drv_get_tsf(struct ieee80211_local *local,
 void drv_set_tsf(struct ieee80211_local *local,
 		 struct ieee80211_sub_if_data *sdata,
 		 u64 tsf);
+void drv_offset_tsf(struct ieee80211_local *local,
+		    struct ieee80211_sub_if_data *sdata,
+		    s64 offset);
 void drv_reset_tsf(struct ieee80211_local *local,
 		   struct ieee80211_sub_if_data *sdata);
 
diff --git a/net/mac80211/mesh_sync.c b/net/mac80211/mesh_sync.c
index 64bc22a..22ca43c 100644
--- a/net/mac80211/mesh_sync.c
+++ b/net/mac80211/mesh_sync.c
@@ -70,9 +70,13 @@ void mesh_sync_adjust_tbtt(struct ieee80211_sub_if_data *sdata)
 	}
 	spin_unlock_bh(&ifmsh->sync_offset_lock);
 
-	tsf = drv_get_tsf(local, sdata);
-	if (tsf != -1ULL)
-		drv_set_tsf(local, sdata, tsf + tsfdelta);
+	if (local->ops->offset_tsf) {
+		drv_offset_tsf(local, sdata, tsfdelta);
+	} else {
+		tsf = drv_get_tsf(local, sdata);
+		if (tsf != -1ULL)
+			drv_set_tsf(local, sdata, tsf + tsfdelta);
+	}
 }
 
 static void mesh_sync_offset_rx_bcn_presp(struct ieee80211_sub_if_data *sdata,
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index 77e4c53..10e9d4b 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -984,6 +984,32 @@ TRACE_EVENT(drv_set_tsf,
 	)
 );
 
+TRACE_EVENT(drv_offset_tsf,
+	TP_PROTO(struct ieee80211_local *local,
+		 struct ieee80211_sub_if_data *sdata,
+		 s64 offset),
+
+	TP_ARGS(local, sdata, offset),
+
+	TP_STRUCT__entry(
+		LOCAL_ENTRY
+		VIF_ENTRY
+		__field(s64, tsf_offset)
+	),
+
+	TP_fast_assign(
+		LOCAL_ASSIGN;
+		VIF_ASSIGN;
+		__entry->tsf_offset = offset;
+	),
+
+	TP_printk(
+		LOCAL_PR_FMT  VIF_PR_FMT  " tsf offset:%lld",
+		LOCAL_PR_ARG, VIF_PR_ARG,
+		(unsigned long long)__entry->tsf_offset
+	)
+);
+
 DEFINE_EVENT(local_sdata_evt, drv_reset_tsf,
 	TP_PROTO(struct ieee80211_local *local,
 		 struct ieee80211_sub_if_data *sdata),
-- 
2.10.0.297.gf6727b0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
