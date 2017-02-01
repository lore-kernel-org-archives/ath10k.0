Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYygt-0002U7-V2
 for ath10k@lists.infradead.org; Wed, 01 Feb 2017 17:27:35 +0000
MIME-Version: 1.0
Date: Wed, 01 Feb 2017 22:57:08 +0530
From: Ashok Raj Nagarajan <arnagara@codeaurora.org>
Subject: Re: [PATCH v2 1/2] cfg80211: Add support to set tx power for a
 station associated
In-Reply-To: <12efc3d8-2274-a6e8-6d74-c06bf89762fb@candelatech.com>
References: <1485888101-23454-1-git-send-email-arnagara@qti.qualcomm.com>
 <12efc3d8-2274-a6e8-6d74-c06bf89762fb@candelatech.com>
Message-ID: <14f6b3acb8b26d0eb806148c0ee47fb0@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, ath10k@lists.infradead.org

On 2017-02-01 00:36, Ben Greear wrote:
> On 01/31/2017 10:41 AM, Ashok Raj Nagarajan wrote:
>> This patch adds support to set transmit power setting type and 
>> transmit
>> power level attributes to NL80211_CMD_SET_STATION in order to 
>> facilitate
>> adjusting the transmit power level of a station associated to the AP.
>> 
>> The added attributes allow selection of automatic and limited transmit
>> power level, with the level defined in mBm format.
>> 
>> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
>> ---
>> v2:
>> 	- refactor the shared code
>> 	- "keep what you had" using STATION_PARAM_APPLY_* BIT
>> 	- feature flag to let the user know if this feature is supported or 
>> not (Johannes)
>> 
>>  include/net/cfg80211.h       |  6 ++++++
>>  include/uapi/linux/nl80211.h | 15 +++++++++++++
>>  net/wireless/nl80211.c       | 50 
>> ++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 71 insertions(+)
>> 
>> diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
>> index 814be4b..c989fbd 100644
>> --- a/include/net/cfg80211.h
>> +++ b/include/net/cfg80211.h
>> @@ -808,6 +808,7 @@ enum station_parameters_apply_mask {
>>  	STATION_PARAM_APPLY_UAPSD = BIT(0),
>>  	STATION_PARAM_APPLY_CAPABILITY = BIT(1),
>>  	STATION_PARAM_APPLY_PLINK_STATE = BIT(2),
>> +	STATION_PARAM_APPLY_STA_TXPOWER = BIT(3),
>>  };
>> 
>>  /**
>> @@ -849,6 +850,10 @@ enum station_parameters_apply_mask {
>>   * @opmode_notif: operating mode field from Operating Mode 
>> Notification
>>   * @opmode_notif_used: information if operating mode field is used
>>   * @support_p2p_ps: information if station supports P2P PS mechanism
>> + * @txpwr: tx power (in mBm) to be used for sending data traffic. If 
>> tx power
>> + *	is not provided, the default per-interface tx power setting will 
>> be
>> + *	overriding. Driver should be picking up the lowest tx power, 
>> either tx
>> + *	power per-interface or per-station.
>>   */
>>  struct station_parameters {
>>  	const u8 *supported_rates;
>> @@ -876,6 +881,7 @@ struct station_parameters {
>>  	u8 opmode_notif;
>>  	bool opmode_notif_used;
>>  	int support_p2p_ps;
>> +	unsigned int txpwr;
>>  };
>> 
>>  /**
>> diff --git a/include/uapi/linux/nl80211.h 
>> b/include/uapi/linux/nl80211.h
>> index 6b76e3b..de2f72c 100644
>> --- a/include/uapi/linux/nl80211.h
>> +++ b/include/uapi/linux/nl80211.h
>> @@ -1980,6 +1980,15 @@ enum nl80211_commands {
>>   * @NL80211_ATTR_BSSID: The BSSID of the AP. Note that 
>> %NL80211_ATTR_MAC is also
>>   *	used in various commands/events for specifying the BSSID.
>>   *
>> + * @NL80211_ATTR_STA_TX_POWER_SETTING: Transmit power setting type 
>> (u32) for
>> + *	station associated with the AP. See &enum nl80211_tx_power_setting 
>> for
>> + *	possible values.
>> + * @NL80211_ATTR_STA_TX_POWER: Transmit power level (u32) in mBm 
>> units. This
>> + *	allows to set Tx power for a station. If this attribute is not 
>> included,
>> + *	the default per-interface tx power setting will be overriding. 
>> Driver
>> + *	should be picking up the lowest tx power, either tx power 
>> per-interface
>> + *	or per-station.
>> + *
>>   * @NUM_NL80211_ATTR: total number of nl80211_attrs available
>>   * @NL80211_ATTR_MAX: highest attribute number currently defined
>>   * @__NL80211_ATTR_AFTER_LAST: internal use
>> @@ -2386,6 +2395,9 @@ enum nl80211_attrs {
>> 
>>  	NL80211_ATTR_BSSID,
>> 
>> +	NL80211_ATTR_STA_TX_POWER_SETTING,
>> +	NL80211_ATTR_STA_TX_POWER,
>> +
>>  	/* add attributes here, update the policy in nl80211.c */
>> 
>>  	__NL80211_ATTR_AFTER_LAST,
>> @@ -4697,6 +4709,8 @@ enum nl80211_feature_flags {
>>   *	configuration (AP/mesh) with VHT rates.
>>   * @NL80211_EXT_FEATURE_FILS_STA: This driver supports Fast Initial 
>> Link Setup
>>   *	with user space SME (NL80211_CMD_AUTHENTICATE) in station mode.
>> + * @NL80211_EXT_FEATURE_STA_TX_PWR: This driver supports controlling 
>> tx power
>> + *	to a station.
>>   *
>>   * @NUM_NL80211_EXT_FEATURES: number of extended features.
>>   * @MAX_NL80211_EXT_FEATURES: highest extended feature index.
>> @@ -4712,6 +4726,7 @@ enum nl80211_ext_feature_index {
>>  	NL80211_EXT_FEATURE_BEACON_RATE_HT,
>>  	NL80211_EXT_FEATURE_BEACON_RATE_VHT,
>>  	NL80211_EXT_FEATURE_FILS_STA,
>> +	NL80211_EXT_FEATURE_STA_TX_PWR,
>> 
>>  	/* add new features before the definition below */
>>  	NUM_NL80211_EXT_FEATURES,
>> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
>> index ef5eff93..ace87de 100644
>> --- a/net/wireless/nl80211.c
>> +++ b/net/wireless/nl80211.c
>> @@ -246,6 +246,8 @@ enum nl80211_multicast_groups {
>>  	[NL80211_ATTR_STA_SUPPORTED_RATES] = { .type = NLA_BINARY,
>>  					       .len = NL80211_MAX_SUPP_RATES },
>>  	[NL80211_ATTR_STA_PLINK_ACTION] = { .type = NLA_U8 },
>> +	[NL80211_ATTR_STA_TX_POWER_SETTING] = { .type = NLA_U32 },
>> +	[NL80211_ATTR_STA_TX_POWER] = { .type = NLA_U32 },
>>  	[NL80211_ATTR_STA_VLAN] = { .type = NLA_U32 },
>>  	[NL80211_ATTR_MNTR_FLAGS] = { /* NLA_NESTED can't be empty */ },
>>  	[NL80211_ATTR_MESH_ID] = { .type = NLA_BINARY,
>> @@ -4548,6 +4550,8 @@ int cfg80211_check_station_change(struct wiphy 
>> *wiphy,
>>  			return -EINVAL;
>>  		if (params->sta_modify_mask & STATION_PARAM_APPLY_CAPABILITY)
>>  			return -EINVAL;
>> +		if (params->sta_modify_mask & STATION_PARAM_APPLY_STA_TXPOWER)
>> +			return -EINVAL;
> 
> Does this mean that we cannot change the tx-power after the station is
> associated?
> 
> Seems like that would be a good limitation to remove if possible!
> 
> 

Ben, that is a good catch! We don't want to have that limitation and 
would remove in the next version.

> 
>>  		if (params->supported_rates)
>>  			return -EINVAL;
>>  		if (params->ext_capab || params->ht_capa || params->vht_capa)
>> @@ -4755,6 +4759,40 @@ static int nl80211_set_station_tdls(struct 
>> genl_info *info,
>>  	return nl80211_parse_sta_wme(info, params);
>>  }
>> 
>> +static int nl80211_parse_sta_txpower_setting(struct genl_info *info,
>> +					     struct station_parameters *params)
>> +{
>> +	struct cfg80211_registered_device *rdev = info->user_ptr[0];
>> +	enum nl80211_tx_power_setting type;
>> +	int idx;
>> +
>> +	if (!rdev->ops->set_tx_power ||
>> +	    !wiphy_ext_feature_isset(&rdev->wiphy,
>> +				     NL80211_EXT_FEATURE_STA_TX_PWR))
>> +		return -EOPNOTSUPP;
> 
> Maybe always let a user set to default value even if the driver does 
> not
> support setting specific values?
> 

IMHO, having some default value in place of non-valid values may not be 
the right way.

Thanks,
Ashok

> Thanks,
> Ben

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
