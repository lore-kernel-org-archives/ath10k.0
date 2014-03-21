Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQvE6-00053Y-FW
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 08:54:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Failure to allocate large memory blocks upon firmware crash
References: <CAHqTa-3=VZr2-S63HXEX++Y5BvPRuUTKgB_nKhpCCUYD-nGe+A@mail.gmail.com>
Date: Fri, 21 Mar 2014 10:54:28 +0200
In-Reply-To: <CAHqTa-3=VZr2-S63HXEX++Y5BvPRuUTKgB_nKhpCCUYD-nGe+A@mail.gmail.com>
 (Avery Pennarun's message of "Wed, 19 Mar 2014 22:42:06 -0400")
Message-ID: <87pplgaq4b.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hi Avery,

thanks again for the excellent analysis!

Avery Pennarun <apenwarr@gmail.com> writes:

> However, when the firmware crashes, I'm sometimes seeing a followup
> memory allocation failure like this:
>
> ath10k: could not suspend target (-11)
> <6>[30094.735100] : ieee80211 phy1: Hardware restart was requested
> <4>[30094.995413] : kworker/0:1: page allocation failure: order:4, mode:0x20
> <4>[30094.995427] : Backtrace:

[...]

> <3>[30095.077634] : ath10k: Failed to initialize CE src ring for ID: 4 (-12)
> <3>[30095.077646] : ath10k: failed to initialize CE for pipe: 4
> <3>[30095.077678] : ath10k: failed to initialize CE: -1
> <4>[30095.077692] : ath10k: failed to power up target using warm reset
> (-1), trying cold reset
> <7>[30095.165692] z: 03/19/14 09:18:24.116 cap(1):Warning-Unexpected
> packet[297]-pld:{843f6a2191e10147 aa294ff5363573ea 86e610a162a190b4
> 13c096a8349fe599}
> <1>[30095.305945] : Unable to handle kernel NULL pointer dereference
> at virtual address 00000139
> <1>[30095.312742] : pgd = 84004000
> <1>[30095.312755] : [00000139] *pgd=00000000

Ouch!

> Someone at work helpfully diagnosed it as follows.  Is there a plan to
> update to the new DMA API

Does this refer to using dma_alloc_coherent() & co? Yes, we should do
that.

> and/or use smaller block allocations

For this I'm not that sure. I guess it would be nice to have, but not so
important? Maybe for hotplugging this would be important?

> and/or allocate the memory areas at startup time and never free them?

Well, we should free them during remove ;) But yeah, we really should do
that as well.

> The secondary issue here (and what is causing the kernel panic)
> is that a tasklet is still running & referencing memory that
> was torn down when the reset failed.  My sources don't match
> yours, so I can't see what is exactly happening.

This is also a problem we need to investigate. Do you have any more info
where the null pointer dereference happened?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
