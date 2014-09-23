Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWUTb-0001o7-9b
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 18:06:12 +0000
Received: from [192.168.100.236] (firewall.candelatech.com [70.89.124.249])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id C635C40A539
 for <ath10k@lists.infradead.org>; Tue, 23 Sep 2014 11:05:49 -0700 (PDT)
Message-ID: <5421B67D.8060508@candelatech.com>
Date: Tue, 23 Sep 2014 11:05:49 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Possible issue with firmware crash reporting.
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

This kernel is basically linux-ath from a few days ago
plus a bunch of my patches, including my versions of the firmware
BSS and stack dump patches.
Problem could be mine alone, but likely the patches Kalle
is working on would be susceptible to the same sort of problem.

I produced this by purposefully crashing the firmware during
station registration while debugging some firmware issues.

This is just FYI, but if someone cares to do similar
testing, I can build a special firmware that crashes
in the same way and make it available.


=================================
[ INFO: inconsistent lock state ]
3.17.0-rc6+ #3 Not tainted
---------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
swapper/2/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
 (uevent_sock_mutex){+.?.+.}, at: [<ffffffff8133d402>] kobject_uevent_env+0x2b8/0x5d7
{SOFTIRQ-ON-W} state was registered at:
  [<ffffffff81111f34>] __lock_acquire+0x352/0xe48
  [<ffffffff81112ef6>] lock_acquire+0xd2/0x120
  [<ffffffff8165c77c>] mutex_lock_nested+0x4f/0x3c7
  [<ffffffff8133d402>] kobject_uevent_env+0x2b8/0x5d7
  [<ffffffff8133d72c>] kobject_uevent+0xb/0xd
  [<ffffffff8133c970>] kset_register+0x30/0x3e
  [<ffffffff81431a7a>] bus_register+0xae/0x292
  [<ffffffff81d69174>] platform_bus_init+0x29/0x41
  [<ffffffff81d69202>] driver_init+0x27/0x33
  [<ffffffff81d1e0d9>] kernel_init_freeable+0x155/0x263
  [<ffffffff8164e95a>] kernel_init+0x9/0xda
  [<ffffffff8165f0bc>] ret_from_fork+0x7c/0xb0
irq event stamp: 3059841372
hardirqs last  enabled at (3059841372): [<ffffffff810dca25>] __local_bh_enable_ip+0xaa/0xd9
hardirqs last disabled at (3059841371): [<ffffffff810dc9cd>] __local_bh_enable_ip+0x52/0xd9
softirqs last  enabled at (3059840756): [<ffffffff810dc3e6>] _local_bh_enable+0x3e/0x40
softirqs last disabled at (3059840757): [<ffffffff810dcaf9>] irq_exit+0x43/0x99

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(uevent_sock_mutex);
  <Interrupt>
    lock(uevent_sock_mutex);

 *** DEADLOCK ***

no locks held by swapper/2/0.

stack backtrace:
CPU: 2 PID: 0 Comm: swapper/2 Not tainted 3.17.0-rc6+ #3
Hardware name: To be filled by O.E.M. To be filled by O.E.M./HURONRIVER, BIOS 4.6.5 05/02/2012
 ffffffff82351ba0 ffff88021eb03ab8 ffffffff81657366 0000000000000000
 ffff880215574360 ffff88021eb03b18 ffffffff81653c50 0000000000000001
 0000000000000001 ffff880200000000 ffffffff8101bcae ffff880215574b80
Call Trace:
 <IRQ>  [<ffffffff81657366>] dump_stack+0x4e/0x71
 [<ffffffff81653c50>] print_usage_bug+0x1ec/0x1fd
 [<ffffffff8101bcae>] ? save_stack_trace+0x27/0x44
 [<ffffffff81111457>] ? check_usage_backwards+0xa0/0xa0
 [<ffffffff81111aeb>] mark_lock+0x11b/0x212
 [<ffffffff81111ebe>] __lock_acquire+0x2dc/0xe48
 [<ffffffff81113215>] ? mark_held_locks+0x54/0x76
 [<ffffffff811904f3>] ? __free_pages_ok+0xb3/0xca
 [<ffffffff811133c9>] ? trace_hardirqs_on_caller+0x192/0x1a1
 [<ffffffff81112ef6>] lock_acquire+0xd2/0x120
 [<ffffffff8133d402>] ? kobject_uevent_env+0x2b8/0x5d7
 [<ffffffff8165c77c>] mutex_lock_nested+0x4f/0x3c7
 [<ffffffff8133d402>] ? kobject_uevent_env+0x2b8/0x5d7
 [<ffffffff8133d402>] ? kobject_uevent_env+0x2b8/0x5d7
 [<ffffffff81430f16>] ? dev_uevent+0x1d4/0x274
 [<ffffffff8133c147>] ? kobject_get_path+0x8c/0xdb
 [<ffffffff8133d402>] kobject_uevent_env+0x2b8/0x5d7
 [<ffffffff811133c9>] ? trace_hardirqs_on_caller+0x192/0x1a1
 [<ffffffffa069c70f>] ath10k_pci_fw_crashed_dump+0x456/0x535 [ath10k_pci]
 [<ffffffff81006432>] ? xen_set_domain_pte+0x37/0xe1
 [<ffffffffa069c854>] ath10k_pci_tasklet+0x27/0x5a [ath10k_pci]
 [<ffffffff810dcd4d>] tasklet_action+0xcb/0xdd
 [<ffffffff810dc745>] __do_softirq+0x111/0x2a1
 [<ffffffff810dcaf9>] irq_exit+0x43/0x99
 [<ffffffff81010357>] do_IRQ+0xa7/0xc2
 [<ffffffff8165fe72>] common_interrupt+0x72/0x72
 <EOI>  [<ffffffff8110fc0f>] ? trace_hardirqs_off_caller+0x37/0xa6
 [<ffffffff81546d7d>] ? cpuidle_enter_state+0x62/0xba
 [<ffffffff81546d79>] ? cpuidle_enter_state+0x5e/0xba
 [<ffffffff81546e76>] cpuidle_enter+0x12/0x14
 [<ffffffff8110ab6c>] cpu_startup_entry+0x1b6/0x27a
 [<ffffffff81035b74>] start_secondary+0x238/0x23a
ath10k_pci 0000:04:00.0: boot hif stop
ath10k_pci 0000:04:00.0: boot warm reset
ath10k_pci 0000:04:00.0: boot host cpu intr cause: 0x00047800
ath10k_pci 0000:04:00.0: boot target cpu intr cause: 0x00005008
ath10k_pci 0000:04:00.0: boot host cpu intr cause: 0x00000000
ath10k_pci 0000:04:00.0: boot target cpu intr cause: 0x00000008
ath10k_pci 0000:04:00.0: boot target reset state: 0x00000800
ath10k_pci 0000:04:00.0: boot warm reset complete
ieee80211 wiphy1: Hardware restart was requested
ath10k_pci 0000:04:00.0: failed to start hw scan: -11

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
