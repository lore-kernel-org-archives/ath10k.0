Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPulm-0002lS-Qg
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 16:54:51 +0000
Message-ID: <578FAB56.1030606@candelatech.com>
Date: Wed, 20 Jul 2016 09:48:22 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix system hang at qca99x0 probe on x86 platform
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>
 <e05dcb58-1cb1-a33a-31bb-b8ba1edf1363@dd-wrt.com>
 <fa3eab06-28f0-e5d4-2e92-770134b49dfa@dd-wrt.com>
 <1467218124941.40575@qti.qualcomm.com>
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>
 <1468941948774.87860@qti.qualcomm.com>
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>
 <578E5AFA.4000908@candelatech.com>
 <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>
 <CAJ-Vmok95tiLzmnfiBnnOLQK9hXW2DfjPPVGy9yqucq32PBwJw@mail.gmail.com>
 <CA+BoTQ=ehuXpcJUOeSscLKzX9T=hZyp5i2G9GoxTVX=LAg_4hA@mail.gmail.com>
In-Reply-To: <CA+BoTQ=ehuXpcJUOeSscLKzX9T=hZyp5i2G9GoxTVX=LAg_4hA@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Adrian Chadd <adrian@freebsd.org>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, "nbd@nbd.name" <nbd@nbd.name>



On 07/19/2016 11:05 PM, Michal Kazior wrote:
> On 20 July 2016 at 07:44, Adrian Chadd <adrian@freebsd.org> wrote:
>> Hi,
>>
>> dma coherent doesn't /have/ to mean "low 32 bits". It's just supposed
>> to mean "try really hard to use uncached memory on platforms that
>> support it."
>
> Good point. Maybe it does on x86, or at least some machines.
>
> @Ben: Can you verify if that's the case for you? Can you see what
> address ranges hostmem chunks get with and without the GFP_DMA32 (and
> maybe compare it against a revert to compare to dma-coherent as well)?

You just want a printk("%p", foo); for the chunks returned with and without
this flag?

>
>
>> The ath10k hardware (at least what I've played with thus far) is all
>> 32 bit DMA hardware, not 64 bit, so it can't be handed 64 bit memory -
>> contiguous or otherwise.
>>
>> So, if dma coherent on linux means 32 bit only physmem, great.
>>
>> Now, it also turns out that various platforms that say they do
>> coherent memory these days do "mostly coherent", and you still need
>> some flush/sync ops..
>
> Yeah, but since the device has it's own CPU and RAM it has to have a
> way to distinguish local and host memory in some way using these 32
> bits, no? (think about firmware generating local 802.11 frames vs
> pushing frames coming from host driver)

Host memory cannot be accessed directly I think, at least not by normal
code.  Firmware uses some low level 'ce' type logic to handle that I think?

In 10.4 firmware, check out the code-swap code, for instance, or the
rate-ctrl swap logic in 10.1 or higher?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
