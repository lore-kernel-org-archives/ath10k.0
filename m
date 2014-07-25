Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAoiK-0006yi-NY
 for ath10k@lists.infradead.org; Fri, 25 Jul 2014 23:15:49 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id F2081409E87
 for <ath10k@lists.infradead.org>; Fri, 25 Jul 2014 16:15:26 -0700 (PDT)
Message-ID: <53D2E50E.5010205@candelatech.com>
Date: Fri, 25 Jul 2014 16:15:26 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Performance v/s signal quality graph.
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
To: ath10k <ath10k@lists.infradead.org>

Some time back, I ran some tests, and someone (sorry, can't remember or find the email)
suggested my signal might be too hot.  I was using a 30 db fixed attenuator inline with the SMA
cables.

I set up a test today with E5 processor system as station, and a fast i7 processor
system as AP, with the two systems cabled through our variable attenuator.  Open authentication,
channel 149, other wifi equipment in area on 5ghz was (mostly) idle or powered down.
Kernel is 3.14.13+, latest ath10k CT (10.1.467 based) firmware on both systems
(though I don't think that matters much for throughput tests).  10 virtual stations
configured on station machine, but only one was actively doing traffic.

Here is a udp download v/s rx-signal graph as the attenuator is stepped from 0 to 95.5
db attenuation in .5 db steps.

http://www.candelatech.com/pdfs/ath10k_atten_vs_throughput.pdf

The rx-signal axis is the left hand side.  The green graph is the station's (ie netdev)
rx bps, the black is UDP goodput.

It seems ath10k (WLE900VX) has no real trouble with hot signals, and runs best between
-15 and -52 rx signal level (as reported by the station device).

Our systems are not perfectly isolated, so the maximum attenuation is around -85.

Enjoy,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
