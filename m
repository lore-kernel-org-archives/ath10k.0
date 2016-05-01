Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1awjiS-00054I-Cn
 for ath10k@lists.infradead.org; Sun, 01 May 2016 05:14:49 +0000
Message-ID: <57258F41.8040600@candelatech.com>
Date: Sat, 30 Apr 2016 22:08:17 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: fq_codel_drop vs a udp flood
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
In-Reply-To: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Dave Taht <dave.taht@gmail.com>, ath10k <ath10k@lists.infradead.org>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, make-wifi-fast@lists.bufferbloat.net



On 04/30/2016 08:41 PM, Dave Taht wrote:
> There were a few things on this thread that went by, and I wasn't on
> the ath10k list
>
> (https://www.mail-archive.com/ath10k@lists.infradead.org/msg04461.html)
>
> first up, udp flood...
>
>>>> From: ath10k <ath10k-boun...@lists.infradead.org> on behalf of Roman
>>>> Yeryomin <leroi.li...@gmail.com>
>>>> Sent: Friday, April 8, 2016 8:14 PM
>>>> To: ath10k@lists.infradead.org
>>>> Subject: ath10k performance, master branch from 20160407
>>>>
>>>> Hello!
>>>>
>>>> I've seen performance patches were commited so I've decided to give it
>>>> a try (using 4.1 kernel and backports).
>>>> The results are quite disappointing: TCP download (client pov) dropped
>>>> from 750Mbps to ~550 and UDP shows completely weird behavour - if
>>>> generating 900Mbps it gives 30Mbps max, if generating 300Mbps it gives
>>>> 250Mbps, before (latest official backports release from January) I was
>>>> able to get 900Mbps.
>>>> Hardware is basically ap152 + qca988x 3x3.
>>>> When running perf top I see that fq_codel_drop eats a lot of cpu.
>>>> Here is the output when running iperf3 UDP test:
>>>>
>>>>      45.78%  [kernel]       [k] fq_codel_drop
>>>>       3.05%  [kernel]       [k] ag71xx_poll
>>>>       2.18%  [kernel]       [k] skb_release_data
>>>>       2.01%  [kernel]       [k] r4k_dma_cache_inv
>
> The udp flood behavior is not "weird".  The test is wrong. It is so filling
> the local queue as to dramatically exceed the bandwidth on the link.

It would be nice if you could provide backpressure so that you could
simply select on the udp socket and use that to know when you can send
more frames??

Any idea how that works with codel?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
