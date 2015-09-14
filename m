Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbWIQ-00051A-D7
 for ath10k@lists.infradead.org; Mon, 14 Sep 2015 16:07:58 +0000
Subject: Re: Need to re-associate firmware peer when SMPS_CHANGED is set?
References: <55F6540D.9080300@candelatech.com>
 <CAJ-Vmo=X-6ht1vqJOtJYZWBFr9hMpc3tPYRLrw0tv2GZLiOSKA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <55F6F0C9.5020603@candelatech.com>
Date: Mon, 14 Sep 2015 09:07:37 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=X-6ht1vqJOtJYZWBFr9hMpc3tPYRLrw0tv2GZLiOSKA@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: ath10k <ath10k@lists.infradead.org>

On 09/14/2015 12:41 AM, Adrian Chadd wrote:
> Hm! Well, iirc what we did in the rate control code for 11n chips was
> just to limit the transmit rate control selection to MCS0-7 even
> though we were in 2- or 3- stream modes.
>
> What else is it causing to change?

If rate-ctrl is currently in VHT with MCS 9, and we set the NSS
to 1, then it can no longer use MCS 9.  Something should proactively
kick the rate-ctrl logic when this happens.

The 10.1 rate-ctrl logic is all sorts of broken, especially with regard
to configuring this sort of change on the fly.  I'm fixing that in
CT firmware.  10.1 actually tries to reconfig everything properly
when SMPS changes, but it will fail to do so because it doesn't know
how to fetch the rate-ctrl object from the host's memory cache.

I've added an API for driver to request that firmware fetch the rate-ctrl
object...so calling that, then waiting 1ms, then calling the reassoc() logic
likely will work at least most of the time.  I didn't want to have to add
the same fetch + sleep hack for SMPS since the reassoc already does that.

Either way, I can hack the driver accordingly....I'll be testing out my
changes today.

Hopefully the newer ath10k upstream firmware do this all better, but
since I don't have source, I've no real idea of that.

Thanks,
Ben

>
>
> -a
>
>
> On 13 September 2015 at 21:58, Ben Greear <greearb@candelatech.com> wrote:
>> While digging in 10.1 firmware, I notice that setting WMI_PEER_SMPS_STATE
>> can cause
>> the chainmask to change.  And, that in turn can change all sorts of things
>> related to
>> available rates and such.
>>
>> Maybe we should do a re-assoc when we notice SMPS_CHANGED, similar to how it
>> is done for NSS_CHANGED?
>>
>> Thanks,
>> Ben
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
