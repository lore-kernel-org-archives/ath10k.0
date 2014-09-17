Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUHXA-0001Kh-V8
 for ath10k@lists.infradead.org; Wed, 17 Sep 2014 15:52:45 +0000
Message-ID: <5419AE32.6010805@candelatech.com>
Date: Wed, 17 Sep 2014 08:52:18 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Hard lockup during vif restart tests.
References: <541884AC.3020402@candelatech.com>
 <CA+BoTQkeSSp5K=Ov-Sce9tcKz5ARL1im615PckPgNK-X8O-c1Q@mail.gmail.com>
In-Reply-To: <CA+BoTQkeSSp5K=Ov-Sce9tcKz5ARL1im615PckPgNK-X8O-c1Q@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 09/16/2014 11:34 PM, Michal Kazior wrote:
> On 16 September 2014 20:42, Ben Greear <greearb@candelatech.com> wrote:
>> This is on a 3.14.14+ hacked kernel, with CT firmware.
>>
>> Test case is to restart stations (and the AP
>> on the other side) every 10-30 seconds.
>> After a bit, the station machine locked up hard.
>>
>> I have no idea how to trouble-shoot this better, so this is
>> just FYI.
>>
> [...]
>> ath10k: boot warm reset complete
>> ath10k: failed to power up target using warm reset: -110
>> ath10k: trying cold reset
>> ath10k: boot cold reset
>> ath10k: boot cold reset complete
>> [hang, even sysrq will not work]
> 
> There's a known problem with cold reset being capable of locking up
> entire system (depends on the pci-e controller, e.g. AP135 splats a
> Data Bus Error instead).
> 
> Actually warm reset can do the same in some corner cases: try running
> Rx traffic and just start the recovery sequence (without actually
> crashing the fw). My x86 locks up very easily with this.
> 
> I strongly suggest you use reset_mode=1 when you load ath10k_pci so
> cold reset isn't used. This may result in ath10k being unable to bring
> up the device in some rare cases (e.g. after an IOMMU fault if your
> system supports it) but I believe it's far better than having the
> whole system lock up.
> 
> My suspicion is tx/rx rings, dma transfer engines, internal irqs
> aren't stopped properly. I have a prototype patch for the warm reset
> problem but it's incomplete and I'm not sure if I can share it yet.

I will try the warm-reset-only flag, and I do hope you have success
with the warm/cold reset fixes.

But, I still wonder if we could just reset less often and maybe
make it a bit harder to hit these problems?

Why do we reset the firmware/NIC when we admin down/up the
vif (when a single vif is active)?  Couldn't we just keep
the firmware active in this state and not risk lockup due
to reset?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
