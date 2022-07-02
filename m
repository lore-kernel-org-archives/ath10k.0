Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E8DC433EF
	for <ath10k@archiver.kernel.org>; Sat,  2 Jul 2022 21:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zWjA6LRJZRwk8f95dnn3z5xZqn14aQSy0bOJo2J3DiA=; b=Kd5
	4gRrSisDtJlEsilICPtEEUltuno8heUfGAGMkuaYEi+ck1qkurFyG5vWJm2DUOXlVluox9KIY6Uls
	utonGncvIH0HkdNxTUB6D0W/It2yKv5UO3yiEKwQ63Ayrb9HZ0/2s/EFAPAICnbfC0nacdvbaYBlF
	ZWl174G1jpwZcYBbQXSh//pIwYAYLeJErmMCdQvU9CHZicprufLerFL0l8NpoFTXy9+S3+RgVTAIM
	rSJ9Gl6eYV/hFI5LnIVRXHgwGO3FuoES1CFECgbqNhkTrLO+Yf9I+/knUvDrsvSOE8BnniVq1Q3HW
	4wTHORmPEaJCWk7ShWLgOflmiSITpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7kUZ-00BZc1-H4; Sat, 02 Jul 2022 21:17:27 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7kUR-00BZYl-Ef
	for ath10k@lists.infradead.org; Sat, 02 Jul 2022 21:17:25 +0000
Received: by mail-ej1-x630.google.com with SMTP id sb34so9937506ejc.11
        for <ath10k@lists.infradead.org>; Sat, 02 Jul 2022 14:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version;
        bh=fkGyRvOJkGn8c8FNPT15KjWm1tMikqQJwFxVaw7jU50=;
        b=QKFYCpoBjyybNzv19ocVxyyryckn2S2XuRcOGnqbsySpSFw312xKxPl/f1lHl0UqiA
         nZSsno/vlNZ+2tkB2dP4ZJC2rNqIrYRjV9vmyCRNay0RPGBkyJaFlapJJDKefoITtGOQ
         DhqFNzd1IcDGZz393PqOBIBmNEmU2HAm1G548P1iogN2LY8ngoBOqGaxTB2dytOxyn3v
         5p41rR0wixpFIb6N/s8/cWKfTg97K5n3x/XULjxERdTmnQ+03HECxbXSEdhiwuGhn02P
         htkHNXL2hzPl/5pZ6KusRhZVa885u6MliMx73/i3DD54zwhBwL9CQW4Pda8UXakRb9Tk
         c8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version;
        bh=fkGyRvOJkGn8c8FNPT15KjWm1tMikqQJwFxVaw7jU50=;
        b=gt936yETgWNIGnYzFJsGI4C+KKtTNKRLY7m7ORj2iVnIt3J1n6oul50zHNORMD46Gd
         csiZtQfJPm1SsWTo0nloqmowLkc/nWQ8ceb1ZWBJhUUhlMLbqLNgFaTTu5TE3pV5hfB1
         COF6n/s690yhII+TXm7MKtecwnc6e8PWZGOvqDRIDozg80vX5vELq4By/ytF8HKlm7L2
         AmYnBWBcAt0magdPkxKkq92NIkrKQIjMlfQRRw6dhcmQ6/qFXmNrkzO+2qyVm4wu61Ns
         KqF888tFlYdtq4KPDaREN31FKq7nd0MM4+9zWJ5H/guds7uvypgjejhSEKiQkl/EzXco
         5VJQ==
X-Gm-Message-State: AJIora+3p3baplq3n69Ibu2js9yriM5MyrG+pIE2LrmiOd2EX6moWf6h
	S2rvifMrADf4JYhvq1spqB5vv2zvtGQ=
X-Google-Smtp-Source: AGRyM1sBir976HXYvqcOaIUO7WAthf/OfhWRIYRmtrguBrypLAdKaG/6oMaegoWGQxEshi8IXab+0g==
X-Received: by 2002:a17:906:cc5d:b0:72a:a0c7:fbdf with SMTP id mm29-20020a170906cc5d00b0072aa0c7fbdfmr4973892ejb.693.1656796637173;
        Sat, 02 Jul 2022 14:17:17 -0700 (PDT)
Received: from fedora.localnet (net-37-117-93-225.cust.vodafonedsl.it. [37.117.93.225])
        by smtp.gmail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm12254389ejr.158.2022.07.02.14.17.15
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 14:17:16 -0700 (PDT)
From: Davide Pozzi <kitt997@gmail.com>
To: ath10k@lists.infradead.org
Subject: QCA9377 firmware crash
Date: Sat, 02 Jul 2022 23:17:15 +0200
Message-ID: <3178858.aeNJFYEL58@fedora>
MIME-Version: 1.0
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1476044148460551671=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============1476044148460551671==
Content-Type: multipart/signed; boundary="nextPart8086853.T7Z3S40VBb"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart8086853.T7Z3S40VBb
Content-Type: multipart/mixed; boundary="nextPart3184950.44csPzL39Z"; protected-headers="v1"
Content-Transfer-Encoding: 7Bit
From: Davide Pozzi <kitt997@gmail.com>
To: ath10k@lists.infradead.org
Subject: QCA9377 firmware crash
Date: Sat, 02 Jul 2022 23:16:56 +0200
Message-ID: <3178858.aeNJFYEL58@fedora>

This is a multi-part message in MIME format.

--nextPart3184950.44csPzL39Z
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi everyone,


I've come across this link after years of doom with the QCA9377 chip. It basically never worked, except some 1-2 months in total since when I bought my PC (2017).
Without spending many useless words, I'm attaching a dmesg and a link (https://bugzilla.redhat.com/show_bug.cgi?id=1961697) to one of my previous bug reports @Fedora.
I hope something could be done since this is the only problem I've got with Linux but nonetheless it's driving me crazy.


Thanks,

Davide
--nextPart3184950.44csPzL39Z
Content-Disposition: inline; filename="20220628_dmesg.txt"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; name="20220628_dmesg.txt"

[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0x7f800000-0xdfffffff]
[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0xe0000000-0xefffffff]
[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0xf0000000-0xfdffffff]
[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0xfe000000-0xfe010fff]
[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0xfe011000-0xfebfffff]
[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0xfec00000-0xfec00fff]
[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0xfec01000-0xfedfffff]
[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0xfee00000-0xfee00fff]
[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0xfee01000-0xfeffffff]
[mar giu 28 18:43:27 2022] PM: hibernation: Registered nosave memory: [mem =
0xff000000-0xffffffff]
[mar giu 28 18:43:27 2022] [mem 0x7f800000-0xdfffffff] available for PCI de=
vices
[mar giu 28 18:43:27 2022] Booting paravirtualized kernel on bare hardware
[mar giu 28 18:43:27 2022] clocksource: refined-jiffies: mask: 0xffffffff m=
ax_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[mar giu 28 18:43:27 2022] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_=
cpu_ids:8 nr_node_ids:1
[mar giu 28 18:43:27 2022] percpu: Embedded 61 pages/cpu s212992 r8192 d286=
72 u262144
[mar giu 28 18:43:27 2022] pcpu-alloc: s212992 r8192 d28672 u262144 alloc=
=3D1*2097152
[mar giu 28 18:43:27 2022] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[mar giu 28 18:43:27 2022] Fallback order for Node 0: 0=20
[mar giu 28 18:43:27 2022] Built 1 zonelists, mobility grouping on.  Total =
pages: 4075408
[mar giu 28 18:43:27 2022] Policy zone: Normal
[mar giu 28 18:43:27 2022] Kernel command line: BOOT_IMAGE=3D(hd0,gpt4)/boo=
t/vmlinuz-5.18.6-100.fc35.x86_64 root=3DUUID=3D43ec8e1e-3948-4374-94bf-7451=
645b1e87 ro rhgb quiet resume=3D/dev/sda3
[mar giu 28 18:43:27 2022] Unknown kernel command line parameters "rhgb BOO=
T_IMAGE=3D(hd0,gpt4)/boot/vmlinuz-5.18.6-100.fc35.x86_64", will be passed t=
o user space.
[mar giu 28 18:43:27 2022] Dentry cache hash table entries: 2097152 (order:=
 12, 16777216 bytes, linear)
[mar giu 28 18:43:27 2022] Inode-cache hash table entries: 1048576 (order: =
11, 8388608 bytes, linear)
[mar giu 28 18:43:27 2022] mem auto-init: stack:off, heap alloc:off, heap f=
ree:off
[mar giu 28 18:43:27 2022] Memory: 16062280K/16561032K available (16393K ke=
rnel code, 3672K rwdata, 10928K rodata, 2708K init, 6180K bss, 498492K rese=
rved, 0K cma-reserved)
[mar giu 28 18:43:27 2022] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0,=
 CPUs=3D8, Nodes=3D1
[mar giu 28 18:43:27 2022] Kernel/User page tables isolation: enabled
[mar giu 28 18:43:27 2022] ftrace: allocating 48710 entries in 191 pages
[mar giu 28 18:43:27 2022] ftrace: allocated 191 pages with 7 groups
[mar giu 28 18:43:27 2022] Dynamic Preempt: voluntary
[mar giu 28 18:43:27 2022] rcu: Preemptible hierarchical RCU implementation.
[mar giu 28 18:43:27 2022] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 t=
o nr_cpu_ids=3D8.
[mar giu 28 18:43:27 2022] 	Trampoline variant of Tasks RCU enabled.
[mar giu 28 18:43:27 2022] 	Rude variant of Tasks RCU enabled.
[mar giu 28 18:43:27 2022] 	Tracing variant of Tasks RCU enabled.
[mar giu 28 18:43:27 2022] rcu: RCU calculated value of scheduler-enlistmen=
t delay is 100 jiffies.
[mar giu 28 18:43:27 2022] rcu: Adjusting geometry for rcu_fanout_leaf=3D16=
, nr_cpu_ids=3D8
[mar giu 28 18:43:27 2022] NR_IRQS: 524544, nr_irqs: 2048, preallocated irq=
s: 16
[mar giu 28 18:43:27 2022] kfence: initialized - using 2097152 bytes for 25=
5 objects at 0x(____ptrval____)-0x(____ptrval____)
[mar giu 28 18:43:27 2022] random: crng init done
[mar giu 28 18:43:27 2022] spurious 8259A interrupt: IRQ7.
[mar giu 28 18:43:27 2022] Console: colour dummy device 80x25
[mar giu 28 18:43:27 2022] printk: console [tty0] enabled
[mar giu 28 18:43:27 2022] ACPI: Core revision 20211217
[mar giu 28 18:43:27 2022] clocksource: hpet: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 79635855245 ns
[mar giu 28 18:43:27 2022] APIC: Switch to symmetric I/O mode setup
[mar giu 28 18:43:27 2022] DMAR: Host address width 39
[mar giu 28 18:43:27 2022] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[mar giu 28 18:43:27 2022] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap =
1c0000c40660462 ecap 19e2ff0505e
[mar giu 28 18:43:27 2022] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[mar giu 28 18:43:27 2022] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap =
d2008c40660462 ecap f050da
[mar giu 28 18:43:27 2022] DMAR: RMRR base: 0x0000007a270000 end: 0x0000007=
a28ffff
[mar giu 28 18:43:27 2022] DMAR: RMRR base: 0x0000007d000000 end: 0x0000007=
f7fffff
[mar giu 28 18:43:27 2022] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
[mar giu 28 18:43:27 2022] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000=
 IOMMU 1
[mar giu 28 18:43:27 2022] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
[mar giu 28 18:43:27 2022] DMAR-IR: Queued invalidation will be enabled to =
support x2apic and Intr-remapping.
[mar giu 28 18:43:27 2022] DMAR-IR: Enabled IRQ remapping in x2apic mode
[mar giu 28 18:43:27 2022] x2apic enabled
[mar giu 28 18:43:27 2022] Switched APIC routing to cluster x2apic.
[mar giu 28 18:43:27 2022] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=
=3D-1 pin2=3D-1
[mar giu 28 18:43:27 2022] clocksource: tsc-early: mask: 0xffffffffffffffff=
 max_cycles: 0x39a8208cdd2, max_idle_ns: 881590748921 ns
[mar giu 28 18:43:27 2022] Calibrating delay loop (skipped), value calculat=
ed using timer frequency.. 3999.93 BogoMIPS (lpj=3D1999968)
[mar giu 28 18:43:27 2022] pid_max: default: 32768 minimum: 301
[mar giu 28 18:43:27 2022] LSM: Security Framework initializing
[mar giu 28 18:43:27 2022] Yama: becoming mindful.
[mar giu 28 18:43:27 2022] SELinux:  Initializing.
[mar giu 28 18:43:27 2022] LSM support for eBPF active
[mar giu 28 18:43:27 2022] landlock: Up and running.
[mar giu 28 18:43:27 2022] Mount-cache hash table entries: 32768 (order: 6,=
 262144 bytes, linear)
[mar giu 28 18:43:27 2022] Mountpoint-cache hash table entries: 32768 (orde=
r: 6, 262144 bytes, linear)
[mar giu 28 18:43:27 2022] x86/cpu: SGX disabled by BIOS.
[mar giu 28 18:43:27 2022] CPU0: Thermal monitoring enabled (TM1)
[mar giu 28 18:43:27 2022] process: using mwait in idle threads
[mar giu 28 18:43:27 2022] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[mar giu 28 18:43:27 2022] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1=
GB 4
[mar giu 28 18:43:27 2022] Spectre V1 : Mitigation: usercopy/swapgs barrier=
s and __user pointer sanitization
[mar giu 28 18:43:27 2022] Spectre V2 : Mitigation: Retpolines
[mar giu 28 18:43:27 2022] Spectre V2 : Spectre v2 / SpectreRSB mitigation:=
 Filling RSB on context switch
[mar giu 28 18:43:27 2022] Spectre V2 : Enabling Restricted Speculation for=
 firmware calls
[mar giu 28 18:43:27 2022] Spectre V2 : mitigation: Enabling conditional In=
direct Branch Prediction Barrier
[mar giu 28 18:43:27 2022] Spectre V2 : User space: Mitigation: STIBP via p=
rctl
[mar giu 28 18:43:27 2022] Speculative Store Bypass: Mitigation: Speculativ=
e Store Bypass disabled via prctl
[mar giu 28 18:43:27 2022] MDS: Mitigation: Clear CPU buffers
[mar giu 28 18:43:27 2022] MMIO Stale Data: Mitigation: Clear CPU buffers
[mar giu 28 18:43:27 2022] SRBDS: Mitigation: Microcode
[mar giu 28 18:43:27 2022] Freeing SMP alternatives memory: 44K
[mar giu 28 18:43:27 2022] smpboot: Estimated ratio of average max frequenc=
y by base frequency (times 1024): 1894
[mar giu 28 18:43:27 2022] smpboot: CPU0: Intel(R) Core(TM) i7-8550U CPU @ =
1.80GHz (family: 0x6, model: 0x8e, stepping: 0xa)
[mar giu 28 18:43:27 2022] cblist_init_generic: Setting adjustable number o=
f callback queues.
[mar giu 28 18:43:27 2022] cblist_init_generic: Setting shift to 3 and lim =
to 1.
[mar giu 28 18:43:27 2022] cblist_init_generic: Setting shift to 3 and lim =
to 1.
[mar giu 28 18:43:27 2022] cblist_init_generic: Setting shift to 3 and lim =
to 1.
[mar giu 28 18:43:27 2022] Performance Events: PEBS fmt3+, Skylake events, =
32-deep LBR, full-width counters, Intel PMU driver.
[mar giu 28 18:43:27 2022] ... version:                4
[mar giu 28 18:43:27 2022] ... bit width:              48
[mar giu 28 18:43:27 2022] ... generic registers:      4
[mar giu 28 18:43:27 2022] ... value mask:             0000ffffffffffff
[mar giu 28 18:43:27 2022] ... max period:             00007fffffffffff
[mar giu 28 18:43:27 2022] ... fixed-purpose events:   3
[mar giu 28 18:43:27 2022] ... event mask:             000000070000000f
[mar giu 28 18:43:27 2022] rcu: Hierarchical SRCU implementation.
[mar giu 28 18:43:27 2022] NMI watchdog: Enabled. Permanently consumes one =
hw-PMU counter.
[mar giu 28 18:43:27 2022] smp: Bringing up secondary CPUs ...
[mar giu 28 18:43:27 2022] x86: Booting SMP configuration:
[mar giu 28 18:43:27 2022] .... node  #0, CPUs:      #1 #2 #3 #4
[mar giu 28 18:43:27 2022] MDS CPU bug present and SMT on, data leak possib=
le. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html=
 for more details.
[mar giu 28 18:43:27 2022] MMIO Stale Data CPU bug present and SMT on, data=
 leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-v=
uln/processor_mmio_stale_data.html for more details.
[mar giu 28 18:43:27 2022]  #5 #6 #7
[mar giu 28 18:43:27 2022] smp: Brought up 1 node, 8 CPUs
[mar giu 28 18:43:27 2022] smpboot: Max logical packages: 1
[mar giu 28 18:43:27 2022] smpboot: Total of 8 processors activated (31999.=
48 BogoMIPS)
[mar giu 28 18:43:27 2022] devtmpfs: initialized
[mar giu 28 18:43:27 2022] x86/mm: Memory block size: 128MB
[mar giu 28 18:43:27 2022] ACPI: PM: Registering ACPI NVS region [mem 0x6a5=
f0000-0x6a5f0fff] (4096 bytes)
[mar giu 28 18:43:27 2022] ACPI: PM: Registering ACPI NVS region [mem 0x7a5=
88000-0x7ae85fff] (9428992 bytes)
[mar giu 28 18:43:27 2022] clocksource: jiffies: mask: 0xffffffff max_cycle=
s: 0xffffffff, max_idle_ns: 1911260446275000 ns
[mar giu 28 18:43:27 2022] futex hash table entries: 2048 (order: 5, 131072=
 bytes, linear)
