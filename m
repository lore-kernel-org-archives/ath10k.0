Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alNcj-00048Y-2o
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 21:25:58 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 3E30140EAC3
 for <ath10k@lists.infradead.org>; Wed, 30 Mar 2016 14:25:14 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: modified 4.4.6+, 10.4.3 fw, deadlock related to flushing beacons.
Message-ID: <56FC4439.2070609@candelatech.com>
Date: Wed, 30 Mar 2016 14:25:13 -0700
MIME-Version: 1.0
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
To: ath10k <ath10k@lists.infradead.org>

Here is a lockdep related locking splat.  I think this might have been the
lockup I was seeing before (I wasn't running lockdep then).

Firmware crashes, then we get a recursive deadlock issue.  I don't
*think* this is a problem with any of my local patches, but of course
I could be wrong.

Looks to me like the issue is here:

	peer = ath10k_peer_find(ar, vdev_id, addr);
	if (!peer) {
		ath10k_warn(ar, "failed to find peer %pM on vdev %i after creation\n",
			    addr, vdev_id);
		ath10k_wmi_peer_delete(ar, vdev_id, addr);
		spin_unlock_bh(&ar->data_lock);
		return -ENOENT;
	}


I guess we cannot safely do any WMI commands with data_lock held because of that
beacon-flush logic.  We could not create peer in this case because the
firmware crashed.

Thanks,
Ben


[root@wave2 ~]# ath10k_pci 0000:05:00.0: firmware crashed! (uuid fb63cf1d-f812-4c1a-adff-27b1fe918e25)
ath10k_pci 0000:05:00.0: firmware register dump:
ath10k_pci 0000:05:00.0: [00]: 0x00000009 0x00000000 0x0A003FCC 0x00000000
ath10k_pci 0000:05:00.0: [04]: 0x00000000 0x00060724 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: [16]: 0x009C23A7 0x0094F181 0x009406B6 0x0A003FCC
ath10k_pci 0000:05:00.0: [20]: 0x809C1E2B 0x00401C70 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: [24]: 0x809408AD 0x00401C90 0x0000001F 0x80000000
ath10k_pci 0000:05:00.0: [28]: 0x409405E1 0x00401CB0 0x0000001F 0x00955A00
ath10k_pci 0000:05:00.0: [32]: 0x00000000 0x00401CD0 0x00050024 0x00000003
ath10k_pci 0000:05:00.0: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: [56]: 0x00000000 0x00000000 0x00000000 0x00000000
ath10k_pci 0000:05:00.0: ath10k_pci ATH10K_DBG_BUFFER:
ath10k: [0000]: 00003418 0FFC380F 00000000 0000143C 00A14001 00003418 0BFC3023 00000001
ath10k: [0008]: 00000000 00003451 0FFC380F 00000000 0000143C 00A14000 00003451 0BFC3023
ath10k: [0016]: 00000001 00000000 00003489 07FC4C02 00000001 00003489 07FC4C02 00000001
ath10k: [0024]: 00003489 13FC6402 00000002 00000000 00000100 00000001 00003489 0C086402
ath10k: [0032]: 00000000 00000100 00000001 00003489 0C085852 00423FA4 00442128 00000001
ath10k: [0040]: 0000348A 10085857 71109991 00423FA4 00000000 00448D78 0000348A 10085857
ath10k: [0048]: 71109991 00423FA4 00000000 00448D8C 0000348A 10085857 71109991 00423FA4
ath10k: [0056]: 00000000 00448DDC 0000348A 14085856 71109990 00423FA4 00000000 00448DDC
ath10k: [0064]: 00001200 0000348A 14085856 71109990 00423FA4 00000000 00448D8C 00098000
ath10k: [0072]: 0000348A 08085851 00423FA4 00442128 0000348A 0C086403 00000000 00000100
ath10k: [0080]: 00000000 0000348A 04083C25 00000000 0000348A 14085856 71109990 00423FA4
ath10k: [0088]: 00000000 00448D78 01000000 0000348A 07FC4C02 00000004 0000348A 07FC582F
ath10k: [0096]: 00000007 0000348A 14085851 91107001 00423FA4 00442058 00000007 00000002
ath10k: [0104]: 0000348A 0FFC0008 91109110 009C8D40 00418A44 0000348A 17FC0001 0A003FCC
ath10k: [0112]: 00000000 00000000 00418A44 00000009
ath10k_pci 0000:05:00.0: ATH10K_END
BUG: sleeping function called from invalid context at /home/greearb/git/linux-4.4.dev.y/drivers/net/wireless/ath/ath10k/wmi.c:1824
in_atomic(): 1, irqs_disabled(): 0, pid: 2878, name: wpa_supplicant

=============================================
[ INFO: possible recursive locking detected ]
4.4.6+ #21 Tainted: G        W  O
---------------------------------------------
wpa_supplicant/2878 is trying to acquire lock:
  (&(&ar->data_lock)->rlock){+.-...}, at: [<ffffffffa0721511>] ath10k_wmi_tx_beacons_iter+0x26/0x11a [ath10k_core]

but task is already holding lock:
  (&(&ar->data_lock)->rlock){+.-...}, at: [<ffffffffa070251b>] ath10k_peer_create+0x122/0x1ae [ath10k_core]

other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&(&ar->data_lock)->rlock);
   lock(&(&ar->data_lock)->rlock);

  *** DEADLOCK ***

  May be due to missing lock nesting notation

