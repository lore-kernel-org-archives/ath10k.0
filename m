Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x236.google.com ([2607:f8b0:4002:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dswSC-0003kb-1s
 for ath10k@lists.infradead.org; Fri, 15 Sep 2017 19:39:09 +0000
Received: by mail-yw0-x236.google.com with SMTP id w22so2033433ywa.13
 for <ath10k@lists.infradead.org>; Fri, 15 Sep 2017 12:38:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <9068d06f-9245-1eb9-cac3-819c6ed6d471@candelatech.com>
References: <c88e48ec-fddc-864e-0ed2-d88e9cc07fb5@candelatech.com>
 <CAJ-VmoknefqtxZCMc+PETo7Y3-HOcn0H3ySZqVWDTwMirACfcg@mail.gmail.com>
 <cfd0f2d6-5383-1956-5d32-771a1f329f1f@candelatech.com>
 <CAJ-Vmom-DUM7R9sGL5SVeMysm-tkRkNrFVXkSfx4kJ+W4yzr1w@mail.gmail.com>
 <9068d06f-9245-1eb9-cac3-819c6ed6d471@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 15 Sep 2017 12:38:45 -0700
Message-ID: <CAJ-VmokDxfHbZ0VhdiuMcT-Q7hAcStn-j4z9079EqiyjRMXh1g@mail.gmail.com>
Subject: Re: Failed to wake device (9984)
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
Cc: ath10k <ath10k@lists.infradead.org>

On 15 September 2017 at 09:59, Ben Greear <greearb@candelatech.com> wrote:
> On 09/14/2017 07:33 PM, Adrian Chadd wrote:
>>
>> On 14 September 2017 at 17:13, Ben Greear <greearb@candelatech.com> wrote:
>>
>>>>
>>>> There were always weird cold reset races that necessitated a PCI bus
>>>> reset of the device. :( can you even see the device? do any of the registers
>>>> work?
>>>
>>>
>>>
>>> Can the cold reset be done on generic x86-64 hardware?
>>
>>
>> I'll have to go check. You /should/ be able to. Are there are power
>> and reset files in /sys/bus/pci for those devices?
>>
>>>
>>> And, it shows up enough that the system probes it, at least.  I guess no
>>> infrastructure to speak of set up for this thing, so not sure how to
>>> probe any registers.
>>
>>
>> Well, that could be cached BAR information. There are some cold / warm
>> reset registers in the RTC block that are used during initial wakeup;
>> print what they're saying to see if it's coming back 0xfffffff or
>> 0xdeadc0de or something?
>
>
> One thing I notice, if I simply:  rmmod ath10k_pci ath10k_core; modprobe
> ath10k_pci
> then it recovered (1 of 1 so far).

See if that's reliable. For QCA9880 I know it needed a full
reacharound sometimes (ie, the reference driver has hooks to reach
back into the PCIe nexus to toggle reset.)

> We'll see if that is a reliable way to recover from this problem.  And, will
> see if we
> can also find a nicer way to go about it...maybe there is just a timer that
> is not long
> enough somewhere?

It's possible. I am just always wary about their host glue in the chip
:-) If reloading the driver helps then great. But all that /should/ be
dong is a cold reset / wakeup..



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
