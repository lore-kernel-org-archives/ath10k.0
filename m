Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjwOz-000852-ET
 for ath10k@lists.infradead.org; Mon, 12 May 2014 20:00:46 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 93DBE40A339
 for <ath10k@lists.infradead.org>; Mon, 12 May 2014 13:00:22 -0700 (PDT)
Message-ID: <53712856.4010807@candelatech.com>
Date: Mon, 12 May 2014 13:00:22 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Panic when changing ath10k channel
References: <53711F4C.80402@candelatech.com>
In-Reply-To: <53711F4C.80402@candelatech.com>
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

We saw this on a Fedora 14 system (with 3.14.3+ kernel, and our firmware).

Our kernel is a mix of local patches and kvalo's ath.git and 3.14.3.

Don't think I've seen this one before, not sure if it is reproducible,
but in general this system has been more touchy than most for some
reason...



-------- Original Message --------
Subject: F14 panic when changing ath10k channel
Date: Mon, 12 May 2014 12:21:48 -0700
From: Isaac Konikoff <konikofi@candelatech.com>
To: 'Ben Greear' <greearb@candelatech.com>

------------[ cut here ]------------
WARNING: CPU: 2 PID: 3277 at
/home/greearb/git/linux-3.14.dev.y/kernel/irq/manage.c:1249
__free_irq+0x96/0x199()
Trying to free already-free IRQ 18
Modules linked in: iptable_raw xt_CT nf_nat_ipv4 nf_nat fuse 8021q mrp
garp stp llc macvlan wanlink(O) pktgen coretemp hwmon nfsv3 nfs_acl nfs
fscache lockd sunrpc ipv6 uinput snd_hda_codec_realtek
snd_hda_codec_generic ath10k_pci snd_hda_intel ath9k ath10k_core
snd_hda_codec mac80211 snd_hwdep ath9k_common snd_seq ath9k_hw
snd_seq_device e1000e snd_pcm ath iTCO_wdt gpio_ich ppdev
iTCO_vendor_support microcode parport_pc cfg80211 snd_timer i2c_i801
pcspkr serio_raw parport snd ptp lpc_ich soundcore pps_core i915
drm_kms_helper drm i2c_algo_bit i2c_core video [last unloaded: iptable_nat]
CPU: 2 PID: 3277 Comm: ip Tainted: G         C O 3.14.3+ #24
Hardware name: To be filled by O.E.M. To be filled by O.E.M./To be
filled by O.E.M., BIOS 4.6.3 09/05/2011
 00000000000004e1 ffff8802191b9368 ffffffff815bd318 00000000000004e1
 ffff8802191b93b8 ffff8802191b93a8 ffffffff810addce 00000000810ef18f
 ffffffff810f1e3c 0000000000000000 ffff880221f7d600 0000000000000012
