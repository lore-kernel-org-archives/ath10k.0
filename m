Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axHuA-0006oG-Ir
 for ath10k@lists.infradead.org; Mon, 02 May 2016 17:45:11 +0000
Received: by mail-pf0-x231.google.com with SMTP id c189so83775145pfb.3
 for <ath10k@lists.infradead.org>; Mon, 02 May 2016 10:44:50 -0700 (PDT)
Message-ID: <1462211088.5535.262.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 02 May 2016 10:44:48 -0700
In-Reply-To: <CAA93jw6Wv0jcwN5Ct2ro65vWDXSdaLO_srwJrbJm7D_W5Z2+zw@mail.gmail.com>
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
 <CAA93jw6Wv0jcwN5Ct2ro65vWDXSdaLO_srwJrbJm7D_W5Z2+zw@mail.gmail.com>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Michal Kazior <michal.kazior@tieto.com>, Jonathan Morton <chromatix99@gmail.com>, Roman Yeryomin <leroi.lists@gmail.com>

On Mon, 2016-05-02 at 10:08 -0700, Dave Taht wrote:
> On Mon, May 2, 2016 at 9:14 AM, Eric Dumazet <eric.dumazet@gmail.com> wrote:

> >
> > I want to check your qdisc configuration, the one that you used and
> > where you had fq_codel performance issues
> >
> > tc -s -d qdisc
> 
> Not sure it's the qdisc version under test here. ? If it is, I'd be
> perversely happy as for the first time ever the wifi layer started
> exerting some backpressure on the upper layers of the stack.

I wrote fq_codel with a configurable limit of packets.

Default is 10240

I want to see what limit was set on this particular qdisc.

All qdisc are going to drop hell of packets, if say limit is set to 5.

Claiming they are buggy is quite misleading.

fq_codel was designed with the hope of dropping in excess packets at
dequeue() time, not enqueue() time.

Apparently someone did not understand this part.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