[mar giu 28 18:43:27 2022] pinctrl core: initialized pinctrl subsystem
[mar giu 28 18:43:27 2022] PM: RTC time: 16:33:38, date: 2022-06-28
[mar giu 28 18:43:27 2022] NET: Registered PF_NETLINK/PF_ROUTE protocol fam=
ily
[mar giu 28 18:43:27 2022] DMA: preallocated 2048 KiB GFP_KERNEL pool for a=
tomic allocations
[mar giu 28 18:43:27 2022] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA po=
ol for atomic allocations
[mar giu 28 18:43:27 2022] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 =
pool for atomic allocations
[mar giu 28 18:43:27 2022] audit: initializing netlink subsys (disabled)
[mar giu 28 18:43:27 2022] audit: type=3D2000 audit(1656434018.018:1): stat=
e=3Dinitialized audit_enabled=3D0 res=3D1
[mar giu 28 18:43:27 2022] thermal_sys: Registered thermal governor 'fair_s=
hare'
[mar giu 28 18:43:27 2022] thermal_sys: Registered thermal governor 'bang_b=
ang'
[mar giu 28 18:43:27 2022] thermal_sys: Registered thermal governor 'step_w=
ise'
[mar giu 28 18:43:27 2022] thermal_sys: Registered thermal governor 'user_s=
pace'
[mar giu 28 18:43:27 2022] cpuidle: using governor menu
[mar giu 28 18:43:27 2022] Simple Boot Flag at 0x47 set to 0x80
[mar giu 28 18:43:27 2022] acpiphp: ACPI Hot Plug PCI Controller Driver ver=
sion: 0.5
[mar giu 28 18:43:27 2022] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [me=
m 0xe0000000-0xefffffff] (base 0xe0000000)
[mar giu 28 18:43:27 2022] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] res=
erved in E820
[mar giu 28 18:43:27 2022] PCI: Using configuration type 1 for base access
[mar giu 28 18:43:27 2022] ENERGY_PERF_BIAS: Set to 'normal', was 'performa=
nce'
[mar giu 28 18:43:27 2022] kprobes: kprobe jump-optimization is enabled. Al=
l kprobes are optimized if possible.
[mar giu 28 18:43:27 2022] HugeTLB registered 1.00 GiB page size, pre-alloc=
ated 0 pages
[mar giu 28 18:43:27 2022] HugeTLB registered 2.00 MiB page size, pre-alloc=
ated 0 pages
[mar giu 28 18:43:27 2022] cryptd: max_cpu_qlen set to 1000
[mar giu 28 18:43:27 2022] raid6: skipped pq benchmark and selected avx2x4
[mar giu 28 18:43:27 2022] raid6: using avx2x2 recovery algorithm
[mar giu 28 18:43:27 2022] ACPI: Added _OSI(Module Device)
[mar giu 28 18:43:27 2022] ACPI: Added _OSI(Processor Device)
[mar giu 28 18:43:27 2022] ACPI: Added _OSI(3.0 _SCP Extensions)
[mar giu 28 18:43:27 2022] ACPI: Added _OSI(Processor Aggregator Device)
[mar giu 28 18:43:27 2022] ACPI: Added _OSI(Linux-Dell-Video)
[mar giu 28 18:43:27 2022] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[mar giu 28 18:43:27 2022] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[mar giu 28 18:43:27 2022] ACPI: 14 ACPI AML tables successfully acquired a=
nd loaded
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000000eac80ac (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 00000000af4125a9 (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000006f2f360c (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ign=
ored
[mar giu 28 18:43:27 2022] ACPI: Dynamic OEM Table Load:
[mar giu 28 18:43:27 2022] ACPI: SSDT 0xFFFF9CAF402CA000 0005CD (v02 PmRef =
 Cpu0Ist  00003000 INTL 20160422)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000000eac80ac (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 00000000af4125a9 (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000006f2f360c (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI: \_PR_.PR00: _OSC native thermal LVT Acked
[mar giu 28 18:43:27 2022] ACPI: Dynamic OEM Table Load:
[mar giu 28 18:43:27 2022] ACPI: SSDT 0xFFFF9CAF402C4400 0003FF (v02 PmRef =
 Cpu0Cst  00003001 INTL 20160422)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000000eac80ac (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 00000000af4125a9 (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000006f2f360c (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI: Dynamic OEM Table Load:
[mar giu 28 18:43:27 2022] ACPI: SSDT 0xFFFF9CAF41430B40 0000BA (v02 PmRef =
 Cpu0Hwp  00003000 INTL 20160422)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000000eac80ac (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 00000000af4125a9 (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000006f2f360c (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI: Dynamic OEM Table Load:
[mar giu 28 18:43:27 2022] ACPI: SSDT 0xFFFF9CAF402CE800 000628 (v02 PmRef =
 HwpLvt   00003000 INTL 20160422)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000000eac80ac (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 00000000af4125a9 (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000006f2f360c (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI: Dynamic OEM Table Load:
[mar giu 28 18:43:27 2022] ACPI: SSDT 0xFFFF9CAF40139000 000D14 (v02 PmRef =
 ApIst    00003000 INTL 20160422)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000000eac80ac (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 00000000af4125a9 (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000006f2f360c (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI: Dynamic OEM Table Load:
[mar giu 28 18:43:27 2022] ACPI: SSDT 0xFFFF9CAF402C0800 000317 (v02 PmRef =
 ApHwp    00003000 INTL 20160422)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000000eac80ac (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 00000000af4125a9 (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000006f2f360c (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI: Dynamic OEM Table Load:
[mar giu 28 18:43:27 2022] ACPI: SSDT 0xFFFF9CAF402C7400 00030A (v02 PmRef =
 ApCst    00003000 INTL 20160422)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000000eac80ac (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 00000000af4125a9 (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI Error: No pointer back to namespace node in=
 package 000000006f2f360c (20211217/dsargs-301)
[mar giu 28 18:43:27 2022] ACPI: EC: EC started
[mar giu 28 18:43:27 2022] ACPI: EC: interrupt blocked
[mar giu 28 18:43:27 2022] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
[mar giu 28 18:43:27 2022] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to=
 handle transactions
[mar giu 28 18:43:27 2022] ACPI: Interpreter enabled
[mar giu 28 18:43:27 2022] ACPI: PM: (supports S0 S3 S4 S5)
[mar giu 28 18:43:27 2022] ACPI: Using IOAPIC for interrupt routing
[mar giu 28 18:43:27 2022] PCI: Using host bridge windows from ACPI; if nec=
essary, use "pci=3Dnocrs" and report a bug
[mar giu 28 18:43:27 2022] ACPI: Enabled 7 GPEs in block 00 to 7F
[mar giu 28 18:43:27 2022] ACPI: PM: Power Resource [PC01]
[mar giu 28 18:43:27 2022] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 0=
0-fe])
[mar giu 28 18:43:27 2022] acpi PNP0A08:00: _OSC: OS supports [ExtendedConf=
ig ASPM ClockPM Segments MSI EDR HPX-Type3]
[mar giu 28 18:43:27 2022] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotp=
lug SHPCHotplug PME AER PCIeCapability LTR DPC]
[mar giu 28 18:43:27 2022] PCI host bridge to bus 0000:00
[mar giu 28 18:43:27 2022] pci_bus 0000:00: root bus resource [io  0x0000-0=
x0cf7 window]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: root bus resource [io  0x0d00-0=
xffff window]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: root bus resource [mem 0x000a00=
00-0x000dffff window]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: root bus resource [mem 0x7f8000=
00-0xdfffffff window]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: root bus resource [mem 0xfd0000=
00-0xfe7fffff window]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: root bus resource [bus 00-fe]
[mar giu 28 18:43:27 2022] pci 0000:00:00.0: [8086:5914] type 00 class 0x06=
0000
[mar giu 28 18:43:27 2022] pci 0000:00:02.0: [8086:5917] type 00 class 0x03=
0000
[mar giu 28 18:43:27 2022] pci 0000:00:02.0: reg 0x10: [mem 0xd1000000-0xd1=
ffffff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:00:02.0: reg 0x18: [mem 0xb0000000-0xbf=
ffffff 64bit pref]
[mar giu 28 18:43:27 2022] pci 0000:00:02.0: reg 0x20: [io  0xf000-0xf03f]
[mar giu 28 18:43:27 2022] pci 0000:00:02.0: BAR 2: assigned to efifb
[mar giu 28 18:43:27 2022] pci 0000:00:02.0: Video device with shadowed ROM=
 at [mem 0x000c0000-0x000dffff]
[mar giu 28 18:43:27 2022] pci 0000:00:04.0: [8086:1903] type 00 class 0x11=
8000
[mar giu 28 18:43:27 2022] pci 0000:00:04.0: reg 0x10: [mem 0xd2320000-0xd2=
327fff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c=
0330
[mar giu 28 18:43:27 2022] pci 0000:00:14.0: reg 0x10: [mem 0xd2310000-0xd2=
31ffff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:00:14.0: PME# supported from D3hot D3co=
ld
[mar giu 28 18:43:27 2022] pci 0000:00:14.2: [8086:9d31] type 00 class 0x11=
8000
[mar giu 28 18:43:27 2022] pci 0000:00:14.2: reg 0x10: [mem 0xd2337000-0xd2=
337fff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:00:15.0: [8086:9d60] type 00 class 0x11=
8000
[mar giu 28 18:43:27 2022] pci 0000:00:15.0: reg 0x10: [mem 0xd2336000-0xd2=
336fff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x07=
8000
[mar giu 28 18:43:27 2022] pci 0000:00:16.0: reg 0x10: [mem 0xd2335000-0xd2=
335fff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:00:16.0: PME# supported from D3hot
[mar giu 28 18:43:27 2022] pci 0000:00:17.0: [8086:282a] type 00 class 0x01=
0400
[mar giu 28 18:43:27 2022] pci 0000:00:17.0: reg 0x10: [mem 0xd2330000-0xd2=
331fff]
[mar giu 28 18:43:27 2022] pci 0000:00:17.0: reg 0x14: [mem 0xd2334000-0xd2=
3340ff]
[mar giu 28 18:43:27 2022] pci 0000:00:17.0: reg 0x18: [io  0xf090-0xf097]
[mar giu 28 18:43:27 2022] pci 0000:00:17.0: reg 0x1c: [io  0xf080-0xf083]
[mar giu 28 18:43:27 2022] pci 0000:00:17.0: reg 0x20: [io  0xf060-0xf07f]
[mar giu 28 18:43:27 2022] pci 0000:00:17.0: reg 0x24: [mem 0xd2333000-0xd2=
3337ff]
[mar giu 28 18:43:27 2022] pci 0000:00:17.0: PME# supported from D3hot
[mar giu 28 18:43:27 2022] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x06=
0400
[mar giu 28 18:43:27 2022] pci 0000:00:1c.0: PME# supported from D0 D3hot D=
3cold
[mar giu 28 18:43:27 2022] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x06=
0400
[mar giu 28 18:43:27 2022] pci 0000:00:1c.4: PME# supported from D0 D3hot D=
3cold
[mar giu 28 18:43:27 2022] pci 0000:00:1c.5: [8086:9d15] type 01 class 0x06=
0400
[mar giu 28 18:43:27 2022] pci 0000:00:1c.5: PME# supported from D0 D3hot D=
3cold
[mar giu 28 18:43:27 2022] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x06=
0100
[mar giu 28 18:43:27 2022] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x05=
8000
[mar giu 28 18:43:27 2022] pci 0000:00:1f.2: reg 0x10: [mem 0xd232c000-0xd2=
32ffff]
[mar giu 28 18:43:27 2022] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x04=
0300
[mar giu 28 18:43:27 2022] pci 0000:00:1f.3: reg 0x10: [mem 0xd2328000-0xd2=
32bfff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:00:1f.3: reg 0x20: [mem 0xd2300000-0xd2=
30ffff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:00:1f.3: PME# supported from D3hot D3co=
ld
[mar giu 28 18:43:27 2022] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c=
0500
[mar giu 28 18:43:27 2022] pci 0000:00:1f.4: reg 0x10: [mem 0xd2332000-0xd2=
3320ff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:00:1f.4: reg 0x20: [io  0xf040-0xf05f]
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: [1002:6900] type 00 class 0x03=
8000
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: reg 0x10: [mem 0xc0000000-0xcf=
ffffff 64bit pref]
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: reg 0x18: [mem 0xd0000000-0xd0=
1fffff 64bit pref]
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: reg 0x20: [io  0xe000-0xe0ff]
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: reg 0x24: [mem 0xd0200000-0xd0=
23ffff]
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: reg 0x30: [mem 0xd0240000-0xd0=
25ffff pref]
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: enabling Extended Tags
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: supports D1 D2
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: 31.504 Gb/s available PCIe ban=
dwidth, limited by 8.0 GT/s PCIe x4 link at 0000:00:1c.0 (capable of 63.008=
 Gb/s with 8.0 GT/s PCIe x8 link)
[mar giu 28 18:43:27 2022] pci 0000:00:1c.0: PCI bridge to [bus 01]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.0:   bridge window [io  0xe000-0x=
efff]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.0:   bridge window [mem 0xc000000=
0-0xd02fffff]
[mar giu 28 18:43:27 2022] pci 0000:02:00.0: [10ec:8136] type 00 class 0x02=
0000
[mar giu 28 18:43:27 2022] pci 0000:02:00.0: reg 0x10: [io  0xd000-0xd0ff]
[mar giu 28 18:43:27 2022] pci 0000:02:00.0: reg 0x18: [mem 0xd2204000-0xd2=
204fff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:02:00.0: reg 0x20: [mem 0xd2200000-0xd2=
203fff 64bit pref]
[mar giu 28 18:43:27 2022] pci 0000:02:00.0: supports D1 D2
[mar giu 28 18:43:27 2022] pci 0000:02:00.0: PME# supported from D0 D1 D2 D=
3hot D3cold
[mar giu 28 18:43:27 2022] pci 0000:00:1c.4: PCI bridge to [bus 02]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.4:   bridge window [io  0xd000-0x=
dfff]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.4:   bridge window [mem 0xd220000=
0-0xd22fffff]
[mar giu 28 18:43:27 2022] pci 0000:03:00.0: [168c:0042] type 00 class 0x02=
8000
[mar giu 28 18:43:27 2022] pci 0000:03:00.0: reg 0x10: [mem 0xd2000000-0xd2=
1fffff 64bit]
[mar giu 28 18:43:27 2022] pci 0000:03:00.0: PME# supported from D0 D3hot D=
3cold
[mar giu 28 18:43:27 2022] pci 0000:00:1c.5: PCI bridge to [bus 03]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.5:   bridge window [mem 0xd200000=
0-0xd21fffff]
[mar giu 28 18:43:27 2022] ACPI: PCI: Interrupt link LNKA configured for IR=
Q 10
[mar giu 28 18:43:27 2022] ACPI: PCI: Interrupt link LNKB configured for IR=
Q 10
[mar giu 28 18:43:27 2022] ACPI: PCI: Interrupt link LNKC configured for IR=
Q 11
[mar giu 28 18:43:27 2022] ACPI: PCI: Interrupt link LNKD configured for IR=
Q 11
[mar giu 28 18:43:27 2022] ACPI: PCI: Interrupt link LNKE configured for IR=
Q 11
[mar giu 28 18:43:27 2022] ACPI: PCI: Interrupt link LNKF configured for IR=
Q 11
[mar giu 28 18:43:27 2022] ACPI: PCI: Interrupt link LNKG configured for IR=
Q 11
[mar giu 28 18:43:27 2022] ACPI: PCI: Interrupt link LNKH configured for IR=
Q 11
[mar giu 28 18:43:27 2022] ACPI: EC: interrupt unblocked
[mar giu 28 18:43:27 2022] ACPI: EC: event unblocked
[mar giu 28 18:43:27 2022] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
[mar giu 28 18:43:27 2022] ACPI: EC: GPE=3D0x6e
[mar giu 28 18:43:27 2022] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC initial=
ization complete
[mar giu 28 18:43:27 2022] ACPI: \_SB_.PCI0.LPCB.ECDV: EC: Used to handle t=
ransactions and events
[mar giu 28 18:43:27 2022] iommu: Default domain type: Translated=20
[mar giu 28 18:43:27 2022] iommu: DMA domain TLB invalidation policy: lazy =
mode=20
[mar giu 28 18:43:27 2022] SCSI subsystem initialized
[mar giu 28 18:43:27 2022] libata version 3.00 loaded.
[mar giu 28 18:43:27 2022] ACPI: bus type USB registered
[mar giu 28 18:43:27 2022] usbcore: registered new interface driver usbfs
[mar giu 28 18:43:27 2022] usbcore: registered new interface driver hub
[mar giu 28 18:43:27 2022] usbcore: registered new device driver usb
[mar giu 28 18:43:27 2022] pps_core: LinuxPPS API ver. 1 registered
[mar giu 28 18:43:27 2022] pps_core: Software ver. 5.3.6 - Copyright 2005-2=
007 Rodolfo Giometti <giometti@linux.it>
[mar giu 28 18:43:27 2022] PTP clock support registered
[mar giu 28 18:43:27 2022] EDAC MC: Ver: 3.0.0
[mar giu 28 18:43:27 2022] Registered efivars operations
[mar giu 28 18:43:27 2022] NetLabel: Initializing
[mar giu 28 18:43:27 2022] NetLabel:  domain hash size =3D 128
[mar giu 28 18:43:27 2022] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIP=
SO
[mar giu 28 18:43:27 2022] NetLabel:  unlabeled traffic allowed by default
[mar giu 28 18:43:27 2022] mctp: management component transport protocol co=
re
[mar giu 28 18:43:27 2022] NET: Registered PF_MCTP protocol family
[mar giu 28 18:43:27 2022] PCI: Using ACPI for IRQ routing
[mar giu 28 18:43:27 2022] PCI: pci_cache_line_size set to 64 bytes
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x00058000-0x0005f=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x0009e000-0x0009f=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x01000000-0x03fff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x652bb018-0x67fff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x652c8018-0x67fff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x652d1018-0x67fff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x652ef018-0x67fff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x65300000-0x67fff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x6a5f0000-0x6bfff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x76f84000-0x77fff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x7a19c000-0x7bfff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x7b5ff000-0x7bfff=
fff]
[mar giu 28 18:43:27 2022] e820: reserve RAM buffer [mem 0x47f800000-0x47ff=
fffff]
[mar giu 28 18:43:27 2022] pci 0000:00:02.0: vgaarb: setting as boot VGA de=
vice
[mar giu 28 18:43:27 2022] pci 0000:00:02.0: vgaarb: bridge control possible
[mar giu 28 18:43:27 2022] pci 0000:00:02.0: vgaarb: VGA device added: deco=
des=3Dio+mem,owns=3Dio+mem,locks=3Dnone
[mar giu 28 18:43:27 2022] vgaarb: loaded
[mar giu 28 18:43:27 2022] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0=
, 0, 0
[mar giu 28 18:43:27 2022] hpet0: 8 comparators, 64-bit 24.000000 MHz count=
er
[mar giu 28 18:43:27 2022] clocksource: Switched to clocksource tsc-early
[mar giu 28 18:43:27 2022] VFS: Disk quotas dquot_6.6.0
[mar giu 28 18:43:27 2022] VFS: Dquot-cache hash table entries: 512 (order =
0, 4096 bytes)
[mar giu 28 18:43:27 2022] pnp: PnP ACPI init
[mar giu 28 18:43:27 2022] system 00:00: [io  0x0680-0x069f] has been reser=
ved
[mar giu 28 18:43:27 2022] system 00:00: [io  0xffff] has been reserved
[mar giu 28 18:43:27 2022] system 00:00: [io  0xffff] has been reserved
[mar giu 28 18:43:27 2022] system 00:00: [io  0xffff] has been reserved
[mar giu 28 18:43:27 2022] system 00:00: [io  0x1800-0x18fe] has been reser=
ved
[mar giu 28 18:43:27 2022] system 00:00: [io  0x164e-0x164f] has been reser=
ved
[mar giu 28 18:43:27 2022] system 00:02: [io  0x1854-0x1857] has been reser=
ved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xfed10000-0xfed17fff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xfed18000-0xfed18fff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xfed19000-0xfed19fff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xe0000000-0xefffffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xfed20000-0xfed3ffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xfed90000-0xfed93fff] could =
not be reserved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xfed45000-0xfed8ffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xff000000-0xffffffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xfee00000-0xfeefffff] could =
not be reserved
[mar giu 28 18:43:27 2022] system 00:05: [mem 0xdffe0000-0xdfffffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:06: [mem 0xfd000000-0xfdabffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:06: [mem 0xfdad0000-0xfdadffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:06: [mem 0xfdb00000-0xfdffffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:06: [mem 0xfe000000-0xfe01ffff] could =
not be reserved
[mar giu 28 18:43:27 2022] system 00:06: [mem 0xfe036000-0xfe03bfff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:06: [mem 0xfe03d000-0xfe3fffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:06: [mem 0xfe410000-0xfe7fffff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:07: [io  0xff00-0xfffe] has been reser=
ved
[mar giu 28 18:43:27 2022] system 00:08: [mem 0xfe029000-0xfe029fff] has be=
en reserved
[mar giu 28 18:43:27 2022] system 00:08: [mem 0xfe028000-0xfe028fff] has be=
en reserved
[mar giu 28 18:43:27 2022] pnp: PnP ACPI: found 9 devices
[mar giu 28 18:43:27 2022] clocksource: acpi_pm: mask: 0xffffff max_cycles:=
 0xffffff, max_idle_ns: 2085701024 ns
[mar giu 28 18:43:27 2022] NET: Registered PF_INET protocol family
[mar giu 28 18:43:27 2022] IP idents hash table entries: 262144 (order: 9, =
2097152 bytes, linear)
[mar giu 28 18:43:27 2022] tcp_listen_portaddr_hash hash table entries: 819=
2 (order: 5, 131072 bytes, linear)
[mar giu 28 18:43:27 2022] Table-perturb hash table entries: 65536 (order: =
6, 262144 bytes, linear)
[mar giu 28 18:43:27 2022] TCP established hash table entries: 131072 (orde=
r: 8, 1048576 bytes, linear)
[mar giu 28 18:43:27 2022] TCP bind hash table entries: 65536 (order: 8, 10=
48576 bytes, linear)
[mar giu 28 18:43:27 2022] TCP: Hash tables configured (established 131072 =
bind 65536)
[mar giu 28 18:43:27 2022] MPTCP token hash table entries: 16384 (order: 6,=
 393216 bytes, linear)
[mar giu 28 18:43:27 2022] UDP hash table entries: 8192 (order: 6, 262144 b=
ytes, linear)
[mar giu 28 18:43:27 2022] UDP-Lite hash table entries: 8192 (order: 6, 262=
144 bytes, linear)
[mar giu 28 18:43:27 2022] NET: Registered PF_UNIX/PF_LOCAL protocol family
[mar giu 28 18:43:27 2022] NET: Registered PF_XDP protocol family
[mar giu 28 18:43:27 2022] pci 0000:00:1c.0: PCI bridge to [bus 01]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.0:   bridge window [io  0xe000-0x=
efff]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.0:   bridge window [mem 0xc000000=
0-0xd02fffff]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.4: PCI bridge to [bus 02]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.4:   bridge window [io  0xd000-0x=
dfff]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.4:   bridge window [mem 0xd220000=
0-0xd22fffff]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.5: PCI bridge to [bus 03]
[mar giu 28 18:43:27 2022] pci 0000:00:1c.5:   bridge window [mem 0xd200000=
0-0xd21fffff]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 w=
indow]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff w=
indow]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x00=
0dffff window]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: resource 7 [mem 0x7f800000-0xdf=
ffffff window]
[mar giu 28 18:43:27 2022] pci_bus 0000:00: resource 8 [mem 0xfd000000-0xfe=
7fffff window]
[mar giu 28 18:43:27 2022] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
[mar giu 28 18:43:27 2022] pci_bus 0000:01: resource 1 [mem 0xc0000000-0xd0=
2fffff]
[mar giu 28 18:43:27 2022] pci_bus 0000:02: resource 0 [io  0xd000-0xdfff]
[mar giu 28 18:43:27 2022] pci_bus 0000:02: resource 1 [mem 0xd2200000-0xd2=
2fffff]
[mar giu 28 18:43:27 2022] pci_bus 0000:03: resource 1 [mem 0xd2000000-0xd2=
1fffff]
[mar giu 28 18:43:27 2022] pci 0000:01:00.0: disabling ATS
[mar giu 28 18:43:27 2022] PCI: CLS 0 bytes, default 64
[mar giu 28 18:43:27 2022] DMAR: ACPI device "device:6c" under DMAR at fed9=
1000 as 00:15.0
[mar giu 28 18:43:27 2022] PCI-DMA: Using software bounce buffering for IO =
(SWIOTLB)
[mar giu 28 18:43:27 2022] software IO TLB: mapped [mem 0x0000000072f84000-=
0x0000000076f84000] (64MB)
[mar giu 28 18:43:27 2022] Trying to unpack rootfs image as initramfs...
[mar giu 28 18:43:27 2022] Initialise system trusted keyrings
[mar giu 28 18:43:27 2022] Key type blacklist registered
[mar giu 28 18:43:27 2022] workingset: timestamp_bits=3D36 max_order=3D22 b=
ucket_order=3D0
[mar giu 28 18:43:27 2022] zbud: loaded
[mar giu 28 18:43:27 2022] integrity: Platform Keyring initialized
[mar giu 28 18:43:27 2022] integrity: Machine keyring initialized
[mar giu 28 18:43:27 2022] NET: Registered PF_ALG protocol family
[mar giu 28 18:43:27 2022] xor: automatically using best checksumming funct=
ion   avx      =20
[mar giu 28 18:43:27 2022] Key type asymmetric registered
[mar giu 28 18:43:27 2022] Asymmetric key parser 'x509' registered
[mar giu 28 18:43:27 2022] Freeing initrd memory: 49612K
[mar giu 28 18:43:27 2022] alg: self-tests for CTR-KDF (hmac(sha256)) passed
[mar giu 28 18:43:27 2022] Block layer SCSI generic (bsg) driver version 0.=
4 loaded (major 245)
[mar giu 28 18:43:27 2022] io scheduler mq-deadline registered
[mar giu 28 18:43:27 2022] io scheduler kyber registered
[mar giu 28 18:43:27 2022] io scheduler bfq registered
[mar giu 28 18:43:27 2022] atomic64_test: passed for x86-64 platform with C=
X8 and with SSE
[mar giu 28 18:43:27 2022] pcieport 0000:00:1c.0: PME: Signaling with IRQ 1=
22
[mar giu 28 18:43:27 2022] pcieport 0000:00:1c.0: AER: enabled with IRQ 122
[mar giu 28 18:43:27 2022] pcieport 0000:00:1c.4: PME: Signaling with IRQ 1=
23
[mar giu 28 18:43:27 2022] pcieport 0000:00:1c.4: AER: enabled with IRQ 123
[mar giu 28 18:43:27 2022] pcieport 0000:00:1c.5: PME: Signaling with IRQ 1=
24
[mar giu 28 18:43:27 2022] shpchp: Standard Hot Plug PCI Controller Driver =
version: 0.4
[mar giu 28 18:43:27 2022] ACPI: AC: AC Adapter [AC] (on-line)
[mar giu 28 18:43:27 2022] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYB=
US:00/PNP0C0D:00/input/input0
[mar giu 28 18:43:27 2022] ACPI: button: Lid Switch [LID0]
[mar giu 28 18:43:27 2022] input: Power Button as /devices/LNXSYSTM:00/LNXS=
YBUS:00/PNP0C0C:00/input/input1
[mar giu 28 18:43:27 2022] ACPI: button: Power Button [PBTN]
[mar giu 28 18:43:27 2022] input: Sleep Button as /devices/LNXSYSTM:00/LNXS=
YBUS:00/PNP0C0E:00/input/input2
[mar giu 28 18:43:27 2022] ACPI: button: Sleep Button [SBTN]
[mar giu 28 18:43:27 2022] input: Power Button as /devices/LNXSYSTM:00/LNXP=
WRBN:00/input/input3
[mar giu 28 18:43:27 2022] ACPI: button: Power Button [PWRF]
[mar giu 28 18:43:27 2022] smpboot: Estimated ratio of average max frequenc=
y by base frequency (times 1024): 1894
[mar giu 28 18:43:27 2022] thermal LNXTHERM:00: registered as thermal_zone0
[mar giu 28 18:43:27 2022] ACPI: thermal: Thermal Zone [THM] (25 C)
[mar giu 28 18:43:27 2022] Serial: 8250/16550 driver, 32 ports, IRQ sharing=
 enabled
[mar giu 28 18:43:27 2022] Non-volatile memory driver v1.3
[mar giu 28 18:43:27 2022] Linux agpgart interface v0.103
[mar giu 28 18:43:27 2022] intel-lpss 0000:00:15.0: enabling device (0000 -=
> 0002)
[mar giu 28 18:43:27 2022] ACPI: battery: Slot [BAT0] (battery present)
[mar giu 28 18:43:27 2022] ahci 0000:00:17.0: version 3.0
[mar giu 28 18:43:27 2022] ahci 0000:00:17.0: SSS flag set, parallel bus sc=
an disabled
[mar giu 28 18:43:27 2022] ahci 0000:00:17.0: AHCI 0001.0301 32 slots 3 por=
ts 6 Gbps 0x7 impl RAID mode
[mar giu 28 18:43:27 2022] ahci 0000:00:17.0: flags: 64bit ncq stag pm led =
clo only pio slum part deso sadm sds apst=20
[mar giu 28 18:43:27 2022] scsi host0: ahci
[mar giu 28 18:43:27 2022] scsi host1: ahci
[mar giu 28 18:43:27 2022] scsi host2: ahci
[mar giu 28 18:43:27 2022] ata1: SATA max UDMA/133 abar m2048@0xd2333000 po=
rt 0xd2333100 irq 125
[mar giu 28 18:43:27 2022] ata2: SATA max UDMA/133 abar m2048@0xd2333000 po=
rt 0xd2333180 irq 125
[mar giu 28 18:43:27 2022] ata3: SATA max UDMA/133 abar m2048@0xd2333000 po=
rt 0xd2333200 irq 125
[mar giu 28 18:43:27 2022] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EH=
CI) Driver
[mar giu 28 18:43:27 2022] ehci-pci: EHCI PCI platform driver
[mar giu 28 18:43:27 2022] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) =
Driver
[mar giu 28 18:43:27 2022] ohci-pci: OHCI PCI platform driver
[mar giu 28 18:43:27 2022] uhci_hcd: USB Universal Host Controller Interfac=
e driver
[mar giu 28 18:43:27 2022] xhci_hcd 0000:00:14.0: xHCI Host Controller
[mar giu 28 18:43:27 2022] xhci_hcd 0000:00:14.0: new USB bus registered, a=
ssigned bus number 1
[mar giu 28 18:43:27 2022] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci=
 version 0x100 quirks 0x0000000081109810
[mar giu 28 18:43:27 2022] xhci_hcd 0000:00:14.0: xHCI Host Controller
[mar giu 28 18:43:27 2022] xhci_hcd 0000:00:14.0: new USB bus registered, a=
ssigned bus number 2
[mar giu 28 18:43:27 2022] xhci_hcd 0000:00:14.0: Host supports USB 3.0 Sup=
erSpeed
[mar giu 28 18:43:27 2022] usb usb1: New USB device found, idVendor=3D1d6b,=
 idProduct=3D0002, bcdDevice=3D 5.18
[mar giu 28 18:43:27 2022] usb usb1: New USB device strings: Mfr=3D3, Produ=
ct=3D2, SerialNumber=3D1
[mar giu 28 18:43:27 2022] usb usb1: Product: xHCI Host Controller
[mar giu 28 18:43:27 2022] usb usb1: Manufacturer: Linux 5.18.6-100.fc35.x8=
6_64 xhci-hcd
[mar giu 28 18:43:27 2022] usb usb1: SerialNumber: 0000:00:14.0
[mar giu 28 18:43:27 2022] hub 1-0:1.0: USB hub found
[mar giu 28 18:43:27 2022] hub 1-0:1.0: 12 ports detected
[mar giu 28 18:43:27 2022] usb usb2: New USB device found, idVendor=3D1d6b,=
 idProduct=3D0003, bcdDevice=3D 5.18
[mar giu 28 18:43:27 2022] usb usb2: New USB device strings: Mfr=3D3, Produ=
ct=3D2, SerialNumber=3D1
[mar giu 28 18:43:27 2022] usb usb2: Product: xHCI Host Controller
[mar giu 28 18:43:27 2022] usb usb2: Manufacturer: Linux 5.18.6-100.fc35.x8=
6_64 xhci-hcd
[mar giu 28 18:43:27 2022] usb usb2: SerialNumber: 0000:00:14.0
[mar giu 28 18:43:27 2022] hub 2-0:1.0: USB hub found
[mar giu 28 18:43:27 2022] hub 2-0:1.0: 6 ports detected
[mar giu 28 18:43:27 2022] usb: port power management may be unreliable
[mar giu 28 18:43:27 2022] usbcore: registered new interface driver usbseri=
al_generic
[mar giu 28 18:43:27 2022] usbserial: USB Serial support registered for gen=
eric
[mar giu 28 18:43:27 2022] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f1=
3:PS2M] at 0x60,0x64 irq 1,12
[mar giu 28 18:43:27 2022] i8042: Warning: Keylock active
[mar giu 28 18:43:27 2022] serio: i8042 KBD port at 0x60,0x64 irq 1
[mar giu 28 18:43:27 2022] serio: i8042 AUX port at 0x60,0x64 irq 12
[mar giu 28 18:43:27 2022] mousedev: PS/2 mouse device common for all mice
[mar giu 28 18:43:27 2022] rtc_cmos 00:01: RTC can wake from S4
[mar giu 28 18:43:27 2022] input: AT Translated Set 2 keyboard as /devices/=
platform/i8042/serio0/input/input4
[mar giu 28 18:43:27 2022] rtc_cmos 00:01: registered as rtc0
[mar giu 28 18:43:27 2022] rtc_cmos 00:01: setting system clock to 2022-06-=
28T16:33:39 UTC (1656434019)
[mar giu 28 18:43:27 2022] rtc_cmos 00:01: alarms up to one month, y3k, 242=
 bytes nvram, hpet irqs
[mar giu 28 18:43:27 2022] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE i=
s disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[mar giu 28 18:43:27 2022] device-mapper: uevent: version 1.0.3
[mar giu 28 18:43:27 2022] device-mapper: ioctl: 4.46.0-ioctl (2022-02-22) =
initialised: dm-devel@redhat.com
[mar giu 28 18:43:27 2022] intel_pstate: Intel P-state driver initializing
[mar giu 28 18:43:27 2022] intel_pstate: HWP enabled
[mar giu 28 18:43:27 2022] efifb: probing for efifb
[mar giu 28 18:43:27 2022] efifb: showing boot graphics
[mar giu 28 18:43:27 2022] efifb: framebuffer at 0xb0000000, using 8100k, t=
otal 8100k
[mar giu 28 18:43:27 2022] efifb: mode is 1920x1080x32, linelength=3D7680, =
pages=3D1
[mar giu 28 18:43:27 2022] efifb: scrolling: redraw
[mar giu 28 18:43:27 2022] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:=
8:0
[mar giu 28 18:43:27 2022] fbcon: Deferring console take-over
[mar giu 28 18:43:27 2022] fb0: EFI VGA frame buffer device
[mar giu 28 18:43:27 2022] hid: raw HID events driver (C) Jiri Kosina
[mar giu 28 18:43:27 2022] usbcore: registered new interface driver usbhid
[mar giu 28 18:43:27 2022] usbhid: USB HID core driver
[mar giu 28 18:43:27 2022] intel_pmc_core INT33A1:00:  initialized
[mar giu 28 18:43:27 2022] drop_monitor: Initializing network drop monitor =
service
[mar giu 28 18:43:27 2022] Initializing XFRM netlink socket
[mar giu 28 18:43:27 2022] NET: Registered PF_INET6 protocol family
[mar giu 28 18:43:27 2022] Segment Routing with IPv6
[mar giu 28 18:43:27 2022] RPL Segment Routing with IPv6
[mar giu 28 18:43:27 2022] In-situ OAM (IOAM) with IPv6
[mar giu 28 18:43:27 2022] mip6: Mobile IPv6
[mar giu 28 18:43:27 2022] NET: Registered PF_PACKET protocol family
[mar giu 28 18:43:27 2022] microcode: sig=3D0x806ea, pf=3D0x80, revision=3D=
0xf0
[mar giu 28 18:43:27 2022] microcode: Microcode Update Driver: v2.2.
[mar giu 28 18:43:27 2022] IPI shorthand broadcast: enabled
[mar giu 28 18:43:27 2022] AVX2 version of gcm_enc/dec engaged.
[mar giu 28 18:43:27 2022] AES CTR mode by8 optimization enabled
[mar giu 28 18:43:27 2022] sched_clock: Marking stable (721113614, 3461572)=
=2D>(729578588, -5003402)
[mar giu 28 18:43:27 2022] registered taskstats version 1
[mar giu 28 18:43:27 2022] Loading compiled-in X.509 certificates
[mar giu 28 18:43:27 2022] Loaded X.509 cert 'Fedora kernel signing key: 55=
a52a26549010113d08a2b5012d99be3a760346'
[mar giu 28 18:43:27 2022] zswap: loaded using pool lzo/zbud
[mar giu 28 18:43:27 2022] page_owner is disabled
[mar giu 28 18:43:27 2022] Key type ._fscrypt registered
[mar giu 28 18:43:27 2022] Key type .fscrypt registered
[mar giu 28 18:43:27 2022] Key type fscrypt-provisioning registered
[mar giu 28 18:43:27 2022] Btrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dy=
es, fsverity=3Dyes
[mar giu 28 18:43:27 2022] Key type big_key registered
[mar giu 28 18:43:27 2022] Key type trusted registered
[mar giu 28 18:43:27 2022] Key type encrypted registered
[mar giu 28 18:43:27 2022] integrity: Loading X.509 certificate: UEFI:db
[mar giu 28 18:43:27 2022] integrity: Loaded X.509 cert 'Dell Inc. UEFI DB:=
 5ddb772dc880660055ba0bc131886bb630a639e7'
[mar giu 28 18:43:27 2022] integrity: Loading X.509 certificate: UEFI:db
[mar giu 28 18:43:27 2022] integrity: Loaded X.509 cert 'Microsoft Corporat=
ion UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[mar giu 28 18:43:27 2022] integrity: Loading X.509 certificate: UEFI:db
[mar giu 28 18:43:27 2022] integrity: Loaded X.509 cert 'Microsoft Windows =
Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[mar giu 28 18:43:27 2022] Loading compiled-in module X.509 certificates
[mar giu 28 18:43:27 2022] Loaded X.509 cert 'Fedora kernel signing key: 55=
a52a26549010113d08a2b5012d99be3a760346'
[mar giu 28 18:43:27 2022] ima: Allocated hash algorithm: sha256
[mar giu 28 18:43:27 2022] ima: No architecture policies found
[mar giu 28 18:43:27 2022] evm: Initialising EVM extended attributes:
[mar giu 28 18:43:27 2022] evm: security.selinux
[mar giu 28 18:43:27 2022] evm: security.SMACK64 (disabled)
[mar giu 28 18:43:27 2022] evm: security.SMACK64EXEC (disabled)
[mar giu 28 18:43:27 2022] evm: security.SMACK64TRANSMUTE (disabled)
[mar giu 28 18:43:27 2022] evm: security.SMACK64MMAP (disabled)
[mar giu 28 18:43:27 2022] evm: security.apparmor (disabled)
[mar giu 28 18:43:27 2022] evm: security.ima
[mar giu 28 18:43:27 2022] evm: security.capability
[mar giu 28 18:43:27 2022] evm: HMAC attrs: 0x1
[mar giu 28 18:43:27 2022] alg: No test for 842 (842-scomp)
[mar giu 28 18:43:27 2022] alg: No test for 842 (842-generic)
[mar giu 28 18:43:27 2022] PM:   Magic number: 10:830:591
[mar giu 28 18:43:27 2022] RAS: Correctable Errors collector initialized.
[mar giu 28 18:43:27 2022] usb 1-2: new low-speed USB device number 2 using=
 xhci_hcd
[mar giu 28 18:43:28 2022] ata1: SATA link up 6.0 Gbps (SStatus 133 SContro=
l 300)
[mar giu 28 18:43:28 2022] ata1.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 18:43:28 2022] ata1.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 18:43:28 2022] ata1.00: supports DRM functions and may not be f=
ully accessible
[mar giu 28 18:43:28 2022] ata1.00: ATA-11: Samsung SSD 860 EVO 1TB, RVT04B=
6Q, max UDMA/133
[mar giu 28 18:43:28 2022] ata1.00: 1953525168 sectors, multi 1: LBA48 NCQ =
(depth 32), AA
[mar giu 28 18:43:28 2022] ata1.00: Features: Trust Dev-Sleep NCQ-sndrcv
[mar giu 28 18:43:28 2022] ata1.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 18:43:28 2022] ata1.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 18:43:28 2022] ata1.00: supports DRM functions and may not be f=
ully accessible
[mar giu 28 18:43:28 2022] ata1.00: configured for UDMA/133
[mar giu 28 18:43:28 2022] scsi 0:0:0:0: Direct-Access     ATA      Samsung=
 SSD 860  4B6Q PQ: 0 ANSI: 5
[mar giu 28 18:43:28 2022] sd 0:0:0:0: Attached scsi generic sg0 type 0
[mar giu 28 18:43:28 2022] ata1.00: Enabling discard_zeroes_data
[mar giu 28 18:43:28 2022] sd 0:0:0:0: [sda] 1953525168 512-byte logical bl=
ocks: (1.00 TB/932 GiB)
[mar giu 28 18:43:28 2022] sd 0:0:0:0: [sda] Write Protect is off
[mar giu 28 18:43:28 2022] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[mar giu 28 18:43:28 2022] sd 0:0:0:0: [sda] Write cache: enabled, read cac=
he: enabled, doesn't support DPO or FUA
[mar giu 28 18:43:28 2022] ata1.00: Enabling discard_zeroes_data
[mar giu 28 18:43:28 2022]  sda: sda1 sda2 sda3 sda4
[mar giu 28 18:43:28 2022] ata1.00: Enabling discard_zeroes_data
[mar giu 28 18:43:28 2022] sd 0:0:0:0: [sda] supports TCG Opal
[mar giu 28 18:43:28 2022] sd 0:0:0:0: [sda] Attached SCSI disk
[mar giu 28 18:43:28 2022] usb 1-2: New USB device found, idVendor=3D0e8f, =
idProduct=3D0020, bcdDevice=3D 2.01
[mar giu 28 18:43:28 2022] usb 1-2: New USB device strings: Mfr=3D1, Produc=
t=3D2, SerialNumber=3D0
[mar giu 28 18:43:28 2022] usb 1-2: Product: PS2toUSB Adapter
[mar giu 28 18:43:28 2022] usb 1-2: Manufacturer: GASIA
[mar giu 28 18:43:28 2022] input: GASIA PS2toUSB Adapter as /devices/pci000=
0:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:0E8F:0020.0001/input/input7
[mar giu 28 18:43:28 2022] hid-generic 0003:0E8F:0020.0001: input,hidraw0: =
USB HID v1.10 Keyboard [GASIA PS2toUSB Adapter] on usb-0000:00:14.0-2/input0
[mar giu 28 18:43:28 2022] input: GASIA PS2toUSB Adapter Mouse as /devices/=
pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:0E8F:0020.0002/input/input8
[mar giu 28 18:43:28 2022] input: GASIA PS2toUSB Adapter System Control as =
/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:0E8F:0020.0002/input=
/input9
[mar giu 28 18:43:28 2022] input: GASIA PS2toUSB Adapter Consumer Control a=
s /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.1/0003:0E8F:0020.0002/inp=
ut/input10
[mar giu 28 18:43:28 2022] hid-generic 0003:0E8F:0020.0002: input,hidraw1: =
USB HID v1.10 Mouse [GASIA PS2toUSB Adapter] on usb-0000:00:14.0-2/input1
[mar giu 28 18:43:28 2022] usb 1-5: new high-speed USB device number 3 usin=
g xhci_hcd
[mar giu 28 18:43:28 2022] ata2: SATA link up 1.5 Gbps (SStatus 113 SContro=
l 300)
[mar giu 28 18:43:28 2022] tsc: Refined TSC clocksource calibration: 1991.9=
99 MHz
[mar giu 28 18:43:28 2022] clocksource: tsc: mask: 0xffffffffffffffff max_c=
ycles: 0x396d4ffc055, max_idle_ns: 881590662783 ns
[mar giu 28 18:43:28 2022] clocksource: Switched to clocksource tsc
[mar giu 28 18:43:28 2022] ata2.00: ATAPI: HL-DT-ST DVD+/-RW GU90N, A1C2, m=
ax UDMA/100
[mar giu 28 18:43:28 2022] ata2.00: configured for UDMA/100
[mar giu 28 18:43:28 2022] scsi 1:0:0:0: CD-ROM            HL-DT-ST DVD+-RW=
 GU90N    A1C2 PQ: 0 ANSI: 5
[mar giu 28 18:43:28 2022] sr 1:0:0:0: [sr0] scsi3-mmc drive: 24x/24x write=
r dvd-ram cd/rw xa/form2 cdda tray
[mar giu 28 18:43:28 2022] cdrom: Uniform CD-ROM driver Revision: 3.20
[mar giu 28 18:43:28 2022] sr 1:0:0:0: Attached scsi CD-ROM sr0
[mar giu 28 18:43:28 2022] sr 1:0:0:0: Attached scsi generic sg1 type 5
[mar giu 28 18:43:28 2022] usb 1-5: New USB device found, idVendor=3D0bda, =
idProduct=3D568a, bcdDevice=3D65.10
[mar giu 28 18:43:28 2022] usb 1-5: New USB device strings: Mfr=3D3, Produc=
t=3D1, SerialNumber=3D2
[mar giu 28 18:43:28 2022] usb 1-5: Product: Integrated Webcam
[mar giu 28 18:43:28 2022] usb 1-5: Manufacturer: CNFFH36N4154000B4A62
[mar giu 28 18:43:28 2022] usb 1-5: SerialNumber: 0x0001
[mar giu 28 18:43:28 2022] usb 1-6: new high-speed USB device number 4 usin=
g xhci_hcd
[mar giu 28 18:43:28 2022] input: AlpsPS/2 ALPS GlidePoint as /devices/plat=
form/i8042/serio1/input/input6
[mar giu 28 18:43:28 2022] usb 1-6: New USB device found, idVendor=3D0bda, =
idProduct=3D0129, bcdDevice=3D39.60
[mar giu 28 18:43:28 2022] usb 1-6: New USB device strings: Mfr=3D1, Produc=
t=3D2, SerialNumber=3D3
[mar giu 28 18:43:28 2022] usb 1-6: Product: USB2.0-CRW
[mar giu 28 18:43:28 2022] usb 1-6: Manufacturer: Generic
[mar giu 28 18:43:28 2022] usb 1-6: SerialNumber: 20100201396000000
[mar giu 28 18:43:28 2022] ata3: SATA link up 6.0 Gbps (SStatus 133 SContro=
l 300)
[mar giu 28 18:43:28 2022] ata3.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 18:43:28 2022] ata3.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 18:43:28 2022] ata3.00: ATA-10: SK hynix SC311 SATA 128GB, 7000=
0P10, max UDMA/133
[mar giu 28 18:43:28 2022] ata3.00: 250069680 sectors, multi 1: LBA48 NCQ (=
depth 32), AA
[mar giu 28 18:43:28 2022] ata3.00: Features: Dev-Sleep
[mar giu 28 18:43:28 2022] ata3.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 18:43:28 2022] ata3.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 18:43:28 2022] ata3.00: configured for UDMA/133
[mar giu 28 18:43:28 2022] scsi 2:0:0:0: Direct-Access     ATA      SK hyni=
x SC311 S 0P10 PQ: 0 ANSI: 5
[mar giu 28 18:43:28 2022] sd 2:0:0:0: Attached scsi generic sg2 type 0
[mar giu 28 18:43:28 2022] sd 2:0:0:0: [sdb] 250069680 512-byte logical blo=
cks: (128 GB/119 GiB)
[mar giu 28 18:43:28 2022] sd 2:0:0:0: [sdb] 4096-byte physical blocks
[mar giu 28 18:43:28 2022] sd 2:0:0:0: [sdb] Write Protect is off
[mar giu 28 18:43:28 2022] sd 2:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[mar giu 28 18:43:28 2022] sd 2:0:0:0: [sdb] Write cache: enabled, read cac=
he: enabled, doesn't support DPO or FUA
[mar giu 28 18:43:28 2022]  sdb: sdb1 sdb2 sdb3 sdb4 sdb5 sdb6
[mar giu 28 18:43:28 2022] sd 2:0:0:0: [sdb] Attached SCSI disk
[mar giu 28 18:43:28 2022] PM: Image not found (code -22)
[mar giu 28 18:43:28 2022] Freeing unused decrypted memory: 2036K
[mar giu 28 18:43:28 2022] Freeing unused kernel image (initmem) memory: 27=
08K
[mar giu 28 18:43:28 2022] Write protecting the kernel read-only data: 3072=
0k
[mar giu 28 18:43:28 2022] Freeing unused kernel image (text/rodata gap) me=
mory: 2036K
[mar giu 28 18:43:28 2022] Freeing unused kernel image (rodata/data gap) me=
mory: 1360K
[mar giu 28 18:43:28 2022] usb 1-7: new full-speed USB device number 5 usin=
g xhci_hcd
[mar giu 28 18:43:28 2022] x86/mm: Checked W+X mappings: passed, no W+X pag=
es found.
[mar giu 28 18:43:28 2022] rodata_test: all tests were successful
[mar giu 28 18:43:28 2022] x86/mm: Checking user space page tables
[mar giu 28 18:43:28 2022] x86/mm: Checked W+X mappings: passed, no W+X pag=
es found.
[mar giu 28 18:43:28 2022] Run /init as init process
[mar giu 28 18:43:28 2022]   with arguments:
[mar giu 28 18:43:28 2022]     /init
[mar giu 28 18:43:28 2022]     rhgb
[mar giu 28 18:43:28 2022]   with environment:
[mar giu 28 18:43:28 2022]     HOME=3D/
[mar giu 28 18:43:28 2022]     TERM=3Dlinux
[mar giu 28 18:43:28 2022]     BOOT_IMAGE=3D(hd0,gpt4)/boot/vmlinuz-5.18.6-=
100.fc35.x86_64
[mar giu 28 18:43:28 2022] systemd[1]: systemd v249.12-5.fc35 running in sy=
stem mode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNU=
TLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIB=
CRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +BZIP2 +LZ4 +XZ +Z=
LIB +ZSTD +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)
[mar giu 28 18:43:28 2022] systemd[1]: Detected architecture x86-64.
[mar giu 28 18:43:28 2022] systemd[1]: Running in initial RAM disk.
[mar giu 28 18:43:28 2022] systemd[1]: Hostname set to <fedora>.
[mar giu 28 18:43:28 2022] usb 1-7: New USB device found, idVendor=3D0cf3, =
idProduct=3De009, bcdDevice=3D 0.01
[mar giu 28 18:43:28 2022] usb 1-7: New USB device strings: Mfr=3D0, Produc=
t=3D0, SerialNumber=3D0
[mar giu 28 18:43:28 2022] systemd[1]: Queued start job for default target =
Initrd Default Target.
[mar giu 28 18:43:28 2022] systemd[1]: Created slice Slice /system/systemd-=
hibernate-resume.
[mar giu 28 18:43:28 2022] systemd[1]: Reached target Initrd /usr File Syst=
em.
[mar giu 28 18:43:28 2022] systemd[1]: Reached target Slice Units.
[mar giu 28 18:43:28 2022] systemd[1]: Reached target Swaps.
[mar giu 28 18:43:28 2022] systemd[1]: Reached target Timer Units.
[mar giu 28 18:43:28 2022] systemd[1]: Listening on D-Bus System Message Bu=
s Socket.
[mar giu 28 18:43:28 2022] systemd[1]: Listening on Journal Audit Socket.
[mar giu 28 18:43:28 2022] systemd[1]: Listening on Journal Socket (/dev/lo=
g).
[mar giu 28 18:43:28 2022] systemd[1]: Listening on Journal Socket.
[mar giu 28 18:43:28 2022] systemd[1]: Listening on udev Control Socket.
[mar giu 28 18:43:28 2022] systemd[1]: Listening on udev Kernel Socket.
[mar giu 28 18:43:28 2022] systemd[1]: Reached target Socket Units.
[mar giu 28 18:43:28 2022] systemd[1]: Starting Create List of Static Devic=
e Nodes...
[mar giu 28 18:43:28 2022] systemd[1]: Condition check resulted in Memstrac=
k Anylazing Service being skipped.
[mar giu 28 18:43:28 2022] systemd[1]: Started Hardware RNG Entropy Gathere=
r Daemon.
[mar giu 28 18:43:28 2022] systemd[1]: Starting Journal Service...
[mar giu 28 18:43:28 2022] systemd[1]: Starting Load Kernel Modules...
[mar giu 28 18:43:28 2022] systemd[1]: Condition check resulted in Create S=
ystem Users being skipped.
[mar giu 28 18:43:28 2022] systemd[1]: Starting Setup Virtual Console...
[mar giu 28 18:43:28 2022] systemd[1]: Finished Create List of Static Devic=
e Nodes.
[mar giu 28 18:43:28 2022] systemd[1]: Starting Create Static Device Nodes =
in /dev...
[mar giu 28 18:43:28 2022] systemd[1]: Finished Create Static Device Nodes =
in /dev.
[mar giu 28 18:43:28 2022] systemd[1]: Finished Setup Virtual Console.
[mar giu 28 18:43:28 2022] audit: type=3D1130 audit(1656434020.769:2): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=
=3Dsystemd-vconsole-setup comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:28 2022] systemd[1]: Condition check resulted in dracut a=
sk for additional cmdline parameters being skipped.
[mar giu 28 18:43:28 2022] systemd[1]: Starting dracut cmdline hook...
[mar giu 28 18:43:28 2022] systemd[1]: Started Journal Service.
[mar giu 28 18:43:28 2022] audit: type=3D1130 audit(1656434020.791:3): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=
=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostn=
ame=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:28 2022] IPMI message handler: version 39.2
[mar giu 28 18:43:28 2022] ipmi device interface
[mar giu 28 18:43:29 2022] audit: type=3D1130 audit(1656434020.802:4): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=
=3Dsystemd-tmpfiles-setup comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd"=
 hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:29 2022] fuse: init (API version 7.36)
[mar giu 28 18:43:29 2022] audit: type=3D1130 audit(1656434020.812:5): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=
=3Dsystemd-modules-load comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" h=
ostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:29 2022] audit: type=3D1130 audit(1656434020.817:6): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=
=3Ddracut-cmdline comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostnam=
e=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:29 2022] audit: type=3D1130 audit(1656434020.819:7): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=
=3Dsystemd-sysctl comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostnam=
e=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:29 2022] audit: type=3D1130 audit(1656434020.836:8): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=
=3Ddracut-pre-udev comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostna=
me=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:29 2022] audit: type=3D1334 audit(1656434020.837:9): prog=
=2Did=3D6 op=3DLOAD
[mar giu 28 18:43:29 2022] audit: type=3D1334 audit(1656434020.837:10): pro=
g-id=3D7 op=3DLOAD
[mar giu 28 18:43:29 2022] wmi_bus wmi_bus-PNP0C14:00: WQBC data block quer=
y control method not found
[mar giu 28 18:43:29 2022] usbcore: registered new interface driver rtsx_usb
[mar giu 28 18:43:29 2022] r8169 0000:02:00.0 eth0: RTL8106e, 8c:ec:4b:19:4=
8:60, XID 449, IRQ 127
[mar giu 28 18:43:29 2022] PM: Image not found (code -22)
[mar giu 28 18:43:29 2022] ACPI: bus type drm_connector registered
[mar giu 28 18:43:29 2022] input: DELL0810:00 044E:120A Mouse as /devices/p=
ci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-DELL0810:00/0018:044E:120=
A.0003/input/input11
[mar giu 28 18:43:29 2022] input: DELL0810:00 044E:120A Touchpad as /device=
s/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-DELL0810:00/0018:044E:=
120A.0003/input/input12
[mar giu 28 18:43:29 2022] input: DELL0810:00 044E:120A as /devices/pci0000=
:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-DELL0810:00/0018:044E:120A.0003=
/input/input13
[mar giu 28 18:43:29 2022] hid-generic 0018:044E:120A.0003: input,hidraw2: =
I2C HID v1.00 Mouse [DELL0810:00 044E:120A] on i2c-DELL0810:00
[mar giu 28 18:43:29 2022] r8169 0000:02:00.0 enp2s0: renamed from eth0
[mar giu 28 18:43:29 2022] AMD-Vi: AMD IOMMUv2 functionality not available =
on this system - This is not a bug.
[mar giu 28 18:43:29 2022] input: DELL0810:00 044E:120A Mouse as /devices/p=
ci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-DELL0810:00/0018:044E:120=
A.0003/input/input14
[mar giu 28 18:43:29 2022] input: DELL0810:00 044E:120A Touchpad as /device=
s/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-DELL0810:00/0018:044E:=
120A.0003/input/input15
[mar giu 28 18:43:29 2022] input: DELL0810:00 044E:120A UNKNOWN as /devices=
/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-DELL0810:00/0018:044E:1=
20A.0003/input/input16
[mar giu 28 18:43:29 2022] hid-multitouch 0018:044E:120A.0003: input,hidraw=
2: I2C HID v1.00 Mouse [DELL0810:00 044E:120A] on i2c-DELL0810:00
[mar giu 28 18:43:29 2022] checking generic (b0000000 7e9000) vs hw (d10000=
00 1000000)
[mar giu 28 18:43:29 2022] checking generic (b0000000 7e9000) vs hw (b00000=
00 10000000)
[mar giu 28 18:43:29 2022] fb0: switching to i915 from EFI VGA
[mar giu 28 18:43:29 2022] i915 0000:00:02.0: vgaarb: deactivate vga console
[mar giu 28 18:43:29 2022] i915 0000:00:02.0: vgaarb: changed VGA decodes: =
olddecodes=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
[mar giu 28 18:43:29 2022] i915 0000:00:02.0: [drm] Finished loading DMC fi=
rmware i915/kbl_dmc_ver1_04.bin (v1.4)
[mar giu 28 18:43:29 2022] [drm] Initialized i915 1.6.0 20201103 for 0000:0=
0:02.0 on minor 0
[mar giu 28 18:43:30 2022] ACPI: video: Video Device [GFX0] (multi-head: ye=
s  rom: no  post: no)
[mar giu 28 18:43:30 2022] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBU=
S:00/PNP0A08:00/LNXVIDEO:00/input/input17
[mar giu 28 18:43:30 2022] [drm] amdgpu kernel modesetting enabled.
[mar giu 28 18:43:30 2022] amdgpu: vga_switcheroo: detected switching metho=
d \_SB_.PCI0.GFX0.ATPX handle
[mar giu 28 18:43:30 2022] ATPX version 1, functions 0x00000033
[mar giu 28 18:43:30 2022] ATPX Hybrid Graphics
[mar giu 28 18:43:30 2022] amdgpu: CRAT table not found
[mar giu 28 18:43:30 2022] amdgpu: Virtual CRAT table created for CPU
[mar giu 28 18:43:30 2022] amdgpu: Topology: Add CPU node
[mar giu 28 18:43:30 2022] amdgpu 0000:01:00.0: enabling device (0006 -> 00=
07)
[mar giu 28 18:43:30 2022] [drm] initializing kernel modesetting (TOPAZ 0x1=
002:0x6900 0x1028:0x0810 0xC1).
[mar giu 28 18:43:30 2022] amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone=
 (TMZ) feature not supported
[mar giu 28 18:43:30 2022] [drm] register mmio base: 0xD0200000
[mar giu 28 18:43:30 2022] [drm] register mmio size: 262144
[mar giu 28 18:43:30 2022] [drm] add ip block number 0 <vi_common>
[mar giu 28 18:43:30 2022] [drm] add ip block number 1 <gmc_v7_0>
[mar giu 28 18:43:30 2022] [drm] add ip block number 2 <iceland_ih>
[mar giu 28 18:43:30 2022] [drm] add ip block number 3 <gfx_v8_0>
[mar giu 28 18:43:30 2022] [drm] add ip block number 4 <sdma_v2_4>
[mar giu 28 18:43:30 2022] [drm] add ip block number 5 <powerplay>
[mar giu 28 18:43:30 2022] kfd kfd: amdgpu: TOPAZ  not supported in kfd
[mar giu 28 18:43:30 2022] amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from =
ATRM
[mar giu 28 18:43:30 2022] amdgpu: ATOM BIOS: BR42924.002
[mar giu 28 18:43:30 2022] amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is =
not supported
[mar giu 28 18:43:30 2022] [drm] GPU posting now...
[mar giu 28 18:43:30 2022] [drm] vm size is 64 GB, 2 levels, block size is =
10-bit, fragment size is 9-bit
[mar giu 28 18:43:30 2022] amdgpu 0000:01:00.0: amdgpu: VRAM: 4096M 0x00000=
0F400000000 - 0x000000F4FFFFFFFF (4096M used)
[mar giu 28 18:43:30 2022] amdgpu 0000:01:00.0: amdgpu: GART: 256M 0x000000=
=46F00000000 - 0x000000FF0FFFFFFF
[mar giu 28 18:43:30 2022] [drm] Detected VRAM RAM=3D4096M, BAR=3D256M
[mar giu 28 18:43:30 2022] [drm] RAM width 64bits GDDR5
[mar giu 28 18:43:30 2022] [drm] amdgpu: 4096M of VRAM memory ready
[mar giu 28 18:43:30 2022] [drm] amdgpu: 4096M of GTT memory ready.
[mar giu 28 18:43:30 2022] [drm] GART: num cpu pages 65536, num gpu pages 6=
5536
[mar giu 28 18:43:30 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 18:43:30 2022] [drm] Chained IB support enabled!
[mar giu 28 18:43:30 2022] amdgpu: hwmgr_sw_init smu backed is iceland_smu
[mar giu 28 18:43:30 2022] fbcon: i915drmfb (fb0) is primary device
[mar giu 28 18:43:30 2022] fbcon: Deferring console take-over
[mar giu 28 18:43:30 2022] i915 0000:00:02.0: [drm] fb0: i915drmfb frame bu=
ffer device
[mar giu 28 18:43:30 2022] amdgpu: can't get the mac of 5
[mar giu 28 18:43:30 2022] amdgpu 0000:01:00.0: amdgpu: SE 1, SH per SE 1, =
CU per SH 6, active_cu_number 6
[mar giu 28 18:43:30 2022] amdgpu 0000:01:00.0: amdgpu: Using BOCO for runt=
ime pm
[mar giu 28 18:43:30 2022] [drm] Initialized amdgpu 3.46.0 20150101 for 000=
0:01:00.0 on minor 1
[mar giu 28 18:43:30 2022] EXT4-fs (sda4): mounted filesystem with ordered =
data mode. Quota mode: none.
[mar giu 28 18:43:31 2022] systemd-journald[278]: Received SIGTERM from PID=
 1 (systemd).
[mar giu 28 18:43:31 2022] SELinux:  policy capability network_peer_control=
s=3D1
[mar giu 28 18:43:31 2022] SELinux:  policy capability open_perms=3D1
[mar giu 28 18:43:31 2022] SELinux:  policy capability extended_socket_clas=
s=3D1
[mar giu 28 18:43:31 2022] SELinux:  policy capability always_check_network=
=3D0
[mar giu 28 18:43:31 2022] SELinux:  policy capability cgroup_seclabel=3D1
[mar giu 28 18:43:31 2022] SELinux:  policy capability nnp_nosuid_transitio=
n=3D1
[mar giu 28 18:43:31 2022] SELinux:  policy capability genfs_seclabel_symli=
nks=3D0
[mar giu 28 18:43:31 2022] SELinux:  policy capability ioctl_skip_cloexec=
=3D0
[mar giu 28 18:43:32 2022] systemd[1]: Successfully loaded SELinux policy i=
n 101.895ms.
[mar giu 28 18:43:32 2022] systemd[1]: RTC configured in localtime, applyin=
g delta of 120 minutes to system time.
[mar giu 28 18:43:32 2022] systemd[1]: Relabelled /dev, /dev/shm, /run, /sy=
s/fs/cgroup in 25.766ms.
[mar giu 28 18:43:32 2022] systemd[1]: systemd v249.12-5.fc35 running in sy=
stem mode (+PAM +AUDIT +SELINUX -APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNU=
TLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIB=
CRYPTSETUP +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +BZIP2 +LZ4 +XZ +Z=
LIB +ZSTD +XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)
[mar giu 28 18:43:32 2022] systemd[1]: Detected architecture x86-64.
[mar giu 28 18:43:32 2022] systemd-sysv-generator[570]: SysV service '/etc/=
rc.d/init.d/livesys' lacks a native systemd unit file. Automatically genera=
ting a unit file for compatibility. Please update package to include a nati=
ve systemd unit file, in order to make it more safe and robust.
[mar giu 28 18:43:32 2022] systemd-sysv-generator[570]: SysV service '/etc/=
rc.d/init.d/livesys-late' lacks a native systemd unit file. Automatically g=
enerating a unit file for compatibility. Please update package to include a=
 native systemd unit file, in order to make it more safe and robust.
[mar giu 28 18:43:32 2022] systemd-sysv-generator[570]: SysV service '/etc/=
rc.d/init.d/network' lacks a native systemd unit file. Automatically genera=
ting a unit file for compatibility. Please update package to include a nati=
ve systemd unit file, in order to make it more safe and robust.
[mar giu 28 18:43:32 2022] systemd-sysv-generator[570]: SysV service '/etc/=
rc.d/init.d/weewx' lacks a native systemd unit file. Automatically generati=
ng a unit file for compatibility. Please update package to include a native=
 systemd unit file, in order to make it more safe and robust.
[mar giu 28 18:43:32 2022] zram: Added device: zram0
[mar giu 28 18:43:32 2022] kauditd_printk_skb: 48 callbacks suppressed
[mar giu 28 18:43:32 2022] audit: type=3D1334 audit(1656426824.162:59): pro=
g-id=3D17 op=3DLOAD
[mar giu 28 18:43:32 2022] audit: type=3D1334 audit(1656426824.162:60): pro=
g-id=3D18 op=3DLOAD
[mar giu 28 18:43:32 2022] audit: type=3D1334 audit(1656426824.162:61): pro=
g-id=3D19 op=3DLOAD
[mar giu 28 18:43:32 2022] audit: type=3D1334 audit(1656426824.162:62): pro=
g-id=3D0 op=3DUNLOAD
[mar giu 28 18:43:32 2022] audit: type=3D1334 audit(1656426824.162:63): pro=
g-id=3D0 op=3DUNLOAD
[mar giu 28 18:43:32 2022] audit: type=3D1131 audit(1656426824.163:64): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:in=
it_t:s0 msg=3D'unit=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/sys=
temd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:32 2022] systemd[1]: initrd-switch-root.service: Deactiva=
ted successfully.
[mar giu 28 18:43:32 2022] systemd[1]: Stopped Switch Root.
[mar giu 28 18:43:32 2022] audit: type=3D1130 audit(1656426824.164:65): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:in=
it_t:s0 msg=3D'unit=3Dinitrd-switch-root comm=3D"systemd" exe=3D"/usr/lib/s=
ystemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:32 2022] audit: type=3D1131 audit(1656426824.164:66): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:in=
it_t:s0 msg=3D'unit=3Dinitrd-switch-root comm=3D"systemd" exe=3D"/usr/lib/s=
ystemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:32 2022] systemd[1]: systemd-journald.service: Scheduled =
restart job, restart counter is at 1.
[mar giu 28 18:43:32 2022] systemd[1]: Created slice Virtual Machine and Co=
ntainer Slice.
[mar giu 28 18:43:32 2022] systemd[1]: Created slice Slice /system/getty.
[mar giu 28 18:43:32 2022] systemd[1]: Created slice Slice /system/modprobe.
[mar giu 28 18:43:32 2022] systemd[1]: Created slice Slice /system/systemd-=
fsck.
[mar giu 28 18:43:32 2022] systemd[1]: Created slice Slice /system/systemd-=
zram-setup.
[mar giu 28 18:43:32 2022] systemd[1]: Created slice User and Session Slice.
[mar giu 28 18:43:32 2022] systemd[1]: Condition check resulted in Dispatch=
 Password Requests to Console Directory Watch being skipped.
[mar giu 28 18:43:32 2022] systemd[1]: Started Forward Password Requests to=
 Wall Directory Watch.
[mar giu 28 18:43:32 2022] systemd[1]: Set up automount Arbitrary Executabl=
e File Formats File System Automount Point.
[mar giu 28 18:43:32 2022] systemd[1]: Reached target Local Encrypted Volum=
es.
[mar giu 28 18:43:32 2022] systemd[1]: Reached target Login Prompts.
[mar giu 28 18:43:32 2022] systemd[1]: Stopped target Switch Root.
[mar giu 28 18:43:32 2022] systemd[1]: Stopped target Initrd File Systems.
[mar giu 28 18:43:32 2022] systemd[1]: Stopped target Initrd Root File Syst=
em.
[mar giu 28 18:43:32 2022] systemd[1]: Reached target Slice Units.
[mar giu 28 18:43:32 2022] systemd[1]: Reached target Local Verity Protecte=
d Volumes.
[mar giu 28 18:43:32 2022] systemd[1]: Listening on Device-mapper event dae=
mon FIFOs.
[mar giu 28 18:43:32 2022] systemd[1]: Listening on LVM2 poll daemon socket.
[mar giu 28 18:43:32 2022] systemd[1]: Listening on Process Core Dump Socke=
t.
[mar giu 28 18:43:32 2022] systemd[1]: Listening on initctl Compatibility N=
amed Pipe.
[mar giu 28 18:43:32 2022] systemd[1]: Listening on udev Control Socket.
[mar giu 28 18:43:32 2022] systemd[1]: Listening on udev Kernel Socket.
[mar giu 28 18:43:32 2022] systemd[1]: Activating swap /dev/disk/by-uuid/25=
2377f1-67d4-4408-aa14-4ab1b17fe1e3...
[mar giu 28 18:43:32 2022] audit: type=3D1334 audit(1656426824.171:67): pro=
g-id=3D0 op=3DUNLOAD
[mar giu 28 18:43:32 2022] systemd[1]: Mounting Huge Pages File System...
[mar giu 28 18:43:32 2022] systemd[1]: Mounting POSIX Message Queue File Sy=
stem...
[mar giu 28 18:43:32 2022] systemd[1]: Mounting Kernel Debug File System...
[mar giu 28 18:43:32 2022] systemd[1]: Mounting Kernel Trace File System...
[mar giu 28 18:43:32 2022] systemd[1]: Condition check resulted in Kernel M=
odule supporting RPCSEC_GSS being skipped.
[mar giu 28 18:43:32 2022] Adding 16777212k swap on /dev/sda3.  Priority:-2=
 extents:1 across:16777212k SSFS
[mar giu 28 18:43:32 2022] systemd[1]: Starting Create List of Static Devic=
e Nodes...
[mar giu 28 18:43:32 2022] systemd[1]: Starting Monitoring of LVM2 mirrors,=
 snapshots etc. using dmeventd or progress polling...
[mar giu 28 18:43:32 2022] systemd[1]: Starting Load Kernel Module configfs=
=2E..
[mar giu 28 18:43:32 2022] systemd[1]: Starting Load Kernel Module drm...
[mar giu 28 18:43:32 2022] systemd[1]: Starting Load Kernel Module fuse...
[mar giu 28 18:43:32 2022] systemd[1]: Starting Preprocess NFS configuratio=
n convertion...
[mar giu 28 18:43:32 2022] systemd[1]: plymouth-switch-root.service: Deacti=
vated successfully.
[mar giu 28 18:43:32 2022] systemd[1]: Stopped Plymouth switch root service.
[mar giu 28 18:43:32 2022] audit: type=3D1131 audit(1656426824.180:68): pid=
=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:in=
it_t:s0 msg=3D'unit=3Dplymouth-switch-root comm=3D"systemd" exe=3D"/usr/lib=
/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[mar giu 28 18:43:32 2022] systemd[1]: Stopped Journal Service.
[mar giu 28 18:43:32 2022] systemd[1]: Starting Journal Service...
[mar giu 28 18:43:32 2022] systemd[1]: Starting Load Kernel Modules...
[mar giu 28 18:43:32 2022] systemd[1]: Starting Remount Root and Kernel Fil=
e Systems...
[mar giu 28 18:43:32 2022] systemd[1]: Condition check resulted in Repartit=
ion Root Disk being skipped.
[mar giu 28 18:43:32 2022] systemd[1]: Starting Coldplug All udev Devices...
[mar giu 28 18:43:32 2022] systemd[1]: Activated swap /dev/disk/by-uuid/252=
377f1-67d4-4408-aa14-4ab1b17fe1e3.
[mar giu 28 18:43:32 2022] systemd[1]: Mounted Huge Pages File System.
[mar giu 28 18:43:32 2022] systemd[1]: Mounted POSIX Message Queue File Sys=
tem.
[mar giu 28 18:43:32 2022] systemd[1]: Mounted Kernel Debug File System.
[mar giu 28 18:43:32 2022] systemd[1]: Mounted Kernel Trace File System.
[mar giu 28 18:43:32 2022] systemd[1]: Finished Create List of Static Devic=
e Nodes.
[mar giu 28 18:43:32 2022] systemd[1]: modprobe@configfs.service: Deactivat=
ed successfully.
[mar giu 28 18:43:32 2022] systemd[1]: Finished Load Kernel Module configfs.
[mar giu 28 18:43:32 2022] systemd[1]: modprobe@drm.service: Deactivated su=
ccessfully.
[mar giu 28 18:43:32 2022] systemd[1]: Finished Load Kernel Module drm.
[mar giu 28 18:43:32 2022] systemd[1]: modprobe@fuse.service: Deactivated s=
uccessfully.
[mar giu 28 18:43:32 2022] systemd[1]: Finished Load Kernel Module fuse.
[mar giu 28 18:43:32 2022] systemd[1]: nfs-convert.service: Deactivated suc=
cessfully.
[mar giu 28 18:43:32 2022] systemd[1]: Finished Preprocess NFS configuratio=
n convertion.
[mar giu 28 18:43:32 2022] systemd[1]: Finished Load Kernel Modules.
[mar giu 28 18:43:32 2022] systemd[1]: Mounting FUSE Control File System...
[mar giu 28 18:43:32 2022] EXT4-fs (sda4): re-mounted. Quota mode: none.
[mar giu 28 18:43:32 2022] systemd[1]: Mounting Kernel Configuration File S=
ystem...
[mar giu 28 18:43:32 2022] systemd[1]: Starting Apply Kernel Variables...
[mar giu 28 18:43:32 2022] systemd-journald[592]: File /run/log/journal/469=
6aeb45b7a4cd69adafeaf27df9d2a/system.journal corrupted or uncleanly shut do=
wn, renaming and replacing.
[mar giu 28 18:43:32 2022] systemd[1]: Finished Remount Root and Kernel Fil=
e Systems.
[mar giu 28 18:43:32 2022] systemd[1]: Mounted FUSE Control File System.
[mar giu 28 18:43:32 2022] systemd[1]: Mounted Kernel Configuration File Sy=
stem.
[mar giu 28 18:43:32 2022] systemd[1]: Condition check resulted in OSTree R=
emount OS/ Bind Mounts being skipped.
[mar giu 28 18:43:32 2022] systemd[1]: Starting Configure read-only root su=
pport...
[mar giu 28 18:43:32 2022] systemd[1]: Condition check resulted in First Bo=
ot Wizard being skipped.
[mar giu 28 18:43:32 2022] systemd[1]: Condition check resulted in Rebuild =
Hardware Database being skipped.
[mar giu 28 18:43:32 2022] systemd[1]: Condition check resulted in Create S=
ystem Users being skipped.
[mar giu 28 18:43:32 2022] systemd[1]: Starting Create Static Device Nodes =
in /dev...
[mar giu 28 18:43:32 2022] systemd[1]: Started Journal Service.
[mar giu 28 18:43:32 2022] systemd-journald[592]: Received client request t=
o flush runtime journal.
[mar giu 28 18:43:32 2022] input: Intel HID events as /devices/platform/INT=
33D5:00/input/input18
[mar giu 28 18:43:32 2022] intel-hid INT33D5:00: platform supports 5 button=
 array
[mar giu 28 18:43:32 2022] input: Intel HID 5 button array as /devices/plat=
form/INT33D5:00/input/input19
[mar giu 28 18:43:32 2022] ACPI Warning: \_SB.IETM._TRT: Return Package has=
 no elements (empty) (20211217/nsprepkg-94)
[mar giu 28 18:43:32 2022] Consider using thermal netlink events interface
[mar giu 28 18:43:32 2022] idma64 idma64.0: Found Intel integrated DMA 64-b=
it
[mar giu 28 18:43:32 2022] mc: Linux media interface: v0.10
[mar giu 28 18:43:32 2022] mei_me 0000:00:16.0: enabling device (0000 -> 00=
02)
[mar giu 28 18:43:32 2022] videodev: Linux video capture interface: v2.00
[mar giu 28 18:43:32 2022] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[mar giu 28 18:43:32 2022] i801_smbus 0000:00:1f.4: SMBus using PCI interru=
pt
[mar giu 28 18:43:32 2022] i2c i2c-7: 2/2 memory slots populated (from DMI)
[mar giu 28 18:43:32 2022] i2c i2c-7: Successfully instantiated SPD at 0x50
[mar giu 28 18:43:32 2022] Bluetooth: Core ver 2.22
[mar giu 28 18:43:32 2022] NET: Registered PF_BLUETOOTH protocol family
[mar giu 28 18:43:32 2022] Bluetooth: HCI device and connection manager ini=
tialized
[mar giu 28 18:43:32 2022] Bluetooth: HCI socket layer initialized
[mar giu 28 18:43:32 2022] Bluetooth: L2CAP socket layer initialized
[mar giu 28 18:43:32 2022] Bluetooth: SCO socket layer initialized
[mar giu 28 18:43:32 2022] proc_thermal 0000:00:04.0: enabling device (0000=
 -> 0002)
[mar giu 28 18:43:32 2022] ACPI Error: No pointer back to namespace node in=
 package 000000000eac80ac (20211217/dsargs-301)
[mar giu 28 18:43:32 2022] ACPI Error: Aborting method \_SB.PCI0.B0D4.PPCC =
due to previous error (AE_AML_INTERNAL) (20211217/psparse-529)
[mar giu 28 18:43:32 2022] input: PC Speaker as /devices/platform/pcspkr/in=
put/input20
[mar giu 28 18:43:32 2022] cfg80211: Loading compiled-in X.509 certificates=
 for regulatory database
[mar giu 28 18:43:32 2022] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf4=
7aef9cea7'
[mar giu 28 18:43:33 2022] RAPL PMU: API unit is 2^-32 Joules, 5 fixed coun=
ters, 655360 ms ovfl timer
[mar giu 28 18:43:33 2022] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[mar giu 28 18:43:33 2022] RAPL PMU: hw unit of domain package 2^-14 Joules
[mar giu 28 18:43:33 2022] RAPL PMU: hw unit of domain dram 2^-14 Joules
[mar giu 28 18:43:33 2022] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[mar giu 28 18:43:33 2022] RAPL PMU: hw unit of domain psys 2^-14 Joules
[mar giu 28 18:43:33 2022] zram0: detected capacity change from 0 to 167772=
16
[mar giu 28 18:43:33 2022] usbcore: registered new interface driver btusb
[mar giu 28 18:43:33 2022] Adding 8388604k swap on /dev/zram0.  Priority:10=
0 extents:1 across:8388604k SSDscFS
[mar giu 28 18:43:33 2022] input: Dell WMI hotkeys as /devices/platform/PNP=
0C14:00/wmi_bus/wmi_bus-PNP0C14:00/9DBB5994-A997-11DA-B012-B622A1EF5492/inp=
ut/input21
[mar giu 28 18:43:33 2022] usb 1-5: Found UVC 1.00 device Integrated Webcam=
 (0bda:568a)
[mar giu 28 18:43:33 2022] input: Integrated Webcam: Integrated W as /devic=
es/pci0000:00/0000:00:14.0/usb1/1-5/1-5:1.0/input/input22
[mar giu 28 18:43:33 2022] usbcore: registered new interface driver uvcvideo
[mar giu 28 18:43:33 2022] ee1004 7-0050: 512 byte EE1004-compliant SPD EEP=
ROM, read-only
[mar giu 28 18:43:33 2022] iTCO_vendor_support: vendor-support=3D0
[mar giu 28 18:43:33 2022] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1=
c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[mar giu 28 18:43:33 2022] intel_rapl_common: Found RAPL domain package
[mar giu 28 18:43:33 2022] intel_rapl_common: Found RAPL domain core
[mar giu 28 18:43:33 2022] intel_rapl_common: Found RAPL domain uncore
[mar giu 28 18:43:33 2022] intel_rapl_common: Found RAPL domain dram
[mar giu 28 18:43:33 2022] intel_rapl_common: Found RAPL domain psys
[mar giu 28 18:43:33 2022] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device =
(Version=3D4, TCOBASE=3D0x0400)
[mar giu 28 18:43:33 2022] iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 s=
ec (nowayout=3D0)
[mar giu 28 18:43:33 2022] ath10k_pci 0000:03:00.0: enabling device (0000 -=
> 0002)
[mar giu 28 18:43:33 2022] ath10k_pci 0000:03:00.0: pci irq msi oper_irq_mo=
de 2 irq_mode 0 reset_mode 0
[mar giu 28 18:43:33 2022] snd_hda_intel 0000:00:1f.3: enabling device (000=
0 -> 0002)
[mar giu 28 18:43:33 2022] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (=
ops i915_audio_component_bind_ops [i915])
[mar giu 28 18:43:33 2022] intel_tcc_cooling: Programmable TCC Offset detec=
ted
[mar giu 28 18:43:33 2022] snd_hda_codec_realtek hdaudioC0D0: autoconfig fo=
r ALC3246: line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[mar giu 28 18:43:33 2022] snd_hda_codec_realtek hdaudioC0D0:    speaker_ou=
ts=3D0 (0x0/0x0/0x0/0x0/0x0)
[mar giu 28 18:43:33 2022] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D=
1 (0x21/0x0/0x0/0x0/0x0)
[mar giu 28 18:43:33 2022] snd_hda_codec_realtek hdaudioC0D0:    mono: mono=
_out=3D0x0
[mar giu 28 18:43:33 2022] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[mar giu 28 18:43:33 2022] snd_hda_codec_realtek hdaudioC0D0:      Headset =
Mic=3D0x19
[mar giu 28 18:43:33 2022] snd_hda_codec_realtek hdaudioC0D0:      Headphon=
e Mic=3D0x1a
[mar giu 28 18:43:33 2022] snd_hda_codec_realtek hdaudioC0D0:      Internal=
 Mic=3D0x12
[mar giu 28 18:43:33 2022] input: HDA Intel PCH Headphone Mic as /devices/p=
ci0000:00/0000:00:1f.3/sound/card0/input23
[mar giu 28 18:43:33 2022] input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices=
/pci0000:00/0000:00:1f.3/sound/card0/input24
[mar giu 28 18:43:33 2022] input: HDA Intel PCH HDMI/DP,pcm=3D7 as /devices=
/pci0000:00/0000:00:1f.3/sound/card0/input25
[mar giu 28 18:43:33 2022] input: HDA Intel PCH HDMI/DP,pcm=3D8 as /devices=
/pci0000:00/0000:00:1f.3/sound/card0/input26
[mar giu 28 18:43:33 2022] input: HDA Intel PCH HDMI/DP,pcm=3D9 as /devices=
/pci0000:00/0000:00:1f.3/sound/card0/input27
[mar giu 28 18:43:33 2022] input: HDA Intel PCH HDMI/DP,pcm=3D10 as /device=
s/pci0000:00/0000:00:1f.3/sound/card0/input28
[mar giu 28 18:43:33 2022] ath10k_pci 0000:03:00.0: qca9377 hw1.1 target 0x=
05020001 chip_id 0x003821ff sub 1028:1810
[mar giu 28 18:43:33 2022] ath10k_pci 0000:03:00.0: kconfig debug 0 debugfs=
 1 tracing 0 dfs 0 testmode 0
[mar giu 28 18:43:33 2022] ath10k_pci 0000:03:00.0: firmware ver WLAN.TF.2.=
1-00021-QCARMSWP-1 api 6 features wowlan,ignore-otp crc32 42e41877
[mar giu 28 18:43:33 2022] ath10k_pci 0000:03:00.0: board_file api 2 bmi_id=
 N/A crc32 8aedfa4a
[mar giu 28 18:43:33 2022] ath10k_pci 0000:03:00.0: htt-ver 3.56 wmi-op 4 h=
tt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[mar giu 28 18:43:33 2022] ath: EEPROM regdomain: 0x6c
[mar giu 28 18:43:33 2022] ath: EEPROM indicates we should expect a direct =
regpair map
[mar giu 28 18:43:33 2022] ath: Country alpha2 being used: 00
[mar giu 28 18:43:33 2022] ath: Regpair used: 0x6c
[mar giu 28 18:43:33 2022] ath10k_pci 0000:03:00.0 wlp3s0: renamed from wla=
n0
[mar giu 28 18:43:34 2022] RPC: Registered named UNIX socket transport modu=
le.
[mar giu 28 18:43:34 2022] RPC: Registered udp transport module.
[mar giu 28 18:43:34 2022] RPC: Registered tcp transport module.
[mar giu 28 18:43:34 2022] RPC: Registered tcp NFSv4.1 backchannel transpor=
t module.
[mar giu 28 18:43:34 2022] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[mar giu 28 18:43:34 2022] Bluetooth: BNEP filters: protocol multicast
[mar giu 28 18:43:34 2022] Bluetooth: BNEP socket layer initialized
[mar giu 28 18:43:34 2022] NET: Registered PF_QIPCRTR protocol family
[mar giu 28 18:43:35 2022] RTL8208 Fast Ethernet r8169-0-200:00: attached P=
HY driver (mii_bus:phy_addr=3Dr8169-0-200:00, irq=3DMAC)
[mar giu 28 18:43:35 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 18:43:35 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 18:43:35 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 18:43:35 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 18:43:35 2022] r8169 0000:02:00.0 enp2s0: Link is Down
[mar giu 28 18:43:36 2022] bridge: filtering via arp/ip/ip6tables is no lon=
ger available by default. Update your scripts to load br_netfilter if you n=
eed this.
[mar giu 28 18:43:37 2022] L1TF CPU bug present and SMT on, data leak possi=
ble. See CVE-2018-3646 and https://www.kernel.org/doc/html/latest/admin-gui=
de/hw-vuln/l1tf.html for details.
[mar giu 28 18:43:49 2022] Bluetooth: RFCOMM TTY layer initialized
[mar giu 28 18:43:49 2022] Bluetooth: RFCOMM socket layer initialized
[mar giu 28 18:43:49 2022] Bluetooth: RFCOMM ver 1.11
[mar giu 28 18:43:51 2022] wlp3s0: authenticate with 80:16:05:83:82:81
[mar giu 28 18:43:51 2022] wlp3s0: send auth to 80:16:05:83:82:81 (try 1/3)
[mar giu 28 18:43:51 2022] wlp3s0: authenticated
[mar giu 28 18:43:51 2022] wlp3s0: associate with 80:16:05:83:82:81 (try 1/=
3)
[mar giu 28 18:43:51 2022] wlp3s0: RX AssocResp from 80:16:05:83:82:81 (cap=
ab=3D0x1011 status=3D0 aid=3D19)
[mar giu 28 18:43:51 2022] wlp3s0: associated
[mar giu 28 18:43:51 2022] ath: EEPROM regdomain: 0x817c
[mar giu 28 18:43:51 2022] ath: EEPROM indicates we should expect a country=
 code
[mar giu 28 18:43:51 2022] ath: doing EEPROM country->regdmn map search
[mar giu 28 18:43:51 2022] ath: country maps to regdmn code: 0x37
[mar giu 28 18:43:51 2022] ath: Country alpha2 being used: IT
[mar giu 28 18:43:51 2022] ath: Regpair used: 0x37
[mar giu 28 18:43:51 2022] ath: regdomain 0x817c dynamically updated by cou=
ntry element
[mar giu 28 18:43:51 2022] wlp3s0: Limiting TX power to 23 (23 - 0) dBm as =
advertised by 80:16:05:83:82:81
[mar giu 28 18:43:51 2022] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link beco=
mes ready
[mar giu 28 18:44:05 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 18:44:05 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 18:44:05 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 18:44:05 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 18:44:37 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 18:44:37 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 18:44:37 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 18:44:37 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 18:44:48 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 18:44:48 2022] amdgpu: can't get the mac of 5
[mar giu 28 18:45:35 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 18:45:35 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 18:45:35 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 18:45:35 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 18:46:25 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 18:46:25 2022] amdgpu: can't get the mac of 5
[mar giu 28 18:47:45 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 18:47:45 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 18:47:45 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 18:47:45 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 18:49:25 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 18:49:25 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 18:49:25 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 18:49:25 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 18:53:27 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 18:53:27 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 18:53:27 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 18:53:27 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 19:03:25 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 19:03:25 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 19:03:25 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 19:03:25 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 19:17:05 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 19:17:05 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 19:17:05 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 19:17:05 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 19:18:37 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 19:18:37 2022] amdgpu: can't get the mac of 5
[mar giu 28 19:24:18 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 19:24:18 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 19:24:18 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 19:24:18 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 19:41:25 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 19:41:25 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 19:41:25 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 19:41:25 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 19:43:27 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 19:43:27 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 19:43:27 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 19:43:27 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 19:45:05 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 19:45:05 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 19:45:05 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 19:45:05 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 19:45:28 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 19:45:28 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 19:45:28 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 19:45:28 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 19:46:42 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 19:46:42 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 19:46:42 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 19:46:42 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 19:57:47 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 19:57:47 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 19:57:47 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 19:57:47 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:01:35 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:01:35 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:01:35 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:01:35 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:05:24 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:05:24 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:05:24 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:05:24 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:05:25 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:05:25 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:05:25 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:05:25 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:07:37 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:07:37 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:07:37 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:07:37 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:08:18 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:08:18 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:08:18 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:08:18 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:12:13 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:12:13 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:12:13 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:12:13 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:16:16 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:16:16 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:16:16 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:16:16 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:17:03 2022] perf: interrupt took too long (2540 > 2500), low=
ering kernel.perf_event_max_sample_rate to 78000
[mar giu 28 20:20:35 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:20:35 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:20:35 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:20:35 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:22:26 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:22:26 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:22:26 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:22:26 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:24:19 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 20:24:19 2022] amdgpu: can't get the mac of 5
[mar giu 28 20:24:55 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:24:55 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:24:55 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:24:55 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:47:05 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:47:05 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:47:05 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 20:47:05 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:48:35 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:48:35 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:48:35 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:48:35 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:56:48 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:56:48 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:56:48 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:56:48 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 20:57:45 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 20:57:45 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 20:57:45 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 20:57:45 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:03:46 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:03:46 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:03:46 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 21:03:46 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:03:53 2022] perf: interrupt took too long (3226 > 3175), low=
ering kernel.perf_event_max_sample_rate to 62000
[mar giu 28 21:03:55 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:03:55 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:03:55 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 21:03:55 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:10:15 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:10:15 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:10:15 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 21:10:15 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:10:18 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:10:18 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:10:18 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 21:10:18 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:20:37 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:20:37 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:20:37 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 21:20:37 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:21:25 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:21:25 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:21:25 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 21:21:25 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:22:55 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:22:55 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:22:55 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 21:22:55 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:25:54 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:25:54 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:25:54 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 21:25:54 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:33:45 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:33:45 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:33:45 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 21:33:45 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:36:14 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:36:14 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:36:14 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 21:36:14 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:37:15 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:37:15 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:37:15 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 21:37:15 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 21:47:52 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 21:47:52 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 21:47:52 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 21:47:52 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 22:03:14 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 22:03:14 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 22:03:14 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 22:03:14 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 22:07:48 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 22:07:48 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 22:07:48 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 22:07:48 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 22:07:58 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 22:07:58 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 22:07:58 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 22:07:58 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 22:10:35 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 22:10:35 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 22:10:35 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 22:10:35 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 22:20:45 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 22:20:45 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 22:20:45 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 22:20:45 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 22:33:46 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 22:33:46 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 22:33:46 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 22:33:46 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 22:36:25 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 22:36:25 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 22:36:25 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00001000/00002000
[mar giu 28 22:36:25 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 22:50:58 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 22:50:58 2022] amdgpu: can't get the mac of 5
[mar giu 28 22:51:10 2022] wlp3s0: deauthenticating from 80:16:05:83:82:81 =
by local choice (Reason: 3=3DDEAUTH_LEAVING)
[mar giu 28 22:51:10 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 22:51:10 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 22:51:10 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 22:51:10 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 22:51:14 2022] PM: suspend entry (deep)
[mar giu 28 22:51:15 2022] Filesystems sync: 0.958 seconds
[mar giu 28 22:51:15 2022] Freezing user space processes ... (elapsed 0.008=
 seconds) done.
[mar giu 28 22:51:15 2022] OOM killer disabled.
[mar giu 28 22:51:15 2022] Freezing remaining freezable tasks ... (elapsed =
0.002 seconds) done.
[mar giu 28 22:51:15 2022] printk: Suspending console(s) (use no_console_su=
spend to debug)
[mar giu 28 22:51:15 2022] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[mar giu 28 22:51:15 2022] sd 2:0:0:0: [sdb] Synchronizing SCSI cache
[mar giu 28 22:51:15 2022] sd 2:0:0:0: [sdb] Stopping disk
[mar giu 28 22:51:15 2022] sd 0:0:0:0: [sda] Stopping disk
[mar giu 28 22:51:16 2022] PM: suspend devices took 0.314 seconds
[mar giu 28 22:51:16 2022] ACPI: EC: interrupt blocked
[mar giu 28 22:51:16 2022] ACPI: PM: Preparing to enter system sleep state =
S3
[mar giu 28 22:51:16 2022] ACPI: EC: event blocked
[mar giu 28 22:51:16 2022] ACPI: EC: EC stopped
[mar giu 28 22:51:16 2022] ACPI: PM: Saving platform NVS memory
[mar giu 28 22:51:16 2022] Disabling non-boot CPUs ...
[mar giu 28 22:51:16 2022] smpboot: CPU 1 is now offline
[mar giu 28 22:51:16 2022] smpboot: CPU 2 is now offline
[mar giu 28 22:51:16 2022] smpboot: CPU 3 is now offline
[mar giu 28 22:51:16 2022] smpboot: CPU 4 is now offline
[mar giu 28 22:51:16 2022] smpboot: CPU 5 is now offline
[mar giu 28 22:51:16 2022] smpboot: CPU 6 is now offline
[mar giu 28 22:51:16 2022] smpboot: CPU 7 is now offline
[mar giu 28 22:51:16 2022] ACPI: PM: Low-level resume complete
[mar giu 28 22:51:16 2022] ACPI: EC: EC started
[mar giu 28 22:51:16 2022] ACPI: PM: Restoring platform NVS memory
[mar giu 28 22:51:16 2022] Enabling non-boot CPUs ...
[mar giu 28 22:51:16 2022] x86: Booting SMP configuration:
[mar giu 28 22:51:16 2022] smpboot: Booting Node 0 Processor 1 APIC 0x2
[mar giu 28 22:51:16 2022] CPU1 is up
[mar giu 28 22:51:16 2022] smpboot: Booting Node 0 Processor 2 APIC 0x4
[mar giu 28 22:51:16 2022] CPU2 is up
[mar giu 28 22:51:16 2022] smpboot: Booting Node 0 Processor 3 APIC 0x6
[mar giu 28 22:51:16 2022] CPU3 is up
[mar giu 28 22:51:16 2022] smpboot: Booting Node 0 Processor 4 APIC 0x1
[mar giu 28 22:51:16 2022] CPU4 is up
[mar giu 28 22:51:16 2022] smpboot: Booting Node 0 Processor 5 APIC 0x3
[mar giu 28 22:51:16 2022] CPU5 is up
[mar giu 28 22:51:16 2022] smpboot: Booting Node 0 Processor 6 APIC 0x5
[mar giu 28 22:51:16 2022] CPU6 is up
[mar giu 28 22:51:16 2022] smpboot: Booting Node 0 Processor 7 APIC 0x7
[mar giu 28 22:51:16 2022] CPU7 is up
[mar giu 28 22:51:16 2022] ACPI: PM: Waking up from system sleep state S3
[mar giu 28 22:51:16 2022] ACPI: EC: interrupt unblocked
[mar giu 28 22:51:16 2022] ACPI: EC: event unblocked
[mar giu 28 22:51:16 2022] sd 0:0:0:0: [sda] Starting disk
[mar giu 28 22:51:16 2022] sd 2:0:0:0: [sdb] Starting disk
[mar giu 28 22:51:16 2022] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A=
] is disabled/in DSI mode with an ungated DDI clock, gate it
[mar giu 28 22:51:16 2022] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY =
B] is disabled/in DSI mode with an ungated DDI clock, gate it
[mar giu 28 22:51:16 2022] i915 0000:00:02.0: [drm] [ENCODER:111:DDI C/PHY =
C] is disabled/in DSI mode with an ungated DDI clock, gate it
[mar giu 28 22:51:16 2022] usb 1-5: reset high-speed USB device number 3 us=
ing xhci_hcd
[mar giu 28 22:51:16 2022] ata3: SATA link up 6.0 Gbps (SStatus 133 SContro=
l 300)
[mar giu 28 22:51:16 2022] ata1: SATA link up 6.0 Gbps (SStatus 133 SContro=
l 300)
[mar giu 28 22:51:16 2022] ata2: SATA link up 1.5 Gbps (SStatus 113 SContro=
l 300)
[mar giu 28 22:51:16 2022] ata1.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 22:51:16 2022] ata1.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 22:51:16 2022] ata3.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 22:51:16 2022] ata3.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 22:51:16 2022] ata1.00: supports DRM functions and may not be f=
ully accessible
[mar giu 28 22:51:16 2022] ata3.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 22:51:16 2022] ata3.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 22:51:16 2022] ata3.00: configured for UDMA/133
[mar giu 28 22:51:16 2022] ata2.00: configured for UDMA/100
[mar giu 28 22:51:16 2022] ata1.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 22:51:16 2022] ata1.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 22:51:16 2022] ata1.00: supports DRM functions and may not be f=
ully accessible
[mar giu 28 22:51:16 2022] ata1.00: configured for UDMA/133
[mar giu 28 22:51:16 2022] ata1.00: Enabling discard_zeroes_data
[mar giu 28 22:51:17 2022] usb 1-7: reset full-speed USB device number 5 us=
ing xhci_hcd
[mar giu 28 22:51:17 2022] usb 1-6: reset high-speed USB device number 4 us=
ing xhci_hcd
[mar giu 28 22:51:17 2022] usb 1-2: reset low-speed USB device number 2 usi=
ng xhci_hcd
[mar giu 28 22:51:17 2022] PM: resume devices took 1.388 seconds
[mar giu 28 22:51:17 2022] OOM killer enabled.
[mar giu 28 22:51:17 2022] Restarting tasks ...=20
[mar giu 28 22:51:17 2022] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1=
c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[mar giu 28 22:51:17 2022] done.
[mar giu 28 22:51:17 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 22:51:17 2022] amdgpu: can't get the mac of 5
[mar giu 28 22:51:18 2022] PM: suspend exit
[mar giu 28 22:51:18 2022] PM: hibernation: hibernation entry
[mar giu 28 22:51:18 2022] Bluetooth: hci0: using rampatch file: qca/rampat=
ch_usb_00000302.bin
[mar giu 28 22:51:18 2022] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3=
e8, firmware rome 0x302 build 0x111
[mar giu 28 22:51:18 2022] Filesystems sync: 0.067 seconds
[mar giu 28 22:51:18 2022] Freezing user space processes ... (elapsed 0.003=
 seconds) done.
