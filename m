Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W68IR-0001jB-Uu
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 00:37:28 +0000
Message-ID: <52E06430.5060408@candelatech.com>
Date: Wed, 22 Jan 2014 16:37:04 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: BAR error, failed to get chip id.
References: <52E02B28.6020503@candelatech.com>
 <CAJ-VmokveU-WxqboRhdagLwp2E2o-Bic7Pd4LvHaj7TX+rBnYA@mail.gmail.com>
In-Reply-To: <CAJ-VmokveU-WxqboRhdagLwp2E2o-Bic7Pd4LvHaj7TX+rBnYA@mail.gmail.com>
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
To: Adrian Chadd <adrian.chadd@gmail.com>
Cc: ath10k@lists.infradead.org

On 01/22/2014 04:10 PM, Adrian Chadd wrote:
> Tgis is rev 2.0 right? I recall reset bugs in 1.0 that had the pcie bits not setup right by the firmware after a cold reset.

I'm using a rev 2 development NIC (CUS223, I think..haven't cracked the
machine open in a while).

I usually get about 1-3 module reloads before the system either totally
freezes or prints out the info below (and fails to load the driver),
requiring reboot of the system.

I have been working on other features and bugs and have been ignoring
these lockups, but now I'm a bit more interested in trying to resolve
them...

Thanks,
Ben


> 
> Adrian
> 
> On Jan 22, 2014 3:34 PM, "Ben Greear" <greearb@candelatech.com <mailto:greearb@candelatech.com>> wrote:
> 
> 
>     I see this fairly often on module reload.  Firmware is modified
>     by me, based on 10.1.389, so if there are firmware fixes since then
>     that address this problem I would not know of it.  Kernel is ath-testing,
>     with some local changes, but nothing pertaining to the pci code.
> 
> 
>     Kernel 3.13.0-rc8-wl-ath+ on an x86_64 (ttyS0)
> 
>     ct523-9292 login: ath10k_pci 0000:05:00.0: BAR 0: error updating (0xf4400004 != 0xffffffff)
>     ath10k_pci 0000:05:00.0: BAR 0: error updating (high 0x000000 != 0xffffffff)
>     ath10k: Failed to get chip id: -110
> 
> 
>     After this, it takes a power cycle to get the system working again.
> 
>     Anyone seen similar?
> 
>     Thanks,
>     Ben
> 
>     --
>     Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>
>     Candela Technologies Inc  http://www.candelatech.com
> 
> 
>     _______________________________________________
>     ath10k mailing list
>     ath10k@lists.infradead.org <mailto:ath10k@lists.infradead.org>
>     http://lists.infradead.org/mailman/listinfo/ath10k
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
