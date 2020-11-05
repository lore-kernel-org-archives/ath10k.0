Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kadUz-0001F0-16
 for ath10k@lists.infradead.org; Thu, 05 Nov 2020 11:32:18 +0000
MIME-Version: 1.0
Date: Thu, 05 Nov 2020 19:30:53 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
In-Reply-To: <20201104232706.GC3212577@google.com>
References: <1600753775-4745-1-git-send-email-cjhuang@codeaurora.org>
 <20201104232706.GC3212577@google.com>
Message-ID: <63b38ac1969ecb29b8e57918c17a6ce5@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, kuabhs@google.com

On 2020-11-05 07:27, Brian Norris wrote:
> Hi Carl,
> 
> Sorry, I lied; I have a few more notes after spending another day
> looking at this:
> 
> On Tue, Sep 22, 2020 at 01:49:34PM +0800, Carl Huang wrote:
>> --- a/include/net/cfg80211.h
>> +++ b/include/net/cfg80211.h
>> @@ -1663,6 +1663,55 @@ struct station_info {
>> +/**
>> + * @struct cfg80211_sar_chan_ranges - sar frequency ranges
>> + * @index: the index of this range. It's used to specify
>> + *	the frequency range when setting SAR power limitation
>> + * @start_freq:  start channel frequency in kHZ. For example,
>> + *	2.4G channel 1 is represented as 2412000
>> + * @end_freq:    end channel frequency in kHZ
> 
> If you accept my comments in nl80211.h, you'll want to change this too.
> 
Yes.

>> + */
>> +struct cfg80211_sar_freq_ranges {
>> +	u8 index;
>> +	u32 start_freq;
>> +	u32 end_freq;
>> +};
> 
>> --- a/include/uapi/linux/nl80211.h
>> +++ b/include/uapi/linux/nl80211.h
> 
>> + * @NL80211_SAR_ATTR_SPECS_START_FREQ: Required (u32) value to 
>> specify the start
>> + *	frequency of this range to register SAR capability to wihpy and 
>> the unit
>> + *	is kHZ
>> + *
>> + * @NL80211_SAR_ATTR_SPECS_END_FREQ: Required (u32) value to specify 
>> the end frequency
>> + *	of this range to register SAR capability to wiphy and the unit is 
>> kHZ
> 
> The documentation here isn't clear whether these are center frequencies
> or band edges. The cfg80211 comments do though (center freq). However,
> this is inconsistent with NL80211_ATTR_FREQ_RANGE_START and
> NL80211_ATTR_FREQ_RANGE_END -- I'd suggest being consistent?
> 
Yes. Will change to band edge.

>> --- a/net/mac80211/cfg.c
>> +++ b/net/mac80211/cfg.c
> 
>> @@ -15331,6 +15496,14 @@ static const struct genl_ops nl80211_ops[] = 
>> {
>>  		.internal_flags = NL80211_FLAG_NEED_NETDEV |
>>  				  NL80211_FLAG_NEED_RTNL,
>>  	},
>> +	{
>> +		.cmd = NL80211_CMD_SET_SAR_SPECS,
>> +		.validate = GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
>> +		.doit = nl80211_set_sar_specs,
>> +		.flags = GENL_UNS_ADMIN_PERM,
>> +		.internal_flags = NL80211_FLAG_NEED_NETDEV_UP |
> 
> Is there a reason this needs to be UP? CMD_SET_WIPHY (which can also
> configure TX power, a little differently) does not. Seems like this
> could just be NL80211_FLAG_NEED_NETDEV -- or maybe not even that, if we
> switch this to a WIPHY command like Johannes noted.
> 

Will change to NL80211_FLAG_NEED_WIPHY.

> Brian
> 
>> +				  NL80211_FLAG_NEED_RTNL,
>> +	},
>>  };
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
