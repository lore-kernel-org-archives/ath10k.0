Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.rmm.li ([2a01:4f8:13b:1a9e::200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLCHg-00069Q-U4
 for ath10k@lists.infradead.org; Tue, 22 May 2018 18:45:23 +0000
Received: from [192.168.2.129] (cable-static-131-93.breitband.ch
 [87.102.131.93]) by mail.rmm.li (Postfix) with ESMTPSA id CE885660E8E
 for <ath10k@lists.infradead.org>; Tue, 22 May 2018 20:44:48 +0200 (CEST)
From: Michael Meier <schissdraeck@rmm.li>
Subject: QCA6174: firmware crash freezes kernel 4.16
Message-ID: <78430650-61af-6847-4700-cfe9cdccff7a@rmm.li>
Date: Tue, 22 May 2018 20:44:47 +0200
MIME-Version: 1.0
Content-Language: en-US
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
To: ath10k@lists.infradead.org

Hi all

I've got a dell xps 13 with a "Qualcomm Atheros QCA6174 802.11ac 
Wireless Network Adapter (rev 32)" (they call it "Killer xxxx").
Unfortunately when connecting to certain access points the firmware 
crashes after a while (usually like 5-30 minutes). With most access 
points it works fine, unfortunately not with the one I've got at home. 
Before kernel 4.16 just disabling and reenabling the wlan adapter made 
the connection work again and the firmware wouldn't crash anymore (until 
a restart of the computer). With kernel 4.16 unfortunately the whole 
system freezes.
The error message below is from kernel 4.15, I don't manage to get it in 
4.16, since it doesn't manage to write to syslog before it freezes. but 
since it only happens when connecting to the same AP where the firmware 
crash happens with 4.15 and with about the same timing, I guess it is 
the same issue. it always happen when the AP changes the bandwidth (see 
message below).
I've installed the newest firmware I could find on 
https://github.com/kvalo/ath10k-firmware but that didn't help.

Message when loading the firmware:

    15.227481] ath10k_pci 0000:3a:00.0: enabling device (0000 -> 0002)
[   15.230212] ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 
irq_mode 0 reset_mode 0
[   15.513798] ath10k_pci 0000:3a:00.0: firmware: failed to load 
ath10k/pre-cal-pci-0000:3a:00.0.bin (-2)
[   15.513800] ath10k_pci 0000:3a:00.0: Direct firmware load for 
ath10k/pre-cal-pci-0000:3a:00.0.bin failed with error -2
[   15.513810] ath10k_pci 0000:3a:00.0: firmware: failed to load 
ath10k/cal-pci-0000:3a:00.0.bin (-2)
[   15.513812] ath10k_pci 0000:3a:00.0: Direct firmware load for 
ath10k/cal-pci-0000:3a:00.0.bin failed with error -2
[   15.519237] ath10k_pci 0000:3a:00.0: firmware: direct-loading 
firmware ath10k/QCA6174/hw3.0/firmware-6.bin
[   15.519241] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 
chip_id 0x00340aff sub 1a56:1535
[   15.519243] ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0 
tracing 0 dfs 0 testmode 0
[   15.519660] ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00102-QCARMSWP-1 api 6 features wowlan,ignore-otp crc32 
153860ee
[   15.586234] ath10k_pci 0000:3a:00.0: firmware: direct-loading 
firmware ath10k/QCA6174/hw3.0/board-2.bin
[   15.586539] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A 
crc32 20d869c3
[   16.150985] ath10k_pci 0000:3a:00.0: Unknown eventid: 3
[   16.166521] ath10k_pci 0000:3a:00.0: Unknown eventid: 118809
[   16.169568] ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
[   16.170301] ath10k_pci 0000:3a:00.0: htt-ver 3.50 wmi-op 4 htt-op 3 
cal otp max-sta 32 raw 0 hwcrypto 1
[   17.856080] ath10k_pci 0000:3a:00.0: Unknown eventid: 3
[   17.871885] ath10k_pci 0000:3a:00.0: Unknown eventid: 118809
[   17.874940] ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
[   18.717950] ath10k_pci 0000:3a:00.0: Unknown eventid: 3
[   18.733766] ath10k_pci 0000:3a:00.0: Unknown eventid: 118809
[   18.736799] ath10k_pci 0000:3a:00.0: Unknown eventid: 90118