4 locks held by wpa_supplicant/2878:
  #0:  (rtnl_mutex){+.+.+.}, at: [<ffffffff816493ca>] rtnl_lock+0x12/0x14
  #1:  (&ar->conf_mutex){+.+.+.}, at: [<ffffffffa0706932>] ath10k_add_interface+0x3b/0xbda [ath10k_core]
  #2:  (&(&ar->data_lock)->rlock){+.-...}, at: [<ffffffffa070251b>] ath10k_peer_create+0x122/0x1ae [ath10k_core]
  #3:  (rcu_read_lock){......}, at: [<ffffffffa062f304>] rcu_read_lock+0x0/0x66 [mac80211]

stack backtrace:
CPU: 3 PID: 2878 Comm: wpa_supplicant Tainted: G        W  O    4.4.6+ #21
Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 06/07/2013
  0000000000000000 ffff8801fcadf8f0 ffffffff8137086d ffffffff82681720
  ffffffff82681720 ffff8801fcadf9b0 ffffffff8112e3be ffff8801fcadf920
  0000000100000000 ffffffff82681720 ffffffffa0721500 ffff8801fcb8d348
Call Trace:
  [<ffffffff8137086d>] dump_stack+0x81/0xb6
  [<ffffffff8112e3be>] __lock_acquire+0xc5b/0xde7
  [<ffffffffa0721500>] ? ath10k_wmi_tx_beacons_iter+0x15/0x11a [ath10k_core]
  [<ffffffff8112d0d0>] ? mark_lock+0x24/0x201
  [<ffffffff8112e908>] lock_acquire+0x132/0x1cb
  [<ffffffff8112e908>] ? lock_acquire+0x132/0x1cb
  [<ffffffffa0721511>] ? ath10k_wmi_tx_beacons_iter+0x26/0x11a [ath10k_core]
  [<ffffffffa07214eb>] ? ath10k_wmi_cmd_send_nowait+0x1ce/0x1ce [ath10k_core]
  [<ffffffff816f9e2b>] _raw_spin_lock_bh+0x31/0x40
  [<ffffffffa0721511>] ? ath10k_wmi_tx_beacons_iter+0x26/0x11a [ath10k_core]
  [<ffffffffa0721511>] ath10k_wmi_tx_beacons_iter+0x26/0x11a [ath10k_core]
  [<ffffffffa07214eb>] ? ath10k_wmi_cmd_send_nowait+0x1ce/0x1ce [ath10k_core]
  [<ffffffffa062eb18>] __iterate_interfaces+0x9d/0x13d [mac80211]
  [<ffffffffa062f609>] ieee80211_iterate_active_interfaces_atomic+0x32/0x3e [mac80211]
  [<ffffffffa07214eb>] ? ath10k_wmi_cmd_send_nowait+0x1ce/0x1ce [ath10k_core]
  [<ffffffffa071fa9f>] ath10k_wmi_tx_beacons_nowait.isra.13+0x14/0x16 [ath10k_core]
  [<ffffffffa0721676>] ath10k_wmi_cmd_send+0x71/0x242 [ath10k_core]
  [<ffffffffa07023f6>] ath10k_wmi_peer_delete+0x3f/0x42 [ath10k_core]
  [<ffffffffa0702557>] ath10k_peer_create+0x15e/0x1ae [ath10k_core]
  [<ffffffffa0707004>] ath10k_add_interface+0x70d/0xbda [ath10k_core]
  [<ffffffffa05fffcc>] drv_add_interface+0x123/0x1a5 [mac80211]
  [<ffffffffa061554b>] ieee80211_do_open+0x351/0x667 [mac80211]
  [<ffffffffa06158aa>] ieee80211_open+0x49/0x4c [mac80211]
  [<ffffffff8163ecf9>] __dev_open+0x88/0xde
  [<ffffffff8163ef6e>] __dev_change_flags+0xa4/0x13a
  [<ffffffff8163f023>] dev_change_flags+0x1f/0x54
  [<ffffffff816a5532>] devinet_ioctl+0x2b9/0x5c9
  [<ffffffff816514dd>] ? copy_to_user+0x32/0x38
  [<ffffffff816a6115>] inet_ioctl+0x81/0x9d
  [<ffffffff816a6115>] ? inet_ioctl+0x81/0x9d
  [<ffffffff81621cf8>] sock_do_ioctl+0x20/0x3d
  [<ffffffff816223c4>] sock_ioctl+0x222/0x22e
  [<ffffffff8121cf95>] do_vfs_ioctl+0x453/0x4d7
  [<ffffffff81625603>] ? __sys_recvmsg+0x4c/0x5b
  [<ffffffff81225af1>] ? __fget_light+0x48/0x6c
  [<ffffffff8121d06b>] SyS_ioctl+0x52/0x74
  [<ffffffff816fa736>] entry_SYSCALL_64_fastpath+0x16/0x7a
