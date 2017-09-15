Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dseGt-00009V-1f
 for ath10k@lists.infradead.org; Fri, 15 Sep 2017 00:14:17 +0000
Subject: Re: Failed to wake device (9984)
References: <c88e48ec-fddc-864e-0ed2-d88e9cc07fb5@candelatech.com>
 <CAJ-VmoknefqtxZCMc+PETo7Y3-HOcn0H3ySZqVWDTwMirACfcg@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <cfd0f2d6-5383-1956-5d32-771a1f329f1f@candelatech.com>
Date: Thu, 14 Sep 2017 17:13:54 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-VmoknefqtxZCMc+PETo7Y3-HOcn0H3ySZqVWDTwMirACfcg@mail.gmail.com>
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

On 09/14/2017 05:11 PM, Adrian Chadd wrote:
>
>
> On 14 September 2017 at 17:08, Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>> wrote:
>
>     This is with our hacked 4.9 kernel, hacked firmware, and hacked driver (yah me!).
>
>     Sometimes on reboots, in at least some systems, the device is not woken up correctly,
>     and of course it never recovers.
>
>     Any idea if there is some way to retry this a few times to see if the device
>     can be recovered?
>
>
> There were always weird cold reset races that necessitated a PCI bus reset of the device. :( can you even see the device? do any of the registers work?

Can the cold reset be done on generic x86-64 hardware?

And, it shows up enough that the system probes it, at least.  I guess no
infrastructure to speak of set up for this thing, so not sure how to
probe any registers.

Thanks,
Ben

>
>
>
> -adrian
>
>
>     1177 Sep 14 17:00:09 ct524 kernel: ath10k driver, optimized for CT firmware, probing pci device: 0x46.
>     1178 Sep 14 17:00:09 ct524 systemd[1]: Reached target Swap.
>     1179 Sep 14 17:00:09 ct524 kernel: ath10k_pci 0000:04:00.0: failed to wake up device : -110
>     1180 Sep 14 17:00:09 ct524 kernel: ath10k_pci: probe of 0000:04:00.0 failed with error -110
>
>
>     Thanks,
>     Ben
>     --
>     Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>
>     Candela Technologies Inc  http://www.candelatech.com
>
>
>     _______________________________________________
>     ath10k mailing list
>     ath10k@lists.infradead.org <mailto:ath10k@lists.infradead.org>
>     http://lists.infradead.org/mailman/listinfo/ath10k <http://lists.infradead.org/mailman/listinfo/ath10k>
>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