Call Trace:
 [<ffffffff815bd318>] dump_stack+0x51/0x79
 [<ffffffff810addce>] warn_slowpath_common+0x77/0x91
 [<ffffffff810f1e3c>] ? __free_irq+0x96/0x199
 [<ffffffff810ade7c>] warn_slowpath_fmt+0x41/0x43
 [<ffffffff810f1e3c>] __free_irq+0x96/0x199
 [<ffffffff810f1fb1>] free_irq+0x72/0x8b
 [<ffffffffa05565eb>] ath10k_pci_hif_stop+0x78/0x16b [ath10k_pci]
 [<ffffffffa04f7b08>] ath10k_htc_stop+0x35/0x3a [ath10k_core]
 [<ffffffffa04f6101>] ath10k_core_stop+0x2a/0x42 [ath10k_core]
 [<ffffffffa04f1cbd>] ath10k_halt+0xc2/0x11a [ath10k_core]
 [<ffffffffa04f1d4c>] ath10k_stop+0x37/0x88 [ath10k_core]
 [<ffffffffa0403f0d>] ieee80211_stop_device+0x47/0x74 [mac80211]
 [<ffffffffa03f08a4>] ieee80211_do_stop+0x61e/0x658 [mac80211]
 [<ffffffff8152ae8e>] ? netif_tx_lock+0x72/0x87
 [<ffffffff815c0595>] ? _raw_spin_unlock_bh+0x15/0x17
 [<ffffffff8152b279>] ? dev_deactivate_many+0x122/0x165
 [<ffffffffa03f0944>] ieee80211_stop+0x15/0x19 [mac80211]
 [<ffffffff8150fdfe>] __dev_close_many+0x85/0xae
 [<ffffffff81510c3f>] __dev_close+0x48/0x8a
 [<ffffffff815c0595>] ? _raw_spin_unlock_bh+0x15/0x17
 [<ffffffff81510ef9>] __dev_change_flags+0xb5/0x158
 [<ffffffff81510fbf>] dev_change_flags+0x23/0x59
 [<ffffffff8151eaa6>] do_setlink+0x2b4/0x77c
 [<ffffffff8151fb8c>] rtnl_newlink+0x3c6/0x62a
 [<ffffffff8151f8cf>] ? rtnl_newlink+0x109/0x62a
 [<ffffffff811370d6>] ? find_get_page+0x79/0x84
 [<ffffffff8151f7b0>] rtnetlink_rcv_msg+0x18e/0x1a4
 [<ffffffff8114c8e1>] ? zone_statistics+0x77/0x7e
 [<ffffffff8151f622>] ? rtnetlink_rcv+0x28/0x28
 [<ffffffff81534bf7>] netlink_rcv_skb+0x3e/0x8f
 [<ffffffff8151f61b>] rtnetlink_rcv+0x21/0x28
 [<ffffffff815349b4>] netlink_unicast+0xcc/0x150
 [<ffffffff8153554f>] netlink_sendmsg+0x5cd/0x600
 [<ffffffff8113e6d1>] ? __alloc_pages_nodemask+0x159/0x805
 [<ffffffff814fc5e2>] __sock_sendmsg+0x59/0x64
 [<ffffffff814fc636>] sock_sendmsg+0x49/0x62
 [<ffffffff81170894>] ? alloc_pages_vma+0xd1/0x113
 [<ffffffff81142314>] ? __lru_cache_add+0x27/0x58
 [<ffffffff814fc885>] ___sys_sendmsg+0x236/0x2c4
 [<ffffffff815c388c>] ? __do_page_fault+0x33c/0x38a
 [<ffffffff8119e931>] ? mntput_no_expire+0x29/0x11a
 [<ffffffff8119ea47>] ? mntput+0x25/0x27
 [<ffffffff81186f70>] ? __fput+0x19e/0x1ad
 [<ffffffff814fcacf>] __sys_sendmsg+0x3d/0x5b
 [<ffffffff814fcb01>] SyS_sendmsg+0x14/0x16
 [<ffffffff815c5679>] system_call_fastpath+0x16/0x1b
---[ end trace cd3b8cfef4044535 ]---
BUG: Bad page state in process ip  pfn:c28f8
page:ffffea00030a3e00 count:0 mapcount:-2146107391 mapping:
(null) index:0xffff8800c28f83c0
page flags: 0x3fff8000000080(slab)
page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
bad because of flags:
page flags: 0x80(slab)
Modules linked in: iptable_raw xt_CT nf_nat_ipv4 nf_nat fuse 8021q mrp
garp stp llc macvlan wanlink(O) pktgen coretemp hwmon nfsv3 nfs_acl nfs
fscache lockd sunrpc ipv6 uinput snd_hda_codec_realtek
snd_hda_codec_generic ath10k_pci snd_hda_intel ath9k ath10k_core
snd_hda_codec mac80211 snd_hwdep ath9k_common snd_seq ath9k_hw
snd_seq_device e1000e snd_pcm ath iTCO_wdt gpio_ich ppdev
iTCO_vendor_support microcode parport_pc cfg80211 snd_timer i2c_i801
pcspkr serio_raw parport snd ptp lpc_ich soundcore pps_core i915
drm_kms_helper drm i2c_algo_bit i2c_core video [last unloaded: iptable_nat]
CPU: 0 PID: 3277 Comm: ip Tainted: G        WC O 3.14.3+ #24
Hardware name: To be filled by O.E.M. To be filled by O.E.M./To be
filled by O.E.M., BIOS 4.6.3 09/05/2011
 ffffffff817f476a ffff8802191b9398 ffffffff815bd318 ffffffff817f476a
 ffffea00030a3e00 ffff8802191b93c8 ffffffff8113ba83 ffff8802191b93e8
 0000000000000002 ffffea00030a3e00 0000000000000000 ffff8802191b9408
