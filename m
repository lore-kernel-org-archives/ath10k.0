Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.sophos.com ([145.253.124.137])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYd9l-00045y-CQ
 for ath10k@lists.infradead.org; Thu, 19 Mar 2015 16:18:50 +0000
Message-ID: <550AF6CC.6060906@sophos.com>
Date: Thu, 19 Mar 2015 17:18:20 +0100
From: Fabian Wittenberg <Fabian.Wittenberg@sophos.com>
MIME-Version: 1.0
Subject: Re: ath10k + INTEL_IDLE aka. cstates == firmware crash
References: <54EB264D.5040805@sophos.com>	<CA+BoTQnaNmRs9NcXUtJddhD1SfxAy+Ct-s-hD4mvsi9cqh1eSw@mail.gmail.com>	<54EB2ED5.8040104@sophos.com>	<CA+BoTQm01wMzdB1-1V6OE=oNRuCcrrAoRU5LtxYiQt+TmSEfxA@mail.gmail.com>	<54EB3C30.60302@sophos.com>	<CA+BoTQkQq5RG4dDBf0whxBfe5yNvjSb-57AYfoDWeHk-CuZvAw@mail.gmail.com>	<8ab73bee-735c-4140-a050-e52fb2afd5b5@DE-WIE-EXCH3A.green.sophos>	<CAJ-VmonNygdZHU9+aUMh47_hjsRtrEqhH5wvgEWoQepPQh9DhQ@mail.gmail.com>	<550AF1D6.80907@sophos.com>
 <CAJ-Vmo=UEQ+MjZ+tgq9=ED5ca3f=Jb+9iBbs2LDN6zLsEPO94Q@mail.gmail.com>
In-Reply-To: <CAJ-Vmo=UEQ+MjZ+tgq9=ED5ca3f=Jb+9iBbs2LDN6zLsEPO94Q@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I don't have them either even though we have a NDA with QCA.
There seem to be several NDA steps at QCA. It's really hard to get these
papers.
It's a pain in the but...

Regards,
Fabian

Am 19.03.2015 um 17:05 schrieb Adrian Chadd:
> On 19 March 2015 at 08:57, Fabian Wittenberg
> <Fabian.Wittenberg@sophos.com> wrote:
>> Yes, I guessed something like that but this should be a firmwarebug :-\
>> I'm quiet surprized that nowbody else has this problem!?
>> There are so many configuration constellations that trigger this...
> The sleep depth / time that a socket-sleep state can take to wakeup to
> do DMA is highly variable. It's based on chipset, BIOS and sleep
> settings.
>
> IIRC the ath10k firmware wasn't really debugged with hostap-on-intel
> as a supported option, with all the varying things there. So yeah,
> someone with more detailed DMA/PCIe bridge documentation for QCA988x
> is going to have to dig into the DMA register settings to see what's
> going on. Maybe it's just exceeding the transaction timeout and that
> should be easy to fix.
>
> (I currently don't have all of the register documentation for the
> QCA988x as I do for the pre-11ac chips.)
>
>
> adrian
>
>> Fabian
>>
>> Am 19.03.2015 um 16:44 schrieb Adrian Chadd:
>>> It's possible that you're entering a sleep state, the whole socket +
>>> dram controller is going to sleep, and the latency that the wakeup
>>> causes is confusing the firmware and/or DMA engine.
>>>
>>>
>>>
>>> -adrian
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