NMI watchdog: BUG: soft lockup - CPU#3 stuck for 23s! [wpa_supplicant:2878]
Modules linked in: nf_conntrack_netlink nfnetlink iptable_raw xt_CT bridge 8021q garp mrp bnep bluetooth fuse macvlan wanlink(O) pktgen xt_CHECKSUM 
nf_nat_masquerade_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack stp llc coretemp hwmon intel_rapl iTCO_wdt iTCO_vendor_support iosf_mbi 
x86_pkg_temp_thermal intel_powerclamp kvm irqbypass snd_hda_codec_hdmi joydev ath10k_pci snd_hda_codec_realtek ath10k_core snd_hda_codec_generic ath mac80211 
snd_hda_intel snd_hda_codec snd_hda_core pcspkr snd_hwdep cfg80211 snd_seq i2c_i801 lpc_ich snd_seq_device snd_pcm snd_timer snd soundcore 8250_fintek shpchp 
tpm_tis tpm nfsd auth_rpcgss nfs_acl lockd grace sunrpc serio_raw i915 i2c_algo_bit drm_kms_helper ata_generic pata_acpi e1000e ptp pps_core drm i2c_core fjes 
video ipv6 [last unloaded: nf_nat_ipv4]
irq event stamp: 15548
hardirqs last  enabled at (15548): [<ffffffff81370895>] dump_stack+0xa9/0xb6
hardirqs last disabled at (15547): [<ffffffff8137080d>] dump_stack+0x21/0xb6
softirqs last  enabled at (15496): [<ffffffffa071cf17>] ath10k_wait_for_peer_common+0xc6/0x157 [ath10k_core]
softirqs last disabled at (15500): [<ffffffffa070251b>] ath10k_peer_create+0x122/0x1ae [ath10k_core]
CPU: 3 PID: 2878 Comm: wpa_supplicant Tainted: G        W  O    4.4.6+ #21
Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 06/07/2013
task: ffff8801fcb8cb80 ti: ffff8801fcadc000 task.ti: ffff8801fcadc000
RIP: 0010:[<ffffffff8137bac5>]  [<ffffffff8137bac5>] delay_tsc+0x26/0x78
RSP: 0018:ffff8801fcadf9e8  EFLAGS: 00000202
RAX: 00000000594a85ef RBX: ffff8800d8ef5f10 RCX: 00000034594a853b
RDX: 0000000000000034 RSI: 0000000000000003 RDI: 0000000000000001
RBP: ffff8801fcadf9e8 R08: 0000000000000001 R09: 0000000000000000
R10: ffff8801fcadf9c8 R11: ffffffff81872d40 R12: 000000002b98651e
R13: 000000007ce13148 R14: 0000000000000001 R15: ffff8800d8ef0a60
FS:  00007f653e308800(0000) GS:ffff88021e2c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557657dca008 CR3: 00000001fcbef000 CR4: 00000000001406e0
Stack:
  ffff8801fcadf9f8 ffffffff8137ba54 ffff8801fcadfa28 ffffffff81130eb9
  ffff8800d8ef5f10 ffff8800d8ef5f10 0000000000000002 ffffffffa07214eb
  ffff8801fcadfa48 ffffffff816f9e33 ffffffffa0721511 ffff8801ff6f61b0
