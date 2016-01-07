Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH7gg-0002Rz-BL
 for ath10k@lists.infradead.org; Thu, 07 Jan 2016 10:21:05 +0000
Received: by mail-wm0-x244.google.com with SMTP id u188so11250377wmu.0
 for <ath10k@lists.infradead.org>; Thu, 07 Jan 2016 02:20:37 -0800 (PST)
Received: from [10.0.0.32] ([185.120.126.128])
 by smtp.gmail.com with ESMTPSA id w73sm12844465wmw.21.2016.01.07.02.20.34
 for <ath10k@lists.infradead.org> (version=TLSv1/SSLv3 cipher=OTHER);
 Thu, 07 Jan 2016 02:20:35 -0800 (PST)
References: <11f83acf931f4ed38f078569eab59080@NALASEXR01G.na.qualcomm.com>
Subject: Re: Re: Qualcomm Atheros Device 0042 (rev 30)
From: vagner <vagnerrener@gmail.com>
Message-ID: <568E3BF1.4070007@gmail.com>
Date: Thu, 7 Jan 2016 12:20:33 +0200
MIME-Version: 1.0
In-Reply-To: <11f83acf931f4ed38f078569eab59080@NALASEXR01G.na.qualcomm.com>
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
To: ath10k@lists.infradead.org


