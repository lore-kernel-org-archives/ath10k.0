Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcko4-0007OF-92
 for ath10k@lists.infradead.org; Wed, 11 Nov 2020 07:44:42 +0000
MIME-Version: 1.0
Date: Wed, 11 Nov 2020 15:44:25 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH 1/3] nl80211: add common API to configure SAR power
 limitations.
In-Reply-To: <64e072a168c12f58847a5ee16bfdb7e47576284f.camel@sipsolutions.net>
References: <20201106100708.4609-1-cjhuang@codeaurora.org>
 <20201106100708.4609-2-cjhuang@codeaurora.org>
 (sfid-20201106_110730_189162_E9D09205)
 <64e072a168c12f58847a5ee16bfdb7e47576284f.camel@sipsolutions.net>
Message-ID: <00c810b30b91397e562ca54475940afc@codeaurora.org>
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
Cc: briannorris@chromium.org, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, kuabhs@google.com

On 2020-11-06 18:25, Johannes Berg wrote:
> Hi,
> 
> Looks pretty good. Some comments, mostly nits, below.
> 
Thank you for the comments, Johannes.

I don't understand below well, please help explain:
> And even if we do need the index, then perhaps we should use the
> (otherwise anyway ignored) nla_type() of the container, instead of an
> explicit inner attribute?
> 



