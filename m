Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYPeP-0007V0-A1
 for ath10k@lists.infradead.org; Tue, 22 Oct 2013 00:16:46 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id r9M0GNbe005433
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Mon, 21 Oct 2013 17:16:23 -0700
Message-ID: <5265C3D6.8090301@candelatech.com>
Date: Mon, 21 Oct 2013 17:16:22 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Kernel panic in today's 'ath' tree.
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

I had pulled this tree down earlier today (8250e5b5151eb332c344969dc234752bb4e331a6).
This happened on restart of my app, which will be restarting supplicant, etc.

I think I hit it earlier too, but didn't have console logging enabled then.


(gdb) l *(ath10k_pci_ce_send_done+0xd3)
0x1261 is in ath10k_pci_ce_send_done (/mnt/sda/home/greearb/git/ath/drivers/net/wireless/ath/ath10k/pci.c:630).
625		void *transfer_context;
626		u32 ce_data;
627		unsigned int nbytes;
628		unsigned int transfer_id;
629	
630		while (ath10k_ce_completed_send_next(ce_state, &transfer_context,
631						     &ce_data, &nbytes,
632						     &transfer_id) == 0) {
633			compl = get_free_compl(pipe_info);
634			if (!compl)
(gdb)


wlan2: deauthenticating from 00:03:83:3d:30:aa by local choice (reason=3)
ath10k: tx not flushed
ath10k: tx not flushed
cfg80211: Calling CRDA to update world regulatory domain
cfg80211: World regulatory domain updated:
cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211: Calling CRDA for country: US
cfg80211: Regulatory domain changed to country: US
cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2700 mBm)
cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 1700 mBm)
cfg80211:   (5250000 KHz - 5330000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5490000 KHz - 5600000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5650000 KHz - 5710000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 3000 mBm)
cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 4000 mBm)
ath10k: Completion buffers are full
IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
8021q: adding VLAN 0 to HW filter on device eth1
IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
e1000e: eth1 NIC Link is Up 1000 Mbps Full Duplex, Flow Control: Rx/Tx
IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
ath10k: MSI-X interrupt handling (8 intrs)
ath10k: UART prints disabled
ath10k: firmware 999.999.0.636 booted
ath10k: htt target version 2.1
IPv6: ADDRCONF(NETDEV_UP): wlan2: link is not ready
ath10k: Completion buffers are full
ath10k: Completion buffers are full
ath10k: MSI-X interrupt handling (8 intrs)
ath10k: UART prints disabled
ath10k: firmware 999.999.0.636 booted
ath10k: htt target version 2.1
IPv6: ADDRCONF(NETDEV_UP): wlan2: link is not ready
wlan2: authenticate with 00:03:83:3d:30:aa
wlan2: direct probe to 00:03:83:3d:30:aa (try 1/3)
wlan2: send auth to 00:03:83:3d:30:aa (try 2/3)
wlan2: authenticated
wlan2: associate with 00:03:83:3d:30:aa (try 1/3)
wlan2: RX AssocResp from 00:03:83:3d:30:aa (capab=0x1 status=0 aid=1)
IPv6: ADDRCONF(NETDEV_CHANGE): wlan2: link becomes ready
wlan2: associated
wlan2: deauthenticating from 00:03:83:3d:30:aa by local choice (reason=3)
cfg80211: Calling CRDA to update world regulatory domain
cfg80211: World regulatory domain updated:
cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211: Calling CRDA for country: US
ath10k: Completion buffers are full
BUG: unable to handle kernel NULL pointer dereference at 0000000000000008
IP: [<ffffffffa0631334>] ath10k_ce_completed_send_next+0x48/0x10d [ath10k_pci]
PGD d7f27067 PUD d9c6c067 PMD 0
Oops: 0000 [#1] PREEMPT SMP
Modules linked in: rpcsec_gss_krb5 auth_rpcgss oid_registry nfsv4 nfs fscache nf_nat_ipv4 nf_nat veth 8021q]
CPU: 3 PID: 5730 Comm: wpa_supplicant Tainted: G        WC   3.12.0-rc5-wl+ #1
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
task: ffff8802109d8000 ti: ffff8800d7f02000 task.ti: ffff8800d7f02000
RIP: 0010:[<ffffffffa0631334>]  [<ffffffffa0631334>] ath10k_ce_completed_send_next+0x48/0x10d [ath10k_pci]
RSP: 0018:ffff88021fb83df8  EFLAGS: 00010246
RAX: 0000000000000d0d RBX: ffff88021597e510 RCX: ffff88021fb83e88
RDX: 0000000000058400 RSI: ffff88021fb83e90 RDI: ffff88021597e408
RBP: ffff88021fb83e58 R08: ffff88021fb83e8c R09: ffff8800d7f03fd8
R10: 0000000000000000 R11: ffff8800cf4a61f8 R12: ffff880215579720
R13: ffff88021fb83e90 R14: 0000000000000000 R15: ffff88021fb83e84
FS:  00007f9d64722740(0000) GS:ffff88021fb80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 00000000d97bf000 CR4: 00000000000407e0
Stack:
 ffff88021fb83e28 ffff88021fb83e00 ffff88021fb83e8c ffff88021fb83e88
 0000000000000003 ffff88021597e408 ffff88021fb83e58 ffff880215579720
 ffff88021597e000 ffff88021597e510 ffff880215579720 ffff88021597e248
