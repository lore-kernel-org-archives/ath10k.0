Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e4WuV-0003o7-5N
 for ath10k@lists.infradead.org; Tue, 17 Oct 2017 18:48:17 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 3AE2040A5CB
 for <ath10k@lists.infradead.org>; Tue, 17 Oct 2017 11:47:50 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: Sometimes WLE900VX 9880 NIC does not appear in lspci.
Message-ID: <3eefa2db-33a1-ceb3-730b-62627239e873@candelatech.com>
Date: Tue, 17 Oct 2017 11:47:49 -0700
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

Sometimes, when booting one of my apu2 systems with two of the WLE900VX
NICs in it, one of them does not show up in lspci.

Here is the pertinent (I think) bit of dmesg:

OK case (the radio in questions shows up on bus 05):

[    0.781610] pci 0000:04:00.0: [8086:157b] type 00 class 0x020000
[    0.781644] pci 0000:04:00.0: reg 0x10: [mem 0xfe700000-0xfe71ffff]
[    0.781705] pci 0000:04:00.0: reg 0x18: [io  0x3000-0x301f]
[    0.781724] pci 0000:04:00.0: reg 0x1c: [mem 0xfe720000-0xfe723fff]
[    0.781920] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
[    0.784265] pci 0000:00:02.4: PCI bridge to [bus 04]
[    0.787984] pci 0000:00:02.4:   bridge window [io  0x3000-0x3fff]
[    0.787991] pci 0000:00:02.4:   bridge window [mem 0xfe700000-0xfe7fffff]
[    0.788157] pci 0000:05:00.0: [168c:003c] type 00 class 0x028000
[    0.788192] pci 0000:05:00.0: reg 0x10: [mem 0xfe200000-0xfe3fffff 64bit]
[    0.788296] pci 0000:05:00.0: reg 0x30: [mem 0xfe400000-0xfe40ffff pref]
[    0.788428] pci 0000:05:00.0: supports D1 D2
[    0.791270] pci 0000:00:02.5: PCI bridge to [bus 05]
[    0.794970] pci 0000:00:02.5:   bridge window [mem 0xfe200000-0xfe4fffff]
[    0.795728] ACPI: PCI Interrupt Link [INTA] (IRQs *3 5 7 10 11 12 15)
....

Failure case:

Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:04:00.0: [8086:10d3] type 00 class 0x020000
Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:04:00.0: reg 0x10: [mem 0xf6800000-0xf681ffff]
Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:04:00.0: reg 0x18: [io  0xd000-0xd01f]
Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:04:00.0: reg 0x1c: [mem 0xf6820000-0xf6823fff]
Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:04:00.0: System wakeup disabled by ACPI
Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:00:1c.1: PCI bridge to [bus 04]
Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:00:1c.1:   bridge window [io  0xd000-0xdfff]
Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:00:1c.1:   bridge window [mem 0xf6800000-0xf71fffff]
Jun 09 09:23:37 localhost.localdomain kernel: pci 0000:00:1c.1:   bridge window [mem 0xf0000000-0xf09fffff 64bit pref]
Jun 09 09:23:37 localhost.localdomain kernel: ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
...


Rebooting the system usually 'fixes' the problem, but sometimes it takes several reboots.


Does this provide any clues?

Any suggested work-arounds I could try?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
