Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axeXZ-0002as-Kg
 for ath10k@lists.infradead.org; Tue, 03 May 2016 17:55:54 +0000
Received: by mail-pf0-x232.google.com with SMTP id 206so13577490pfu.0
 for <ath10k@lists.infradead.org>; Tue, 03 May 2016 10:55:01 -0700 (PDT)
Message-ID: <1462298099.5535.315.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 03 May 2016 10:54:59 -0700
In-Reply-To: <CAA93jw4JrsR+3pR31OvghppU6n3VnvFodnFNfLkj8=4K_u4YNw@mail.gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <CAA93jw6WKyWmgzni1Tn0oQfJyN7hss++MKLkJ8+3sRcVLu7krg@mail.gmail.com>
 <CAA93jw5NwBMzNrm6S2wPnx4yLTYq1k_J-cJ_Bi73p_uD_uo1xw@mail.gmail.com>
 <7A2801D5E40DD64A85E38DF22117852CD09A181F@wdc1exchmbxp01.hq.corp.viasat.com>
 <7A2801D5E40DD64A85E38DF22117852CD09A1873@wdc1exchmbxp01.hq.corp.viasat.com>
 <1462282531.5535.307.camel@edumazet-glaptop3.roam.corp.google.com>
 <CAA93jw4JrsR+3pR31OvghppU6n3VnvFodnFNfLkj8=4K_u4YNw@mail.gmail.com>
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
Cc: Jonathan Morton <chromatix99@gmail.com>, "Agarwal,
 Anil" <Anil.Agarwal@viasat.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>, "make-wifi-fast@lists.bufferbloat.net" <make-wifi-fast@lists.bufferbloat.net>

On Tue, 2016-05-03 at 10:37 -0700, Dave Taht wrote:
> Thus far this batch drop patch is testing out beautifully. Under a
> 900Mbit flood going into 100Mbit on the pcengines apu2,  cpu usage for
> ksoftirqd now doesn't crack 10%, where before (under
> pie,pfifo,fq_codel,cake & the prior fq_codel) it went to 88% and
> ultimately bad things happened, like losing routability.
> 
> I've had it running for hours and I hardly notice it's there.
> 

Excellent, thanks for testing it.

> Performance for the normal cc controlled and/or sparse flows is
> unaffected, aside from the uncontrolled flows eating their percentage
> of the link.
> 
> Nice work. Thx. This should go into -stable.
> 
> https://patchwork.ozlabs.org/patch/617307/
> 
> Sigh. The RFC is past last call...

It is merged :

https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/commit/?id=9d18562a227874289fda8ca5d117d8f503f1dcca



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
