Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2JQd-00085l-D9
 for ath10k@lists.infradead.org; Mon, 16 May 2016 14:23:28 +0000
Received: by mail-pf0-x231.google.com with SMTP id 206so68529150pfu.0
 for <ath10k@lists.infradead.org>; Mon, 16 May 2016 07:23:07 -0700 (PDT)
Message-ID: <1463408582.18194.84.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Make-wifi-fast] OpenWRT wrong adjustment of fq_codel defaults
 (Was: [Codel] fq_codel_drop vs a udp flood)
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 16 May 2016 07:23:02 -0700
In-Reply-To: <CACiydbJWY7xK1tj1Q-umdSNkTy9V+HYQ6SeOxihMASwr1zcApg@mail.gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
 <C5D365DA-18EE-446E-9D25-41F48B1C583E@gmail.com>
 <1462136140.5535.219.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKUu11=zWitkDha0ddgk1-G_Z4-e1+=9ky776VktF5HHg@mail.gmail.com>
 <1462201620.5535.250.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKeKUENncrc-NmYRcku-DGVeGqqzYMqsCqKdxPsR7yUOQ@mail.gmail.com>
 <1462205669.5535.254.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbL26Jj3EcEL4EmqaH=1Dm-Q0dpVwoWxqUSZ7ry10bRgeg@mail.gmail.com>
 <1462464776.13075.18.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbJYrFRMJvSHM6tJYWR8vmgV3xxnSUQsb-h5WcnLW=KXoQ@mail.gmail.com>
 <1462476207.13075.20.camel@edumazet-glaptop3.roam.corp.google.com>
 <20160506114243.4eb4f95e@redhat.com> <20160506144740.210901f5@redhat.com>
 <CACiydbL3qZrvZ4a_OUXiN0dp7qdqOktaQdAUdfOpKkZ1OfEZbA@mail.gmail.com>
 <CACiydb+A_vFNdp7tbw67Rnp+kHwt5GsLa+Su+pO8YmOZYp_KHg@mail.gmail.com>
 <CAA93jw4XeMSxiTLHWZ2b=F9ni7wz9RpkWDdhTh99gn4Mf1aWjA@mail.gmail.com>
 <CACiydbLcYe=2VLb3W9i-i2FGALwxJK=oO8RcZWjmj3YPGObK3Q@mail.gmail.com>
 <CACiydbJWY7xK1tj1Q-umdSNkTy9V+HYQ6SeOxihMASwr1zcApg@mail.gmail.com>
Mime-Version: 1.0
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, make-wifi-fast@lists.bufferbloat.net, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Michal Kazior <michal.kazior@tieto.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, Felix Fietkau <nbd@nbd.name>

On Mon, 2016-05-16 at 11:14 +0300, Roman Yeryomin wrote:

> So, very close to "as before": 900Mbps UDP, 750 TCP.
> But still, I was expecting performance improvements from latest ath10k
> code, not regressions.
> I know that hw is capable of 800Mbps TCP, which I'm targeting.

One flow can reach 800Mbps.

To get this, a simple pfifo is enough.

But _if_ you also want to get decent results with hundreds of flows
under stress, you need something else, and I do not see how 'something'
else would come for free.

You will see some 'regressions' because of additional cpu costs, unless
you have enough cpu cycles and KB of memory to burn for free.

If your goal is to get max throughput on a single TCP flow, in a clean
env an cheap hardware, you absolutely should stick to pfifo. Nothing
could beat pfifo (well, pfifo could be improved using lockless
implementation, but that would matter if you have different cpus
queueing and dequeueing packets)

But I guess your issues mostly come from a too small packet limits, or
to big TCP windows.

Basically, if you test a single TCP flow, fq_codel should behave like a
pfifo, unless maybe your kernel has a very slow ktime_get_ns()
implementation [1]

If you set a limit of 1024 packets on pfifo, you'll have the same amount
of drops and lower TCP throughput.

[1] We probably should have a self-test to have an estimation of
ktime_get_ns() cost




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
