Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1chcaQ-0007AG-DU
 for ath10k@lists.infradead.org; Sat, 25 Feb 2017 13:40:37 +0000
From: <c_traja@qti.qualcomm.com>
Subject: [PATCHv2 4/4] mac80211: Add support to set/update btcoex priority
 value
Date: Sat, 25 Feb 2017 19:07:53 +0530
Message-ID: <1488029873-14600-5-git-send-email-c_traja@qti.qualcomm.com>
In-Reply-To: <1488029873-14600-1-git-send-email-c_traja@qti.qualcomm.com>
References: <1488029873-14600-1-git-send-email-c_traja@qti.qualcomm.com>
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
To: linux-wireless@vger.kernel.org
Cc: Tamizh chelvam <c_traja@qti.qualcomm.com>, johannes@sipsolutions.net, ath10k@lists.infradead.org

From: Tamizh chelvam <c_traja@qti.qualcomm.com>

This patch add support to set or modify the btcoex priority value
for the driver which has btcoex priority feature support.

Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
---
 include/net/mac80211.h    |    6 ++++--
 net/mac80211/cfg.c        |    5 +++--
 net/mac80211/driver-ops.h |    7 ++++---
 net/mac80211/trace.h      |   12 +++++++++---
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 57717f1..33890b4 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3448,7 +3448,8 @@ enum ieee80211_reconfig_type {
  *	ieee80211_nan_func_terminated() with
  *	NL80211_NAN_FUNC_TERM_REASON_USER_REQUEST reason code upon removal.
  * @set_btcoex_: Called when BTCOEX is enabled/disabled, use
- *     this callback to enable or disable btcoex.
+ *     this callback to enable or disable btcoex and use this callback to
+ *     set btcoex_priority. BTCOEX should be enabled to set this priority.
  */
 struct ieee80211_ops {
 	void (*tx)(struct ieee80211_hw *hw,
@@ -3730,7 +3731,8 @@ struct ieee80211_ops {
 	void (*del_nan_func)(struct ieee80211_hw *hw,
 			    struct ieee80211_vif *vif,
 			    u8 instance_id);
-	int (*set_btcoex)(struct ieee80211_hw *hw, bool enabled);
+	int (*set_btcoex)(struct ieee80211_hw *hw, bool enabled,
+			  int btcoex_priority);
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 7e17eff..c640e7d 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -3574,11 +3574,12 @@ static int ieee80211_set_multicast_to_unicast(struct wiphy *wiphy,
 	return 0;
 }
 
-static int ieee80211_set_btcoex(struct wiphy *wiphy, bool enabled)
+static int ieee80211_set_btcoex(struct wiphy *wiphy, bool enabled,
+				int btcoex_priority)
 {
 	struct ieee80211_local *local = wiphy_priv(wiphy);
 
-	return drv_set_btcoex(local, enabled);
+	return drv_set_btcoex(local, enabled, btcoex_priority);
 }
 
 const struct cfg80211_ops mac80211_config_ops = {
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index 16d9c98..3826202 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1249,13 +1249,14 @@ static inline void drv_del_nan_func(struct ieee80211_local *local,
 }
 
 static inline int drv_set_btcoex(struct ieee80211_local *local,
-				 bool enabled)
+				 bool enabled, int btcoex_priority)
 {
 	int ret = -EOPNOTSUPP;
 
-	trace_drv_set_btcoex(local, enabled);
+	trace_drv_set_btcoex(local, enabled, btcoex_priority);
 	if (local->ops->set_btcoex)
-		ret = local->ops->set_btcoex(&local->hw, enabled);
+		ret = local->ops->set_btcoex(&local->hw, enabled,
+					     btcoex_priority);
 
 	trace_drv_return_int(local, ret);
 
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index 0d9b5a0..c3efca9 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -743,17 +743,23 @@
 );
 
 TRACE_EVENT(drv_set_btcoex,
-	TP_PROTO(struct ieee80211_local *local, bool enabled),
-	TP_ARGS(local, enabled),
+	TP_PROTO(struct ieee80211_local *local, bool enabled,
+		 int btcoex_priority),
+	TP_ARGS(local, enabled, btcoex_priority),
 	TP_STRUCT__entry(
 		LOCAL_ENTRY
 		__field(bool, enabled)
+		__field(int, btcoex_priority)
 	),
 	TP_fast_assign(
 		LOCAL_ASSIGN;
 		__entry->enabled = enabled;
+		__entry->btcoex_priority = btcoex_priority;
 	),
-	TP_printk(LOCAL_PR_FMT " enabled:%d", LOCAL_PR_ARG, __entry->enabled)
+	TP_printk(
+		LOCAL_PR_FMT " enabled:%d btcoex_priority :%d",
+		LOCAL_PR_ARG, __entry->enabled, __entry->btcoex_priority
+	)
 );
 
 TRACE_EVENT(drv_set_coverage_class,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
