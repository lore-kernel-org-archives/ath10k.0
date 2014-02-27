Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ7QP-0001xp-Fc
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 20:19:22 +0000
Message-ID: <530F9DB1.5080205@candelatech.com>
Date: Thu, 27 Feb 2014 12:18:57 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Ath10k throughput report with up to 32 stations.
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
To: ath10k <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

With the msdu chaining patch I just posted, I am finally getting
decent throughput when using up to 32 station vifs.

I'm hoping I can optimize things better, and I need to get things like tx/rx
train rate reporting working for the station vifs, but I figure these graphs
might be interesting to people.

Basically, the AP is stock firmware and kernel, clients are my modified
firmware and ath10k is patched a bit as well.  All 32 stations are running
on a single NIC in the station machine.  NICs are WLE900VX.

Single station throughput is not on this graph, but it is around 375-400Mbps.

http://www.candelatech.com/examples/wifi-capacity-32-ath10k-tcp-open-ota/

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
