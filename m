Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbQws-0001pA-Jc
 for ath10k@lists.infradead.org; Wed, 08 Feb 2017 12:02:11 +0000
From: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Subject: [PATCH v3 1/2] cfg80211: Add support to set tx power for a station
 associated
Date: Wed, 8 Feb 2017 17:26:24 +0530
Message-ID: <1486554984-25097-1-git-send-email-arnagara@qti.qualcomm.com>
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
Cc: johannes@sipsolutions.net, arnagara@codeaurora.org, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, ath10k@lists.infradead.org

This patch adds support to set transmit power setting type and transmit
power level attributes to NL80211_CMD_SET_STATION in order to facilitate
adjusting the transmit power level of a station associated to the AP.

The added attributes allow selection of automatic and limited transmit
power level, with the level defined in mBm format.

Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
---
v2:
	- refactor the shared code
	- "keep what you had" using STATION_PARAM_APPLY_* BIT
	- feature flag to let the user know if this feature is supported or not (Johannes)
v3:
	- fix the limitation of changing the txpwr after association (Ben Greear)

 include/net/cfg80211.h       |  6 ++++++
 include/uapi/linux/nl80211.h | 15 ++++++++++++++
 net/wireless/nl80211.c       | 48 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 814be4b..661e0ea 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -808,6 +808,7 @@ enum station_parameters_apply_mask {
 	STATION_PARAM_APPLY_UAPSD = BIT(0),
 	STATION_PARAM_APPLY_CAPABILITY = BIT(1),
 	STATION_PARAM_APPLY_PLINK_STATE = BIT(2),
+	STATION_PARAM_APPLY_STA_TXPOWER = BIT(3),
 };
 
 /**
@@ -849,6 +850,10 @@ enum station_parameters_apply_mask {
  * @opmode_notif: operating mode field from Operating Mode Notification
  * @opmode_notif_used: information if operating mode field is used
  * @support_p2p_ps: information if station supports P2P PS mechanism
+ * @txpwr: tx power (in mBm) to be used for sending data traffic. If tx power
+ *	is not provided, the default per-interface tx power setting will be
+ *	overriding. Driver should be picking up the lowest tx power, either tx
+ *	power per-interface or per-station.
  */
 struct station_parameters {
 	const u8 *supported_rates;
@@ -876,6 +881,7 @@ struct station_parameters {
 	u8 opmode_notif;
 	bool opmode_notif_used;
 	int support_p2p_ps;
+	u16 txpwr;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 6b76e3b..de2f72c 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1980,6 +1980,15 @@ enum nl80211_commands {
  * @NL80211_ATTR_BSSID: The BSSID of the AP. Note that %NL80211_ATTR_MAC is also
  *	used in various commands/events for specifying the BSSID.
  *
+ * @NL80211_ATTR_STA_TX_POWER_SETTING: Transmit power setting type (u32) for
+ *	station associated with the AP. See &enum nl80211_tx_power_setting for
+ *	possible values.
+ * @NL80211_ATTR_STA_TX_POWER: Transmit power level (u32) in mBm units. This
+ *	allows to set Tx power for a station. If this attribute is not included,
+ *	the default per-interface tx power setting will be overriding. Driver
+ *	should be picking up the lowest tx power, either tx power per-interface
+ *	or per-station.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -2386,6 +2395,9 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_BSSID,
 
+	NL80211_ATTR_STA_TX_POWER_SETTING,
+	NL80211_ATTR_STA_TX_POWER,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -4697,6 +4709,8 @@ enum nl80211_feature_flags {
  *	configuration (AP/mesh) with VHT rates.
  * @NL80211_EXT_FEATURE_FILS_STA: This driver supports Fast Initial Link Setup
  *	with user space SME (NL80211_CMD_AUTHENTICATE) in station mode.
+ * @NL80211_EXT_FEATURE_STA_TX_PWR: This driver supports controlling tx power
+ *	to a station.
  *
  * @NUM_NL80211_EXT_FEATURES: number of extended features.
  * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
@@ -4712,6 +4726,7 @@ enum nl80211_ext_feature_index {
 	NL80211_EXT_FEATURE_BEACON_RATE_HT,
 	NL80211_EXT_FEATURE_BEACON_RATE_VHT,
 	NL80211_EXT_FEATURE_FILS_STA,
+	NL80211_EXT_FEATURE_STA_TX_PWR,
 
 	/* add new features before the definition below */
 	NUM_NL80211_EXT_FEATURES,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index ef5eff93..701c08a 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -246,6 +246,8 @@ enum nl80211_multicast_groups {
 	[NL80211_ATTR_STA_SUPPORTED_RATES] = { .type = NLA_BINARY,
 					       .len = NL80211_MAX_SUPP_RATES },
 	[NL80211_ATTR_STA_PLINK_ACTION] = { .type = NLA_U8 },
+	[NL80211_ATTR_STA_TX_POWER_SETTING] = { .type = NLA_U32 },
+	[NL80211_ATTR_STA_TX_POWER] = { .type = NLA_U32 },
 	[NL80211_ATTR_STA_VLAN] = { .type = NLA_U32 },
 	[NL80211_ATTR_MNTR_FLAGS] = { /* NLA_NESTED can't be empty */ },
 	[NL80211_ATTR_MESH_ID] = { .type = NLA_BINARY,
@@ -4755,6 +4757,40 @@ static int nl80211_set_station_tdls(struct genl_info *info,
 	return nl80211_parse_sta_wme(info, params);
 }
 
+static int nl80211_parse_sta_txpower_setting(struct genl_info *info,
+					     struct station_parameters *params)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	enum nl80211_tx_power_setting type;
+	int idx;
+
+	if (!rdev->ops->set_tx_power ||
+	    !wiphy_ext_feature_isset(&rdev->wiphy,
+				     NL80211_EXT_FEATURE_STA_TX_PWR))
+		return -EOPNOTSUPP;
+
+	idx = NL80211_ATTR_STA_TX_POWER_SETTING;
+	type = nla_get_u32(info->attrs[idx]);
+
+	if (!info->attrs[NL80211_ATTR_STA_TX_POWER] &&
+	    (type != NL80211_TX_POWER_AUTOMATIC))
+		return -EINVAL;
+
+	if (type != NL80211_TX_POWER_AUTOMATIC) {
+		if (type == NL80211_TX_POWER_LIMITED) {
+			idx = NL80211_ATTR_STA_TX_POWER;
+			params->txpwr = nla_get_u32(info->attrs[idx]);
+		} else {
+			return -EINVAL;
+		}
+	} else {
+		params->txpwr = 0;
+	}
+	params->sta_modify_mask |= STATION_PARAM_APPLY_STA_TXPOWER;
+
+	return 0;
+}
+
 static int nl80211_set_station(struct sk_buff *skb, struct genl_info *info)
 {
 	struct cfg80211_registered_device *rdev = info->user_ptr[0];
@@ -4854,6 +4890,12 @@ static int nl80211_set_station(struct sk_buff *skb, struct genl_info *info)
 		params.local_pm = pm;
 	}
 
+	if (info->attrs[NL80211_ATTR_STA_TX_POWER_SETTING]) {
+		err = nl80211_parse_sta_txpower_setting(info, &params);
+		if (err)
+			return err;
+	}
+
 	/* Include parameters for TDLS peer (will check later) */
 	err = nl80211_set_station_tdls(info, &params);
 	if (err)
@@ -4981,6 +5023,12 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 			return -EINVAL;
 	}
 
+	if (info->attrs[NL80211_ATTR_STA_TX_POWER_SETTING]) {
+		err = nl80211_parse_sta_txpower_setting(info, &params);
+		if (err)
+			return err;
+	}
+
 	err = nl80211_parse_sta_channel_info(info, &params);
 	if (err)
 		return err;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
