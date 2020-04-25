Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSJ8A-0003P5-Ml
 for ath10k@lists.infradead.org; Sat, 25 Apr 2020 11:38:00 +0000
Received: by mail-ua1-x934.google.com with SMTP id i22so12185332uak.6
 for <ath10k@lists.infradead.org>; Sat, 25 Apr 2020 04:37:57 -0700 (PDT)
MIME-Version: 1.0
From: Justin Capella <justincapella@gmail.com>
Date: Sat, 25 Apr 2020 04:37:45 -0700
Message-ID: <CAMrEMU-MTd49NhNap0wxfWVefqwNbFujDrUvgY9wAy+uky=ZsA@mail.gmail.com>
Subject: injection fw crash qca6174
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

FW crash, unable to inject traffic / TX on monitor interface, also
noticed "mising" packets,  may be related to the cryptmode being set
to 0, but I can't capture WPA handshakes for instance.

[    9.495864] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2
irq_mode 0 reset_mode 0
[    9.726048] ath10k_pci 0000:01:00.0: qca988x hw2.0 target
0x4100016c chip_id 0x043202ff sub 0000:0000
[    9.726054] ath10k_pci 0000:01:00.0: kconfig debug 1 debugfs 1
tracing 1 dfs 0 testmode 0
[    9.726469] ath10k_pci 0000:01:00.0: firmware ver 10.2.4-1.0-00045
api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 ccbd5104
[    9.760710] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A
crc32 bebc7c08
[   11.265038] ath10k_pci 0000:01:00.0: unsupported HTC service id: 1536
[   11.286143] ath10k_pci 0000:01:00.0: htt-ver 2.1 wmi-op 5 htt-op 2
cal otp max-sta 128 raw 0 hwcrypto 1
[   11.391261] ath: EEPROM regdomain: 0x0
[   11.391265] ath: EEPROM indicates default country code should be used
[   11.391266] ath: doing EEPROM country->regdmn map search
[   11.391269] ath: country maps to regdmn code: 0x3a
[   11.391270] ath: Country alpha2 being used: US
[   11.391271] ath: Regpair used: 0x3a


