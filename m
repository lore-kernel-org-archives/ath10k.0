Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uzp9D-0003W0-3N
 for ath10k@lists.infradead.org; Thu, 18 Jul 2013 14:25:35 +0000
Message-ID: <51E7FAC6.4000209@candelatech.com>
Date: Thu, 18 Jul 2013 07:25:10 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k: Firmware crash after removing VAP
References: <51E70AB4.7080307@candelatech.com>
 <CA+BoTQk5GtWzmZA=TJqk4dWnMmEqC5fQJGkGguYsuLpTCca0mw@mail.gmail.com>
 <51E77B48.9040005@candelatech.com>
 <CA+BoTQkuy3dwf_GZTO7x_P9po7uHQmcB02bV-TOuJ4euXf=wUA@mail.gmail.com>
In-Reply-To: <CA+BoTQkuy3dwf_GZTO7x_P9po7uHQmcB02bV-TOuJ4euXf=wUA@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k@lists.infradead.org

On 07/17/2013 10:37 PM, Michal Kazior wrote:
> On 18 July 2013 07:21, Ben Greear <greearb@candelatech.com> wrote:
>> On 07/17/2013 10:12 PM, Michal Kazior wrote:
>>>
>>> Hi Ben,
>>>
>>> On 17 July 2013 23:20, Ben Greear <greearb@candelatech.com> wrote:
>>>>
>>>> I had vap1 on an ath10k NIC, and wlan2 also existed.  I deleted
>>>> the vap1, and very shortly afterwords, the firmware crashed:
>>>>
>>>> ath10k: firmware crashed!
>>>> ath10k: hardware name qca988x hw2.0 version 0x4100016c
>>>> ath10k: firmware version: 1.0.0.636
>>>> ath10k: target register Dump Location: 0x00401930
>>>> ath10k: target Register Dump
>>>> ath10k: [00]: 0x4100016C 0x00000000 0x0098EEF0 0x00000000
>>>> ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0098EEF0
>>>> ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000
>>>> ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>> ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
>>>
>>>
>>> This dump looks suspicious. Are you using vanilla kernel or do you
>>> have a ath regulatory hack patch from OpenWRT applied? If so the
>>> channel scan list is not sent to the firmware and this will cause
>>> firmware to crash.
>>
>>
>> I had some of my own patches in the 3.11 kernel.  I tried the vanilla ath
>> kernel from github and it crashes when adding a second station.
>>
>> Can you (or whoever has firmware access) get something resembling a
>> stack trace from the firmware dump to see where it's crashing?
>
> I don't have access to the firmware to do such a thing.
>
>
>> Has anyone been able to successfully use more than one station with
>> ath10k so far?
>
> Well, it works for me on ath branch.
>
> I'm able to successfully associate 2 STA interfaces or a couple of AP
> interfaces through hostapd's multi bssid support.
>
> One thing you should know - it's impossible to associate with two
> ath10k STA interfaces to the same AP. This is a firmware limitation
> and I'm guessing you're trying to do that because 'Failed to add peer'
> is visible in your other logs.

I was trying to associate to the same AP.  Looks like the firmware
is just too brittle at present...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
