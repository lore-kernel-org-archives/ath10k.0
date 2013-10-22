Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYj4x-0005JU-7o
 for ath10k@lists.infradead.org; Tue, 22 Oct 2013 21:01:28 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id r9ML15bc016619
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Tue, 22 Oct 2013 14:01:05 -0700
Message-ID: <5266E790.5010809@candelatech.com>
Date: Tue, 22 Oct 2013 14:01:04 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Another crash related to list corruption.
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

I'm going to re-build the kernel with list debugging and other
debugging stuff, maybe catch this problem more easily.


(gdb) l *(ath10k_remove_interface+0x9f)
0x289a is in ath10k_remove_interface (/mnt/sda/home/greearb/git/ath/include/linux/list.h:88).
83	 * This is only for internal list manipulation where we know
84	 * the prev/next entries already!
85	 */
86	static inline void __list_del(struct list_head * prev, struct list_head * next)
87	{
88		next->prev = prev;
89		prev->next = next;
90	}
91	
92	/**
(gdb)


ath10k: Failed to set erp slot for VDEV: 0
ath10k: Failed to set preamble for VDEV: 0
ath10k: Peer assoc failed for 00:03:83:3d:30:aa
: -11ath10k: device is wedged, will not restart

ath10k: Failed to set beacon interval for VDEV: 0
ath10k: Failed to set CTS prot for VDEV: 0
ath10k: Failed to set erp slot for VDEV: 0
ath10k: Failed to set preamble for VDEV: 0
ath10k: tx failed (-70). dropping packet.
ath10k: tx failed (-70). dropping packet.
sta300: deauthenticating from 00:03:83:3d:30:aa by local choice (reason=3)
BUG: unable to handle kernel NULL pointer dereference at 0000000000000008
IP: [<ffffffffa053589a>] ath10k_remove_interface+0x9f/0x1e4 [ath10k_core]
PGD d52cd067 PUD d94be067 PMD 0
Oops: 0002 [#1] PREEMPT SMP
Modules linked in: nf_nat_ipv4 nf_nat veth 8021q garp stp mrp llc macvlan pktgen lockd f71882fg coretemp hw]
CPU: 3 PID: 2544 Comm: ip Tainted: G        WC   3.12.0-rc5-wl+ #1
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
task: ffff88021578dd80 ti: ffff8800d95dc000 task.ti: ffff8800d95dc000
RIP: 0010:[<ffffffffa053589a>]  [<ffffffffa053589a>] ath10k_remove_interface+0x9f/0x1e4 [ath10k_core]
RSP: 0018:ffff8800d95dd618  EFLAGS: 00010206
RAX: 0000000000000000 RBX: ffff88020dc65168 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000fffffffe0 RDI: ffffffffa05330a1
RBP: ffff8800d95dd658 R08: 0000000000000020 R09: dead000000100100
R10: dead000000100100 R11: dead000000100100 R12: ffff8800d8151720
R13: ffff8800d8152348 R14: ffff8800d8152320 R15: dead000000200200
FS:  00007f35e80a0740(0000) GS:ffff88021fb80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000008 CR3: 00000000cfe85000 CR4: 00000000000407e0
Stack:
 ffff8800d95dd628 ffffffff8156cc88 ffff8800d95dd658 ffff88020dc647c0
 ffff8800d81505c0 0000000000000000 0000000000001001 ffff8800d81506e0
 ffff8800d95dd678 ffffffffa03d7bf3 ffff8800d81505c0 ffff88020dc647c0
Call Trace:
 [<ffffffff8156cc88>] ? _raw_spin_unlock_irqrestore+0x27/0x32
 [<ffffffffa03d7bf3>] drv_remove_interface+0x2a/0x36 [mac80211]
 [<ffffffffa03d9371>] ieee80211_do_stop+0x5a9/0x61d [mac80211]
 [<ffffffff810a1670>] ? _local_bh_enable_ip.isra.15+0x1e/0x9b
 [<ffffffff810a16f6>] ? local_bh_enable_ip+0x9/0xb
 [<ffffffff8156cc30>] ? _raw_spin_unlock_bh+0x1f/0x21
 [<ffffffff814d78a2>] ? dev_deactivate_many+0x105/0x148
 [<ffffffffa03d93fa>] ieee80211_stop+0x15/0x19 [mac80211]
 [<ffffffff814bb4c0>] __dev_close_many+0x7c/0xa0
 [<ffffffff814bb523>] __dev_close+0x3f/0x5e
 [<ffffffff8156cc30>] ? _raw_spin_unlock_bh+0x1f/0x21
 [<ffffffff814c110a>] __dev_change_flags+0xa6/0x129
 [<ffffffff814c120d>] dev_change_flags+0x1a/0x4f
 [<ffffffff814ca18f>] do_setlink+0x2d0/0x78c
 [<ffffffff814ccb68>] rtnl_newlink+0x248/0x465
 [<ffffffff814cc9e4>] ? rtnl_newlink+0xc4/0x465
 [<ffffffff8114370d>] ? anon_vma_alloc+0x15/0x26
 [<ffffffff814cc90d>] rtnetlink_rcv_msg+0x186/0x199
 [<ffffffff8115ca80>] ? __kmalloc_node_track_caller+0xb0/0x11a
 [<ffffffff811314b2>] ? zone_page_state_add+0x2a/0x2f
 [<ffffffff814b38da>] ? __alloc_skb+0x7f/0x1a6
 [<ffffffff811324bb>] ? __inc_zone_state+0x45/0x4f
 [<ffffffff814cc787>] ? __rtnl_unlock+0x12/0x12
 [<ffffffff814e15e3>] netlink_rcv_skb+0x3e/0x8c
 [<ffffffff814c9ae8>] rtnetlink_rcv+0x21/0x28
 [<ffffffff814e0dc3>] netlink_unicast+0xb0/0x131
 [<ffffffff814e13e2>] netlink_sendmsg+0x59e/0x5e4
 [<ffffffff814a9dd0>] __sock_sendmsg_nosec+0x25/0x27
 [<ffffffff814ac523>] sock_sendmsg+0x5a/0x7b
 [<ffffffff8111e022>] ? unlock_page+0x1f/0x23
 [<ffffffff814acc1d>] ? move_addr_to_kernel+0x35/0x62
 [<ffffffff814b6439>] ? verify_iovec+0x4b/0x9e
 [<ffffffff814acb5b>] ___sys_sendmsg+0x200/0x28d
 [<ffffffff814a9f0e>] ? sock_destroy_inode+0x2b/0x2f
 [<ffffffff8115b071>] ? kmem_cache_free+0x77/0xd5
 [<ffffffff81177325>] ? __d_free+0x4b/0x50
 [<ffffffff8156fad4>] ? __do_page_fault+0x338/0x3cf
 [<ffffffff8117ea1a>] ? mntput+0x28/0x2a
 [<ffffffff81167fe1>] ? __fput+0x19a/0x1ba
 [<ffffffff8117cb0b>] ? fget_light+0x39/0x99
 [<ffffffff814ad3fc>] __sys_sendmsg+0x3d/0x5b
 [<ffffffff814ad427>] SyS_sendmsg+0xd/0x19
 [<ffffffff815716bd>] system_call_fastpath+0x1a/0x1f
Code: 28 01 00 00 b8 01 00 00 00 49 bb 00 01 10 00 00 00 ad de d3 e0 41 09 84 24 48 0b 00 00 48 8b 93 18 01
RIP  [<ffffffffa053589a>] ath10k_remove_interface+0x9f/0x1e4 [ath10k_core]
 RSP <ffff8800d95dd618>
CR2: 0000000000000008
---[ end trace 402f96cbcf4a3d3f ]---

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