Message when crashing:
[  325.767098] wlan0: AP c0:25:06:b7:87:d9 changed bandwidth, new config 
is 2412 MHz, width 2 (2422/0 MHz)
[  325.826544] ath10k_pci 0000:3a:00.0: firmware crashed! (guid n/a)
[  325.826579] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 
chip_id 0x00340aff sub 1a56:1535
[  325.826588] ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0 
tracing 0 dfs 0 testmode 0
[  325.828265] ath10k_pci 0000:3a:00.0: firmware ver 
WLAN.RM.4.4.1-00102-QCARMSWP-1 api 6 features wowlan,ignore-otp crc32 
153860ee
[  325.829520] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A 
crc32 20d869c3
[  325.829532] ath10k_pci 0000:3a:00.0: htt-ver 3.50 wmi-op 4 htt-op 3 
cal otp max-sta 32 raw 0 hwcrypto 1
[  325.831550] ath10k_pci 0000:3a:00.0: firmware register dump:
[  325.831565] ath10k_pci 0000:3a:00.0: [00]: 0x05030000 0x000015B3 
0x0098747D 0x00955B31
[  325.831574] ath10k_pci 0000:3a:00.0: [04]: 0x0098747D 0x00060730 
0x00000004 0x00000001
[  325.831583] ath10k_pci 0000:3a:00.0: [08]: 0x004089F0 0x00955A00 
0x000A0B00 0x00400000
[  325.831592] ath10k_pci 0000:3a:00.0: [12]: 0x00000009 0x00000000 
0x00952CD0 0x00952CE6
[  325.831601] ath10k_pci 0000:3a:00.0: [16]: 0x00952CC4 0x0091080D 
0x00000000 0x0091080D
[  325.831610] ath10k_pci 0000:3a:00.0: [20]: 0x4098747D 0x0040E7A8 
0x00000000 0x0041F01C
[  325.831619] ath10k_pci 0000:3a:00.0: [24]: 0x809AC015 0x0040E808 
0x00000000 0xC098747D
[  325.831627] ath10k_pci 0000:3a:00.0: [28]: 0x809A6688 0x0040E948 
0x00420020 0x004348D0
[  325.831636] ath10k_pci 0000:3a:00.0: [32]: 0x809A5DDF 0x0040E988 
0x0040E9AC 0x0042D4CC
[  325.831644] ath10k_pci 0000:3a:00.0: [36]: 0x8091D252 0x0040E9A8 
0x00000002 0x00000001
[  325.831652] ath10k_pci 0000:3a:00.0: [40]: 0x809FDCB1 0x0040EA58 
0x0043D884 0x0042D878
[  325.831666] ath10k_pci 0000:3a:00.0: [44]: 0x809F8CDA 0x0040EA78 
0x0043D884 0x00000001
[  325.831675] ath10k_pci 0000:3a:00.0: [48]: 0x80911210 0x0040EAC8 
0x00000010 0x004041D0
[  325.831683] ath10k_pci 0000:3a:00.0: [52]: 0x80911154 0x0040EB28 
0x00400000 0x00000000
[  325.831692] ath10k_pci 0000:3a:00.0: [56]: 0x8091122D 0x0040EB48 
0x00000000 0x00400600
[  325.831699] ath10k_pci 0000:3a:00.0: Copy Engine register dump:
[  325.831716] ath10k_pci 0000:3a:00.0: [00]: 0x00034400   0   0   3   3
[  325.831733] ath10k_pci 0000:3a:00.0: [01]: 0x00034800   5   5 498 499
[  325.831750] ath10k_pci 0000:3a:00.0: [02]: 0x00034c00  32  32  95  96
[  325.831767] ath10k_pci 0000:3a:00.0: [03]: 0x00035000   0   0   1   0
[  325.831783] ath10k_pci 0000:3a:00.0: [04]: 0x00035400 515 515  67   3
[  325.831799] ath10k_pci 0000:3a:00.0: [05]: 0x00035800   0   0  64   0
[  325.831815] ath10k_pci 0000:3a:00.0: [06]: 0x00035c00   2   2   0   0
[  325.831831] ath10k_pci 0000:3a:00.0: [07]: 0x00036000   1   1   1   1
[  325.939825] ieee80211 phy0: Hardware restart was requested
[  326.648921] ath10k_pci 0000:3a:00.0: Unknown eventid: 3
[  326.664590] ath10k_pci 0000:3a:00.0: Unknown eventid: 118809
[  326.667654] ath10k_pci 0000:3a:00.0: Unknown eventid: 90118
[  326.770465] ath10k_pci 0000:3a:00.0: device successfully recovered
[  326.790530] wlan0: AP c0:25:06:b7:87:d9 changed bandwidth, new config 
is 2412 MHz, width 1 (2412/0 MHz)
[  327.712892] wlan0: AP c0:25:06:b7:87:d9 changed bandwidth, new config 
is 2412 MHz, width 2 (2422/0 MHz)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
