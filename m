Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wschs-0003OW-JS
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 18:48:10 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id F378740B5A0
 for <ath10k@lists.infradead.org>; Thu,  5 Jun 2014 11:47:44 -0700 (PDT)
Message-ID: <5390BB50.7040600@candelatech.com>
Date: Thu, 05 Jun 2014 11:47:44 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: More issues with ath10k_flush
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

I'm back to debugging this charmer.

Currently I see the flush fail (and take 5 seconds doing so)
fairly often when creating lots of station vifs against my firmware.

Once stations are connected, there are usually no more timeouts,
even though I might be sending/receiving 100+Mbps of traffic for hours at
a time.

By printing out the firmware stats, I see that much of the time
the hardware has accepted X packets for transmission, but has completed
X-1.  It is possible the firmware's counters are screwed up some how
or that it lost a packet, but I think it may also be possible that
the firmware is just being really slow about completing a packet
every now and then.  I have looked at the firmware in detail and
have found no way that it could actually leak tx descriptors.

So, I was thinking about changing the flush logic to try
the current flush (that just waits) for up to 1/5 of the
flush timeout, and if that fails, try telling the firmware to purge
it's tx buffers, and then wait up to 4/5ths more of the
flush timeout.

Does that sound like a reasonable approach?

Currently, my work-around is just to restart firmware
after it fails to flush for 2 tries in a row, seems
like there could be something better!

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
