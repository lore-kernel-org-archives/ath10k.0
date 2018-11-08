Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKnE4-0003Su-Ae
 for ath10k@lists.infradead.org; Thu, 08 Nov 2018 16:32:13 +0000
Subject: Re: [PATCH 0/4] cfg80211/mac80211: Add support for TID specific
 configuration
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <2008ad85-3f13-cc6b-3fc2-d614f8422d68@quantenna.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <fec37af9-5a34-ea82-e81e-54e983278b4f@candelatech.com>
Date: Thu, 8 Nov 2018 08:31:42 -0800
MIME-Version: 1.0
In-Reply-To: <2008ad85-3f13-cc6b-3fc2-d614f8422d68@quantenna.com>
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
To: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>, Tamizh chelvam <tamizhr@codeaurora.org>
Cc: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 11/07/2018 04:55 PM, Igor Mitsyanko wrote:
> On 10/22/2018 10:55 AM, Tamizh chelvam wrote:
>>
>> Add infrastructure for per TID aggregation/retry count configurations
>> such as retry count and AMPDU aggregation control(disable/enable).
>> In some scenario reducing the number of retry count for a specific data
>> traffic can reduce the latency by proceeding with the next packet
>> instead of retrying the same packet more time. This will be useful
>> where the next packet can resume the operation without an issue.
>> Here added NL80211_CMD_SET_TID_CONFIG to support this operation by
>> accepting retry count and AMPDU aggregation control.
>> This command can accept STA mac addreess to make the configuration
>> station specific rather than applying to all the connected stations
>> to the netdev.
>>
>
> It's not immediately clear how to make use of these settings, here are
> several comments:
>
> 1. What max retry count limit should actually be applied to? Retries
> decisions are in a rate adaptation domain, it should know how many
> retries should be done on each rate, single "max retry" value will not
> suffice. For example, it can retry twice on MCS9, twice on MCS7, three
> times on MCS5 or something like that.
>
> I'm not familiar with what ATH10k is doing, 4th patch defines
> ATH10K_MAX_RETRY_COUNT=30, what does it actually mean? It's unlikely "do
> 30 retries on the same rate". Does retry limit setting interacts with
> rate adaptation somehow in ath10k?
>
> Maybe it makes sense to extend max retry value specification to make it
> possible to define per-rate? I'm not sure how much flexibility we want
> here, something like retry value per MCS:BW:SGI?

For ath10k, my understanding is that each time it (re)sends a packet, it will
query FW rate-ctrl and choose the optimal rate.  It doesn't pay much attention to
whether a specific frame is retried or not, other than to maybe enable RTS/CTS,
but lots of retries will bump the rate-ctrl down to a lower rate.

There are no per-rate retry counter logic, but I think there is per-tid
control, though currently it might not be wired up to the driver.

>
> 2. AMPDU/AMSDU - the way it is, it is also relevant to rate in Tx
> direction only, correct? We keep advertised capabilities intact and peer
> has all rights to send AMPDUs/AMSDUs of whatever size that was advertised.
> Additionally, posted patches do not do anything with established
> blockack agreement.
>
> 3 With above being said, perhaps it would make sense for this new
> interface to indicate explicitly that it's related to Tx rate? That can
> be controlled per-TID, per-node or globally, depending on device
> capabilities.
> Some other settings that may be useful are fixed MCS, MCS limit, SGI
> on/off, bandwidth, maybe even provide rate retry rules.

I think there should be a way to configure the advertised capabilities, and also a way to
configure the settings actually used for transmit.  This is what we use
for test-related use cases, but maybe there is not a great deal of general
use for this type of thing.  For general use, the 'transmit' settings are probably
more useful.  I do know that several ath10k users are forcing it back to /n
mode which works around some bugs in their mesh setup.

You can already set a fixed transmit rate or set the MCS rates allowed to be used
(my supplicant, ath10k-ct driver/firmware is needed to take full advantage of this
  for ath10k).  In upstream kernels, this will not much affect the advertised capabilities.

I also have patches that allow setting the advertised rates and capabilities, so you can force
a station to advertise only a/n rates even though it and peer have /AC capability.
Those patches are not upstream, though if opinions are changed, I'd be happy
to repost and try to get them upstream.

Thanks,
Ben

> I don't see how it can be used in real product, unless there is an
> external rate adaptation logic of some kind. But definitely it will be
> useful for testing, and can be used for WFA certification.
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
