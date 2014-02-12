Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDiSh-0003pz-0W
 for ath10k@lists.infradead.org; Wed, 12 Feb 2014 22:39:23 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id s1CMcveS018295
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Wed, 12 Feb 2014 14:38:59 -0800
Message-ID: <52FBF801.1080003@candelatech.com>
Date: Wed, 12 Feb 2014 14:38:57 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Crash when using very buggy firmware.
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

I managed to introduce a nasty firmware crash in my test system,
and I saw this ath10k kernel splat when rebooting.  Probably bad
firmware should not be able to cause this, but I'm not sure if
it is possible to hit this problem with any normal firmware.

(gdb) l *(ath10k_htt_detach+0xe)
0x9d23 is in ath10k_htt_detach (/mnt/sda/home/greearb/git/linux.ath/drivers/net/wireless/ath/ath10k/htt.c:147).
142	}
143	
144	void ath10k_htt_detach(struct ath10k_htt *htt)
145	{
146		ath10k_htt_rx_detach(htt);
147		ath10k_htt_tx_detach(htt);
148	}
(gdb) l *(skb_tailroom+0x2)
0x9d32 is in skb_tailroom (/mnt/sda/home/greearb/git/linux.ath/include/linux/skbuff.h:1569).
1564	 *
1565	 *	Return the number of bytes of free space at the tail of an sk_buff
1566	 */
1567	static inline int skb_tailroom(const struct sk_buff *skb)
1568	{
1569		return skb_is_nonlinear(skb) ? 0 : skb->end - skb->tail;
1570	}
1571	
1572	/**
1573	 *	skb_availroom - bytes at buffer end
(gdb)


general protection fault: 0000 [#1] PREEMPT SMP
Modules linked in: ath10k_pci(-) ath10k_core ath mac80211 cfg80211 nf_nat_ipv4 nf_nat veth 8021q garp stp mrp ]
CPU: 0 PID: 7880 Comm: rmmod Tainted: G        WC   3.14.0-rc1-wl-ath+ #9
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
task: ffff8801ff810000 ti: ffff88020158e000 task.ti: ffff88020158e000
RIP: 0010:[<ffffffffa09b8d32>]  [<ffffffffa09b8d32>] skb_tailroom+0x2/0x1a [ath10k_core]
RSP: 0018:ffff88020158fac0  EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8800d533ac20 RCX: ffff8801ff810806
RDX: 0000000000000006 RSI: ffff8800d533ae08 RDI: 6b6b6b6b6b6b6b6b
RBP: ffff88020158fae8 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff810cc0b9 R11: 0000000000000296 R12: 00000000000001b6
R13: 6b6b6b6b6b6b6b6b R14: 00000000000001b5 R15: ffff8800d533b318
FS:  00007f873106e740(0000) GS:ffff88021fa00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f36ea496118 CR3: 00000000d33a4000 CR4: 00000000000407f0
Stack:
 ffffffffa09b97b9 ffff8800d533ac20 ffff8800d533b2d0 ffff8800d533afb0
 ffff8800d533b318 ffff88020158fb08 ffffffffa09b8d23 ffff880210baa290
 ffff8800d533a2a0 ffff88020158fb28 ffffffffa09b67e7 0000000000000005
Call Trace:
 [<ffffffffa09b97b9>] ? ath10k_htt_rx_detach+0x45/0xd4 [ath10k_core]
 [<ffffffffa09b8d23>] ath10k_htt_detach+0xe/0x1b [ath10k_core]
 [<ffffffffa09b67e7>] ath10k_core_stop+0x43/0x64 [ath10k_core]
 [<ffffffffa09b4225>] ath10k_halt+0xe8/0x168 [ath10k_core]
 [<ffffffffa09b42dd>] ath10k_stop+0x38/0x7b [ath10k_core]
 [<ffffffffa08762ad>] ieee80211_stop_device+0x58/0x84 [mac80211]
 [<ffffffffa09af2e6>] ? spin_lock_bh+0x9/0xb [ath10k_core]
 [<ffffffffa0862c0d>] ieee80211_do_stop+0x5db/0x633 [mac80211]
 [<ffffffff815d7436>] ? _raw_spin_unlock_bh+0x31/0x35
 [<ffffffff81539a96>] ? dev_deactivate_many+0x129/0x172
 [<ffffffffa0862c7a>] ieee80211_stop+0x15/0x19 [mac80211]
 [<ffffffff8151b7e6>] __dev_close_many+0x95/0xba
 [<ffffffff8151d0e2>] dev_close_many+0x6c/0xe9
 [<ffffffff8151e399>] rollback_registered_many+0x107/0x23d
 [<ffffffff8151e4e3>] unregister_netdevice_many+0x14/0x39
 [<ffffffffa0863c1b>] ieee80211_remove_interfaces+0xf7/0x13d [mac80211]
 [<ffffffffa0853164>] ieee80211_unregister_hw+0x58/0x111 [mac80211]
 [<ffffffffa09b4923>] ath10k_mac_unregister+0x15/0x5a [ath10k_core]
 [<ffffffffa09b6790>] ath10k_core_unregister+0xe/0x22 [ath10k_core]
 [<ffffffffa09d410d>] ath10k_pci_remove+0x59/0x97 [ath10k_pci]
 [<ffffffff81315243>] pci_device_remove+0x42/0x90
 [<ffffffff813d3259>] __device_release_driver+0x86/0xdc
 [<ffffffff813d3c08>] driver_detach+0x79/0xa5
 [<ffffffff813d311e>] bus_remove_driver+0x94/0xb2
 [<ffffffffa09d8500>] ? ath10k_ce_init+0x51f/0x51f [ath10k_pci]
 [<ffffffff813d41b1>] driver_unregister+0x42/0x49
 [<ffffffffa09d8500>] ? ath10k_ce_init+0x51f/0x51f [ath10k_pci]
 [<ffffffff81314d1b>] pci_unregister_driver+0x1d/0x82
 [<ffffffffa09d8500>] ? ath10k_ce_init+0x51f/0x51f [ath10k_pci]
 [<ffffffffa09d8510>] ath10k_pci_exit+0x10/0x12 [ath10k_pci]
 [<ffffffff81123b0b>] SyS_delete_module+0x15e/0x1e4
 [<ffffffff811167a0>] ? current_kernel_time+0xd/0x31
 [<ffffffff811b7332>] ? alloc_mnt_ns+0xbe/0xbe
 [<ffffffff815dc3bd>] system_call_fastpath+0x1a/0x1f
Code: 08 48 89 df e8 2e 1d 00 00 5b 41 5c 5d c3 55 48 89 e5 53 48 89 fb 50 e8 51 0a 00 00 48 89 df e8 50 1b 00
RIP  [<ffffffffa09b8d32>] skb_tailroom+0x2/0x1a [ath10k_core]
 RSP <ffff88020158fac0>
---[ end trace c8d6bd8f6836ba84 ]---


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
