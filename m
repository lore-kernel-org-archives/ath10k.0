Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-f173.google.com ([209.85.220.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQSwW-0000OM-Re
 for ath10k@lists.infradead.org; Thu, 20 Mar 2014 02:42:53 +0000
Received: by mail-vc0-f173.google.com with SMTP id il7so241465vcb.32
 for <ath10k@lists.infradead.org>; Wed, 19 Mar 2014 19:42:26 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 19 Mar 2014 22:42:06 -0400
Message-ID: <CAHqTa-3=VZr2-S63HXEX++Y5BvPRuUTKgB_nKhpCCUYD-nGe+A@mail.gmail.com>
Subject: Failure to allocate large memory blocks upon firmware crash
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

Hi all,

We are still getting firmware crashes occasionally, but I haven't
narrowed down the cause nor tried the very latest driver, so I won't
bother you with those just yet.

However, when the firmware crashes, I'm sometimes seeing a followup
memory allocation failure like this:

ath10k: could not suspend target (-11)
<6>[30094.735100] : ieee80211 phy1: Hardware restart was requested
<4>[30094.995413] : kworker/0:1: page allocation failure: order:4, mode:0x20
<4>[30094.995427] : Backtrace:
<4>[30094.995476] : [<84011c08>] (dump_backtrace+0x0/0x108) from
[<843f3468>] (dump_stack+0x18/0x1c)
<4>[30094.995487] : r6:8a2fc000 r5:00000004 r4:00000020 r3:845524e4
<4>[30094.995517] : [<843f3450>] (dump_stack+0x0/0x1c) from
[<840ad678>] (warn_alloc_failed+0xec/0x10c)
<4>[30094.995538] : [<840ad58c>] (warn_alloc_failed+0x0/0x10c) from
[<840b0688>] (__alloc_pages_nodemask+0x5ec/0x6b0)
<4>[30094.995549] : r3:00000000 r2:00000000
<4>[30094.995558] : r8:00000000 r7:00000004 r6:84548bf0 r5:8a2fc000 r4:00000030
<4>[30094.995798] : [<840b009c>] (__alloc_pages_nodemask+0x0/0x6b0)
from [<84017530>] (__dma_alloc+0xf4/0x340)
<4>[30094.995817] : [<8401743c>] (__dma_alloc+0x0/0x340) from
[<8401780c>] (dma_alloc_coherent+0x5c/0x68)
<4>[30094.995848] : [<840177b0>] (dma_alloc_coherent+0x0/0x68) from
[<83340cbc>] (ath10k_ce_init+0x1bc/0x5e4 [ath10k_pci])
<4>[30094.995860] : r7:bcc98400 r6:bc675500 r5:83341144 r4:bcc98400
<4>[30094.995894] : [<83340b00>] (ath10k_ce_init+0x0/0x5e4
[ath10k_pci]) from [<8333f934>] (ath10k_pci_hif_power_down+0x178/0x844
[ath10k_pci])
<4>[30094.995918] : [<8333f80c>] (ath10k_pci_hif_power_down+0x50/0x844
[ath10k_pci]) from [<83340018>] (ath10k_pci_hif_power_up+0x18/0x118
[ath10k_pci])
<4>[30094.995954] : [<83340000>] (ath10k_pci_hif_power_up+0x0/0x118
[ath10k_pci]) from [<8331b0dc>] (ath10k_start+0x4c/0x240
[ath10k_core])
<4>[30094.996072] : r5:bc675e04 r4:bc675500
<4>[30094.996181] : [<8331b090>] (ath10k_start+0x0/0x240
[ath10k_core]) from [<8329e5e4>] (ieee80211_reconfig+0x164/0x1510
[mac80211])
<4>[30094.997473] : r7:84db7300 r6:bc674ae4 r5:bc674ae0 r4:bc674ae0
<4>[30094.997597] : [<8329e480>] (ieee80211_reconfig+0x0/0x1510
[mac80211]) from [<83276148>] (ieee80211_restart_work+0x74/0x88
[mac80211])
<4>[30094.997646] : [<832760d4>] (ieee80211_restart_work+0x0/0x88
[mac80211]) from [<8404c89c>] (process_one_work+0x270/0x440)
<4>[30094.997658] : r6:00000000 r5:b870f2a0 r4:bc675484 r3:832760d4
<4>[30094.997684] : [<8404c62c>] (process_one_work+0x0/0x440) from
[<8404f31c>] (worker_thread+0x244/0x3f0)
<4>[30094.997706] : [<8404f0d8>] (worker_thread+0x0/0x3f0) from
[<84053c04>] (kthread+0x8c/0x94)
<4>[30094.997724] : [<84053b78>] (kthread+0x0/0x94) from [<840379a4>]
(do_exit+0x0/0x6dc)
<4>[30094.997733] : r7:00000013 r6:840379a4 r5:84053b78 r4:8b0b3ecc
<4>[30094.997751] : Mem-info:
<4>[30094.997759] : DMA per-cpu:
<4>[30094.997767] : CPU 0: hi: 6, btch: 1 usd: 0
<4>[30094.997776] : CPU 1: hi: 6, btch: 1 usd: 0
<4>[30094.997782] : Normal per-cpu:
<4>[30094.997790] : CPU 0: hi: 186, btch: 31 usd: 163
<4>[30094.997799] : CPU 1: hi: 186, btch: 31 usd: 144
<4>[30094.997820] : active_anon:118578 inactive_anon:272 isolated_anon:0
<4>[30094.997827] : active_file:39345 inactive_file:63055 isolated_file:30
<4>[30094.997834] : unevictable:0 dirty:7 writeback:0 unstable:0
<4>[30094.997841] : free:13977 slab_reclaimable:3999 slab_unreclaimable:4627
<4>[30094.997848] : mapped:3751 shmem:1322 pagetables:1068 bounce:0
<4>[30094.998415] : DMA free:44372kB min:176kB low:220kB high:264kB
active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB present:44704kB
mlocked:0kB dirty:0kB writeback:0kB mapped:0kB shmem:0kB
slab_reclaimable:0kB slab_unreclaimable:684kB kernel_stack:0kB
pagetables:0kB unstable:0kB bounce:0kB writeback_tmp:0kB
pages_scanned:0 all_unreclaimable? no
<4>[30094.998446] : lowmem_reserve[]: 0 952 952
<4>[30094.998474] : Normal free:11536kB min:3856kB low:4820kB
high:5784kB active_anon:474312kB inactive_anon:1088kB
active_file:157380kB inactive_file:252220kB unevictable:0kB
isolated(anon):0kB isolated(file):120kB present:975200kB mlocked:0kB
dirty:28kB writeback:0kB mapped:15004kB shmem:5288kB
slab_reclaimable:15996kB slab_unreclaimable:17824kB
kernel_stack:2592kB pagetables:4272kB unstable:0kB bounce:0kB
writeback_tmp:0kB pages_scanned:50 all_unreclaimable? no
<4>[30094.998504] : lowmem_reserve[]: 0 0 0
<4>[30094.998515] : DMA: 5*4kB 4*8kB 0*16kB 1*32kB 0*64kB 0*128kB
1*256kB 0*512kB 1*1024kB 1*2048kB 10*4096kB = 44372kB
<4>[30094.998549] : Normal: 2080*4kB 283*8kB 51*16kB 4*32kB 0*64kB
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 11528kB
<4>[30094.998584] : 103766 total pagecache pages
<4>[30095.077582] : 262144 pages of RAM
<4>[30095.077593] : 15667 free pages
<4>[30095.077599] : 10851 reserved pages
<4>[30095.077605] : 8647 slab pages
<4>[30095.077610] : 35170 pages shared
<4>[30095.077615] : 0 pages swap cached
<3>[30095.077634] : ath10k: Failed to initialize CE src ring for ID: 4 (-12)
<3>[30095.077646] : ath10k: failed to initialize CE for pipe: 4
<3>[30095.077678] : ath10k: failed to initialize CE: -1
<4>[30095.077692] : ath10k: failed to power up target using warm reset
(-1), trying cold reset
<7>[30095.165692] z: 03/19/14 09:18:24.116 cap(1):Warning-Unexpected
packet[297]-pld:{843f6a2191e10147 aa294ff5363573ea 86e610a162a190b4
13c096a8349fe599}
<1>[30095.305945] : Unable to handle kernel NULL pointer dereference
at virtual address 00000139
<1>[30095.312742] : pgd = 84004000
<1>[30095.312755] : [00000139] *pgd=00000000

Someone at work helpfully diagnosed it as follows.  Is there a plan to
update to the new DMA API, and/or use smaller block allocations,
and/or allocate the memory areas at startup time and never free them?

"""
Second: Why did the recovery procedure not work?  Eg, why the panic?
I can help here in a limited fashion since I don't think I have
the exact same kernel/driver source.

The allocation failures ("kworker/1:0: page allocation failure:
order:3, mode:0x20") are the root cause, as they then trigger
the later kernel panic.  The problem is that the ath10K driver
is trying to allocate a 32KB physically contiguous chunk of memory.
This is fairly challenging after the system has been up for a while
and memory has become fragmented.

Its worse, because the allocator is called with GFP_ATOMIC, which
means "give me whatever memory you have now, don't take any locks,
and I don't really care if you fail".   Based on code around it,
the driver is in a context where it can wait, and could make the
allocator try harder by using GFP_KERNEL.  It just using GFP Atomic
because it was never converted to use the newer DMA api (circa
2005) and the compat shims between pci_alloc* and dma_alloc*
specify the GFP_ATOMIC flag.

As a really cheap bandaid hack, you could convert the
pci_alloc_consistent() calls in ath10k_ce_init_src_ring()
to dma_alloc_coherent. Eg:

        src_ring->base_addr_owner_space_unaligned =
                pci_alloc_consistent(ar_pci->pdev,
                                     (nentries * sizeof(struct ce_desc) +
                                      CE_DESC_RING_ALIGN),
                                     &base_addr);


becomes

dma_alloc_coherent(&ar_pci->pdev->dev,
                                nentries * sizeof(struct ce_desc) +
CE_DESC_RING_ALIGN),
                                &base_addr, GFP_KERNEL)


This should cause the kernel to try harder to fufill the allocation
request.  Ideally, the driver could be converted from the pci*
to the dma* API in a systematic fashion.

The secondary issue here (and what is causing the kernel panic)
is that a tasklet is still running & referencing memory that
was torn down when the reset failed.  My sources don't match
yours, so I can't see what is exactly happening.
"""

Any thoughts would be welcomed.

Thanks!

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
