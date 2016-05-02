Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axFMM-0003Ma-Ju
 for ath10k@lists.infradead.org; Mon, 02 May 2016 15:02:08 +0000
Received: by mail-pa0-x229.google.com with SMTP id xk12so3838238pac.0
 for <ath10k@lists.infradead.org>; Mon, 02 May 2016 08:01:45 -0700 (PDT)
Message-ID: <1462201302.5535.245.camel@edumazet-glaptop3.roam.corp.google.com>
Subject: Re: [Make-wifi-fast] fq_codel_drop vs a udp flood
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Mon, 02 May 2016 08:01:42 -0700
In-Reply-To: <CACiydbJStMOr0HKpw68zxDPgQRdwjR88aDis9fv12umzKAvWqw@mail.gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <CACiydbJStMOr0HKpw68zxDPgQRdwjR88aDis9fv12umzKAvWqw@mail.gmail.com>
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
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>

On Mon, 2016-05-02 at 16:47 +0300, Roman Yeryomin wrote:

> So it looks to me that fq_codel is just broken if it needs half of my resources.

Agreed.

When I wrote fq_codel, I was not expecting that one UDP socket could
fill fq_codel with packets, since we have standard backpressure.

SO_SNDBUF default on UDP does not allow to send more than 256 packets in
a qdisc. So when sk_sndbuf limit is hit, sendmsg() either blocks or
returns an error (if in non blocking mode)

So it looks like someone really tries hard ;)

To reproduce the issue I had to change (as root user)

echo 1000000 >/proc/sys/net/core/wmem_default

_and_ setup fq_codel with a much lower limit than the default 10240
limit

tc qdisc replace dev eth0 root fq_codel limit 300

So please try this fix :

https://patchwork.ozlabs.org/patch/617307/






_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
