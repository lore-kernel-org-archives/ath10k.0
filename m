Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuSZa-0001BY-GU
 for ath10k@lists.infradead.org; Mon, 18 May 2015 21:27:43 +0000
Message-ID: <555A5938.9080706@candelatech.com>
Date: Mon, 18 May 2015 14:27:20 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Poor TCP performance with ath10k in 4.0 kernel, again.
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
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Disclosure: I am working with a patched 4.0 kernel, patched ath10k driver, and
patched (CT) ath10k firmware.  Traffic generator is of our own making.

First, this general problem has been reported before, but the
work-arounds previously suggested do not fully resolve my problems.

The basic issue is that when the sending socket is directly on top
of a wifi interface (ath10k driver), then TCP throughput sucks.

For instance, if AP interface sends to station, with 10 concurrent
TCP streams, I see about 426Mbps.  With 100 streams, I see total throughput
of 750Mbps.  These were maybe 10-30 second tests that I did.

Interestingly, a single stream connection performs very poorly at first,
but at least in one test, it eventually ran quite fast.  It is too
complicated to describe in words, but the graph is here:

http://www.candelatech.com/downloads/single-tcp-4.0.pdf

The 10-stream test did not go above about 450Mbps even after running for more than
1 minute, and it was fairly stable around the 450Mbps range after the first few seconds.

100-stream test shows nice stable aggregate throughput:

http://www.candelatech.com/downloads/100-tcp-4.0.pdf

I have tweaked the kernel tcp_limit_output_bytes setting
(tested at 1024k too, did not make any significant difference).

# cat /proc/sys/net/ipv4/tcp_limit_output_bytes
2048000

I have tried forcing TCP send/rcv buffers to be 1MB and 2MB, but that
did not make obvious difference except that it started at the maximum
rate very quickly instead of taking a few seconds to train up to full speed.

If I run a single-stream TCP test, sending on eth1 (Intel 1G NIC)
through the AP machine, then single stream download is about 540 Mbps, and ramps up
quickly.  So, the AP can definitely send the needed amount of TCP packets.

UDP throughput in download direction, single stream, is about 770Mbps, regardless
of whether I originate the socket on the AP or if I pass it through the AP.
send/recv bufs are set to 1MB for UDP sockets.

The 3.17 kernel shows similar behaviour, and the 3.14 kernel is a lot better
for TCP traffic.

Are there tweaks other than tcp_limit_output_bytes that might
improve this behaviour?

I will be happy to grab captures or provide any other debugging info
that someone thinks will be helpful.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
