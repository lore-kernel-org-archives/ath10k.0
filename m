Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byfaq-0006RQ-C1
 for ath10k@lists.infradead.org; Mon, 24 Oct 2016 13:47:14 +0000
Date: Mon, 24 Oct 2016 19:16:41 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: QCA9888 fails to work with latest linux-ath tree, crashes kernel
 on rmmod.
Message-ID: <20161024134641.GA4194@atheros-ThinkPad-T61>
References: <a0af488b-f664-1e7f-0edd-b5148e902f32@candelatech.com>
 <e6697dc1-452c-8421-817a-f032e3c5e030@candelatech.com>
 <20161020062144.GA3219@atheros-ThinkPad-T61>
 <20161024083225.GA9097@atheros-ThinkPad-T61>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20161024083225.GA9097@atheros-ThinkPad-T61>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hi Ben,

I had confirmed that the change is addressing the crash, thanks for reporting.
I will soon send the change properly for everyone to review.

regards,
shafi

On Mon, Oct 24, 2016 at 02:02:26PM +0530, Mohammed Shafi Shajakhan wrote:
> Hi Ben,
> 
> I think its best to do 'napi_disable' in 'hif_power_down' because
> 'hif_power_up does 'napi_enable'.
> 
> regards,
> shafi
> 
> On Thu, Oct 20, 2016 at 11:51:44AM +0530, Mohammed Shafi Shajakhan wrote:
> > Hi,
> > 
> > On Wed, Oct 19, 2016 at 02:42:39PM -0700, Ben Greear wrote:
> > > Code-aura's board-2.bin for 9888 seems to fix the most obvious errors,
> > > but that does not excuse crashing the kernel on rmmod....
> > 
> > i guess it could be crashing @ idx = __le32_to_cpu(*htt->rx_ring.alloc_idx.vaddr); in '__ath10k_htt_rx_ring_fill_n'
> > because 'ath10k_htt_rx_alloc' would be never called if loading board-2.bin
> > fails!!
> > 
> > should we check for 'ATH10K_FLAG_CORE_REGISTERED' in the ath10k_pci_napi_poll and just bail
> > out ? is it clean ? or should we do 'napi_disable(&ar->napi);' in the error
> > case of ath10k probe failure
> > 
> > 
> > > 
> > > Thanks,
> > > Ben
> > > 
> > > On 10/19/2016 01:18 PM, Ben Greear wrote:
> > > >Stock firmware, stock driver.  Should it be loading board-2.bin?
> > > >
> > > >
> > > >dmesg|grep ath10k
> > > >
> > > >[    5.386372] ath10k_pci 0000:05:00.0: pci probe 168c:0056 0000:0000
> > > >[    5.387695] ath10k_pci 0000:05:00.0: boot pci_mem 0xffffc90005c00000
> > > >[    5.388087] ath10k_pci 0000:05:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
> > > >[    5.388117] ath10k_pci 0000:05:00.0: boot qca99x0 chip reset
> > > >[    5.388118] ath10k_pci 0000:05:00.0: boot cold reset
> > > >[    5.431228] ath10k_pci 0000:05:00.0: boot cold reset complete
> > > >[    5.431230] ath10k_pci 0000:05:00.0: boot waiting target to initialise
> > > >[    5.431234] ath10k_pci 0000:05:00.0: boot target indicator 2
> > > >[    5.431240] ath10k_pci 0000:05:00.0: boot target initialised
> > > >[    5.431241] ath10k_pci 0000:05:00.0: boot qca99x0 chip reset complete (cold)
> > > >[    5.431251] ath10k_pci 0000:05:00.0: boot hif power up
> > > >[    5.431260] ath10k_pci 0000:05:00.0: boot qca99x0 chip reset
> > > >[    5.431262] ath10k_pci 0000:05:00.0: boot cold reset
> > > >[    5.475237] ath10k_pci 0000:05:00.0: boot cold reset complete
> > > >[    5.475239] ath10k_pci 0000:05:00.0: boot waiting target to initialise
> > > >[    5.475243] ath10k_pci 0000:05:00.0: boot target indicator 2
> > > >[    5.475249] ath10k_pci 0000:05:00.0: boot target initialised
> > > >[    5.475250] ath10k_pci 0000:05:00.0: boot qca99x0 chip reset complete (cold)
> > > >[    5.475271] ath10k_pci 0000:05:00.0: boot init ce src ring id 0 entries 16 base_addr ffff88021e427000
> > > >[    5.475289] ath10k_pci 0000:05:00.0: boot ce dest ring id 1 entries 512 base_addr ffff88021e428000
> > > >[    5.475306] ath10k_pci 0000:05:00.0: boot ce dest ring id 2 entries 128 base_addr ffff88021e42a000
> > > >[    5.475328] ath10k_pci 0000:05:00.0: boot init ce src ring id 3 entries 32 base_addr ffff88021e42b000
> > > >[    5.475352] ath10k_pci 0000:05:00.0: boot init ce src ring id 4 entries 8192 base_addr ffff88021e460000
> > > >[    5.475370] ath10k_pci 0000:05:00.0: boot ce dest ring id 5 entries 512 base_addr ffff88021e42c000
> > > >[    5.475391] ath10k_pci 0000:05:00.0: boot init ce src ring id 7 entries 2 base_addr ffff88021e42e000
> > > >[    5.475408] ath10k_pci 0000:05:00.0: boot ce dest ring id 7 entries 2 base_addr ffff88021e42f000
> > > >[    5.475425] ath10k_pci 0000:05:00.0: boot ce dest ring id 8 entries 128 base_addr ffff88021e471000
> > > >[    5.486663] ath10k_pci 0000:05:00.0: Hardware name qca9888 hw2.0 version 0x1000000
> > > >[    5.491339] ath10k_pci 0000:05:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:05:00.0.bin failed with error -2
> > > >[    5.491358] ath10k_pci 0000:05:00.0: Direct firmware load for ath10k/cal-pci-0000:05:00.0.bin failed with error -2
> > > >[    5.491361] ath10k_pci 0000:05:00.0: trying fw api 5
> > > >[    5.517095] ath10k_pci 0000:05:00.0: found fw version 10.4-3.2-00072
> > > >[    5.517098] ath10k_pci 0000:05:00.0: found fw timestamp 1464346445
> > > >[    5.517099] ath10k_pci 0000:05:00.0: found otp image ie (8975 B)
> > > >[    5.517101] ath10k_pci 0000:05:00.0: found fw image ie (351748 B)
> > > >[    5.517102] ath10k_pci 0000:05:00.0: found firmware features ie (2 B)
> > > >[    5.517103] ath10k_pci 0000:05:00.0: Enabling feature bit: 3
> > > >[    5.517105] ath10k_pci 0000:05:00.0: Enabling feature bit: 12
> > > >[    5.517106] ath10k_pci 0000:05:00.0: Enabling feature bit: 13
> > > >[    5.517107] ath10k_pci 0000:05:00.0: features
> > > >[    5.517109] ath10k_pci 0000:05:00.0: 00000000: 08 30 00 00 00 00 00 00                          .0......
> > > >[    5.517111] ath10k_pci 0000:05:00.0: found fw ie wmi op version 6
> > > >[    5.517112] ath10k_pci 0000:05:00.0: found fw ie htt op version 4
> > > >[    5.517113] ath10k_pci 0000:05:00.0: found fw code swap image ie (204335 B)
> > > >[    5.517114] ath10k_pci 0000:05:00.0: using fw api 5
> > > >[    5.517118] ath10k_pci 0000:05:00.0: qca9888 hw2.0 target 0x01000000 chip_id 0x00000000 sub 0000:0000
> > > >[    5.517119] ath10k_pci 0000:05:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 1 testmode 1
> > > >[    5.517645] ath10k_pci 0000:05:00.0: firmware ver 10.4-3.2-00072 api 5 features no-p2p,mfp,peer-flow-ctrl crc32 b1da0716
> > > >[    5.517647] ath10k_pci 0000:05:00.0: boot did not find a pre calibration file, try DT next: -2
> > > >[    5.517648] ath10k_pci 0000:05:00.0: unable to load pre cal data from DT: -2
> > > >[    5.517649] ath10k_pci 0000:05:00.0: could not load pre cal data: -2
> > > >[    5.517652] ath10k_pci 0000:05:00.0: boot upload otp to 0x1234 len 8975 for board id
> > > >[    7.503462] ath10k_pci 0000:05:00.0: boot get otp board id result 0x00004400 board_id 17 chip_id 0
> > > >[    7.503465] ath10k_pci 0000:05:00.0: boot using board name 'bus=pci,bmi-chip-id=0,bmi-board-id=17'
> > > >[    7.507346] ath10k_pci 0000:05:00.0: board name
> > > >[    7.507349] ath10k_pci 0000:05:00.0: 00000000: 62 75 73 3d 70 63 69 2c 62 6d 69 2d 63 68 69 70  bus=pci,bmi-chip
> > > >[    7.507351] ath10k_pci 0000:05:00.0: 00000010: 2d 69 64 3d 30 2c 62 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
> > > >[    7.507352] ath10k_pci 0000:05:00.0: 00000020: 69 64 3d 31 36                                   id=16
> > > >[    7.507354] ath10k_pci 0000:05:00.0: failed to fetch board data for bus=pci,bmi-chip-id=0,bmi-board-id=17 from ath10k/QCA9888/hw2.0/board-2.bin
> > > >[    7.520749] ath10k_pci 0000:05:00.0: Direct firmware load for ath10k/QCA9888/hw2.0/board.bin failed with error -2
> > > >[    7.520751] ath10k_pci 0000:05:00.0: failed to fetch board data
> > > >[    7.526290] ath10k_pci 0000:05:00.0: failed to fetch board file: -2
> > > >[    7.532174] ath10k_pci 0000:05:00.0: boot hif power down
> > > >[    7.532178] ath10k_pci 0000:05:00.0: could not probe fw (-2)
> > > >
> > > >Firmware 10.4-3.3-00092 fails similarly.
> > > >
> > > >
> > > >And, on rmmod, it crashes:
> > > >
> > > >Last login: Wed Oct 19 13:09:01 from ben-dt3.candelatech.com
> > > >[root@ben523-3749 ~]# uname -a
> > > >Linux ben523-3749 4.8.0-wt-ath+ #2 SMP PREEMPT Wed Oct 19 12:40:02 PDT 2016 x86_64 x86_64 x86_64 GNU/Linux
> > > >[root@ben523-3749 ~]# BUG: unable to handle kernel NULL pointer dereference at           (null)
> > > >IP: [<ffffffffa113ea09>] __ath10k_htt_rx_ring_fill_n+0x19/0x230 [ath10k_core]
> > > >PGD 0
> > > >Oops: 0000 [#1] PREEMPT SMP
> > > >Modules linked in: nf_conntrack_netlink nf_conntrack nfnetlink nf_defrag_ipv4 8021q garp mrp stp llc bnep bluetooth fuse macvlan pktgen rpcsec_gss_krb5 nfsv]
> > > >CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.8.0-wt-ath+ #2
> > > >Hardware name: To be filled by O.E.M. To be filled by O.E.M./ChiefRiver, BIOS 4.6.5 06/07/2013
> > > >task: ffffffff81e0d540 task.stack: ffffffff81e00000
> > > >RIP: 0010:[<ffffffffa113ea09>]  [<ffffffffa113ea09>] __ath10k_htt_rx_ring_fill_n+0x19/0x230 [ath10k_core]
> > > >RSP: 0018:ffff88021e203d08  EFLAGS: 00010246
> > > >RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff88020d212018
> > > >RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff88020d211e40
> > > >RBP: ffff88021e203d30 R08: 0000000000200000 R09: 0000000000000101
> > > >R10: 0000000000000000 R11: ffff88020e31d400 R12: ffff88020d211e40
> > > >R13: ffff88020d211e40 R14: 000000000000012c R15: ffff88020d211540
> > > >FS:  0000000000000000(0000) GS:ffff88021e200000(0000) knlGS:0000000000000000
> > > >CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > >CR2: 0000000000000000 CR3: 0000000001e06000 CR4: 00000000001406f0
> > > >Stack:
> > > > 0000000000000000 ffff88020d211e40 ffff88020d211f80 000000000000012c
> > > > ffff88020d211540 ffff88021e203d58 ffffffffa113ec62 ffff88020d217bc0
> > > > ffff88020d211540 0000000000000040 ffff88021e203e78 ffffffffa113f393
> > > >Call Trace:
> > > > <IRQ>
> > > > [<ffffffffa113ec62>] ath10k_htt_rx_msdu_buff_replenish+0x42/0x90 [ath10k_core]
> > > > [<ffffffffa113f393>] ath10k_htt_txrx_compl_task+0x433/0x17d0 [ath10k_core]
> > > > [<ffffffff8114406d>] ? __wake_up_common+0x4d/0x80
> > > > [<ffffffff811349ec>] ? cpu_load_update+0xdc/0x150
> > > > [<ffffffffa119301d>] ? ath10k_pci_read32+0xd/0x10 [ath10k_pci]
> > > > [<ffffffffa1195b17>] ath10k_pci_napi_poll+0x47/0x110 [ath10k_pci]
> > > > [<ffffffff817863af>] net_rx_action+0x20f/0x370
> > > > [<ffffffff81108b8a>] __do_softirq+0xca/0x2d0
> > > > [<ffffffff81108ede>] irq_exit+0x9e/0xa0
> > > > [<ffffffff8105099d>] smp_apic_timer_interrupt+0x3d/0x50
> > > > [<ffffffff81863e82>] apic_timer_interrupt+0x82/0x90
> > > > <EOI>
> > > > [<ffffffff816f5f66>] ? cpuidle_enter_state+0x126/0x300
> > > > [<ffffffff816f6162>] cpuidle_enter+0x12/0x20
> > > > [<ffffffff81144b95>] call_cpuidle+0x25/0x40
> > > > [<ffffffff81144f5a>] cpu_startup_entry+0x2ba/0x380
> > > > [<ffffffff8185babf>] rest_init+0x7f/0x90
> > > > [<ffffffff81f5ef77>] start_kernel+0x43c/0x449
> > > > [<ffffffff81f5e120>] ? early_idt_handler_array+0x120/0x120
> > > > [<ffffffff81f5e2d6>] x86_64_start_reservations+0x2a/0x2c
> > > > [<ffffffff81f5e413>] x86_64_start_kernel+0x13b/0x14a
> > > >Code: ff ff bf eb b7 5b 41 5c 41 5d 5d c3 66 0f 1f 44 00 00 55 85 f6 48 89 e5 41 57 41 56 41 55 41 54 49 89 fd 53 48 8b 87 f8 00 00 00 <8b> 18 0f 8e 83 01 0
> > > >RIP  [<ffffffffa113ea09>] __ath10k_htt_rx_ring_fill_n+0x19/0x230 [ath10k_core]
> > > > RSP <ffff88021e203d08>
> > > >CR2: 0000000000000000
> > > >---[ end trace 996cee9c574305c5 ]---
> > > >Kernel panic - not syncing: Fatal exception in interrupt
> > > >Kernel Offset: disabled
> > > >Rebooting in 10 seconds..
> > > > CTRL-A Z for help |115200 8N1 | NOR | Minicom 2.5    | VT102 | Online 00:02
> > > >
> > > >[root@ben523-3749 ~]# lspci
> > > >00:00.0 Host bridge: Intel Corporation 3rd Gen Core processor DRAM Controller (rev 09)
> > > >00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v2/3rd Gen Core processor PCI Express Root Port (rev 09)
> > > >00:01.2 PCI bridge: Intel Corporation Xeon E3-1200 v2/3rd Gen Core processor PCI Express Root Port (rev 09)
> > > >00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor Graphics Controller (rev 09)
> > > >00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 05)
> > > >00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller (rev 05)
> > > >00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 (rev b5)
> > > >00:1c.1 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 2 (rev b5)
> > > >00:1c.6 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 7 (rev b5)
> > > >00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 (rev 05)
> > > >00:1f.0 ISA bridge: Intel Corporation HM65 Express Chipset Family LPC Controller (rev 05)
> > > >00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6 port SATA AHCI Controller (rev 05)
> > > >00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller (rev 05)
> > > >03:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection
> > > >04:00.0 Ethernet controller: Intel Corporation 82574L Gigabit Network Connection
> > > >05:00.0 Network controller: Qualcomm Atheros Device 0056
> > > >
> > > >
> > > >Thanks,
> > > >Ben
> > > >
> > > 
> > > 
> > > -- 
> > > Ben Greear <greearb@candelatech.com>
> > > Candela Technologies Inc  http://www.candelatech.com
> > > 
> > > 
> > > _______________________________________________
> > > ath10k mailing list
> > > ath10k@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/ath10k
> > 
> > _______________________________________________
> > ath10k mailing list
> > ath10k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath10k
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
