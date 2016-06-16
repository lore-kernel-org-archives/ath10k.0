Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]
 helo=omr2.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDg1m-0004zH-KD
 for ath10k@lists.infradead.org; Thu, 16 Jun 2016 22:44:47 +0000
Received: from mr5.cc.vt.edu (mr5.cc.ipv6.vt.edu
 [IPv6:2001:468:c80:2105:0:2b8:b328:9234])
 by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5GMiOIO011448
 for <ath10k@lists.infradead.org>; Thu, 16 Jun 2016 18:44:24 -0400
Received: from mail-lb0-f199.google.com (mail-lb0-f199.google.com
 [209.85.217.199])
 by mr5.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5GMiJhI030952
 for <ath10k@lists.infradead.org>; Thu, 16 Jun 2016 18:44:24 -0400
Received: by mail-lb0-f199.google.com with SMTP id jf8so33104756lbc.3
 for <ath10k@lists.infradead.org>; Thu, 16 Jun 2016 15:44:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5763120E.4040902@candelatech.com>
References: <CAFc9h7uxTOUxONvW-gvgkFLUNR9OBn09kfetF9gqAtcNqN3SLg@mail.gmail.com>
 <5758FD6B.40409@candelatech.com>
 <CAFc9h7s69rVpMNUx553zsHfLf2uLcqx0jhKqma-+SxA6EkybMA@mail.gmail.com>
 <5763120E.4040902@candelatech.com>
From: Gaurang Ramesh Naik <gaurang@vt.edu>
Date: Thu, 16 Jun 2016 18:44:17 -0400
Message-ID: <CAFc9h7uBnGK_paWPCzb_R=kFmcGKenSY6-Ab1c--pfhKn9cAWw@mail.gmail.com>
Subject: Re: Dynamic Bandwidth in hw rate control
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Thanks Ben and Dave for your replies. So what I understand is that
dynamic bandwidth management is a part of the rate control algorithm
(which is implemented in firmware) and hence I have not much control
over how that works.

I am assuming your firmware is the one that can be downloaded from
http://www.candelatech.com/ath10k.php Is your kernel a modified one
too? When you say I can see the tx rate for each frame, is it through
some logs? I could try to get some info by using that. Thanks again.

Slightly unrelated, but is there a way I can play around with PIFS
value? I could not locate it in the ath10k source, so I am assuming it
is implemented in the firmware. I am trying to study some fairness
issues when legacy devices operate in the secondary channels.

On Thu, Jun 16, 2016 at 4:54 PM, Ben Greear <greearb@candelatech.com> wrote:
> On 06/16/2016 12:57 PM, Gaurang Ramesh Naik wrote:
>>
>> Hi Ben,
>>
>> Thanks for your reply.
>>
>> I wanted to know if the dynamic bandwidth option implemented in ath10k
>> is the same as that mentioned in the standard, or does it deviate? I
>> tried to look for any documentation on ath10k dynamic bandwidth, but
>> could not find any.
>>
>> If I am not wrong, on the secondary channel, the sender senses the
>> channel for PIFS interval of time immediately preceding the start of
>> the TXOP (9.19.2.8 in the standard). In the static mode, if the
>> secondary channel is sensed busy, the sender waits until all channels
>> become idle; but in the dynamic mode, the sender sends on the primary
>> and (adjacent) secondary channel that are not busy.
>>
>> However, the documentation for dynamic bandwidth in ath10k/mac.c seems
>> to suggest that the transmission retries are carried over narrower
>> bandwidth in dynamic mode. Does this mean the same as what is given in
>> the standard? Or is the dynamic mode implemented differently? Any help
>> is appreciated.
>
>
> I don't know exactly how this works.  At least the sensing and stuff is
> probably
> baked into the hardware.  What I notice is that the firmware passes a series
> of rates to the hardware to use for each packet, and it includes different
> bandwidth rates.
>
> If you used my firmware and my kernel, you can see the (successful) transmit
> rate for each frame.  Perhaps you could discover some info about how it
> works
> in that manner if you could reliably add noise on an adjacent channel.
>
> Upstream firmware can see tx rates using pktlog I think, but I have
> never tried that.
>
> Thanks,
> Ben
>
>
>>
>> Thanks,
>> Gaurang.
>>
>> On Thu, Jun 9, 2016 at 1:23 AM, Ben Greear <greearb@candelatech.com>
>> wrote:
>>>
>>>
>>>
>>> On 06/08/2016 08:10 PM, Gaurang Ramesh Naik wrote:
>>>>
>>>>
>>>> Hi,
>>>>
>>>> I needed a small clarification related to dynamic bandwidth setup. The
>>>> documentation in wmi.h says " When enabled HW rate control tries
>>>> different bandwidths when retransmitting frames."
>>>>
>>>> Does this mean that each packet is first always tried over VHT80 and
>>>> if that fails it goes to HT40 and then to HT20? I tried this with one
>>>> AP-Sta operating in VHT80 and one AP operating in its first secondary
>>>> channel. When I check the rx rate info using "iw dev wlanx station
>>>> dump", the bandwidth seems to sometimes alternate between 20 and 80,
>>>> but sometimes it stays fixed at 20. Hence, I was wondering what really
>>>> happens.
>>>
>>>
>>>
>>> For one thing, if the hardware detects interference on secondary
>>> channels,
>>> then it may decide to transmit a 20Mhz encoding.
>>>
>>> The rate-ctrl algs in the firmware differ from release to release, but
>>> the general goal is to transmit with the fastest encoding rate.
>>>
>>> Thanks,
>>> Ben
>>>
>>>>
>>>> Thanks,
>>>> Gaurang.
>>>>
>>>> _______________________________________________
>>>> ath10k mailing list
>>>> ath10k@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>
>>>
>>> --
>>> Ben Greear <greearb@candelatech.com>
>>> Candela Technologies Inc  http://www.candelatech.com
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