I have tried this before and did not work :(

My dmesg is here:

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 4.3.0-1-amd64 
(debian-kernel@lists.debian.org) (gcc version 5.3.1 20160101 (Debian 
5.3.1-5) ) #1 SMP Debian 4.3.3-5 (2016-01-04)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.3.0-1-amd64 
root=UUID=9b688b36-f8c5-411b-abf3-f5cf5f78ca7e ro quiet
[    0.000000] x86/fpu: xstate_offset[2]: 0240, xstate_sizes[2]: 0100
[    0.000000] x86/fpu: xstate_offset[3]: 03c0, xstate_sizes[3]: 0040
[    0.000000] x86/fpu: xstate_offset[4]: 0400, xstate_sizes[4]: 0040
[    0.000000] x86/fpu: Supporting XSAVE feature 0x01: 'x87 floating 
point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x02: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x04: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x08: 'MPX bounds 
registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x10: 'MPX CSR'
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 
0x440 bytes, using 'standard' format.
[    0.000000] x86/fpu: Using 'eager' FPU context switches.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009e7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009e800-0x000000000009ffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000073c9dfff] usable
[    0.000000] BIOS-e820: [mem 0x0000000073c9e000-0x0000000073c9efff] 
ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000073c9f000-0x0000000073cc8fff] 
reserved
[    0.000000] BIOS-e820: [mem 0x0000000073cc9000-0x0000000073d78fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000073d79000-0x0000000074678fff] 
reserved
[    0.000000] BIOS-e820: [mem 0x0000000074679000-0x000000008558dfff] usable
[    0.000000] BIOS-e820: [mem 0x000000008558e000-0x0000000085f7dfff] 
reserved
[    0.000000] BIOS-e820: [mem 0x0000000085f7e000-0x0000000087f7dfff] 
ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000087f7e000-0x0000000087ffdfff] 
ACPI data
[    0.000000] BIOS-e820: [mem 0x0000000087ffe000-0x0000000087ffefff] usable
[    0.000000] BIOS-e820: [mem 0x0000000087fff000-0x00000000880fffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x0000000089000000-0x000000008c7fffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fd000000-0x00000000fe7fffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000feb00000-0x00000000feb03fff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed84000-0x00000000fed84fff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] 
reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffa10000-0x00000000ffffffff] 
reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000002727fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: LENOVO 80Q7/Paris 5A8, BIOS D5CN28WW 08/13/2015
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn = 0x272800 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-E7FFF write-protect
[    0.000000]   E8000-EFFFF write-combining
[    0.000000]   F0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 0000000000 mask 7C00000000 write-back
[    0.000000]   1 base 0087FFF000 mask 7FFFFFF000 uncachable
[    0.000000]   2 base 0088000000 mask 7FF8000000 uncachable
[    0.000000]   3 base 0090000000 mask 7FF0000000 uncachable
[    0.000000]   4 base 00A0000000 mask 7FE0000000 uncachable
[    0.000000]   5 base 00C0000000 mask 7FC0000000 uncachable
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000]   8 disabled
[    0.000000]   9 disabled
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC UC- WT
[    0.000000] e820: update [mem 0x87fff000-0xffffffff] usable ==> reserved
[    0.000000] e820: last_pfn = 0x87fff max_arch_pfn = 0x400000000
[    0.000000] found SMP MP-table at [mem 0x000fe1b0-0x000fe1bf] mapped 
at [ffff8800000fe1b0]
[    0.000000] Base memory trampoline at [ffff880000098000] 98000 size 24576
[    0.000000] Using GB pages for direct mapping
[    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
[    0.000000]  [mem 0x00000000-0x000fffff] page 4k
[    0.000000] BRK [0x01d24000, 0x01d24fff] PGTABLE
[    0.000000] BRK [0x01d25000, 0x01d25fff] PGTABLE
[    0.000000] BRK [0x01d26000, 0x01d26fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x272600000-0x2727fffff]
[    0.000000]  [mem 0x272600000-0x2727fffff] page 2M
[    0.000000] BRK [0x01d27000, 0x01d27fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x260000000-0x2725fffff]
[    0.000000]  [mem 0x260000000-0x2725fffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x240000000-0x25fffffff]
[    0.000000]  [mem 0x240000000-0x25fffffff] page 2M
[    0.000000] init_memory_mapping: [mem 0x00100000-0x73c9dfff]
[    0.000000]  [mem 0x00100000-0x001fffff] page 4k
[    0.000000]  [mem 0x00200000-0x73bfffff] page 2M
[    0.000000]  [mem 0x73c00000-0x73c9dfff] page 4k
[    0.000000] init_memory_mapping: [mem 0x73cc9000-0x73d78fff]
[    0.000000]  [mem 0x73cc9000-0x73d78fff] page 4k
[    0.000000] init_memory_mapping: [mem 0x74679000-0x8558dfff]
[    0.000000]  [mem 0x74679000-0x747fffff] page 4k
[    0.000000]  [mem 0x74800000-0x853fffff] page 2M
[    0.000000]  [mem 0x85400000-0x8558dfff] page 4k
[    0.000000] BRK [0x01d28000, 0x01d28fff] PGTABLE
[    0.000000] BRK [0x01d29000, 0x01d29fff] PGTABLE
[    0.000000] init_memory_mapping: [mem 0x87ffe000-0x87ffefff]
[    0.000000]  [mem 0x87ffe000-0x87ffefff] page 4k
[    0.000000] init_memory_mapping: [mem 0x100000000-0x23fffffff]
[    0.000000]  [mem 0x100000000-0x23fffffff] page 1G
[    0.000000] RAMDISK: [mem 0x376a2000-0x37b48fff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000FE020 000024 (v02 LENOVO)
[    0.000000] ACPI: XSDT 0x0000000087FCB188 0000EC (v01 LENOVO CB-01    
00000001      01000013)
[    0.000000] ACPI: FACP 0x0000000087FEB000 00010C (v05 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: DSDT 0x0000000087FD0000 016943 (v02 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: FACS 0x0000000087F4E000 000040
[    0.000000] ACPI: SSDT 0x0000000087FC9000 000E58 (v02 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FCA000 000B39 (v02 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FCC000 002BAE (v02 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FCF000 0002D4 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: MCFG 0x0000000087FE7000 00003C (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: APIC 0x0000000087FE8000 0000BC (v03 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: LPIT 0x0000000087FE9000 000094 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: HPET 0x0000000087FEA000 000038 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: DBGP 0x0000000087FEC000 000034 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: BOOT 0x0000000087FED000 000028 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: ASPT 0x0000000087FEE000 000034 (v07 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: ASF! 0x0000000087FEF000 0000A5 (v32 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: DBG2 0x0000000087FF0000 000054 (v00 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: DBGP 0x0000000087FF1000 000034 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FF2000 0030B3 (v02 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: POAT 0x0000000087FF6000 000055 (v03 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: TPM2 0x0000000087FF7000 000034 (v03 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FF8000 00004B (v02 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: SSDT 0x0000000087FF9000 0004B7 (v02 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: UEFI 0x0000000087FFA000 000042 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: UEFI 0x0000000087FFB000 000236 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: TCPA 0x0000000087FFC000 000032 (v02 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: DMAR 0x0000000087FC8000 0000A8 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: FPDT 0x0000000087FC7000 000044 (v01 LENOVO CB-01    
00000001 ACPI 00040000)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at [mem 0x0000000000000000-0x00000002727fffff]
[    0.000000] NODE_DATA(0) allocated [mem 0x2727f8000-0x2727fbfff]
[    0.000000]  [ffffea0000000000-ffffea0009dfffff] PMD -> 
[ffff880269e00000-ffff880271dfffff] on node 0
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000002727fffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009dfff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x0000000073c9dfff]
[    0.000000]   node   0: [mem 0x0000000073cc9000-0x0000000073d78fff]
[    0.000000]   node   0: [mem 0x0000000074679000-0x000000008558dfff]
[    0.000000]   node   0: [mem 0x0000000087ffe000-0x0000000087ffefff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x00000002727fffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000000001000-0x00000002727fffff]
[    0.000000] On node 0 totalpages: 2061313
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3997 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 8434 pages used for memmap
[    0.000000]   DMA32 zone: 539748 pages, LIFO batch:31
[    0.000000]   Normal zone: 23712 pages used for memmap
[    0.000000]   Normal zone: 1517568 pages, LIFO batch:31
[    0.000000] Reserving Intel graphics stolen memory at 
0x8a800000-0x8c7fffff
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
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 
0-119
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] smpboot: Allowing 8 CPUs, 4 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009efff]
[    0.000000] PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x73c9e000-0x73c9efff]
[    0.000000] PM: Registered nosave memory: [mem 0x73c9f000-0x73cc8fff]
[    0.000000] PM: Registered nosave memory: [mem 0x73d79000-0x74678fff]
[    0.000000] PM: Registered nosave memory: [mem 0x8558e000-0x85f7dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x85f7e000-0x87f7dfff]
[    0.000000] PM: Registered nosave memory: [mem 0x87f7e000-0x87ffdfff]
[    0.000000] PM: Registered nosave memory: [mem 0x87fff000-0x880fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x88100000-0x88ffffff]
[    0.000000] PM: Registered nosave memory: [mem 0x89000000-0x8c7fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x8c800000-0xdfffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xf0000000-0xfcffffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfd000000-0xfe7fffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfe800000-0xfeafffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfeb00000-0xfeb03fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfeb04000-0xfebfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfec01000-0xfecfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed01000-0xfed0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed1a000-0xfed83fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed84000-0xfed84fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfed85000-0xfedfffff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.000000] PM: Registered nosave memory: [mem 0xfee01000-0xffa0ffff]
[    0.000000] PM: Registered nosave memory: [mem 0xffa10000-0xffffffff]
[    0.000000] e820: [mem 0x8c800000-0xdfffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.000000] setup_percpu: NR_CPUS:512 nr_cpumask_bits:512 
nr_cpu_ids:8 nr_node_ids:1
[    0.000000] PERCPU: Embedded 32 pages/cpu @ffff880272400000 s93016 
r8192 d29864 u262144
[    0.000000] pcpu-alloc: s93016 r8192 d29864 u262144 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  
Total pages: 2029082
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: 
BOOT_IMAGE=/boot/vmlinuz-4.3.0-1-amd64 
root=UUID=9b688b36-f8c5-411b-abf3-f5cf5f78ca7e ro quiet
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.000000] Memory: 8028492K/8245252K available (5671K kernel code, 
1049K rwdata, 2792K rodata, 1296K init, 836K bss, 216760K reserved, 0K 
cma-reserved)
[    0.000000] Hierarchical RCU implementation.
[    0.000000]     Build-time adjustment of leaf fanout to 64.
[    0.000000]     RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=8.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=8
[    0.000000] NR_IRQS:33024 nr_irqs:2048 16
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 79635855245 ns
[    0.000000] hpet clockevent registered
[    0.000000] tsc: Unable to calibrate against PIT
[    0.000000] tsc: using HPET reference calibration
[    0.000000] tsc: Detected 2400.048 MHz processor
[    0.000030] Calibrating delay loop (skipped), value calculated using 
timer frequency.. 4800.09 BogoMIPS (lpj=9600192)
[    0.000032] pid_max: default: 32768 minimum: 301
[    0.000038] ACPI: Core revision 20150818
[    0.027302] ACPI: 8 ACPI AML tables successfully acquired and loaded
[    0.027326] Security Framework initialized
[    0.027327] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.027333] AppArmor: AppArmor disabled by boot time parameter
[    0.027831] Dentry cache hash table entries: 1048576 (order: 11, 
8388608 bytes)
[    0.029406] Inode-cache hash table entries: 524288 (order: 10, 
4194304 bytes)
[    0.030071] Mount-cache hash table entries: 16384 (order: 5, 131072 
bytes)
[    0.030080] Mountpoint-cache hash table entries: 16384 (order: 5, 
131072 bytes)
[    0.030274] Initializing cgroup subsys io
[    0.030278] Initializing cgroup subsys memory
[    0.030283] Initializing cgroup subsys devices
[    0.030285] Initializing cgroup subsys freezer
[    0.030287] Initializing cgroup subsys net_cls
[    0.030289] Initializing cgroup subsys perf_event
[    0.030291] Initializing cgroup subsys net_prio
[    0.030317] CPU: Physical Processor ID: 0
[    0.030318] CPU: Processor Core ID: 0
[    0.031578] mce: CPU supports 8 MCE banks
[    0.031595] CPU0: Thermal monitoring enabled (TM1)
[    0.031604] process: using mwait in idle threads
[    0.031606] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.031607] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.031938] Freeing SMP alternatives memory: 20K (ffffffff81c4c000 - 
ffffffff81c51000)
[    0.034940] ftrace: allocating 23601 entries in 93 pages
[    0.044046] DMAR: Host address width 39
[    0.044048] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.044054] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 
1c0000c40660462 ecap 7e3ff0505e
[    0.044056] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.044060] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap 
d2008c40660462 ecap f050da
[    0.044061] DMAR: RMRR base: 0x00000085e7a000 end: 0x00000085e99fff
[    0.044063] DMAR: RMRR base: 0x0000008a000000 end: 0x0000008c7fffff
[    0.044065] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.044066] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[    0.044067] DMAR-IR: x2apic is disabled because BIOS sets x2apic opt 
out bit.
[    0.044068] DMAR-IR: Use 'intremap=no_x2apic_optout' to override the 
BIOS setting.
[    0.045497] DMAR-IR: Enabled IRQ remapping in xapic mode
[    0.045498] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.049532] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.089256] TSC deadline timer enabled
[    0.089261] smpboot: CPU0: Intel(R) Core(TM) i5-6200U CPU @ 2.30GHz 
(family: 0x6, model: 0x4e, stepping: 0x3)
[    0.089286] Performance Events: PEBS fmt3+, 32-deep LBR, Skylake 
events, full-width counters, Intel PMU driver.
[    0.089316] ... version:                4
[    0.089317] ... bit width:              48
[    0.089318] ... generic registers:      4
[    0.089318] ... value mask:             0000ffffffffffff
[    0.089319] ... max period:             0000ffffffffffff
[    0.089320] ... fixed-purpose events:   3
[    0.089321] ... event mask:             000000070000000f
[    0.089864] x86: Booting SMP configuration:
[    0.089866] .... node  #0, CPUs:      #1
[    0.104344] NMI watchdog: enabled on all CPUs, permanently consumes 
one hw-PMU counter.
[    0.104412]  #2 #3
[    0.133310] x86: Booted up 1 node, 4 CPUs
[    0.133313] smpboot: Total of 4 processors activated (19200.38 BogoMIPS)
[    0.137183] devtmpfs: initialized
[    0.139320] PM: Registering ACPI NVS region [mem 
0x73c9e000-0x73c9efff] (4096 bytes)
[    0.139322] PM: Registering ACPI NVS region [mem 
0x85f7e000-0x87f7dfff] (33554432 bytes)
[    0.139971] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.140055] pinctrl core: initialized pinctrl subsystem
[    0.140188] NET: Registered protocol family 16
[    0.149016] cpuidle: using governor ladder
[    0.165041] cpuidle: using governor menu
[    0.165088] Simple Boot Flag at 0x44 set to 0x1
[    0.165136] ACPI: bus type PCI registered
[    0.165138] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.165224] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 
0xe0000000-0xefffffff] (base 0xe0000000)
[    0.165227] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.165230] pmd_set_huge: Cannot satisfy [mem 0xe0000000-0xe0200000] 
with a huge-page mapping due to MTRR override.
[    0.165482] PCI: Using configuration type 1 for base access
[    0.177388] ACPI: Added _OSI(Module Device)
[    0.177390] ACPI: Added _OSI(Processor Device)
[    0.177391] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.177392] ACPI: Added _OSI(Processor Aggregator Device)
[    0.183571] ACPI: Executed 17 blocks of module-level executable AML code
[    0.188000] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
[    0.191786] ACPI: Dynamic OEM Table Load:
[    0.191797] ACPI: SSDT 0xFFFF880268743C00 00037F (v02 PmRef Cpu0Cst  
00003001 INTL 20121220)
[    0.192577] ACPI: Dynamic OEM Table Load:
[    0.192587] ACPI: SSDT 0xFFFF88026989D800 00061E (v02 PmRef Cpu0Ist  
00003000 INTL 20121220)
[    0.194445] ACPI: Dynamic OEM Table Load:
[    0.194455] ACPI: SSDT 0xFFFF88026989D000 0005AA (v02 PmRef ApIst    
00003000 INTL 20121220)
[    0.195457] ACPI: Dynamic OEM Table Load:
[    0.195465] ACPI: SSDT 0xFFFF8802698DEE00 000119 (v02 PmRef ApCst    
00003000 INTL 20121220)
[    0.197975] ACPI : EC: EC started
[    0.200984] ACPI: Interpreter enabled
[    0.200994] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep 
State [\_S1_] (20150818/hwxface-580)
[    0.201003] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep 
State [\_S2_] (20150818/hwxface-580)
[    0.201030] ACPI: (supports S0 S3 S4 S5)
[    0.201031] ACPI: Using IOAPIC for interrupt routing
[    0.201067] PCI: Using host bridge windows from ACPI; if necessary, 
use "pci=nocrs" and report a bug
[    0.217804] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.217809] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM 
ClockPM Segments MSI]
[    0.220216] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME 
AER PCIeCapability]
[    0.221800] PCI host bridge to bus 0000:00
[    0.221803] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.221805] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.221807] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.221808] pci_bus 0000:00: root bus resource [mem 
0x000a0000-0x000bffff window]
[    0.221810] pci_bus 0000:00: root bus resource [mem 
0x8c800000-0xdfffffff window]
[    0.221811] pci_bus 0000:00: root bus resource [mem 
0xfd000000-0xfe7fffff window]
[    0.221819] pci 0000:00:00.0: [8086:1904] type 00 class 0x060000
[    0.222422] pci 0000:00:02.0: [8086:1916] type 00 class 0x030000
[    0.222436] pci 0000:00:02.0: reg 0x10: [mem 0xa0000000-0xa0ffffff 64bit]
[    0.222443] pci 0000:00:02.0: reg 0x18: [mem 0x90000000-0x9fffffff 
64bit pref]
[    0.222447] pci 0000:00:02.0: reg 0x20: [io  0x4000-0x403f]
[    0.223108] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
[    0.223139] pci 0000:00:14.0: reg 0x10: [mem 0xa1300000-0xa130ffff 64bit]
[    0.223196] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.223779] pci 0000:00:14.0: System wakeup disabled by ACPI
[    0.223820] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
[    0.223849] pci 0000:00:14.2: reg 0x10: [mem 0xa132a000-0xa132afff 64bit]
[    0.224490] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
[    0.224527] pci 0000:00:16.0: reg 0x10: [mem 0xa132b000-0xa132bfff 64bit]
[    0.224586] pci 0000:00:16.0: PME# supported from D3hot
[    0.225206] pci 0000:00:17.0: [8086:9d03] type 00 class 0x010601
[    0.225232] pci 0000:00:17.0: reg 0x10: [mem 0xa1328000-0xa1329fff]
[    0.225241] pci 0000:00:17.0: reg 0x14: [mem 0xa132e000-0xa132e0ff]
[    0.225249] pci 0000:00:17.0: reg 0x18: [io  0x4080-0x4087]
[    0.225258] pci 0000:00:17.0: reg 0x1c: [io  0x4088-0x408b]
[    0.225266] pci 0000:00:17.0: reg 0x20: [io  0x4060-0x407f]
[    0.225274] pci 0000:00:17.0: reg 0x24: [mem 0xa132c000-0xa132c7ff]
[    0.225305] pci 0000:00:17.0: PME# supported from D3hot
[    0.225929] pci 0000:00:1c.0: [8086:9d14] type 01 class 0x060400
[    0.225989] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.226585] pci 0000:00:1c.0: System wakeup disabled by ACPI
[    0.226634] pci 0000:00:1c.5: [8086:9d15] type 01 class 0x060400
[    0.226695] pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
[    0.227292] pci 0000:00:1c.5: System wakeup disabled by ACPI
[    0.227342] pci 0000:00:1f.0: [8086:9d48] type 00 class 0x060100
[    0.228044] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
[    0.228059] pci 0000:00:1f.2: reg 0x10: [mem 0xa1324000-0xa1327fff]
[    0.228713] pci 0000:00:1f.3: [8086:9d70] type 00 class 0x040300
[    0.228752] pci 0000:00:1f.3: reg 0x10: [mem 0xa1320000-0xa1323fff 64bit]
[    0.228787] pci 0000:00:1f.3: reg 0x20: [mem 0xa1310000-0xa131ffff 64bit]
[    0.228820] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.231805] pci 0000:00:1f.3: System wakeup disabled by ACPI
[    0.231847] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
[    0.231901] pci 0000:00:1f.4: reg 0x10: [mem 0xa132d000-0xa132d0ff 64bit]
[    0.231971] pci 0000:00:1f.4: reg 0x20: [io  0x4040-0x405f]
[    0.232691] pci 0000:01:00.0: [10ec:8168] type 00 class 0x020000
[    0.232731] pci 0000:01:00.0: reg 0x10: [io  0x3000-0x30ff]
[    0.232760] pci 0000:01:00.0: reg 0x18: [mem 0xa1204000-0xa1204fff 64bit]
[    0.232778] pci 0000:01:00.0: reg 0x20: [mem 0xa1200000-0xa1203fff 64bit]
[    0.232843] pci 0000:01:00.0: supports D1 D2
[    0.232844] pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.232887] pci 0000:01:00.0: System wakeup disabled by ACPI
[    0.241369] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.241372] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.241375] pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
[    0.241678] pci 0000:02:00.0: [168c:0042] type 00 class 0x028000
[    0.242128] pci 0000:02:00.0: reg 0x10: [mem 0xa1000000-0xa11fffff 64bit]
[    0.243251] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.243598] pci 0000:02:00.0: System wakeup disabled by ACPI
[    0.253530] pci 0000:00:1c.5: PCI bridge to [bus 02]
[    0.253534] pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
[    0.254836] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 10 *11 12 
14 15)
[    0.254889] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 *10 11 12 
14 15)
[    0.254938] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 10 *11 12 
14 15)
[    0.254987] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 10 *11 12 
14 15)
[    0.255036] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 10 *11 12 
14 15)
[    0.255084] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 10 *11 12 
14 15)
[    0.255132] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 10 *11 12 
14 15)
[    0.255180] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 10 *11 12 
14 15)
[    0.255462] platform MSFT0101:00: failed to claim resource 1
[    0.255524] acpi MSFT0101:00: platform device creation failed: -16
[    0.256626] ACPI: Enabled 5 GPEs in block 00 to 7F
[    0.256718] ACPI : EC: GPE = 0x4f, I/O: command/status = 0x66, data = 
0x62
[    0.256817] vgaarb: setting as boot device: PCI:0000:00:02.0
[    0.256819] vgaarb: device added: 
PCI:0000:00:02.0,decodes=io+mem,owns=io+mem,locks=none
[    0.256821] vgaarb: loaded
[    0.256822] vgaarb: bridge control possible 0000:00:02.0
[    0.256933] PCI: Using ACPI for IRQ routing
[    0.285037] PCI: pci_cache_line_size set to 64 bytes
[    0.285356] e820: reserve RAM buffer [mem 0x0009e800-0x0009ffff]
[    0.285357] e820: reserve RAM buffer [mem 0x73c9e000-0x73ffffff]
[    0.285358] e820: reserve RAM buffer [mem 0x73d79000-0x73ffffff]
[    0.285359] e820: reserve RAM buffer [mem 0x8558e000-0x87ffffff]
[    0.285361] e820: reserve RAM buffer [mem 0x87fff000-0x87ffffff]
[    0.285362] e820: reserve RAM buffer [mem 0x272800000-0x273ffffff]
[    0.285531] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.285536] hpet0: 8 comparators, 64-bit 24.000000 MHz counter
[    0.287581] clocksource: Switched to clocksource hpet
[    0.292426] pnp: PnP ACPI init
[    0.292522] system 00:00: [mem 0xfd000000-0xfdabffff] has been reserved
[    0.292524] system 00:00: [mem 0xfdad0000-0xfdadffff] has been reserved
[    0.292526] system 00:00: [mem 0xfdb00000-0xfdffffff] has been reserved
[    0.292527] system 00:00: [mem 0xfe000000-0xfe01ffff] has been reserved
[    0.292529] system 00:00: [mem 0xfe036000-0xfe03bfff] has been reserved
[    0.292530] system 00:00: [mem 0xfe03d000-0xfe3fffff] has been reserved
[    0.292532] system 00:00: [mem 0xfe410000-0xfe7fffff] has been reserved
[    0.292535] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.293098] system 00:01: [io  0x0680-0x069f] has been reserved
[    0.293100] system 00:01: [io  0xffff] has been reserved
[    0.293101] system 00:01: [io  0xffff] has been reserved
[    0.293103] system 00:01: [io  0xffff] has been reserved
[    0.293105] system 00:01: [io  0x1800-0x18fe] could not be reserved
[    0.293106] system 00:01: [io  0x164e-0x164f] has been reserved
[    0.293108] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.293198] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.293234] system 00:03: [io  0x1854-0x1857] has been reserved
[    0.293236] system 00:03: Plug and Play ACPI device, IDs INT3f0d 
PNP0c02 (active)
[    0.293261] pnp 00:04: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.293284] pnp 00:05: Plug and Play ACPI device, IDs ETD0642 ETD0000 
PNP0f13 (active)
[    0.294291] system 00:06: [mem 0xfe029000-0xfe029fff] has been reserved
[    0.294293] system 00:06: [mem 0xfe028000-0xfe028fff] has been reserved
[    0.294294] system 00:06: [mem 0xfdaf0000-0xfdafffff] has been reserved
[    0.294296] system 00:06: [mem 0xfdae0000-0xfdaeffff] has been reserved
[    0.294297] system 00:06: [mem 0xfdac0000-0xfdacffff] has been reserved
[    0.294299] system 00:06: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.294748] system 00:07: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.294750] system 00:07: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.294751] system 00:07: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.294753] system 00:07: [mem 0xe0000000-0xefffffff] has been reserved
[    0.294755] system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.294756] system 00:07: [mem 0xfed90000-0xfed93fff] could not be 
reserved
[    0.294758] system 00:07: [mem 0xfed45000-0xfed8ffff] could not be 
reserved
[    0.294760] system 00:07: [mem 0xff000000-0xffffffff] could not be 
reserved
[    0.294761] system 00:07: [mem 0xfee00000-0xfeefffff] could not be 
reserved
[    0.294763] system 00:07: [mem 0x8c800000-0x8c81ffff] has been reserved
[    0.294765] system 00:07: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.295979] pnp: PnP ACPI: found 8 devices
[    0.304397] clocksource: acpi_pm: mask: 0xffffff max_cycles: 
0xffffff, max_idle_ns: 2085701024 ns
[    0.304417] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.304420] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3fff]
[    0.304424] pci 0000:00:1c.0:   bridge window [mem 0xa1200000-0xa12fffff]
[    0.304430] pci 0000:00:1c.5: PCI bridge to [bus 02]
[    0.304434] pci 0000:00:1c.5:   bridge window [mem 0xa1000000-0xa11fffff]
[    0.304441] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.304443] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.304444] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff 
window]
[    0.304446] pci_bus 0000:00: resource 7 [mem 0x8c800000-0xdfffffff 
window]
[    0.304447] pci_bus 0000:00: resource 8 [mem 0xfd000000-0xfe7fffff 
window]
[    0.304448] pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
[    0.304450] pci_bus 0000:01: resource 1 [mem 0xa1200000-0xa12fffff]
[    0.304451] pci_bus 0000:02: resource 1 [mem 0xa1000000-0xa11fffff]
[    0.304605] NET: Registered protocol family 2
[    0.304787] TCP established hash table entries: 65536 (order: 7, 
524288 bytes)
[    0.304918] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.305021] TCP: Hash tables configured (established 65536 bind 65536)
[    0.305042] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    0.305067] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    0.305179] NET: Registered protocol family 1
[    0.305193] pci 0000:00:02.0: Video device with shadowed ROM
[    0.306756] PCI: CLS 64 bytes, default 64
[    0.306795] Unpacking initramfs...
[    0.388910] Freeing initrd memory: 4764K (ffff8800376a2000 - 
ffff880037b49000)
[    0.388931] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.388934] software IO TLB [mem 0x8158e000-0x8558e000] (64MB) mapped 
at [ffff88008158e000-ffff88008558dfff]
[    0.389067] microcode: CPU0 sig=0x406e3, pf=0x80, revision=0x33
[    0.389079] microcode: CPU1 sig=0x406e3, pf=0x80, revision=0x33
[    0.389083] microcode: CPU2 sig=0x406e3, pf=0x80, revision=0x33
[    0.389092] microcode: CPU3 sig=0x406e3, pf=0x80, revision=0x33
[    0.389134] microcode: Microcode Update Driver: v2.00 
<tigran@aivazian.fsnet.co.uk>, Peter Oruba
[    0.389462] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.389506] audit: initializing netlink subsys (disabled)
[    0.389519] audit: type=2000 audit(1452160340.400:1): initialized
[    0.389893] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.389910] zbud: loaded
[    0.390097] VFS: Disk quotas dquot_6.6.0
[    0.390133] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 
bytes)
[    0.390978] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 250)
[    0.391047] io scheduler noop registered
[    0.391049] io scheduler deadline registered
[    0.391082] io scheduler cfq registered (default)
[    0.391776] pcieport 0000:00:1c.0: Signaling PME through PCIe PME 
interrupt
[    0.391778] pci 0000:01:00.0: Signaling PME through PCIe PME interrupt
[    0.391781] pcie_pme 0000:00:1c.0:pcie01: service driver pcie_pme loaded
[    0.391798] pcieport 0000:00:1c.5: Signaling PME through PCIe PME 
interrupt
[    0.391799] pci 0000:02:00.0: Signaling PME through PCIe PME interrupt
[    0.391802] pcie_pme 0000:00:1c.5:pcie01: service driver pcie_pme loaded
[    0.391808] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.391814] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    0.391834] intel_idle: MWAIT substates: 0x11142120
[    0.391835] intel_idle: v0.4 model 0x4E
[    0.391836] intel_idle: lapic_timer_reliable_states 0xffffffff
[    0.392090] GHES: HEST is not enabled!
[    0.392179] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.392725] Linux agpgart interface v0.103
[    0.392769] AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    0.392770] AMD IOMMUv2 functionality not available on this system
[    0.393204] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] 
at 0x60,0x64 irq 1,12
[    0.409304] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.409308] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.409479] mousedev: PS/2 mouse device common for all mice
[    0.409541] rtc_cmos 00:02: RTC can wake from S4
[    0.410353] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    0.410434] rtc_cmos 00:02: alarms up to one month, y3k, 242 bytes 
nvram, hpet irqs
[    0.410445] Intel P-state driver initializing.
[    0.410458] intel_pstate: HWP enabled
[    0.410592] intel_pstate: HWP enabled
[    0.410726] intel_pstate: HWP enabled
[    0.410840] intel_pstate: HWP enabled
[    0.410932] ledtrig-cpu: registered to indicate activity on CPUs
[    0.411495] NET: Registered protocol family 10
[    0.411794] mip6: Mobile IPv6
[    0.411798] NET: Registered protocol family 17
[    0.411804] mpls_gso: MPLS GSO support
[    0.412199] registered taskstats version 1
[    0.412224] zswap: loaded using pool lzo/zbud
[    0.415231] rtc_cmos 00:02: setting system clock to 2016-01-07 
09:52:20 UTC (1452160340)
[    0.415300] PM: Hibernation image not present or could not be loaded.
[    0.415673] Freeing unused kernel memory: 1296K (ffffffff81b08000 - 
ffffffff81c4c000)
[    0.415674] Write protecting the kernel read-only data: 10240k
[    0.416095] Freeing unused kernel memory: 460K (ffff88000158d000 - 
ffff880001600000)
[    0.416393] Freeing unused kernel memory: 1304K (ffff8800018ba000 - 
ffff880001a00000)
[    0.419092] input: AT Translated Set 2 keyboard as 
/devices/platform/i8042/serio0/input/input0
[    0.425229] random: systemd-udevd urandom read with 3 bits of entropy 
available
[    0.457268] SCSI subsystem initialized
[    0.458424] libata version 3.00 loaded.
[    0.459245] ahci 0000:00:17.0: version 3.0
[    0.471832] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 2 ports 6 Gbps 
0x3 impl SATA mode
[    0.471837] ahci 0000:00:17.0: flags: 64bit ncq pm led clo only pio 
slum part deso sadm sds apst
[    0.472315] scsi host0: ahci
[    0.472482] scsi host1: ahci
[    0.472532] ata1: SATA max UDMA/133 abar m2048@0xa132c000 port 
0xa132c100 irq 124
[    0.472546] ata2: SATA max UDMA/133 abar m2048@0xa132c000 port 
0xa132c180 irq 124
[    0.800225] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    0.804249] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    0.804292] ata2.00: ATAPI: MATSHITA DVD-RAM UJ8HC, G801, max UDMA/100
[    0.805764] ata1.00: ATA-8: HGST HTS545050A7E660, GR2ZB230, max UDMA/133
[    0.805772] ata1.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 
31/32), AA
[    0.807438] ata1.00: configured for UDMA/133
[    0.808157] scsi 0:0:0:0: Direct-Access     ATA      HGST HTS545050A7 
B230 PQ: 0 ANSI: 5
[    0.811542] ata2.00: configured for UDMA/100
[    0.820668] scsi 1:0:0:0: CD-ROM            MATSHITA DVD-RAM UJ8HC    
G801 PQ: 0 ANSI: 5
[    0.834118] sd 0:0:0:0: [sda] 976773168 512-byte logical blocks: (500 
GB/465 GiB)
[    0.834125] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    0.834309] sd 0:0:0:0: [sda] Write Protect is off
[    0.834318] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    0.834370] sd 0:0:0:0: [sda] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    1.141767]  sda: sda1 sda2 < sda5 > sda3
[    1.143546] sd 0:0:0:0: [sda] Attached SCSI disk
[    1.388679] tsc: Refined TSC clocksource calibration: 2399.999 MHz
[    1.388689] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 
0x2298364cab5, max_idle_ns: 440795214892 ns
[    1.684334] PM: Starting manual resume from disk
[    1.684344] PM: Hibernation image partition 8:5 present
[    1.684347] PM: Looking for hibernation image.
[    1.684561] PM: Image not found (code -22)
[    1.684564] PM: Hibernation image not present or could not be loaded.
[    1.827919] EXT4-fs (sda1): mounted filesystem with ordered data 
mode. Opts: (null)
[    2.389765] clocksource: Switched to clocksource tsc
[    2.667879] random: nonblocking pool is initialized
[    2.700505] systemd[1]: Failed to insert module 'kdbus': Function not 
implemented
[    2.842616] systemd[1]: systemd 228 running in system mode. (+PAM 
+AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP 
+GCRYPT +GNUTLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN)
[    2.842977] systemd[1]: Detected architecture x86-64.
[    2.854145] systemd[1]: Set hostname to <cyberwarrior>.
[    4.754887] systemd[1]: NetworkManager-wait-online.service: Cannot 
add dependency job, ignoring: Unit NetworkManager-wait-online.service 
failed to load: No such file or directory.
[    4.756746] systemd[1]: Listening on Syslog Socket.
[    4.756972] systemd[1]: Listening on Journal Socket (/dev/log).
[    4.757102] systemd[1]: Started Forward Password Requests to Wall 
Directory Watch.
[    4.757415] systemd[1]: Created slice User and Session Slice.
[    4.757503] systemd[1]: Listening on udev Kernel Socket.
[    4.757537] systemd[1]: Reached target User and Group Name Lookups.
[    4.757566] systemd[1]: Reached target Encrypted Volumes.
[    4.757635] systemd[1]: Listening on fsck to fsckd communication Socket.
[    4.757717] systemd[1]: Listening on /dev/initctl Compatibility Named 
Pipe.
[    4.757952] systemd[1]: Listening on Journal Audit Socket.
[    4.758208] systemd[1]: Set up automount Arbitrary Executable File 
Formats File System Automount Point.
[    4.758262] systemd[1]: Created slice System Slice.
[    4.758273] systemd[1]: Reached target Slices.
[    4.758323] systemd[1]: Created slice system-getty.slice.
[    4.758370] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[    4.758395] systemd[1]: Listening on udev Control Socket.
[    4.758402] systemd[1]: Reached target Remote File Systems (Pre).
[    4.758407] systemd[1]: Reached target Remote File Systems.
[    4.758432] systemd[1]: Started Dispatch Password Requests to Console 
Directory Watch.
[    4.758453] systemd[1]: Listening on Journal Socket.
[    4.758752] systemd[1]: Starting Create list of required static 
device nodes for the current kernel...
[    4.806664] systemd[1]: Starting Load Kernel Modules...
[    4.808211] systemd[1]: Mounting POSIX Message Queue File System...
[    4.809877] systemd[1]: Starting Nameserver information manager...
[    4.811416] systemd[1]: Mounting Huge Pages File System...
[    4.812999] systemd[1]: Starting LSB: Prepare console...
[    4.814548] systemd[1]: Starting Journal Service...
[    4.815411] systemd[1]: Mounting Debug File System...
[    5.031624] systemd[1]: Started Create list of required static device 
nodes for the current kernel.
[    5.033697] systemd[1]: Starting Create Static Device Nodes in /dev...
[    5.353762] systemd[1]: Started Journal Service.
[    5.468699] lp: driver loaded but no devices found
[    5.496598] ppdev: user-space parallel port driver
[    5.931785] ACPI: bus type USB registered
[    5.931923] usbcore: registered new interface driver usbfs
[    5.932012] usbcore: registered new interface driver hub
[    5.932109] usbcore: registered new device driver usb
[    6.259878] usbcore: registered new interface driver ath9k_htc
[    7.631990] cfg80211: World regulatory domain updated:
[    7.632002] cfg80211:  DFS Master region: unset
[    7.632007] cfg80211:   (start_freq - end_freq @ bandwidth), 
(max_antenna_gain, max_eirp), (dfs_cac_time)
[    7.632017] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), 
(N/A, 2000 mBm), (N/A)
[    7.632024] cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), 
(N/A, 2000 mBm), (N/A)
[    7.632029] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), 
(N/A, 2000 mBm), (N/A)
[    7.632036] cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 
160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
[    7.632043] cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 
160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
[    7.632049] cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), 
(N/A, 2000 mBm), (0 s)
[    7.632054] cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), 
(N/A, 2000 mBm), (N/A)
[    7.632060] cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), 
(N/A, 0 mBm), (N/A)
[    8.970925] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
[    9.056192] systemd-journald[170]: Received request to flush runtime 
journal from PID 1
[    9.235570] ACPI: AC Adapter [ADP0] (on-line)
[    9.235659] input: Lid Switch as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
[    9.235708] ACPI: Lid Switch [LID0]
[    9.235742] input: Power Button as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input3
[    9.235744] ACPI: Power Button [PWRB]
[    9.235773] input: Power Button as 
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
[    9.235775] ACPI: Power Button [PWRF]
[    9.289454] tpm_crb MSFT0101:00: ioremap of the command buffer failed
[    9.289521] tpm_crb: probe of MSFT0101:00 failed with error -12
[    9.373522] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    9.373533] xhci_hcd 0000:00:14.0: new USB bus registered, assigned 
bus number 1
[    9.374641] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 
0x100 quirks 0x00109810
[    9.374649] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
[    9.375051] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    9.375056] usb usb1: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    9.375059] usb usb1: Product: xHCI Host Controller
[    9.375061] usb usb1: Manufacturer: Linux 4.3.0-1-amd64 xhci-hcd
[    9.375064] usb usb1: SerialNumber: 0000:00:14.0
[    9.375296] hub 1-0:1.0: USB hub found
[    9.375321] hub 1-0:1.0: 12 ports detected
[    9.380736] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    9.380743] xhci_hcd 0000:00:14.0: new USB bus registered, assigned 
bus number 2
[    9.380789] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
[    9.380792] usb usb2: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    9.380794] usb usb2: Product: xHCI Host Controller
[    9.380797] usb usb2: Manufacturer: Linux 4.3.0-1-amd64 xhci-hcd
[    9.380799] usb usb2: SerialNumber: 0000:00:14.0
[    9.381003] hub 2-0:1.0: USB hub found
[    9.381021] hub 2-0:1.0: 6 ports detected
[    9.382592] usb: failed to peer usb2-port3 and usb1-port4 by location 
(usb2-port3:none) (usb1-port4:usb2-port2)
[    9.382597] usb usb2-port3: failed to peer to usb1-port4 (-16)
[    9.382599] usb: port power management may be unreliable
[    9.383072] usb: failed to peer usb2-port4 and usb1-port4 by location 
(usb2-port4:none) (usb1-port4:usb2-port2)
[    9.383077] usb usb2-port4: failed to peer to usb1-port4 (-16)
[    9.383559] usb: failed to peer usb2-port5 and usb1-port4 by location 
(usb2-port5:none) (usb1-port4:usb2-port2)
[    9.383563] usb usb2-port5: failed to peer to usb1-port4 (-16)
[    9.383974] usb: failed to peer usb2-port6 and usb1-port4 by location 
(usb2-port6:none) (usb1-port4:usb2-port2)
[    9.383977] usb usb2-port6: failed to peer to usb1-port4 (-16)
[    9.415841] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    9.461630] wmi: Mapper loaded
[    9.500900] ACPI: Battery Slot [BAT0] (battery present)
[    9.516236] ACPI Warning: SystemIO range 
0x0000000000004040-0x000000000000405F conflicts with OpRegion 
0x0000000000004040-0x000000000000404F (\_SB_.PCI0.SBUS.SMBI) 
(20150818/utaddress-254)
[    9.516258] ACPI: If an ACPI driver is available for this device, you 
should use it instead of the native driver
[    9.527767] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
[    9.622209] hidraw: raw HID events driver (C) Jiri Kosina
[    9.682030] Bluetooth: Core ver 2.20
[    9.682071] NET: Registered protocol family 31
[    9.682076] Bluetooth: HCI device and connection manager initialized
[    9.682087] Bluetooth: HCI socket layer initialized
[    9.682095] Bluetooth: L2CAP socket layer initialized
[    9.682119] Bluetooth: SCO socket layer initialized
[    9.746979] usb 1-4: new high-speed USB device number 2 using xhci_hcd
[    9.755854] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    9.755882] scsi 1:0:0:0: Attached scsi generic sg1 type 5
[    9.774768] Bluetooth: HCI UART driver ver 2.3
[    9.774771] Bluetooth: HCI UART protocol H4 registered
[    9.774773] Bluetooth: HCI UART protocol BCSP registered
[    9.774774] Bluetooth: HCI UART protocol LL registered
[    9.774775] Bluetooth: HCI UART protocol ATH3K registered
[    9.774776] Bluetooth: HCI UART protocol Three-wire (H5) registered
[    9.774797] Bluetooth: HCI UART protocol Intel registered
[    9.774808] Bluetooth: HCI UART protocol BCM registered
[    9.827547] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
[    9.837108] input: Ideapad extra buttons as 
/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/input/input6
[    9.837641] r8169 0000:01:00.0 eth0: RTL8168h/8111h at 
0xffffc90000c8e000, 50:7b:9d:31:31:13, XID 14100800 IRQ 127
[    9.837652] r8169 0000:01:00.0 eth0: jumbo features [frames: 9200 
bytes, tx checksumming: ko]
[    9.855150] [drm] Initialized drm 1.1.0 20060810
[    9.866641] sr 1:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram 
cd/rw xa/form2 cdda tray
[    9.866645] cdrom: Uniform CD-ROM driver Revision: 3.20
[    9.866851] sr 1:0:0:0: Attached scsi CD-ROM sr0
[    9.994171] usb 1-4: New USB device found, idVendor=04f2, idProduct=b50e
[    9.994182] usb 1-4: New USB device strings: Mfr=3, Product=1, 
SerialNumber=2
[    9.994189] usb 1-4: Product: Lenovo EasyCamera
[    9.994195] usb 1-4: Manufacturer: Chicony Electronics Co.,Ltd.
[    9.994200] usb 1-4: SerialNumber: 0001
[   10.158299] [drm] Memory usable by graphics device = 4096M
[   10.158312] [drm] Replacing VGA console driver
[   10.160036] Console: switching to colour dummy device 80x25
[   10.163332] usb 1-5: new high-speed USB device number 3 using xhci_hcd
[   10.169419] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   10.169427] [drm] Driver supports precise vblank timestamp query.
[   10.169876] vgaarb: device changed decodes: 
PCI:0000:00:02.0,olddecodes=io+mem,decodes=io+mem:owns=io+mem
[   10.207160] i915 0000:00:02.0: firmware: direct-loading firmware 
i915/skl_dmc_ver1.bin
[   10.222958] fbcon: inteldrmfb (fb0) is primary device
[   10.230259] ACPI: Video Device [GFX0] (multi-head: yes  rom: no post: no)
[   10.230930] input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input7
[   10.242098] AVX2 version of gcm_enc/dec engaged.
[   10.242101] AES CTR mode by8 optimization enabled
[   10.323460] psmouse serio1: elantech: assuming hardware version 4 
(with firmware version 0x594f03)
[   10.340997] psmouse serio1: elantech: Synaptics capabilities query 
result 0x70, 0x15, 0x0a.
[   10.351934] usb 1-5: New USB device found, idVendor=0bda, idProduct=0129
[   10.351939] usb 1-5: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[   10.351943] usb 1-5: Product: USB2.0-CRW
[   10.351947] usb 1-5: Manufacturer: Generic
[   10.351950] usb 1-5: SerialNumber: 20100201396000000
[   10.356821] psmouse serio1: elantech: Elan sample query result 05, 20, 97
[   10.450605] input: ETPS/2 Elantech Touchpad as 
/devices/platform/i8042/serio1/input/input5
[   10.451966] [drm:intel_dp_aux_ch [i915]] *ERROR* dp aux hw did not 
signal timeout (has irq: 1)!
[   10.467879] [drm:intel_dp_aux_ch [i915]] *ERROR* dp aux hw did not 
signal timeout (has irq: 1)!
[   10.467883] usb 1-7: new full-speed USB device number 4 using xhci_hcd
[   10.483839] [drm:intel_dp_aux_ch [i915]] *ERROR* dp aux hw did not 
signal timeout (has irq: 1)!
[   10.493753] sha256_ssse3: Using AVX2 optimized SHA-256 implementation
[   10.499843] [drm:intel_dp_aux_ch [i915]] *ERROR* dp aux hw did not 
signal timeout (has irq: 1)!
[   10.515850] [drm:intel_dp_aux_ch [i915]] *ERROR* dp aux hw did not 
signal timeout (has irq: 1)!
[   10.515869] [drm:intel_dp_aux_ch [i915]] *ERROR* dp_aux_ch not done 
status 0xad40001f
[   10.539844] ------------[ cut here ]------------
[   10.539872] WARNING: CPU: 2 PID: 371 at 
/build/linux-dUKt9u/linux-4.3.3/drivers/gpu/drm/i915/intel_dp.c:854 
intel_dp_aux_ch+0x112/0x670 [i915]()
[   10.539873] dp_aux_ch not started status 0xad40001f
[   10.539899] Modules linked in: sha256_ssse3 sha256_generic hmac 
drbg(+) ansi_cprng aesni_intel(+) i915(+) aes_x86_64 drm_kms_helper 
snd_hda_intel snd_hda_codec lrw snd_hda_core i2c_hid sr_mod gf128mul drm 
snd_hwdep r8169 mii snd_pcm hci_uart cdrom btbcm snd_timer sg snd 
soundcore ideapad_laptop evdev btintel psmouse bluetooth hid glue_helper 
ablk_helper cryptd mei_me serio_raw i2c_i801 i2c_algo_bit sparse_keymap 
wmi shpchp battery xhci_pci mei xhci_hcd tpm_crb tpm video acpi_pad 
button ac processor ath9k_htc ath9k_common ath9k_hw ath mac80211 
cfg80211 rfkill usbcore usb_common parport_pc ppdev lp parport autofs4 
ext4 crc16 mbcache jbd2 sd_mod ahci libahci libata scsi_mod
[   10.539901] CPU: 2 PID: 371 Comm: kworker/2:3 Not tainted 
4.3.0-1-amd64 #1 Debian 4.3.3-5
[   10.539901] Hardware name: LENOVO 80Q7/Paris 5A8, BIOS D5CN28WW 
08/13/2015
[   10.539906] Workqueue: events output_poll_execute [drm_kms_helper]
[   10.539907]  0000000000000000 00000000c1617afb ffffffff812ddce9 
ffff880267533988
[   10.539908]  ffffffff81072b1d 00000000ad40001f ffff8802675339e0 
00000000fffffff0
[   10.539909]  0000000000064014 ffff8802679c0000 ffffffff81072bac 
ffffffffa076b210
[   10.539910] Call Trace:
[   10.539914]  [<ffffffff812ddce9>] ? dump_stack+0x40/0x57
[   10.539916]  [<ffffffff81072b1d>] ? warn_slowpath_common+0x7d/0xb0
[   10.539917]  [<ffffffff81072bac>] ? warn_slowpath_fmt+0x5c/0x80
[   10.539937]  [<ffffffffa07291a2>] ? intel_dp_aux_ch+0x112/0x670 [i915]
[   10.539939]  [<ffffffff810b1590>] ? wake_atomic_t_function+0x60/0x60
[   10.539957]  [<ffffffffa07297d0>] ? intel_dp_aux_transfer+0xd0/0x1e0 
[i915]
[   10.539959]  [<ffffffff810d7c45>] ? hrtimer_try_to_cancel+0x25/0x100
[   10.539962]  [<ffffffffa0676c78>] ? drm_dp_dpcd_access+0x68/0x110 
[drm_kms_helper]
[   10.539966]  [<ffffffffa0676e27>] ? drm_dp_dpcd_write+0x17/0x20 
[drm_kms_helper]
[   10.539986]  [<ffffffffa072ba3b>] ? intel_dp_sink_dpms+0x9b/0xe0 [i915]
[   10.540004]  [<ffffffffa0720ae3>] ? 
intel_ddi_post_disable+0x173/0x1e0 [i915]
[   10.540022]  [<ffffffffa06fb25b>] ? haswell_crtc_disable+0x12b/0x2c0 
[i915]
[   10.540040]  [<ffffffffa0703903>] ? intel_atomic_commit+0x123/0x12f0 
[i915]
[   10.540052]  [<ffffffffa05df384>] ? drm_atomic_check_only+0x214/0x540 
[drm]
[   10.540056]  [<ffffffffa067e69f>] ? 
drm_atomic_helper_set_config+0x1af/0x410 [drm_kms_helper]
[   10.540064]  [<ffffffffa05cf73e>] ? 
drm_mode_set_config_internal+0x5e/0xf0 [drm]
[   10.540068]  [<ffffffffa06813ca>] ? restore_fbdev_mode+0xaa/0x110 
[drm_kms_helper]
[   10.540072]  [<ffffffffa0683170>] ? 
drm_fb_helper_restore_fbdev_mode_unlocked+0x20/0x60 [drm_kms_helper]
[   10.540075]  [<ffffffffa06831d9>] ? drm_fb_helper_set_par+0x29/0x50 
[drm_kms_helper]
[   10.540078]  [<ffffffffa0683109>] ? 
drm_fb_helper_hotplug_event+0xb9/0x100 [drm_kms_helper]
[   10.540081]  [<ffffffffa067778b>] ? output_poll_execute+0x18b/0x1d0 
[drm_kms_helper]
[   10.540083]  [<ffffffff8108a40f>] ? process_one_work+0x19f/0x3d0
[   10.540084]  [<ffffffff8108a68d>] ? worker_thread+0x4d/0x450
[   10.540085]  [<ffffffff8108a640>] ? process_one_work+0x3d0/0x3d0
[   10.540086]  [<ffffffff810904bd>] ? kthread+0xcd/0xf0
[   10.540088]  [<ffffffff810903f0>] ? kthread_create_on_node+0x190/0x190
[   10.540090]  [<ffffffff8158514f>] ? ret_from_fork+0x3f/0x70
[   10.540092]  [<ffffffff810903f0>] ? kthread_create_on_node+0x190/0x190
[   10.540093] ---[ end trace 880d97cedbcc59af ]---
[   10.653134] usb 1-7: New USB device found, idVendor=0cf3, idProduct=e360
[   10.653135] usb 1-7: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[   10.986136] usbcore: registered new interface driver btusb
[   10.987869] bluetooth hci0: firmware: failed to load 
qca/rampatch_usb_00000300.bin (-2)
[   10.987871] bluetooth hci0: Direct firmware load for 
qca/rampatch_usb_00000300.bin failed with error -2
[   10.987872] Bluetooth: hci0: failed to request rampatch file: 
qca/rampatch_usb_00000300.bin (-2)
[   11.036592] media: Linux media interface: v0.10
[   11.257062] Linux video capture interface: v2.00
[   11.283123] bluetooth hci0: firmware: failed to load 
qca/rampatch_usb_00000300.bin (-2)
[   11.283126] bluetooth hci0: Direct firmware load for 
qca/rampatch_usb_00000300.bin failed with error -2
[   11.283131] Bluetooth: hci0: failed to request rampatch file: 
qca/rampatch_usb_00000300.bin (-2)
[   11.435762] uvcvideo: Found UVC 1.00 device Lenovo EasyCamera (04f2:b50e)
[   11.440117] input: Lenovo EasyCamera as 
/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/input/input8
[   11.440249] usbcore: registered new interface driver uvcvideo
[   11.440250] USB Video Class driver (1.1.1)
[   11.662745] Adding 3905532k swap on /dev/sda5.  Priority:-1 extents:1 
across:3905532k FS
[   11.749560] intel_rapl: Found RAPL domain package
[   11.749562] intel_rapl: Found RAPL domain core
[   11.749564] intel_rapl: Found RAPL domain uncore
[   11.749566] intel_rapl: Found RAPL domain dram
[   11.797244] [drm] RC6 on
[   12.166382] EXT4-fs (sda3): mounted filesystem with ordered data 
mode. Opts: (null)
[   12.457546] usbcore: registered new interface driver rtsx_usb
[   16.752718] [drm:intel_dp_start_link_train [i915]] *ERROR* failed to 
enable link training
[   17.521312] [drm:intel_dp_complete_link_train [i915]] *ERROR* failed 
to start channel equalization
[   18.323697] Console: switching to colour frame buffer device 170x48
[   18.339048] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 
i915_audio_component_bind_ops [i915])
[   18.339051] [drm] Initialized i915 1.6.0 20150731 for 0000:00:02.0 on 
minor 0
[   18.341743] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[   18.463045] snd_hda_codec_conexant hdaudioC0D0: CX20751/2: BIOS 
auto-probing.
[   18.463425] snd_hda_codec_conexant hdaudioC0D0: autoconfig for 
CX20751/2: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[   18.463430] snd_hda_codec_conexant hdaudioC0D0:    speaker_outs=0 
(0x0/0x0/0x0/0x0/0x0)
[   18.463433] snd_hda_codec_conexant hdaudioC0D0:    hp_outs=1 
(0x16/0x0/0x0/0x0/0x0)
[   18.463436] snd_hda_codec_conexant hdaudioC0D0:    mono: mono_out=0x0
[   18.463439] snd_hda_codec_conexant hdaudioC0D0:    inputs:
[   18.463442] snd_hda_codec_conexant hdaudioC0D0:      Internal Mic=0x1a
[   18.463445] snd_hda_codec_conexant hdaudioC0D0:      Mic=0x19
[   18.464262] snd_hda_codec_conexant hdaudioC0D0: Enable sync_write for 
stable communication
[   18.484765] input: HDA Digital PCBeep as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input9
[   18.486038] input: HDA Intel PCH Mic as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input10
[   18.486221] input: HDA Intel PCH Headphone as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input11
[   18.486388] input: HDA Intel PCH HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[   18.486555] input: HDA Intel PCH HDMI/DP,pcm=7 as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input13
[   18.486726] input: HDA Intel PCH HDMI/DP,pcm=8 as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input14
[   19.432440] r8169 0000:01:00.0: firmware: direct-loading firmware 
rtl_nic/rtl8168h-2.fw
[   19.449540] r8169 0000:01:00.0 eth0: link down
[   19.449628] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   23.107532] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   23.107541] Bluetooth: BNEP filters: protocol multicast
[   23.107551] Bluetooth: BNEP socket layer initialized
[   39.983049] ip_tables: (C) 2000-2006 Netfilter Core Team
[  235.319208] usb 1-3: new high-speed USB device number 5 using xhci_hcd
[  235.505293] usb 1-3: New USB device found, idVendor=0bc2, idProduct=5031
[  235.505306] usb 1-3: New USB device strings: Mfr=2, Product=3, 
SerialNumber=1
[  235.505313] usb 1-3: Product: FreeAgent GoFlex
[  235.505318] usb 1-3: Manufacturer: Seagate
[  235.505323] usb 1-3: SerialNumber: NA0FJWN6
[  235.540973] usb-storage 1-3:1.0: USB Mass Storage device detected
[  235.541211] scsi host2: usb-storage 1-3:1.0
[  235.541480] usbcore: registered new interface driver usb-storage
[  235.555820] usbcore: registered new interface driver uas
[  236.552367] scsi 2:0:0:0: Direct-Access     Seagate  FreeAgent 
GoFlex  214 PQ: 0 ANSI: 0
[  236.554091] sd 2:0:0:0: Attached scsi generic sg2 type 0
[  236.554191] sd 2:0:0:0: [sdb] 976773167 512-byte logical blocks: (500 
GB/465 GiB)
[  236.554543] sd 2:0:0:0: [sdb] Write Protect is off
[  236.554559] sd 2:0:0:0: [sdb] Mode Sense: 0f 00 00 00
[  236.554893] sd 2:0:0:0: [sdb] No Caching mode page found
[  236.554906] sd 2:0:0:0: [sdb] Assuming drive cache: write through
[  236.596765]  sdb: sdb1
[  236.598555] sd 2:0:0:0: [sdb] Attached SCSI disk
[  237.154309] fuse init (API version 7.23)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