[mar giu 28 22:51:18 2022] OOM killer disabled.
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x00=
000000-0x00000fff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x00=
058000-0x00058fff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x00=
09e000-0x000fffff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x01=
000000-0x04be1fff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x65=
2bb000-0x652bbfff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x65=
2c7000-0x652c8fff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x65=
2d0000-0x652d1fff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x65=
2ee000-0x652effff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x65=
2ff000-0x68372fff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x6a=
5f0000-0x6a5f1fff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x76=
f84000-0x7700cfff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x7a=
19c000-0x7b5fdfff]
[mar giu 28 22:51:18 2022] PM: hibernation: Marking nosave pages: [mem 0x7b=
5ff000-0xffffffff]
[mar giu 28 22:51:18 2022] PM: hibernation: Basic memory bitmaps created
[mar giu 28 22:51:18 2022] PM: hibernation: Preallocating image memory
[mar giu 28 22:51:18 2022] Bluetooth: hci0: using NVM file: qca/nvm_usb_000=
00302.bin
[mar giu 28 22:51:23 2022] PM: hibernation: Allocated 1522898 pages for sna=
pshot
[mar giu 28 22:51:23 2022] PM: hibernation: Allocated 6091592 kbytes in 5.7=
3 seconds (1063.10 MB/s)
[mar giu 28 22:51:23 2022] Freezing remaining freezable tasks ... (elapsed =
0.001 seconds) done.
[mar giu 28 22:51:23 2022] printk: Suspending console(s) (use no_console_su=
spend to debug)
[mar giu 28 22:51:23 2022] amdgpu 0000:01:00.0: amdgpu: PCI CONFIG reset
[mar giu 28 22:51:24 2022] ACPI: EC: interrupt blocked
[mar giu 28 22:51:24 2022] ACPI: PM: Preparing to enter system sleep state =
S4
[mar giu 28 22:51:24 2022] ACPI: EC: event blocked
[mar giu 28 22:51:24 2022] ACPI: EC: EC stopped
[mar giu 28 22:51:24 2022] ACPI: PM: Saving platform NVS memory
[mar giu 28 22:51:24 2022] Disabling non-boot CPUs ...
[mar giu 28 22:51:24 2022] smpboot: CPU 1 is now offline
[mar giu 28 22:51:24 2022] smpboot: CPU 2 is now offline
[mar giu 28 22:51:24 2022] smpboot: CPU 3 is now offline
[mar giu 28 22:51:24 2022] smpboot: CPU 4 is now offline
[mar giu 28 22:51:24 2022] smpboot: CPU 5 is now offline
[mar giu 28 22:51:24 2022] smpboot: CPU 6 is now offline
[mar giu 28 22:51:24 2022] smpboot: CPU 7 is now offline
[mar giu 28 22:51:24 2022] PM: hibernation: Creating image:
[mar giu 28 22:51:24 2022] PM: hibernation: Need to copy 1507615 pages
[mar giu 28 22:51:24 2022] PM: hibernation: Normal pages needed: 1507615 + =
1024, available pages: 2631883
[mar giu 28 22:51:24 2022] ACPI: PM: Restoring platform NVS memory
[mar giu 28 22:51:24 2022] ACPI: EC: EC started
[mar giu 28 22:51:24 2022] Enabling non-boot CPUs ...
[mar giu 28 22:51:24 2022] x86: Booting SMP configuration:
[mar giu 28 22:51:24 2022] smpboot: Booting Node 0 Processor 1 APIC 0x2
[mar giu 28 22:51:24 2022] CPU1 is up
[mar giu 28 22:51:24 2022] smpboot: Booting Node 0 Processor 2 APIC 0x4
[mar giu 28 22:51:24 2022] CPU2 is up
[mar giu 28 22:51:24 2022] smpboot: Booting Node 0 Processor 3 APIC 0x6
[mar giu 28 22:51:24 2022] CPU3 is up
[mar giu 28 22:51:24 2022] smpboot: Booting Node 0 Processor 4 APIC 0x1
[mar giu 28 22:51:24 2022] CPU4 is up
[mar giu 28 22:51:24 2022] smpboot: Booting Node 0 Processor 5 APIC 0x3
[mar giu 28 22:51:24 2022] CPU5 is up
[mar giu 28 22:51:24 2022] smpboot: Booting Node 0 Processor 6 APIC 0x5
[mar giu 28 22:51:24 2022] CPU6 is up
[mar giu 28 22:51:24 2022] smpboot: Booting Node 0 Processor 7 APIC 0x7
[mar giu 28 22:51:24 2022] CPU7 is up
[mar giu 28 22:51:24 2022] ACPI: PM: Waking up from system sleep state S4
[mar giu 28 22:51:24 2022] ACPI: EC: interrupt unblocked
[mar giu 28 22:51:24 2022] usb usb1: root hub lost power or was reset
[mar giu 28 22:51:24 2022] usb usb2: root hub lost power or was reset
[mar giu 28 22:51:24 2022] ACPI: EC: event unblocked
[mar giu 28 22:51:24 2022] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY =
B] is disabled/in DSI mode with an ungated DDI clock, gate it
[mar giu 28 22:51:24 2022] i915 0000:00:02.0: [drm] [ENCODER:111:DDI C/PHY =
C] is disabled/in DSI mode with an ungated DDI clock, gate it
[mar giu 28 22:51:24 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 22:51:24 2022] sd 2:0:0:0: [sdb] Starting disk
[mar giu 28 22:51:24 2022] sd 0:0:0:0: [sda] Starting disk
[mar giu 28 22:51:24 2022] amdgpu: can't get the mac of 5
[mar giu 28 22:51:24 2022] usb 1-6: reset high-speed USB device number 4 us=
ing xhci_hcd
[mar giu 28 22:51:24 2022] ata2: SATA link up 1.5 Gbps (SStatus 113 SContro=
l 300)
[mar giu 28 22:51:24 2022] ata3: SATA link up 6.0 Gbps (SStatus 133 SContro=
l 300)
[mar giu 28 22:51:24 2022] ata1: SATA link up 6.0 Gbps (SStatus 133 SContro=
l 300)
[mar giu 28 22:51:24 2022] ata1.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 22:51:24 2022] ata1.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 22:51:24 2022] ata3.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 22:51:24 2022] ata3.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 22:51:24 2022] ata1.00: supports DRM functions and may not be f=
ully accessible
[mar giu 28 22:51:24 2022] ata2.00: configured for UDMA/100
[mar giu 28 22:51:24 2022] ata3.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 22:51:24 2022] ata3.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 22:51:24 2022] ata3.00: configured for UDMA/133
[mar giu 28 22:51:24 2022] ata1.00: ACPI cmd f5/00:00:00:00:00:00(SECURITY =
=46REEZE LOCK) filtered out
[mar giu 28 22:51:24 2022] ata1.00: ACPI cmd b1/c1:00:00:00:00:00(DEVICE CO=
NFIGURATION OVERLAY) filtered out
[mar giu 28 22:51:24 2022] ata1.00: supports DRM functions and may not be f=
ully accessible
[mar giu 28 22:51:24 2022] ata1.00: configured for UDMA/133
[mar giu 28 22:51:24 2022] ata1.00: Enabling discard_zeroes_data
[mar giu 28 22:51:25 2022] usb 1-5: reset high-speed USB device number 3 us=
ing xhci_hcd
[mar giu 28 22:51:25 2022] usb 1-2: reset low-speed USB device number 2 usi=
ng xhci_hcd
[mar giu 28 22:51:25 2022] usb 1-7: reset full-speed USB device number 5 us=
ing xhci_hcd
[mar giu 28 22:51:25 2022] PM: hibernation: Basic memory bitmaps freed
[mar giu 28 22:51:25 2022] OOM killer enabled.
[mar giu 28 22:51:25 2022] Restarting tasks ...=20
[mar giu 28 22:51:25 2022] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1=
c54b627f04: bound 0000:00:02.0 (ops i915_hdcp_component_ops [i915])
[mar giu 28 22:51:25 2022] Bluetooth: hci0: using rampatch file: qca/rampat=
ch_usb_00000302.bin
[mar giu 28 22:51:25 2022] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3=
e8, firmware rome 0x302 build 0x111
[mar giu 28 22:51:25 2022] done.
[mar giu 28 22:51:25 2022] PM: hibernation: hibernation exit
[mar giu 28 22:51:26 2022] RTL8208 Fast Ethernet r8169-0-200:00: attached P=
HY driver (mii_bus:phy_addr=3Dr8169-0-200:00, irq=3DMAC)
[mar giu 28 22:51:26 2022] Bluetooth: hci0: using NVM file: qca/nvm_usb_000=
00302.bin
[mar giu 28 22:51:26 2022] r8169 0000:02:00.0 enp2s0: Link is Down
[mar giu 28 22:51:32 2022] wlp3s0: authenticate with d8:47:32:55:95:ad
[mar giu 28 22:51:32 2022] dell_wmi: Unknown key with type 0x0012 and code =
0x0003 pressed
[mar giu 28 22:51:32 2022] wlp3s0: send auth to d8:47:32:55:95:ad (try 1/3)
[mar giu 28 22:51:32 2022] wlp3s0: authenticated
[mar giu 28 22:51:32 2022] wlp3s0: associate with d8:47:32:55:95:ad (try 1/=
3)
[mar giu 28 22:51:32 2022] wlp3s0: RX AssocResp from d8:47:32:55:95:ad (cap=
ab=3D0x1931 status=3D0 aid=3D2)
[mar giu 28 22:51:32 2022] wlp3s0: associated
[mar giu 28 22:51:32 2022] ath: EEPROM regdomain: 0x8114
[mar giu 28 22:51:32 2022] ath: EEPROM indicates we should expect a country=
 code
