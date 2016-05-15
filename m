Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b258n-0000zr-1m
 for ath10k@lists.infradead.org; Sun, 15 May 2016 23:08:05 +0000
Received: by mail-pa0-x242.google.com with SMTP id xm6so2336443pab.3
 for <ath10k@lists.infradead.org>; Sun, 15 May 2016 16:07:44 -0700 (PDT)
Message-ID: <1463353661.18194.50.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: OpenWRT wrong adjustment of fq_codel defaults (Was: [Codel]
 fq_codel_drop vs a udp flood)
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 15 May 2016 16:07:41 -0700
In-Reply-To: <CACiydbLcYe=2VLb3W9i-i2FGALwxJK=oO8RcZWjmj3YPGObK3Q@mail.gmail.com>
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
Cc: make-wifi-fast@lists.bufferbloat.net, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Michal Kazior <michal.kazior@tieto.com>, Jesper Dangaard Brouer <brouer@redhat.com>, Jonathan Morton <chromatix99@gmail.com>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, Felix Fietkau <nbd@nbd.name>

On Mon, 2016-05-16 at 01:34 +0300, Roman Yeryomin wrote:

> qdisc fq_codel 8003: parent :3 limit 1024p flows 16 quantum 1514
> target 80.0ms ce_threshold 32us interval 100.0ms ecn
>  Sent 1601271168 bytes 1057706 pkt (dropped 1422304, overlimits 0 requeues 17)
>  backlog 1541252b 1018p requeues 17
>   maxpacket 1514 drop_overlimit 1422304 new_flow_count 35 ecn_mark 0
>   new_flows_len 0 old_flows_len 1

Why do you have ce_threshold set ? You really should not (even if it
does not matter for the kind of traffic you have at this moment)

If your expected link speed is around 1Gbps, or 80,000 packets per
second, then you have to understand that 1024 packets limit is about 12
ms at most.

Even if the queue is full, max sojourn time of a packet would be 12 ms.

I really do not see how 'target 80 ms' could be hit.

You basically have FQ, with no Codel effect, but with the associated
cost of Codel (having to take timestamps)




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
