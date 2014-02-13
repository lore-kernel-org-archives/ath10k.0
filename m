Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDlq9-0008S9-9X
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 02:15:50 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s1D2FRsv003700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 12 Feb 2014 18:15:27 -0800
Message-ID: <52FC2ABF.5010300@candelatech.com>
Date: Wed, 12 Feb 2014 18:15:27 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: ath10k crash on startup, related to ath10k_ce_completed_recv_next?
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

I saw the crash below on startup.  My firmware is put back together
again and mostly working, so not sure it is related to overly
broken firmware.

I have a few patches to ath10k, but mostly debugging code
that should not affect the logic below.


(gdb) l *(ath10k_pci_hif_exchange_bmi_msg+0x267)
0x9eb is in ath10k_pci_hif_exchange_bmi_msg (/mnt/sda/home/greearb/git/linux.ath/drivers/net/wireless/ath/ath10k/pci.c:1830).
1825		u32 ce_data;
1826		unsigned int nbytes;
1827		unsigned int transfer_id;
1828		unsigned int flags;
1829	
1830		if (ath10k_ce_completed_recv_next(ce_state, (void **)&xfer, &ce_data,
1831						  &nbytes, &transfer_id, &flags))
1832			return;
1833	
1834		if (!xfer->wait_for_resp) {
(gdb)


BUG: unable to handle kernel paging request at ffffffff815d7873
IP: [<ffffffff810fcccd>] __lock_acquire+0xf6/0xe48
PGD 1a10067 PUD 1a11063 PMD 14001e1
Oops: 0003 [#1] PREEMPT SMP
Modules linked in: microcode(+) snd_hda_codec_hdmi snd_hda_codec_realtek
microcode: CPU2 sig=0x206a7, pf=0x10, revision=0x1b
microcode: CPU2 updated to revision 0x28, date = 2012-04-24
microcode: CPU3 sig=0x206a7, pf=0x10, revision=0x1b
microcode: CPU3 sig=0x206a7, pf=0x10, revision=0x1b
microcode: CPU3 updated to revision 0x28, date = 2012-04-24
perf_event_intel: PEBS enabled due to microcode update
ath: EEPROM regdomain: 0x6a
ath: EEPROM indicates we should expect a direct regpair map
ath: Country alpha2 being used: 00
ath: Regpair used: 0x6a
cfg80211: Updating information on frequency 2412 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2417 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2422 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2427 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2432 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2437 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2442 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2447 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2452 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2457 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2462 MHz with regulatory rule:
cfg80211: 2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2467 MHz with regulatory rule:
cfg80211: 2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Updating information on frequency 2472 MHz with regulatory rule:
cfg80211: 2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A mBi, 2000 mBm)
cfg80211: Disabling freq 2484 MHz as custom regd has no rule that fits it
cfg80211: Updating information on frequency 5180 MHz with regulatory rule:
cfg80211: 5140000 KHz - 5360000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5200 MHz with regulatory rule:
cfg80211: 5140000 KHz - 5360000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5220 MHz with regulatory rule:
cfg80211: 5140000 KHz - 5360000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5240 MHz with regulatory rule:
cfg80211: 5140000 KHz - 5360000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5260 MHz with regulatory rule:
cfg80211: 5140000 KHz - 5360000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5280 MHz with regulatory rule:
cfg80211: 5140000 KHz - 5360000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5300 MHz with regulatory rule:
cfg80211: 5140000 KHz - 5360000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5320 MHz with regulatory rule:
cfg80211: 5140000 KHz - 5360000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5500 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5520 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5540 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5560 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5580 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5600 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5620 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5640 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5660 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5680 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5700 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5745 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5765 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5785 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5805 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Updating information on frequency 5825 MHz with regulatory rule:
cfg80211: 5460000 KHz - 5860000 KHz @ 80000 KHz), (N/A mBi, 3000 mBm)
cfg80211: Ignoring regulatory request set by core since the driver uses its own custom regulatory domain
ieee80211 phy2: Selected rate control algorithm 'ath9k_rate_control'
ieee80211 phy2: Atheros AR9300 Rev:3 mem=0xffffc900172c0000, irq=19
microcode: Microcode Update Driver: v2.00 <tigran@aivazian.fsnet.co.uk>, Peter Oruba
 snd_hda_codec_generic serio_raw pcspkr snd_hda_intel snd_hda_codec snd_hwdep snd_seq i2c_i801 ath10k_pci(+) snd_seq_device ath10k_core ath9k snd_pcm
