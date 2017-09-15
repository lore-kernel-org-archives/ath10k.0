Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dstxc-0006oQ-Co
 for ath10k@lists.infradead.org; Fri, 15 Sep 2017 16:59:33 +0000
Subject: Re: Failed to wake device (9984)
References: <c88e48ec-fddc-864e-0ed2-d88e9cc07fb5@candelatech.com>
 <CAJ-VmoknefqtxZCMc+PETo7Y3-HOcn0H3ySZqVWDTwMirACfcg@mail.gmail.com>
 <cfd0f2d6-5383-1956-5d32-771a1f329f1f@candelatech.com>
 <CAJ-Vmom-DUM7R9sGL5SVeMysm-tkRkNrFVXkSfx4kJ+W4yzr1w@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <9068d06f-9245-1eb9-cac3-819c6ed6d471@candelatech.com>
Date: Fri, 15 Sep 2017 09:59:01 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmom-DUM7R9sGL5SVeMysm-tkRkNrFVXkSfx4kJ+W4yzr1w@mail.gmail.com>
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

On 09/14/2017 07:33 PM, Adrian Chadd wrote:
> On 14 September 2017 at 17:13, Ben Greear <greearb@candelatech.com> wrote:
>
>>>
>>> There were always weird cold reset races that necessitated a PCI bus reset of the device. :( can you even see the device? do any of the registers work?
>>
>>
>> Can the cold reset be done on generic x86-64 hardware?
>
> I'll have to go check. You /should/ be able to. Are there are power
> and reset files in /sys/bus/pci for those devices?
>
>>
>> And, it shows up enough that the system probes it, at least.  I guess no
>> infrastructure to speak of set up for this thing, so not sure how to
>> probe any registers.
>
> Well, that could be cached BAR information. There are some cold / warm
> reset registers in the RTC block that are used during initial wakeup;
> print what they're saying to see if it's coming back 0xfffffff or
> 0xdeadc0de or something?

One thing I notice, if I simply:  rmmod ath10k_pci ath10k_core; modprobe ath10k_pci
then it recovered (1 of 1 so far).

We'll see if that is a reliable way to recover from this problem.  And, will see if we
can also find a nicer way to go about it...maybe there is just a timer that is not long
enough somewhere?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