Call Trace:
 [<ffffffff815bd318>] dump_stack+0x51/0x79
 [<ffffffff8113ba83>] bad_page+0xf5/0x114
 [<ffffffff8113bdc8>] free_pages_prepare+0x99/0xf7
 [<ffffffff8113c16c>] __free_pages_ok+0x18/0x91
 [<ffffffff8113c340>] __free_pages+0x1c/0x1e
 [<ffffffff8113c464>] free_pages+0x44/0x46
 [<ffffffff812e7d25>] swiotlb_free_coherent+0x73/0x7c
 [<ffffffff8103b6b1>] x86_swiotlb_free_coherent+0x9/0xb
 [<ffffffffa04f8b69>] dma_free_attrs.clone.0+0x6c/0x77 [ath10k_core]
 [<ffffffffa04f8c79>] ath10k_htt_rx_detach+0xd4/0x102 [ath10k_core]
 [<ffffffffa04f852d>] ath10k_htt_detach+0x11/0x1d [ath10k_core]
 [<ffffffffa04f610d>] ath10k_core_stop+0x36/0x42 [ath10k_core]
 [<ffffffffa04f1cbd>] ath10k_halt+0xc2/0x11a [ath10k_core]
 [<ffffffffa04f1d4c>] ath10k_stop+0x37/0x88 [ath10k_core]
 [<ffffffffa0403f0d>] ieee80211_stop_device+0x47/0x74 [mac80211]
 [<ffffffffa03f08a4>] ieee80211_do_stop+0x61e/0x658 [mac80211]
 [<ffffffff8152ae8e>] ? netif_tx_lock+0x72/0x87
 [<ffffffff815c0595>] ? _raw_spin_unlock_bh+0x15/0x17
 [<ffffffff8152b279>] ? dev_deactivate_many+0x122/0x165
 [<ffffffffa03f0944>] ieee80211_stop+0x15/0x19 [mac80211]
 [<ffffffff8150fdfe>] __dev_close_many+0x85/0xae
 [<ffffffff81510c3f>] __dev_close+0x48/0x8a
 [<ffffffff815c0595>] ? _raw_spin_unlock_bh+0x15/0x17
 [<ffffffff81510ef9>] __dev_change_flags+0xb5/0x158
 [<ffffffff81510fbf>] dev_change_flags+0x23/0x59
 [<ffffffff8151eaa6>] do_setlink+0x2b4/0x77c
 [<ffffffff8151fb8c>] rtnl_newlink+0x3c6/0x62a
 [<ffffffff8151f8cf>] ? rtnl_newlink+0x109/0x62a
 [<ffffffff811370d6>] ? find_get_page+0x79/0x84
 [<ffffffff8151f7b0>] rtnetlink_rcv_msg+0x18e/0x1a4
 [<ffffffff8114c8e1>] ? zone_statistics+0x77/0x7e
 [<ffffffff8151f622>] ? rtnetlink_rcv+0x28/0x28
 [<ffffffff81534bf7>] netlink_rcv_skb+0x3e/0x8f
 [<ffffffff8151f61b>] rtnetlink_rcv+0x21/0x28
 [<ffffffff815349b4>] netlink_unicast+0xcc/0x150
 [<ffffffff8153554f>] netlink_sendmsg+0x5cd/0x600
 [<ffffffff8113e6d1>] ? __alloc_pages_nodemask+0x159/0x805
 [<ffffffff814fc5e2>] __sock_sendmsg+0x59/0x64
 [<ffffffff814fc636>] sock_sendmsg+0x49/0x62
 [<ffffffff81170894>] ? alloc_pages_vma+0xd1/0x113
 [<ffffffff81142314>] ? __lru_cache_add+0x27/0x58
 [<ffffffff814fc885>] ___sys_sendmsg+0x236/0x2c4
 [<ffffffff815c388c>] ? __do_page_fault+0x33c/0x38a
 [<ffffffff8119e931>] ? mntput_no_expire+0x29/0x11a
 [<ffffffff8119ea47>] ? mntput+0x25/0x27
 [<ffffffff81186f70>] ? __fput+0x19e/0x1ad
 [<ffffffff814fcacf>] __sys_sendmsg+0x3d/0x5b
 [<ffffffff814fcb01>] SyS_sendmsg+0x14/0x16
 [<ffffffff815c5679>] system_call_fastpath+0x16/0x1b