[ 1783.720612] ------------[ cut here ]------------
[ 1783.720654] WARNING: CPU: 0 PID: 621 at
drivers/net/wireless/ath/ath10k/mac.c:3735 ath10k_mac_tx+0x33c/0x4f0
[ath10k_core]
[ 1783.720656] Modules linked in: cmac ccm xt_MASQUERADE iptable_nat
nf_nat xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c iptable_filter ath10k_pci ath10k_core ath
mac80211 intel_powerclamp coretemp kvm_intel kvm cfg80211 irqbypass
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel ofpart cmdlinepart
intel_spi_platform intel_spi spi_nor iTCO_wdt mtd iTCO_vendor_support
aesni_intel uas igb crypto_simd cryptd glue_helper usb_storage
intel_cstate i2c_i801 pcspkr lpc_ich rfkill i2c_algo_bit dca i2c_ismt
libarc4 evdev mac_hid acpi_cpufreq drm agpgart ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 sd_mod ahci crc32c_intel libahci
libata scsi_mod ehci_pci ehci_hcd
[ 1783.720728] CPU: 0 PID: 621 Comm: aireplay-ng Not tainted 5.4.28-1-lts #1
[ 1783.720731] Hardware name: ADI Engineering DFFv2/DFFv2, BIOS
ADI_DFF2-01.00.00.12-nodebug 02/07/2017
[ 1783.720757] RIP: 0010:ath10k_mac_tx+0x33c/0x4f0 [ath10k_core]
[ 1783.720763] Code: 66 44 89 50 0a 66 44 89 78 0c e9 89 fe ff ff 48
8b 85 70 10 00 00 a8 08 0f 85 7a fe ff ff 41 f6 44 24 38 20 0f 85 6e
fe ff ff <0f> 0b 48 8b 3c 24 4c 89 e6 41 bd f4 fd ff ff e8 80 7f 34 00
e9 39
[ 1783.720766] RSP: 0018:ffffaa61806cf978 EFLAGS: 00010246
[ 1783.720770] RAX: 0000000000000042 RBX: 0000000000000000 RCX: 0000000000000000
[ 1783.720773] RDX: 0000000000000000 RSI: ffffa3842f9c1b90 RDI: ffffa3843a6b1e40
[ 1783.720775] RBP: ffffa3843a6b1e40 R08: ffffa3842f93bc00 R09: 0000000000000000
[ 1783.720778] R10: 0000000000000000 R11: ffffa3842f985442 R12: ffffa3842f93bc00
[ 1783.720780] R13: 0000000000000000 R14: 0000000000000000 R15: ffffa3842f9c1b90
[ 1783.720785] FS:  00007f739e744b80(0000) GS:ffffa3843d600000(0000)
knlGS:0000000000000000
[ 1783.720787] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1783.720790] CR2: 0000559988aa6050 CR3: 000000006e88c000 CR4: 00000000001006f0
[ 1783.720793] Call Trace:
[ 1783.720827]  ath10k_mac_op_tx+0x168/0x220 [ath10k_core]
[ 1783.720894]  ieee80211_tx_frags+0x14c/0x220 [mac80211]
[ 1783.720955]  __ieee80211_tx+0x71/0x130 [mac80211]
[ 1783.721013]  ieee80211_tx+0x11a/0x150 [mac80211]
[ 1783.721073]  ieee80211_monitor_start_xmit+0x335/0x630 [mac80211]
[ 1783.721085]  dev_hard_start_xmit+0x8d/0x1e0
[ 1783.721092]  __dev_queue_xmit+0x755/0x920
[ 1783.721101]  packet_sendmsg+0xc2e/0x1990
[ 1783.721109]  ? __alloc_pages_nodemask+0x163/0x310
[ 1783.721116]  sock_sendmsg+0x5e/0x60
[ 1783.721122]  sock_write_iter+0x97/0x100
[ 1783.721130]  new_sync_write+0x16a/0x210
[ 1783.721137]  vfs_write+0xb6/0x1a0
[ 1783.721143]  ksys_write+0x67/0xe0
[ 1783.721151]  do_syscall_64+0x4e/0x140
[ 1783.721159]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1783.721164] RIP: 0033:0x7f739ed6f657
[ 1783.721169] Code: 75 05 48 83 c4 58 c3 e8 87 40 ff ff 0f 1f 80 00
00 00 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89
74 24
[ 1783.721172] RSP: 002b:00007ffca26eb8c8 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[ 1783.721176] RAX: ffffffffffffffda RBX: 000000000000001a RCX: 00007f739ed6f657
[ 1783.721179] RDX: 0000000000000026 RSI: 00007ffca26eb8f0 RDI: 0000000000000006
[ 1783.721181] RBP: 000055998a55d460 R08: 000000000000001a R09: 0000000000000000
[ 1783.721184] R10: 00007ffca26ec7e6 R11: 0000000000000246 R12: 0000559988aa6050
[ 1783.721186] R13: 00007ffca26eb8f0 R14: 0000000000000001 R15: 0000559988aa6050
[ 1783.721192] ---[ end trace 704cda9721a87f7b ]---
[ 1783.721217] ath10k_pci 0000:01:00.0: failed to transmit frame: -524
[ 1783.723501] ath10k_pci 0000:01:00.0: failed to transmit frame: -524
[ 1783.725691] ath10k_pci 0000:01:00.0: failed to transmit frame: -524
[ 1783.727868] ath10k_pci 0000:01:00.0: failed to transmit frame: -524
[ 1783.730050] ath10k_pci 0000:01:00.0: failed to transmit frame: -524
[ 1783.732231] ath10k_pci 0000:01:00.0: failed to transmit frame: -524
[ 1783.734420] ath10k_pci 0000:01:00.0: failed to transmit frame: -524
[ 1783.736632] ath10k_pci 0000:01:00.0: failed to transmit frame: -524
[ 1783.738809] ath10k_pci 0000:01:00.0: failed to transmit frame: -524
[ 1783.741017] ath10k_pci 0000:01:00.0: failed to transmit frame: -524

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
