Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from router.aksignal.cz ([188.175.113.102])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bueNE-0000mV-E1
 for ath10k@lists.infradead.org; Thu, 13 Oct 2016 11:40:34 +0000
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 6854146297
 for <ath10k@lists.infradead.org>; Thu, 13 Oct 2016 13:40:05 +0200 (CEST)
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FPZjz4v_9Rpa for <ath10k@lists.infradead.org>;
 Thu, 13 Oct 2016 13:40:04 +0200 (CEST)
Received: from [10.0.1.101] (unknown [10.0.1.101])
 by router.aksignal.cz (Postfix) with ESMTP id DC61846296
 for <ath10k@lists.infradead.org>; Thu, 13 Oct 2016 13:40:04 +0200 (CEST)
From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: qca6174 missing firmware or subsystem id?
Message-ID: <a63ba654-aaa5-3a8c-08ac-c5fd761a5b8d@aksignal.cz>
Date: Thu, 13 Oct 2016 13:40:04 +0200
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: jiri.prchal@aksignal.cz
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi,
I've got this miniPCIe wifi module which comes with Asus motherboard:

$lspci -vnn
02:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter [168c:003e] (rev 32)
	Subsystem: ASUSTeK Computer Inc. QCA6174 802.11ac Wireless Network Adapter [1043:86cd]
	Flags: bus master, fast devsel, latency 0, IRQ 125
	Memory at f7000000 (64-bit, non-prefetchable) [size=2M]
	Capabilities: <access denied>
	Kernel driver in use: ath10k_pci
	Kernel modules: ath10k_pci

But I have problem to get it working. It look that wlan is there, but doesn't receive any SSID.

$ip a
4: wlp2s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
     link/ether c8:ff:28:0e:5e:e1 brd ff:ff:ff:ff:ff:ff

$iw dev wlp2s0 scan
  returns nothing.

I have Ubuntu 16.04 with this kernel:
$uname -a
Linux dole 4.4.0-42-generic #62-Ubuntu SMP Fri Oct 7 23:11:45 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux

I've tried both distro and git FW (probably the same), but it still complies about firmware-5.bin. I thing there is 
missing subsystem ID in board-2.bin as I mentioned there was added some other subID 2 months ago.

$dmesg | grep ath
[    1.997246] ath10k_pci 0000:02:00.0: pci irq msi interrupts 1 irq_mode 0 reset_mode 0
[    2.252840] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[    2.260813] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
[    2.260816] ath10k_pci 0000:02:00.0: could not fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2
[    4.461429] ath10k_pci 0000:02:00.0: qca6174 hw3.2 (0x05030000, 0x00340aff sub 1043:86cd) fw 
WLAN.RM.2.0-00180-QCARMSWPZ-1 fwapi 4 bdapi 2 htt-ver 3.26 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 
features wowlan,ignore-otp,no-4addr-pad
[    4.461432] ath10k_pci 0000:02:00.0: debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
[    4.538049] ath: EEPROM regdomain: 0x6c
[    4.538051] ath: EEPROM indicates we should expect a direct regpair map
[    4.538053] ath: Country alpha2 being used: 00
[    4.538053] ath: Regpair used: 0x6c
[    4.545712] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0

Can anybody help me, please? I'm totally new in this binaries so I don't know how to add it.
Thanks Jiri

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
