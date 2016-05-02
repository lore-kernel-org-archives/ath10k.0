Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axECg-0001mh-Dx
 for ath10k@lists.infradead.org; Mon, 02 May 2016 13:48:03 +0000
Received: by mail-oi0-x242.google.com with SMTP id d139so6328815oig.1
 for <ath10k@lists.infradead.org>; Mon, 02 May 2016 06:47:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
Date: Mon, 2 May 2016 16:47:40 +0300
Message-ID: <CACiydbJStMOr0HKpw68zxDPgQRdwjR88aDis9fv12umzKAvWqw@mail.gmail.com>
Subject: Re: [Make-wifi-fast] fq_codel_drop vs a udp flood
From: Roman Yeryomin <leroi.lists@gmail.com>
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

On 1 May 2016 at 06:41, Dave Taht <dave.taht@gmail.com> wrote:
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
>>>>     45.78%  [kernel]       [k] fq_codel_drop
>>>>      3.05%  [kernel]       [k] ag71xx_poll
>>>>      2.18%  [kernel]       [k] skb_release_data
>>>>      2.01%  [kernel]       [k] r4k_dma_cache_inv
>
> The udp flood behavior is not "weird".  The test is wrong. It is so filling
> the local queue as to dramatically exceed the bandwidth on the link.

Are you trying to say that generating 250Mbps and having 250Mbps an
generating, e.g. 700Mbps and having 30Mbps is normal and I should
blame iperf3? Even if before I could get 900Mbps with the same
tools/parameters/hw? Really?

> The size of the local queue has exceeded anything rational, gentle
> tcp-friendly methods have failed, we're out of configured queue space,
>  and as a last ditch move, fq_codel_drop is attempting to reduce the
> backlog via brute force.

So it looks to me that fq_codel is just broken if it needs half of my resources.

> Approaches:
>
> 0) Fix the test
>
> The udp flood test should seek an operating point roughly equal to
> the bandwidth of the link, to where there is near zero queuing delay,
> and nearly 100% utilization.
>
> There are several well known methods for an endpoint to seek
> equilibrium, - filling the pipe and not the queue - notably the ones
> outlined in this:
>
> http://ee.lbl.gov/papers/congavoid.pdf
>
> are a good starting point for further research. :)
>
> Now, a unicast flood test is useful for figuring out how many packets
> can fit in a link (both large and small), and tweaking the cpu (or
> running a box out of memory).
>
> However -
>
> I have seen a lot of udp flood tests that are constructed badly.
>
> Measuring time to *send* X packets without counting the queue length
> in the test is one. This was iperf3 what options, exactly? Running
> locally or via a test client connected via ethernet? (so at local cpu
> speeds, rather than the network ingress speed?)

iperf3 -c <server_ip> -u -b900M -l1472 -R -t600
server_ip is on ethernet side, no NAT, minimal system, client is 3x3 MacBook Pro


Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
