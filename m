Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awztI-0006Ah-EG
 for ath10k@lists.infradead.org; Sun, 01 May 2016 22:31:04 +0000
Received: by mail-qk0-x22d.google.com with SMTP id q76so59072868qke.2
 for <ath10k@lists.infradead.org>; Sun, 01 May 2016 15:30:44 -0700 (PDT)
Message-ID: <1462141840.5535.223.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 01 May 2016 15:30:40 -0700
In-Reply-To: <CAA93jw5JxwvLb03gR-fDdgsxT4t+nbJ979oaXBfF044QD784Bg@mail.gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <CAA93jw5JxwvLb03gR-fDdgsxT4t+nbJ979oaXBfF044QD784Bg@mail.gmail.com>
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
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>

On Sun, 2016-05-01 at 11:26 -0700, Dave Taht wrote:
> On Sun, May 1, 2016 at 10:59 AM, Eric Dumazet <eric.dumazet@gmail.com> wrote:
> >
> > Well, just _kill_ the offender, instead of trying to be gentle.
> 
> I like it. :) Killing off a malfunctioning program flooding the local
> network interface (intentionally or unintentionally) seems like a
> useful idea.
> 
..

> Killing the bad program, and dropping all of the fattest flow strike
> me as two patches.[1]

What I meant by 'killing' was to drop more than one packet from this fat
flow, not actually killing a task.

I will submit an official patch, dropping 50% of the fat flow backlog,
and a configurable cap of 64 packets to somewhat control max ->enqueue()
latency.







_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
