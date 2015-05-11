Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yrv59-0005dR-LN
 for ath10k@lists.infradead.org; Mon, 11 May 2015 21:17:48 +0000
Message-ID: <55511C61.9010907@candelatech.com>
Date: Mon, 11 May 2015 14:17:21 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k: freeze after disconnection on killer1525
References: <5550A5A4.8080908@gmx.com>
 <CA+BoTQk0Lca7mUfELjeHSbY_fiExTopga9J74khnOPkzEU01Xg@mail.gmail.com>
In-Reply-To: <CA+BoTQk0Lca7mUfELjeHSbY_fiExTopga9J74khnOPkzEU01Xg@mail.gmail.com>
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
Cc: Gabriele Martino <g.martino@gmx.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 05/11/2015 06:30 AM, Michal Kazior wrote:
> On 11 May 2015 at 14:50, Gabriele Martino <g.martino@gmx.com> wrote:
>> Hi,
>> I'm using a Killer 1525 with hw2.1 firmware, and sometimes it stop working.
>> I can get it working again disconnecting and reconnecting, but sometimes
>> on disconnection it freezes for a long time:
>>
>> [ 2740.035190] dmar: DRHD: handling fault status reg 2
>> [ 2740.035195] dmar: DMAR:[DMA Read] Request device [03:00.0] fault addr
>> ffbeb000
>>                DMAR:[fault reason 06] PTE Read access is not
>> set
> 
> This looks like DMA tx pool memory address. I suspect
> firmware/hardware tried to access memory which was already unmapped by
> ath10k.
> 
> If you're feeling lucky you could disable IOMMU - this should prevent
> from crashing and disconnecting. However this is hardly a solution
> unless you're okay with the device reading random memory and doing
> *stuff* with it (plaintext password from RAM sent on the air, anyone?
> :-)

I don't actually see a firmware crash here.  This looks a bit like the problem
I hit where the WMI transport basically hangs, but the firmware does not actually
crash.  (I don't remember seeing any DMAR issues in my case, not sure if
that is significant or not.)

I added some keep-alive messages, busy polling, and firmware watchdog logic
to my kernel and firmware that seem to have effectively worked around
this problem.

My kernels also have work-arounds for the hangs (FW watchdog will kill truly hung
firmware in about 5 seconds and then system should recover normally).

Gabriele:  If you want to try my 3.17 kernel and CT firmware I'm curious to
see logs if you see similar problems.

http://www.candelatech.com/ath10k.php

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
