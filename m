Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCIaP-0000DQ-TN
 for ath10k@lists.infradead.org; Tue, 16 Oct 2018 06:12:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id p143-v6so4896185lfp.13
 for <ath10k@lists.infradead.org>; Mon, 15 Oct 2018 23:11:59 -0700 (PDT)
MIME-Version: 1.0
From: think more <iiiii5322@gmail.com>
Date: Tue, 16 Oct 2018 09:11:46 +0300
Message-ID: <CADnr0LACengSm3ZzyTjqrF5fsRBxftDYZ9GJS2AK8X6YtDWCUA@mail.gmail.com>
Subject: ath10k_pci QCA6174 crashes on sleep or shutdown
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
To: ath10k@lists.infradead.org

I am having a problem. I just can't suspend laptop or shutdown, it
gets stuck. I narrowed down the cause and it appears it is my wireless
card, Killer 1525 and QCA6174 firmware drivers. If I switch off wifi
before sleeping or shutting down, laptop doesn't get stuck. Now I am
on Ubuntu 18.10, kernel 4.18, everything is updated to newest current
version on newest firmware 1.175, but the problem persist. Previously
I was on ubuntu 18.04, had same problem on older firmware 1.173, I
updated Ubuntu version just to see if it fixes the problem. I also
tried files in this repository:
https://github.com/kvokka/msi_gs60/tree/master/wifi. I also tried
given files in Killer webpage:
https://www.killernetworking.com/killersupport/driver-downloads/kb/cat/6-linux#faq_80,
but that too didn't help...

This is excerpt from kernel log, after I close the lid:

