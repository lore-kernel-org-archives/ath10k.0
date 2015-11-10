Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zvxg5-0002s5-UX
 for ath10k@lists.infradead.org; Tue, 10 Nov 2015 01:24:54 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 8639E40AF76
 for <ath10k@lists.infradead.org>; Mon,  9 Nov 2015 17:24:32 -0800 (PST)
From: Ben Greear <greearb@candelatech.com>
Subject: Setting 3x3 NIC to 2x2
Message-ID: <56414750.8080706@candelatech.com>
Date: Mon, 9 Nov 2015 17:24:32 -0800
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
To: ath10k <ath10k@lists.infradead.org>

Hello!

For this case:  2 PCs, one 3x3 peregrine ath10k NIC in each.  Once acting as AP,
the other as a station.  Testing UDP upload performance.

Someone reported a problem where they thought they had a 2x2 ath10k NIC
but in reality it was 3x3.  They had only the first two antenna connected.

Using stock Fedora 21 kernel and firmware-4.bin, performance was horrible..around 8-10Mbps
UDP throughput at best.  This was on 2.4 band, so VHT is disabled.

I think the first issue is that performance is so bad if you are missing a single
antenna.  (In my lab, a similar setup with 3 antenna connected was giving 120+Mbps
throughput).


The second problem I saw only on non-stock firmware & driver, so of course problem
could be related to that:

If I start up system in 3x3 mode, and then try to change to 2x2
by setting the tx-antenna mask with iw, then it *appears* that everything
is passed down to the firmware properly, but performance is horrible
(5-10Mbps).  Forcing rate-ctrl to use a higher fixed speed makes things worse,
so it's not just rate-ctrl messing up.

Restarting all network devices on that radio, which causes a soft NIC
reboot, does not fix the problem.  (I reset both AP and STA machines
radios multiple times)

But, if I do a full reboot, then the system comes up happy and will
negotiate up to 300Mbps nominal rate (ie, full 2x2 capabilities).

I suspect there may be bugs in setting up registers down in the
firmware, but I have not taken a close look at it at.

As always, I'm curious if others have seen similar problems (or, tried this
and NOT seen such problems.)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
