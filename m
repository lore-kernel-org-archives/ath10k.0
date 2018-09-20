Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-auth.no-ip.com ([8.23.224.61] helo=out.smtp-auth.no-ip.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2uIX-0007S5-3q
 for ath10k@lists.infradead.org; Thu, 20 Sep 2018 08:27:01 +0000
Received: from anon.gotu.dk (unknown [128.76.197.190])
 (Authenticated sender: gotu.dk@noip-smtp)
 by smtp-auth.no-ip.com (Postfix) with ESMTPA id 48B69338
 for <ath10k@lists.infradead.org>; Thu, 20 Sep 2018 01:26:37 -0700 (PDT)
Received: from mkjlap (50-232-78-135-static.hfc.comcastbusiness.net
 [50.232.78.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by anon.gotu.dk (Postfix) with ESMTPSA id 580FE60066
 for <ath10k@lists.infradead.org>; Thu, 20 Sep 2018 10:26:34 +0200 (CEST)
From: mkj@gotu.dk (Martin =?utf-8?Q?Kj=C3=A6r_J=C3=B8rgensen?=)
Subject: Re: PROBLEM: firmware crash on QCA6174
References: <875zz1mlip.fsf@mkjlap.gotu.lan>
Date: Thu, 20 Sep 2018 04:26:31 -0400
In-Reply-To: <875zz1mlip.fsf@mkjlap.gotu.lan> ("Martin
 \=\?utf-8\?Q\?Kj\=C3\=A6r\?\=
 \=\?utf-8\?Q\?_J\=C3\=B8rgensen\=22's\?\=
 message of "Wed, 19 Sep 2018 13:42:38 -0400")
Message-ID: <8736u4fubs.fsf@mkjlap.gotu.lan>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

--=-=-=
Content-Type: text/plain


Just encountered kinda the same problem again, but this time the firmware
didn't seem to crash. Just alot of errors and had to reboot again for
interface to work.

I'm attaching the dmesg.


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=dmesg.ath10k.more-errors
Content-Description: dmesg ath10k errors

[    0.000000]   node   0: [mem 0x0000000000059000-0x000000000009dfff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x000000002d6d8fff]
[    0.000000]   node   0: [mem 0x000000002d6db000-0x000000003ecdcfff]
[    0.000000]   node   0: [mem 0x000000003ffff000-0x000000003fffffff]
[    0.000000]   node   0: [mem 0x0000000048000000-0x0000000048dfffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x00000004ae7fffff]
[    0.000000] Reserved but unavailable: 34184 pages
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x00000004ae7fffff]
[    0.000000] On node 0 totalpages: 4121208
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 22 pages reserved
[    0.000000]   DMA zone: 3996 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 4012 pages used for memmap
[    0.000000]   DMA32 zone: 256732 pages, LIFO batch:31
[    0.000000]   Normal zone: 60320 pages used for memmap
[    0.000000]   Normal zone: 3860480 pages, LIFO batch:31
[    0.000000] Reserving Intel graphics memory at [mem 0x4b800000-0x4f7fffff]
[    0.000000] ACPI: PM-Timer IO Port: 0x1808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x00058000-0x00058fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x2d6d9000-0x2d6d9fff]
[    0.000000] PM: Registered nosave memory: [mem 0x2d6da000-0x2d6dafff]
[    0.000000] PM: Registered nosave memory: [mem 0x3ecdd000-0x3f09afff]
[    0.000000] PM: Registered nosave memory: [mem 0x3f09b000-0x3f0e7fff]
[    0.000000] PM: Registered nosave memory: [mem 0x3f0e8000-0x3f79ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x3f7a0000-0x3ff26fff]
[    0.000000] PM: Registered nosave memory: [mem 0x3ff27000-0x3fffefff]
[    0.000000] PM: Registered nosave memory: [mem 0x40000000-0x47ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0x48e00000-0x4f7fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x4f800000-0xdfffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf0000000-0xfdffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe011000-0xfebfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec01000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee01000-0xfeffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.000000] [mem 0x4f800000-0xdfffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.000000] random: get_random_bytes called from start_kernel+0x94/0x52e with crng_init=0
[    0.000000] setup_percpu: NR_CPUS:512 nr_cpumask_bits:512 nr_cpu_ids:8 nr_node_ids:1
[    0.000000] percpu: Embedded 44 pages/cpu @(____ptrval____) s142744 r8192 d29288 u262144
[    0.000000] pcpu-alloc: s142744 r8192 d29288 u262144 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 4056790
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.18.0-1-amd64 root=UUID=be125904-a62a-4aba-8227-399b7306ebb9 ro loglevel=0
[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.000000] Memory: 16051868K/16484832K available (10252K kernel code, 1222K rwdata, 3252K rodata, 1552K init, 656K bss, 432964K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] Kernel/User page tables isolation: enabled
[    0.000000] ftrace: allocating 31237 entries in 123 pages
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=8.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] NR_IRQS: 33024, nr_irqs: 2048, preallocated irqs: 16
[    0.000000] spurious 8259A interrupt: IRQ7.
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.000000] ACPI: Core revision 20180531
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635855245 ns
[    0.000000] hpet clockevent registered
[    0.004000] APIC: Switch to symmetric I/O mode setup
[    0.004000] DMAR: Host address width 39
[    0.004000] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.004000] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c40660462 ecap 19e2ff0505e
[    0.004000] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.004000] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c40660462 ecap f050da
[    0.004000] DMAR: RMRR base: 0x0000003edb6000 end: 0x0000003edd5fff
[    0.004000] DMAR: RMRR base: 0x0000004b000000 end: 0x0000004f7fffff
[    0.004000] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
[    0.004000] DMAR: ANDD device: 2 name: \_SB.PCI0.I2C1
[    0.004000] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.004000] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.004000] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.004000] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.004000] x2apic enabled
[    0.004000] Switched APIC routing to cluster x2apic.
[    0.008000] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.028000] tsc: Detected 2000.000 MHz processor
[    0.028000] tsc: Detected 1992.000 MHz TSC
[    0.028000] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x396d519840e, max_idle_ns: 881590569543 ns
[    0.028000] Calibrating delay loop (skipped), value calculated using timer frequency.. 3984.00 BogoMIPS (lpj=7968000)
[    0.028000] pid_max: default: 32768 minimum: 301
[    0.028000] Security Framework initialized
[    0.028000] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.028000] AppArmor: AppArmor initialized
[    0.028000] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
[    0.028000] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.028000] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.028000] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.028000] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.028000] ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.028000] mce: CPU supports 10 MCE banks
[    0.028000] CPU0: Thermal monitoring enabled (TM1)
[    0.028000] process: using mwait in idle threads
[    0.028000] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.028000] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.028000] Spectre V2 : Mitigation: Full generic retpoline
[    0.028000] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.028000] Spectre V2 : Spectre v2 mitigation: Enabling Indirect Branch Prediction Barrier
[    0.028000] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.028000] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.034731] Freeing SMP alternatives memory: 24K
[    0.036700] TSC deadline timer enabled
[    0.036705] smpboot: CPU0: Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz (family: 0x6, model: 0x8e, stepping: 0xa)
[    0.036758] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
[    0.036779] ... version:                4
[    0.036780] ... bit width:              48
[    0.036780] ... generic registers:      4
[    0.036781] ... value mask:             0000ffffffffffff
[    0.036781] ... max period:             00007fffffffffff
[    0.036781] ... fixed-purpose events:   3
[    0.036782] ... event mask:             000000070000000f
[    0.036808] Hierarchical SRCU implementation.
[    0.037476] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.037485] smp: Bringing up secondary CPUs ...
[    0.037533] x86: Booting SMP configuration:
[    0.037534] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.037912] smp: Brought up 1 node, 8 CPUs
[    0.037912] smpboot: Max logical packages: 1
[    0.037912] smpboot: Total of 8 processors activated (31872.00 BogoMIPS)
[    0.040347] devtmpfs: initialized
[    0.040347] x86/mm: Memory block size: 128MB
[    0.040751] PM: Registering ACPI NVS region [mem 0x2d6d9000-0x2d6d9fff] (4096 bytes)
[    0.040751] PM: Registering ACPI NVS region [mem 0x3f0e8000-0x3f79ffff] (7045120 bytes)
[    0.040751] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.040751] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.040751] pinctrl core: initialized pinctrl subsystem
[    0.040751] NET: Registered protocol family 16
[    0.040751] audit: initializing netlink subsys (disabled)
[    0.040751] audit: type=2000 audit(1537344881.040:1): state=initialized audit_enabled=0 res=1
[    0.040751] cpuidle: using governor ladder
[    0.040751] cpuidle: using governor menu
[    0.040751] Simple Boot Flag at 0x47 set to 0x80
[    0.040751] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.040751] ACPI: bus type PCI registered
[    0.040751] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.040751] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.040751] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.040751] PCI: Using configuration type 1 for base access
[    0.040751] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.040751] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.040751] ACPI: Added _OSI(Module Device)
[    0.040751] ACPI: Added _OSI(Processor Device)
[    0.040751] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.040751] ACPI: Added _OSI(Processor Aggregator Device)
[    0.040751] ACPI: Added _OSI(Linux-Dell-Video)
[    0.065466] ACPI: 11 ACPI AML tables successfully acquired and loaded
[    0.136802] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.147451] ACPI: Dynamic OEM Table Load:
[    0.147451] ACPI: SSDT 0xFFFF9AC5DBFA3000 0005CD (v02 PmRef  Cpu0Ist  00003000 INTL 20160422)
[    0.148014] ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[    0.149311] ACPI: Dynamic OEM Table Load:
[    0.149318] ACPI: SSDT 0xFFFF9AC5DBBE0000 0003FF (v02 PmRef  Cpu0Cst  00003001 INTL 20160422)
[    0.149916] ACPI: Dynamic OEM Table Load:
[    0.149922] ACPI: SSDT 0xFFFF9AC5DB813780 0000BA (v02 PmRef  Cpu0Hwp  00003000 INTL 20160422)
[    0.150393] ACPI: Dynamic OEM Table Load:
[    0.150399] ACPI: SSDT 0xFFFF9AC5DB81E000 000628 (v02 PmRef  HwpLvt   00003000 INTL 20160422)
[    0.150772] ACPI: Dynamic OEM Table Load:
[    0.150772] ACPI: SSDT 0xFFFF9AC5DB475000 000D14 (v02 PmRef  ApIst    00003000 INTL 20160422)
[    0.152225] ACPI: Dynamic OEM Table Load:
[    0.152232] ACPI: SSDT 0xFFFF9AC5DBB5B400 000317 (v02 PmRef  ApHwp    00003000 INTL 20160422)
[    0.152623] ACPI: Dynamic OEM Table Load:
[    0.152623] ACPI: SSDT 0xFFFF9AC5DBBE1800 00030A (v02 PmRef  ApCst    00003000 INTL 20160422)
[    0.153538] ACPI: EC: EC started
[    0.153539] ACPI: EC: interrupt blocked
[    0.165033] ACPI: \_SB_.PCI0.LPCB.ECDV: Used as first EC
[    0.165033] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=0x6e, EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.165033] ACPI: \_SB_.PCI0.LPCB.ECDV: Used as boot DSDT EC to handle transactions
[    0.165033] ACPI: Interpreter enabled
[    0.165033] ACPI: (supports S0 S3 S4 S5)
[    0.165033] ACPI: Using IOAPIC for interrupt routing
[    0.165033] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.165041] ACPI: Enabled 8 GPEs in block 00 to 7F
[    0.180677] ACPI: Power Resource [WRST] (on)
[    0.194915] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.194919] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.196006] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME AER]
[    0.196107] acpi PNP0A08:00: _OSC: OS now controls [PCIeCapability LTR]
[    0.196107] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.196447] PCI host bridge to bus 0000:00
[    0.196449] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.196450] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.196451] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.196451] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000c3fff window]
[    0.196452] pci_bus 0000:00: root bus resource [mem 0x000c4000-0x000c7fff window]
[    0.196453] pci_bus 0000:00: root bus resource [mem 0x000c8000-0x000cbfff window]
[    0.196454] pci_bus 0000:00: root bus resource [mem 0x000cc000-0x000cffff window]
[    0.196455] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff window]
[    0.196455] pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff window]
[    0.196457] pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff window]
[    0.196458] pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff window]
[    0.196459] pci_bus 0000:00: root bus resource [mem 0x4f800000-0xdfffffff window]
[    0.196459] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7fffff window]
[    0.196461] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.196466] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000
[    0.196548] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000
[    0.196556] pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64bit]
[    0.196560] pci 0000:00:02.0: reg 0x18: [mem 0x50000000-0x5fffffff 64bit pref]
[    0.196563] pci 0000:00:02.0: reg 0x20: [io  0xf000-0xf03f]
[    0.196572] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.196652] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.196661] pci 0000:00:04.0: reg 0x10: [mem 0xdc420000-0xdc427fff 64bit]
[    0.196812] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.196831] pci 0000:00:14.0: reg 0x10: [mem 0xdc410000-0xdc41ffff 64bit]
[    0.196890] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.197020] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.197039] pci 0000:00:14.2: reg 0x10: [mem 0xdc434000-0xdc434fff 64bit]
[    0.197228] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
[    0.197318] pci 0000:00:15.0: reg 0x10: [mem 0xdc433000-0xdc433fff 64bit]
[    0.197626] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
[    0.197672] pci 0000:00:15.1: reg 0x10: [mem 0xdc432000-0xdc432fff 64bit]
[    0.197869] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.197884] pci 0000:00:16.0: reg 0x10: [mem 0xdc431000-0xdc431fff 64bit]
[    0.197926] pci 0000:00:16.0: PME# supported from D3hot
[    0.198048] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x060400
[    0.198103] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.198210] pci 0000:00:1c.2: [8086:9d12] type 01 class 0x060400
[    0.198263] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.198369] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
[    0.198419] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.198529] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
[    0.198582] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.198711] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100
[    0.198856] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.198868] pci 0000:00:1f.2: reg 0x10: [mem 0xdc42c000-0xdc42ffff]
[    0.198981] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380
[    0.199002] pci 0000:00:1f.3: reg 0x10: [mem 0xdc428000-0xdc42bfff 64bit]
[    0.199025] pci 0000:00:1f.3: reg 0x20: [mem 0xdc400000-0xdc40ffff 64bit]
[    0.199065] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.199214] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[    0.199275] pci 0000:00:1f.4: reg 0x10: [mem 0xdc430000-0xdc4300ff 64bit]
[    0.199346] pci 0000:00:1f.4: reg 0x20: [io  0xf040-0xf05f]
[    0.199564] pci 0000:01:00.0: [10ec:525a] type 00 class 0xff0000
[    0.199590] pci 0000:01:00.0: reg 0x14: [mem 0xdc300000-0xdc300fff]
[    0.199680] pci 0000:01:00.0: supports D1 D2
[    0.199681] pci 0000:01:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.200010] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.200014] pci 0000:00:1c.0:   bridge window [mem 0xdc300000-0xdc3fffff]
[    0.200227] pci 0000:02:00.0: [168c:003e] type 00 class 0x028000
[    0.200555] pci 0000:02:00.0: reg 0x10: [mem 0xdc000000-0xdc1fffff 64bit]
[    0.201224] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.201923] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.201923] pci 0000:00:1c.2:   bridge window [mem 0xdc000000-0xdc1fffff]
[    0.204307] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[    0.204307] pci 0000:03:00.0: enabling Extended Tags
[    0.204307] pci 0000:03:00.0: supports D1 D2
[    0.204307] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.204307] pci 0000:00:1c.4: PCI bridge to [bus 03-6d]
[    0.204307] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.204307] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.204318] pci 0000:04:00.0: [8086:15d3] type 01 class 0x060400
[    0.204370] pci 0000:04:00.0: enabling Extended Tags
[    0.204439] pci 0000:04:00.0: supports D1 D2
[    0.204440] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.204511] pci 0000:04:01.0: [8086:15d3] type 01 class 0x060400
[    0.204563] pci 0000:04:01.0: enabling Extended Tags
[    0.204628] pci 0000:04:01.0: supports D1 D2
[    0.204629] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.204698] pci 0000:04:02.0: [8086:15d3] type 01 class 0x060400
[    0.204751] pci 0000:04:02.0: enabling Extended Tags
[    0.204816] pci 0000:04:02.0: supports D1 D2
[    0.204817] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.204888] pci 0000:04:04.0: [8086:15d3] type 01 class 0x060400
[    0.204938] pci 0000:04:04.0: enabling Extended Tags
[    0.205001] pci 0000:04:04.0: supports D1 D2
[    0.205002] pci 0000:04:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.205085] pci 0000:03:00.0: PCI bridge to [bus 04-6d]
[    0.205092] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.205097] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.205130] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.205137] pci 0000:04:00.0:   bridge window [mem 0xda000000-0xda0fffff]
[    0.205176] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.205183] pci 0000:04:01.0:   bridge window [mem 0xac000000-0xc3efffff]
[    0.205188] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x7fffffff 64bit pref]
[    0.205226] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.205233] pci 0000:04:02.0:   bridge window [mem 0xc3f00000-0xc3ffffff]
[    0.205273] pci 0000:04:04.0: PCI bridge to [bus 3a-6d]
[    0.205280] pci 0000:04:04.0:   bridge window [mem 0xc4000000-0xd9ffffff]
[    0.205285] pci 0000:04:04.0:   bridge window [mem 0x80000000-0xa9ffffff 64bit pref]
[    0.205364] pci 0000:6e:00.0: [1179:0116] type 00 class 0x010802
[    0.205390] pci 0000:6e:00.0: reg 0x10: [mem 0xdc200000-0xdc203fff 64bit]
[    0.205559] pci 0000:00:1d.0: PCI bridge to [bus 6e]
[    0.205562] pci 0000:00:1d.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.206354] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.206354] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 14 15)
[    0.206354] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.206354] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.206354] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.206354] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.206354] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.206354] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 14 15)
[    0.216002] ACPI: EC: interrupt unblocked
[    0.216002] ACPI: EC: event unblocked
[    0.216002] ACPI: \_SB_.PCI0.LPCB.ECDV: GPE=0x6e, EC_CMD/EC_SC=0x934, EC_DATA=0x930
[    0.216002] ACPI: \_SB_.PCI0.LPCB.ECDV: Used as boot DSDT EC to handle transactions and events
[    0.216009] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.216011] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.216016] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.216017] vgaarb: loaded
[    0.216073] pps_core: LinuxPPS API ver. 1 registered
[    0.216074] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.216075] PTP clock support registered
[    0.216079] EDAC MC: Ver: 3.0.0
[    0.216399] Registered efivars operations
[    0.248007] PCI: Using ACPI for IRQ routing
[    0.264896] PCI: pci_cache_line_size set to 64 bytes
[    0.265350] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
[    0.265351] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.265351] e820: reserve RAM buffer [mem 0x2d6d9000-0x2fffffff]
[    0.265352] e820: reserve RAM buffer [mem 0x3ecdd000-0x3fffffff]
[    0.265353] e820: reserve RAM buffer [mem 0x48e00000-0x4bffffff]
[    0.265353] e820: reserve RAM buffer [mem 0x4ae800000-0x4afffffff]
[    0.268058] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.268061] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.270101] clocksource: Switched to clocksource tsc-early
[    0.273894] VFS: Disk quotas dquot_6.6.0
[    0.273903] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.273974] AppArmor: AppArmor Filesystem Enabled
[    0.273982] pnp: PnP ACPI init
[    0.274134] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.274135] system 00:00: [io  0xffff] has been reserved
[    0.274136] system 00:00: [io  0xffff] has been reserved
[    0.274137] system 00:00: [io  0xffff] has been reserved
[    0.274138] system 00:00: [io  0x1800-0x18fe] has been reserved
[    0.274139] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.274142] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.274208] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.274231] system 00:02: [io  0x1854-0x1857] has been reserved
[    0.274233] system 00:02: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[    0.274312] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.274324] pnp 00:04: Plug and Play ACPI device, IDs DLL07e6 PNP0f13 (active)
[    0.274462] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.274463] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.274464] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.274465] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.274466] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.274467] system 00:05: [mem 0xfed90000-0xfed93fff] could not be reserved
[    0.274468] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
[    0.274469] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    0.274470] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.274471] system 00:05: [mem 0xdffe0000-0xdfffffff] has been reserved
[    0.274473] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.274498] system 00:06: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.274499] system 00:06: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.274500] system 00:06: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.274501] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be reserved
[    0.274502] system 00:06: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.274503] system 00:06: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.274503] system 00:06: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.274505] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.274699] system 00:07: [io  0xff00-0xfffe] has been reserved
[    0.274701] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.275395] system 00:08: [mem 0xfe029000-0xfe029fff] has been reserved
[    0.275396] system 00:08: [mem 0xfe028000-0xfe028fff] has been reserved
[    0.275398] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.279562] pnp: PnP ACPI: found 9 devices
[    0.284743] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.284768] pci 0000:04:01.0: bridge window [io  0x1000-0x0fff] to [bus 06-38] add_size 1000
[    0.284776] pci 0000:04:02.0: bridge window [io  0x1000-0x0fff] to [bus 39] add_size 1000
[    0.284778] pci 0000:04:02.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
[    0.284785] pci 0000:04:04.0: bridge window [io  0x1000-0x0fff] to [bus 3a-6d] add_size 1000
[    0.284793] pci 0000:03:00.0: bridge window [io  0x1000-0x0fff] to [bus 04-6d] add_size 3000
[    0.284797] pci 0000:00:1c.4: bridge window [io  0x1000-0x0fff] to [bus 03-6d] add_size 3000
[    0.284804] pci 0000:00:1c.4: BAR 13: assigned [io  0x2000-0x4fff]
[    0.284806] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.284809] pci 0000:00:1c.0:   bridge window [mem 0xdc300000-0xdc3fffff]
[    0.284813] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.284816] pci 0000:00:1c.2:   bridge window [mem 0xdc000000-0xdc1fffff]
[    0.284821] pci 0000:03:00.0: BAR 13: assigned [io  0x2000-0x4fff]
[    0.284824] pci 0000:04:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[    0.284825] pci 0000:04:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[    0.284826] pci 0000:04:01.0: BAR 13: assigned [io  0x2000-0x2fff]
[    0.284827] pci 0000:04:02.0: BAR 13: assigned [io  0x3000-0x3fff]
[    0.284827] pci 0000:04:04.0: BAR 13: assigned [io  0x4000-0x4fff]
[    0.284829] pci 0000:04:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[    0.284830] pci 0000:04:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[    0.284831] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.284835] pci 0000:04:00.0:   bridge window [mem 0xda000000-0xda0fffff]
[    0.284842] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[    0.284844] pci 0000:04:01.0:   bridge window [io  0x2000-0x2fff]
[    0.284848] pci 0000:04:01.0:   bridge window [mem 0xac000000-0xc3efffff]
[    0.284851] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x7fffffff 64bit pref]
[    0.284856] pci 0000:04:02.0: PCI bridge to [bus 39]
[    0.284858] pci 0000:04:02.0:   bridge window [io  0x3000-0x3fff]
[    0.284862] pci 0000:04:02.0:   bridge window [mem 0xc3f00000-0xc3ffffff]
[    0.284869] pci 0000:04:04.0: PCI bridge to [bus 3a-6d]
[    0.284871] pci 0000:04:04.0:   bridge window [io  0x4000-0x4fff]
[    0.284875] pci 0000:04:04.0:   bridge window [mem 0xc4000000-0xd9ffffff]
[    0.284878] pci 0000:04:04.0:   bridge window [mem 0x80000000-0xa9ffffff 64bit pref]
[    0.284883] pci 0000:03:00.0: PCI bridge to [bus 04-6d]
[    0.284885] pci 0000:03:00.0:   bridge window [io  0x2000-0x4fff]
[    0.284889] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[    0.284891] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.284896] pci 0000:00:1c.4: PCI bridge to [bus 03-6d]
[    0.284898] pci 0000:00:1c.4:   bridge window [io  0x2000-0x4fff]
[    0.284900] pci 0000:00:1c.4:   bridge window [mem 0xac000000-0xda0fffff]
[    0.284902] pci 0000:00:1c.4:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.284905] pci 0000:00:1d.0: PCI bridge to [bus 6e]
[    0.284908] pci 0000:00:1d.0:   bridge window [mem 0xdc200000-0xdc2fffff]
[    0.284913] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.284914] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.284915] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.284915] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000c3fff window]
[    0.284916] pci_bus 0000:00: resource 8 [mem 0x000c4000-0x000c7fff window]
[    0.284917] pci_bus 0000:00: resource 9 [mem 0x000c8000-0x000cbfff window]
[    0.284918] pci_bus 0000:00: resource 10 [mem 0x000cc000-0x000cffff window]
[    0.284919] pci_bus 0000:00: resource 11 [mem 0x000d0000-0x000d3fff window]
[    0.284919] pci_bus 0000:00: resource 12 [mem 0x000d4000-0x000d7fff window]
[    0.284920] pci_bus 0000:00: resource 13 [mem 0x000d8000-0x000dbfff window]
[    0.284921] pci_bus 0000:00: resource 14 [mem 0x000dc000-0x000dffff window]
[    0.284922] pci_bus 0000:00: resource 15 [mem 0x4f800000-0xdfffffff window]
[    0.284923] pci_bus 0000:00: resource 16 [mem 0xfd000000-0xfe7fffff window]
[    0.284924] pci_bus 0000:01: resource 1 [mem 0xdc300000-0xdc3fffff]
[    0.284924] pci_bus 0000:02: resource 1 [mem 0xdc000000-0xdc1fffff]
[    0.284925] pci_bus 0000:03: resource 0 [io  0x2000-0x4fff]
[    0.284926] pci_bus 0000:03: resource 1 [mem 0xac000000-0xda0fffff]
[    0.284927] pci_bus 0000:03: resource 2 [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.284928] pci_bus 0000:04: resource 0 [io  0x2000-0x4fff]
[    0.284928] pci_bus 0000:04: resource 1 [mem 0xac000000-0xda0fffff]
[    0.284929] pci_bus 0000:04: resource 2 [mem 0x60000000-0xa9ffffff 64bit pref]
[    0.284930] pci_bus 0000:05: resource 1 [mem 0xda000000-0xda0fffff]
[    0.284931] pci_bus 0000:06: resource 0 [io  0x2000-0x2fff]
[    0.284932] pci_bus 0000:06: resource 1 [mem 0xac000000-0xc3efffff]
[    0.284933] pci_bus 0000:06: resource 2 [mem 0x60000000-0x7fffffff 64bit pref]
[    0.284933] pci_bus 0000:39: resource 0 [io  0x3000-0x3fff]
[    0.284934] pci_bus 0000:39: resource 1 [mem 0xc3f00000-0xc3ffffff]
[    0.284935] pci_bus 0000:3a: resource 0 [io  0x4000-0x4fff]
[    0.284936] pci_bus 0000:3a: resource 1 [mem 0xc4000000-0xd9ffffff]
[    0.284936] pci_bus 0000:3a: resource 2 [mem 0x80000000-0xa9ffffff 64bit pref]
[    0.284937] pci_bus 0000:6e: resource 1 [mem 0xdc200000-0xdc2fffff]
[    0.285024] NET: Registered protocol family 2
[    0.285107] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes)
[    0.285136] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.285251] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.285342] TCP: Hash tables configured (established 131072 bind 65536)
[    0.285364] UDP hash table entries: 8192 (order: 6, 262144 bytes)
[    0.285391] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes)
[    0.285443] NET: Registered protocol family 1
[    0.285451] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.285811] PCI: CLS 128 bytes, default 64
[    0.285830] Unpacking initramfs...
[    0.682006] Freeing initrd memory: 37476K
[    0.682096] DMAR: ACPI device "device:75" under DMAR at fed91000 as 00:15.0
[    0.682099] DMAR: ACPI device "device:76" under DMAR at fed91000 as 00:15.1
[    0.700132] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.700135] software IO TLB [mem 0x3740f000-0x3b40f000] (64MB) mapped at [(____ptrval____)-(____ptrval____)]
[    0.700170] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x396d519840e, max_idle_ns: 881590569543 ns
[    0.700187] clocksource: Switched to clocksource tsc
[    0.701005] Initialise system trusted keyrings
[    0.701063] workingset: timestamp_bits=40 max_order=22 bucket_order=0
[    0.702437] zbud: loaded
[    0.702795] pstore: using deflate compression
[    0.880094] Key type asymmetric registered
[    0.880095] Asymmetric key parser 'x509' registered
[    0.880125] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    0.880147] io scheduler noop registered
[    0.880147] io scheduler deadline registered
[    0.880171] io scheduler cfq registered (default)
[    0.880172] io scheduler mq-deadline registered
[    0.880643] pcieport 0000:03:00.0: enabling device (0006 -> 0007)
[    0.880834] pcieport 0000:04:01.0: enabling device (0006 -> 0007)
[    0.880926] pcieport 0000:04:02.0: enabling device (0006 -> 0007)
[    0.881013] pcieport 0000:04:04.0: enabling device (0006 -> 0007)
[    0.881109] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.881119] efifb: probing for efifb
[    0.881127] efifb: framebuffer at 0x50000000, using 32448k, total 32448k
[    0.881128] efifb: mode is 3840x2160x32, linelength=15360, pages=1
[    0.881128] efifb: scrolling: redraw
[    0.881129] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.890954] Console: switching to colour frame buffer device 480x135
[    0.900712] fb0: EFI VGA frame buffer device
[    0.900717] intel_idle: MWAIT substates: 0x11142120
[    0.900718] intel_idle: v0.4.1 model 0x8E
[    0.900960] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.901666] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.901983] Linux agpgart interface v0.103
[    0.902012] AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    0.902013] AMD IOMMUv2 functionality not available on this system
[    0.902297] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    0.902686] i8042: Warning: Keylock active
[    0.904080] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.904083] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.904132] mousedev: PS/2 mouse device common for all mice
[    0.904164] rtc_cmos 00:01: RTC can wake from S4
[    0.924494] rtc_cmos 00:01: registered as rtc0
[    0.924502] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvram
[    0.924507] intel_pstate: Intel P-state driver initializing
[    0.924904] intel_pstate: HWP enabled
[    0.924934] ledtrig-cpu: registered to indicate activity on CPUs
[    0.925248] NET: Registered protocol family 10
[    0.925876] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    0.929786] Segment Routing with IPv6
[    0.929796] mip6: Mobile IPv6
[    0.929797] NET: Registered protocol family 17
[    0.929798] mpls_gso: MPLS GSO support
[    0.930268] microcode: sig=0x806ea, pf=0x80, revision=0x96
[    0.930492] microcode: Microcode Update Driver: v2.2.
[    0.930498] sched_clock: Marking stable (930490380, 0)->(1030942639, -100452259)
[    0.930846] registered taskstats version 1
[    0.930846] Loading compiled-in X.509 certificates
[    0.952972] Loaded X.509 cert 'secure-boot-test-key-lfaraone: 97c1b25cddf9873ca78a58f3d73bf727d2cf78ff'
[    0.952984] zswap: loaded using pool lzo/zbud
[    0.953082] AppArmor: AppArmor sha1 policy hashing enabled
[    0.953871] rtc_cmos 00:01: setting system clock to 2018-09-19 08:14:43 UTC (1537344883)
[    1.136542] Freeing unused kernel image memory: 1552K
[    1.172358] Write protecting the kernel read-only data: 16384k
[    1.173483] Freeing unused kernel image memory: 2028K
[    1.173676] Freeing unused kernel image memory: 844K
[    1.178734] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.178734] x86/mm: Checking user space page tables
[    1.183570] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.226486] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
[    1.226499] ACPI: Lid Switch [LID0]
[    1.226537] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input3
[    1.226545] ACPI: Power Button [PBTN]
[    1.226579] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input4
[    1.226584] ACPI: Sleep Button [SBTN]
[    1.226606] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input5
[    1.226614] ACPI: Power Button [PWRF]
[    1.232756] hidraw: raw HID events driver (C) Jiri Kosina
[    1.234476] rtsx_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    1.236712] ACPI: bus type USB registered
[    1.236723] usbcore: registered new interface driver usbfs
[    1.236727] usbcore: registered new interface driver hub
[    1.236743] usbcore: registered new device driver usb
[    1.241804] cryptd: max_cpu_qlen set to 1000
[    1.243641] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    1.243692] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    1.246014] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    1.246102] AVX2 version of gcm_enc/dec engaged.
[    1.246102] AES CTR mode by8 optimization enabled
[    1.246147] nvme nvme0: pci function 0000:6e:00.0
[    1.246397] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.246403] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    1.247481] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000000109810
[    1.247487] xhci_hcd 0000:00:14.0: cache line size of 128 is not supported
[    1.247725] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.18
[    1.247726] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.247728] usb usb1: Product: xHCI Host Controller
[    1.247729] usb usb1: Manufacturer: Linux 4.18.0-1-amd64 xhci-hcd
[    1.247730] usb usb1: SerialNumber: 0000:00:14.0
[    1.248675] hub 1-0:1.0: USB hub found
[    1.248692] hub 1-0:1.0: 12 ports detected
[    1.250116] thermal LNXTHERM:00: registered as thermal_zone0
[    1.250117] ACPI: Thermal Zone [THM] (25 C)
[    1.253048] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.253051] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    1.253054] xhci_hcd 0000:00:14.0: Host supports USB 3.0  SuperSpeed
[    1.253093] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 4.18
[    1.253094] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.253095] usb usb2: Product: xHCI Host Controller
[    1.253096] usb usb2: Manufacturer: Linux 4.18.0-1-amd64 xhci-hcd
[    1.253097] usb usb2: SerialNumber: 0000:00:14.0
[    1.253194] hub 2-0:1.0: USB hub found
[    1.253207] hub 2-0:1.0: 6 ports detected
[    1.253560] usb: port power management may be unreliable
[    1.269836] checking generic (50000000 1fb0000) vs hw (50000000 10000000)
[    1.269836] fb: switching to inteldrmfb from EFI VGA
[    1.269848] Console: switching to colour dummy device 80x25
[    1.269898] [drm] Replacing VGA console driver
[    1.280043] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.280043] [drm] Driver supports precise vblank timestamp query.
[    1.292912] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[    1.293019] i915 0000:00:02.0: firmware: direct-loading firmware i915/kbl_dmc_ver1_04.bin
[    1.293575] [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[    1.304240] [drm] Initialized i915 1.6.0 20180514 for 0000:00:02.0 on minor 0
[    1.314237] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[    1.323046] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input7
[    1.323154] i2c_hid i2c-ELAN24EE:00: i2c-ELAN24EE:00 supply vdd not found, using dummy regulator
[    1.335940] fbcon: inteldrmfb (fb0) is primary device
[    1.340286] random: fast init done
[    1.467922]  nvme0n1: p1 p2 p3 p4
[    1.588102] usb 1-5: new high-speed USB device number 2 using xhci_hcd
[    1.782442] usb 1-5: New USB device found, idVendor=0bda, idProduct=58f4, bcdDevice=76.05
[    1.782446] usb 1-5: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    1.782449] usb 1-5: Product: Integrated_Webcam_HD
[    1.782452] usb 1-5: Manufacturer: CN0FFMHCLOG0081JBD0MA00
[    1.782454] usb 1-5: SerialNumber: 200901010001
[    1.805159] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
[    1.846465] i2c_hid i2c-DELL07E6:00: i2c-DELL07E6:00 supply vdd not found, using dummy regulator
[    1.912097] usb 1-7: new full-speed USB device number 3 using xhci_hcd
[    2.052083] psmouse serio1: synaptics: Unable to query device: -5
[    2.234015] usb 1-7: New USB device found, idVendor=0489, idProduct=e0a2, bcdDevice= 0.01
[    2.234016] usb 1-7: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.238972] input: ELAN24EE:00 04F3:24EE Touchscreen as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24EE:00/0018:04F3:24EE.0001/input/input8
[    2.239018] input: ELAN24EE:00 04F3:24EE as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24EE:00/0018:04F3:24EE.0001/input/input9
[    2.239038] input: ELAN24EE:00 04F3:24EE as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24EE:00/0018:04F3:24EE.0001/input/input10
[    2.239064] hid-generic 0018:04F3:24EE.0001: input,hidraw0: I2C HID v1.00 Device [ELAN24EE:00 04F3:24EE] on i2c-ELAN24EE:00
[    2.239484] input: DELL07E6:00 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input13
[    2.239524] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input14
[    2.239562] hid-generic 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    2.432953] Console: switching to colour frame buffer device 480x135
[    2.484877] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[    2.624041] raid6: sse2x1   gen() 14031 MB/s
[    2.692038] raid6: sse2x1   xor() 10612 MB/s
[    2.760037] raid6: sse2x2   gen() 17701 MB/s
[    2.828058] raid6: sse2x2   xor() 12097 MB/s
[    2.896036] raid6: sse2x4   gen() 20671 MB/s
[    2.964058] raid6: sse2x4   xor() 11958 MB/s
[    3.032038] raid6: avx2x1   gen() 28766 MB/s
[    3.100038] raid6: avx2x1   xor() 20049 MB/s
[    3.168039] raid6: avx2x2   gen() 34542 MB/s
[    3.236056] raid6: avx2x2   xor() 22157 MB/s
[    3.304038] raid6: avx2x4   gen() 40111 MB/s
[    3.372038] raid6: avx2x4   xor() 22323 MB/s
[    3.372039] raid6: using algorithm avx2x4 gen() 40111 MB/s
[    3.372039] raid6: .... xor() 22323 MB/s, rmw enabled
[    3.372040] raid6: using avx2x2 recovery algorithm
[    3.372347] xor: automatically using best checksumming function   avx       
[    3.372501] async_tx: api initialized (async)
[    3.397708] Btrfs loaded, crc32c=crc32c-intel
[    3.416417] BTRFS: device fsid dec48420-f71b-4dd2-8552-d2e7ecb9b9f0 devid 1 transid 37 /dev/nvme0n1p4
[    3.543117] EXT4-fs (nvme0n1p2): mounted filesystem with ordered data mode. Opts: (null)
[    3.747682] systemd[1]: systemd 239 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN -PCRE2 default-hierarchy=hybrid)
[    3.764699] systemd[1]: Detected architecture x86-64.
[    3.767887] systemd[1]: Set hostname to <mkjlap>.
[    3.886766] random: systemd: uninitialized urandom read (16 bytes read)
[    3.889176] systemd[1]: Created slice system-getty.slice.
[    3.889446] random: systemd: uninitialized urandom read (16 bytes read)
[    3.889989] systemd[1]: Listening on LVM2 metadata daemon socket.
[    3.890195] random: systemd: uninitialized urandom read (16 bytes read)
[    3.890289] systemd[1]: Listening on Journal Socket (/dev/log).
[    3.890536] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    3.890815] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    3.891127] systemd[1]: Listening on Journal Audit Socket.
[    3.891417] systemd[1]: Listening on Network Service Netlink Socket.
[    3.901731] random: crng init done
[    3.901732] random: 7 urandom warning(s) missed due to ratelimiting
[    3.906961] device-mapper: uevent: version 1.0.3
[    3.907050] device-mapper: ioctl: 4.39.0-ioctl (2018-04-03) initialised: dm-devel@redhat.com
[    3.913340] loop: module loaded
[    3.917421] lp: driver loaded but no devices found
[    3.919692] ppdev: user-space parallel port driver
[    3.919725] EXT4-fs (nvme0n1p2): re-mounted. Opts: discard,errors=remount-ro
[    3.929843] drbd: initialized. Version: 8.4.10 (api:1/proto:86-101)
[    3.929844] drbd: srcversion: 37DB8DB35B73903252FE824 
[    3.929844] drbd: registered as block device major 147
[    3.936159] RPC: Registered named UNIX socket transport module.
[    3.936159] RPC: Registered udp transport module.
[    3.936160] RPC: Registered tcp transport module.
[    3.936160] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    4.008060] systemd-journald[386]: Received request to flush runtime journal from PID 1
[    4.027114] ACPI: AC Adapter [AC] (on-line)
[    4.029393] input: Intel HID events as /devices/platform/INT33D5:00/input/input19
[    4.029885] intel-hid INT33D5:00: platform supports 5 button array
[    4.029922] input: Intel HID 5 button array as /devices/platform/INT33D5:00/input/input20
[    4.045523] wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control method not found
[    4.053135] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    4.075156] ACPI: Battery Slot [BAT0] (battery present)
[    4.077958] media: Linux media interface: v0.10
[    4.079616] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    4.082307] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    4.082591] videodev: Linux video capture interface: v2.00
[    4.086262] iTCO_vendor_support: vendor-support=0
[    4.086677] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[    4.086724] iTCO_wdt: Found a Intel PCH TCO device (Version=4, TCOBASE=0x0400)
[    4.086845] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[    4.091215] EFI Variables Facility v0.08 2004-May-17
[    4.096923] input: PC Speaker as /devices/platform/pcspkr/input/input21
[    4.098390] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:58f4)
[    4.112566] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
[    4.112567] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    4.112567] RAPL PMU: hw unit of domain package 2^-14 Joules
[    4.112568] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    4.112568] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    4.112569] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    4.115809] uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not initialized!
[    4.115811] uvcvideo 1-5:1.0: Entity type for entity Extension 7 was not initialized!
[    4.116108] uvcvideo 1-5:1.0: Entity type for entity Processing 2 was not initialized!
[    4.116116] uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not initialized!
[    4.116169] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.0/input/input22
[    4.129069] pstore: Registered efi as persistent store backend
[    4.133454] uvcvideo: Unknown video format 00000032-0002-0010-8000-00aa00389b71
[    4.133458] uvcvideo: Found UVC 1.00 device Integrated_Webcam_HD (0bda:58f4)
[    4.135700] uvcvideo: Unable to create debugfs 1-2 directory.
[    4.135764] uvcvideo 1-5:1.2: Entity type for entity Extension 10 was not initialized!
[    4.135765] uvcvideo 1-5:1.2: Entity type for entity Extension 12 was not initialized!
[    4.135766] uvcvideo 1-5:1.2: Entity type for entity Processing 9 was not initialized!
[    4.135768] uvcvideo 1-5:1.2: Entity type for entity Camera 11 was not initialized!
[    4.135818] input: Integrated_Webcam_HD: Integrate as /devices/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.2/input/input23
[    4.149948] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    4.150155] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[    4.181717] BTRFS info (device nvme0n1p4): disk space caching is enabled
[    4.181718] BTRFS info (device nvme0n1p4): has skinny extents
[    4.183886] Bluetooth: Core ver 2.22
[    4.183896] NET: Registered protocol family 31
[    4.183897] Bluetooth: HCI device and connection manager initialized
[    4.183899] Bluetooth: HCI socket layer initialized
[    4.183901] Bluetooth: L2CAP socket layer initialized
[    4.183905] Bluetooth: SCO socket layer initialized
[    4.187839] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC3271: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    4.187841] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    4.187843] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    4.187844] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
[    4.187845] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[    4.187846] snd_hda_codec_realtek hdaudioC1D0:      Headset Mic=0x19
[    4.187848] snd_hda_codec_realtek hdaudioC1D0:      Headphone Mic=0x1b
[    4.187849] snd_hda_codec_realtek hdaudioC1D0:      Internal Mic=0x12
[    4.188120] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    4.190824] BTRFS info (device nvme0n1p4): enabling ssd optimizations
[    4.200185] usbcore: registered new interface driver uvcvideo
[    4.200186] USB Video Class driver (1.1.1)
[    4.211686] intel_rapl: Found RAPL domain package
[    4.211687] intel_rapl: Found RAPL domain core
[    4.211688] intel_rapl: Found RAPL domain uncore
[    4.211688] intel_rapl: Found RAPL domain dram
[    4.211771] usbcore: registered new interface driver btusb
[    4.212865] bluetooth hci0: firmware: direct-loading firmware qca/rampatch_usb_00000302.bin
[    4.212867] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_00000302.bin
[    4.212868] Bluetooth: hci0: QCA: patch rome 0x302 build 0x138, firmware rome 0x302 build 0x111
[    4.213993] ath10k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[    4.217488] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[    4.241658] bluetooth hci0: firmware: direct-loading firmware qca/nvm_usb_00000302.bin
[    4.241661] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
[    4.248745] dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.2)
[    4.267298] input: Dell WMI hotkeys as /devices/platform/PNP0C14:01/wmi_bus/wmi_bus-PNP0C14:01/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input24
[    4.304234] idma64 idma64.1: Found Intel integrated DMA 64-bit
[    4.352352] input: ELAN24EE:00 04F3:24EE as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-7/i2c-ELAN24EE:00/0018:04F3:24EE.0001/input/input25
[    4.352443] hid-multitouch 0018:04F3:24EE.0001: input,hidraw0: I2C HID v1.00 Device [ELAN24EE:00 04F3:24EE] on i2c-ELAN24EE:00
[    4.424891] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0000:00:1f.3/sound/card1/input30
[    4.432071] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input31
[    4.468168] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input32
[    4.468282] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input33
[    4.468386] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input34
[    4.468474] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card1/input35
[    4.501507] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
[    4.501508] firmware_class: See https://wiki.debian.org/Firmware for information about missing firmware
[    4.501514] ath10k_pci 0000:02:00.0: firmware: failed to load ath10k/cal-pci-0000:02:00.0.bin (-2)
[    4.502422] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/firmware-6.bin
[    4.502426] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
[    4.502427] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
[    4.502762] ath10k_pci 0000:02:00.0: firmware ver WLAN.RM.4.4.1-00079-QCARMSWPZ-1 api 6 features wowlan,ignore-otp crc32 fd869beb
[    4.566289] ath10k_pci 0000:02:00.0: firmware: direct-loading firmware ath10k/QCA6174/hw3.0/board-2.bin
[    4.566554] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 20d869c3
[    4.584379] input: DELL07E6:00 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-DELL07E6:00/0018:06CB:76AF.0002/input/input37
[    4.584502] hid-multitouch 0018:06CB:76AF.0002: input,hidraw1: I2C HID v1.00 Mouse [DELL07E6:00 06CB:76AF] on i2c-DELL07E6:00
[    5.145276] pcieport 0000:04:00.0: Refused to change power state, currently in D3
[    5.151013] pci_bus 0000:05: busn_res: [bus 05] is released
[    5.151180] pci_bus 0000:06: busn_res: [bus 06-38] is released
[    5.151224] pci_bus 0000:39: busn_res: [bus 39] is released
[    5.151350] pci_bus 0000:3a: busn_res: [bus 3a-6d] is released
[    5.151379] pci_bus 0000:04: busn_res: [bus 04-6d] is released
[    5.179533] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[    5.182680] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[    5.183506] ath10k_pci 0000:02:00.0: htt-ver 3.47 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[    5.271049] ath: EEPROM regdomain: 0x6c
[    5.271049] ath: EEPROM indicates we should expect a direct regpair map
[    5.271050] ath: Country alpha2 being used: 00
[    5.271050] ath: Regpair used: 0x6c
[    5.277946] ath10k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[    7.716448] input: PS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input6
[    7.920304] psmouse serio1: Failed to enable mouse on isa0060/serio1
[   14.127733] NET: Registered protocol family 38
[   14.370877] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: discard
[   14.448070] audit: type=1400 audit(1537344896.991:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-xpdfimport" pid=701 comm="apparmor_parser"
[   14.448085] audit: type=1400 audit(1537344896.991:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="torbrowser_tor" pid=705 comm="apparmor_parser"
[   14.448205] audit: type=1400 audit(1537344896.991:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="libreoffice-oopslash" pid=703 comm="apparmor_parser"
[   14.449618] audit: type=1400 audit(1537344896.991:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="torbrowser_plugin_container" pid=706 comm="apparmor_parser"
[   14.449690] audit: type=1400 audit(1537344896.991:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/freshclam" pid=707 comm="apparmor_parser"
[   14.449847] audit: type=1400 audit(1537344896.991:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ioq3ded" pid=700 comm="apparmor_parser"
[   14.449924] audit: type=1400 audit(1537344896.991:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="virt-aa-helper" pid=710 comm="apparmor_parser"
[   14.450460] audit: type=1400 audit(1537344896.991:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/sbin/tcpdump" pid=702 comm="apparmor_parser"
[   14.450665] audit: type=1400 audit(1537344896.991:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/rtcw/iowolf{mp,sp}*" pid=708 comm="apparmor_parser"
[   14.450667] audit: type=1400 audit(1537344896.991:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/rtcw/iowolf{mp,sp}*//popup" pid=708 comm="apparmor_parser"
[   14.851463] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   14.851464] Bluetooth: BNEP filters: protocol multicast
[   14.851467] Bluetooth: BNEP socket layer initialized
[   15.335675] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[   15.338723] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[   15.383491] IPv6: ADDRCONF(NETDEV_UP): wlp2s0: link is not ready
[   20.461936] wlp2s0: authenticate with f0:b0:52:15:23:bc
[   20.516236] wlp2s0: send auth to f0:b0:52:15:23:bc (try 1/3)
[   20.517069] wlp2s0: authenticated
[   20.520125] wlp2s0: associate with f0:b0:52:15:23:bc (try 1/3)
[   20.522848] wlp2s0: RX AssocResp from f0:b0:52:15:23:bc (capab=0x1001 status=0 aid=3)
[   20.543672] wlp2s0: associated
[   20.544280] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   20.548607] wlp2s0: Limiting TX power to 30 (30 - 0) dBm as advertised by f0:b0:52:15:23:bc
[   20.549476] ath: EEPROM regdomain: 0x8348
[   20.549477] ath: EEPROM indicates we should expect a country code
[   20.549478] ath: doing EEPROM country->regdmn map search
[   20.549478] ath: country maps to regdmn code: 0x3a
[   20.549479] ath: Country alpha2 being used: US
[   20.549480] ath: Regpair used: 0x3a
[   20.549480] ath: regdomain 0x8348 dynamically updated by country element
[   32.246255] Bluetooth: RFCOMM TTY layer initialized
[   32.246260] Bluetooth: RFCOMM socket layer initialized
[   32.246264] Bluetooth: RFCOMM ver 1.11
[  141.284660] fuse init (API version 7.27)
[  566.767658] wlp2s0: AP f0:b0:52:15:23:bc changed bandwidth, new config is 5500 MHz, width 2 (5510/0 MHz)
[ 3253.415000] PM: suspend entry (s2idle)
[ 3253.415002] PM: Syncing filesystems ... done.
[ 3253.435503] (NULL device *): firmware: direct-loading firmware qca/rampatch_usb_00000302.bin
[ 3253.435518] (NULL device *): firmware: direct-loading firmware qca/nvm_usb_00000302.bin
[ 3253.435630] (NULL device *): firmware: direct-loading firmware i915/kbl_dmc_ver1_04.bin
[ 3253.435654] Freezing user space processes ... (elapsed 0.001 seconds) done.
[ 3253.437236] OOM killer disabled.
[ 3253.437237] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[ 3253.438396] Suspending console(s) (use no_console_suspend to debug)
[ 3253.438650] wlp2s0: deauthenticating from f0:b0:52:15:23:bc by local choice (Reason: 3=DEAUTH_LEAVING)
[ 3253.856052] psmouse serio1: Failed to disable mouse on isa0060/serio1
[ 9692.537108] ACPI: button: The lid device is not compliant to SW_LID.
[ 9693.207333] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[ 9693.210377] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[ 9693.298696] OOM killer enabled.
[ 9693.298697] Restarting tasks ... done.
[ 9693.360582] PM: suspend exit
[ 9698.248456] wlp2s0: authenticate with f0:b0:52:15:23:bc
[ 9698.298338] wlp2s0: send auth to f0:b0:52:15:23:bc (try 1/3)
[ 9698.299336] wlp2s0: authenticated
[ 9698.301411] wlp2s0: associate with f0:b0:52:15:23:bc (try 1/3)
[ 9698.304220] wlp2s0: RX AssocResp from f0:b0:52:15:23:bc (capab=0x1001 status=0 aid=4)
[ 9698.307424] wlp2s0: associated
[ 9698.317004] ath: EEPROM regdomain: 0x8348
[ 9698.317006] ath: EEPROM indicates we should expect a country code
[ 9698.317007] ath: doing EEPROM country->regdmn map search
[ 9698.317008] ath: country maps to regdmn code: 0x3a
[ 9698.317009] ath: Country alpha2 being used: US
[ 9698.317010] ath: Regpair used: 0x3a
[ 9698.317011] ath: regdomain 0x8348 dynamically updated by country element
[ 9698.392734] wlp2s0: Limiting TX power to 30 (30 - 0) dBm as advertised by f0:b0:52:15:23:bc
[10190.837620] PM: suspend entry (s2idle)
[10190.837621] PM: Syncing filesystems ... done.
[10190.851039] (NULL device *): firmware: direct-loading firmware i915/kbl_dmc_ver1_04.bin
[10190.851119] (NULL device *): firmware: direct-loading firmware qca/nvm_usb_00000302.bin
[10190.851130] (NULL device *): firmware: direct-loading firmware qca/rampatch_usb_00000302.bin
[10190.851192] Freezing user space processes ... (elapsed 0.001 seconds) done.
[10190.852837] OOM killer disabled.
[10190.852837] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[10190.854024] Suspending console(s) (use no_console_suspend to debug)
[10190.854324] wlp2s0: deauthenticating from f0:b0:52:15:23:bc by local choice (Reason: 3=DEAUTH_LEAVING)
[13192.593375] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[13192.596439] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[13192.687893] OOM killer enabled.
[13192.687895] Restarting tasks ... done.
[13192.750939] PM: suspend exit
[13197.637170] wlp2s0: authenticate with 7a:8a:20:8e:7c:72
[13197.690868] wlp2s0: send auth to 7a:8a:20:8e:7c:72 (try 1/3)
[13197.692322] wlp2s0: authenticated
[13197.699712] wlp2s0: associate with 7a:8a:20:8e:7c:72 (try 1/3)
[13197.702155] wlp2s0: RX AssocResp from 7a:8a:20:8e:7c:72 (capab=0x411 status=0 aid=8)
[13197.705268] wlp2s0: associated
[13302.334318] pci 0000:03:00.0: [8086:15d3] type 01 class 0x060400
[13302.334381] pci 0000:03:00.0: enabling Extended Tags
[13302.334991] pci 0000:03:00.0: supports D1 D2
[13302.334992] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[13302.335835] pci 0000:04:00.0: [8086:15d3] type 01 class 0x060400
[13302.335890] pci 0000:04:00.0: enabling Extended Tags
[13302.336081] pci 0000:04:00.0: supports D1 D2
[13302.336082] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[13302.454030] pci 0000:04:01.0: [8086:15d3] type 01 class 0x060400
[13302.454087] pci 0000:04:01.0: enabling Extended Tags
[13302.454160] pci 0000:04:01.0: supports D1 D2
[13302.454162] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[13302.454254] pci 0000:04:02.0: [8086:15d3] type 01 class 0x060400
[13302.454309] pci 0000:04:02.0: enabling Extended Tags
[13302.454378] pci 0000:04:02.0: supports D1 D2
[13302.454379] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[13302.454463] pci 0000:04:04.0: [8086:15d3] type 01 class 0x060400
[13302.454516] pci 0000:04:04.0: enabling Extended Tags
[13302.454583] pci 0000:04:04.0: supports D1 D2
[13302.454583] pci 0000:04:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[13302.454673] pci 0000:03:00.0: PCI bridge to [bus 04-6d]
[13302.454681] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[13302.454686] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[13302.454724] pci 0000:04:00.0: PCI bridge to [bus 05]
[13302.454732] pci 0000:04:00.0:   bridge window [mem 0xda000000-0xda0fffff]
[13302.454774] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[13302.454781] pci 0000:04:01.0:   bridge window [mem 0xac000000-0xc3efffff]
[13302.454786] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x7fffffff 64bit pref]
[13302.454843] pci 0000:39:00.0: [8086:15d4] type 00 class 0x0c0330
[13302.454876] pci 0000:39:00.0: reg 0x10: [mem 0xc3f00000-0xc3f0ffff]
[13302.454949] pci 0000:39:00.0: enabling Extended Tags
[13302.455043] pci 0000:39:00.0: supports D1 D2
[13302.455044] pci 0000:39:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[13302.455203] pci 0000:04:02.0: PCI bridge to [bus 39]
[13302.455212] pci 0000:04:02.0:   bridge window [mem 0xc3f00000-0xc3ffffff]
[13302.455265] pci 0000:04:04.0: PCI bridge to [bus 3a-6d]
[13302.455273] pci 0000:04:04.0:   bridge window [mem 0xc4000000-0xd9ffffff]
[13302.455279] pci 0000:04:04.0:   bridge window [mem 0x80000000-0xa9ffffff 64bit pref]
[13302.455306] pci_bus 0000:04: Allocating resources
[13302.455336] pci 0000:04:01.0: bridge window [io  0x1000-0x0fff] to [bus 06-38] add_size 1000
[13302.455345] pci 0000:04:02.0: bridge window [io  0x1000-0x0fff] to [bus 39] add_size 1000
[13302.455347] pci 0000:04:02.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
[13302.455356] pci 0000:04:04.0: bridge window [io  0x1000-0x0fff] to [bus 3a-6d] add_size 1000
[13302.455364] pci 0000:03:00.0: bridge window [io  0x1000-0x0fff] to [bus 04-6d] add_size 3000
[13302.455367] pci 0000:03:00.0: BAR 13: assigned [io  0x2000-0x4fff]
[13302.455371] pci 0000:04:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[13302.455373] pci 0000:04:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[13302.455374] pci 0000:04:01.0: BAR 13: assigned [io  0x2000-0x2fff]
[13302.455376] pci 0000:04:02.0: BAR 13: assigned [io  0x3000-0x3fff]
[13302.455377] pci 0000:04:04.0: BAR 13: assigned [io  0x4000-0x4fff]
[13302.455380] pci 0000:04:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[13302.455381] pci 0000:04:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[13302.455382] pci 0000:04:00.0: PCI bridge to [bus 05]
[13302.455388] pci 0000:04:00.0:   bridge window [mem 0xda000000-0xda0fffff]
[13302.455396] pci 0000:04:01.0: PCI bridge to [bus 06-38]
[13302.455398] pci 0000:04:01.0:   bridge window [io  0x2000-0x2fff]
[13302.455403] pci 0000:04:01.0:   bridge window [mem 0xac000000-0xc3efffff]
[13302.455406] pci 0000:04:01.0:   bridge window [mem 0x60000000-0x7fffffff 64bit pref]
[13302.455412] pci 0000:04:02.0: PCI bridge to [bus 39]
[13302.455414] pci 0000:04:02.0:   bridge window [io  0x3000-0x3fff]
[13302.455419] pci 0000:04:02.0:   bridge window [mem 0xc3f00000-0xc3ffffff]
[13302.455427] pci 0000:04:04.0: PCI bridge to [bus 3a-6d]
[13302.455429] pci 0000:04:04.0:   bridge window [io  0x4000-0x4fff]
[13302.455434] pci 0000:04:04.0:   bridge window [mem 0xc4000000-0xd9ffffff]
[13302.455437] pci 0000:04:04.0:   bridge window [mem 0x80000000-0xa9ffffff 64bit pref]
[13302.455443] pci 0000:03:00.0: PCI bridge to [bus 04-6d]
[13302.455445] pci 0000:03:00.0:   bridge window [io  0x2000-0x4fff]
[13302.455449] pci 0000:03:00.0:   bridge window [mem 0xac000000-0xda0fffff]
[13302.455453] pci 0000:03:00.0:   bridge window [mem 0x60000000-0xa9ffffff 64bit pref]
[13302.455478] pcieport 0000:03:00.0: enabling device (0006 -> 0007)
[13302.455737] pcieport 0000:04:01.0: enabling device (0006 -> 0007)
[13302.455848] pcieport 0000:04:02.0: enabling device (0006 -> 0007)
[13302.455952] pcieport 0000:04:04.0: enabling device (0006 -> 0007)
[13302.456192] xhci_hcd 0000:39:00.0: xHCI Host Controller
[13302.456196] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus number 3
[13302.457301] xhci_hcd 0000:39:00.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000000009810
[13302.457482] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.18
[13302.457484] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[13302.457485] usb usb3: Product: xHCI Host Controller
[13302.457486] usb usb3: Manufacturer: Linux 4.18.0-1-amd64 xhci-hcd
[13302.457487] usb usb3: SerialNumber: 0000:39:00.0
[13302.457578] hub 3-0:1.0: USB hub found
[13302.457585] hub 3-0:1.0: 2 ports detected
[13302.457926] xhci_hcd 0000:39:00.0: xHCI Host Controller
[13302.458012] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bus number 4
[13302.458015] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[13302.458044] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 4.18
[13302.458045] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[13302.458046] usb usb4: Product: xHCI Host Controller
[13302.458047] usb usb4: Manufacturer: Linux 4.18.0-1-amd64 xhci-hcd
[13302.458048] usb usb4: SerialNumber: 0000:39:00.0
[13302.458127] hub 4-0:1.0: USB hub found
[13302.458134] hub 4-0:1.0: 2 ports detected
[13302.478196] pci_bus 0000:04: Allocating resources
[13302.478231] pcieport 0000:04:02.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
[13302.478248] pcieport 0000:04:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[13302.478249] pcieport 0000:04:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[13302.478250] pcieport 0000:04:02.0: BAR 15: no space for [mem size 0x00200000 64bit pref]
[13302.478251] pcieport 0000:04:02.0: BAR 15: failed to assign [mem size 0x00200000 64bit pref]
[13302.790226] usb 3-1: new full-speed USB device number 2 using xhci_hcd
[13302.941884] usb 3-1: New USB device found, idVendor=1b1c, idProduct=1b05, bcdDevice= 2.26
[13302.941891] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[13302.941895] usb 3-1: Product: Corsair M65 Gaming Mouse
[13302.941898] usb 3-1: Manufacturer: Corsair
[13302.958957] input: Corsair Corsair M65 Gaming Mouse as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:02.0/0000:39:00.0/usb3/3-1/3-1:1.0/0003:1B1C:1B05.0003/input/input46
[13302.959086] hid-generic 0003:1B1C:1B05.0003: input,hidraw2: USB HID v1.11 Mouse [Corsair Corsair M65 Gaming Mouse] on usb-0000:39:00.0-1/input0
[13302.959597] input: Corsair Corsair M65 Gaming Mouse as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:02.0/0000:39:00.0/usb3/3-1/3-1:1.1/0003:1B1C:1B05.0004/input/input47
[13303.018922] hid-generic 0003:1B1C:1B05.0004: input,hidraw3: USB HID v1.11 Keyboard [Corsair Corsair M65 Gaming Mouse] on usb-0000:39:00.0-1/input1
[13303.020675] input: Corsair Corsair M65 Gaming Mouse as /devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:02.0/0000:39:00.0/usb3/3-1/3-1:1.2/0003:1B1C:1B05.0005/input/input48
[13303.079000] hid-generic 0003:1B1C:1B05.0005: input,hidraw4: USB HID v1.11 Device [Corsair Corsair M65 Gaming Mouse] on usb-0000:39:00.0-1/input2
[13303.079152] usbcore: registered new interface driver usbhid
[13303.079155] usbhid: USB HID core driver
[15271.455524] ------------[ cut here ]------------
[15271.455526] Unknown pixelformat 0x00000000
[15271.455559] WARNING: CPU: 2 PID: 3837 at /build/linux-hJelb7/linux-4.18.6/drivers/media/v4l2-core/v4l2-ioctl.c:1297 v4l_enum_fmt+0x1104/0x13f0 [videodev]
[15271.455560] Modules linked in: usbhid ctr ccm fuse rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat snd_soc_skl dell_wmi dell_laptop snd_soc_skl_ipc dell_smbios wmi_bmof dcdbas dell_wmi_descriptor snd_soc_sst_ipc intel_rapl snd_soc_sst_dsp btusb ath10k_pci btrtl btbcm btintel snd_hda_codec_realtek x86_pkg_temp_thermal ath10k_core snd_hda_ext_core intel_powerclamp snd_soc_acpi snd_hda_codec_generic snd_soc_core bluetooth ath coretemp kvm_intel mac80211 snd_compress drbg kvm ansi_cprng irqbypass snd_hda_intel crct10dif_pclmul crc32_pclmul snd_hda_codec cfg80211 ecdh_generic snd_hda_core snd_hwdep ghash_clmulni_intel efi_pstore intel_cstate snd_pcm_oss snd_mixer_oss intel_uncore intel_rapl_perf snd_pcm snd_timer pcspkr uvcvideo serio_raw
[15271.455593]  efivars snd videobuf2_vmalloc videobuf2_memops iTCO_wdt iTCO_vendor_support soundcore videobuf2_v4l2 videobuf2_common mei_me ucsi_acpi videodev tpm_crb processor_thermal_device rtsx_pci_ms typec_ucsi media rfkill memstick mei hid_multitouch idma64 intel_soc_dts_iosf intel_pch_thermal typec wmi battery tpm_tis tpm_tis_core evdev intel_hid tpm sparse_keymap int3403_thermal int340x_thermal_zone rng_core acpi_pad int3400_thermal acpi_thermal_rel ac pcc_cpufreq ecryptfs sunrpc drbd lru_cache parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c crc32c_generic raid1 raid0 multipath linear
[15271.455632]  md_mod hid_generic crc32c_intel rtsx_pci_sdmmc mmc_core i915 i2c_algo_bit aesni_intel nvme xhci_pci aes_x86_64 crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[15271.455649] CPU: 2 PID: 3837 Comm: AudioThread Not tainted 4.18.0-1-amd64 #1 Debian 4.18.6-1
[15271.455649] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[15271.455654] RIP: 0010:v4l_enum_fmt+0x1104/0x13f0 [videodev]
[15271.455655] Code: c6 60 50 b4 c0 e9 d9 ef ff ff 3d 4d 54 32 31 48 c7 c6 8a 50 b4 c0 0f 84 c7 ef ff ff 89 c6 48 c7 c7 41 5d b4 c0 e8 2c 86 14 ca <0f> 0b 80 7d 0c 00 0f 85 c9 ef ff ff 8b 45 2c 48 c7 c1 4f 50 b4 c0 
[15271.455680] RSP: 0018:ffffbcc507227cb8 EFLAGS: 00010286
[15271.455681] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000006
[15271.455682] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff9ac5ee496730
[15271.455683] RBP: ffffbcc507227db8 R08: 000000000000044b R09: 0000000000000000
[15271.455684] R10: ffff9ac5bfedeb00 R11: 0000000000000001 R12: ffff9ac4ce814000
[15271.455684] R13: ffffffffc0c129a0 R14: ffff9ac5bfedeb00 R15: 0000000000000000
[15271.455686] FS:  00007f8915e72700(0000) GS:ffff9ac5ee480000(0000) knlGS:0000000000000000
[15271.455687] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[15271.455688] CR2: 0000039b26458000 CR3: 00000003ea67c003 CR4: 00000000003606e0
[15271.455688] Call Trace:
[15271.455695]  __video_do_ioctl+0x1aa/0x3c0 [videodev]
[15271.455700]  video_usercopy+0xbd/0x5d0 [videodev]
[15271.455704]  ? copy_overflow+0x20/0x20 [videodev]
[15271.455709]  ? v4l2_event_unsubscribe_all+0x86/0xb0 [videodev]
[15271.455713]  v4l2_ioctl+0x45/0x50 [videodev]
[15271.455716]  do_vfs_ioctl+0xa4/0x640
[15271.455720]  ? kmem_cache_free+0x19b/0x1d0
[15271.455722]  ? kmem_cache_free+0x19b/0x1d0
[15271.455724]  ksys_ioctl+0x70/0x80
[15271.455726]  __x64_sys_ioctl+0x16/0x20
[15271.455729]  do_syscall_64+0x55/0x110
[15271.455733]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[15271.455735] RIP: 0033:0x7f8929ce6067
[15271.455735] Code: b3 66 90 48 8b 05 21 7e 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f1 7d 0c 00 f7 d8 64 89 01 48 
[15271.455760] RSP: 002b:00007f8915e710b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[15271.455762] RAX: ffffffffffffffda RBX: 00007f8915e712a0 RCX: 00007f8929ce6067
[15271.455762] RDX: 00007f8915e712a0 RSI: 00000000c0405602 RDI: 0000000000000083
[15271.455763] RBP: 0000000080685600 R08: 0000000000000000 R09: 0000000000000000
[15271.455764] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f8915e71238
[15271.455765] R13: 00007f8915e710f0 R14: 0000000000000083 R15: 00007f8915e71340
[15271.455766] ---[ end trace 9ccc830fc330192f ]---
[15310.929793] input: 04:52:C7:E5:C3:1E as /devices/virtual/input/input49
[19013.900225] input: 04:52:C7:E5:C3:1E as /devices/virtual/input/input50
[24321.189120] CPU6: Core temperature above threshold, cpu clock throttled (total events = 1)
[24321.189121] CPU2: Core temperature above threshold, cpu clock throttled (total events = 1)
[24321.189122] CPU4: Package temperature above threshold, cpu clock throttled (total events = 1)
[24321.189123] CPU3: Package temperature above threshold, cpu clock throttled (total events = 1)
[24321.189124] CPU1: Package temperature above threshold, cpu clock throttled (total events = 1)
[24321.189125] CPU5: Package temperature above threshold, cpu clock throttled (total events = 1)
[24321.189126] CPU0: Package temperature above threshold, cpu clock throttled (total events = 1)
[24321.189127] CPU7: Package temperature above threshold, cpu clock throttled (total events = 1)
[24321.189128] CPU2: Package temperature above threshold, cpu clock throttled (total events = 1)
[24321.189129] CPU6: Package temperature above threshold, cpu clock throttled (total events = 1)
[24321.190122] CPU2: Core temperature/speed normal
[24321.190122] CPU6: Core temperature/speed normal
[24321.190123] CPU5: Package temperature/speed normal
[24321.190124] CPU1: Package temperature/speed normal
[24321.190124] CPU4: Package temperature/speed normal
[24321.190125] CPU3: Package temperature/speed normal
[24321.190126] CPU0: Package temperature/speed normal
[24321.190126] CPU6: Package temperature/speed normal
[24321.190127] CPU7: Package temperature/speed normal
[24321.190128] CPU2: Package temperature/speed normal
[29103.449344] perf: interrupt took too long (2532 > 2500), lowering kernel.perf_event_max_sample_rate to 78750
[29322.748139] CPU6: Core temperature above threshold, cpu clock throttled (total events = 3074)
[29322.748140] CPU2: Core temperature above threshold, cpu clock throttled (total events = 3074)
[29322.748141] CPU0: Package temperature above threshold, cpu clock throttled (total events = 4143)
[29322.748143] CPU7: Package temperature above threshold, cpu clock throttled (total events = 4143)
[29322.748144] CPU5: Package temperature above threshold, cpu clock throttled (total events = 4143)
[29322.748145] CPU3: Package temperature above threshold, cpu clock throttled (total events = 4143)
[29322.748146] CPU4: Package temperature above threshold, cpu clock throttled (total events = 4143)
[29322.748147] CPU1: Package temperature above threshold, cpu clock throttled (total events = 4142)
[29322.748148] CPU2: Package temperature above threshold, cpu clock throttled (total events = 4143)
[29322.748149] CPU6: Package temperature above threshold, cpu clock throttled (total events = 4143)
[29322.749138] CPU6: Core temperature/speed normal
[29322.749139] CPU2: Core temperature/speed normal
[29322.749140] CPU5: Package temperature/speed normal
[29322.749140] CPU1: Package temperature/speed normal
[29322.749141] CPU7: Package temperature/speed normal
[29322.749142] CPU4: Package temperature/speed normal
[29322.749143] CPU0: Package temperature/speed normal
[29322.749143] CPU3: Package temperature/speed normal
[29322.749144] CPU2: Package temperature/speed normal
[29322.749145] CPU6: Package temperature/speed normal
[30810.700106] CPU6: Core temperature above threshold, cpu clock throttled (total events = 3160)
[30810.700107] CPU3: Package temperature above threshold, cpu clock throttled (total events = 4305)
[30810.700108] CPU2: Core temperature above threshold, cpu clock throttled (total events = 3160)
[30810.700108] CPU7: Package temperature above threshold, cpu clock throttled (total events = 4305)
[30810.700109] CPU2: Package temperature above threshold, cpu clock throttled (total events = 4305)
[30810.700110] CPU6: Package temperature above threshold, cpu clock throttled (total events = 4305)
[30810.700141] CPU5: Package temperature above threshold, cpu clock throttled (total events = 4305)
[30810.700142] CPU0: Package temperature above threshold, cpu clock throttled (total events = 4305)
[30810.700143] CPU1: Package temperature above threshold, cpu clock throttled (total events = 4304)
[30810.700144] CPU4: Package temperature above threshold, cpu clock throttled (total events = 4305)
[30810.701145] CPU6: Core temperature/speed normal
[30810.701146] CPU3: Package temperature/speed normal
[30810.701147] CPU2: Core temperature/speed normal
[30810.701147] CPU7: Package temperature/speed normal
[30810.701148] CPU2: Package temperature/speed normal
[30810.701148] CPU6: Package temperature/speed normal
[30810.701185] CPU5: Package temperature/speed normal
[30810.701186] CPU1: Package temperature/speed normal
[30810.701186] CPU0: Package temperature/speed normal
[30810.701187] CPU4: Package temperature/speed normal
[35789.530800] device wlp2s0 entered promiscuous mode
[35797.694733] device wlp2s0 left promiscuous mode
[35802.102657] device wlp2s0 entered promiscuous mode
[36255.861129] device wlp2s0 left promiscuous mode
[36382.635938] perf: interrupt took too long (3201 > 3165), lowering kernel.perf_event_max_sample_rate to 62250
[36460.182528] device wlp2s0 entered promiscuous mode
[36472.760870] device wlp2s0 left promiscuous mode
[45162.806177] CPU4: Core temperature above threshold, cpu clock throttled (total events = 1454)
[45162.806178] CPU0: Core temperature above threshold, cpu clock throttled (total events = 1454)
[45162.806180] CPU1: Package temperature above threshold, cpu clock throttled (total events = 4309)
[45162.806181] CPU2: Package temperature above threshold, cpu clock throttled (total events = 4310)
[45162.806182] CPU5: Package temperature above threshold, cpu clock throttled (total events = 4310)
[45162.806182] CPU6: Package temperature above threshold, cpu clock throttled (total events = 4310)
[45162.806183] CPU3: Package temperature above threshold, cpu clock throttled (total events = 4310)
[45162.806184] CPU7: Package temperature above threshold, cpu clock throttled (total events = 4310)
[45162.806185] CPU0: Package temperature above threshold, cpu clock throttled (total events = 4310)
[45162.806186] CPU4: Package temperature above threshold, cpu clock throttled (total events = 4310)
[45162.807118] CPU0: Core temperature/speed normal
[45162.807119] CPU4: Core temperature/speed normal
[45162.807119] CPU7: Package temperature/speed normal
[45162.807120] CPU3: Package temperature/speed normal
[45162.807120] CPU1: Package temperature/speed normal
[45162.807121] CPU5: Package temperature/speed normal
[45162.807122] CPU6: Package temperature/speed normal
[45162.807122] CPU2: Package temperature/speed normal
[45162.807123] CPU4: Package temperature/speed normal
[45162.807124] CPU0: Package temperature/speed normal
[45500.548799] PM: suspend entry (s2idle)
[45500.548801] PM: Syncing filesystems ... done.
[45500.558628] (NULL device *): firmware: direct-loading firmware i915/kbl_dmc_ver1_04.bin
[45500.558807] (NULL device *): firmware: direct-loading firmware qca/nvm_usb_00000302.bin
[45500.558810] (NULL device *): firmware: direct-loading firmware qca/rampatch_usb_00000302.bin
[45500.558956] Freezing user space processes ... (elapsed 0.015 seconds) done.
[45500.574748] OOM killer disabled.
[45500.574749] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[45500.576227] Suspending console(s) (use no_console_suspend to debug)
[45500.577331] wlp2s0: deauthenticating from 7a:8a:20:8e:7c:72 by local choice (Reason: 3=DEAUTH_LEAVING)
[45555.744875] pci_raw_set_power_state: 27 callbacks suppressed
[45555.744877] xhci_hcd 0000:39:00.0: Refused to change power state, currently in D3
[45560.895935] pcieport 0000:03:00.0: Refused to change power state, currently in D3
[45560.899613] pcieport 0000:04:01.0: Refused to change power state, currently in D3
[45560.899615] pcieport 0000:04:02.0: Refused to change power state, currently in D3
[45560.899616] pcieport 0000:04:04.0: Refused to change power state, currently in D3
[45560.903465] xhci_hcd 0000:39:00.0: Refused to change power state, currently in D3
[45616.590511] pcieport 0000:03:00.0: Refused to change power state, currently in D3
[45616.592370] pcieport 0000:04:01.0: Refused to change power state, currently in D3
[45616.592374] pcieport 0000:04:02.0: Refused to change power state, currently in D3
[45616.592378] pcieport 0000:04:04.0: Refused to change power state, currently in D3
[47006.866892] xhci_hcd 0000:39:00.0: WARN: xHC restore state timeout
[47006.866898] xhci_hcd 0000:39:00.0: PCI post-resume error -110!
[47006.866902] xhci_hcd 0000:39:00.0: HC died; cleaning up
[47006.866906] xhci_hcd 0000:39:00.0: HC died; cleaning up
[47006.866923] dpm_run_callback(): pci_pm_resume+0x0/0xa0 returns -110
[47006.866932] PM: Device 0000:39:00.0 failed to resume async: error -110
[47007.592844] ath10k_pci 0000:02:00.0: Unknown eventid: 118809
[47007.595889] ath10k_pci 0000:02:00.0: Unknown eventid: 90118
[47007.688040] OOM killer enabled.
[47007.688042] Restarting tasks ... 
[47007.688127] usb 3-1: USB disconnect, device number 2
[47007.688349] xhci_hcd 0000:39:00.0: remove, state 4
[47007.688360] usb usb4: USB disconnect, device number 1
[47007.688711] xhci_hcd 0000:39:00.0: USB bus 4 deregistered
[47007.688721] xhci_hcd 0000:39:00.0: remove, state 4
[47007.688729] usb usb3: USB disconnect, device number 1
[47007.695090] done.
[47007.770222] PM: suspend exit
[47007.783270] xhci_hcd 0000:39:00.0: Host halt failed, -19
[47007.783272] xhci_hcd 0000:39:00.0: Host not accessible, reset failed.
[47007.783352] xhci_hcd 0000:39:00.0: USB bus 3 deregistered
[47007.785158] pci_bus 0000:05: busn_res: [bus 05] is released
[47007.785247] pci_bus 0000:06: busn_res: [bus 06-38] is released
[47007.785392] pci_bus 0000:39: busn_res: [bus 39] is released
[47007.785487] pci_bus 0000:3a: busn_res: [bus 3a-6d] is released
[47007.785523] pci_bus 0000:04: busn_res: [bus 04-6d] is released
[47012.638442] wlp2s0: authenticate with f0:b0:52:15:23:bc
[47012.688979] wlp2s0: send auth to f0:b0:52:15:23:bc (try 1/3)
[47012.689883] wlp2s0: authenticated
[47012.690858] wlp2s0: associate with f0:b0:52:15:23:bc (try 1/3)
[47012.693758] wlp2s0: RX AssocResp from f0:b0:52:15:23:bc (capab=0x1001 status=0 aid=3)
[47012.696720] wlp2s0: associated
[47012.712779] wlp2s0: Limiting TX power to 30 (30 - 0) dBm as advertised by f0:b0:52:15:23:bc
[47012.714379] ath: EEPROM regdomain: 0x8348
[47012.714381] ath: EEPROM indicates we should expect a country code
[47012.714383] ath: doing EEPROM country->regdmn map search
[47012.714386] ath: country maps to regdmn code: 0x3a
[47012.714388] ath: Country alpha2 being used: US
[47012.714389] ath: Regpair used: 0x3a
[47012.714392] ath: regdomain 0x8348 dynamically updated by country element
[48222.310672] wlp2s0: AP f0:b0:52:15:23:bc changed bandwidth, new config is 5280 MHz, width 2 (5270/0 MHz)
[48283.446148] wlp2s0: AP f0:b0:52:15:23:bc changed bandwidth, new config is 5500 MHz, width 2 (5510/0 MHz)
[48840.731559] wlp2s0: AP f0:b0:52:15:23:bc changed bandwidth, new config is 5260 MHz, width 2 (5270/0 MHz)
[51082.052556] wlp2s0: AP f0:b0:52:15:23:bc changed bandwidth, new config is 5240 MHz, width 2 (5230/0 MHz)
[51082.116932] wlp2s0: Limiting TX power to 36 (36 - 0) dBm as advertised by f0:b0:52:15:23:bc
[51173.397640] wlp2s0: AP f0:b0:52:15:23:bc changed bandwidth, new config is 5500 MHz, width 2 (5510/0 MHz)
[51173.450522] wlp2s0: Limiting TX power to 30 (30 - 0) dBm as advertised by f0:b0:52:15:23:bc
[51785.965670] perf: interrupt took too long (4027 > 4001), lowering kernel.perf_event_max_sample_rate to 49500
[64183.250718] PM: suspend entry (s2idle)
[64183.250719] PM: Syncing filesystems ... done.
[64183.263001] (NULL device *): firmware: direct-loading firmware i915/kbl_dmc_ver1_04.bin
[64183.263264] (NULL device *): firmware: direct-loading firmware qca/nvm_usb_00000302.bin
[64183.263271] (NULL device *): firmware: direct-loading firmware qca/rampatch_usb_00000302.bin
[64183.263386] Freezing user space processes ... (elapsed 0.015 seconds) done.
[64183.279296] OOM killer disabled.
[64183.279297] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[64183.280716] Suspending console(s) (use no_console_suspend to debug)
[64183.281314] wlp2s0: deauthenticating from f0:b0:52:15:23:bc by local choice (Reason: 3=DEAUTH_LEAVING)
[82633.448745] ath10k_pci 0000:02:00.0: failed to receive control response completion, polling..
[82633.478918] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000001 at 0x00034430: -110
[82633.509042] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034444: -110
[82633.539111] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000001e at 0x00034430: -110
[82633.569186] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000001 at 0x00034830: -110
[82633.599256] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000001 at 0x00035430: -110
[82633.629326] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00035444: -110
[82633.659397] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000001e at 0x00035430: -110
[82633.689473] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000001e at 0x00034830: -110
[82633.719543] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000001 at 0x00034c30: -110
[82635.112747] ath10k_pci 0000:02:00.0: ctl_resp never came in (-110)
[82635.112750] ath10k_pci 0000:02:00.0: failed to connect to HTC: -110
[82638.459459] ath10k_warn: 122 callbacks suppressed
[82638.459462] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00002000 at 0x00035404: -110
[82638.489554] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00035410: -110
[82638.519645] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffff0100 at 0x00035410: -110
[82638.549746] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00035410: -110
[82638.579843] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xfffeffff at 0x00035410: -110
[82638.609936] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003544c: -110
[82638.640013] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000ffff at 0x0003544c: -110
[82638.670110] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003544c: -110
[82638.700205] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffff2000 at 0x0003544c: -110
[82638.730284] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00036044: -110
[82642.523147] ath10k_pci 0000:02:00.0: failed to read device register, device is gone
[82643.472736] ath10k_warn: 156 callbacks suppressed
[82643.472739] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034c48: -110
[82643.502810] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034c40: -110
[82643.532880] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x3543f000 at 0x00034c08: -110
[82643.562966] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x00000080 at 0x00034c0c: -110
[82643.593036] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034c10: -110
[82643.623107] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xfffdffff at 0x00034c10: -110
[82643.653177] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034c50: -110
[82643.683247] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0x0000ffff at 0x00034c50: -110
[82643.713319] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034c50: -110
[82643.743388] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffff0080 at 0x00034c50: -110
[82648.286654] ath10k_pci 0000:02:00.0: failed to read device register, device is gone
[82648.497301] ath10k_warn: 158 callbacks suppressed
[82648.497302] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003482c: -110
[82648.527396] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xfffffffe at 0x0003482c: -110
[82648.557505] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034834: -110
[82648.587605] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xfffff81f at 0x00034834: -110
[82648.617701] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x0003482c: -110
[82648.647780] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xffffffe1 at 0x0003482c: -110
[82648.677880] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034c2c: -110
[82648.707978] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xfffffffe at 0x00034c2c: -110
[82648.738096] ath10k_pci 0000:02:00.0: failed to wake target for read32 at 0x00034c34: -110
[82648.768193] ath10k_pci 0000:02:00.0: failed to wake target for write32 of 0xfffff81f at 0x00034c34: -110
[82649.882345] ath10k_pci 0000:02:00.0: Could not init core: -110
[82649.882346] ------------[ cut here ]------------
[82649.882347] Hardware became unavailable upon resume. This could be a software issue prior to suspend or a hardware issue.
[82649.882375] WARNING: CPU: 5 PID: 1042 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/util.c:1906 ieee80211_reconfig+0x9d/0x12e0 [mac80211]
[82649.882375] Modules linked in: nfnetlink_queue nfnetlink_log nfnetlink uinput usbhid ctr ccm fuse rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat snd_soc_skl dell_wmi dell_laptop snd_soc_skl_ipc dell_smbios wmi_bmof dcdbas dell_wmi_descriptor snd_soc_sst_ipc intel_rapl snd_soc_sst_dsp btusb ath10k_pci btrtl btbcm btintel snd_hda_codec_realtek x86_pkg_temp_thermal ath10k_core snd_hda_ext_core intel_powerclamp snd_soc_acpi snd_hda_codec_generic snd_soc_core bluetooth ath coretemp kvm_intel mac80211 snd_compress drbg kvm ansi_cprng irqbypass snd_hda_intel crct10dif_pclmul crc32_pclmul snd_hda_codec cfg80211 ecdh_generic snd_hda_core snd_hwdep ghash_clmulni_intel efi_pstore intel_cstate snd_pcm_oss snd_mixer_oss intel_uncore intel_rapl_perf
[82649.882397]  snd_pcm snd_timer pcspkr uvcvideo serio_raw efivars snd videobuf2_vmalloc videobuf2_memops iTCO_wdt iTCO_vendor_support soundcore videobuf2_v4l2 videobuf2_common mei_me ucsi_acpi videodev tpm_crb processor_thermal_device rtsx_pci_ms typec_ucsi media rfkill memstick mei hid_multitouch idma64 intel_soc_dts_iosf intel_pch_thermal typec wmi battery tpm_tis tpm_tis_core evdev intel_hid tpm sparse_keymap int3403_thermal int340x_thermal_zone rng_core acpi_pad int3400_thermal acpi_thermal_rel ac pcc_cpufreq ecryptfs sunrpc drbd lru_cache parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c
[82649.882423]  crc32c_generic raid1 raid0 multipath linear md_mod hid_generic crc32c_intel rtsx_pci_sdmmc mmc_core i915 i2c_algo_bit aesni_intel nvme xhci_pci aes_x86_64 crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[82649.882436] CPU: 5 PID: 1042 Comm: kworker/u16:13 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[82649.882436] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[82649.882440] Workqueue: events_unbound async_run_entry_fn
[82649.882449] RIP: 0010:ieee80211_reconfig+0x9d/0x12e0 [mac80211]
[82649.882449] Code: 44 24 07 00 c6 83 94 04 00 00 00 48 89 df e8 6a d0 fc ff 85 c0 41 89 c7 0f 84 df 02 00 00 48 c7 c7 e0 18 5e c1 e8 a3 da 6c c9 <0f> 0b e9 aa 01 00 00 c6 44 24 07 00 8b 93 28 04 00 00 39 c2 75 08 
[82649.882464] RSP: 0000:ffffbcc520e77d70 EFLAGS: 00010286
[82649.882465] RAX: 0000000000000000 RBX: ffff9ac5d9410760 RCX: 0000000000000006
[82649.882465] RDX: 0000000000000007 RSI: 0000000000000096 RDI: ffff9ac5ee556730
[82649.882466] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000000006d
[82649.882466] R10: ffffe4781255ec08 R11: 0000000000000000 R12: ffff9ac5d94102e0
[82649.882467] R13: 0000000000000000 R14: 0000000000000010 R15: 00000000ffffff92
[82649.882467] FS:  0000000000000000(0000) GS:ffff9ac5ee540000(0000) knlGS:0000000000000000
[82649.882468] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[82649.882468] CR2: 0000000000938450 CR3: 000000027040a001 CR4: 00000000003606e0
[82649.882469] Call Trace:
[82649.882481]  wiphy_resume+0x5e/0x100 [cfg80211]
[82649.882487]  ? index_show+0x20/0x20 [cfg80211]
[82649.882489]  dpm_run_callback+0x4e/0x160
[82649.882490]  device_resume+0x97/0x190
[82649.882491]  async_resume+0x19/0x40
[82649.882492]  async_run_entry_fn+0x39/0x160
[82649.882494]  process_one_work+0x195/0x370
[82649.882495]  worker_thread+0x30/0x390
[82649.882496]  ? process_one_work+0x370/0x370
[82649.882497]  kthread+0x113/0x130
[82649.882498]  ? kthread_create_worker_on_cpu+0x70/0x70
[82649.882500]  ret_from_fork+0x35/0x40
[82649.882501] ---[ end trace 9ccc830fc3301930 ]---
[82649.882597] ------------[ cut here ]------------
[82649.882598] p2p-dev-wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[82649.882611] WARNING: CPU: 1 PID: 1042 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_remove_interface+0xf5/0x100 [mac80211]
[82649.882611] Modules linked in: nfnetlink_queue nfnetlink_log nfnetlink uinput usbhid ctr ccm fuse rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat snd_soc_skl dell_wmi dell_laptop snd_soc_skl_ipc dell_smbios wmi_bmof dcdbas dell_wmi_descriptor snd_soc_sst_ipc intel_rapl snd_soc_sst_dsp btusb ath10k_pci btrtl btbcm btintel snd_hda_codec_realtek x86_pkg_temp_thermal ath10k_core snd_hda_ext_core intel_powerclamp snd_soc_acpi snd_hda_codec_generic snd_soc_core bluetooth ath coretemp kvm_intel mac80211 snd_compress drbg kvm ansi_cprng irqbypass snd_hda_intel crct10dif_pclmul crc32_pclmul snd_hda_codec cfg80211 ecdh_generic snd_hda_core snd_hwdep ghash_clmulni_intel efi_pstore intel_cstate snd_pcm_oss snd_mixer_oss intel_uncore intel_rapl_perf
[82649.882628]  snd_pcm snd_timer pcspkr uvcvideo serio_raw efivars snd videobuf2_vmalloc videobuf2_memops iTCO_wdt iTCO_vendor_support soundcore videobuf2_v4l2 videobuf2_common mei_me ucsi_acpi videodev tpm_crb processor_thermal_device rtsx_pci_ms typec_ucsi media rfkill memstick mei hid_multitouch idma64 intel_soc_dts_iosf intel_pch_thermal typec wmi battery tpm_tis tpm_tis_core evdev intel_hid tpm sparse_keymap int3403_thermal int340x_thermal_zone rng_core acpi_pad int3400_thermal acpi_thermal_rel ac pcc_cpufreq ecryptfs sunrpc drbd lru_cache parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c
[82649.882646]  crc32c_generic raid1 raid0 multipath linear md_mod hid_generic crc32c_intel rtsx_pci_sdmmc mmc_core i915 i2c_algo_bit aesni_intel nvme xhci_pci aes_x86_64 crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[82649.882655] CPU: 1 PID: 1042 Comm: kworker/u16:13 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[82649.882655] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[82649.882657] Workqueue: events_unbound async_run_entry_fn
[82649.882662] RIP: 0010:drv_remove_interface+0xf5/0x100 [mac80211]
[82649.882662] Code: 85 c0 75 e8 5b 5d 41 5c c3 48 8b b3 08 04 00 00 48 81 c3 28 04 00 00 48 c7 c7 38 fe 5d c1 48 85 f6 48 0f 44 f3 e8 1b 05 70 c9 <0f> 0b 5b 5d 41 5c c3 0f 1f 40 00 0f 1f 44 00 00 41 57 41 56 41 55 
[82649.882677] RSP: 0018:ffffbcc520e77c88 EFLAGS: 00010286
[82649.882678] RAX: 0000000000000000 RBX: ffff9ac5db5aa428 RCX: 0000000000000006
[82649.882678] RDX: 0000000000000007 RSI: 0000000000000086 RDI: ffff9ac5ee456730
[82649.882679] RBP: ffff9ac5d9410760 R08: 0000000000000000 R09: 000000000000003f
[82649.882679] R10: 0000000000000000 R11: 0000000000000000 R12: ffff9ac5d9410b80
[82649.882679] R13: ffff9ac5d9410760 R14: ffff9ac5d9410ee8 R15: ffff9ac5db5aaab0
[82649.882680] FS:  0000000000000000(0000) GS:ffff9ac5ee440000(0000) knlGS:0000000000000000
[82649.882681] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[82649.882681] CR2: 00007f642f792000 CR3: 000000027040a006 CR4: 00000000003606e0
[82649.882682] Call Trace:
[82649.882689]  ieee80211_do_stop+0x4f6/0x820 [mac80211]
[82649.882696]  cfg80211_stop_p2p_device+0x65/0x180 [cfg80211]
[82649.882702]  cfg80211_shutdown_all_interfaces+0x8a/0xc0 [cfg80211]
[82649.882710]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[82649.882716]  wiphy_resume+0x5e/0x100 [cfg80211]
[82649.882721]  ? index_show+0x20/0x20 [cfg80211]
[82649.882722]  dpm_run_callback+0x4e/0x160
[82649.882723]  device_resume+0x97/0x190
[82649.882724]  async_resume+0x19/0x40
[82649.882725]  async_run_entry_fn+0x39/0x160
[82649.882726]  process_one_work+0x195/0x370
[82649.882727]  worker_thread+0x30/0x390
[82649.882728]  ? process_one_work+0x370/0x370
[82649.882729]  kthread+0x113/0x130
[82649.882730]  ? kthread_create_worker_on_cpu+0x70/0x70
[82649.882731]  ret_from_fork+0x35/0x40
[82649.882732] ---[ end trace 9ccc830fc3301931 ]---
[82649.882859] ------------[ cut here ]------------
[82649.882860] wlp2s0:  Failed check-sdata-in-driver check, flags: 0x0
[82649.882870] WARNING: CPU: 1 PID: 1042 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.h:19 drv_remove_interface+0xf5/0x100 [mac80211]
[82649.882870] Modules linked in: nfnetlink_queue nfnetlink_log nfnetlink uinput usbhid ctr ccm fuse rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat snd_soc_skl dell_wmi dell_laptop snd_soc_skl_ipc dell_smbios wmi_bmof dcdbas dell_wmi_descriptor snd_soc_sst_ipc intel_rapl snd_soc_sst_dsp btusb ath10k_pci btrtl btbcm btintel snd_hda_codec_realtek x86_pkg_temp_thermal ath10k_core snd_hda_ext_core intel_powerclamp snd_soc_acpi snd_hda_codec_generic snd_soc_core bluetooth ath coretemp kvm_intel mac80211 snd_compress drbg kvm ansi_cprng irqbypass snd_hda_intel crct10dif_pclmul crc32_pclmul snd_hda_codec cfg80211 ecdh_generic snd_hda_core snd_hwdep ghash_clmulni_intel efi_pstore intel_cstate snd_pcm_oss snd_mixer_oss intel_uncore intel_rapl_perf
[82649.882887]  snd_pcm snd_timer pcspkr uvcvideo serio_raw efivars snd videobuf2_vmalloc videobuf2_memops iTCO_wdt iTCO_vendor_support soundcore videobuf2_v4l2 videobuf2_common mei_me ucsi_acpi videodev tpm_crb processor_thermal_device rtsx_pci_ms typec_ucsi media rfkill memstick mei hid_multitouch idma64 intel_soc_dts_iosf intel_pch_thermal typec wmi battery tpm_tis tpm_tis_core evdev intel_hid tpm sparse_keymap int3403_thermal int340x_thermal_zone rng_core acpi_pad int3400_thermal acpi_thermal_rel ac pcc_cpufreq ecryptfs sunrpc drbd lru_cache parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c
[82649.882917]  crc32c_generic raid1 raid0 multipath linear md_mod hid_generic crc32c_intel rtsx_pci_sdmmc mmc_core i915 i2c_algo_bit aesni_intel nvme xhci_pci aes_x86_64 crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[82649.882926] CPU: 1 PID: 1042 Comm: kworker/u16:13 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[82649.882926] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[82649.882928] Workqueue: events_unbound async_run_entry_fn
[82649.882933] RIP: 0010:drv_remove_interface+0xf5/0x100 [mac80211]
[82649.882933] Code: 85 c0 75 e8 5b 5d 41 5c c3 48 8b b3 08 04 00 00 48 81 c3 28 04 00 00 48 c7 c7 38 fe 5d c1 48 85 f6 48 0f 44 f3 e8 1b 05 70 c9 <0f> 0b 5b 5d 41 5c c3 0f 1f 40 00 0f 1f 44 00 00 41 57 41 56 41 55 
[82649.882947] RSP: 0018:ffffbcc520e77c00 EFLAGS: 00010286
[82649.882948] RAX: 0000000000000000 RBX: ffff9ac5dbe7ece8 RCX: 0000000000000006
[82649.882948] RDX: 0000000000000007 RSI: 0000000000000092 RDI: ffff9ac5ee456730
[82649.882949] RBP: ffff9ac5d9410760 R08: 0000000000000000 R09: 0000000000000037
[82649.882949] R10: 0000000000000000 R11: 0000000000000000 R12: ffff9ac5d9410b80
[82649.882950] R13: ffff9ac5d9410760 R14: ffff9ac5d9410ee8 R15: ffff9ac5dbe7f370
[82649.882951] FS:  0000000000000000(0000) GS:ffff9ac5ee440000(0000) knlGS:0000000000000000
[82649.882951] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[82649.882952] CR2: 00007f642f792000 CR3: 000000027040a006 CR4: 00000000003606e0
[82649.882952] Call Trace:
[82649.882959]  ieee80211_do_stop+0x4f6/0x820 [mac80211]
[82649.882965]  ieee80211_stop+0x16/0x20 [mac80211]
[82649.882967]  __dev_close_many+0xa1/0x110
[82649.882968]  dev_close_many+0x9f/0x160
[82649.882969]  dev_close.part.93+0x64/0xa0
[82649.882975]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[82649.882982]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[82649.882988]  wiphy_resume+0x5e/0x100 [cfg80211]
[82649.882993]  ? index_show+0x20/0x20 [cfg80211]
[82649.882994]  dpm_run_callback+0x4e/0x160
[82649.882995]  device_resume+0x97/0x190
[82649.882996]  async_resume+0x19/0x40
[82649.882997]  async_run_entry_fn+0x39/0x160
[82649.882998]  process_one_work+0x195/0x370
[82649.882999]  worker_thread+0x30/0x390
[82649.883000]  ? process_one_work+0x370/0x370
[82649.883001]  kthread+0x113/0x130
[82649.883002]  ? kthread_create_worker_on_cpu+0x70/0x70
[82649.883003]  ret_from_fork+0x35/0x40
[82649.883004] ---[ end trace 9ccc830fc3301932 ]---
[82649.883014] WARNING: CPU: 1 PID: 1042 at /build/linux-hJelb7/linux-4.18.6/net/mac80211/driver-ops.c:39 drv_stop+0xe1/0xf0 [mac80211]
[82649.883014] Modules linked in: nfnetlink_queue nfnetlink_log nfnetlink uinput usbhid ctr ccm fuse rfcomm cmac bnep binfmt_misc algif_skcipher af_alg arc4 joydev snd_hda_codec_hdmi nls_ascii nls_cp437 vfat fat snd_soc_skl dell_wmi dell_laptop snd_soc_skl_ipc dell_smbios wmi_bmof dcdbas dell_wmi_descriptor snd_soc_sst_ipc intel_rapl snd_soc_sst_dsp btusb ath10k_pci btrtl btbcm btintel snd_hda_codec_realtek x86_pkg_temp_thermal ath10k_core snd_hda_ext_core intel_powerclamp snd_soc_acpi snd_hda_codec_generic snd_soc_core bluetooth ath coretemp kvm_intel mac80211 snd_compress drbg kvm ansi_cprng irqbypass snd_hda_intel crct10dif_pclmul crc32_pclmul snd_hda_codec cfg80211 ecdh_generic snd_hda_core snd_hwdep ghash_clmulni_intel efi_pstore intel_cstate snd_pcm_oss snd_mixer_oss intel_uncore intel_rapl_perf
[82649.883030]  snd_pcm snd_timer pcspkr uvcvideo serio_raw efivars snd videobuf2_vmalloc videobuf2_memops iTCO_wdt iTCO_vendor_support soundcore videobuf2_v4l2 videobuf2_common mei_me ucsi_acpi videodev tpm_crb processor_thermal_device rtsx_pci_ms typec_ucsi media rfkill memstick mei hid_multitouch idma64 intel_soc_dts_iosf intel_pch_thermal typec wmi battery tpm_tis tpm_tis_core evdev intel_hid tpm sparse_keymap int3403_thermal int340x_thermal_zone rng_core acpi_pad int3400_thermal acpi_thermal_rel ac pcc_cpufreq ecryptfs sunrpc drbd lru_cache parport_pc ppdev lp parport loop dm_crypt dm_mod efivarfs ip_tables x_tables autofs4 ext4 crc16 mbcache jbd2 fscrypto ecb btrfs zstd_decompress zstd_compress xxhash raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq libcrc32c
[82649.883047]  crc32c_generic raid1 raid0 multipath linear md_mod hid_generic crc32c_intel rtsx_pci_sdmmc mmc_core i915 i2c_algo_bit aesni_intel nvme xhci_pci aes_x86_64 crypto_simd drm_kms_helper cryptd glue_helper xhci_hcd psmouse i2c_i801 nvme_core rtsx_pci usbcore intel_lpss_pci drm intel_lpss usb_common i2c_hid thermal hid video button
[82649.883055] CPU: 1 PID: 1042 Comm: kworker/u16:13 Tainted: G        W         4.18.0-1-amd64 #1 Debian 4.18.6-1
[82649.883056] Hardware name: Dell Inc. XPS 13 9370/0F6P3V, BIOS 1.5.1 08/09/2018
[82649.883057] Workqueue: events_unbound async_run_entry_fn
[82649.883062] RIP: 0010:drv_stop+0xe1/0xf0 [mac80211]
[82649.883062] Code: 31 0a 00 48 85 ed 74 1d 48 8b 45 00 48 8b 7d 08 48 83 c5 18 48 89 de e8 8d 98 08 ca 48 8b 45 00 48 85 c0 75 e7 e9 58 ff ff ff <0f> 0b 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 55 
[82649.883076] RSP: 0018:ffffbcc520e77c08 EFLAGS: 00010246
[82649.883077] RAX: 0000000000000000 RBX: ffff9ac5d9410760 RCX: 0000000000000000
[82649.883077] RDX: ffff9ac5d2933d00 RSI: 0000000000000282 RDI: ffff9ac5d9410760
[82649.883078] RBP: ffff9ac5d9410ff0 R08: ffffbcc520e77b90 R09: 0000000000000000
[82649.883078] R10: ffffbcc520e77c10 R11: 0000000000000000 R12: ffff9ac5d9410b80
[82649.883079] R13: ffff9ac5d9410760 R14: ffff9ac5d9410ee8 R15: ffff9ac5dbe7f370
[82649.883080] FS:  0000000000000000(0000) GS:ffff9ac5ee440000(0000) knlGS:0000000000000000
[82649.883080] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[82649.883080] CR2: 00007f642f792000 CR3: 000000027040a006 CR4: 00000000003606e0
[82649.883081] Call Trace:
[82649.883087]  ieee80211_do_stop+0x4df/0x820 [mac80211]
[82649.883092]  ieee80211_stop+0x16/0x20 [mac80211]
[82649.883093]  __dev_close_many+0xa1/0x110
[82649.883094]  dev_close_many+0x9f/0x160
[82649.883095]  dev_close.part.93+0x64/0xa0
[82649.883101]  cfg80211_shutdown_all_interfaces+0x6d/0xc0 [cfg80211]
[82649.883107]  ieee80211_reconfig+0x256/0x12e0 [mac80211]
[82649.883113]  wiphy_resume+0x5e/0x100 [cfg80211]
[82649.883118]  ? index_show+0x20/0x20 [cfg80211]
[82649.883119]  dpm_run_callback+0x4e/0x160
[82649.883120]  device_resume+0x97/0x190
[82649.883121]  async_resume+0x19/0x40
[82649.883122]  async_run_entry_fn+0x39/0x160
[82649.883123]  process_one_work+0x195/0x370
[82649.883124]  worker_thread+0x30/0x390
[82649.883125]  ? process_one_work+0x370/0x370
[82649.883126]  kthread+0x113/0x130
[82649.883127]  ? kthread_create_worker_on_cpu+0x70/0x70
[82649.883128]  ret_from_fork+0x35/0x40
[82649.883129] ---[ end trace 9ccc830fc3301933 ]---
[82649.883190] dpm_run_callback(): wiphy_resume+0x0/0x100 [cfg80211] returns -110
[82649.883211] PM: Device phy0 failed to resume async: error -110
[82649.883684] OOM killer enabled.
[82649.883684] Restarting tasks ... done.
[82649.972821] PM: suspend exit

--=-=-=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--=-=-=--