Call Trace:
 <IRQ>
 [<ffffffffa062f23d>] ath10k_pci_ce_send_done+0xd3/0xef [ath10k_pci]
 [<ffffffff810e00ff>] ? timekeeping_get_ns.constprop.10+0x12/0x38
 [<ffffffff810a1670>] ? _local_bh_enable_ip.isra.15+0x1e/0x9b
 [<ffffffffa0631473>] ath10k_ce_per_engine_service+0x7a/0xab [ath10k_pci]
 [<ffffffffa062e24a>] ath10k_pci_ce_tasklet+0x15/0x17 [ath10k_pci]
 [<ffffffff810a1600>] tasklet_action+0x7b/0xcd
 [<ffffffff810a17d7>] __do_softirq+0xbb/0x175
 [<ffffffff81108fbb>] ? arch_local_irq_save+0x15/0x1b
 [<ffffffff81572bdc>] call_softirq+0x1c/0x30
 <EOI>
 [<ffffffff8100c089>] do_softirq+0x40/0x7f
 [<ffffffff810a16bf>] _local_bh_enable_ip.isra.15+0x6d/0x9b
 [<ffffffff810a16f6>] local_bh_enable_ip+0x9/0xb
 [<ffffffff8156cc30>] _raw_spin_unlock_bh+0x1f/0x21
 [<ffffffffa050b0a1>] spin_unlock_bh+0x9/0xb [ath10k_core]
 [<ffffffffa050eb75>] ath10k_halt+0xe1/0xed [ath10k_core]
 [<ffffffffa050ebb7>] ath10k_stop+0x36/0x79 [ath10k_core]
 [<ffffffffa03b4580>] ieee80211_stop_device+0x44/0x6f [mac80211]
 [<ffffffffa03a238d>] ieee80211_do_stop+0x5c5/0x61d [mac80211]
 [<ffffffff810a1670>] ? _local_bh_enable_ip.isra.15+0x1e/0x9b
 [<ffffffff810a16f6>] ? local_bh_enable_ip+0x9/0xb
 [<ffffffff8156cc30>] ? _raw_spin_unlock_bh+0x1f/0x21
 [<ffffffff814d78a2>] ? dev_deactivate_many+0x105/0x148
 [<ffffffffa03a23fa>] ieee80211_stop+0x15/0x19 [mac80211]
 [<ffffffff814bb4c0>] __dev_close_many+0x7c/0xa0
 [<ffffffff814bb523>] __dev_close+0x3f/0x5e
 [<ffffffff8156cc30>] ? _raw_spin_unlock_bh+0x1f/0x21
 [<ffffffff814c110a>] __dev_change_flags+0xa6/0x129
 [<ffffffff814c120d>] dev_change_flags+0x1a/0x4f
 [<ffffffff8151d388>] devinet_ioctl+0x239/0x53f
 [<ffffffff814bba30>] ? dev_get_by_name_rcu+0x34/0x56
 [<ffffffff8151ddec>] inet_ioctl+0x87/0xa4
 [<ffffffff814aa42e>] sock_do_ioctl+0x22/0x41
 [<ffffffff814aa859>] sock_ioctl+0x1fe/0x20b
 [<ffffffff8117481d>] vfs_ioctl+0x21/0x34
 [<ffffffff81175076>] do_vfs_ioctl+0x3b8/0x3fb
 [<ffffffff8117cb0b>] ? fget_light+0x39/0x99
 [<ffffffff8117510b>] SyS_ioctl+0x52/0x7f
 [<ffffffff810e070e>] ? current_kernel_time+0xd/0x31
 [<ffffffff815716bd>] system_call_fastpath+0x1a/0x1f
Code: 48 89 4d b8 4c 89 45 b0 48 8b 80 a0 01 00 00 48 05 08 04 00 00 48 89 c7 48 89 45 c8 e8 df f8 ff ff 4c
RIP  [<ffffffffa0631334>] ath10k_ce_completed_send_next+0x48/0x10d [ath10k_pci]
 RSP <ffff88021fb83df8>
CR2: 0000000000000008
---[ end trace b61c38f55596de5a ]---
Kernel panic - not syncing: Fatal exception in interrupt


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
