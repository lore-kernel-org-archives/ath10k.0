Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bDePW-0004wr-Ak
 for ath10k@lists.infradead.org; Thu, 16 Jun 2016 21:01:11 +0000
Subject: Re: Dynamic Bandwidth in hw rate control
References: <CAFc9h7uxTOUxONvW-gvgkFLUNR9OBn09kfetF9gqAtcNqN3SLg@mail.gmail.com>
 <5758FD6B.40409@candelatech.com>
 <CAFc9h7s69rVpMNUx553zsHfLf2uLcqx0jhKqma-+SxA6EkybMA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5763120E.4040902@candelatech.com>
Date: Thu, 16 Jun 2016 13:54:38 -0700
MIME-Version: 1.0
In-Reply-To: <CAFc9h7s69rVpMNUx553zsHfLf2uLcqx0jhKqma-+SxA6EkybMA@mail.gmail.com>
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
To: Gaurang Ramesh Naik <gaurang@vt.edu>
Cc: ath10k@lists.infradead.org

On 06/16/2016 12:57 PM, Gaurang Ramesh Naik wrote:
> Hi Ben,
>
> Thanks for your reply.
>
> I wanted to know if the dynamic bandwidth option implemented in ath10k
> is the same as that mentioned in the standard, or does it deviate? I
> tried to look for any documentation on ath10k dynamic bandwidth, but
> could not find any.
>
> If I am not wrong, on the secondary channel, the sender senses the
> channel for PIFS interval of time immediately preceding the start of
> the TXOP (9.19.2.8 in the standard). In the static mode, if the
> secondary channel is sensed busy, the sender waits until all channels
> become idle; but in the dynamic mode, the sender sends on the primary
> and (adjacent) secondary channel that are not busy.
>
> However, the documentation for dynamic bandwidth in ath10k/mac.c seems
> to suggest that the transmission retries are carried over narrower
> bandwidth in dynamic mode. Does this mean the same as what is given in
> the standard? Or is the dynamic mode implemented differently? Any help
> is appreciated.

I don't know exactly how this works.  At least the sensing and stuff is probably
baked into the hardware.  What I notice is that the firmware passes a series
of rates to the hardware to use for each packet, and it includes different
bandwidth rates.

If you used my firmware and my kernel, you can see the (successful) transmit
rate for each frame.  Perhaps you could discover some info about how it works
in that manner if you could reliably add noise on an adjacent channel.

Upstream firmware can see tx rates using pktlog I think, but I have
never tried that.

Thanks,
Ben

>
> Thanks,
> Gaurang.
>
> On Thu, Jun 9, 2016 at 1:23 AM, Ben Greear <greearb@candelatech.com> wrote:
>>
>>
>> On 06/08/2016 08:10 PM, Gaurang Ramesh Naik wrote:
>>>
>>> Hi,
>>>
>>> I needed a small clarification related to dynamic bandwidth setup. The
>>> documentation in wmi.h says " When enabled HW rate control tries
>>> different bandwidths when retransmitting frames."
>>>
>>> Does this mean that each packet is first always tried over VHT80 and
>>> if that fails it goes to HT40 and then to HT20? I tried this with one
>>> AP-Sta operating in VHT80 and one AP operating in its first secondary
>>> channel. When I check the rx rate info using "iw dev wlanx station
>>> dump", the bandwidth seems to sometimes alternate between 20 and 80,
>>> but sometimes it stays fixed at 20. Hence, I was wondering what really
>>> happens.
>>
>>
>> For one thing, if the hardware detects interference on secondary channels,
>> then it may decide to transmit a 20Mhz encoding.
>>
>> The rate-ctrl algs in the firmware differ from release to release, but
>> the general goal is to transmit with the fastest encoding rate.
>>
>> Thanks,
>> Ben
>>
>>>
>>> Thanks,
>>> Gaurang.
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
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
