Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY6Nd-0000xc-G3
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 04:14:26 +0000
Received: from [50.54.140.2] (50-54-140-2.evrt.wa.frontiernet.net
 [50.54.140.2]) (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s3A4E2VM006243
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 9 Apr 2014 21:14:03 -0700
Message-ID: <53461A8A.4030209@candelatech.com>
Date: Wed, 09 Apr 2014 21:14:02 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Crash during driver startup.
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

This is in a fairly hacked code tree, so problem could be mine, but
just in case someone sees something obvious, here's the stack:

I had copied over a new firmware image and was in process of reloading
the ath10k driver and related modules when this happened.



ieee80211 phy0: Atheros AR9300 Rev:3 mem=0xffffc90016f00000, irq=18
e1000e 0000:02:00.0 eth1: registered PHC clock
e1000e 0000:02:00.0 eth1: (PCI Express:2.5GT/s:Width x1) 00:90:0b:26:81:91
e1000e 0000:02:00.0 eth1: Intel(R) PRO/1000 Network Connection
e1000e 0000:02:00.0 eth1: MAC: 3, PHY: 8, PBA No: FFFFFF-0FF
ath10k: boot warm reset complete
ath10k: boot init ce src ring id 0 entries 16 base_addr ffff8800d5418000
ath10k: boot ce dest ring id 1 entries 512 base_addr ffff880034e12000
ath10k: boot ce dest ring id 2 entries 32 base_addr ffff8800d5419000
ath10k: boot init ce src ring id 3 entries 32 base_addr ffff8800d541a000
ath10k: boot init ce src ring id 4 entries 4096 base_addr ffff880034e70000
ath10k: boot init ce src ring id 7 entries 2 base_addr ffff8800d541b000
ath10k: boot ce dest ring id 7 entries 2 base_addr ffff8800d541c000
ath10k_pci 0000:04:00.0: irq 52 for MSI/MSI-X
ath10k: boot waiting target to initialise
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 0
ath10k: boot target indicator 2
ath10k: boot target initialised
ath10k: pci irq MSI
ath10k: Hardware name qca988x hw2.0 version 0x4100016c
ath10k: trying fw api 2
iTCO_vendor_support: vendor-support=0
iTCO_wdt: Intel TCO WatchDog Timer Driver v1.10
iTCO_wdt: Found a Cougar Point TCO device (Version=2, TCOBASE=0x0460)
ath10k: found fw version 10.1.467-ct
ath10k: found fw timestamp 1397084546
ath10k: found firmware features ie (4 B)
ath10k: Enabling feature bit: 1
ath10k: Enabling feature bit: 2
ath10k: Enabling feature bit: 4
ath10k: features
ath10k: found FW bss info, RAM: addr 0x40d650 len 0x1db0  ROM: addr 0x400c00 len 0x5ce8
ath10k: found otp image ie (7561 B)
ath10k: found fw image ie (195877 B)
iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
ath10k: using fw api 2
ath10k: boot push board extended data addr 0x0
BUG: unable to handle kernel paging request at ffffffff815d6133
IP: [<ffffffff810fc68d>] __lock_acquire+0xf6/0xe48
cfg80211: Ignoring regulatory request set by core since the driver uses its own custom regulatory domain
cfg80211: World regulatory domain updated:
cfg80211:  DFS Master region: unset
cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm)
cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm)
cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm)
cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz), (N/A, 2000 mBm)
cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm)
cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm)
PGD 1a10067 PUD 1a11063 PMD 14001e1
Oops: 0003 [#1] PREEMPT SMP
Modules linked in: iTCO_wdt iTCO_vendor_support joydev cdc_acm microcode snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic pcspkr ath10k_pci(+) 
snd_hda_intel ath9k snd_hda_codec ath9k_common serio_raw ath9k_hw snd_hwdep ath10k_core ath snd_seq mac80211 snd_seq_device i2c_i801 snd_pcm cfg80211 e1000e 
lpc_ich ptp pps_core snd_timer snd soundcore uinput sunrpc ipv6 i915 video i2c_algo_bit drm_kms_helper drm i2c_core
CPU: 2 PID: 529 Comm: udevd Not tainted 3.14.0+ #15
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
task: ffff88020fe342a0 ti: ffff8802102a4000 task.ti: ffff8802102a4000
RIP: 0010:[<ffffffff810fc68d>]  [<ffffffff810fc68d>] __lock_acquire+0xf6/0xe48
RSP: 0018:ffff8802102a5628  EFLAGS: 00010082
RAX: ffffffff815d5f9b RBX: ffff88020fe342a0 RCX: 0000000000000002
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8802102a5758
RBP: ffff8802102a56e8 R08: 0000000000000002 R09: 0000000000000001
R10: ffffffff810f5999 R11: ffff8802105da510 R12: 0000000000000046
R13: ffff8800d5e2aaa0 R14: ffff8802102a5758 R15: 00000000fffb9169
FS:  00007f4bfaa71840(0000) GS:ffff88021fb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffff815d6133 CR3: 0000000214120000 CR4: 00000000000407e0
Stack:
  ffff880200000000 0000550200000000 0000000000000001 ffffffff00000002
  0000000000000000 ffff88020fe342a0 00000000815d5d7c 0000000000000002
  ffff88020fe342a0 ffff88020fe34ae0 0000000000000006 0000000000000007
Call Trace:
  [<ffffffff810fdaf4>] ? mark_held_locks+0x71/0x99
  [<ffffffff810c6b6d>] ? __local_bh_enable_ip+0xaa/0xd9
  [<ffffffff810fd7eb>] lock_acquire+0x82/0x9d
  [<ffffffff810f5999>] ? complete+0x19/0x45
  [<ffffffff810c6b72>] ? __local_bh_enable_ip+0xaf/0xd9
  [<ffffffff815d5f9b>] _raw_spin_lock_irqsave+0x47/0x5a
  [<ffffffff810f5999>] ? complete+0x19/0x45
  [<ffffffff810f5999>] complete+0x19/0x45
  [<ffffffffa056d977>] ath10k_pci_hif_exchange_bmi_msg+0x267/0x3f4 [ath10k_pci]
  [<ffffffffa0471b42>] ath10k_hif_exchange_bmi_msg+0xe/0x10 [ath10k_core]
  [<ffffffffa0471f01>] ath10k_bmi_write_memory+0xc4/0x12d [ath10k_core]
  [<ffffffffa046877f>] ath10k_core_start+0x207/0x828 [ath10k_core]
  [<ffffffffa0469723>] ath10k_core_register+0x5ca/0x77f [ath10k_core]
  [<ffffffffa056e935>] ath10k_pci_probe+0x362/0x37d [ath10k_pci]
  [<ffffffff81313783>] local_pci_probe+0x38/0x7e
  [<ffffffff813d209c>] ? driver_probe_device+0x2f9/0x2f9
  [<ffffffff813139d6>] pci_device_probe+0xc6/0xec
  [<ffffffff813d1ec8>] driver_probe_device+0x125/0x2f9
  [<ffffffff813d209c>] ? driver_probe_device+0x2f9/0x2f9
  [<ffffffff813d20ea>] __driver_attach+0x4e/0x6f
  [<ffffffff813d0330>] bus_for_each_dev+0x5a/0x8c
  [<ffffffff813d1878>] driver_attach+0x19/0x1b
  [<ffffffff813d1555>] bus_add_driver+0x110/0x1f5
  [<ffffffff813d26dd>] driver_register+0x87/0xbe
  [<ffffffff81312df6>] __pci_register_driver+0x5c/0x60
  [<ffffffffa0576000>] ? 0xffffffffa0575fff
  [<ffffffffa0576020>] ath10k_pci_init+0x20/0x3c [ath10k_pci]
  [<ffffffffa0576000>] ? 0xffffffffa0575fff
  [<ffffffff81002124>] do_one_initcall+0xae/0x156
  [<ffffffff810f9f3a>] ? up_read+0x24/0x29
  [<ffffffff81150aa1>] ? jump_label_lock+0x12/0x14
  [<ffffffff810e0965>] ? __blocking_notifier_call_chain+0x4c/0x5a
  [<ffffffff81125188>] load_module+0x1b2e/0x1e42
  [<ffffffff811224b5>] ? mod_kobject_put+0x9b/0x9b
  [<ffffffff812e9c8e>] ? trace_hardirqs_on_thunk+0x3a/0x3f
  [<ffffffff81125568>] SyS_init_module+0xcc/0xdb
  [<ffffffff815dac7d>] system_call_fastpath+0x1a/0x1f
Code: 4c 89 f7 89 8d 58 ff ff ff 44 89 8d 50 ff ff ff e8 d9 ea ff ff 48 85 c0 8b 8d 58 ff ff ff 44 8b 8d 50 ff ff ff 0f 84 9f 04 00 00 <f0> ff 80 98 01 00 00 83 
3d 0d 82 35 01 00 44 8b ab e8 07 00 00
RIP  [<ffffffff810fc68d>] __lock_acquire+0xf6/0xe48
  RSP <ffff8802102a5628>
CR2: ffffffff815d6133
---[ end trace d566585fb1bbffa2 ]---

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