Call Trace:
  [<ffffffff8137ba54>] __delay+0xa/0xc
  [<ffffffff81130eb9>] do_raw_spin_lock+0xf8/0xfa
  [<ffffffffa07214eb>] ? ath10k_wmi_cmd_send_nowait+0x1ce/0x1ce [ath10k_core]
  [<ffffffff816f9e33>] _raw_spin_lock_bh+0x39/0x40
  [<ffffffffa0721511>] ? ath10k_wmi_tx_beacons_iter+0x26/0x11a [ath10k_core]
  [<ffffffffa0721511>] ath10k_wmi_tx_beacons_iter+0x26/0x11a [ath10k_core]
  [<ffffffffa07214eb>] ? ath10k_wmi_cmd_send_nowait+0x1ce/0x1ce [ath10k_core]
  [<ffffffffa062eb18>] __iterate_interfaces+0x9d/0x13d [mac80211]
  [<ffffffffa062f609>] ieee80211_iterate_active_interfaces_atomic+0x32/0x3e [mac80211]
  [<ffffffffa07214eb>] ? ath10k_wmi_cmd_send_nowait+0x1ce/0x1ce [ath10k_core]
  [<ffffffffa071fa9f>] ath10k_wmi_tx_beacons_nowait.isra.13+0x14/0x16 [ath10k_core]
  [<ffffffffa0721676>] ath10k_wmi_cmd_send+0x71/0x242 [ath10k_core]
  [<ffffffffa07023f6>] ath10k_wmi_peer_delete+0x3f/0x42 [ath10k_core]
  [<ffffffffa0702557>] ath10k_peer_create+0x15e/0x1ae [ath10k_core]
  [<ffffffffa0707004>] ath10k_add_interface+0x70d/0xbda [ath10k_core]
  [<ffffffffa05fffcc>] drv_add_interface+0x123/0x1a5 [mac80211]
  [<ffffffffa061554b>] ieee80211_do_open+0x351/0x667 [mac80211]
  [<ffffffffa06158aa>] ieee80211_open+0x49/0x4c [mac80211]
  [<ffffffff8163ecf9>] __dev_open+0x88/0xde
  [<ffffffff8163ef6e>] __dev_change_flags+0xa4/0x13a
  [<ffffffff8163f023>] dev_change_flags+0x1f/0x54
  [<ffffffff816a5532>] devinet_ioctl+0x2b9/0x5c9
  [<ffffffff816514dd>] ? copy_to_user+0x32/0x38
  [<ffffffff816a6115>] inet_ioctl+0x81/0x9d
  [<ffffffff816a6115>] ? inet_ioctl+0x81/0x9d
  [<ffffffff81621cf8>] sock_do_ioctl+0x20/0x3d
  [<ffffffff816223c4>] sock_ioctl+0x222/0x22e
  [<ffffffff8121cf95>] do_vfs_ioctl+0x453/0x4d7
  [<ffffffff81625603>] ? __sys_recvmsg+0x4c/0x5b
  [<ffffffff81225af1>] ? __fget_light+0x48/0x6c
  [<ffffffff8121d06b>] SyS_ioctl+0x52/0x74
  [<ffffffff816fa736>] entry_SYSCALL_64_fastpath+0x16/0x7a
Code: ff ff ff 5d c3 55 65 ff 05 29 03 c9 7e 48 89 e5 65 8b 35 67 e6 c8 7e 0f ae e8 0f 31 48 c1 e2 20 48 89 d1 48 09 c1 0f ae e8 0f 31 <48> c1 e2 20 48 09 d0 48 
89 c2 48 29 ca 48 39 d7 76 27 65 ff 0d

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
