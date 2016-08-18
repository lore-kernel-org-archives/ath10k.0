Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baOx3-0006kO-W6
 for ath10k@lists.infradead.org; Thu, 18 Aug 2016 15:09:53 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: master-pending: ODEBUG: free active (active state 0) object type:
 timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10 [ath10k_core]
Date: Thu, 18 Aug 2016 15:09:24 +0000
Message-ID: <874m6i15ct.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
Content-ID: <00E67D3296872F49AD2BE3320CE62A10@qualcomm.com>
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

I was testing master-pending branch and saw these warnings when I was
reloading ath10k. I have seen this two times out of two tests so seems
to be easy to reproduce. I don't have time to investigate this more at
this time but I'll post this anyway.

[  256.946615] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[  257.135392] ath10k_pci 0000:02:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
[  257.135397] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 1
[  257.135665] ath10k_pci 0000:02:00.0: firmware ver 10.2.4.70.54 api 5 features no-p2p,raw-mode,mfp crc32 9d340dd9
[  257.193219] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
[  258.458099] ath10k_pci 0000:02:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
[  258.602274] ath: EEPROM regdomain: 0x0
[  258.602279] ath: EEPROM indicates default country code should be used
[  258.602280] ath: doing EEPROM country->regdmn map search
[  258.602283] ath: country maps to regdmn code: 0x3a
[  258.602285] ath: Country alpha2 being used: US
[  258.602287] ath: Regpair used: 0x3a

[...]