[mar giu 28 22:51:32 2022] ath: doing EEPROM country->regdmn map search
[mar giu 28 22:51:32 2022] ath: country maps to regdmn code: 0x37
[mar giu 28 22:51:32 2022] ath: Country alpha2 being used: DE
[mar giu 28 22:51:32 2022] ath: Regpair used: 0x37
[mar giu 28 22:51:32 2022] ath: regdomain 0x8114 dynamically updated by cou=
ntry element
[mar giu 28 22:51:32 2022] wlp3s0: Limiting TX power to 20 (20 - 0) dBm as =
advertised by d8:47:32:55:95:ad
[mar giu 28 22:51:32 2022] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link beco=
mes ready
[mar giu 28 22:51:35 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 22:51:35 2022] amdgpu: can't get the mac of 5
[mar giu 28 22:52:09 2022] wlp3s0: disconnect from AP d8:47:32:55:95:ad for=
 new auth to 80:16:05:83:82:81
[mar giu 28 22:52:09 2022] wlp3s0: authenticate with 80:16:05:83:82:81
[mar giu 28 22:52:09 2022] wlp3s0: send auth to 80:16:05:83:82:81 (try 1/3)
[mar giu 28 22:52:09 2022] wlp3s0: authenticated
[mar giu 28 22:52:09 2022] wlp3s0: associate with 80:16:05:83:82:81 (try 1/=
3)
[mar giu 28 22:52:09 2022] wlp3s0: RX ReassocResp from 80:16:05:83:82:81 (c=
apab=3D0x1011 status=3D0 aid=3D12)
[mar giu 28 22:52:09 2022] wlp3s0: associated
[mar giu 28 22:52:09 2022] ath: EEPROM regdomain: 0x817c
[mar giu 28 22:52:09 2022] ath: EEPROM indicates we should expect a country=
 code