ath9k_common ath9k_hw ath mac80211 lpc_ich cfg80211 e1000e ptp snd_timer pps_core snd soundcore uinput sunrpc ipv6 i915 video i2c_algo_bit drm_kms_helper drm
i2c_core
CPU: 0 PID: 572 Comm: udevd Not tainted 3.14.0-rc1-wl-ath+ #9
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
task: ffff880034402290 ti: ffff880210d90000 task.ti: ffff880210d90000
RIP: 0010:[<ffffffff810fcccd>]  [<ffffffff810fcccd>] __lock_acquire+0xf6/0xe48
RSP: 0018:ffff880210d91638  EFLAGS: 00010086
RAX: ffffffff815d76db RBX: ffff880034402290 RCX: 0000000000000002
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff880210d91768
RBP: ffff880210d916f8 R08: 0000000000000002 R09: 0000000000000001
R10: ffffffff810f5fc9 R11: ffff880034644b08 R12: 0000000000000046
R13: ffff880034bea2a0 R14: ffff880210d91768 R15: 00000000fffb9bbb
FS:  00007f92a4d93840(0000) GS:ffff88021fa00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffff815d7873 CR3: 0000000215699000 CR4: 00000000000407f0
Stack:
 ffff880210d91688 ffffffff00000000 ffff880200000001 ffffffff00000002
 0000000000000000 ffff880034402290 00000000815d74bc 0000000000000002
 ffff880034402290 ffff880034402ad0 0000000000000006 0000000000000007
Call Trace:
 [<ffffffff810fe134>] ? mark_held_locks+0x71/0x99
 [<ffffffff810c6c5d>] ? __local_bh_enable_ip+0xaa/0xd9
 [<ffffffff810fde2b>] lock_acquire+0x82/0x9d
 [<ffffffff810f5fc9>] ? complete+0x19/0x45
 [<ffffffff810c6c62>] ? __local_bh_enable_ip+0xaf/0xd9
 [<ffffffff815d76db>] _raw_spin_lock_irqsave+0x47/0x5a
 [<ffffffff810f5fc9>] ? complete+0x19/0x45
 [<ffffffff810f5fc9>] complete+0x19/0x45
 [<ffffffffa05219c7>] ath10k_pci_hif_exchange_bmi_msg+0x267/0x3f4 [ath10k_pci]
 [<ffffffffa04d893a>] ath10k_hif_exchange_bmi_msg+0xe/0x10 [ath10k_core]
 [<ffffffffa04d8cf9>] ath10k_bmi_write_memory+0xc4/0x12d [ath10k_core]
 [<ffffffffa04cfa0f>] ath10k_core_start+0x207/0x72d [ath10k_core]
 [<ffffffffa04d066d>] ath10k_core_register+0x590/0x720 [ath10k_core]
 [<ffffffffa0522d87>] ath10k_pci_probe+0x2a5/0x31f [ath10k_pci]
 [<ffffffff813151bb>] local_pci_probe+0x38/0x7e
 [<ffffffff813d3ae8>] ? driver_probe_device+0x2f9/0x2f9
 [<ffffffff8131540e>] pci_device_probe+0xc6/0xec
 [<ffffffff813d3914>] driver_probe_device+0x125/0x2f9
 [<ffffffff813d3ae8>] ? driver_probe_device+0x2f9/0x2f9
 [<ffffffff813d3b36>] __driver_attach+0x4e/0x6f
 [<ffffffff813d1d80>] bus_for_each_dev+0x5a/0x8c
 [<ffffffff813d32c8>] driver_attach+0x19/0x1b
 [<ffffffff813d2fa5>] bus_add_driver+0x110/0x1f5
 [<ffffffff813d4129>] driver_register+0x87/0xbe
 [<ffffffff8131482e>] __pci_register_driver+0x5c/0x60
 [<ffffffffa052c000>] ? 0xffffffffa052bfff
 [<ffffffffa052c020>] ath10k_pci_init+0x20/0x3c [ath10k_pci]
 [<ffffffffa052c000>] ? 0xffffffffa052bfff
 [<ffffffff81002111>] do_one_initcall+0xae/0x155
 [<ffffffff810fa57a>] ? up_read+0x24/0x29
 [<ffffffff81151123>] ? jump_label_lock+0x12/0x14
 [<ffffffff810e1025>] ? __blocking_notifier_call_chain+0x4c/0x5a
 [<ffffffff811257d8>] load_module+0x1b75/0x1ea0
 [<ffffffff81122ab5>] ? mod_kobject_put+0x9b/0x9b
 [<ffffffff812eb60e>] ? trace_hardirqs_on_thunk+0x3a/0x3f
 [<ffffffff81125bcf>] SyS_init_module+0xcc/0xdb
 [<ffffffff815dc3bd>] system_call_fastpath+0x1a/0x1f
Code: 4c 89 f7 89 8d 58 ff ff ff 44 89 8d 50 ff ff ff e8 d9 ea ff ff 48 85 c0 8b 8d 58 ff ff ff 44 8b 8d 50 ff ff ff 0f 84 9f 04 00 00 <f0> ff 80 98 01 00 00 83
3d cd 6b 38 01 00 44 8b ab e8 07 00 00
RIP  [<ffffffff810fcccd>] __lock_acquire+0xf6/0xe48
 RSP <ffff880210d91638>
CR2: ffffffff815d7873
---[ end trace 8782311e9a9383c4 ]---


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
