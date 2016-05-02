Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axGUl-0000fE-Hi
 for ath10k@lists.infradead.org; Mon, 02 May 2016 16:14:52 +0000
Received: by mail-pa0-x229.google.com with SMTP id xk12so4631823pac.0
 for <ath10k@lists.infradead.org>; Mon, 02 May 2016 09:14:31 -0700 (PDT)
Message-ID: <1462205669.5535.254.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 02 May 2016 09:14:29 -0700
In-Reply-To: <CACiydbKeKUENncrc-NmYRcku-DGVeGqqzYMqsCqKdxPsR7yUOQ@mail.gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <1462128385.5535.200.camel@edumazet-glaptop3.roam.corp.google.com>
 <C5D365DA-18EE-446E-9D25-41F48B1C583E@gmail.com>
 <1462136140.5535.219.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKUu11=zWitkDha0ddgk1-G_Z4-e1+=9ky776VktF5HHg@mail.gmail.com>
 <1462201620.5535.250.camel@edumazet-glaptop3.roam.corp.google.com>
 <CACiydbKeKUENncrc-NmYRcku-DGVeGqqzYMqsCqKdxPsR7yUOQ@mail.gmail.com>
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
Cc: Jonathan Morton <chromatix99@gmail.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, make-wifi-fast@lists.bufferbloat.net

On Mon, 2016-05-02 at 18:43 +0300, Roman Yeryomin wrote:
> On 2 May 2016 at 18:07, Eric Dumazet <eric.dumazet@gmail.com> wrote:
> > On Mon, 2016-05-02 at 17:18 +0300, Roman Yeryomin wrote:
> >
> >> Imagine you are a video operator, have MacBook Pro, gigabit LAN and
> >> NAS on ethernet side. You would want to get maximum speed. And
> >> fq_codel just dropped it down to 550Mbps for TCP (instead of 750Mbps)
> >> and to 30Mbps for UDP (instead of 900Mbps).
> >> So, again, it looks broken to me.
> >
> > Can you show us your qdisc config ?
> 
> Which build do you want? Before it broke or after?
> 


I want to check your qdisc configuration, the one that you used and
where you had fq_codel performance issues

tc -s -d qdisc



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
