Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwQ93-0001EX-Pv
 for ath10k@lists.infradead.org; Sat, 10 Aug 2019 12:06:51 +0000
MIME-Version: 1.0
Date: Sat, 10 Aug 2019 17:36:47 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCHv6 2/9] nl80211: Add new netlink attribute for TID
 speicific retry count
In-Reply-To: <6351a05f5c205db47740116b4bec5a6476317792.camel@sipsolutions.net>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-3-git-send-email-tamizhr@codeaurora.org>
 <6351a05f5c205db47740116b4bec5a6476317792.camel@sipsolutions.net>
Message-ID: <66f9219ed5bd03f96f23947c2bb6f990@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-07-31 14:54, Johannes Berg wrote:
> ^^ there's a typo in the subject
> 
I will fix it in next version.
>> @@ -3951,6 +3957,7 @@ enum wiphy_flags {
>>  	WIPHY_FLAG_SUPPORTS_5_10_MHZ		= BIT(22),
>>  	WIPHY_FLAG_HAS_CHANNEL_SWITCH		= BIT(23),
>>  	WIPHY_FLAG_HAS_STATIC_WEP		= BIT(24),
>> +	WIPHY_FLAG_HAS_MAX_DATA_RETRY_COUNT	= BIT(25),
> 
> This is never used, so that doesn't make sense? You probably want to
> advertise the max_data_retry_count value contingent on this flag (*) in
> some attribute, so that userspace can also detect the presence/absence
> of the flag for the feature?
> 
> (*) doesn't really need to be contingent on the flag - could just be
> contingent on max_data_retry_count being non-zero and then you don't
> need the flag.
> 
Sure, I will remove this flag.

>> + * @NL80211_ATTR_MAX_RETRY_COUNT: The upper limit for the retry count
>> + *	configuration that the driver can accept.
>>   *
>>   * @NUM_NL80211_ATTR: total number of nl80211_attrs available
>>   * @NL80211_ATTR_MAX: highest attribute number currently defined
>> @@ -2823,6 +2825,7 @@ enum nl80211_attrs {
>>  	NL80211_ATTR_TWT_RESPONDER,
>> 
>>  	NL80211_ATTR_TID_CONFIG,
>> +	NL80211_ATTR_MAX_RETRY_COUNT,
> 
> You already have the attribute, but again, aren't using it.
> 
I will use this in nl80211_get_wiphy to notify userspace.

>> + * @NL80211_EXT_FEATURE_PER_TID_RETRY_CONFIG: Driver supports per TID 
>> data retry
>> + *	count functionality.
>> + * @NL80211_EXT_FEATURE_PER_STA_RETRY_CONFIG: Driver supports STA 
>> specific
>> + *	data retry count functionality.
> 
> and if you have these you don't need the WIPHY_FLAG anyway?
> 
Sure.
>> +	[NL80211_TID_ATTR_CONFIG_RETRY] = { .type = NLA_FLAG },
>> +	[NL80211_TID_ATTR_CONFIG_RETRY_SHORT] = NLA_POLICY_MIN(NLA_U8, 0),
>> +	[NL80211_TID_ATTR_CONFIG_RETRY_LONG] = NLA_POLICY_MIN(NLA_U8, 0),
> 
> min of 0 doesn't make sense, maybe you meant 1? otherwise just don't 
> set
> anything here.
> 
The min value changed to 0 from 1 as per the previous discussions, since 
this is a retry count and not a tx count.
Or Shall I remove this min value to avoid the confusion ?
> 
>> +					    "TID specific configuration not "
>> +					    "supported");
> 
> This applies to all the patches - please don't break strings across
> multiple lines, even if they cross 80 columns. Even checkpatch won't
> give you any warning on this.
> 
Yeah, sure.
>> +		tid_conf->tid_conf_mask |= IEEE80211_TID_CONF_RETRY;
>> +		if (attrs[NL80211_TID_ATTR_CONFIG_RETRY_SHORT]) {
>> +			tid_conf->retry_short =
>> +			nla_get_u8(attrs[NL80211_TID_ATTR_CONFIG_RETRY_SHORT]);
>> +			if (tid_conf->retry_short >
>> +					rdev->wiphy.max_data_retry_count)
>> +				return -EINVAL;
>> +		} else {
>> +			tid_conf->retry_short = -1;
>> +
> 
> I guess you should document that -1 means no changes? Not sure how the
> IEEE80211_TID_CONF_RETRY comes in, you're always setting it, so that's
> useless - better remove that and document that -1 means no changes?
> 
The value -1 is to notify the driver to use default value by removing 
peer specific retry count.

Thanks,
Tamizh.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
