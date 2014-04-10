Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYKCu-0007wp-EU
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 19:00:17 +0000
Received: from [50.54.140.2] (50-54-140-2.evrt.wa.frontiernet.net
 [50.54.140.2]) (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s3AIxkHc023314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Thu, 10 Apr 2014 11:59:46 -0700
Message-ID: <5346EA22.2070100@candelatech.com>
Date: Thu, 10 Apr 2014 11:59:46 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Another crash in ath10k.
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

This is also from a hacked-upon kernel, so problem could be my fault.

Thanks,
Ben


kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
BUG: unable to handle kernel paging request at ffff880216300600
IP: [<ffff880216300600>] 0xffff880216300600
PGD 2504067 PUD 2507067 PMD 80000002162001e3
Oops: 0011 [#1] PREEMPT SMP
Modules linked in: nf_nat_ipv4 nf_nat 8021q garp stp mrp llc macvlan wanlink(O) pktgen lockd f71882fg coretemp hwmon iTCO_wdt iTCO_vendor_support joydev cdc_acm 
microcode pcspkr ath9k ath9k_common ath9k_hw ath10k_pci ath10k_core ath serio_raw snd_hda_codec_hdmi i2c_i801 snd_hda_codec_realtek snd_hda_codec_generic 
mac80211 cfg80211 snd_hda_intel snd_hda_codec snd_hwdep snd_seq snd_seq_device lpc_ich e1000e ptp pps_core snd_pcm snd_timer snd soundcore uinput sunrpc ipv6 
i915 video i2c_algo_bit drm_kms_helper drm i2c_core [last unloaded: iptable_nat]
CPU: 2 PID: 8752 Comm: ip Tainted: G        WC O 3.14.0+ #17
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
task: ffff8800c3fca150 ti: ffff8800d295e000 task.ti: ffff8800d295e000
RIP: 0010:[<ffff880216300600>]  [<ffff880216300600>] 0xffff880216300600
RSP: 0018:ffff8800d295f460  EFLAGS: 00010246
RAX: 0000000080000000 RBX: ffff88020f907700 RCX: 0000000000000002
RDX: 0000000000000016 RSI: 0000000000000001 RDI: ffff88020f907700
RBP: ffff8800d295f478 R08: 0000000000000000 R09: ffffffff81511c6c
R10: ffffffff81511c6c R11: 0000000000000296 R12: 00000000000001a5
R13: ffff88020f907700 R14: 00000000000001a4 R15: ffff8800d20f3c20
FS:  00007f957df66740(0000) GS:ffff88021fb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff880216300600 CR3: 00000000d5706000 CR4: 00000000000407e0
Stack:
  ffffffff81512789 0000000000000000 ffff88020f907700 ffff8800d295f498
  ffffffff815127c5 0000000000000000 ffff88020f907700 ffff8800d295f4b8
  ffffffff81512811 0000000000000000 ffff88020f907700 ffff8800d295f4d8
Call Trace:
  [<ffffffff81512789>] ? skb_release_head_state+0x65/0x93
  [<ffffffff815127c5>] skb_release_all+0xe/0x24
  [<ffffffff81512811>] __kfree_skb+0xe/0x75
  [<ffffffff81512c94>] consume_skb+0x32/0x36
  [<ffffffff81519fdf>] __dev_kfree_skb_any+0x3b/0x3d
  [<ffffffffa04c6a8f>] dev_kfree_skb_any+0xe/0x10 [ath10k_core]
  [<ffffffffa04c7f04>] ath10k_htt_rx_detach+0x8f/0xf8 [ath10k_core]
  [<ffffffffa04c6973>] ath10k_htt_detach+0xe/0x1b [ath10k_core]
  [<ffffffffa04c4fba>] ath10k_core_stop+0x4f/0x70 [ath10k_core]
  [<ffffffffa04c1aea>] ath10k_halt+0xd2/0x155 [ath10k_core]
  [<ffffffffa04c1ba5>] ath10k_stop+0x38/0x89 [ath10k_core]
  [<ffffffffa039ab8a>] ieee80211_stop_device+0x58/0x84 [mac80211]
  [<ffffffffa04bc3b6>] ? spin_lock_bh+0x9/0xb [ath10k_core]
  [<ffffffffa03871d3>] ieee80211_do_stop+0x5ec/0x644 [mac80211]
  [<ffffffff810fdcca>] ? trace_hardirqs_on+0xd/0xf
  [<ffffffff810c6b72>] ? __local_bh_enable_ip+0xaf/0xd9
  [<ffffffff815d5cf6>] ? _raw_spin_unlock_bh+0x31/0x35
  [<ffffffff815382f3>] ? dev_deactivate_many+0x129/0x172
  [<ffffffffa0387240>] ieee80211_stop+0x15/0x19 [mac80211]
  [<ffffffff81519cea>] __dev_close_many+0x95/0xba
  [<ffffffff81519d8e>] __dev_close+0x48/0x67
  [<ffffffff81520445>] __dev_change_flags+0xa6/0x14a
  [<ffffffff8152051c>] dev_change_flags+0x23/0x59
  [<ffffffff81529ff1>] do_setlink+0x2d0/0x78c
  [<ffffffff810fdaf4>] ? mark_held_locks+0x71/0x99
  [<ffffffff81158b5b>] ? get_page_from_freelist+0x5b1/0x789
  [<ffffffff8152ccb0>] rtnl_newlink+0x361/0x591
  [<ffffffff8152ca53>] ? rtnl_newlink+0x104/0x591
  [<ffffffff810fc927>] ? __lock_acquire+0x390/0xe48
  [<ffffffff810fdaf4>] ? mark_held_locks+0x71/0x99
  [<ffffffff815d3d19>] ? mutex_lock_nested+0x340/0x3e0
  [<ffffffff8152c93c>] rtnetlink_rcv_msg+0x186/0x199
  [<ffffffff815d3d21>] ? mutex_lock_nested+0x348/0x3e0
  [<ffffffff81529941>] ? rtnl_lock+0x12/0x14
  [<ffffffff81529941>] ? rtnl_lock+0x12/0x14
  [<ffffffff8152c7b6>] ? __rtnl_unlock+0x12/0x12
  [<ffffffff8154238a>] netlink_rcv_skb+0x3d/0x8b
  [<ffffffff81529964>] rtnetlink_rcv+0x21/0x28
  [<ffffffff81541b68>] netlink_unicast+0xc6/0x147
  [<ffffffff81542189>] netlink_sendmsg+0x5a0/0x5e6
  [<ffffffff810fcb85>] ? __lock_acquire+0x5ee/0xe48
  [<ffffffff81507230>] __sock_sendmsg_nosec+0x25/0x27
  [<ffffffff815099d7>] sock_sendmsg+0x5a/0x7b
  [<ffffffff810fd73c>] ? lock_release+0x14e/0x17b
  [<ffffffff8116d3be>] ? might_fault+0x9e/0xa5
  [<ffffffff8116d375>] ? might_fault+0x55/0xa5
  [<ffffffff81514a1d>] ? verify_iovec+0x60/0xb3
  [<ffffffff8150a00c>] ___sys_sendmsg+0x226/0x2d9
  [<ffffffff810fcb85>] ? __lock_acquire+0x5ee/0xe48
  [<ffffffff815d8fc3>] ? __do_page_fault+0x33a/0x3e9
  [<ffffffff811b58d6>] ? rcu_read_unlock+0x21/0x23
  [<ffffffff810fd7fd>] ? lock_acquire+0x94/0x9d
  [<ffffffff81115cc3>] ? read_seqcount_begin.constprop.25+0x73/0x90
  [<ffffffff8150ad08>] __sys_sendmsg+0x3d/0x5b
  [<ffffffff8150ad33>] SyS_sendmsg+0xd/0x19
  [<ffffffff815dac7d>] system_call_fastpath+0x1a/0x1f
Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <00> 17 00 17 02 88 ff ff 
00 00 00 00 00 00 00 00 c0 06 30 16 02
RIP  [<ffff880216300600>] 0xffff880216300600
  RSP <ffff8800d295f460>
CR2: ffff880216300600
---[ end trace ba1206597cf05a01 ]---

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
