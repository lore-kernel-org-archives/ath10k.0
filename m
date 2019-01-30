Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gonCN-0003IS-PP
 for ath10k@lists.infradead.org; Wed, 30 Jan 2019 10:34:29 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCH v2 1/3] cfg80211: Add support to set tx power for a station
 associated
Date: Wed, 30 Jan 2019 16:04:10 +0530
Message-Id: <1548844450-13691-1-git-send-email-bpothuno@codeaurora.org>
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
To: johannes@sipsolutions.net
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, Ashok Raj Nagarajan <arnagara@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

From: Ashok Raj Nagarajan <arnagara@codeaurora.org>

This patch adds support to set transmit power setting type and transmit
power level attributes to NL80211_CMD_SET_STATION in order to facilitate
adjusting the transmit power level of a station associated to the AP.

The added attributes allow selection of automatic and limited transmit
power level, with the level defined in dBm format.

Co-developed-by: Balaji Pothunoori <bpothuno@codeaurora.org>
Signed-off-by: Ashok Raj Nagarajan <arnagara@codeaurora.org>
Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
---
v2: add txpwr structure
    replaced nla_get_u32 with nla_get_u8/s16
    added NLA_POLICY_RANGE check

 include/net/cfg80211.h       | 14 ++++++++++++++
 include/uapi/linux/nl80211.h | 14 ++++++++++++++
 net/wireless/nl80211.c       | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 7033c90..029d9fe 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -973,6 +973,7 @@ enum station_parameters_apply_mask {
 	STATION_PARAM_APPLY_UAPSD = BIT(0),
 	STATION_PARAM_APPLY_CAPABILITY = BIT(1),
 	STATION_PARAM_APPLY_PLINK_STATE = BIT(2),
+	STATION_PARAM_APPLY_STA_TXPOWER = BIT(3),
 };
 
 /**
@@ -1017,6 +1018,15 @@ enum station_parameters_apply_mask {
  * @he_capa: HE capabilities of station
  * @he_capa_len: the length of the HE capabilities
  * @airtime_weight: airtime scheduler weight for this station
+ * @power: tx power (in dBm) to be used for sending data traffic. If tx power
+ *	is not provided, the default per-interface tx power setting will be
+ *	overriding. Driver should be picking up the lowest tx power, either tx
+ *	power per-interface or per-station.
+ * @type: In particular if TPC %type is NL80211_TX_POWER_LIMITED then tx power
+ *	will be less than or equal to specified from userspace, whereas if TPC
+ *	%type is NL80211_TX_POWER_AUTOMATIC then it indicates default tx power.
+ *	NL80211_TX_POWER_FIXED is not a valid configuration option for
+ *	per peer TPC.
  */
 struct station_parameters {
 	const u8 *supported_rates;
@@ -1047,6 +1057,10 @@ struct station_parameters {
 	const struct ieee80211_he_cap_elem *he_capa;
 	u8 he_capa_len;
 	u16 airtime_weight;
+	struct {
+		s16 power;
+		enum nl80211_tx_power_setting type;
+	} txpwr;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index dd4f86e..83040c6 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2308,6 +2308,15 @@ enum nl80211_commands {
  * @NL80211_ATTR_AIRTIME_WEIGHT: Station's weight when scheduled by the airtime
  *	scheduler.
  *
+ * @NL80211_ATTR_STA_TX_POWER_SETTING: Transmit power setting type (u8) for
+ *	station associated with the AP. See &enum nl80211_tx_power_setting for
+ *	possible values.
+ * @NL80211_ATTR_STA_TX_POWER: Transmit power level (s16) in dBm units. This
+ *	allows to set Tx power for a station. If this attribute is not included,
+ *	the default per-interface tx power setting will be overriding. Driver
+ *	should be picking up the lowest tx power, either tx power per-interface
+ *	or per-station.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -2758,6 +2767,8 @@ enum nl80211_attrs {
 	NL80211_ATTR_PEER_MEASUREMENTS,
 
 	NL80211_ATTR_AIRTIME_WEIGHT,
+	NL80211_ATTR_STA_TX_POWER_SETTING,
+	NL80211_ATTR_STA_TX_POWER,
 
 	/* add attributes here, update the policy in nl80211.c */
 
@@ -5343,6 +5354,8 @@ enum nl80211_feature_flags {
  * @NL80211_EXT_FEATURE_AP_PMKSA_CACHING: Driver/device supports PMKSA caching
  *	(set/del PMKSA operations) in AP mode.
  *
+ * @NL80211_EXT_FEATURE_STA_TX_PWR: This driver supports controlling tx power
+ 8	to a station.
  * @NUM_NL80211_EXT_FEATURES: number of extended features.
  * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
  */
@@ -5384,6 +5397,7 @@ enum nl80211_ext_feature_index {
 	NL80211_EXT_FEATURE_ENABLE_FTM_RESPONDER,
 	NL80211_EXT_FEATURE_AIRTIME_FAIRNESS,
 	NL80211_EXT_FEATURE_AP_PMKSA_CACHING,
+	NL80211_EXT_FEATURE_STA_TX_PWR,
 
 	/* add new features before the definition below */
 	NUM_NL80211_EXT_FEATURES,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index af89e5c..7e8073a 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -347,6 +347,11 @@ const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 					       .len = NL80211_MAX_SUPP_RATES },
 	[NL80211_ATTR_STA_PLINK_ACTION] =
 		NLA_POLICY_MAX(NLA_U8, NUM_NL80211_PLINK_ACTIONS - 1),
+	[NL80211_ATTR_STA_TX_POWER_SETTING] =
+		NLA_POLICY_RANGE(NLA_U8,
+				 NL80211_TX_POWER_AUTOMATIC,
+				 NL80211_TX_POWER_FIXED),
+	[NL80211_ATTR_STA_TX_POWER] = { .type = NLA_S16 },
 	[NL80211_ATTR_STA_VLAN] = { .type = NLA_U32 },
 	[NL80211_ATTR_MNTR_FLAGS] = { /* NLA_NESTED can't be empty */ },
 	[NL80211_ATTR_MESH_ID] = { .type = NLA_BINARY,
@@ -5404,6 +5409,31 @@ static int nl80211_set_station_tdls(struct genl_info *info,
 	return nl80211_parse_sta_wme(info, params);
 }
 
+static int nl80211_parse_sta_txpower_setting(struct genl_info *info,
+					     struct station_parameters *params)
+{
+	struct cfg80211_registered_device *rdev = info->user_ptr[0];
+	int idx;
+
+	if (info->attrs[NL80211_ATTR_STA_TX_POWER_SETTING]) {
+		if (!rdev->ops->set_tx_power ||
+		    !wiphy_ext_feature_isset(&rdev->wiphy,
+					 NL80211_EXT_FEATURE_STA_TX_PWR))
+			return -EOPNOTSUPP;
+
+		idx = NL80211_ATTR_STA_TX_POWER_SETTING;
+		params->txpwr.type = nla_get_u8(info->attrs[idx]);
+
+		if (params->txpwr.type == NL80211_TX_POWER_LIMITED) {
+			idx = NL80211_ATTR_STA_TX_POWER;
+			params->txpwr.power = nla_get_s16(info->attrs[idx]);
+		}
+		params->sta_modify_mask |= STATION_PARAM_APPLY_STA_TXPOWER;
+	}
+
+	return 0;
+}
+
 static int nl80211_set_station(struct sk_buff *skb, struct genl_info *info)
 {
 	struct cfg80211_registered_device *rdev = info->user_ptr[0];
@@ -5497,6 +5527,10 @@ static int nl80211_set_station(struct sk_buff *skb, struct genl_info *info)
 				     NL80211_EXT_FEATURE_AIRTIME_FAIRNESS))
 		return -EOPNOTSUPP;
 
+	err = nl80211_parse_sta_txpower_setting(info, &params);
+	if (err)
+		return err;
+
 	/* Include parameters for TDLS peer (will check later) */
 	err = nl80211_set_station_tdls(info, &params);
 	if (err)
@@ -5634,6 +5668,10 @@ static int nl80211_new_station(struct sk_buff *skb, struct genl_info *info)
 				     NL80211_EXT_FEATURE_AIRTIME_FAIRNESS))
 		return -EOPNOTSUPP;
 
+	err = nl80211_parse_sta_txpower_setting(info, &params);
+	if (err)
+		return err;
+
 	err = nl80211_parse_sta_channel_info(info, &params);
 	if (err)
 		return err;
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