[mar giu 28 22:52:09 2022] ath: doing EEPROM country->regdmn map search
[mar giu 28 22:52:09 2022] ath: country maps to regdmn code: 0x37
[mar giu 28 22:52:09 2022] ath: Country alpha2 being used: IT
[mar giu 28 22:52:09 2022] ath: Regpair used: 0x37
[mar giu 28 22:52:09 2022] ath: regdomain 0x817c dynamically updated by cou=
ntry element
[mar giu 28 22:52:09 2022] wlp3s0: Limiting TX power to 23 (23 - 0) dBm as =
advertised by 80:16:05:83:82:81
[mar giu 28 22:52:18 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 22:52:18 2022] amdgpu: can't get the mac of 5
[mar giu 28 22:56:40 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 22:56:40 2022] amdgpu: can't get the mac of 5
[mar giu 28 22:57:24 2022] perf: interrupt took too long (4044 > 4032), low=
ering kernel.perf_event_max_sample_rate to 49000
[mar giu 28 22:59:36 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 22:59:36 2022] amdgpu: can't get the mac of 5
[mar giu 28 23:03:29 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 23:03:29 2022] amdgpu: can't get the mac of 5
[mar giu 28 23:05:55 2022] pcieport 0000:00:1c.4: AER: Corrected error rece=
ived: 0000:00:1c.4
[mar giu 28 23:05:55 2022] pcieport 0000:00:1c.4: PCIe Bus Error: severity=
=3DCorrected, type=3DData Link Layer, (Transmitter ID)
[mar giu 28 23:05:55 2022] pcieport 0000:00:1c.4:   device [8086:9d14] erro=
r status/mask=3D00003000/00002000
[mar giu 28 23:05:55 2022] pcieport 0000:00:1c.4:    [12] Timeout          =
    =20
