Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WbWoR-0006zA-5y
 for ath10k@lists.infradead.org; Sat, 19 Apr 2014 15:04:15 +0000
Message-ID: <53529051.2040702@candelatech.com>
Date: Sat, 19 Apr 2014 08:03:45 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone else see host machine lockups?
References: <53518697.4090406@candelatech.com>
 <CAJ-Vmok6D88OHUPKhL0hXqX1RFDv42OkuChDBfEN7nB2JLM_sg@mail.gmail.com>
In-Reply-To: <CAJ-Vmok6D88OHUPKhL0hXqX1RFDv42OkuChDBfEN7nB2JLM_sg@mail.gmail.com>
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

On 04/19/2014 07:41 AM, Adrian Chadd wrote:
> Heh, no, but back in the day this'd happen if the DMA engine wasn't
> shut down in the right order. The NIC would start DMAing crap all over
> random memory.
>
> I wonder if that's happening here.

Maybe, but I would hope that such a problem would at least often crash
the OS with some strange crashes as opposed to just silent host lockup?

Thanks,
Ben

>
>
>
> -a
>
>
> On 18 April 2014 13:09, Ben Greear <greearb@candelatech.com> wrote:
>> We can reliably lock up a host system (no splats, no mention of
>> firmware crashes, system just dies) when we bring up or down a
>> bunch of vifs in a system with 3 radios in a PC.
>>
>> Anyone else seeing similar?
>>
>> Thanks,
>> Ben
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
