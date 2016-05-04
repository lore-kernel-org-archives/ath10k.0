Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axrlU-0002y9-0v
 for ath10k@lists.infradead.org; Wed, 04 May 2016 08:02:37 +0000
Received: by mail-oi0-x22b.google.com with SMTP id x19so56185021oix.2
 for <ath10k@lists.infradead.org>; Wed, 04 May 2016 01:02:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw7uHvkKTUtXZqqWbDSWDxb=sZ+sfhdmMM1SZW3BsmZ1xA@mail.gmail.com>
References: <CAA93jw7uHvkKTUtXZqqWbDSWDxb=sZ+sfhdmMM1SZW3BsmZ1xA@mail.gmail.com>
Date: Wed, 4 May 2016 11:02:14 +0300
Message-ID: <CACiydbJGpyak1jCm+eqG=xez4wP4AFciYf5DvQCu4-8E7A_Xyw@mail.gmail.com>
Subject: Re: iperf3 udp flood behavior at higher rates
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

On 3 May 2016 at 02:18, Dave Taht <dave.taht@gmail.com> wrote:
> to fork the fq_codel_drop discussion a bit...
>
> I have up and running two new boxes[1] that are my hope to be able to
> test ath10k/ath9k hardware with, for this test, using one in the
> middle as a router and a nuc i3 box as the server, all ports pure
> ethernet... there's a switch in the way, too.
>
> On tcp via netperf I get expected ~940 mbits.
>
> On udp via iperf3 (again, all pure ethernet) -  in neither case below
> am I seeing any drops in the qdisc itself anywhere on the path, yet am
> only achieving 500mbit.

That's interesting, I have no problems with UDP over ethernet.
What about TCP with iperf3?

> ?
>
> 1) Using the
>
> iperf3 -c 172.26.16.130 -u -b900M -R -l1472 -t600
>
> udp flood version, I get some loss on the initial burst, but none
> *reported* after that, and peak at about ~500Mbits.
>
> [ ID] Interval           Transfer     Bandwidth       Jitter
> Lost/Total Datagrams
> [  4]   0.00-1.00   sec  52.1 MBytes   437 Mbits/sec  0.037 ms
> 1276/38379 (3.3%)
> [  4]   1.00-2.00   sec  54.3 MBytes   456 Mbits/sec  0.042 ms  0/38699 (0%)
> [  4]   2.00-3.00   sec  56.1 MBytes   470 Mbits/sec  0.030 ms  0/39933 (0%)
>
> 2) Flipping the sense of the test by getting rid of -R (from the nuc)
>
> iperf3 -c 172.26.16.130 -u -b900M -l1472 -t600
>
> I get on the other side a steady state throughput of a little over
> 520mbits (with 41% loss reported consistently)
>
> [  5]  37.00-38.00  sec  64.2 MBytes   539 Mbits/sec  0.026 ms
> 31613/77355 (41%)
> [  5]  38.00-39.00  sec  62.8 MBytes   527 Mbits/sec  0.023 ms
> 31517/76255 (41%)
> [  5]  39.00-40.00  sec  62.0 MBytes   520 Mbits/sec  0.033 ms
> 31052/75201 (41%)
>
> On the other:
>
> [  4]  77.00-78.00  sec   111 MBytes   929 Mbits/sec  78915
> [  4]  78.00-79.00  sec   103 MBytes   864 Mbits/sec  73371
> [  4]  79.00-80.00  sec   108 MBytes   907 Mbits/sec  77034
> [  4]  80.00-81.00  sec   107 MBytes   900 Mbits/sec  76423
> [  4]  81.00-82.00  sec   104 MBytes   875 Mbits/sec  74277
> [  4]  82.00-83.00  sec   113 MBytes   950 Mbits/sec  80666
>
>
> Thinking that perhaps I was seeing loss in the rx ring, I used ethtool
> to increase that from the default 256 to 4096...
>
> only to hang things thoroughly... :( and I'm watching things reboot now.
>
> Netperf does not have a multi-hop capable udp flood test (rick jones
> can explain why... )
>
> As I recall on this thread iperf3 was being run on a mac box as a
> client, and I'll dig one up - but was it also osx on the other side of
> the test?
>
> And what other params would I tweak on linux to see a udp flood go faster?

I would try making packets smaller (-l), maybe they are fragmented somewhere.

> Topology looks like this:
>
> apu1 <-> apu2 <-> switch <-> nuc.
>
> I could put another switch in the way, I am always nervous about
> invoking hw flow control...
>
> [1] http://www.pcengines.ch/apu2c4.htm

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
