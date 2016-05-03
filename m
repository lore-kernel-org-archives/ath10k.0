Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axaUV-0006VN-Av
 for ath10k@lists.infradead.org; Tue, 03 May 2016 13:35:55 +0000
Received: by mail-vk0-x22c.google.com with SMTP id m188so23335255vka.1
 for <ath10k@lists.infradead.org>; Tue, 03 May 2016 06:35:34 -0700 (PDT)
Message-ID: <1462282531.5535.307.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Codel] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 03 May 2016 06:35:31 -0700
In-Reply-To: <7A2801D5E40DD64A85E38DF22117852CD09A1873@wdc1exchmbxp01.hq.corp.viasat.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <CAA93jw6WKyWmgzni1Tn0oQfJyN7hss++MKLkJ8+3sRcVLu7krg@mail.gmail.com>
 <CAA93jw5NwBMzNrm6S2wPnx4yLTYq1k_J-cJ_Bi73p_uD_uo1xw@mail.gmail.com>
 <7A2801D5E40DD64A85E38DF22117852CD09A181F@wdc1exchmbxp01.hq.corp.viasat.com>
 <7A2801D5E40DD64A85E38DF22117852CD09A1873@wdc1exchmbxp01.hq.corp.viasat.com>
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
To: "Agarwal, Anil" <Anil.Agarwal@viasat.com>
Cc: Jonathan Morton <chromatix99@gmail.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, "make-wifi-fast@lists.bufferbloat.net" <make-wifi-fast@lists.bufferbloat.net>

On Tue, 2016-05-03 at 12:50 +0000, Agarwal, Anil wrote:
> I should be more precise about the statement about the inaccuracy of the algorithm.
> Given that we dequeue packets in round robin manner, the maxqidx value may, on occasions, point to a queue 
> which is smaller than the largest queue by up to one MTU.

That is not true.

Linux qdiscs (fq_codel being one of them) can carry big packets, up to
64KB in size.

You can not assume GRO/GSO are disabled. We absolutely want them for
high performance.

There is no way fq_codel will track in real time the biggest flow 'just
in case we have to drop packets at enqueue()'

This is a conscious choice I made years ago.

This patch will fix the performance issue and keep the normal operations
fast.

https://patchwork.ozlabs.org/patch/617307/




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