Disabling lock debugging due to kernel taint
BUG: unable to handle kernel NULL pointer dereference at 0000000000000068
IP: [<ffffffffa04fb2fa>] ath10k_txrx_tx_unref+0x85/0x3f6 [ath10k_core]
PGD 21a678067 PUD 21a639067 PMD 0
Oops: 0000 [#1] PREEMPT SMP
Modules linked in: iptable_raw xt_CT nf_nat_ipv4 nf_nat fuse 8021q mrp
garp stp llc macvlan wanlink(O) pktgen coretemp hwmon nfsv3 nfs_acl nfs
fscache lockd sunrpc ipv6 uinput snd_hda_codec_realtek
snd_hda_codec_generic ath10k_pci snd_hda_intel ath9k ath10k_core
snd_hda_codec mac80211 snd_hwdep ath9k_common snd_seq ath9k_hw
snd_seq_device e1000e snd_pcm ath iTCO_wdt gpio_ich ppdev
iTCO_vendor_support microcode parport_pc cfg80211 snd_timer i2c_i801
pcspkr serio_raw parport snd ptp lpc_ich soundcore pps_core i915
drm_kms_helper drm i2c_algo_bit i2c_core video [last unloaded: iptable_nat]
CPU: 2 PID: 3277 Comm: ip Tainted: G    B   WC O 3.14.3+ #24
Hardware name: To be filled by O.E.M. To be filled by O.E.M./To be
filled by O.E.M., BIOS 4.6.3 09/05/2011
task: ffff880222118000 ti: ffff8802191b8000 task.ti: ffff8802191b8000
RIP: 0010:[<ffffffffa04fb2fa>]  [<ffffffffa04fb2fa>]
ath10k_txrx_tx_unref+0x85/0x3f6 [ath10k_core]
RSP: 0018:ffff8802191b9488  EFLAGS: 00010282
RAX: 0000000000000180 RBX: ffff8802191b94d8 RCX: 0000000000000001
RDX: ffff880216990000 RSI: 0000000000000180 RDI: 0000000000000008
RBP: ffff8802191b94c8 R08: 0000000000000000 R09: ffff880221c45098
R10: ffffffffa04f8c9e R11: ffff8800379f0b40 R12: ffff880221b8e758
R13: 0000000000000000 R14: 0000000000000028 R15: 0000000000000030
FS:  00007f021a519720(0000) GS:ffff88022bd00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
CR2: 0000000000000068 CR3: 0000000216990000 CR4: 00000000000007e0
Stack:
 ffffffffa0505efb ffff880221c45098 0000000000000000 ffff880221b8e758
 0000000000000180 ffff880221b8e814 ffff8802191b94d8 ffff880221b8ec60
 ffff8802191b9508 ffffffffa04fa8c3 ffff000100000180 ffffffffa04f8c9e
Call Trace:
 [<ffffffffa04fa8c3>] ath10k_htt_tx_detach+0x75/0xd8 [ath10k_core]
 [<ffffffffa04f8c9e>] ? ath10k_htt_rx_detach+0xf9/0x102 [ath10k_core]
 [<ffffffffa04f8535>] ath10k_htt_detach+0x19/0x1d [ath10k_core]
 [<ffffffffa04f610d>] ath10k_core_stop+0x36/0x42 [ath10k_core]
 [<ffffffffa04f1cbd>] ath10k_halt+0xc2/0x11a [ath10k_core]
 [<ffffffffa04f1d4c>] ath10k_stop+0x37/0x88 [ath10k_core]
 [<ffffffffa0403f0d>] ieee80211_stop_device+0x47/0x74 [mac80211]
 [<ffffffffa03f08a4>] ieee80211_do_stop+0x61e/0x658 [mac80211]
 [<ffffffff8152ae8e>] ? netif_tx_lock+0x72/0x87
 [<ffffffff815c0595>] ? _raw_spin_unlock_bh+0x15/0x17
 [<ffffffff8152b279>] ? dev_deactivate_many+0x122/0x165
 [<ffffffffa03f0944>] ieee80211_stop+0x15/0x19 [mac80211]
 [<ffffffff8150fdfe>] __dev_close_many+0x85/0xae
 [<ffffffff81510c3f>] __dev_close+0x48/0x8a
 [<ffffffff815c0595>] ? _raw_spin_unlock_bh+0x15/0x17
 [<ffffffff81510ef9>] __dev_change_flags+0xb5/0x158
 [<ffffffff81510fbf>] dev_change_flags+0x23/0x59
 [<ffffffff8151eaa6>] do_setlink+0x2b4/0x77c
 [<ffffffff8151fb8c>] rtnl_newlink+0x3c6/0x62a
 [<ffffffff8151f8cf>] ? rtnl_newlink+0x109/0x62a
 [<ffffffff811370d6>] ? find_get_page+0x79/0x84
 [<ffffffff8151f7b0>] rtnetlink_rcv_msg+0x18e/0x1a4
 [<ffffffff8114c8e1>] ? zone_statistics+0x77/0x7e
 [<ffffffff8151f622>] ? rtnetlink_rcv+0x28/0x28
 [<ffffffff81534bf7>] netlink_rcv_skb+0x3e/0x8f
 [<ffffffff8151f61b>] rtnetlink_rcv+0x21/0x28
 [<ffffffff815349b4>] netlink_unicast+0xcc/0x150
 [<ffffffff8153554f>] netlink_sendmsg+0x5cd/0x600
 [<ffffffff8113e6d1>] ? __alloc_pages_nodemask+0x159/0x805
 [<ffffffff814fc5e2>] __sock_sendmsg+0x59/0x64
 [<ffffffff814fc636>] sock_sendmsg+0x49/0x62
 [<ffffffff81170894>] ? alloc_pages_vma+0xd1/0x113
 [<ffffffff81142314>] ? __lru_cache_add+0x27/0x58
 [<ffffffff814fc885>] ___sys_sendmsg+0x236/0x2c4
 [<ffffffff815c388c>] ? __do_page_fault+0x33c/0x38a
 [<ffffffff8119e931>] ? mntput_no_expire+0x29/0x11a
 [<ffffffff8119ea47>] ? mntput+0x25/0x27
 [<ffffffff81186f70>] ? __fput+0x19e/0x1ad
 [<ffffffff814fcacf>] __sys_sendmsg+0x3d/0x5b
 [<ffffffff814fcb01>] SyS_sendmsg+0x14/0x16
 [<ffffffff815c5679>] system_call_fastpath+0x16/0x1b
Code: c7 6c 60 50 a0 31 c0 e8 17 89 ff ff e9 7c 03 00 00 49 8b 94 24 c8
00 00 00 0f b7 c0 4d 85 c9 4c 8b 2c c2 4d 8d 75 28 4d 8d 7d 30 <41> 8b
55 68 49 8b 75 30 74 0c 49 8b 81 f8 01 00 00 48 85 c0 75
RIP  [<ffffffffa04fb2fa>] ath10k_txrx_tx_unref+0x85/0x3f6 [ath10k_core]
 RSP <ffff8802191b9488>
CR2: 0000000000000068
---[ end trace cd3b8cfef4044536 ]---
Kernel panic - not syncing: Fatal exception in interrupt
Kernel Offset: 0x0 from 0xffffffff81000000 (relocation range:
0xffffffff80000000-0xffffffff9fffffff)
drm_kms_helper: panic occurred, switching back to text console
Rebooting in 10 seconds..

-- 
Isaac Konikoff
Candela Technologies
konikofi@candelatech.com
Office: +1 360 380 1618
Cell: +1 360 389 2453
Fax: +1 360 380 1431




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