[mar giu 28 23:10:58 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 23:10:58 2022] amdgpu: can't get the mac of 5
[mar giu 28 23:14:41 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:14:41 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:14:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000687 at 0x0003543c: -110
[mar giu 28 23:14:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000689 at 0x0003543c: -110
[mar giu 28 23:14:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000068b at 0x0003543c: -110
[mar giu 28 23:14:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000068d at 0x0003543c: -110
[mar giu 28 23:14:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000068f at 0x0003543c: -110
[mar giu 28 23:14:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000691 at 0x0003543c: -110
[mar giu 28 23:14:45 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000693 at 0x0003543c: -110
[mar giu 28 23:14:47 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000695 at 0x0003543c: -110
[mar giu 28 23:14:47 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000697 at 0x0003543c: -110
[mar giu 28 23:14:47 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000699 at 0x0003543c: -110
[mar giu 28 23:14:47 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000069b at 0x0003543c: -110
[mar giu 28 23:14:47 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000069d at 0x0003543c: -110
[mar giu 28 23:14:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000069f at 0x0003543c: -110
[mar giu 28 23:14:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006a1 at 0x0003543c: -110
[mar giu 28 23:14:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006a3 at 0x0003543c: -110
[mar giu 28 23:14:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006a5 at 0x0003543c: -110
[mar giu 28 23:14:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006a7 at 0x0003543c: -110
[mar giu 28 23:14:52 2022] ath10k_warn: 2 callbacks suppressed
[mar giu 28 23:14:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006ab at 0x0003543c: -110
[mar giu 28 23:14:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006ad at 0x0003543c: -110
[mar giu 28 23:14:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006af at 0x0003543c: -110
[mar giu 28 23:14:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000001d at 0x0003503c: -110
[mar giu 28 23:14:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006b1 at 0x0003543c: -110
[mar giu 28 23:14:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006b3 at 0x0003543c: -110
[mar giu 28 23:14:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006b5 at 0x0003543c: -110
[mar giu 28 23:14:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006b7 at 0x0003543c: -110
[mar giu 28 23:14:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006b9 at 0x0003543c: -110
[mar giu 28 23:14:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006bb at 0x0003543c: -110
[mar giu 28 23:14:57 2022] ath10k_warn: 20 callbacks suppressed
[mar giu 28 23:14:57 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006df at 0x0003543c: -110
[mar giu 28 23:14:57 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006e1 at 0x0003543c: -110
[mar giu 28 23:14:57 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006e3 at 0x0003543c: -110
[mar giu 28 23:14:57 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006e5 at 0x0003543c: -110
[mar giu 28 23:14:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006e7 at 0x0003543c: -110
[mar giu 28 23:14:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006e9 at 0x0003543c: -110
[mar giu 28 23:14:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006eb at 0x0003543c: -110
[mar giu 28 23:14:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006ed at 0x0003543c: -110
[mar giu 28 23:14:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006ef at 0x0003543c: -110
[mar giu 28 23:14:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006f1 at 0x0003543c: -110
[mar giu 28 23:15:02 2022] ath10k_warn: 4 callbacks suppressed
[mar giu 28 23:15:02 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006fb at 0x0003543c: -110
[mar giu 28 23:15:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006fd at 0x0003543c: -110
[mar giu 28 23:15:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000006ff at 0x0003543c: -110
[mar giu 28 23:15:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000701 at 0x0003543c: -110
[mar giu 28 23:15:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000703 at 0x0003543c: -110
[mar giu 28 23:15:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000705 at 0x0003543c: -110
[mar giu 28 23:15:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000707 at 0x0003543c: -110
[mar giu 28 23:15:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000709 at 0x0003543c: -110
[mar giu 28 23:15:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000070b at 0x0003543c: -110
[mar giu 28 23:15:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000070d at 0x0003543c: -110
[mar giu 28 23:15:07 2022] ath10k_warn: 11 callbacks suppressed
[mar giu 28 23:15:07 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000725 at 0x0003543c: -110
[mar giu 28 23:15:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000727 at 0x0003543c: -110
[mar giu 28 23:15:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000729 at 0x0003543c: -110
[mar giu 28 23:15:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000072b at 0x0003543c: -110
[mar giu 28 23:15:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000072d at 0x0003543c: -110
[mar giu 28 23:15:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000072f at 0x0003543c: -110
[mar giu 28 23:15:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000731 at 0x0003543c: -110
[mar giu 28 23:15:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000733 at 0x0003543c: -110
[mar giu 28 23:15:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000735 at 0x0003543c: -110
[mar giu 28 23:15:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000737 at 0x0003543c: -110
[mar giu 28 23:15:13 2022] ath10k_warn: 8 callbacks suppressed
[mar giu 28 23:15:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000749 at 0x0003543c: -110
[mar giu 28 23:15:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000074b at 0x0003543c: -110
[mar giu 28 23:15:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000074d at 0x0003543c: -110
[mar giu 28 23:15:15 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000074f at 0x0003543c: -110
[mar giu 28 23:15:15 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000751 at 0x0003543c: -110
[mar giu 28 23:15:15 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000753 at 0x0003543c: -110
[mar giu 28 23:15:15 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000755 at 0x0003543c: -110
[mar giu 28 23:15:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000757 at 0x0003543c: -110
[mar giu 28 23:15:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000759 at 0x0003543c: -110
[mar giu 28 23:15:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000075b at 0x0003543c: -110
[mar giu 28 23:15:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000075d at 0x0003543c: -110
[mar giu 28 23:15:21 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:15:22 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000075f at 0x0003543c: -110
[mar giu 28 23:15:22 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000761 at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000763 at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000765 at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000767 at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000769 at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000076b at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000076d at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000076f at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000771 at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000773 at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000775 at 0x0003543c: -110
[mar giu 28 23:15:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000777 at 0x0003543c: -110
[mar giu 28 23:15:28 2022] ath10k_warn: 35 callbacks suppressed
[mar giu 28 23:15:28 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007bf at 0x0003543c: -110
[mar giu 28 23:15:29 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007c1 at 0x0003543c: -110
[mar giu 28 23:15:30 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007c3 at 0x0003543c: -110
[mar giu 28 23:15:30 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007c5 at 0x0003543c: -110
[mar giu 28 23:15:30 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007c7 at 0x0003543c: -110
[mar giu 28 23:15:31 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007c9 at 0x0003543c: -110
[mar giu 28 23:15:31 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007cb at 0x0003543c: -110
[mar giu 28 23:15:31 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007cd at 0x0003543c: -110
[mar giu 28 23:15:31 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007cf at 0x0003543c: -110
[mar giu 28 23:15:32 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007d1 at 0x0003543c: -110
[mar giu 28 23:15:34 2022] ath10k_warn: 1 callbacks suppressed
[mar giu 28 23:15:34 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007d5 at 0x0003543c: -110
[mar giu 28 23:15:34 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007d7 at 0x0003543c: -110
[mar giu 28 23:15:34 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007d9 at 0x0003543c: -110
[mar giu 28 23:15:34 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007db at 0x0003543c: -110
[mar giu 28 23:15:34 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007dd at 0x0003543c: -110
[mar giu 28 23:15:35 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007df at 0x0003543c: -110
[mar giu 28 23:15:36 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007e1 at 0x0003543c: -110
[mar giu 28 23:15:37 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007e3 at 0x0003543c: -110
[mar giu 28 23:15:38 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007e5 at 0x0003543c: -110
[mar giu 28 23:15:38 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007e7 at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_warn: 3 callbacks suppressed
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007ef at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007f1 at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007f3 at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007f5 at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007f7 at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007f9 at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007fb at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007fd at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000007ff at 0x0003543c: -110
[mar giu 28 23:15:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000801 at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_warn: 37 callbacks suppressed
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000084d at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000084f at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000851 at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000853 at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000855 at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000857 at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000859 at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000085b at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000085d at 0x0003543c: -110
[mar giu 28 23:15:44 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000085f at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_warn: 40 callbacks suppressed
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008b1 at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008b3 at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008b5 at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008b7 at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008b9 at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008bb at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008bd at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008bf at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008c1 at 0x0003543c: -110
[mar giu 28 23:15:49 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000008c3 at 0x0003543c: -110
[mar giu 28 23:15:54 2022] ath10k_warn: 35 callbacks suppressed
[mar giu 28 23:15:54 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000090b at 0x0003543c: -110
[mar giu 28 23:15:55 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000090d at 0x0003543c: -110
[mar giu 28 23:15:55 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000090f at 0x0003543c: -110
[mar giu 28 23:15:55 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000911 at 0x0003543c: -110
[mar giu 28 23:15:55 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000913 at 0x0003543c: -110
[mar giu 28 23:15:56 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000915 at 0x0003543c: -110
[mar giu 28 23:15:56 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000917 at 0x0003543c: -110
[mar giu 28 23:15:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000919 at 0x0003543c: -110
[mar giu 28 23:15:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000091b at 0x0003543c: -110
[mar giu 28 23:16:01 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000091d at 0x0003543c: -110
[mar giu 28 23:16:02 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000091f at 0x0003543c: -110
[mar giu 28 23:16:02 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000921 at 0x0003543c: -110
[mar giu 28 23:16:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000923 at 0x0003543c: -110
[mar giu 28 23:16:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000925 at 0x0003543c: -110
[mar giu 28 23:16:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000927 at 0x0003543c: -110
[mar giu 28 23:16:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000929 at 0x0003543c: -110
[mar giu 28 23:16:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000092b at 0x0003543c: -110
[mar giu 28 23:16:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000092d at 0x0003543c: -110
[mar giu 28 23:16:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000092f at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_warn: 33 callbacks suppressed
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000973 at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000975 at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000977 at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000979 at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000097b at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000097d at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000097f at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000981 at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000983 at 0x0003543c: -110
[mar giu 28 23:16:06 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000985 at 0x0003543c: -110
[mar giu 28 23:16:11 2022] ath10k_warn: 8 callbacks suppressed
[mar giu 28 23:16:11 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000997 at 0x0003543c: -110
[mar giu 28 23:16:12 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000999 at 0x0003543c: -110
[mar giu 28 23:16:12 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000099b at 0x0003543c: -110
[mar giu 28 23:16:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000099d at 0x0003543c: -110
[mar giu 28 23:16:14 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000099f at 0x0003543c: -110
[mar giu 28 23:16:15 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009a1 at 0x0003543c: -110
[mar giu 28 23:16:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009a3 at 0x0003543c: -110
[mar giu 28 23:16:17 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009a5 at 0x0003543c: -110
[mar giu 28 23:16:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009a7 at 0x0003543c: -110
[mar giu 28 23:16:19 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009a9 at 0x0003543c: -110
[mar giu 28 23:16:20 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009ab at 0x0003543c: -110
[mar giu 28 23:16:21 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009ad at 0x0003543c: -110
[mar giu 28 23:16:22 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009af at 0x0003543c: -110
[mar giu 28 23:16:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009b1 at 0x0003543c: -110
[mar giu 28 23:16:24 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009b3 at 0x0003543c: -110
[mar giu 28 23:16:25 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009b5 at 0x0003543c: -110
[mar giu 28 23:16:26 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009b7 at 0x0003543c: -110
[mar giu 28 23:16:27 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009b9 at 0x0003543c: -110
[mar giu 28 23:16:28 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009bb at 0x0003543c: -110
[mar giu 28 23:16:29 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009bd at 0x0003543c: -110
[mar giu 28 23:16:30 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009bf at 0x0003543c: -110
[mar giu 28 23:16:31 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009c1 at 0x0003543c: -110
[mar giu 28 23:16:32 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009c3 at 0x0003543c: -110
[mar giu 28 23:16:33 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009c5 at 0x0003543c: -110
[mar giu 28 23:16:34 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009c7 at 0x0003543c: -110
[mar giu 28 23:16:34 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009c9 at 0x0003543c: -110
[mar giu 28 23:16:34 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009cb at 0x0003543c: -110
[mar giu 28 23:16:35 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009cd at 0x0003543c: -110
[mar giu 28 23:16:36 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009cf at 0x0003543c: -110
[mar giu 28 23:16:37 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009d1 at 0x0003543c: -110
[mar giu 28 23:16:38 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009d3 at 0x0003543c: -110
[mar giu 28 23:16:39 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009d5 at 0x0003543c: -110
[mar giu 28 23:16:40 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009d7 at 0x0003543c: -110
[mar giu 28 23:16:41 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009d9 at 0x0003543c: -110
[mar giu 28 23:16:42 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x000009db at 0x0003543c: -110
[mar giu 28 23:16:43 2022] ath10k_pci 0000:03:00.0: wmi command 12289 timeo=
ut, restarting hardware
[mar giu 28 23:16:43 2022] ath10k_pci 0000:03:00.0: failed to start hw scan=
: -11
[mar giu 28 23:16:43 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a000: -110
[mar giu 28 23:16:43 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00036040: -110
[mar giu 28 23:16:43 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x0003603c: -110
[mar giu 28 23:16:43 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:43 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:43 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:43 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:47 2022] ath10k_warn: 108 callbacks suppressed
[mar giu 28 23:16:47 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:47 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:47 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:48 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:16:52 2022] ath10k_warn: 127 callbacks suppressed
[mar giu 28 23:16:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003442c: -110
[mar giu 28 23:16:52 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xfffffffe at 0x0003442c: -110
[mar giu 28 23:16:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00034434: -110
[mar giu 28 23:16:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xfffff81f at 0x00034434: -110
[mar giu 28 23:16:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003442c: -110
[mar giu 28 23:16:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffffffe1 at 0x0003442c: -110
[mar giu 28 23:16:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003482c: -110
[mar giu 28 23:16:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xfffffffe at 0x0003482c: -110
[mar giu 28 23:16:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00034834: -110
[mar giu 28 23:16:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xfffff81f at 0x00034834: -110
[mar giu 28 23:16:57 2022] ath10k_warn: 125 callbacks suppressed
[mar giu 28 23:16:57 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:16:57 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:16:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:16:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:16:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:16:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:16:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:16:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:16:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:16:58 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:01 2022] ath10k_pci 0000:03:00.0: failed to read device r=
egister, device is gone
[mar giu 28 23:17:02 2022] ath10k_warn: 125 callbacks suppressed
[mar giu 28 23:17:02 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x0000ffff at 0x0003504c: -110
[mar giu 28 23:17:02 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003504c: -110
[mar giu 28 23:17:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0020 at 0x0003504c: -110
[mar giu 28 23:17:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035444: -110
[mar giu 28 23:17:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003543c: -110
[mar giu 28 23:17:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x05020000 at 0x00035400: -110
[mar giu 28 23:17:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00002000 at 0x00035404: -110
[mar giu 28 23:17:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035410: -110
[mar giu 28 23:17:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0100 at 0x00035410: -110
[mar giu 28 23:17:03 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035410: -110
[mar giu 28 23:17:07 2022] ath10k_pci 0000:03:00.0: failed to read device r=
egister, device is gone
[mar giu 28 23:17:07 2022] ieee80211 phy0: Hardware restart was requested
[mar giu 28 23:17:07 2022] ath10k_warn: 128 callbacks suppressed
[mar giu 28 23:17:07 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:08 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:10 2022] ath10k_pci 0000:03:00.0: failed to read device r=
egister, device is gone
[mar giu 28 23:17:10 2022] ath10k_pci 0000:03:00.0: failed to reset chip: -5
[mar giu 28 23:17:10 2022] ath10k_pci 0000:03:00.0: Could not init hif: -5
[mar giu 28 23:17:10 2022] ------------[ cut here ]------------
[mar giu 28 23:17:10 2022] Hardware became unavailable during restart.
[mar giu 28 23:17:10 2022] ath10k_pci 0000:03:00.0: firmware crashed! (guid=
 26c69e37-bfa5-4b7d-b36f-a6e93f927e4b)
[mar giu 28 23:17:10 2022] ath10k_pci 0000:03:00.0: qca9377 hw1.1 target 0x=
05020001 chip_id 0x003821ff sub 1028:1810
[mar giu 28 23:17:10 2022] ath10k_pci 0000:03:00.0: kconfig debug 0 debugfs=
 1 tracing 0 dfs 0 testmode 0
[mar giu 28 23:17:10 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/util.=
c:2410 ieee80211_reconfig+0xd4/0x1490 [mac80211]
[mar giu 28 23:17:10 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:10 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:10 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:10 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Not tainted =
5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:10 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:10 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:10 2022] RIP: 0010:ieee80211_reconfig+0xd4/0x1490 [mac802=
11]
[mar giu 28 23:17:10 2022] Code: 17 00 0f 85 14 03 00 00 c6 85 7d 06 00 00 =
00 48 89 ef e8 7f 31 fc ff 41 89 c4 85 c0 74 14 48 c7 c7 08 a4 85 c1 e8 9f =
38 49 fa <0f> 0b eb b4 88 5c 24 17 48 8b 45 40 44 8b a0 b8 00 00 00 e8 14 c4
[mar giu 28 23:17:10 2022] RSP: 0018:ffffb17d8ab4fdf8 EFLAGS: 00010292
[mar giu 28 23:17:10 2022] RAX: 000000000000002b RBX: ffff9caf588a1b18 RCX:=
 0000000000000000
[mar giu 28 23:17:10 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:10 2022] RBP: ffff9caf588a08e0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:10 2022] R10: ffffb17d8ab4fc30 R11: ffffffffbcf453a8 R12:=
 00000000fffffffb
[mar giu 28 23:17:10 2022] R13: ffff9caf588a08e0 R14: 0000000000000000 R15:=
 ffff9cb2ac576c05
[mar giu 28 23:17:10 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:10 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:10 2022] CR2: 00007fb5d665b000 CR3: 0000000227e10006 CR4:=
 00000000003706e0
[mar giu 28 23:17:10 2022] Call Trace:
[mar giu 28 23:17:10 2022]  <TASK>
[mar giu 28 23:17:10 2022]  ? dequeue_task_stop+0x70/0x70
[mar giu 28 23:17:10 2022]  ieee80211_restart_work+0xfc/0x150 [mac80211]
[mar giu 28 23:17:10 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:10 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:10 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:10 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:10 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:10 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:10 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:10 2022]  </TASK>
[mar giu 28 23:17:10 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:10 2022] ------------[ cut here ]------------
[mar giu 28 23:17:10 2022] p2p-dev-wlp3s0: Failed check-sdata-in-driver che=
ck, flags: 0x0
[mar giu 28 23:17:10 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.c:97 drv_remove_interface+0x10d/0x120 [mac80211]
[mar giu 28 23:17:10 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:10 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:10 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:10 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:10 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:10 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:10 2022] RIP: 0010:drv_remove_interface+0x10d/0x120 [mac8=
0211]
[mar giu 28 23:17:10 2022] Code: ff ff 48 8b 83 88 04 00 00 48 8d b3 a8 04 =
00 00 48 c7 c7 70 94 85 c1 c6 05 19 29 0e 00 01 48 85 c0 48 0f 45 f0 e8 b6 =
01 4d fa <0f> 0b e9 32 ff ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f 1f 44
[mar giu 28 23:17:10 2022] RSP: 0018:ffffb17d8ab4fd88 EFLAGS: 00010292
[mar giu 28 23:17:10 2022] RAX: 000000000000003e RBX: ffff9cafdd910000 RCX:=
 0000000000000000
[mar giu 28 23:17:10 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:10 2022] RBP: ffff9caf588a08e0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:10 2022] R10: ffffb17d8ab4fbc0 R11: ffffffffbcf453a8 R12:=
 ffff9caf588a08e0
[mar giu 28 23:17:10 2022] R13: ffff9caf588a1248 R14: ffff9caf588a0ee0 R15:=
 ffff9cafdd910e88
[mar giu 28 23:17:10 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:10 2022] ath10k_pci 0000:03:00.0: firmware ver WLAN.TF.2.=
1-00021-QCARMSWP-1 api 6 features wowlan,ignore-otp crc32 42e41877
[mar giu 28 23:17:10 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:10 2022] CR2: 00007fb5d665b000 CR3: 0000000227e10006 CR4:=
 00000000003706e0
[mar giu 28 23:17:10 2022] Call Trace:
[mar giu 28 23:17:10 2022]  <TASK>
[mar giu 28 23:17:10 2022]  ieee80211_do_stop+0x600/0x840 [mac80211]
[mar giu 28 23:17:10 2022]  ? mutex_lock+0xe/0x30
[mar giu 28 23:17:10 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:10 2022]  cfg80211_stop_p2p_device+0x4f/0x150 [cfg80211]
[mar giu 28 23:17:10 2022]  cfg80211_shutdown_all_interfaces+0xa7/0xe0 [cfg=
80211]
[mar giu 28 23:17:10 2022] ath10k_pci 0000:03:00.0: board_file api 2 bmi_id=
 N/A crc32 8aedfa4a
[mar giu 28 23:17:10 2022] ath10k_pci 0000:03:00.0: htt-ver 3.56 wmi-op 4 h=
tt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[mar giu 28 23:17:10 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:10 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:10 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:10 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:10 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:10 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:10 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:10 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:10 2022]  </TASK>
[mar giu 28 23:17:10 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:10 2022] wlp3s0: deauthenticating from 80:16:05:83:82:81 =
by local choice (Reason: 3=3DDEAUTH_LEAVING)
[mar giu 28 23:17:10 2022] ------------[ cut here ]------------
[mar giu 28 23:17:10 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:10 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.h:172 drv_bss_info_changed+0x184/0x190 [mac80211]
[mar giu 28 23:17:10 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:10 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:10 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:10 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:10 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:10 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:10 2022] RIP: 0010:drv_bss_info_changed+0x184/0x190 [mac8=
0211]
[mar giu 28 23:17:10 2022] Code: ff ff 48 8b 83 88 04 00 00 48 8d b3 a8 04 =
00 00 48 c7 c7 a8 93 85 c1 c6 05 36 54 0e 00 01 48 85 c0 48 0f 45 f0 e8 df =
2c 4d fa <0f> 0b e9 07 ff ff ff 0f 1f 44 00 00 0f 1f 44 00 00 41 54 45 31 c0
[mar giu 28 23:17:10 2022] RSP: 0018:ffffb17d8ab4fa20 EFLAGS: 00010282
[mar giu 28 23:17:10 2022] RAX: 0000000000000036 RBX: ffff9caf5b1449c0 RCX:=
 0000000000000000
[mar giu 28 23:17:10 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:10 2022] RBP: ffff9caf588a08e0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:10 2022] R10: ffffb17d8ab4f858 R11: ffffffffbcf453a8 R12:=
 0000000000020000
[mar giu 28 23:17:10 2022] R13: ffff9caf5b145850 R14: ffff9caf588a1b78 R15:=
 ffff9caf5b145508
[mar giu 28 23:17:10 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:10 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:10 2022] CR2: 00007fb5d665b000 CR3: 0000000227e10006 CR4:=
 00000000003706e0
[mar giu 28 23:17:10 2022] Call Trace:
[mar giu 28 23:17:10 2022]  <TASK>
[mar giu 28 23:17:10 2022]  ieee80211_set_disassoc+0xca/0x550 [mac80211]
[mar giu 28 23:17:10 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:10 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:10 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:10 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:10 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:10 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:10 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:10 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:10 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:10 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:10 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:10 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:10 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:10 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:10 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:10 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:10 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:10 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:10 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:10 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:10 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:10 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:10 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:10 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:10 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:10 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:10 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:10 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:10 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:10 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:10 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:10 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:10 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:10 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:10 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:10 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:10 2022]  </TASK>
[mar giu 28 23:17:10 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:11 2022] ------------[ cut here ]------------
[mar giu 28 23:17:11 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:11 2022] WARNING: CPU: 5 PID: 0 at net/mac80211/driver-op=
s.h:1228 ieee80211_queue_skb+0x6f6/0x720 [mac80211]
[mar giu 28 23:17:11 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:11 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:11 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:11 2022] CPU: 5 PID: 0 Comm: swapper/5 Tainted: G        =
W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:11 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:11 2022] RIP: 0010:ieee80211_queue_skb+0x6f6/0x720 [mac80=
211]
[mar giu 28 23:17:11 2022] Code: 48 8b 88 00 f6 ff ff 48 2d e0 09 00 00 48 =
c7 c7 00 a2 85 c1 c6 05 a9 ea 0a 00 01 48 85 c9 48 0f 44 c8 48 89 ce e8 0d =
c3 49 fa <0f> 0b 41 b8 01 00 00 00 e9 0c fd ff ff 83 b8 88 0e 00 00 02 0f 84
[mar giu 28 23:17:11 2022] RSP: 0018:ffffb17d8020cb20 EFLAGS: 00010282
[mar giu 28 23:17:11 2022] RAX: 0000000000000036 RBX: ffff9caf72d520f0 RCX:=
 0000000000000000
[mar giu 28 23:17:11 2022] RDX: 0000000000000303 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:11 2022] RBP: ffff9caf5df1b820 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:11 2022] R10: ffffb17d8020c958 R11: ffffffffbcf453a8 R12:=
 ffff9caf5df1b828
[mar giu 28 23:17:11 2022] R13: ffffb17d8020cc38 R14: ffff9caf588a08e0 R15:=
 ffff9caf5b1449c0
[mar giu 28 23:17:11 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:11 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:11 2022] CR2: 00005613fc752750 CR3: 0000000227e10002 CR4:=
 00000000003706e0
[mar giu 28 23:17:11 2022] Call Trace:
[mar giu 28 23:17:11 2022]  <IRQ>
[mar giu 28 23:17:11 2022]  __ieee80211_subif_start_xmit+0xbed/0xe80 [mac80=
211]
[mar giu 28 23:17:11 2022]  ? enqueue_task_fair+0x8b/0x6e0
[mar giu 28 23:17:11 2022]  ? psi_task_change+0x99/0x120
[mar giu 28 23:17:11 2022]  ? update_group_capacity+0x29/0x230
[mar giu 28 23:17:11 2022]  ieee80211_subif_start_xmit+0x42/0x300 [mac80211]
[mar giu 28 23:17:11 2022]  dev_hard_start_xmit+0xd9/0x220
[mar giu 28 23:17:11 2022]  __dev_queue_xmit+0x87f/0xd00
[mar giu 28 23:17:11 2022]  arp_solicit+0xf8/0x300
[mar giu 28 23:17:11 2022]  ? kmem_cache_alloc+0x177/0x2c0
[mar giu 28 23:17:11 2022]  neigh_probe+0x51/0x70
[mar giu 28 23:17:11 2022]  neigh_timer_handler+0x226/0x310
[mar giu 28 23:17:11 2022]  ? neigh_changeaddr+0x40/0x40
[mar giu 28 23:17:11 2022]  ? neigh_changeaddr+0x40/0x40
[mar giu 28 23:17:11 2022]  call_timer_fn+0x27/0x130
[mar giu 28 23:17:11 2022]  __run_timers.part.0+0x1ab/0x240
[mar giu 28 23:17:11 2022]  ? enqueue_hrtimer+0x2f/0x80
[mar giu 28 23:17:11 2022]  ? __hrtimer_run_queues+0x149/0x2a0
[mar giu 28 23:17:11 2022]  ? recalibrate_cpu_khz+0x10/0x10
[mar giu 28 23:17:11 2022]  ? sched_clock_cpu+0xb/0xc0
[mar giu 28 23:17:11 2022]  run_timer_softirq+0x31/0x60
[mar giu 28 23:17:11 2022]  __do_softirq+0xfb/0x306
[mar giu 28 23:17:11 2022]  __irq_exit_rcu+0xd3/0x140
[mar giu 28 23:17:11 2022]  sysvec_apic_timer_interrupt+0xa2/0xd0
[mar giu 28 23:17:11 2022]  </IRQ>
[mar giu 28 23:17:11 2022]  <TASK>
[mar giu 28 23:17:11 2022]  asm_sysvec_apic_timer_interrupt+0x12/0x20
[mar giu 28 23:17:11 2022] RIP: 0010:cpuidle_enter_state+0xd8/0x370
[mar giu 28 23:17:11 2022] Code: 00 00 31 ff e8 49 ee 70 ff 45 84 ff 74 16 =
9c 58 0f 1f 40 00 f6 c4 02 0f 85 77 02 00 00 31 ff e8 8e a7 76 ff fb 0f 1f =
44 00 00 <45> 85 f6 0f 88 12 01 00 00 49 63 d6 4c 2b 2c 24 48 8d 04 52 48 8d
[mar giu 28 23:17:11 2022] RSP: 0018:ffffb17d8011bea0 EFLAGS: 00000246
[mar giu 28 23:17:11 2022] RAX: ffff9cb2ac540000 RBX: 0000000000000004 RCX:=
 000000000000001f
[mar giu 28 23:17:11 2022] RDX: 0000000000000000 RSI: ffffffffbc64e434 RDI:=
 ffffffffbc60f992
[mar giu 28 23:17:11 2022] RBP: ffffd17d7fd40188 R08: 00000ef01db3a204 R09:=
 0000000000000008
[mar giu 28 23:17:11 2022] R10: 000000000000039d R11: 00000000000002d2 R12:=
 ffffffffbd06d7a0
[mar giu 28 23:17:11 2022] R13: 00000ef01db3a204 R14: 0000000000000004 R15:=
 0000000000000000
[mar giu 28 23:17:11 2022]  cpuidle_enter+0x29/0x40
[mar giu 28 23:17:11 2022]  do_idle+0x1b4/0x230
[mar giu 28 23:17:11 2022]  cpu_startup_entry+0x19/0x20
[mar giu 28 23:17:11 2022]  start_secondary+0x109/0x130
[mar giu 28 23:17:11 2022]  secondary_startup_64_no_verify+0xd5/0xdb
[mar giu 28 23:17:11 2022]  </TASK>
[mar giu 28 23:17:11 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:12 2022] ------------[ cut here ]------------
[mar giu 28 23:17:12 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:12 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.h:633 __ieee80211_flush_queues+0x230/0x240 [mac80211]
[mar giu 28 23:17:12 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:12 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:12 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:12 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:12 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:12 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:12 2022] RIP: 0010:__ieee80211_flush_queues+0x230/0x240 [=
mac80211]
[mar giu 28 23:17:12 2022] Code: ff ff 49 8b 86 88 04 00 00 49 8d b6 a8 04 =
00 00 48 c7 c7 60 a3 85 c1 c6 05 38 70 0a 00 01 48 85 c0 48 0f 45 f0 e8 93 =
48 49 fa <0f> 0b e9 c7 fe ff ff 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 0f
[mar giu 28 23:17:12 2022] RSP: 0018:ffffb17d8ab4fa10 EFLAGS: 00010282
[mar giu 28 23:17:12 2022] RAX: 0000000000000036 RBX: ffff9caf5b145848 RCX:=
 0000000000000000
[mar giu 28 23:17:12 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:12 2022] RBP: ffff9caf588a08e0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:12 2022] R10: ffffb17d8ab4f848 R11: ffffffffbcf453a8 R12:=
 0000000000000001
[mar giu 28 23:17:12 2022] R13: 0000000000000001 R14: ffff9caf5b1449c0 R15:=
 0000000000000001
[mar giu 28 23:17:12 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:12 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:12 2022] CR2: 00003e7502099000 CR3: 0000000227e10006 CR4:=
 00000000003706e0
[mar giu 28 23:17:12 2022] Call Trace:
[mar giu 28 23:17:12 2022]  <TASK>
[mar giu 28 23:17:12 2022]  ieee80211_set_disassoc+0x3d5/0x550 [mac80211]
[mar giu 28 23:17:12 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:12 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:12 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:12 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:12 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:12 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:12 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:12 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:12 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:12 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:12 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:12 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:12 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:12 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:12 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:12 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:12 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:12 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:12 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:12 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:12 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:12 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:12 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:12 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:12 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:12 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:12 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:12 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:12 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:12 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:12 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:12 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:12 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:12 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:12 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:12 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:12 2022]  </TASK>
[mar giu 28 23:17:12 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:12 2022] ------------[ cut here ]------------
[mar giu 28 23:17:12 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:12 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.h:845 drv_mgd_complete_tx+0x138/0x150 [mac80211]
[mar giu 28 23:17:12 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:12 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:12 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:12 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:12 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:12 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:12 2022] RIP: 0010:drv_mgd_complete_tx+0x138/0x150 [mac80=
211]
[mar giu 28 23:17:12 2022] Code: ff ff 48 8b 83 88 04 00 00 48 8d b3 a8 04 =
00 00 48 c7 c7 10 b5 85 c1 c6 05 0c dc 07 00 01 48 85 c0 48 0f 45 f0 e8 5b =
b4 46 fa <0f> 0b e9 18 ff ff ff 0f 0b e9 e8 fe ff ff 66 2e 0f 1f 84 00 00 00
[mar giu 28 23:17:12 2022] RSP: 0018:ffffb17d8ab4fa28 EFLAGS: 00010292
[mar giu 28 23:17:12 2022] RAX: 0000000000000036 RBX: ffff9caf5b1449c0 RCX:=
 0000000000000000
[mar giu 28 23:17:12 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:12 2022] RBP: ffff9caf588a08e0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:12 2022] R10: ffffb17d8ab4f860 R11: ffffffffbcf453a8 R12:=
 ffffb17d8ab4fa62
[mar giu 28 23:17:12 2022] R13: ffff9caf5b1449c0 R14: ffff9caf588a1b78 R15:=
 ffff9caf5b145508
[mar giu 28 23:17:12 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:12 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:12 2022] CR2: 00003e7502099000 CR3: 0000000227e10006 CR4:=
 00000000003706e0
[mar giu 28 23:17:12 2022] Call Trace:
[mar giu 28 23:17:12 2022]  <TASK>
[mar giu 28 23:17:12 2022]  ieee80211_set_disassoc+0xfa/0x550 [mac80211]
[mar giu 28 23:17:12 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:12 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:12 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:12 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:12 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:12 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:12 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:12 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:12 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:12 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:12 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:12 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:12 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:12 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:12 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:12 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:12 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:12 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:12 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:12 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:12 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:12 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:12 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:12 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:12 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:12 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:12 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:12 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:12 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:12 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:12 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:12 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:12 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:12 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:12 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:12 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:12 2022]  </TASK>
[mar giu 28 23:17:12 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:12 2022] ------------[ cut here ]------------
[mar giu 28 23:17:12 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:12 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.h:514 __sta_info_destroy_part1+0x3d3/0x440 [mac80211]
[mar giu 28 23:17:12 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:12 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:12 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:12 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:12 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:12 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:12 2022] RIP: 0010:__sta_info_destroy_part1+0x3d3/0x440 [=
mac80211]
[mar giu 28 23:17:12 2022] Code: ff ff 48 8b 85 88 04 00 00 48 8d b5 a8 04 =
00 00 48 c7 c7 d0 94 85 c1 c6 05 7d 04 0e 00 01 48 85 c0 48 0f 45 f0 e8 10 =
dd 4c fa <0f> 0b e9 41 fd ff ff 0f 1f 44 00 00 e9 ed fd ff ff 80 3d 57 04 0e
[mar giu 28 23:17:12 2022] RSP: 0018:ffffb17d8ab4f9a8 EFLAGS: 00010296
[mar giu 28 23:17:12 2022] RAX: 0000000000000036 RBX: ffff9caf72d54000 RCX:=
 0000000000000000
[mar giu 28 23:17:12 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:12 2022] RBP: ffff9caf5b1449c0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:12 2022] R10: ffffb17d8ab4f7e0 R11: ffffffffbcf453a8 R12:=
 ffff9caf588a08e0
[mar giu 28 23:17:12 2022] R13: ffff9caf5b1449c0 R14: 0000000000000000 R15:=
 ffff9caf72d54000
[mar giu 28 23:17:12 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:12 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:12 2022] CR2: 00003e7502099000 CR3: 0000000227e10006 CR4:=
 00000000003706e0
[mar giu 28 23:17:12 2022] Call Trace:
[mar giu 28 23:17:12 2022]  <TASK>
[mar giu 28 23:17:12 2022]  __sta_info_flush+0xbd/0x180 [mac80211]
[mar giu 28 23:17:12 2022]  ieee80211_set_disassoc+0x122/0x550 [mac80211]
[mar giu 28 23:17:12 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:12 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:12 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:12 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:12 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:12 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:12 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:12 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:12 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:12 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:12 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:12 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:12 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:12 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:12 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:12 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:12 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:12 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:12 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:12 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:12 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:12 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:12 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:12 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:12 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:12 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:12 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:12 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:12 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:12 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:12 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:12 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:12 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:12 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:12 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:12 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:12 2022]  </TASK>
[mar giu 28 23:17:12 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:13 2022] ath10k_warn: 154 callbacks suppressed
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00036044: -110
[mar giu 28 23:17:13 2022] ------------[ cut here ]------------
[mar giu 28 23:17:13 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:13 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.c:118 drv_sta_state+0x315/0x590 [mac80211]
[mar giu 28 23:17:13 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:13 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:13 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:13 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:13 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:13 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:13 2022] RIP: 0010:drv_sta_state+0x315/0x590 [mac80211]
[mar giu 28 23:17:13 2022] Code: ff ff 48 8b 83 88 04 00 00 48 8d b3 a8 04 =
00 00 48 c7 c7 70 94 85 c1 c6 05 f0 25 0e 00 01 48 85 c0 48 0f 45 f0 e8 8e =
fe 4c fa <0f> 0b e9 6a fd ff ff 65 8b 05 cd b0 85 3e 89 c0 48 0f a3 05 93 ab
[mar giu 28 23:17:13 2022] RSP: 0000:ffffb17d8ab4f970 EFLAGS: 00010282
[mar giu 28 23:17:13 2022] RAX: 0000000000000036 RBX: ffff9caf5b1449c0 RCX:=
 0000000000000000
[mar giu 28 23:17:13 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:13 2022] RBP: ffff9caf588a08e0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:13 2022] R10: ffffb17d8ab4f7a8 R11: ffffffffbcf453a8 R12:=
 00000000fffffffb
[mar giu 28 23:17:13 2022] R13: 0000000000000003 R14: ffff9caf72d54000 R15:=
 ffff9caf588a1018
[mar giu 28 23:17:13 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:13 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:13 2022] CR2: 00003e7502099000 CR3: 000000046a4a6002 CR4:=
 00000000003706e0
[mar giu 28 23:17:13 2022] Call Trace:
[mar giu 28 23:17:13 2022]  <TASK>
[mar giu 28 23:17:13 2022]  sta_info_move_state+0x1b6/0x2b0 [mac80211]
[mar giu 28 23:17:13 2022]  __sta_info_destroy_part2+0x14c/0x160 [mac80211]
[mar giu 28 23:17:13 2022]  __sta_info_flush+0x138/0x180 [mac80211]
[mar giu 28 23:17:13 2022]  ieee80211_set_disassoc+0x122/0x550 [mac80211]
[mar giu 28 23:17:13 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:13 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:13 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:13 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:13 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:13 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:13 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:13 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:13 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:13 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:13 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:13 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:13 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:13 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:13 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:13 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:13 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:13 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:13 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:13 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:13 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:13 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:13 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:13 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:13 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:13 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:13 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:13 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:13 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:13 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:13 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:13 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:13 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:13 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:13 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:13 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:13 2022]  </TASK>
[mar giu 28 23:17:13 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:13 2022] ------------[ cut here ]------------
[mar giu 28 23:17:13 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/sta_i=
nfo.c:1070 __sta_info_destroy_part2+0x154/0x160 [mac80211]
[mar giu 28 23:17:13 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:13 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:13 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:13 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:13 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:13 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:13 2022] RIP: 0010:__sta_info_destroy_part2+0x154/0x160 [=
mac80211]
[mar giu 28 23:17:13 2022] Code: e7 e8 f0 a4 ff ff 85 c0 0f 84 4c ff ff ff =
0f 0b e9 45 ff ff ff be 03 00 00 00 48 89 ef e8 74 e6 ff ff 85 c0 0f 84 d2 =
fe ff ff <0f> 0b e9 cb fe ff ff 0f 1f 44 00 00 0f 1f 44 00 00 41 54 55 48 89
[mar giu 28 23:17:13 2022] RSP: 0000:ffffb17d8ab4f9c0 EFLAGS: 00010282
[mar giu 28 23:17:13 2022] RAX: 00000000fffffffb RBX: ffff9caf5b1449c0 RCX:=
 0000000000000000
[mar giu 28 23:17:13 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:13 2022] RBP: ffff9caf72d54000 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:13 2022] R10: ffffb17d8ab4f7a8 R11: ffffffffbcf453a8 R12:=
 ffff9caf588a08e0
[mar giu 28 23:17:13 2022] R13: 0000000000000000 R14: ffff9caf588a1018 R15:=
 ffff9caf588a1018
[mar giu 28 23:17:13 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:13 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:13 2022] CR2: 00003e7502099000 CR3: 000000046a4a6002 CR4:=
 00000000003706e0
[mar giu 28 23:17:13 2022] Call Trace:
[mar giu 28 23:17:13 2022]  <TASK>
[mar giu 28 23:17:13 2022]  __sta_info_flush+0x138/0x180 [mac80211]
[mar giu 28 23:17:13 2022]  ieee80211_set_disassoc+0x122/0x550 [mac80211]
[mar giu 28 23:17:13 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:13 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:13 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:13 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:13 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:13 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:13 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:13 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:13 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:13 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:13 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:13 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:13 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:13 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:13 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:13 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:13 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:13 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:13 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:13 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:13 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:13 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:13 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:13 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:13 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:13 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:13 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:13 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:13 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:13 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:13 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:13 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:13 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:13 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:13 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:13 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:13 2022]  </TASK>
[mar giu 28 23:17:13 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] ------------[ cut here ]------------
[mar giu 28 23:17:16 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:16 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.h:248 drv_set_key+0x154/0x160 [mac80211]
[mar giu 28 23:17:16 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:16 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:16 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:16 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:16 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:16 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:16 2022] RIP: 0010:drv_set_key+0x154/0x160 [mac80211]
[mar giu 28 23:17:16 2022] Code: ff ff 48 8b 83 88 04 00 00 48 8d b3 a8 04 =
00 00 48 c7 c7 38 a2 85 c1 c6 05 9a bb 0a 00 01 48 85 c0 48 0f 45 f0 e8 ff =
93 49 fa <0f> 0b e9 14 ff ff ff 0f 1f 44 00 00 0f 1f 44 00 00 41 54 55 53 48
[mar giu 28 23:17:16 2022] RSP: 0018:ffffb17d8ab4f910 EFLAGS: 00010282
[mar giu 28 23:17:16 2022] RAX: 0000000000000036 RBX: ffff9caf5b1449c0 RCX:=
 0000000000000000
[mar giu 28 23:17:16 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:16 2022] RBP: ffff9caf588a08e0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:16 2022] R10: ffffb17d8ab4f748 R11: ffffffffbcf453a8 R12:=
 00000000fffffffb
[mar giu 28 23:17:16 2022] R13: ffff9caf72d54a60 R14: ffff9caf89b0d630 R15:=
 0000000000000000
[mar giu 28 23:17:16 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:16 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:16 2022] CR2: 00007fbba4071d48 CR3: 0000000227e10003 CR4:=
 00000000003706e0
[mar giu 28 23:17:16 2022] Call Trace:
[mar giu 28 23:17:16 2022]  <TASK>
[mar giu 28 23:17:16 2022]  ieee80211_key_replace+0x146/0x7f0 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_free_sta_keys+0xa7/0xe0 [mac80211]
[mar giu 28 23:17:16 2022]  __sta_info_destroy_part2+0x31/0x160 [mac80211]
[mar giu 28 23:17:16 2022]  __sta_info_flush+0x138/0x180 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_set_disassoc+0x122/0x550 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:16 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:16 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:16 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:16 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:16 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:16 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:16 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:16 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:16 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:16 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:16 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:16 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:16 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:16 2022]  </TASK>
[mar giu 28 23:17:16 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] wlp3s0: failed to remove key (0, 80:16:05:83:82:=
81) from hardware (-5)
[mar giu 28 23:17:16 2022] ------------[ cut here ]------------
[mar giu 28 23:17:16 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/sta_i=
nfo.c:1087 __sta_info_destroy_part2+0x10b/0x160 [mac80211]
[mar giu 28 23:17:16 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:16 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:16 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:16 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:16 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:16 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:16 2022] RIP: 0010:__sta_info_destroy_part2+0x10b/0x160 [=
mac80211]
[mar giu 28 23:17:16 2022] Code: 09 00 00 e8 27 5f 02 00 48 8b 45 50 48 89 =
ef 4c 8b a0 90 04 00 00 e8 f4 b8 ff ff 48 89 ee 5b 5d 4c 89 e7 41 5c e9 65 =
e9 ff ff <0f> 0b 80 bd 1c 01 00 00 00 0f 84 6a ff ff ff 45 31 c0 b9 01 00 00
[mar giu 28 23:17:16 2022] RSP: 0018:ffffb17d8ab4f9c0 EFLAGS: 00010282
[mar giu 28 23:17:16 2022] RAX: 00000000fffffffb RBX: ffff9caf5b1449c0 RCX:=
 0000000000000004
[mar giu 28 23:17:16 2022] RDX: 0000000000000000 RSI: ffff9caf5b1449c0 RDI:=
 ffff9caf588a08e0
[mar giu 28 23:17:16 2022] RBP: ffff9caf72d54000 R08: 0000000000000003 R09:=
 0000000000200019
[mar giu 28 23:17:16 2022] R10: 0000000000000008 R11: ffffffffbcf45300 R12:=
 ffff9caf588a08e0
[mar giu 28 23:17:16 2022] R13: 0000000000000000 R14: ffff9caf588a1018 R15:=
 ffff9caf588a1018
[mar giu 28 23:17:16 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:16 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:16 2022] CR2: 00007fbba4071d48 CR3: 0000000227e10003 CR4:=
 00000000003706e0
[mar giu 28 23:17:16 2022] Call Trace:
[mar giu 28 23:17:16 2022]  <TASK>
[mar giu 28 23:17:16 2022]  __sta_info_flush+0x138/0x180 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_set_disassoc+0x122/0x550 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:16 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:16 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:16 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:16 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:16 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:16 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:16 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:16 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:16 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:16 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:16 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:16 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:16 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:16 2022]  </TASK>
[mar giu 28 23:17:16 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] ------------[ cut here ]------------
[mar giu 28 23:17:16 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/sta_i=
nfo.c:1095 __sta_info_destroy_part2+0x138/0x160 [mac80211]
[mar giu 28 23:17:16 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:16 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:16 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:16 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:16 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:16 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:16 2022] RIP: 0010:__sta_info_destroy_part2+0x138/0x160 [=
mac80211]
[mar giu 28 23:17:16 2022] Code: bd 1c 01 00 00 00 0f 84 6a ff ff ff 45 31 =
c0 b9 01 00 00 00 48 89 ea 48 89 de 4c 89 e7 e8 f0 a4 ff ff 85 c0 0f 84 4c =
ff ff ff <0f> 0b e9 45 ff ff ff be 03 00 00 00 48 89 ef e8 74 e6 ff ff 85 c0
[mar giu 28 23:17:16 2022] RSP: 0018:ffffb17d8ab4f9c0 EFLAGS: 00010282
[mar giu 28 23:17:16 2022] RAX: 00000000fffffffb RBX: ffff9caf5b1449c0 RCX:=
 0000000000000001
[mar giu 28 23:17:16 2022] RDX: 0000000000000000 RSI: ffff9caf5b1449c0 RDI:=
 ffff9caf588a08e0
[mar giu 28 23:17:16 2022] RBP: ffff9caf72d54000 R08: 0000000000000000 R09:=
 0000000000200019
[mar giu 28 23:17:16 2022] R10: 0000000000000008 R11: ffffffffbcf45300 R12:=
 ffff9caf588a08e0
[mar giu 28 23:17:16 2022] R13: 0000000000000000 R14: ffff9caf588a1018 R15:=
 ffff9caf588a1018
[mar giu 28 23:17:16 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:16 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:16 2022] CR2: 00007fbba4071d48 CR3: 0000000227e10003 CR4:=
 00000000003706e0
[mar giu 28 23:17:16 2022] Call Trace:
[mar giu 28 23:17:16 2022]  <TASK>
[mar giu 28 23:17:16 2022]  __sta_info_flush+0x138/0x180 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_set_disassoc+0x122/0x550 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:16 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:16 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:16 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:16 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:16 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:16 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:16 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:16 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:16 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:16 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:16 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:16 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:16 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:16 2022]  </TASK>
[mar giu 28 23:17:16 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] ------------[ cut here ]------------
[mar giu 28 23:17:16 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:16 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.h:561 sta_set_sinfo+0xae9/0xb30 [mac80211]
[mar giu 28 23:17:16 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:16 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:16 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:16 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:16 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:16 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:16 2022] RIP: 0010:sta_set_sinfo+0xae9/0xb30 [mac80211]
[mar giu 28 23:17:16 2022] Code: ff ff 48 8b 85 88 04 00 00 48 8d b5 a8 04 =
00 00 48 c7 c7 d0 94 85 c1 c6 05 76 cf 0d 00 01 48 85 c0 48 0f 45 f0 e8 0a =
a8 4c fa <0f> 0b e9 ce f5 ff ff 83 e2 0f 41 88 55 45 48 89 c2 48 c1 e8 0c 48
[mar giu 28 23:17:16 2022] RSP: 0018:ffffb17d8ab4f960 EFLAGS: 00010286
[mar giu 28 23:17:16 2022] RAX: 0000000000000036 RBX: ffff9caf5b1449c0 RCX:=
 0000000000000000
[mar giu 28 23:17:16 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:16 2022] RBP: ffff9caf5b1449c0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:16 2022] R10: ffffb17d8ab4f798 R11: ffffffffbcf453a8 R12:=
 ffff9caf72d54218
[mar giu 28 23:17:16 2022] R13: ffff9cb2bf717a00 R14: ffff9caf72d54a60 R15:=
 ffff9caf72d54000
[mar giu 28 23:17:16 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:16 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:16 2022] CR2: 00007fbba4071d48 CR3: 0000000227e10003 CR4:=
 00000000003706e0
[mar giu 28 23:17:16 2022] Call Trace:
[mar giu 28 23:17:16 2022]  <TASK>
[mar giu 28 23:17:16 2022]  ? kmem_cache_alloc_trace+0x16e/0x2b0
[mar giu 28 23:17:16 2022]  __sta_info_destroy_part2+0xb2/0x160 [mac80211]
[mar giu 28 23:17:16 2022]  __sta_info_flush+0x138/0x180 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_set_disassoc+0x122/0x550 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:16 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:16 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:16 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:16 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:16 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:16 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:16 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:16 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:16 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:16 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:16 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:16 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:16 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:16 2022]  </TASK>
[mar giu 28 23:17:16 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] ------------[ cut here ]------------
[mar giu 28 23:17:16 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/sta_i=
nfo.c:272 sta_info_free+0x33/0xe0 [mac80211]
[mar giu 28 23:17:16 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:16 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:16 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:16 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:16 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:16 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:16 2022] RIP: 0010:sta_info_free+0x33/0xe0 [mac80211]
[mar giu 28 23:17:16 2022] Code: eb 0f 83 ee 01 48 89 ef e8 3a fd ff ff 85 =
c0 75 2a 8b b5 20 01 00 00 83 fe 01 76 28 48 8b 85 28 01 00 00 a9 00 00 10 =
00 74 d8 <0f> 0b 83 ee 01 48 89 ef e8 10 fd ff ff 85 c0 74 d6 80 3d 65 e4 0d
[mar giu 28 23:17:16 2022] RSP: 0018:ffffb17d8ab4f9d0 EFLAGS: 00010206
[mar giu 28 23:17:16 2022] RAX: 000000000410010b RBX: ffffb17d8ab4f9f0 RCX:=
 0000000000000000
[mar giu 28 23:17:16 2022] RDX: ffff9cafd46f2940 RSI: 0000000000000004 RDI:=
 ffff9caf588a08e0
[mar giu 28 23:17:16 2022] RBP: ffff9caf72d54000 R08: 0000000000000001 R09:=
 ffffffffbdaded60
[mar giu 28 23:17:16 2022] R10: ffff9cb2bc762000 R11: 0000000000037800 R12:=
 ffffb17d8ab4fa00
[mar giu 28 23:17:16 2022] R13: 0000000000000000 R14: ffff9caf588a1018 R15:=
 ffff9caf588a1018
[mar giu 28 23:17:16 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:16 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:16 2022] CR2: 00007fbba4071d48 CR3: 0000000227e10003 CR4:=
 00000000003706e0
[mar giu 28 23:17:16 2022] Call Trace:
[mar giu 28 23:17:16 2022]  <TASK>
[mar giu 28 23:17:16 2022]  __sta_info_flush+0x138/0x180 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_set_disassoc+0x122/0x550 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:16 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:16 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:16 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:16 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:16 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:16 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:16 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:16 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:16 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:16 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:16 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:16 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:16 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:16 2022]  </TASK>
[mar giu 28 23:17:16 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] ------------[ cut here ]------------
[mar giu 28 23:17:16 2022] sta_info_move_state() returned -5
[mar giu 28 23:17:16 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/sta_i=
nfo.c:275 sta_info_free+0xd1/0xe0 [mac80211]
[mar giu 28 23:17:16 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:16 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:16 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:16 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:16 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:16 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:16 2022] RIP: 0010:sta_info_free+0xd1/0xe0 [mac80211]
[mar giu 28 23:17:16 2022] Code: 48 8b bd e8 00 00 00 e8 ad bf b0 f9 48 89 =
ef 5d e9 d4 c6 b7 f9 89 c6 48 c7 c7 40 95 85 c1 c6 05 e4 e3 0d 00 01 e8 82 =
bc 4c fa <0f> 0b e9 75 ff ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 57
[mar giu 28 23:17:16 2022] RSP: 0018:ffffb17d8ab4f9d0 EFLAGS: 00010286
[mar giu 28 23:17:16 2022] RAX: 0000000000000021 RBX: ffffb17d8ab4f9f0 RCX:=
 0000000000000000
[mar giu 28 23:17:16 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:16 2022] RBP: ffff9caf72d54000 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:16 2022] R10: ffffb17d8ab4f808 R11: ffffffffbcf453a8 R12:=
 ffffb17d8ab4fa00
[mar giu 28 23:17:16 2022] R13: 0000000000000000 R14: ffff9caf588a1018 R15:=
 ffff9caf588a1018
[mar giu 28 23:17:16 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:16 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:16 2022] CR2: 00007fbba4071d48 CR3: 0000000227e10003 CR4:=
 00000000003706e0
[mar giu 28 23:17:16 2022] Call Trace:
[mar giu 28 23:17:16 2022]  <TASK>
[mar giu 28 23:17:16 2022]  __sta_info_flush+0x138/0x180 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_set_disassoc+0x122/0x550 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:16 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:16 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:16 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:16 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:16 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:16 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:16 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:16 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:16 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:16 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:16 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:16 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:16 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:16 2022]  </TASK>
[mar giu 28 23:17:16 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] ------------[ cut here ]------------
[mar giu 28 23:17:16 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:16 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.c:190 drv_conf_tx+0x167/0x1c0 [mac80211]
[mar giu 28 23:17:16 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:16 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:16 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:16 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:16 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:16 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:16 2022] RIP: 0010:drv_conf_tx+0x167/0x1c0 [mac80211]
[mar giu 28 23:17:16 2022] Code: ff ff 48 8b 83 88 04 00 00 48 8d b3 a8 04 =
00 00 48 c7 c7 70 94 85 c1 c6 05 4b 1f 0e 00 01 48 85 c0 48 0f 45 f0 e8 ec =
f7 4c fa <0f> 0b e9 13 ff ff ff 48 8b 95 b0 02 00 00 41 bd ea ff ff ff 48 83
[mar giu 28 23:17:16 2022] RSP: 0018:ffffb17d8ab4f9b8 EFLAGS: 00010296
[mar giu 28 23:17:16 2022] RAX: 0000000000000036 RBX: ffff9caf5b1449c0 RCX:=
 0000000000000000
[mar giu 28 23:17:16 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:16 2022] RBP: ffff9caf588a08e0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:16 2022] R10: ffffb17d8ab4f7f0 R11: ffffffffbcf453a8 R12:=
 ffffb17d8ab4fa02
[mar giu 28 23:17:16 2022] R13: 00000000fffffffb R14: 0000000000000000 R15:=
 0000000000000000
[mar giu 28 23:17:16 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:16 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:16 2022] CR2: 00007fbba4071d48 CR3: 0000000227e10003 CR4:=
 00000000003706e0
[mar giu 28 23:17:16 2022] Call Trace:
[mar giu 28 23:17:16 2022]  <TASK>
[mar giu 28 23:17:16 2022]  ieee80211_set_wmm_default+0x19f/0x3b0 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_set_disassoc+0x287/0x550 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:16 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:16 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:16 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:16 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:16 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:16 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:16 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:16 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:16 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:16 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:16 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:16 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:16 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:16 2022]  </TASK>
[mar giu 28 23:17:16 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] ------------[ cut here ]------------
[mar giu 28 23:17:16 2022] wlp3s0: Failed check-sdata-in-driver check, flag=
s: 0x0
[mar giu 28 23:17:16 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.h:945 ieee80211_assign_vif_chanctx+0x41f/0x480 [mac80211]
[mar giu 28 23:17:16 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:16 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:16 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:16 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:16 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:16 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:16 2022] RIP: 0010:ieee80211_assign_vif_chanctx+0x41f/0x4=
80 [mac80211]
[mar giu 28 23:17:16 2022] Code: ff ff 48 8b 85 88 04 00 00 48 8d b5 a8 04 =
00 00 48 c7 c7 d8 a5 85 c1 c6 05 5b f8 09 00 01 48 85 c0 48 0f 45 f0 e8 b4 =
d0 48 fa <0f> 0b e9 6a fc ff ff 0f b6 05 42 f8 09 00 41 bd fb ff ff ff 31 db
[mar giu 28 23:17:16 2022] RSP: 0018:ffffb17d8ab4f9c0 EFLAGS: 00010282
[mar giu 28 23:17:16 2022] RAX: 0000000000000036 RBX: ffff9cb1966c1840 RCX:=
 0000000000000000
[mar giu 28 23:17:16 2022] RDX: 0000000000000001 RSI: ffffffffbc64e434 RDI:=
 00000000ffffffff
[mar giu 28 23:17:16 2022] RBP: ffff9caf5b1449c0 R08: 0000000000000000 R09:=
 00000000ffffdfff
[mar giu 28 23:17:16 2022] R10: ffffb17d8ab4f7f8 R11: ffffffffbcf453a8 R12:=
 ffff9caf588a08e0
[mar giu 28 23:17:16 2022] R13: ffff9cb1966c1898 R14: 0000000000000000 R15:=
 ffff9cb1966c1898
[mar giu 28 23:17:16 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:16 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:16 2022] CR2: 00007fbba4071d48 CR3: 0000000227e10003 CR4:=
 00000000003706e0
[mar giu 28 23:17:16 2022] Call Trace:
[mar giu 28 23:17:16 2022]  <TASK>
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  __ieee80211_vif_release_channel+0x4f/0x130 [mac=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_vif_release_channel+0x3a/0x50 [mac802=
11]
[mar giu 28 23:17:16 2022]  ieee80211_set_disassoc+0x2ed/0x550 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:16 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:16 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:16 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:16 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:16 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:16 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:16 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:16 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:16 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:16 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:16 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:16 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:16 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:16 2022]  </TASK>
[mar giu 28 23:17:16 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] ------------[ cut here ]------------
[mar giu 28 23:17:16 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.h:894 ieee80211_del_chanctx+0x169/0x170 [mac80211]
[mar giu 28 23:17:16 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:16 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:16 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:16 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:16 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:16 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:16 2022] RIP: 0010:ieee80211_del_chanctx+0x169/0x170 [mac=
80211]
[mar giu 28 23:17:16 2022] Code: f5 81 3e 0f 85 6e ff ff ff 0f 1f 44 00 00 =
e9 64 ff ff ff e8 39 0a d2 ff 48 8b bd e8 13 00 00 89 85 f0 13 00 00 e9 c4 =
fe ff ff <0f> 0b e9 07 ff ff ff 0f 1f 44 00 00 55 48 89 fd 48 8d 7e 20 4c 8d
[mar giu 28 23:17:16 2022] RSP: 0018:ffffb17d8ab4f9e0 EFLAGS: 00010246
[mar giu 28 23:17:16 2022] RAX: 0000000000000000 RBX: ffff9cb1966c1840 RCX:=
 ffff9caf588a1cf0
[mar giu 28 23:17:16 2022] RDX: 0000000080000000 RSI: ffff9cb1966c1840 RDI:=
 ffff9caf588a08e0
[mar giu 28 23:17:16 2022] RBP: ffff9caf588a08e0 R08: ffff9cb1966c1840 R09:=
 ffff9cb1966c1870
[mar giu 28 23:17:16 2022] R10: ffffb17d8ab4f7f8 R11: ffffffffbcf453a8 R12:=
 ffff9caf5b1449c0
[mar giu 28 23:17:16 2022] R13: ffff9cb1966c1898 R14: ffff9caf588a1b78 R15:=
 0000000000000001
[mar giu 28 23:17:16 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:16 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:16 2022] CR2: 00007fbba4071d48 CR3: 0000000227e10003 CR4:=
 00000000003706e0
[mar giu 28 23:17:16 2022] Call Trace:
[mar giu 28 23:17:16 2022]  <TASK>
[mar giu 28 23:17:16 2022]  ieee80211_free_chanctx+0xa2/0xd0 [mac80211]
[mar giu 28 23:17:16 2022]  __ieee80211_vif_release_channel+0xee/0x130 [mac=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_vif_release_channel+0x3a/0x50 [mac802=
11]
[mar giu 28 23:17:16 2022]  ieee80211_set_disassoc+0x2ed/0x550 [mac80211]
[mar giu 28 23:17:16 2022]  ieee80211_mgd_deauth.cold+0x49/0x1f3 [mac80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_deauth+0xa0/0x1b0 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_mlme_down+0x56/0x60 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_disconnect+0x158/0x210 [cfg80211]
[mar giu 28 23:17:16 2022]  cfg80211_netdev_notifier_call+0x102/0x4a0 [cfg8=
0211]
[mar giu 28 23:17:16 2022]  ? __wake_up_klogd.part.0+0x56/0x80
[mar giu 28 23:17:16 2022]  ? __local_bh_enable_ip+0x37/0x80
[mar giu 28 23:17:16 2022]  ? ath10k_htc_send+0x21a/0x2e0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? __alloc_skb+0xf0/0x1e0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:16 2022]  ? _raw_spin_trylock+0x13/0x50
[mar giu 28 23:17:16 2022]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[mar giu 28 23:17:16 2022]  ? ___ratelimit+0x9a/0xf0
[mar giu 28 23:17:16 2022]  ? ieee80211_iter_chan_contexts_atomic+0x23/0x60=
 [mac80211]
[mar giu 28 23:17:16 2022]  ? ath10k_monitor_recalc+0x68/0x5b0 [ath10k_core]
[mar giu 28 23:17:16 2022]  ? rtnl_is_locked+0x11/0x20
[mar giu 28 23:17:16 2022]  ? inetdev_event+0x47/0x680
[mar giu 28 23:17:16 2022]  ? _raw_spin_lock_irqsave+0x24/0x50
[mar giu 28 23:17:16 2022]  raw_notifier_call_chain+0x44/0x60
[mar giu 28 23:17:16 2022]  __dev_close_many+0x4f/0xf0
[mar giu 28 23:17:16 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:16 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:16 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:16 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:16 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:16 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:16 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:16 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:16 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:16 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:16 2022]  </TASK>
[mar giu 28 23:17:16 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:16 2022] wlp3s0: failed to remove key (1, ff:ff:ff:ff:ff:=
ff) from hardware (-5)
[mar giu 28 23:17:17 2022] ath10k_pci 0000:03:00.0: failed to read firmware=
 dump area: -16
[mar giu 28 23:17:17 2022] ath10k_pci 0000:03:00.0: Copy Engine register du=
mp:
[mar giu 28 23:17:17 2022] ath10k_pci 0000:03:00.0: [00]: 0x00034400 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:17 2022] ath10k_pci 0000:03:00.0: [01]: 0x00034800 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:17 2022] ath10k_pci 0000:03:00.0: [02]: 0x00034c00 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:17 2022] ath10k_pci 0000:03:00.0: [03]: 0x00035000 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:18 2022] ath10k_warn: 150 callbacks suppressed
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035448: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: [04]: 0x00035400 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003583c: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035844: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035840: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035848: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: [05]: 0x00035800 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035c3c: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035c44: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035c40: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00035c48: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: [06]: 0x00035c00 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003603c: -110
[mar giu 28 23:17:18 2022] ath10k_pci 0000:03:00.0: [07]: 0x00036000 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:18 2022] ------------[ cut here ]------------
[mar giu 28 23:17:18 2022] WARNING: CPU: 5 PID: 37741 at net/mac80211/drive=
r-ops.c:36 drv_stop+0xee/0x100 [mac80211]
[mar giu 28 23:17:18 2022] Modules linked in: binfmt_misc snd_seq_dummy snd=
_hrtimer rfcomm xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tf=
tp nf_conntrack_netbios_ns nf_conntrack_broadcast nft_objref nf_conntrack_t=
ftp nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_rejec=
t_ipv4 nf_reject_ipv6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tab=
les ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip=
6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4 iptable_mangle iptable_raw iptable_security ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter qrtr bnep sunrpc vfa=
t fat snd_hda_codec_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_e=
xt_core snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_co=
dec_realtek snd_soc_acpi snd_soc_core snd_hda_codec_generic snd_compress ac=
97_bus snd_pcm_dmaengine intel_tcc_cooling snd_hda_intel x86_pkg_temp_therm=
al intel_powerclamp ath10k_pci
[mar giu 28 23:17:18 2022]  snd_intel_dspcfg snd_intel_sdw_acpi coretemp iT=
CO_wdt snd_hda_codec ath10k_core kvm_intel intel_pmc_bxt snd_hda_core dell_=
laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_support intel_rapl_msr snd_hwdep=
 dell_wmi uvcvideo kvm mac80211 dell_smm_hwmon btusb ledtrig_audio pktcdvd =
snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vmalloc rapl libarc4=
 intel_cstate snd_pcm ath btintel videobuf2_memops dell_smbios intel_uncore=
 rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_descript=
or processor_thermal_device_pci_legacy wmi_bmof cfg80211 snd i2c_i801 video=
buf2_common processor_thermal_device memstick bluetooth processor_thermal_r=
fim soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rap=
l videodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel=
_xhci_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal =
int3402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal=
_rel sparse_keymap acpi_pad zram
[mar giu 28 23:17:18 2022]  ip_tables amdgpu i915 drm_ttm_helper drm_buddy =
iommu_v2 ttm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core d=
rm_kms_helper ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul cr=
c32c_intel ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec type=
c wmi i2c_hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipm=
i_msghandler
[mar giu 28 23:17:18 2022] CPU: 5 PID: 37741 Comm: kworker/5:1 Tainted: G  =
      W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:17:18 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:17:18 2022] Workqueue: events_freezable ieee80211_restart_wo=
rk [mac80211]
[mar giu 28 23:17:18 2022] RIP: 0010:drv_stop+0xee/0x100 [mac80211]
[mar giu 28 23:17:18 2022] Code: 0e 00 48 85 c0 74 0c 48 8b 78 08 48 89 de =
e8 c9 4c 04 00 65 ff 0d 52 19 86 3e 0f 85 4e ff ff ff 0f 1f 44 00 00 e9 44 =
ff ff ff <0f> 0b 5b c3 cc 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 0f 1f 44 00
[mar giu 28 23:17:18 2022] RSP: 0018:ffffb17d8ab4fcf0 EFLAGS: 00010246
[mar giu 28 23:17:18 2022] RAX: 0000000000000000 RBX: ffff9caf588a08e0 RCX:=
 0000000000000000
[mar giu 28 23:17:18 2022] RDX: 0000000080000000 RSI: 0000000000000286 RDI:=
 ffff9caf588a08e0
[mar giu 28 23:17:18 2022] RBP: ffff9caf588a1b78 R08: ffff9caf40051000 R09:=
 ffffffffbce5ccf0
[mar giu 28 23:17:18 2022] R10: 0000000000000000 R11: 0000000000000000 R12:=
 ffff9caf588a08e0
[mar giu 28 23:17:18 2022] R13: ffff9caf588a1248 R14: ffff9caf588a0ee0 R15:=
 ffff9caf5b145848
[mar giu 28 23:17:18 2022] FS:  0000000000000000(0000) GS:ffff9cb2ac540000(=
0000) knlGS:0000000000000000
[mar giu 28 23:17:18 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:17:18 2022] CR2: 00007fbbd69f3d48 CR3: 0000000227e10006 CR4:=
 00000000003706e0
[mar giu 28 23:17:18 2022] Call Trace:
[mar giu 28 23:17:18 2022]  <TASK>
[mar giu 28 23:17:18 2022]  ieee80211_do_stop+0x630/0x840 [mac80211]
[mar giu 28 23:17:18 2022]  ? preempt_count_add+0x6a/0xa0
[mar giu 28 23:17:18 2022]  ieee80211_stop+0x3d/0x170 [mac80211]
[mar giu 28 23:17:18 2022]  __dev_close_many+0x8e/0xf0
[mar giu 28 23:17:18 2022]  dev_close_many+0x7b/0x120
[mar giu 28 23:17:18 2022]  ? ieee80211_handle_reconfig_failure+0xbe/0xe0 [=
mac80211]
[mar giu 28 23:17:18 2022]  dev_close+0x56/0x80
[mar giu 28 23:17:18 2022]  cfg80211_shutdown_all_interfaces+0x49/0xe0 [cfg=
80211]
[mar giu 28 23:17:18 2022]  ieee80211_restart_work+0x127/0x150 [mac80211]
[mar giu 28 23:17:18 2022]  process_one_work+0x1e5/0x3b0
[mar giu 28 23:17:18 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:18 2022]  worker_thread+0x50/0x3a0
[mar giu 28 23:17:18 2022]  ? rescuer_thread+0x370/0x370
[mar giu 28 23:17:18 2022]  kthread+0xe8/0x110
[mar giu 28 23:17:18 2022]  ? kthread_complete_and_exit+0x20/0x20
[mar giu 28 23:17:18 2022]  ret_from_fork+0x22/0x30
[mar giu 28 23:17:18 2022]  </TASK>
[mar giu 28 23:17:18 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:17:53 2022] ath10k_warn: 4 callbacks suppressed
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00080008: -110
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffffffff at 0x00080008: -110
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xfffffffe at 0x00080008: -110
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:53 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: failed to read device r=
egister, device is gone
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: failed to reset chip: -5
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: Could not init hif: -5
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: firmware crashed! (guid=
 bd392c99-bd8a-49bf-96d9-ada59f9ff687)
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: qca9377 hw1.1 target 0x=
05020001 chip_id 0x003821ff sub 1028:1810
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: kconfig debug 0 debugfs=
 1 tracing 0 dfs 0 testmode 0
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: firmware ver WLAN.TF.2.=
1-00021-QCARMSWP-1 api 6 features wowlan,ignore-otp crc32 42e41877
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: board_file api 2 bmi_id=
 N/A crc32 8aedfa4a
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: htt-ver 3.56 wmi-op 4 h=
tt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: failed to read firmware=
 dump area: -28
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: Copy Engine register du=
mp:
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: [00]: 0x00034400 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: [01]: 0x00034800 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: [02]: 0x00034c00 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:56 2022] ath10k_pci 0000:03:00.0: [03]: 0x00035000 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:57 2022] ath10k_pci 0000:03:00.0: [04]: 0x00035400 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:57 2022] ath10k_pci 0000:03:00.0: [05]: 0x00035800 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:57 2022] ath10k_pci 0000:03:00.0: [06]: 0x00035c00 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:17:57 2022] ath10k_pci 0000:03:00.0: [07]: 0x00036000 429496=
7295 4294967295 4294967295 4294967295
[mar giu 28 23:18:16 2022] ath10k_warn: 133 callbacks suppressed
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00034400: -110
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00034404: -110
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00034410: -110
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0000 at 0x00034410: -110
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003444c: -110
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0000 at 0x0003444c: -110
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00034408: -110
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x0003440c: -110
[mar giu 28 23:18:16 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00034450: -110
[mar giu 28 23:18:21 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 23:18:21 2022] amdgpu: can't get the mac of 5
[mar giu 28 23:18:23 2022] cfg80211: Loading compiled-in X.509 certificates=
 for regulatory database
[mar giu 28 23:18:23 2022] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf4=
7aef9cea7'
[mar giu 28 23:18:23 2022] ath10k_pci 0000:03:00.0: enabling device (0000 -=
> 0002)
[mar giu 28 23:18:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00034400: -110
[mar giu 28 23:18:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00034404: -110
[mar giu 28 23:18:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00034410: -110
[mar giu 28 23:18:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0000 at 0x00034410: -110
[mar giu 28 23:18:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003444c: -110
[mar giu 28 23:18:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0000 at 0x0003444c: -110
[mar giu 28 23:18:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00034408: -110
[mar giu 28 23:18:23 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x0003440c: -110
[mar giu 28 23:18:24 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00034450: -110
[mar giu 28 23:18:24 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0000 at 0x00034450: -110
[mar giu 28 23:18:27 2022] ath10k_pci 0000:03:00.0: pci irq msi oper_irq_mo=
de 2 irq_mode 0 reset_mode 0
[mar giu 28 23:18:28 2022] ath10k_warn: 147 callbacks suppressed
[mar giu 28 23:18:28 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:28 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:28 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:28 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:28 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:28 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:28 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:29 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:29 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:29 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:18:31 2022] ath10k_pci 0000:03:00.0: failed to read device r=
egister, device is gone
[mar giu 28 23:18:31 2022] ath10k_pci 0000:03:00.0: failed to reset chip: -5
[mar giu 28 23:18:33 2022] ath10k_pci: probe of 0000:03:00.0 failed with er=
ror -5
[mar giu 28 23:18:33 2022] ------------[ cut here ]------------
[mar giu 28 23:18:33 2022] WARNING: CPU: 0 PID: 42956 at kernel/irq/msi.c:1=
82 msi_device_data_release+0x27/0x30
[mar giu 28 23:18:33 2022] Modules linked in: ath10k_pci(+) ath10k_core mac=
80211 libarc4 ath cfg80211 binfmt_misc snd_seq_dummy snd_hrtimer rfcomm xt_=
CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tftp nf_conntrack_net=
bios_ns nf_conntrack_broadcast nft_objref nf_conntrack_tftp nft_fib_inet nf=
t_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ip=
v6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tables ebtable_nat ebt=
able_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security ipt=
able_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle i=
ptable_raw iptable_security ip_set nfnetlink ebtable_filter ebtables ip6tab=
le_filter ip6_tables iptable_filter qrtr bnep sunrpc vfat fat snd_hda_codec=
_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_ext_core snd_soc_sst=
_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_codec_realtek snd_soc=
_acpi snd_soc_core snd_hda_codec_generic snd_compress ac97_bus snd_pcm_dmae=
ngine intel_tcc_cooling snd_hda_intel
[mar giu 28 23:18:33 2022]  x86_pkg_temp_thermal intel_powerclamp snd_intel=
_dspcfg snd_intel_sdw_acpi coretemp iTCO_wdt snd_hda_codec kvm_intel intel_=
pmc_bxt snd_hda_core dell_laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_suppor=
t intel_rapl_msr snd_hwdep dell_wmi uvcvideo kvm dell_smm_hwmon btusb ledtr=
ig_audio pktcdvd snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vma=
lloc rapl intel_cstate snd_pcm btintel videobuf2_memops dell_smbios intel_u=
ncore rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_des=
criptor processor_thermal_device_pci_legacy wmi_bmof snd i2c_i801 videobuf2=
_common processor_thermal_device memstick bluetooth processor_thermal_rfim =
soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rapl vi=
deodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel_xhc=
i_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal int3=
402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal_rel=
 sparse_keymap acpi_pad zram ip_tables
[mar giu 28 23:18:33 2022]  amdgpu i915 drm_ttm_helper drm_buddy iommu_v2 t=
tm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core drm_kms_hel=
per ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul crc32c_intel=
 ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec typec wmi i2c_=
hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipmi_msghandl=
er [last unloaded: libarc4]
[mar giu 28 23:18:33 2022] CPU: 0 PID: 42956 Comm: modprobe Tainted: G     =
   W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:18:33 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:18:33 2022] RIP: 0010:msi_device_data_release+0x27/0x30
[mar giu 28 23:18:33 2022] Code: 44 00 00 0f 1f 44 00 00 48 83 7e 38 00 53 =
48 89 fb 75 17 48 8d 7e 30 e8 87 da 5c 00 48 c7 83 30 02 00 00 00 00 00 00 =
5b c3 cc <0f> 0b eb e5 0f 1f 44 00 00 0f 1f 44 00 00 48 8b bf 30 02 00 00 48
[mar giu 28 23:18:33 2022] RSP: 0018:ffffb17d859c3c18 EFLAGS: 00010286
[mar giu 28 23:18:33 2022] RAX: ffffffffbb163410 RBX: ffff9caf4158f0d0 RCX:=
 0000000000000000
[mar giu 28 23:18:33 2022] RDX: ffffffffbc5fca59 RSI: ffff9caf99dca228 RDI:=
 ffff9caf4158f0d0
[mar giu 28 23:18:33 2022] RBP: ffff9caf99dca200 R08: ffffb17d859c3c28 R09:=
 ffffb17d859c3c28
[mar giu 28 23:18:33 2022] R10: 0000000000000003 R11: ffff9cb0d361c900 R12:=
 ffff9caf5ee030c0
[mar giu 28 23:18:33 2022] R13: ffffb17d859c3c28 R14: 0000000000000002 R15:=
 ffff9caf4158f374
[mar giu 28 23:18:33 2022] FS:  00007f84e02bf740(0000) GS:ffff9cb2ac400000(=
0000) knlGS:0000000000000000
[mar giu 28 23:18:33 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:18:33 2022] CR2: 00003e7502410000 CR3: 000000041170e001 CR4:=
 00000000003706f0
[mar giu 28 23:18:33 2022] Call Trace:
[mar giu 28 23:18:33 2022]  <TASK>
[mar giu 28 23:18:33 2022]  devres_release_all+0xa8/0xe0
[mar giu 28 23:18:33 2022]  device_unbind_cleanup+0xe/0x70
[mar giu 28 23:18:33 2022]  really_probe+0x141/0x380
[mar giu 28 23:18:33 2022]  __driver_probe_device+0xff/0x180
[mar giu 28 23:18:33 2022]  driver_probe_device+0x1e/0x90
[mar giu 28 23:18:33 2022]  __driver_attach+0xc1/0x1d0
[mar giu 28 23:18:33 2022]  ? __device_attach_driver+0xe0/0xe0
[mar giu 28 23:18:33 2022]  ? __device_attach_driver+0xe0/0xe0
[mar giu 28 23:18:33 2022]  bus_for_each_dev+0x64/0x90
[mar giu 28 23:18:33 2022]  bus_add_driver+0x155/0x200
[mar giu 28 23:18:33 2022]  driver_register+0x8f/0xe0
[mar giu 28 23:18:33 2022]  ? 0xffffffffc11bc000
[mar giu 28 23:18:33 2022]  ath10k_pci_init+0x1f/0x1000 [ath10k_pci]
[mar giu 28 23:18:33 2022]  do_one_initcall+0x44/0x200
[mar giu 28 23:18:33 2022]  ? kmem_cache_alloc_trace+0x16e/0x2b0
[mar giu 28 23:18:33 2022]  do_init_module+0x4c/0x260
[mar giu 28 23:18:33 2022]  __do_sys_init_module+0x11d/0x180
[mar giu 28 23:18:33 2022]  do_syscall_64+0x5c/0x80
[mar giu 28 23:18:33 2022]  ? exc_page_fault+0x71/0x170
[mar giu 28 23:18:33 2022]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[mar giu 28 23:18:33 2022] RIP: 0033:0x7f84dfa3fc2e
[mar giu 28 23:18:33 2022] Code: 48 8b 0d f5 91 1b 00 f7 d8 64 89 01 48 83 =
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 =
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c2 91 1b 00 f7 d8 64 89 01 48
[mar giu 28 23:18:33 2022] RSP: 002b:00007ffd4b979588 EFLAGS: 00000246 ORIG=
_RAX: 00000000000000af
[mar giu 28 23:18:33 2022] RAX: ffffffffffffffda RBX: 000056221b81acc0 RCX:=
 00007f84dfa3fc2e
[mar giu 28 23:18:33 2022] RDX: 000056221a8a2a2a RSI: 0000000000038fb6 RDI:=
 000056221c466dd0
[mar giu 28 23:18:33 2022] RBP: 000056221c466dd0 R08: 000056221b81dfe0 R09:=
 0000000000038010
[mar giu 28 23:18:33 2022] R10: 0000000000000005 R11: 0000000000000246 R12:=
 000056221a8a2a2a
[mar giu 28 23:18:33 2022] R13: 000056221b81ac10 R14: 000056221b81acc0 R15:=
 000056221b81e5a0
[mar giu 28 23:18:33 2022]  </TASK>
[mar giu 28 23:18:33 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:18:33 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 23:18:33 2022] amdgpu: can't get the mac of 5
[mar giu 28 23:18:56 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 23:18:56 2022] amdgpu: can't get the mac of 5
[mar giu 28 23:18:58 2022] cfg80211: Loading compiled-in X.509 certificates=
 for regulatory database
[mar giu 28 23:18:58 2022] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf4=
7aef9cea7'
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00034400: -110
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00034404: -110
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00034410: -110
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0000 at 0x00034410: -110
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003444c: -110
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0000 at 0x0003444c: -110
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x00034408: -110
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0x00000000 at 0x0003440c: -110
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x00034450: -110
[mar giu 28 23:18:59 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or write32 of 0xffff0000 at 0x00034450: -110
[mar giu 28 23:19:03 2022] ------------[ cut here ]------------
[mar giu 28 23:19:03 2022] WARNING: CPU: 4 PID: 43197 at drivers/pci/msi/ms=
i.c:882 __pci_enable_msi_range+0x3d1/0x400
[mar giu 28 23:19:03 2022] Modules linked in: ath10k_pci(+) ath10k_core mac=
80211 libarc4 ath cfg80211 binfmt_misc snd_seq_dummy snd_hrtimer rfcomm xt_=
CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_nat_tftp nf_conntrack_net=
bios_ns nf_conntrack_broadcast nft_objref nf_conntrack_tftp nft_fib_inet nf=
t_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ip=
v6 nft_reject nft_ct bridge nft_chain_nat stp llc nf_tables ebtable_nat ebt=
able_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security ipt=
able_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle i=
ptable_raw iptable_security ip_set nfnetlink ebtable_filter ebtables ip6tab=
le_filter ip6_tables iptable_filter qrtr bnep sunrpc vfat fat snd_hda_codec=
_hdmi snd_ctl_led snd_soc_skl snd_soc_hdac_hda snd_hda_ext_core snd_soc_sst=
_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match snd_hda_codec_realtek snd_soc=
_acpi snd_soc_core snd_hda_codec_generic snd_compress ac97_bus snd_pcm_dmae=
ngine intel_tcc_cooling snd_hda_intel
[mar giu 28 23:19:03 2022]  x86_pkg_temp_thermal intel_powerclamp snd_intel=
_dspcfg snd_intel_sdw_acpi coretemp iTCO_wdt snd_hda_codec kvm_intel intel_=
pmc_bxt snd_hda_core dell_laptop mei_pxp mei_hdcp ee1004 iTCO_vendor_suppor=
t intel_rapl_msr snd_hwdep dell_wmi uvcvideo kvm dell_smm_hwmon btusb ledtr=
ig_audio pktcdvd snd_seq btrtl irqbypass snd_seq_device btbcm videobuf2_vma=
lloc rapl intel_cstate snd_pcm btintel videobuf2_memops dell_smbios intel_u=
ncore rtsx_usb_ms snd_timer dcdbas btmtk pcspkr videobuf2_v4l2 dell_wmi_des=
criptor processor_thermal_device_pci_legacy wmi_bmof snd i2c_i801 videobuf2=
_common processor_thermal_device memstick bluetooth processor_thermal_rfim =
soundcore i2c_smbus processor_thermal_mbox mei_me processor_thermal_rapl vi=
deodev intel_rapl_common mc joydev ecdh_generic idma64 rfkill mei intel_xhc=
i_usb_role_switch intel_soc_dts_iosf intel_pch_thermal int3403_thermal int3=
402_thermal intel_hid int3400_thermal int340x_thermal_zone acpi_thermal_rel=
 sparse_keymap acpi_pad zram ip_tables
[mar giu 28 23:19:03 2022]  amdgpu i915 drm_ttm_helper drm_buddy iommu_v2 t=
tm gpu_sched i2c_algo_bit drm_dp_helper rtsx_usb_sdmmc mmc_core drm_kms_hel=
per ucsi_acpi hid_multitouch crct10dif_pclmul drm crc32_pclmul crc32c_intel=
 ghash_clmulni_intel typec_ucsi r8169 serio_raw rtsx_usb cec typec wmi i2c_=
hid_acpi i2c_hid pinctrl_sunrisepoint video fuse ipmi_devintf ipmi_msghandl=
er [last unloaded: libarc4]
[mar giu 28 23:19:03 2022] CPU: 4 PID: 43197 Comm: modprobe Tainted: G     =
   W         5.18.6-100.fc35.x86_64 #1
[mar giu 28 23:19:03 2022] Hardware name: Dell Inc. Inspiron 5570/0YDF7T, B=
IOS 1.9.0 03/25/2022
[mar giu 28 23:19:03 2022] RIP: 0010:__pci_enable_msi_range+0x3d1/0x400
[mar giu 28 23:19:03 2022] Code: 00 10 44 8b 24 24 e9 04 fe ff ff 31 f6 48 =
89 df 4c 89 0c 24 e8 d0 0c ff ff 4c 8b 0c 24 e9 82 fe ff ff 45 89 c4 e9 9e =
fc ff ff <0f> 0b 41 bc ea ff ff ff e9 91 fc ff ff 41 bc de ff ff ff e9 86 fc
[mar giu 28 23:19:03 2022] RSP: 0018:ffffb17d84a4fb38 EFLAGS: 00010202
[mar giu 28 23:19:03 2022] RAX: 0000000000000010 RBX: ffff9caf4158f000 RCX:=
 0000000000000000
[mar giu 28 23:19:03 2022] RDX: 0000000000000001 RSI: 0000000000000001 RDI:=
 ffff9caf4158f000
[mar giu 28 23:19:03 2022] RBP: 0000000000000001 R08: 0000000000000001 R09:=
 ffff9cb28d188770
[mar giu 28 23:19:03 2022] R10: ffffb17d84a4f858 R11: ffffffffbcf453a8 R12:=
 0000000000000008
[mar giu 28 23:19:03 2022] R13: 0000000000000001 R14: 0000000000000000 R15:=
 ffff9caf4158f000
[mar giu 28 23:19:03 2022] FS:  00007f8e3d826740(0000) GS:ffff9cb2ac500000(=
0000) knlGS:0000000000000000
[mar giu 28 23:19:03 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[mar giu 28 23:19:03 2022] CR2: 00005624ac0a8000 CR3: 000000028269e003 CR4:=
 00000000003706e0
[mar giu 28 23:19:03 2022] Call Trace:
[mar giu 28 23:19:03 2022]  <TASK>
[mar giu 28 23:19:03 2022]  ? _raw_spin_lock+0x13/0x40
[mar giu 28 23:19:03 2022]  pci_enable_msi+0x16/0x20
[mar giu 28 23:19:03 2022]  ath10k_pci_probe+0x460/0x82f [ath10k_pci]
[mar giu 28 23:19:03 2022]  local_pci_probe+0x45/0x80
[mar giu 28 23:19:03 2022]  ? pci_match_device+0xd8/0x130
[mar giu 28 23:19:03 2022]  pci_device_probe+0xb5/0x210
[mar giu 28 23:19:03 2022]  really_probe+0x19d/0x380
[mar giu 28 23:19:03 2022]  __driver_probe_device+0xff/0x180
[mar giu 28 23:19:03 2022]  driver_probe_device+0x1e/0x90
[mar giu 28 23:19:03 2022]  __driver_attach+0xc1/0x1d0
[mar giu 28 23:19:03 2022]  ? __device_attach_driver+0xe0/0xe0
[mar giu 28 23:19:03 2022]  ? __device_attach_driver+0xe0/0xe0
[mar giu 28 23:19:03 2022]  bus_for_each_dev+0x64/0x90
[mar giu 28 23:19:03 2022]  bus_add_driver+0x155/0x200
[mar giu 28 23:19:03 2022]  driver_register+0x8f/0xe0
[mar giu 28 23:19:03 2022]  ? 0xffffffffc14bc000
[mar giu 28 23:19:03 2022]  ath10k_pci_init+0x1f/0x1000 [ath10k_pci]
[mar giu 28 23:19:03 2022]  do_one_initcall+0x44/0x200
[mar giu 28 23:19:03 2022]  ? kmem_cache_alloc_trace+0x16e/0x2b0
[mar giu 28 23:19:03 2022]  do_init_module+0x4c/0x260
[mar giu 28 23:19:03 2022]  __do_sys_init_module+0x11d/0x180
[mar giu 28 23:19:03 2022]  do_syscall_64+0x5c/0x80
[mar giu 28 23:19:03 2022]  ? do_user_addr_fault+0x1e9/0x690
[mar giu 28 23:19:03 2022]  ? exc_page_fault+0x71/0x170
[mar giu 28 23:19:03 2022]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[mar giu 28 23:19:03 2022] RIP: 0033:0x7f8e3d03fc2e
[mar giu 28 23:19:03 2022] Code: 48 8b 0d f5 91 1b 00 f7 d8 64 89 01 48 83 =
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 =
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c2 91 1b 00 f7 d8 64 89 01 48
[mar giu 28 23:19:03 2022] RSP: 002b:00007fffd5e01228 EFLAGS: 00000246 ORIG=
_RAX: 00000000000000af
[mar giu 28 23:19:03 2022] RAX: ffffffffffffffda RBX: 00005624ac06ecc0 RCX:=
 00007f8e3d03fc2e
[mar giu 28 23:19:03 2022] RDX: 00005624ab96fa2a RSI: 0000000000038fb6 RDI:=
 00005624accbadd0
[mar giu 28 23:19:03 2022] RBP: 00005624accbadd0 R08: 00005624ac071fe0 R09:=
 0000000000038010
[mar giu 28 23:19:03 2022] R10: 0000000000000005 R11: 0000000000000246 R12:=
 00005624ab96fa2a
[mar giu 28 23:19:03 2022] R13: 00005624ac06ec10 R14: 00005624ac06ecc0 R15:=
 00005624ac0725a0
[mar giu 28 23:19:03 2022]  </TASK>
[mar giu 28 23:19:03 2022] ---[ end trace 0000000000000000 ]---
[mar giu 28 23:19:03 2022] ath10k_pci 0000:03:00.0: pci irq legacy oper_irq=
_mode 1 irq_mode 0 reset_mode 0
[mar giu 28 23:19:04 2022] ath10k_warn: 147 callbacks suppressed
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:04 2022] ath10k_pci 0000:03:00.0: failed to wake target f=
or read32 at 0x0003a028: -110
[mar giu 28 23:19:06 2022] ath10k_pci 0000:03:00.0: failed to read device r=
egister, device is gone
[mar giu 28 23:19:06 2022] ath10k_pci 0000:03:00.0: failed to reset chip: -5
[mar giu 28 23:19:08 2022] ath10k_pci: probe of 0000:03:00.0 failed with er=
ror -5
[mar giu 28 23:19:09 2022] [drm] PCIE GART of 256M enabled (table at 0x0000=
00F400000000).
[mar giu 28 23:19:09 2022] amdgpu: can't get the mac of 5

--nextPart3184950.44csPzL39Z--

--nextPart8086853.T7Z3S40VBb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEzN+LViBbCJExaszEZxvry+L1/8IFAmLAtcgACgkQZxvry+L1
/8ITaA/9FJppZSaB5PQ6rs6jFkk8/vsHGIcIWJ8N8Z889HldUfE2PYxEi58NI/0T
rk5G+iPkHDEZhOa4KfHyZbWzX3uzesXD4eBUG5VCkQH8jaza12jLFIyWQuSRYZ2r
xrSxQ+Ft5dt+oo3bT36V8YEa91QX7fg3GsxOL4DN63jSAYdnvqghV4k6/vom8PAI
p+EoSDNkNe4mbQmjpuYwMqTo0GIOzXBNylKFueSRMGBefSQliHzAYWoFQV1C7B3U
slTD6rF/XstoEv4sWtZikkJgTalwDmpm65NTklLc8Q/k+Jh5pv6YxIR0ZwzgpbB8
MdlqFA0LWSSjjg2htTPns0CB80R0PmgeflMROeELFZg4wYe0wjsxuECvxCL7aIpg
y1NzI/Xwkjj0z35O34DUjjw5EPQv+ypyofnFrDYmpwmOMtA0tQso/V0LWrPuGIZ5
FYaq23jIWj/hvO8RQEsFc0ds1dv3OHthNQFjz5byjqWNO+f7xSS1HTG+a4K2iB5z
TRFhXvVz12KEfy5YjX2hNx1dZo8uxyeI1qT4/kws4xEvUgGEd/92QxMfkfBK7u9e
x7jNLdfZRhv0rekmbPgMqGeRNpg+2yCBThgKKYBe/05Vt2mzShowTabByp9sS7sw
gU1JqNfQF8yn12ihx+LRGkVkAHmam8WobbUPL5DOkAWlN/jETE4=
=BMSM
-----END PGP SIGNATURE-----

--nextPart8086853.T7Z3S40VBb--





--===============1476044148460551671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1476044148460551671==--




