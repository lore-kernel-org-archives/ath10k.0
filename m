Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd6ep-0006rm-09
 for ath10k@lists.infradead.org; Tue, 18 Jun 2019 05:27:49 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCHv6 5/9] nl80211: Add netlink attribute to configure TID
 specific tx rate
Date: Tue, 18 Jun 2019 10:57:08 +0530
Message-Id: <1560835632-17405-6-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
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

Introduce NL80211_TID_ATTR_CONFIG_TX_RATES in nl80211_tid_attr_config
to accept data TID specific TX bitrate configuration
through NL80211_CMD_SET_TID_CONFIG command. TID for which the
this configuration is to be applied is passed in
NL80211_TID_ATTR_CONFIG_TID attribute. TX bitrate mask values passed
in NL80211_ATTR_TX_RATES attribute and NL80211_TID_ATTR_CONFIG_TX_RATES
attribute will have types of the TX rate should be applied.
When the user-space wants this configuration peer specific
rather than being applied for all the connected stations,
MAC address of the peer can be passed in NL80211_ATTR_MAC attribute.

Driver supporting this feature should advertise
NL80211_EXT_FEATURE_PER_TID_TX_BITRATE_MASK and supporting per-STA data TID
TX bitrate configuration should advertise
NL80211_EXT_FEATURE_PER_STA_TX_BITRATE_MASK.

Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
---
 include/net/cfg80211.h       |    5 +++
 include/uapi/linux/nl80211.h |   39 +++++++++++++++++++++
 net/wireless/nl80211.c       |   77 ++++++++++++++++++++++++++++++++++++++----
 3 files changed, 115 insertions(+), 6 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 1b875d8..4bc6eb7 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -530,6 +530,7 @@ enum ieee80211_tid_conf_mask {
 	IEEE80211_TID_CONF_RETRY	= BIT(1),
 	IEEE80211_TID_CONF_AMPDU	= BIT(2),
 	IEEE80211_TID_CONF_RTSCTS	= BIT(3),
+	IEEE80211_TID_CONF_TX_BITRATE	= BIT(4),
 };
 
 /**
@@ -542,6 +543,8 @@ enum ieee80211_tid_conf_mask {
  * @retry_short: retry count value
  * @ampdu: Enable/Disable aggregation
  * @rtscts: Enable/Disable RTS/CTS
+ * @txrate_type: TX bitrate mask type
+ * @mask: bitrate to be applied for the TID
  */
 struct ieee80211_tid_cfg {
 	u8 tid;
@@ -551,6 +554,8 @@ struct ieee80211_tid_cfg {
 	int retry_short;
 	u8 ampdu;
 	u8 rtscts;
+	enum nl80211_tx_rate_setting txrate_type;
+	struct cfg80211_bitrate_mask *mask;
 };
 
 /**
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index df4e07d..04f253d 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -4649,6 +4649,18 @@ enum nl80211_tx_power_setting {
 };
 
 /**
+ * enum nl80211_tx_rate_setting - TX rate configuration type
+ * @NL80211_TX_RATE_AUTOMATIC: automatically determine TX rate
+ * @NL80211_TX_RATE_LIMITED: limit the TX rate by the TX rate parameter
+ * @NL80211_TX_RATE_FIXED: fix TX rate to the TX rate parameter
+ */
+enum nl80211_tx_rate_setting {
+	NL80211_TX_RATE_AUTOMATIC,
+	NL80211_TX_RATE_LIMITED,
+	NL80211_TX_RATE_FIXED,
+};
+
+/**
  * enum nl80211_tid_config - TID config state
  * @NL80211_TID_CONFIG_DEFAULT: Default config for the TID
  * @NL80211_TID_CONFIG_ENABLE: Enable config for the TID
@@ -4742,6 +4754,25 @@ enum nl80211_tid_config {
  *	NL80211_EXT_FEATURE_PER_TID_RTSCTS_CTRL and supporting per station
  *	RTS_CTS configuration should advertise
  *	NL80211_EXT_FEATURE_PER_STA_RTSCTS_CTRL.
+ * @NL80211_TID_ATTR_CONFIG_TX_RATES: Data frame TX rate mask should be applied
+ *	with the parameters passed through %NL80211_ATTR_TX_RATES. This
+ *	configuration is per TID, TID is specified with
+ *	%NL80211_TID_ATTR_CONFIG_TID.
+ *	If the peer MAC address is passed in %NL80211_ATTR_MAC, then this
+ *	configuration is applied to the data frame for the tid to that connected
+ *	station. This attribute will be useful to notfiy the driver that what
+ *	type of txrate should be applied(%enum enum nl80211_tx_rate_setting)
+ *	for the connected station (%NL80211_ATTR_MAC),
+ *	Station specific retry configuration is valid only for STA's
+ *	current connection. i.e. the configuration will be reset to default when
+ *	the station connects back after disconnection/roaming.
+ *	when user-space does not include %NL80211_ATTR_MAC, this configuration
+ *	should be treated as per-netdev configuration. This configuration will
+ *	be cleared when the interface goes down and on the disconnection from a
+ *	BSS. Driver supporting this feature should advertise
+ *	NL80211_EXT_FEATURE_PER_TID_TX_BITRATE_MASK and supporting per station
+ *	TX bitrate configuration should advertise
+ *	NL80211_EXT_FEATURE_PER_STA_TX_BITRATE_MASK.
  */
 enum nl80211_tid_attr_config {
 	__NL80211_TID_ATTR_INVALID,
@@ -4752,6 +4783,8 @@ enum nl80211_tid_attr_config {
 	NL80211_TID_ATTR_CONFIG_RETRY_LONG,
 	NL80211_TID_ATTR_CONFIG_AMPDU_CTRL,
 	NL80211_TID_ATTR_CONFIG_RTSCTS_CTRL,
+	NL80211_TID_ATTR_CONFIG_TX_RATES_TYPE,
+	NL80211_TID_ATTR_CONFIG_TX_RATES,
 
 	/* keep last */
 	__NL80211_TID_ATTR_CONFIG_AFTER_LAST,
@@ -5585,6 +5618,10 @@ enum nl80211_feature_flags {
  *	RTS_CTS control(enable/disable).
  * @NL80211_EXT_FEATURE_PER_STA_RTSCTS_CTRL: Driver supports STA specific
  *	RTS_CTS control(enable/disable).
+ * @NL80211_EXT_FEATURE_PER_TID_TX_BITRATE_MASK: Driver supports TID specific
+ *	TX bitrate configuration.
+ * @NL80211_EXT_FEATURE_PER_STA_TX_BITRATE_MASK: Driver supports STA specific
+ *	TX bitrate configuration.
  *
  * @NUM_NL80211_EXT_FEATURES: number of extended features.
  * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
@@ -5639,6 +5676,8 @@ enum nl80211_ext_feature_index {
 	NL80211_EXT_FEATURE_PER_STA_AMPDU_CTRL,
 	NL80211_EXT_FEATURE_PER_TID_RTSCTS_CTRL,
 	NL80211_EXT_FEATURE_PER_STA_RTSCTS_CTRL,
+	NL80211_EXT_FEATURE_PER_TID_TX_BITRATE_MASK,
+	NL80211_EXT_FEATURE_PER_STA_TX_BITRATE_MASK,
 
 	/* add new features before the definition below */
 	NUM_NL80211_EXT_FEATURES,
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 370c483..a1a8c48 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -281,6 +281,15 @@ static int validate_ie_attr(const struct nlattr *attr,
 		NLA_POLICY_NESTED_ARRAY(nl80211_psmr_peer_attr_policy),
 };
 
+static const struct nla_policy nl80211_txattr_policy[NL80211_TXRATE_MAX + 1] = {
+	[NL80211_TXRATE_LEGACY] = { .type = NLA_BINARY,
+				    .len = NL80211_MAX_SUPP_RATES },
+	[NL80211_TXRATE_HT] = { .type = NLA_BINARY,
+				.len = NL80211_MAX_SUPP_HT_RATES },
+	[NL80211_TXRATE_VHT] = { .len = sizeof(struct nl80211_txrate_vht)},
+	[NL80211_TXRATE_GI] = { .type = NLA_U8 },
+};
+
 static const struct nla_policy
 nl80211_tid_attr_config_policy[NL80211_TID_ATTR_CONFIG_MAX + 1] = {
 	[NL80211_TID_ATTR_CONFIG_TID] = { .type = NLA_U8 },
@@ -293,6 +302,10 @@ static int validate_ie_attr(const struct nlattr *attr,
 			NLA_POLICY_MAX(NLA_U8, NL80211_TID_CONFIG_DISABLE),
 	[NL80211_TID_ATTR_CONFIG_RTSCTS_CTRL] =
 			NLA_POLICY_MAX(NLA_U8, NL80211_TID_CONFIG_DISABLE),
+	[NL80211_TID_ATTR_CONFIG_TX_RATES_TYPE] =
+			NLA_POLICY_MAX(NLA_U8, NL80211_TX_RATE_FIXED),
+	[NL80211_TID_ATTR_CONFIG_TX_RATES] =
+			NLA_POLICY_NESTED(nl80211_txattr_policy),
 };
 
 const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
@@ -4147,14 +4160,14 @@ static int nl80211_parse_tx_bitrate_mask(struct genl_info *info,
 	}
 
 	/* if no rates are given set it back to the defaults */
-	if (!info->attrs[NL80211_ATTR_TX_RATES])
+	if (!attrs[attr])
 		goto out;
 
 	/* The nested attribute uses enum nl80211_band as the index. This maps
 	 * directly to the enum nl80211_band values used in cfg80211.
 	 */
 	BUILD_BUG_ON(NL80211_MAX_SUPP_HT_RATES > IEEE80211_HT_MCS_MASK_LEN * 8);
-	nla_for_each_nested(tx_rates, info->attrs[NL80211_ATTR_TX_RATES], rem) {
+	nla_for_each_nested(tx_rates, attrs[attr], rem) {
 		enum nl80211_band band = nla_type(tx_rates);
 		int err;
 
@@ -4602,7 +4615,9 @@ static int nl80211_start_ap(struct sk_buff *skb, struct genl_info *info)
 		return -EINVAL;
 
 	if (info->attrs[NL80211_ATTR_TX_RATES]) {
-		err = nl80211_parse_tx_bitrate_mask(info, &params.beacon_rate);
+		err = nl80211_parse_tx_bitrate_mask(info, info->attrs,
+						    NL80211_ATTR_TX_RATES,
+						    &params.beacon_rate);
 		if (err)
 			return err;
 
@@ -10309,7 +10324,8 @@ static int nl80211_set_tx_bitrate_mask(struct sk_buff *skb,
 	if (!rdev->ops->set_bitrate_mask)
 		return -EOPNOTSUPP;
 
-	err = nl80211_parse_tx_bitrate_mask(info, &mask);
+	err = nl80211_parse_tx_bitrate_mask(info, info->attrs,
+					    NL80211_ATTR_TX_RATES, &mask);
 	if (err)
 		return err;
 
@@ -10902,7 +10918,9 @@ static int nl80211_join_mesh(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	if (info->attrs[NL80211_ATTR_TX_RATES]) {
-		err = nl80211_parse_tx_bitrate_mask(info, &setup.beacon_rate);
+		err = nl80211_parse_tx_bitrate_mask(info, info->attrs,
+						    NL80211_ATTR_TX_RATES,
+						    &setup.beacon_rate);
 		if (err)
 			return err;
 
@@ -13598,6 +13616,7 @@ static int parse_tid_conf(struct cfg80211_registered_device *rdev,
 			  struct genl_info *info, const u8 *peer)
 {
 	struct netlink_ext_ack *extack = info->extack;
+	int ret;
 
 	tid_conf->tid = nla_get_u8(attrs[NL80211_TID_ATTR_CONFIG_TID]);
 	if (attrs[NL80211_TID_ATTR_CONFIG_NOACK]) {
@@ -13713,6 +13732,52 @@ static int parse_tid_conf(struct cfg80211_registered_device *rdev,
 			nla_get_u8(attrs[NL80211_TID_ATTR_CONFIG_RTSCTS_CTRL]);
 	}
 
+	if (attrs[NL80211_TID_ATTR_CONFIG_TX_RATES_TYPE]) {
+		int idx;
+		enum nl80211_attrs attr;
+
+		if (!wiphy_ext_feature_isset(&rdev->wiphy,
+				NL80211_EXT_FEATURE_PER_TID_TX_BITRATE_MASK)) {
+			NL_SET_ERR_MSG_ATTR(extack,
+					    attrs[NL80211_TID_ATTR_CONFIG_TX_RATES_TYPE],
+					    "TID specific configuration not "
+					    "supported");
+			return -EOPNOTSUPP;
+		}
+
+		if (peer &&
+		    !wiphy_ext_feature_isset(&rdev->wiphy,
+				NL80211_EXT_FEATURE_PER_STA_TX_BITRATE_MASK)) {
+			NL_SET_ERR_MSG_ATTR(extack,
+					    attrs[NL80211_TID_ATTR_CONFIG_TX_RATES_TYPE],
+					    "peer specfic TID configuration not "
+					    "supported");
+			return -EOPNOTSUPP;
+		}
+
+		idx = NL80211_TID_ATTR_CONFIG_TX_RATES_TYPE;
+		tid_conf->txrate_type = nla_get_u8(attrs[idx]);
+
+		tid_conf->tid_conf_mask |= IEEE80211_TID_CONF_TX_BITRATE;
+		if (tid_conf->txrate_type != NL80211_TX_RATE_AUTOMATIC) {
+			tid_conf->mask =
+				kzalloc(sizeof(struct cfg80211_bitrate_mask),
+					GFP_KERNEL);
+			if (!tid_conf->mask)
+				return -ENOMEM;
+
+			attr = NL80211_TID_ATTR_CONFIG_TX_RATES;
+			ret = nl80211_parse_tx_bitrate_mask(info, attrs, attr,
+							    tid_conf->mask);
+			if (ret) {
+				kfree(tid_conf->mask);
+				return ret;
+			}
+		} else {
+			tid_conf->mask = NULL;
+		}
+	}
+
 	return 0;
 }
 
@@ -13763,7 +13828,7 @@ static int nl80211_set_tid_config(struct sk_buff *skb,
 
 		ret = parse_tid_conf(rdev, attrs,
 				     &tid_config->tid_conf[conf_idx],
-				     tid_config->peer);
+				     info, tid_config->peer);
 		if (ret)
 			goto bad_tid_conf;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