[  277.244673] ------------[ cut here ]------------
[  277.244685] WARNING: CPU: 2 PID: 2162 at lib/debugobjects.c:263 debug_print_object+0x85/0xa0
[  277.244707] ODEBUG: free active (active state 0) object type: timer_list hint: ath10k_htt_rx_ring_refill_retry+0x0/0x10 [ath10k_core]
[  277.244712] Modules linked in: ath10k_pci(E-) ath10k_core(E) ath(E) mac80211(E) cfg80211(E) ctr ccm arc4 snd_hda_codec_hdmi snd_hda_codec_idt snd_hda_codec_generic snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm coretemp snd_seq_midi joydev snd_rawmidi btusb input_leds btintel btbcm serio_raw snd_seq_midi_event btrtl snd_seq snd_seq_device snd_timer snd soundcore lpc_ich shpchp wmi rfcomm bnep bluetooth video mac_hid parport_pc ppdev lp parport psmouse firewire_ohci firewire_core sky2 crc_itu_t [last unloaded: cfg80211]
[  277.244763] CPU: 2 PID: 2162 Comm: rmmod Tainted: G            E   4.8.0-rc2-wt-ath+ #1419
[  277.244765] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010
[  277.244766]  00000086 00000086 eee01c74 d74272f2 d7b27b62 eee01cbc eee01ca8 d7084305
[  277.244773]  d7b28a8c eee01cd8 00000872 d7b27b62 00000107 d74453e5 d74453e5 00000107
[  277.244780]  eee4c5b8 d7c284a0 d7b03e7a eee01cc4 d70843cb 00000009 00000000 eee01cbc
[  277.244787] Call Trace:
[  277.244793]  [<d74272f2>] dump_stack+0x76/0xb4
[  277.244799]  [<d7084305>] __warn+0xe5/0x100
[  277.244802]  [<d74453e5>] ? debug_print_object+0x85/0xa0
[  277.244804]  [<d74453e5>] ? debug_print_object+0x85/0xa0
[  277.244807]  [<d70843cb>] warn_slowpath_fmt+0x3b/0x40
[  277.244809]  [<d74453e5>] debug_print_object+0x85/0xa0
[  277.244823]  [<f8e52fd0>] ? ath10k_htt_rx_msdu_buff_replenish+0x90/0x90 [ath10k_core]
[  277.244826]  [<d744572f>] __debug_check_no_obj_freed+0x14f/0x180
[  277.244829]  [<d7446075>] debug_check_no_obj_freed+0x15/0x20
[  277.244835]  [<d71c13dc>] __free_pages_ok+0x16c/0x460
[  277.244839]  [<d7070b90>] ? lookup_address+0x20/0x30
[  277.244842]  [<d71c3487>] __free_pages+0x27/0x40
[  277.244847]  [<d72202fa>] kfree+0x2ea/0x320
[  277.244851]  [<d7429cc5>] ? kobject_put+0x25/0x60
[  277.244858]  [<d70e015b>] ? trace_hardirqs_on+0xb/0x10
[  277.244909]  [<f9537d1c>] ? cfg80211_dev_free+0x8c/0xa0 [cfg80211]
[  277.244947]  [<f9537d1c>] cfg80211_dev_free+0x8c/0xa0 [cfg80211]
[  277.244985]  [<f9538932>] wiphy_dev_release+0x12/0x20 [cfg80211]
[  277.244993]  [<d7584971>] device_release+0x31/0xa0
[  277.244998]  [<d7220155>] ? kfree+0x145/0x320
[  277.245001]  [<d7429dfb>] kobject_cleanup+0x5b/0x1a0
[  277.245069]  [<f912add7>] ? ieee80211_free_led_names+0x37/0x40 [mac80211]
[  277.245073]  [<d7429cc5>] kobject_put+0x25/0x60
[  277.245132]  [<f912add7>] ? ieee80211_free_led_names+0x37/0x40 [mac80211]
[  277.245186]  [<f912add7>] ? ieee80211_free_led_names+0x37/0x40 [mac80211]
[  277.245192]  [<d7584644>] put_device+0x14/0x20
[  277.245229]  [<f95352c2>] wiphy_free+0x12/0x20 [cfg80211]
[  277.245277]  [<f90b1067>] ieee80211_free_hw+0x67/0x70 [mac80211]
[  277.245297]  [<f8e48c8a>] ath10k_mac_destroy+0x1a/0x30 [ath10k_core]
[  277.245315]  [<f8e4de2c>] ath10k_core_destroy+0x4c/0x50 [ath10k_core]
[  277.245323]  [<f8d8c949>] ath10k_pci_remove+0x79/0xa0 [ath10k_pci]
[  277.245328]  [<d7484018>] pci_device_remove+0x38/0xb0
[  277.245334]  [<d758954b>] __device_release_driver+0x7b/0x110
[  277.245337]  [<d75897e7>] driver_detach+0x97/0xa0
[  277.245341]  [<d758863b>] bus_remove_driver+0x4b/0xb0
[  277.245345]  [<d758a3da>] driver_unregister+0x2a/0x60
[  277.245351]  [<d7483038>] pci_unregister_driver+0x18/0x70
[  277.245357]  [<f8d8dd5e>] ath10k_pci_exit+0xd/0x2af [ath10k_pci]
[  277.245362]  [<d7129b14>] SyS_delete_module+0xf4/0x180
[  277.245369]  [<d71f12f1>] ? __might_fault+0x41/0xa0
[  277.245373]  [<d71f133b>] ? __might_fault+0x8b/0xa0
[  277.245378]  [<d70037c6>] do_fast_syscall_32+0xa6/0x1d0
[  277.245386]  [<d789127c>] sysenter_past_esp+0x45/0x74
[  277.245389] ---[ end trace bc24bba7f062bde3 ]---
[  277.247191] ------------[ cut here ]------------
[  277.247202] WARNING: CPU: 2 PID: 2162 at lib/dma-debug.c:976 dma_debug_device_change+0x11b/0x160
[  277.247207] pci 0000:02:00.0: DMA-API: device driver has pending DMA allocations while released from device [count=200]
[  277.247207] One of leaked entries details: [device address=0x000000002ce6e600] [size=1984 bytes] [mapped with DMA_FROM_DEVICE] [mapped as single]
[  277.247209] Modules linked in: ath10k_pci(E-) ath10k_core(E) ath(E) mac80211(E) cfg80211(E) ctr ccm arc4 snd_hda_codec_hdmi snd_hda_codec_idt snd_hda_codec_generic snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm coretemp snd_seq_midi joydev snd_rawmidi btusb input_leds btintel btbcm serio_raw snd_seq_midi_event btrtl snd_seq snd_seq_device snd_timer snd soundcore lpc_ich shpchp wmi rfcomm bnep bluetooth video mac_hid parport_pc ppdev lp parport psmouse firewire_ohci firewire_core sky2 crc_itu_t [last unloaded: cfg80211]
[  277.247289] CPU: 2 PID: 2162 Comm: rmmod Tainted: G        W   E   4.8.0-rc2-wt-ath+ #1419
[  277.247291] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010
[  277.247293]  00000286 00000286 eee01d8c d74272f2 d7b28227 eee01dd4 eee01dc0 d7084305
[  277.247305]  d7b298f0 eee01df0 00000872 d7b28227 000003d0 d74586bb d74586bb 000003d0
[  277.247316]  000000c8 f348baf8 d7acf7bf eee01ddc d70843cb 00000009 00000000 eee01dd4
[  277.247327] Call Trace:
[  277.247333]  [<d74272f2>] dump_stack+0x76/0xb4
[  277.247339]  [<d7084305>] __warn+0xe5/0x100
[  277.247343]  [<d74586bb>] ? dma_debug_device_change+0x11b/0x160
[  277.247347]  [<d74586bb>] ? dma_debug_device_change+0x11b/0x160
[  277.247351]  [<d70843cb>] warn_slowpath_fmt+0x3b/0x40
[  277.247355]  [<d74586bb>] dma_debug_device_change+0x11b/0x160
[  277.247363]  [<d70a8997>] notifier_call_chain+0x47/0x90
[  277.247367]  [<d70a8c33>] __blocking_notifier_call_chain+0x43/0x70
[  277.247373]  [<d70e015b>] ? trace_hardirqs_on+0xb/0x10
[  277.247378]  [<d70a8c7f>] blocking_notifier_call_chain+0x1f/0x30
[  277.247382]  [<d75895b2>] __device_release_driver+0xe2/0x110
[  277.247385]  [<d75897e7>] driver_detach+0x97/0xa0
[  277.247389]  [<d758863b>] bus_remove_driver+0x4b/0xb0
[  277.247393]  [<d758a3da>] driver_unregister+0x2a/0x60
[  277.247398]  [<d7483038>] pci_unregister_driver+0x18/0x70
[  277.247405]  [<f8d8dd5e>] ath10k_pci_exit+0xd/0x2af [ath10k_pci]
[  277.247410]  [<d7129b14>] SyS_delete_module+0xf4/0x180
[  277.247416]  [<d71f12f1>] ? __might_fault+0x41/0xa0
[  277.247420]  [<d71f133b>] ? __might_fault+0x8b/0xa0
[  277.247425]  [<d70037c6>] do_fast_syscall_32+0xa6/0x1d0
[  277.247431]  [<d789127c>] sysenter_past_esp+0x45/0x74
[  277.247435] ---[ end trace bc24bba7f062bde4 ]---
[  277.247437] Mapped at:
[  277.247439]  [<d745840c>] debug_dma_map_page.part.24+0x1c/0xf0
[  277.247445]  [<d7458579>] debug_dma_map_page+0x99/0xc0
[  277.247449]  [<f8e52e4c>] __ath10k_htt_rx_ring_fill_n+0x1ac/0x240 [ath10k_core]
[  277.247474]  [<f8e52f07>] ath10k_htt_rx_ring_fill_n+0x27/0x60 [ath10k_core]
[  277.247492]  [<f8e52f84>] ath10k_htt_rx_msdu_buff_replenish+0x44/0x90 [ath10k_core]
[  277.818673] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[  277.990051] ath10k_pci 0000:02:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
[  277.990055] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 1
[  277.990246] ath10k_pci 0000:02:00.0: firmware ver 10.2.4.70.54 api 5 features no-p2p,raw-mode,mfp crc32 9d340dd9
[  278.048026] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
[  279.315722] ath10k_pci 0000:02:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1
[  279.460836] ath: EEPROM regdomain: 0x0
[  279.460841] ath: EEPROM indicates default country code should be used
[  279.460842] ath: doing EEPROM country->regdmn map search
[  279.460845] ath: country maps to regdmn code: 0x3a
[  279.460847] ath: Country alpha2 being used: US
[  279.460849] ath: Regpair used: 0x3a
[  279.513921] =============================================================================
[  279.513931] BUG kmalloc-8192 (Tainted: G        W   E  ): Poison overwritten
[  279.513934] -----------------------------------------------------------------------------
[  279.513934] 
[  279.513937] Disabling lock debugging due to kernel taint
[  279.513939] INFO: 0xeec5c178-0xeec5c497. First byte 0xc0 instead of 0x6b
[  279.513967] INFO: Allocated in ath10k_htt_rx_alloc+0x4e/0x420 [ath10k_core] age=4353 cpu=1 pid=2152
[  279.513977] 	___slab_alloc.constprop.87+0x2f5/0x310
[  279.513983] 	__slab_alloc.constprop.88+0x33/0x5f
[  279.513987] 	kmem_cache_alloc_trace+0x31a/0x360
[  279.514004] 	ath10k_htt_rx_alloc+0x4e/0x420 [ath10k_core]
[  279.514019] 	ath10k_core_start+0x267/0x5d0 [ath10k_core]
[  279.514034] 	ath10k_start+0xa7/0x570 [ath10k_core]
[  279.514088] 	drv_start+0xc1/0x370 [mac80211]
[  279.514128] 	ieee80211_do_open+0x2ef/0x890 [mac80211]
[  279.514166] 	ieee80211_open+0x58/0x60 [mac80211]
[  279.514173] 	__dev_open+0xab/0x120
[  279.514176] 	__dev_change_flags+0x8e/0x150
[  279.514179] 	dev_change_flags+0x2e/0x70
[  279.514184] 	devinet_ioctl+0x57f/0x680
[  279.514189] 	inet_ioctl+0x8d/0xb0
[  279.514194] 	sock_ioctl+0x74/0x2c0
[  279.514199] 	do_vfs_ioctl+0x7f/0x470
[  279.514215] INFO: Freed in ath10k_htt_rx_free+0x1b5/0x1f0 [ath10k_core] age=1415 cpu=2 pid=2152
[  279.514219] 	__slab_free+0x48/0x3a4
[  279.514223] 	kfree+0x29e/0x320
[  279.514238] 	ath10k_htt_rx_free+0x1b5/0x1f0 [ath10k_core]
[  279.514253] 	ath10k_core_stop+0x46/0x90 [ath10k_core]
[  279.514267] 	ath10k_halt+0x77/0x100 [ath10k_core]
[  279.514280] 	ath10k_stop+0x3b/0x70 [ath10k_core]
[  279.514304] 	drv_stop+0x62/0x360 [mac80211]
[  279.514333] 	ieee80211_stop_device+0x3d/0x40 [mac80211]
[  279.514358] 	ieee80211_do_stop+0x4c5/0x820 [mac80211]
[  279.514384] 	ieee80211_stop+0x17/0x20 [mac80211]
[  279.514389] 	__dev_close_many+0x89/0xd0
[  279.514391] 	__dev_close+0x2d/0x50
[  279.514393] 	__dev_change_flags+0x8e/0x150
[  279.514395] 	dev_change_flags+0x2e/0x70
[  279.514397] 	devinet_ioctl+0x57f/0x680
[  279.514399] 	inet_ioctl+0x8d/0xb0
[  279.514401] INFO: Slab 0xf6fbcdc0 objects=3 used=3 fp=0x  (null) flags=0x2804080
[  279.514403] INFO: Object 0xeec5c178 @offset=16760 fp=0xeec5a0c0
[  279.514403] 
[  279.514407] Redzone eec5c170: bb bb bb bb bb bb bb bb                          ........
[  279.514409] Object eec5c178: c0 ca b6 ec 40 55 a9 f0 c0 4a a9 f0 80 68 a9 f0  ....@U...J...h..
[  279.514410] Object eec5c188: 00 c9 a5 ed 80 c5 a5 ed 40 ea a5 ed 40 c0 a5 ed  ........@...@...
[  279.514412] Object eec5c198: 40 ce a5 ed 00 d7 a5 ed 40 f1 a5 ed 00 c2 a5 ed  @.......@.......
[  279.514414] Object eec5c1a8: 00 fa a5 ed c0 ca a5 ed 00 ec b6 ec 40 c0 b6 ec  ............@...
[  279.514416] Object eec5c1b8: c0 c3 b6 ec 80 e1 b6 ec c0 ed a5 ed 00 de a5 ed  ................
[  279.514417] Object eec5c1c8: 80 ef a5 ed 80 da a5 ed 40 d5 b6 ec 80 f6 b6 ec  ........@.......
[  279.514420] Object eec5c1d8: 00 e5 a5 ed 00 f3 a5 ed c0 d1 a5 ed 00 d0 a5 ed  ................
[  279.514422] Object eec5c1e8: 40 dc a5 ed 40 e3 a5 ed 40 c7 a5 ed 80 e1 a5 ed  @...@...@.......
[  279.514425] Object eec5c1f8: c0 f4 a5 ed 00 fa b6 ec 00 d0 b6 ec c0 fb b6 ec  ................
[  279.514427] Object eec5c208: c0 f4 b6 ec 80 fd b6 ec 40 dc b6 ec 40 d5 a5 ed  ........@...@...
[  279.514430] Object eec5c218: 80 f6 a5 ed c0 d8 a5 ed c0 fb a5 ed c0 c3 a5 ed  ................
[  279.514433] Object eec5c228: 00 ec a5 ed 00 c9 b6 ec 40 ce b6 ec 40 ea b6 ec  ........@...@...
[  279.514435] Object eec5c238: 80 c5 b6 ec 80 d3 b6 ec c0 df b6 ec 80 cc b6 ec  ................
[  279.514438] Object eec5c248: 40 e3 b6 ec 80 ef b6 ec 00 de b6 ec c0 d1 b6 ec  @...............
[  279.514441] Object eec5c258: 00 e5 b6 ec c0 d8 b6 ec 00 c2 b6 ec 80 e8 b6 ec  ................
[  279.514444] Object eec5c268: c0 ed b6 ec 80 da b6 ec 40 c7 b6 ec 80 bd a5 ed  ........@.......
[  279.514447] Object eec5c278: 80 3d aa f0 40 4e a8 f0 00 3a aa f0 40 23 aa f0  .=..@N...:..@#..
[  279.514450] Object eec5c288: 00 e5 b7 ed 40 f8 b6 ec c0 f4 b7 ed c0 e6 b6 ec  ....@...........
[  279.514452] Object eec5c298: 00 d7 b6 ec 80 45 a8 f0 c0 74 a8 f0 00 73 a8 f0  .....E...t...s..
[  279.514455] Object eec5c2a8: c0 1f aa f0 80 1a aa f0 c0 18 aa f0 40 1c aa f0  ............@...
[  279.514458] Object eec5c2b8: 00 17 aa f0 80 05 aa f0 40 0e aa f0 c0 3b aa f0  ........@....;..
[  279.514461] Object eec5c2c8: 40 31 aa f0 00 25 aa f0 40 15 aa f0 c0 03 aa f0  @1...%..@.......
[  279.514464] Object eec5c2d8: 80 36 aa f0 80 13 aa f0 00 2c aa f0 c0 11 aa f0  .6.......,......
[  279.514466] Object eec5c2e8: 40 2a aa f0 40 38 aa f0 00 1e aa f0 00 65 a8 f0  @*..@8.......e..
[  279.514469] Object eec5c2f8: c0 43 a8 f0 c0 58 a8 f0 c0 5f a8 f0 00 5e a8 f0  .C...X..._...^..
[  279.514472] Object eec5c308: 00 50 a8 f0 80 61 a8 f0 00 42 a8 f0 40 78 a8 f0  .P...a...B..@x..
[  279.514475] Object eec5c318: c0 7b a8 f0 c0 6d a8 f0 80 76 a8 f0 80 6f a8 f0  .{...m...v...o..
[  279.514477] Object eec5c328: 00 7a a8 f0 40 6a a8 f0 40 40 a8 f0 80 68 a8 f0  .z..@j..@@...h..
[  279.514480] Object eec5c338: 80 5a a8 f0 40 71 a8 f0 00 57 a8 f0 c0 4a a8 f0  .Z..@q...W...J..
[  279.514483] Object eec5c348: c0 66 a8 f0 00 6c a8 f0 00 49 a8 f0 80 4c a8 f0  .f...l...I...L..
[  279.514485] Object eec5c358: 40 55 a8 f0 80 53 a8 f0 40 63 a8 f0 40 47 a8 f0  @U...S..@c..@G..
[  279.514488] Object eec5c368: 40 5c a8 f0 00 09 aa f0 80 0c aa f0 40 00 aa f0  @\..........@...
[  279.514491] Object eec5c378: 00 02 aa f0 c0 2d aa f0 40 07 aa f0 80 28 aa f0  .....-..@....(..
[  279.514494] Object eec5c388: 80 2f aa f0 c0 34 aa f0 c0 26 aa f0 80 21 aa f0  ./...4...&...!..
[  279.514496] Object eec5c398: c0 e6 a5 ed 00 ba a5 ed 80 da b7 ed 00 c2 b7 ed  ................
[  279.514499] Object eec5c3a8: 40 40 d9 ee 80 7d d9 ee 00 42 d9 ee c0 7b d9 ee  @@...}...B...{..
[  279.514501] Object eec5c3b8: c0 43 d9 ee 00 7a d9 ee 80 45 d9 ee 40 78 d9 ee  .C...z...E..@x..
[  279.514504] Object eec5c3c8: 40 47 d9 ee 80 76 d9 ee 00 49 d9 ee c0 74 d9 ee  @G...v...I...t..
[  279.514507] Object eec5c3d8: c0 4a d9 ee 00 73 d9 ee 80 4c d9 ee 40 71 d9 ee  .J...s...L..@q..
[  279.514509] Object eec5c3e8: 40 4e d9 ee 80 6f d9 ee 00 50 d9 ee c0 6d d9 ee  @N...o...P...m..
[  279.514512] Object eec5c3f8: c0 51 d9 ee 00 6c d9 ee 80 53 d9 ee 40 6a d9 ee  .Q...l...S..@j..
[  279.514514] Object eec5c408: 40 55 d9 ee 80 68 d9 ee 00 57 d9 ee c0 66 d9 ee  @U...h...W...f..
[  279.514517] Object eec5c418: c0 58 d9 ee 00 65 d9 ee 80 5a d9 ee 40 63 d9 ee  .X...e...Z..@c..
[  279.514519] Object eec5c428: 40 5c d9 ee 80 61 d9 ee 00 5e d9 ee c0 5f d9 ee  @\...a...^..._..
[  279.514522] Object eec5c438: 40 40 fb ee 80 7d fb ee 00 42 fb ee c0 7b fb ee  @@...}...B...{..
[  279.514524] Object eec5c448: c0 43 fb ee 00 7a fb ee 80 45 fb ee 40 78 fb ee  .C...z...E..@x..
[  279.514527] Object eec5c458: 40 47 fb ee 80 76 fb ee 00 49 fb ee c0 74 fb ee  @G...v...I...t..
[  279.514530] Object eec5c468: c0 4a fb ee 00 73 fb ee 80 4c fb ee 40 71 fb ee  .J...s...L..@q..
[  279.514533] Object eec5c478: 40 4e fb ee 80 6f fb ee 00 50 fb ee c0 6d fb ee  @N...o...P...m..
[  279.514535] Object eec5c488: c0 51 fb ee 00 6c fb ee 80 53 fb ee 40 6a fb ee  .Q...l...S..@j..
[  279.514538] Object eec5c498: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514541] Object eec5c4a8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514543] Object eec5c4b8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514546] Object eec5c4c8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514549] Object eec5c4d8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514552] Object eec5c4e8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514555] Object eec5c4f8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514557] Object eec5c508: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514560] Object eec5c518: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514562] Object eec5c528: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514565] Object eec5c538: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514568] Object eec5c548: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514571] Object eec5c558: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514573] Object eec5c568: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514576] Object eec5c578: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514578] Object eec5c588: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514581] Object eec5c598: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514584] Object eec5c5a8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514586] Object eec5c5b8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514589] Object eec5c5c8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514591] Object eec5c5d8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514594] Object eec5c5e8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514596] Object eec5c5f8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514599] Object eec5c608: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514602] Object eec5c618: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514604] Object eec5c628: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514606] Object eec5c638: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514609] Object eec5c648: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514611] Object eec5c658: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514614] Object eec5c668: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514616] Object eec5c678: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514618] Object eec5c688: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514621] Object eec5c698: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514623] Object eec5c6a8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514626] Object eec5c6b8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514628] Object eec5c6c8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514631] Object eec5c6d8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514633] Object eec5c6e8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514634] Object eec5c6f8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514636] Object eec5c708: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514638] Object eec5c718: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514639] Object eec5c728: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514641] Object eec5c738: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514643] Object eec5c748: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514644] Object eec5c758: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514646] Object eec5c768: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514648] Object eec5c778: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514649] Object eec5c788: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514651] Object eec5c798: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514653] Object eec5c7a8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514654] Object eec5c7b8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514656] Object eec5c7c8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514658] Object eec5c7d8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514659] Object eec5c7e8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514661] Object eec5c7f8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514663] Object eec5c808: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514665] Object eec5c818: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514666] Object eec5c828: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514668] Object eec5c838: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514670] Object eec5c848: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514672] Object eec5c858: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514673] Object eec5c868: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514675] Object eec5c878: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514677] Object eec5c888: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514678] Object eec5c898: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514680] Object eec5c8a8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514682] Object eec5c8b8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514683] Object eec5c8c8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514685] Object eec5c8d8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514687] Object eec5c8e8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514688] Object eec5c8f8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514690] Object eec5c908: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514691] Object eec5c918: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514693] Object eec5c928: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514695] Object eec5c938: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514696] Object eec5c948: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514698] Object eec5c958: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514700] Object eec5c968: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514701] Object eec5c978: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514703] Object eec5c988: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514705] Object eec5c998: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514706] Object eec5c9a8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514708] Object eec5c9b8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514710] Object eec5c9c8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514711] Object eec5c9d8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514713] Object eec5c9e8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514715] Object eec5c9f8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514716] Object eec5ca08: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514718] Object eec5ca18: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514720] Object eec5ca28: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514721] Object eec5ca38: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514723] Object eec5ca48: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514726] Object eec5ca58: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514729] Object eec5ca68: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514731] Object eec5ca78: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514734] Object eec5ca88: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514736] Object eec5ca98: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514739] Object eec5caa8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514741] Object eec5cab8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514744] Object eec5cac8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514747] Object eec5cad8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514750] Object eec5cae8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514752] Object eec5caf8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514755] Object eec5cb08: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514758] Object eec5cb18: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514760] Object eec5cb28: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514763] Object eec5cb38: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514766] Object eec5cb48: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514769] Object eec5cb58: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514771] Object eec5cb68: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514774] Object eec5cb78: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514777] Object eec5cb88: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514779] Object eec5cb98: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514782] Object eec5cba8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514784] Object eec5cbb8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514787] Object eec5cbc8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514790] Object eec5cbd8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514793] Object eec5cbe8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514795] Object eec5cbf8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514798] Object eec5cc08: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514800] Object eec5cc18: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514803] Object eec5cc28: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514806] Object eec5cc38: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514808] Object eec5cc48: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514810] Object eec5cc58: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514812] Object eec5cc68: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514814] Object eec5cc78: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514815] Object eec5cc88: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514817] Object eec5cc98: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514818] Object eec5cca8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514820] Object eec5ccb8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514822] Object eec5ccc8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514823] Object eec5ccd8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514825] Object eec5cce8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514827] Object eec5ccf8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514828] Object eec5cd08: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514830] Object eec5cd18: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514832] Object eec5cd28: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514833] Object eec5cd38: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514835] Object eec5cd48: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514836] Object eec5cd58: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514838] Object eec5cd68: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514840] Object eec5cd78: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514841] Object eec5cd88: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514843] Object eec5cd98: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514845] Object eec5cda8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514846] Object eec5cdb8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514848] Object eec5cdc8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514849] Object eec5cdd8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514851] Object eec5cde8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514853] Object eec5cdf8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514854] Object eec5ce08: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514856] Object eec5ce18: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514858] Object eec5ce28: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514859] Object eec5ce38: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514861] Object eec5ce48: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514863] Object eec5ce58: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514864] Object eec5ce68: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514866] Object eec5ce78: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514868] Object eec5ce88: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514871] Object eec5ce98: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514873] Object eec5cea8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514875] Object eec5ceb8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514878] Object eec5cec8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514880] Object eec5ced8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514883] Object eec5cee8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514886] Object eec5cef8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514889] Object eec5cf08: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514891] Object eec5cf18: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514893] Object eec5cf28: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514896] Object eec5cf38: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514898] Object eec5cf48: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514901] Object eec5cf58: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514903] Object eec5cf68: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514904] Object eec5cf78: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514906] Object eec5cf88: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514908] Object eec5cf98: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514909] Object eec5cfa8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514911] Object eec5cfb8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514912] Object eec5cfc8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514914] Object eec5cfd8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514916] Object eec5cfe8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514917] Object eec5cff8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514919] Object eec5d008: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514921] Object eec5d018: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514922] Object eec5d028: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514924] Object eec5d038: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514926] Object eec5d048: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514927] Object eec5d058: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514929] Object eec5d068: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514930] Object eec5d078: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514932] Object eec5d088: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514934] Object eec5d098: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514935] Object eec5d0a8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514937] Object eec5d0b8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514939] Object eec5d0c8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514940] Object eec5d0d8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514942] Object eec5d0e8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514943] Object eec5d0f8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514945] Object eec5d108: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514947] Object eec5d118: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514948] Object eec5d128: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514950] Object eec5d138: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514952] Object eec5d148: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514953] Object eec5d158: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514955] Object eec5d168: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
[  279.514957] Redzone eec5e178: bb bb bb bb                                      ....
[  279.514958] Padding eec5e220: 5a 5a 5a 5a 5a 5a 5a 5a                          ZZZZZZZZ
[  279.514962] CPU: 1 PID: 771 Comm: NetworkManager Tainted: G    B   W   E   4.8.0-rc2-wt-ath+ #1419
[  279.514964] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010
[  279.514966]  00000086 00000086 eed67af0 d74272f2 f4002ac0 eec5c178 eed67b18 d721bc0c
[  279.514974]  d7afee9c eec5c178 00004178 eec5a0c0 f6fbcdc0 eec5c178 f4002ac0 eec5c178
[  279.514982]  eed67b4c d721bd53 d7afeec8 eec5c178 eec5c497 000000c0 0000006b f6fbcdc0
[  279.514990] Call Trace:
[  279.514997]  [<d74272f2>] dump_stack+0x76/0xb4
[  279.515000]  [<d721bc0c>] print_trailer+0xcc/0x150
[  279.515003]  [<d721bd53>] check_bytes_and_report+0xc3/0x100
[  279.515006]  [<d721d6ab>] check_object+0x1fb/0x240
[  279.515009]  [<d721c020>] ? check_slab+0x80/0x130
[  279.515012]  [<d7244397>] alloc_debug_processing+0x58/0xe7
[  279.515015]  [<d721ee35>] ___slab_alloc.constprop.87+0x2f5/0x310
[  279.515019]  [<d775c26d>] ? __alloc_skb+0x5d/0x260
[  279.515022]  [<d775c26d>] ? __alloc_skb+0x5d/0x260
[  279.515024]  [<d7244447>] ? __slab_alloc.constprop.88+0x21/0x5f
[  279.515030]  [<d70af559>] ? __might_sleep+0x39/0xa0
[  279.515033]  [<d7244459>] __slab_alloc.constprop.88+0x33/0x5f
[  279.515035]  [<d775c26d>] ? __alloc_skb+0x5d/0x260
[  279.515038]  [<d72222b6>] __kmalloc_track_caller+0x336/0x3a0
[  279.515041]  [<d775c26d>] ? __alloc_skb+0x5d/0x260
[  279.515044]  [<d775b8f9>] __kmalloc_reserve.isra.47+0x29/0x70
[  279.515047]  [<d775c26d>] __alloc_skb+0x5d/0x260
[  279.515051]  [<d788d87a>] ? __mutex_unlock_slowpath+0xda/0x1a0
[  279.515057]  [<d77a659b>] netlink_dump+0x24b/0x2a0
[  279.515060]  [<d77a7a9e>] __netlink_dump_start+0x14e/0x1d0
[  279.515064]  [<d77897c5>] rtnetlink_rcv_msg+0x195/0x1e0
[  279.515067]  [<d7788bf0>] ? rtnl_fill_ifinfo+0x8f0/0x8f0
[  279.515070]  [<d7788bf0>] ? rtnl_fill_ifinfo+0x8f0/0x8f0
[  279.515072]  [<d7789630>] ? __rtnl_unlock+0x60/0x60
[  279.515074]  [<d77a96ae>] netlink_rcv_skb+0x8e/0xb0
[  279.515077]  [<d778529c>] rtnetlink_rcv+0x1c/0x30
[  279.515079]  [<d77a9070>] netlink_unicast+0x150/0x1b0
[  279.515082]  [<d77a939b>] netlink_sendmsg+0x2cb/0x380
[  279.515086]  [<d77521c5>] sock_sendmsg+0x45/0x50
[  279.515089]  [<d77533a5>] ___sys_sendmsg+0x1c5/0x1d0
[  279.515094]  [<d70df65e>] ? __lock_release.isra.46+0x39e/0x420
[  279.515100]  [<d726843c>] ? __fget+0xec/0x1f0
[  279.515102]  [<d7268457>] ? __fget+0x107/0x1f0
[  279.515105]  [<d7268350>] ? do_dup2+0x130/0x130
[  279.515108]  [<d7268565>] ? __fget_light+0x25/0x60
[  279.515110]  [<d72685b2>] ? __fdget+0x12/0x20
[  279.515113]  [<d7753ce6>] __sys_sendmsg+0x46/0x80
[  279.515116]  [<d7753d36>] SyS_sendmsg+0x16/0x20
[  279.515119]  [<d77544eb>] SyS_socketcall+0x2bb/0x310
[  279.515125]  [<d71f133b>] ? __might_fault+0x8b/0xa0
[  279.515129]  [<d70037c6>] do_fast_syscall_32+0xa6/0x1d0
[  279.515134]  [<d789127c>] sysenter_past_esp+0x45/0x74
[  279.515136] FIX kmalloc-8192: Restoring 0xeec5c178-0xeec5c497=0x6b
[  279.515136] 
[  279.515139] FIX kmalloc-8192: Marking all objects used

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
