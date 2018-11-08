Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-by2nam01on0614.outbound.protection.outlook.com
 ([2a01:111:f400:fe42::614]
 helo=NAM01-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKYc1-0001EX-CT
 for ath10k@lists.infradead.org; Thu, 08 Nov 2018 00:55:59 +0000
From: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>
Subject: Re: [PATCH 0/4] cfg80211/mac80211: Add support for TID specific
 configuration
Date: Thu, 8 Nov 2018 00:55:25 +0000
Message-ID: <2008ad85-3f13-cc6b-3fc2-d614f8422d68@quantenna.com>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <465B98ACDD0BCB40985AC886ABB4557C@namprd05.prod.outlook.com>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 10/22/2018 10:55 AM, Tamizh chelvam wrote:
> 
> Add infrastructure for per TID aggregation/retry count configurations
> such as retry count and AMPDU aggregation control(disable/enable).
> In some scenario reducing the number of retry count for a specific data
> traffic can reduce the latency by proceeding with the next packet
> instead of retrying the same packet more time. This will be useful
> where the next packet can resume the operation without an issue.
> Here added NL80211_CMD_SET_TID_CONFIG to support this operation by
> accepting retry count and AMPDU aggregation control.
> This command can accept STA mac addreess to make the configuration
> station specific rather than applying to all the connected stations
> to the netdev.
> 

It's not immediately clear how to make use of these settings, here are 
several comments:

1. What max retry count limit should actually be applied to? Retries 
decisions are in a rate adaptation domain, it should know how many 
retries should be done on each rate, single "max retry" value will not 
suffice. For example, it can retry twice on MCS9, twice on MCS7, three 
times on MCS5 or something like that.

I'm not familiar with what ATH10k is doing, 4th patch defines 
ATH10K_MAX_RETRY_COUNT=30, what does it actually mean? It's unlikely "do 
30 retries on the same rate". Does retry limit setting interacts with 
rate adaptation somehow in ath10k?

Maybe it makes sense to extend max retry value specification to make it 
possible to define per-rate? I'm not sure how much flexibility we want 
here, something like retry value per MCS:BW:SGI?

2. AMPDU/AMSDU - the way it is, it is also relevant to rate in Tx 
direction only, correct? We keep advertised capabilities intact and peer 
has all rights to send AMPDUs/AMSDUs of whatever size that was advertised.
Additionally, posted patches do not do anything with established 
blockack agreement.

3 With above being said, perhaps it would make sense for this new 
interface to indicate explicitly that it's related to Tx rate? That can 
be controlled per-TID, per-node or globally, depending on device 
capabilities.
Some other settings that may be useful are fixed MCS, MCS limit, SGI 
on/off, bandwidth, maybe even provide rate retry rules.

I don't see how it can be used in real product, unless there is an 
external rate adaptation logic of some kind. But definitely it will be 
useful for testing, and can be used for WFA certification.
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
