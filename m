Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayi9Z-0002lj-GI
 for ath10k@lists.infradead.org; Fri, 06 May 2016 15:58:57 +0000
Received: by mail-pf0-x22a.google.com with SMTP id c189so52737509pfb.3
 for <ath10k@lists.infradead.org>; Fri, 06 May 2016 08:58:36 -0700 (PDT)
Message-ID: <1462550314.13075.51.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Fri, 06 May 2016 08:58:34 -0700
In-Reply-To: <2BFC725A-F007-4D63-89BD-E1845F7E89BE@gmx.de>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
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
 <CAA93jw4XZ1+LLX1z6wQ6DHsp4vFCS5zmMz-uku_8SBNG_KuUxA@mail.gmail.com>
 <542135C7-D7CC-4E33-B35B-C2AD259FA5AB@gmx.de>
 <20160506133323.0b190f47@redhat.com>
 <D29AB9B2-D514-4D14-9A16-CFB9ECD05B17@gmx.de>
 <1462541156.13075.34.camel@edumazet-glaptop3.roam.corp.google.com>
 <2BFC725A-F007-4D63-89BD-E1845F7E89BE@gmx.de>
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
To: moeller0 <moeller0@gmx.de>
Cc: make-wifi-fast@lists.bufferbloat.net, Dave =?ISO-8859-1?Q?T=E4ht?= <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Jesper Dangaard Brouer <brouer@redhat.com>, Jonathan Morton <chromatix99@gmail.com>, Roman Yeryomin <leroi.lists@gmail.com>

On Fri, 2016-05-06 at 17:25 +0200, moeller0 wrote:
> Hi Eric,
> 
> > On May 6, 2016, at 15:25 , Eric Dumazet <eric.dumazet@gmail.com> wrote:

> > Angles of attack :
> > 
> > 1) I will provide a per device /sys/class/net/eth0/gro_max_frags so that
> > we can more easily control amount of segs per GRO packets. It makes
> > sense to have GRO, but not so much allowing it to cook big packets that
> > might hurt FQ.
> 
> 	This sounds great, so we can teach, say sqm to set this to a
> reasonable value given the (shaped) bandwidth of a given interface.
> Would something like this also make sense/is possible on the send side
> for GSO/TSO?

Problem of doing this on the send side, is that too big GRO packets
would need to be segmented _before_ reaching qdisc, and we do not have
such support. (The segmentation happens after qdisc before hitting
device)

In any case, that would be more cpu cycles. It is probably better to
control GRO sizes to optimal values.

I posted the fq_codel patch to netdev :

 https://patchwork.ozlabs.org/patch/619344/



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
