Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTxik-0007Ce-9e
 for ath10k@lists.infradead.org; Tue, 16 Sep 2014 18:43:23 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id B7F3440AF76
 for <ath10k@lists.infradead.org>; Tue, 16 Sep 2014 11:42:56 -0700 (PDT)
Message-ID: <541884AC.3020402@candelatech.com>
Date: Tue, 16 Sep 2014 11:42:52 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Hard lockup during vif restart tests.
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

This is on a 3.14.14+ hacked kernel, with CT firmware.

Test case is to restart stations (and the AP
on the other side) every 10-30 seconds.
After a bit, the station machine locked up hard.

I have no idea how to trouble-shoot this better, so this is
just FYI.

wlan1: deauthenticated from 04:f0:21:03:38:99 (Reason: 7)
ath10k: mac vdev 0 peer delete 04:f0:21:03:38:99 (sta gone)
ath10k: mac vdev 0 stop (disassociated
ath10k: mac vdev 0 down
ath10k: mac vdev 0 cts_prot 0
ath10k: mac vdev 0 slot_time 1
ath10k: mac vdev 0 preamble 1n
ath10k: mac config channel 5180 mhz flags 0x120
ath10k: mac radar config update: chan 5180MHz radar 0 chan radar 0 chan state USABLE
ath10k: mac config channel to 5180MHz (cf1 5180MHz cf2 0MHz width 20 (noht))
ath10k: mac vdev 0 delete (remove interface)
ath10k: boot suspend complete
ath10k: boot hif stop
ath10k: boot warm reset
ath10k: boot host cpu intr cause: 0x00007800
ath10k: boot target cpu intr cause: 0x02001000
ath10k: boot host cpu intr cause: 0x00000000
ath10k: boot target cpu intr cause: 0x02000000
ath10k: boot target reset state: 0x00000804
ath10k: boot warm reset complete
ath10k: boot hif power down
ath10k: boot warm reset
ath10k: boot host cpu intr cause: 0x00000000
ath10k: boot target cpu intr cause: 0x02000000
ath10k: boot host cpu intr cause: 0x00000000
ath10k: boot target cpu intr cause: 0x02000000
ath10k: boot target reset state: 0x00000800
ath10k: boot warm reset complete
ath10k: stop, state OFF
ath10k: boot hif power up
ath10k: boot warm reset
ath10k: boot host cpu intr cause: 0x00000000
ath10k: boot target cpu intr cause: 0x02000000
ath10k: boot host cpu intr cause: 0x00000000
ath10k: boot target cpu intr cause: 0x02000000
ath10k: boot target reset state: 0x00000800
ath10k: boot warm reset complete
ath10k: boot init ce src ring id 0 entries 16 base_addr ffff8800d206a000
ath10k: boot ce dest ring id 1 entries 512 base_addr ffff8800d5420000
ath10k: boot ce dest ring id 2 entries 32 base_addr ffff8800d2069000
ath10k: boot init ce src ring id 3 entries 32 base_addr ffff8800d2068000
ath10k: boot init ce src ring id 4 entries 4096 base_addr ffff8800d5570000
ath10k: boot init ce src ring id 7 entries 2 base_addr ffff8800d2067000
ath10k: boot ce dest ring id 7 entries 2 base_addr ffff8800d2066000
ath10k_pci 0000:04:00.0: irq 52 for MSI/MSI-X
ath10k: boot waiting target to initialise
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: failed to receive initialized event from target: 00000000
ath10k: failed to wait for target to init: -110
ath10k: boot warm reset
ath10k: boot host cpu intr cause: 0x00000000
ath10k: boot target cpu intr cause: 0x02000000
ath10k: boot host cpu intr cause: 0x00000000
ath10k: boot target cpu intr cause: 0x02000000
ath10k: boot target reset state: 0x00000800
ath10k: boot warm reset complete
ath10k: failed to power up target using warm reset: -110
ath10k: trying cold reset
ath10k: boot cold reset
ath10k: boot cold reset complete
[hang, even sysrq will not work]


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
