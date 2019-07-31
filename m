Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hslqd-0004DR-Fz
 for ath10k@lists.infradead.org; Wed, 31 Jul 2019 10:28:44 +0000
MIME-Version: 1.0
Date: Wed, 31 Jul 2019 15:58:42 +0530
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: Re: [PATCHv6 1/9] nl80211: New netlink command for TID specific
 configuration
In-Reply-To: <428fec1c2dd6f6d9345323f272eef423a214bc39.camel@sipsolutions.net>
References: <1560835632-17405-1-git-send-email-tamizhr@codeaurora.org>
 <1560835632-17405-2-git-send-email-tamizhr@codeaurora.org>
 <428fec1c2dd6f6d9345323f272eef423a214bc39.camel@sipsolutions.net>
Message-ID: <19a236986ca5c91c232769989f9d6950@codeaurora.org>
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


> 
>> + * @NL80211_ATTR_TID_CONFIG: TID specific configuration in a
>> + *	nested attribute with %NL80211_TID_ATTR_* sub-attributes.
> 
> Please use NL80211_TID_CONFIG_ATTR_* throughout, also for
> 
>> +/* enum nl80211_tid_attr_config - TID specific configuration.
> 
> the enum name
> 
>> +enum nl80211_tid_attr_config {
>> +	__NL80211_TID_ATTR_INVALID,
>> +	NL80211_TID_ATTR_CONFIG_TID,
>> +	NL80211_TID_ATTR_CONFIG_NOACK,
>> +
>> +	/* keep last */
>> +	__NL80211_TID_ATTR_CONFIG_AFTER_LAST,
>> +	NL80211_TID_ATTR_CONFIG_MAX = __NL80211_TID_ATTR_CONFIG_AFTER_LAST - 
>> 1
> 
> and all the things in it.
sure.
> Also, as you can see above, the kernel-doc comment isn't formatted
> right.
> 
sure, I will fix it.
> 
>> +	nla_for_each_nested(tid, info->attrs[NL80211_ATTR_TID_CONFIG],
>> +			    rem_conf) {
>> +		ret = nla_parse_nested_deprecated(attrs, 
>> NL80211_TID_ATTR_CONFIG_MAX,
>> +						  tid, NULL, NULL);
> 
> You shouldn't use _deprecated.
> 
Okay.
>> +		ret = parse_tid_conf(rdev, attrs,
>> +				     &tid_config->tid_conf[conf_idx],
>> +				     tid_config->peer);
> 
> and yeah, this should compile.
> 
My bad. Sorry about this. I will fix this in the next version.

Thanks,
Tamizh.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