Oct 9 19:18:15 linuxtownLaptop kernel: [ 128.693478] Call Trace:
Oct 9 19:18:15 linuxtownLaptop kernel: [ 128.693471] wpa_supplicant D
0 880 1 0x00000004
Oct 9 19:18:15 linuxtownLaptop kernel: [ 128.693336] Freezing of tasks
failed after 20.003 seconds (1 tasks refusing to freeze, wq_busy=0):
Oct 9 19:18:15 linuxtownLaptop kernel: [ 127.808445] atkbd serio0: Use
'setkeycodes e017 <keycode>' to make it known.
Oct 9 19:18:15 linuxtownLaptop kernel: [ 127.808437] atkbd serio0:
Unknown key released (translated set 2, code 0x97 on isa0060/serio0).
Oct 9 19:18:15 linuxtownLaptop kernel: [ 127.805531] atkbd serio0: Use
'setkeycodes e017 <keycode>' to make it known.
Oct 9 19:18:15 linuxtownLaptop kernel: [ 127.805524] atkbd serio0:
Unknown key pressed (translated set 2, code 0x97 on isa0060/serio0).
Oct 9 19:18:15 linuxtownLaptop kernel: [ 108.689468] Freezing user
space processes ...
Oct 9 19:18:15 linuxtownLaptop kernel: [ 108.646879] rfkill: input
handler enabled
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.403227] ath10k_pci
0000:05:00.0: failed to delete WMI vdev 1: -108
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.403192] ieee80211 phy0:
Hardware restart was requested
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.285067] PM: Syncing
filesystems ... done.
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.285065] PM: suspend entry (deep)
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272631] ath10k_pci
0000:05:00.0: [07]: 0x00036000 1 1 1 1
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272621] ath10k_pci
0000:05:00.0: [06]: 0x00035c00 15 15 15 15
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272612] ath10k_pci
0000:05:00.0: [05]: 0x00035800 0 0 0 0
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272603] ath10k_pci
0000:05:00.0: [04]: 0x00035400 833 833 226 162
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272593] ath10k_pci
0000:05:00.0: [03]: 0x00035000 7 7 8 7
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272584] ath10k_pci
0000:05:00.0: [02]: 0x00034c00 44 44 107 108
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272575] ath10k_pci
0000:05:00.0: [01]: 0x00034800 2 2 37 38
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272565] ath10k_pci
0000:05:00.0: [00]: 0x00034400 1 1 3 3
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272555] ath10k_pci
0000:05:00.0: Copy Engine register dump:
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272553] ath10k_pci
0000:05:00.0: [56]: 0x809A6C34 0x0041A8E0 0x0042932C 0x0042CA44
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272550] ath10k_pci
0000:05:00.0: [52]: 0x800B4405 0x0041A850 0x00422318 0x00005002
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272548] ath10k_pci
0000:05:00.0: [48]: 0x80996BD3 0x0041A830 0x0044FD68 0x00000000
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272545] ath10k_pci
0000:05:00.0: [44]: 0x80992076 0x0041A810 0x0044FD68 0x0046FFE8
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272543] ath10k_pci
0000:05:00.0: [40]: 0x8099638C 0x0041A7F0 0x00404D88 0x00000000
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272540] ath10k_pci
0000:05:00.0: [36]: 0x809BDECC 0x0041A7D0 0x00404D88 0x0040E074
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272538] ath10k_pci
0000:05:00.0: [32]: 0x80947BA7 0x0041A7B0 0x00404D88 0x0040E074
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272535] ath10k_pci
0000:05:00.0: [28]: 0x80942BC4 0x0041A790 0x42D0B71D 0x00400000
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272533] ath10k_pci
0000:05:00.0: [24]: 0x809432A7 0x0041A770 0x0040D400 0xC092E4DC
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272531] ath10k_pci
0000:05:00.0: [20]: 0x4092E4DC 0x0041A710 0x00000000 0x0F000000
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272528] ath10k_pci
0000:05:00.0: [16]: 0x0096BDBC 0x009286B6 0x00000000 0x00000000
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272525] ath10k_pci
0000:05:00.0: [12]: 0x00000009 0x00000000 0x0096C09C 0x0096C0A7
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272523] ath10k_pci
0000:05:00.0: [08]: 0x42D0B71D 0x00400000 0x00000000 0x000A5C88
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272520] ath10k_pci
0000:05:00.0: [04]: 0x0092E4DC 0x00060130 0x00000018 0x0041A760
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272518] ath10k_pci
0000:05:00.0: [00]: 0x05010000 0x00000000 0x0092E4DC 0x42D0B731
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.272512] ath10k_pci
0000:05:00.0: firmware register dump:
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.270500] ath10k_pci
0000:05:00.0: htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0
hwcrypto 1
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.270497] ath10k_pci
0000:05:00.0: board_file api 2 bmi_id N/A crc32 ae2e275a
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.270310] ath10k_pci
0000:05:00.0: firmware ver SW_RM.1.1.1-00157-QCARMSWPZ-1 api 5
features ignore-otp,no-4addr-pad crc32 10bf8e08
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.269927] ath10k_pci
0000:05:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.269925] ath10k_pci
0000:05:00.0: qca6174 hw2.1 target 0x05010000 chip_id 0x003405ff sub
1a56:1525
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.269916] ath10k_pci
0000:05:00.0: firmware crashed! (guid
2c6b9eda-95ac-4f33-b915-414326bdcc36)
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.269913] wlp5s0: failed to
remove key (0, a7:57:58:05:ad:44) from hardware (-110)
Oct 9 19:17:55 linuxtownLaptop kernel: [ 108.269908] ath10k_pci
0000:05:00.0: failed to install key for vdev 0 peer a7:57:58:05:ad:44:
-110
What could I try next? I can't use my laptop if I can't put it to
sleep and have to manually turn off wifi. I have killer wireless 1525.
My card in lshw command

product: QCA6174 802.11ac Wireless Network Adapter

vendor: Qualcomm Atheros

And if I try to shutdown (with wifi on), this is what I see on screen
and have to force shutdown: https://i.stack.imgur.com/aTMgu.jpg

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
