Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcbwW-0004PC-Hi
 for ath10k@lists.infradead.org; Tue, 22 Apr 2014 14:45:05 +0000
Message-ID: <53568058.9020009@candelatech.com>
Date: Tue, 22 Apr 2014 07:44:40 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone else see host machine lockups?
References: <53518697.4090406@candelatech.com>
 <CA+BoTQmbdYXJy_VOmoRZrLd+nLpAB6LuHp6QGYmG=-rCJuecmg@mail.gmail.com>
In-Reply-To: <CA+BoTQmbdYXJy_VOmoRZrLd+nLpAB6LuHp6QGYmG=-rCJuecmg@mail.gmail.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 04/21/2014 11:53 PM, Michal Kazior wrote:
> On 18 April 2014 22:09, Ben Greear <greearb@candelatech.com> wrote:
>> We can reliably lock up a host system (no splats, no mention of
>> firmware crashes, system just dies) when we bring up or down a
>> bunch of vifs in a system with 3 radios in a PC.
>>
>> Anyone else seeing similar?
>
>>From what I understand this seems to be faulty CUS hardware design.
> The problem occurs when trying to perform cold reset on target device
> which sometimes leads to voltage drops/spikes which in turn breaks
> PCI-E link. Some host controllers apparently can't deal with it and
> hang the whole machine (e.g. Thinkpad T430), while others just lose
> connectivity with the device and need re-plugging (e.g. Dell E6420) or
> display a splat and need to be restarted before given PCI-E slot can
> be used again (e.g. AP135's "Data bus error").

I see this on WLE900VX NICs as well, so it's not just a CUS issue.

And, I don't think it is just cold-reset, because I do not see any
console messages about attempting a cold reset.

Thanks,
Ben

>
>
> Michal
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
