Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZmdI-0003P7-27
 for ath10k@lists.infradead.org; Fri, 25 Oct 2013 19:01:16 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (authenticated bits=0)
 by ns3.lanforge.com (8.14.2/8.14.2) with ESMTP id r9PJ0rMU021817
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Fri, 25 Oct 2013 12:00:54 -0700
Message-ID: <526ABFE5.5040208@candelatech.com>
Date: Fri, 25 Oct 2013 12:00:53 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Bug related to ath10k_pci_ce_tasklet and null src_ring.
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

I see this crash occasionally (I made it a BUG_ON, but it will crash
in upstream code while de-referencing the NULL)

Here is console log with some extra debugging in it.  Maybe the only
problem is that we just need to fix the ath10k_ce_completed_send_next_nolock
to check for null src_ring before deferencing it?  I see other code
doing something similar and returning -EIO in the ath10k_ce_cancel_send_next
method.

Or, perhaps we need to stop/cancel the tasklet that calls the
ath10k_ce_completed_send_next_nolock before it can access the stale src_ring?



ath10k: ce_deinit, ce_state: ffff8800d92c9888  src_ring: ffff88020d708b68
ath10k: ce_deinit, ce_state: ffff8800d92c98c8  src_ring:           (null)
ath10k: ce_deinit, ce_state: ffff8800d92c9908  src_ring:           (null)
ath10k: ce_deinit, ce_state: ffff8800d92c9948  src_ring: ffff88020ac9b138
ath10k: ce_deinit, ce_state: ffff8800d92c9988  src_ring: ffff88020fad8000
ath10k: ce_deinit, ce_state: ffff8800d92c99c8  src_ring:           (null)
ath10k: ce_deinit, ce_state: ffff8800d92c9a08  src_ring:           (null)
ath10k: ce_deinit, ce_state: ffff8800d92c9a48  src_ring: ffff8800cf1f3a80
cfg80211: Regulatory domain changed to country: US
cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2700 mBm)
cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 1700 mBm)
cfg80211:   (5250000 KHz - 5330000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5490000 KHz - 5600000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5650000 KHz - 5710000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 3000 mBm)
cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 4000 mBm)
ath10k: MSI-X interrupt handling (8 intrs)
ath10k: Target stalled
ath10k: send_next_nolock:  src_ring:           (null)  ce_state: ffff8800d92c9888
------------[ cut here ]------------
kernel BUG at /mnt/sda/home/greearb/git/linux.ath/drivers/net/wireless/ath/ath10k/ce.c:561!
invalid opcode: 0000 [#1] PREEMPT SMP
Modules linked in: ath10k_pci ath10k_core ath5k ath9k ath9k_common ath9k_hw nfsv3 nfs_acl nfs fscache nf_na]
CPU: 2 PID: 23 Comm: ksoftirqd/2 Tainted: G        WC   3.12.0-rc5-wl+ #2
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
task: ffff880215d4c280 ti: ffff880215d52000 task.ti: ffff880215d52000
RIP: 0010:[<ffffffffa09fe57f>]  [<ffffffffa09fe57f>] ath10k_ce_completed_send_next+0x87/0x158 [ath10k_pci]
RSP: 0018:ffff880215d53c28  EFLAGS: 00010292
RAX: 0000000000000051 RBX: ffff8800d92c9888 RCX: 0000000000000002
RDX: 0000000000000002 RSI: ffff880215d4c998 RDI: 0000000000000246
RBP: ffff880215d53c88 R08: 0000000000000002 R09: 0000000000000000
R10: 0000000000000000 R11: ffffffffa09ea944 R12: ffff880215d53cc0
R13: 0000000000000000 R14: ffff880215d53cb8 R15: ffff880215d53cb4
FS:  0000000000000000(0000) GS:ffff88021fb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000005a3150 CR3: 000000020b3d5000 CR4: 00000000000407e0
Stack:
 0000000000000246 ffff8800d92c9850 ffff880215d53cbc ffff880215d4c280
 ffff8800d92c9850 ffff8800d92c9850 0000000000057430 ffff880211d92280
 ffff8800d92c9290 ffff8800d92c9888 ffff880211d92280 ffff8800d92c9370
Call Trace:
 [<ffffffffa09fc296>] ath10k_pci_ce_send_done+0xd6/0xf2 [ath10k_pci]
 [<ffffffff810a2d0d>] ? _local_bh_enable_ip+0xc0/0xe9
 [<ffffffff810a2d3f>] ? local_bh_enable_ip+0x9/0xb
 [<ffffffffa09fe6ca>] ath10k_ce_per_engine_service+0x7a/0xab [ath10k_pci]
 [<ffffffffa09fb249>] ath10k_pci_ce_tasklet+0x15/0x17 [ath10k_pci]
 [<ffffffff810a2bed>] tasklet_action+0x88/0xe8
 [<ffffffff810c1b4b>] ? finish_task_switch+0x3a/0xdd
 [<ffffffff810a2eb8>] __do_softirq+0xc9/0x18e
 [<ffffffff810a2fa0>] run_ksoftirqd+0x23/0x5c
 [<ffffffff810c0a5b>] smpboot_thread_fn+0x1f9/0x217
 [<ffffffff810c0862>] ? test_ti_thread_flag.constprop.3+0x11/0x11
 [<ffffffff810c0862>] ? test_ti_thread_flag.constprop.3+0x11/0x11
 [<ffffffff810b9d61>] kthread+0x9d/0xa5
 [<ffffffff815916e3>] ? _raw_spin_unlock_irq+0x29/0x54
 [<ffffffff810b9cc4>] ? __kthread_parkme+0x60/0x60
 [<ffffffff8159674c>] ret_from_fork+0x7c/0xb0
 [<ffffffff810b9cc4>] ? __kthread_parkme+0x60/0x60
Code: a0 31 c0 e8 1e 7a b8 e0 0f 0b 4c 8b 6b 30 49 81 fd 9f 0f 00 00 77 16 48 89 da 4c 89 ee 48 c7 c7 b6 ff
RIP  [<ffffffffa09fe57f>] ath10k_ce_completed_send_next+0x87/0x158 [ath10k_pci]
 RSP <ffff880215d53c28>
---[ end trace 390a55020fb495f1 ]---

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
