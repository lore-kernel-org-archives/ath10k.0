Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x234.google.com ([2607:f8b0:4003:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uz064-0003ui-A0
 for ath10k@lists.infradead.org; Tue, 16 Jul 2013 07:54:57 +0000
Received: by mail-oa0-f52.google.com with SMTP id g12so437166oah.11
 for <ath10k@lists.infradead.org>; Tue, 16 Jul 2013 00:54:34 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 16 Jul 2013 16:54:34 +0900
Message-ID: <CAMQ0DfRpqk6ufb4rAifjy651oM9-GZyDpMLL+mGVzzVSVjVyJA@mail.gmail.com>
Subject: ath10: problems on monitor mode ..
From: Hwan Jin Ko <ymir.kr@gmail.com>
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

Hello!

Also, I have problems on monitor mode and changing channels.

<snip>
~ # iw wlan2 interface add mon2 type monitor
~ # iwconfig
wlan0     IEEE 802.11abgn  ESSID:off/any
          Mode:Managed  Access Point: Not-Associated   Tx-Power=16 dBm
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:off
wlan2     IEEE 802.11abgn  ESSID:off/any
          Mode:Managed  Access Point: Not-Associated   Tx-Power=20 dBm
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:off
lo        no wireless extensions.
mon2      IEEE 802.11abgn  Mode:Monitor  Tx-Power=20 dBm
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Power Management:off
eth0      no wireless extensions.
wlan1     IEEE 802.11abgn  ESSID:off/any
          Mode:Managed  Access Point: Not-Associated   Tx-Power=16 dBm
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:off
~ # iw mon2 set channel 153
command failed: Device or resource busy (-16)
~ # aireplay-ng -0 1 -a 00:11:22:33:44:55 -c 55:66:77:88:99:00 -D mon2
[  723.393865] device mon2 entered promiscuous mode
[  723.586609] BUG: unable to handle kernel NULL pointer dereference at   (null)
[  723.594206] IP: [<c1226331>] ath10k_tx+0x101/0x2cd
[  723.599332] *pde = 00000000
[  723.602523] Oops: 0000 [#1] SMP
[  723.606035] Modules linked in:
[  723.609482] CPU: 3 PID: 1357 Comm: aireplay-ng Not tainted 3.10.0-wl-ath+ #1
[  723.617075] Hardware name: Intel Corporation CedarTrail
Platform/Cedar Rock, BIOS CT_2.1.0.405 IA32 11/08/2012
[  723.627874] task: f63c6730 ti: ed020000 task.ti: ed020000
[  723.633640] EIP: 0060:[<c1226331>] EFLAGS: 00210293 CPU: 3
[  723.639518] EIP is at ath10k_tx+0x101/0x2cd
[  723.644019] EAX: ed2b1c5c EBX: 00000000 ECX: 000000c0 EDX: ed2b1c5c
[  723.650749] ESI: 00000000 EDI: ed2c0e40 EBP: ed2c0e40 ESP: ed021c6c
[  723.657496]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[  723.663253] CR0: 80050033 CR2: 00000000 CR3: 35041000 CR4: 000007d0
[  723.669932] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  723.676539] DR6: ffff0ff0 DR7: 00000400
[  723.680724] Stack:
[  723.682877]  f60b6d40 103226e1 00000001 ed2c0e40 f60b6320 c13c95bc
ed021ce4 ed2c0e40
[  723.691339]  f60b6320 c1321c27 00000000 f60b63dc 00000000 ed021ce4
00000000 000000c0
[  723.699838]  ed021ce0 ed2c0e40 ed2b1c5c 0000001a 00000000 ed2c0e40
f6299440 f60b6320
[  723.708328] Call Trace:
[  723.710939]  [<c1321c27>] ? __ieee80211_tx+0x1f4/0x25f
[  723.716451]  [<c1322db0>] ? ieee80211_tx+0x92/0xa1
[  723.721490]  [<c13231db>] ? ieee80211_xmit+0x7e/0x87
[  723.726866]  [<c1323428>] ? ieee80211_monitor_start_xmit+0x244/0x258
[  723.733641]  [<c1293707>] ? dev_hard_start_xmit+0x297/0x363
[  723.739465]  [<c108d922>] ? ksize+0xd/0x62
[  723.743949]  [<c103d6c8>] ? should_resched+0x5/0x1e
[  723.749197]  [<c12a37ac>] ? sch_direct_xmit+0x4a/0xf9
[  723.754686]  [<c1293938>] ? dev_queue_xmit+0x165/0x2b7
[  723.760306]  [<c12f084f>] ? packet_sendmsg+0x9e4/0xa4b
[  723.765883]  [<c106ba6c>] ? find_get_page+0x37/0x52
[  723.771085]  [<c1283725>] ? sock_aio_write+0xea/0xf4
[  723.776523]  [<c10948b3>] ? do_sync_write+0x4a/0x6f
[  723.781708]  [<c1095053>] ? vfs_write+0xba/0xee
[  723.786641]  [<c1095252>] ? SyS_write+0x49/0x6e
[  723.791516]  [<c1342e3e>] ? sysenter_do_call+0x12/0x26
[  723.797226] Code: fc 0c 00 8b 4d 4c 29 c1 89 d8 8d 53 02 e8 83 02
f3 ff 8b 55 4c 89 e8 83 ea 02 e8 7a 3a 06 00 8b 75 30 8b 85 a8 00 00
00 8b 5d 34 <83> 3e 02 8b be 00 01 00 00 75 6c f6 40 01 40 74 66 85 db
74 62
[  723.818168] EIP: [<c1226331>] ath10k_tx+0x101/0x2cd SS:ESP 0068:ed021c6c
[  723.825332] CR2: 0000000000000000
[  723.829248] ---[ end trace 7c7ccfffac27df80 ]---
[  723.834257] Kernel panic - not syncing: Fatal exception in interrupt
[  723.841177] ------------[ cut here ]------------
[  723.846273] WARNING: at arch/x86/kernel/smp.c:123
trigger_load_balance+0x15e/0x17a()
[  723.854643] Modules linked in:
[  723.858020] CPU: 3 PID: 1357 Comm: aireplay-ng Tainted: G      D
  3.10.0-wl-ath+ #1
[  723.866499] Hardware name: Intel Corporation CedarTrail
Platform/Cedar Rock, BIOS CT_2.1.0.405 IA32 11/08/2012
[  723.877260]  00000000 c1023b73 c1043990 00000000 00000003 000672db
f67f8ad8 c1023b93
[  723.886097]  00000009 00000000 c1043990 f63c6730 00000000 00000003
c102c9af ed021b0c
[  723.894812]  3f6eba81 000000a8 c104cd18 f67f8ad8 f67f8944 f67f8974
f67f8974 c103a4b8
[  723.903595] Call Trace:
[  723.906326]  [<c1023b73>] ? warn_slowpath_common+0x4e/0x61
[  723.912221]  [<c1043990>] ? trigger_load_balance+0x15e/0x17a
[  723.918188]  [<c1023b93>] ? warn_slowpath_null+0xd/0x10
[  723.923901]  [<c1043990>] ? trigger_load_balance+0x15e/0x17a
[  723.929991]  [<c102c9af>] ? update_process_times+0x44/0x4e
[  723.935930]  [<c104cd18>] ? tick_sched_timer+0x28/0x4b
[  723.941514]  [<c103a4b8>] ? __run_hrtimer.isra.23+0x3b/0x88
[  723.947489]  [<c103ac6d>] ? hrtimer_interrupt+0xf6/0x1ee
[  723.953250]  [<c101807c>] ? smp_apic_timer_interrupt+0x56/0x65
[  723.959560]  [<c134298d>] ? apic_timer_interrupt+0x2d/0x34
[  723.965571]  [<c133d703>] ? panic+0x130/0x160
[  723.970436]  [<c10035ce>] ? oops_end+0x8e/0x99
[  723.975256]  [<c133d1e2>] ? no_context+0x15c/0x167
[  723.980407]  [<c133d2d8>] ? __bad_area_nosemaphore+0xeb/0xf3
[  723.986539]  [<c133d2ea>] ? bad_area_nosemaphore+0xa/0xc
[  723.992299]  [<c101e5a1>] ? __do_page_fault+0x2e0/0x30f
[  723.998015]  [<c106f7d6>] ? __rmqueue+0x70/0x16f
[  724.003113]  [<c107069e>] ? get_page_from_freelist+0x34c/0x395
[  724.009408]  [<c101e64f>] ? vmalloc_sync_all+0x7f/0x7f
[  724.014982]  [<c1342bb6>] ? error_code+0x5a/0x60
[  724.019988]  [<c101e64f>] ? vmalloc_sync_all+0x7f/0x7f
[  724.025468]  [<c1226331>] ? ath10k_tx+0x101/0x2cd
[  724.030621]  [<c1321c27>] ? __ieee80211_tx+0x1f4/0x25f
[  724.036144]  [<c1322db0>] ? ieee80211_tx+0x92/0xa1
[  724.041347]  [<c13231db>] ? ieee80211_xmit+0x7e/0x87
[  724.046670]  [<c1323428>] ? ieee80211_monitor_start_xmit+0x244/0x258
[  724.053568]  [<c1293707>] ? dev_hard_start_xmit+0x297/0x363
[  724.059567]  [<c108d922>] ? ksize+0xd/0x62
[  724.064007]  [<c103d6c8>] ? should_resched+0x5/0x1e
[  724.069255]  [<c12a37ac>] ? sch_direct_xmit+0x4a/0xf9
[  724.074631]  [<c1293938>] ? dev_queue_xmit+0x165/0x2b7
[  724.080139]  [<c12f084f>] ? packet_sendmsg+0x9e4/0xa4b
[  724.085688]  [<c106ba6c>] ? find_get_page+0x37/0x52
[  724.090909]  [<c1283725>] ? sock_aio_write+0xea/0xf4
[  724.096224]  [<c10948b3>] ? do_sync_write+0x4a/0x6f
[  724.101540]  [<c1095053>] ? vfs_write+0xba/0xee
[  724.106414]  [<c1095252>] ? SyS_write+0x49/0x6e
[  724.111321]  [<c1342e3e>] ? sysenter_do_call+0x12/0x26
[  724.116835] ---[ end trace 7c7ccfffac27df81 ]---
</snip>

Can't change AR9300 card, too. But aireplay-ng is worked.


Here is another test result ..
aireplay-ng is worked but firmware crashed! message is displayed.

<snip>
~ # ifconfig wlan2 down
~ # iwconfig wlan2 mode monitor
~ # ifconfig wlan2 up
[  180.003417] ath10k: Monitor mode already enabled
~ # iw wlan2 set channel 153
~ # iwconfig
wlan0     IEEE 802.11abgn  ESSID:off/any
          Mode:Managed  Access Point: Not-Associated   Tx-Power=16 dBm
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:off
wlan2     IEEE 802.11abgn  Mode:Monitor  Frequency:5.765 GHz  Tx-Power=30 dBm
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Power Management:off
lo        no wireless extensions.
eth0      no wireless extensions.
wlan1     IEEE 802.11abgn  ESSID:off/any
          Mode:Managed  Access Point: Not-Associated   Tx-Power=16 dBm
          Retry  long limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:off
~ # aireplay-ng -0 1 -a 00:11:22:33:44:55 -c 55:66:77:88:99:00 -D wlan2
[  207.106034] device wlan2 entered promiscuous mode
[  207.301895] ath10k: firmware crashed!
[  207.305810] ath10k: hardware name qca988x hw2.0 version 0x4100016c
[  207.312382] ath10k: firmware version: 1.0.0.636
[  207.318219] ath10k: target register Dump Location: 0x00401930
[  207.325317] ath10k: target Register Dump
[  207.329456] ath10k: [00]: 0x4100016C 0x00000000 0x0098B7DA 0x00000000
[  207.336291] ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.343132] ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.350018] ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.356808] ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0098B7DA
[  207.363580] ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000
[  207.370398] ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.377143] ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.383943] ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.390759] ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.397497] ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.404364] ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.411345] ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.418198] ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
[  207.425040] ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
16:15:18  Sending 64 directed DeAuth. STMAC: [55:66:77:88:99:00] [ 0| 0 ACKs]
~ #
</snip>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
