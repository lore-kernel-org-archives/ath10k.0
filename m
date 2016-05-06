Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aye0z-000345-OR
 for ath10k@lists.infradead.org; Fri, 06 May 2016 11:33:50 +0000
Date: Fri, 6 May 2016 13:33:23 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
Message-ID: <20160506133323.0b190f47@redhat.com>
In-Reply-To: <542135C7-D7CC-4E33-B35B-C2AD259FA5AB@gmx.de>
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
To: moeller0 <moeller0@gmx.de>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, Dave =?UTF-8?B?VMOkaHQ=?= <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, brouer@redhat.com, Jonathan Morton <chromatix99@gmail.com>, Roman Yeryomin <leroi.lists@gmail.com>


On Fri, 6 May 2016 10:41:53 +0200 moeller0 <moeller0@gmx.de> wrote:

> 	Speaking out of total ignorance, I ask why not account
> GRO/GSO packets by the number of their fragments against the packet
> limit? Counting a 64kB packets as equivalent to a 64B packet probably
> is the right thing if one tries to account for the work the OS needs
> to perform to figure out what to do with the packet, but for limiting
> the memory consumption it introduces an impressive/manly level of
> uncertainty (2 orders of magnitude). 

Looking at the drop code in fq_codel:
 https://github.com/torvalds/linux/blob/v4.6-rc6/net/sched/sch_fq_codel.c#L136

It looks like we are finding the "fat" flow to drop from based on
number of bytes queued.  And AFAIK skb->len also account for the total
length of all GSO packets (Eric?)

Even better, we are using qdisc_pkt_len(skb), which also account for
the GSO headers in qdisc_pkt_len_init(). 
 https://github.com/torvalds/linux/blob/v4.6-rc6/net/core/dev.c#L2993

If anything, the GSO packets get hit harder by the fq_codel_drop
function, as we drop the entire GSO skb.


Is the issue you are raising that the 1024 packet limit, would allow
1024 x 64K bytes to be queued before the drop kicks in? (Resulting in
using too much memory on your small device).

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  Author of http://www.iptv-analyzer.org
  LinkedIn: http://www.linkedin.com/in/brouer

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
