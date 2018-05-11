Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHDHc-0001Do-7O
 for ath10k@lists.infradead.org; Fri, 11 May 2018 19:00:50 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id F01A840A5ED
 for <ath10k@lists.infradead.org>; Fri, 11 May 2018 12:00:32 -0700 (PDT)
From: Ben Greear <greearb@candelatech.com>
Subject: rmmod ath10k_pci hangs on stock wireless-testing kernel
Message-ID: <64658aac-1c71-d4cd-29ec-521ce269224b@candelatech.com>
Date: Fri, 11 May 2018 12:00:32 -0700
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

I'm doing a bit of testing on stock kernels for once.  I was using a
10.1 firmware that was constantly crashing, and then I tried to rmmod ath10k_pci.

rmmod hangs.  Here is the stack trace from /proc/[foo]/stack
for rmmod.

Regardless of how the FW crashes, rmmod should not hang.

[root@lf0313-6477 ~]# cat rmmod_hang.txt
[<0>] msleep+0x30/0x40
[<0>] ath10k_pci_hif_stop+0x6a/0xc0 [ath10k_pci]
[<0>] ath10k_core_stop+0x48/0x80 [ath10k_core]
[<0>] ath10k_halt+0x117/0x1b0 [ath10k_core]
[<0>] ath10k_stop+0x31/0x70 [ath10k_core]
[<0>] drv_stop+0x53/0x2c0 [mac80211]
[<0>] ieee80211_do_stop+0x4ce/0x850 [mac80211]
[<0>] ieee80211_stop+0x11/0x20 [mac80211]
[<0>] __dev_close_many+0x97/0xf0
[<0>] dev_close_many+0x78/0x120
[<0>] dev_close.part.91+0x2f/0x50
[<0>] cfg80211_shutdown_all_interfaces+0x3e/0xc0 [cfg80211]
[<0>] ieee80211_remove_interfaces+0x3d/0x1c0 [mac80211]
[<0>] ieee80211_unregister_hw+0x41/0x130 [mac80211]
[<0>] ath10k_mac_unregister+0x10/0x60 [ath10k_core]
[<0>] ath10k_core_unregister+0x35/0x90 [ath10k_core]
[<0>] ath10k_pci_remove+0x29/0x70 [ath10k_pci]
[<0>] pci_device_remove+0x31/0xb0
[<0>] device_release_driver_internal+0x15b/0x230
[<0>] driver_detach+0x35/0x70
[<0>] bus_remove_driver+0x53/0xd0
[<0>] pci_unregister_driver+0x1e/0x80
[<0>] ath10k_pci_exit+0xc/0x214 [ath10k_pci]
[<0>] __x64_sys_delete_module+0x14d/0x250
[<0>] do_syscall_64+0x55/0x1a0
[<0>] entry_SYSCALL_64_after_hwframe+0x49/0xbe
[<0>] 0xffffffffffffffff


(gdb) l *(ath10k_pci_hif_stop+0x6a)
0x332a is in ath10k_pci_hif_stop (/home/greearb/git/linux.wireless-testing/arch/x86/include/asm/bitops.h:328).
323	}
324	
325	static __always_inline bool constant_test_bit(long nr, const volatile unsigned long *addr)
326	{
327		return ((1UL << (nr & (BITS_PER_LONG-1))) &
328			(addr[nr >> _BITOPS_LONG_SHIFT])) != 0;
329	}
330	
331	static __always_inline bool variable_test_bit(long nr, volatile const unsigned long *addr)
332	{
(gdb)


I wouldn't be surprised if this was NAPI related hang similar to what has been reported
before, probably exacerbated by the firmware crashing.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
