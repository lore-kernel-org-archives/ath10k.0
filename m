Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dNOnC-0003GE-9O
 for ath10k@lists.infradead.org; Tue, 20 Jun 2017 19:26:28 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 1A77040A339
 for <ath10k@lists.infradead.org>; Tue, 20 Jun 2017 12:26:04 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: otp and cal loading logic, from 4.7-ish kernel
Message-ID: <50c35fed-0801-37f4-c32f-fb1f2016902d@candelatech.com>
Date: Tue, 20 Jun 2017 12:26:03 -0700
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

Someone is trying to use my 4.7-ish driver on LEDE with a 9888 NIC.

It seems it loads the pre-cal data fine, but it fails to find the board file
in the board-2.bin logic.  I think this is because when pre-cal succeeds, then 'calret' is 0,
so we never get the board-ID, and then we cannot properly query the board-2.bin
file.

I don't think I've really messed much with this logic, but possibly I broke
something.

Any idea how this is supposed to work?

The logs look like this:

[  196.727500] ath10k driver, optimized for CT firmware, probing pci device: 0x56.
[  196.736911] ath10k_pci 0000:00:00.0: pci irq legacy oper_irq_mode 1 irq_mode 0 reset_mode 0
[  196.888030] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:00:00.0.bin failed with error -2
[  196.899107] ath10k_pci 0000:00:00.0: Falling back to user helper
[  196.993301] firmware ath10k!pre-cal-pci-0000:00:00.0.bin: firmware_loading_store: map pages failed
[  197.002904] ath10k_pci 0000:00:00.0: fetch-cal-file, calret: 0
[  197.009031] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/fwcfg-pci-0000:00:00.0.txt failed with error -2
[  197.019908] ath10k_pci 0000:00:00.0: Falling back to user helper
[  197.202753] firmware ath10k!fwcfg-pci-0000:00:00.0.txt: firmware_loading_store: map pages failed
[  197.219724] ath10k_pci 0000:00:00.0: qca9888 hw2.0 target 0x01000000 chip_id 0x00000000 sub 0000:0000
[  197.219747] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 1 testmode 0
[  197.230676] ath10k_pci 0000:00:00.0: firmware ver 10.4-ct-9888-fW-009-cf18e19 api 5 features 
peer-flow-ctrl,txstatus-noack,wmi-10.x-CT,ratemask-CT,regdump-CT,txrate-CT,flush-all-CT,pingpong-CT,ch-regs-CT,nop-CT,set-special-CT crc32 35ea5db8
[  197.250538] ath10k_pci 0000:00:00.0: failed to fetch board data for bus=pci,vendor=168c,device=0056,subsystem-vendor=0000,subsystem-device=0000 from 
ath10k/QCA9888/hw2.0/board-2.bin
[  197.267414] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/QCA9888/hw2.0/board.bin failed with error -2
[  197.278045] ath10k_pci 0000:00:00.0: Falling back to user helper
[  197.444025] firmware ath10k!QCA9888!hw2.0!board.bin: firmware_loading_store: map pages failed
[  197.453022] ath10k_pci 0000:00:00.0: failed to fetch board data
[  197.459169] ath10k_pci 0000:00:00.0: failed to fetch board file: -11
[  197.465918] ath10k_pci 0000:00:00.0: could not probe fw (-11)

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