> 
>> +/**
>> + * nl80211_sar_attrs - Attributes for SAR spec
> 
> missing enum
> 
sure

>> + *
>> + * @NL80211_SAR_ATTR_TYPE: the SAR type and it's defined in 
>> %nl80211_sar_type.
> 
> better use &enum nl80211_sar_type for a link in docs
> 
>> + *
>> + * @NL80211_SAR_ATTR_SPECS: Nested array of SAR power
>> + *	limit specifications. Each specification contains a set
>> + *      of %nl80211_sar_specs_attrs.
>> + *
>> + *      For SET operation, it contains array of 
>> NL80211_SAR_ATTR_SPECS_POWER
> 
> some odd indent?
> 
> Usually we just use a single tab.
> 
sure

>> +/**
>> + * nl80211_sar_specs_attrs - Attributes for SAR power limit specs
> 
> again, enum missing
> 
>> + *
>> + * @NL80211_SAR_ATTR_SPECS_POWER: Required (u32)value to specify the 
>> actual
>> + *	power limit value in units of 0.25 dBm if type is
>> + *	NL80211_SAR_TYPE_POWER. (i.e., a value of 44 represents 11 dBm).
>> + *	0 means userspace doesn't have SAR limitation on this associated 
>> range.
>> + *
>> + * @NL80211_SAR_ATTR_SPECS_RANGE_INDEX: Required (u32) value to 
>> specify the
>> + *	index of exported freq range table and the associated power 
>> limitation
>> + *	is applied to this range.
>> + *
>> + *	Userspace isn't required to set all the ranges advertised by WLAN 
>> driver,
>> + *	and userspace can skip some certain ranges. These skipped ranges 
>> don't
>> + *	have SAR limitations, and these are same as setting the
>> + *	%NL80211_SAR_ATTR_SPECS_POWER to 0. But it's required to set at 
>> least one range,
>> + *	no matter the power limiation is 0 or not.
> 
> (typo - limitation)
> 
> Should "0" really be the magic value? Theoretically, 0 and even 
> negative
> values are valid. Perhaps we should just use something big (0xffffffff)
> to indicate no limit, or just not have such a "no limitation" value
> because userspace can always set it to something very big that means no
> practical limitation anyway?
> 
> OK actually you have a U8 now so the high limit is 63.75dBm, but 
> there's
> not really a good reason for that, since U32 takes the same space in
> netlink anyway.
> 
Looks 0 and negative value are not practical as it means <= 1mw,
but I can use S32 instead.

Not sure if a magic value is needed? If it's needed, then perhaps 
0x7fffffff
is good for it?

> And wait, I thought we agreed to remove the index? Now I'm confused.
> 
Using index in SET operation doesn't add burden to userspace and kernel,
but it provides some flexibility so userspace can skip some certain 
ranges.


> And even if we do need the index, then perhaps we should use the
> (otherwise anyway ignored) nla_type() of the container, instead of an
> explicit inner attribute?
> 
I don't understand what means here. Use nla_type for what?

>> + *
>> + *	Every SET operation overwrites previous SET operation.
>> + *
>> + * @NL80211_SAR_ATTR_SPECS_START_FREQ: Required (u32) value to 
>> specify the start
>> + *	frequency of this range edge when registering SAR capability to 
>> wiphy. It's
>> + *	not a channel center frequency. The unit is KHz.
> 
> "kHz" not "KHz", in a few places other than this too
> 
>> +static int
>> +nl80211_put_sar_specs(struct cfg80211_registered_device *rdev,
>> +		      struct sk_buff *msg)
>> +{
>> +	struct nlattr *sar_capa, *specs, *sub_freq_range;
>> +	u8  num_freq_ranges;
> 
> extra space?
> 
>> +	for (i = 0; i < num_freq_ranges; i++) {
>> +		sub_freq_range = nla_nest_start(msg, i + 1);
>> +
>> +		nla_put_u32(msg, NL80211_SAR_ATTR_SPECS_START_FREQ,
>> +			    rdev->wiphy.sar_capa->freq_ranges[i].start_freq);
>> +
>> +		nla_put_u32(msg, NL80211_SAR_ATTR_SPECS_END_FREQ,
>> +			    rdev->wiphy.sar_capa->freq_ranges[i].end_freq);
> 
> 
> Need to check the return values of these three calls.
> 
sure

> 
> And an aside, unrelated to this particular code: Should we do some kind
> of validation that the ranges reported actually overlap all supported
> channels (taking 20 MHz bandwidth into account)?
> 
>> +	nla_parse_nested(tb, NL80211_SAR_ATTR_MAX, 
>> info->attrs[NL80211_ATTR_SAR_SPEC],
>> +			 sar_policy, info->extack);
> 
> If you're not checking the return value then no point in passing a
> policy or extack :-)
> 
> And yes, it's already validated, so you don't have to do it again.
> 
Yes, will use NULL instead of info->extack

>> +	sar_spec->type = type;
>> +	specs = 0;
>> +	nla_for_each_nested(spec_list, tb[NL80211_SAR_ATTR_SPECS], rem) {
>> +		if (nla_parse(spec,
>> +			      NL80211_SAR_ATTR_SPECS_MAX,
>> +			      nla_data(spec_list),
>> +			      nla_len(spec_list),
>> +			      sar_specs_policy,
>> +			      NULL)) {
> 
> Similar here, don't really need to validate it since it's done by the
> policy.
> 
sure

>> +			err = -EINVAL;
>> +			goto error;
>> +		}
>> +
>> +		/* for power type, power value and index must be presented */
>> +		if ((!spec[NL80211_SAR_ATTR_SPECS_POWER] ||
>> +		     !spec[NL80211_SAR_ATTR_SPECS_RANGE_INDEX]) &&
>> +		    type == NL80211_SAR_TYPE_POWER) {
> 
> maybe "switch (type) {...}" or something and return -EINVAL also if 
> it's
> a type not supported in the code yet, i.e. default case?
> 
> Otherwise we might add a type, and forget this pretty easily.
> 
Good suggestion, will change to switch case.

>> +			err = -EINVAL;
>> +			goto error;
>> +		}
>> +
>> +		power = nla_get_u8(spec[NL80211_SAR_ATTR_SPECS_POWER]);
>> +		sar_spec->sub_specs[specs].power = power;
> 
> and that probably should then be in a sub function or something also
> inside the particular type.
> 
> or maybe just all in a separate function? dunno. not really 
> _necessary_,
> but the lines are getting kinda long already, and one more indentation
> level with the switch won't help ...
> 
I'll move this to a separate function.


> johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
