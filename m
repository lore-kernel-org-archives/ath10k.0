Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zi9yj-0003p2-QB
 for ath10k@lists.infradead.org; Fri, 02 Oct 2015 23:43:06 +0000
From: Ben Greear <greearb@candelatech.com>
Subject: Slow ramp-up for single-stream TCP throughput on 4.2 kernel.
Message-ID: <560F1672.5000602@candelatech.com>
Date: Fri, 2 Oct 2015 16:42:42 -0700
MIME-Version: 1.0
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
To: netdev <netdev@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

I'm seeing something that looks more dodgy than normal.

Test case id ath10k station uploading to ath10k AP.

AP is always running 4.2 kernel in this case, and both systems are using
the same ath10k firmware.

I have tuned the stack:

echo 4000000 > /proc/sys/net/core/wmem_max
echo 4096 87380 50000000 > /proc/sys/net/ipv4/tcp_rmem
echo 4096 16384 50000000 > /proc/sys/net/ipv4/tcp_wmem
echo 50000000 > /proc/sys/net/core/rmem_max
echo 30000 > /proc/sys/net/core/netdev_max_backlog
echo 1024000 > /proc/sys/net/ipv4/tcp_limit_output_bytes


On the 3.17.8+ kernel, single stream TCP very quickly (1-2 seconds) reaches about
525Mbps upload throughput (station to AP).

But, when station machine is running the 4.2 kernel, the connection goes to
about 30Mbps for 5-10 seconds, then may ramp up to 200-300Mbps, and may plateau
at around 400Mbps after another minute or two.  Once, I saw it finally reach 500+Mbps
after about 3 minutes.

Both behaviors are repeatable in my testing.

For 4.2, I tried setting the send/rcv buffers to 2Mbps,
I tried leaving them at system defaults, same behavior.  I tried doubling
the tcp_limit_output_bytes to 2048k, and that had no affect.

Netstat shows about 1MB of data setting in the TX queue for
for 3.17 and 4.2 kernels when this test is running.

If I start a 50-stream TCP test, then total throughput is 500+Mbps
on 4.2, and generally correlates well with whatever UDP can do at
that time.

A 50-stream throughput has virtually identical performance to the 1 stream
test on the 3.17 kernel.


For the 4.0.4+ kernel, single stream stuck at 30Mbps and would not budge (4.2 does this sometimes too,
perhaps it would have gone up if I had waited more than the ~15 seconds that I did)
50 stream stuck at 420Mbps and would not improve, but it ramped to that quickly.
100 stream test ran at 560Mbps throughput, which is about the maximum TCP throughput
we normally see for ath10k over-the-air.


I'm interested to know if someone has any suggestions for things to tune in 4.2
or 4.0 that might help this, or any reason why I might be seeing this behaviour.

I'm also interested to know if anyone else sees similar behaviour.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
