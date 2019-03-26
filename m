Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8iOu-0004IE-Hq
 for ath10k@lists.infradead.org; Tue, 26 Mar 2019 09:29:48 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCHv5 4/9] nl80211: Add netlink attribute to enable/disable RTS_CTS
Date: Tue, 26 Mar 2019 14:59:05 +0530
Message-Id: <1553592550-15282-5-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1553592550-15282-1-git-send-email-tamizhr@codeaurora.org>
References: <1553592550-15282-1-git-send-email-tamizhr@codeaurora.org>
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
To: johannes@sipsolutions.net, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Tamizh chelvam <tamizhr@codeaurora.org>

Introduce NL80211_ATTR_TID_CONFIG_RTSCTS_CTRL in nl80211_attr_tid_config
to accept TID specific RTS_CTS enable/disable configuration
through NL80211_CMD_SET_TID_CONFIG command. TID for which the
RTS_CTS control configuration is to be applied is passed in
NL80211_ATTR_TID_CONFIG_TID attribute. When the user-space wants this
configuration peer specific rather than being applied for all the
connected stations, MAC address of the peer can be passed in
NL80211_ATTR_MAC attribute.

Driver supporting this feature should advertise
NL80211_EXT_FEATURE_PER_TID_RTSCTS_CTRL and supporting per-STA data TID
RTS_CTS configuration should advertise NL80211_EXT_FEATURE_PER_STA_RTSCTS_CTRL.

Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
---
 include/net/cfg80211.h       |    3 +++
 include/uapi/linux/nl80211.h |   22 ++++++++++++++++++++++
 net/wireless/nl80211.c       |   17 +++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index aa0f44c..86dee3d 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -513,6 +513,7 @@ enum ieee80211_tid_conf_mask {
 	IEEE80211_TID_CONF_NOACK	= BIT(0),
 	IEEE80211_TID_CONF_RETRY	= BIT(1),
 	IEEE80211_TID_CONF_AMPDU	= BIT(2),
+	IEEE80211_TID_CONF_RTSCTS	= BIT(3),
 };
 
 /**
@@ -524,6 +525,7 @@ enum ieee80211_tid_conf_mask {
  * @retry_long: retry count value
  * @retry_short: retry count value
  * @ampdu: Enable/Disable aggregation
+ * @rtscts: Enable/Disable RTS/CTS
  */
 struct ieee80211_tid_cfg {
 	u8 tid;
@@ -532,6 +534,7 @@ struct ieee80211_tid_cfg {
 	int retry_long;
 	int retry_short;
 	u8 ampdu;
+	u8 rtscts;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index f94651d..996b4d4 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -4630,6 +4630,21 @@ enum nl80211_tid_config {
  *	NL80211_EXT_FEATURE_PER_TID_AMPDU_CTRL and supporting per station
  *	aggregation configuration should advertise
  *	NL80211_EXT_FEATURE_PER_STA_AMPDU_CTRL.
+ * @NL80211_ATTR_TID_CONFIG_RTSCTS_CTRL: Enable/Disable RTS_CTS for the TID
+ *	specified in %%NL80211_ATTR_TID_CONFIG_TID. It is u8 type, if the
+ *	peer MAC address is passed in %NL80211_ATTR_MAC, then this
+ *	configuration is applied to the data frame for the tid to that
+ *	connected station.
+ *	Station specific RTS_CTS configuration is valid only for STA's
+ *	current connection. i.e. the configuration will be reset to default when
+ *	the station connects back after disconnection/roaming.
+ *	when user-space does not include %NL80211_ATTR_MAC, this configuration
+ *	should be treated as per-netdev configuration. This configuration will
+ *	be cleared when the interface goes down and on the disconnection from a
+ *	BSS. Driver supporting this feature should advertise
+ *	NL80211_EXT_FEATURE_PER_TID_RTSCTS_CTRL and supporting per station
+ *	RTS_CTS configuration should advertise
+ *	NL80211_EXT_FEATURE_PER_STA_RTSCTS_CTRL.
  */
 enum nl80211_attr_tid_config {
 	__NL80211_ATTR_TID_INVALID,
@@ -4639,6 +4654,7 @@ enum nl80211_attr_tid_config {
 	NL80211_ATTR_TID_CONFIG_RETRY_SHORT,
 	NL80211_ATTR_TID_CONFIG_RETRY_LONG,
 	NL80211_ATTR_TID_CONFIG_AMPDU_CTRL,
+	NL80211_ATTR_TID_CONFIG_RTSCTS_CTRL,
 
 	/* keep last */
 	__NL80211_ATTR_TID_CONFIG_AFTER_LAST,
@@ -5457,6 +5473,10 @@ enum nl80211_feature_flags {
  *	aggregation control(enable/disable).
  * @NL80211_EXT_FEATURE_PER_STA_AMPDU_CTRL: Driver supports per STA
  *	specific TID aggregation control(enable/disable).
+ * @NL80211_EXT_FEATURE_PER_TID_RTSCTS_CTRL: Driver supports TID specific
+ *	RTS_CTS control(enable/disable).
+ * @NL80211_EXT_FEATURE_PER_STA_RTSCTS_CTRL: Driver supports STA specific
+ *	RTS_CTS control(enable/disable).
  *
  * @NUM_NL80211_EXT_FEATURES: number of extended features.
  * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
@@ -5505,6 +5525,8 @@ enum nl80211_ext_feature_index {
 	NL80211_EXT_FEATURE_PER_STA_RETRY_CONFIG,
 	NL80211_EXT_FEATURE_PER_TID_AMPDU_CTRL,
 	NL80211_EXT_FEATURE_PER_STA_AMPDU_CTRL,
+	NL80211_EXT_FEATURE_PER_TID_RTSCTS_CTRL,
+	NL80211_EXT_FEATURE_PER_STA_RTSCTS_CTRL,
 
 	/* add new features before the definition below */
 	NUM_NL80211_EXT_FEATURES,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index fb2bb01..9e5c58c 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -290,6 +290,8 @@ static int validate_ie_attr(const struct nlattr *attr,
 	[NL80211_ATTR_TID_CONFIG_RETRY_LONG] = NLA_POLICY_MIN(NLA_U8, 1),
 	[NL80211_ATTR_TID_CONFIG_AMPDU_CTRL] =
 			NLA_POLICY_MAX(NLA_U8, NL80211_TID_CONFIG_DISABLE),
+	[NL80211_ATTR_TID_CONFIG_RTSCTS_CTRL] =
+			NLA_POLICY_MAX(NLA_U8, NL80211_TID_CONFIG_DISABLE),
 };
 
 const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
@@ -13337,6 +13339,21 @@ static int parse_tid_conf(struct cfg80211_registered_device *rdev,
 		tid_conf->ampdu =
 			nla_get_u8(attrs[NL80211_ATTR_TID_CONFIG_AMPDU_CTRL]);
 	}
+
+	if (attrs[NL80211_ATTR_TID_CONFIG_RTSCTS_CTRL]) {
+		if (!wiphy_ext_feature_isset(&rdev->wiphy,
+				NL80211_EXT_FEATURE_PER_TID_RTSCTS_CTRL))
+			return -ENOTSUPP;
+
+		if (peer && !wiphy_ext_feature_isset(&rdev->wiphy,
+				NL80211_EXT_FEATURE_PER_STA_RTSCTS_CTRL))
+			return -ENOTSUPP;
+
+		tid_conf->tid_conf_mask |= IEEE80211_TID_CONF_RTSCTS;
+		tid_conf->rtscts =
+			nla_get_u8(attrs[NL80211_ATTR_TID_CONFIG_RTSCTS_CTRL]);
+	}
+
 	return 0;
 }
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
