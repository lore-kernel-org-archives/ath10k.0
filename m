Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EBBC35274
	for <ath10k@archiver.kernel.org>; Mon, 18 Dec 2023 12:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9V1fJVR0IhgBHgy0xs0rm50SQjh36lkqMajdY8CYu34=; b=dxXtpK507oSFfn8TdNj6swA43n
	LxLruO1cumS5+80YQIYY9yI+LXkqDdxPPWOPSGepG5aTU734l0m746BaBXMENw/zrouXzUzIkWHWa
	Tsaf/hwBvFO/VIzMelPuINj34o1ejvg/gpnL9PHgTPNrUpC2NnhkGQ1yF5mxigW/o5UveWeQIyGey
	26/gEio5CIR3i64VRAwZ2e8YXXkxd53izU3E4feeAtBK941L9gxFM7HOh67mSkrKXvUy6sA19fr5H
	ZwV8seUoxt3+P/TltZz5Fw0kidcfjNiiplk0N0GJIsNN0e6MStCn8/ZO6fH0XUmfGdnOD2P3i1i6W
	itfntSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCs2-00Acvb-28;
	Mon, 18 Dec 2023 12:37:18 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCrz-00Acun-0v
	for ath10k@lists.infradead.org;
	Mon, 18 Dec 2023 12:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702903035; x=1734439035;
  h=date:from:to:cc:subject:message-id;
  bh=KRpkh5bXswLEZqwKbG4cA+C/RnkMafLv123oP4W0uT0=;
  b=LuwKsjhCrNCCOv8CVb4KBi32pmgxWgga4wElv2pxL3DvYRdoQpbZ9ld2
   BzpxXAnnY2beMI0no0QTwJKkcERT2mn2fJP2yt3Aw0BaB62ppKw60miB0
   wPppnw+cToOSBzX0COEL3obEflQGAbE2XbSNByFy99SvBsN1xJdTOvu06
   Jscii5x39m7gUO/thM+b+MhXgkT0XjzqUYExZsYpAz3b/lmLqa5WlxRvO
   IBZ9c0Ko1/qN6RqDysCIN/ekUtEq7gsc5I+82qwHcj16zMbV6vMDMvb2A
   KI2BTcVB+5e82LSqxmGk7P2k5nbz7+NYm7pwI1H631k1SGyH26O70z5aa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8861210"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="8861210"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 04:37:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="23761714"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Dec 2023 04:37:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFCrn-00044D-0m;
	Mon, 18 Dec 2023 12:37:10 +0000
Date: Mon, 18 Dec 2023 20:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 14e9324c14ea0b9310f22d8053fb3ab134981267
Message-ID: <202312182004.wSxA6KsC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_043715_417736_7BE1C8E4 
X-CRM114-Status: UNSURE (   3.94  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 14e9324c14ea0b9310f22d8053fb3ab134981267  Merge branch 'ath-next' into ath-qca

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-randconfig-013-20231217
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-events-rapl.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-classmate-laptop.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-hid.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-vbtn.o
|-- x86_64-buildonly-randconfig-001-20231218
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-events-rapl.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-kvm-kvm-intel.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-i915-kvmgt.o
|-- x86_64-buildonly-randconfig-005-20231218
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-pmc-intel_pmc_core_pltdrv.o
|-- x86_64-randconfig-014-20231218
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-hid.o
|-- x86_64-randconfig-073-20231218
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvdimm-nd_e820.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-classmate-laptop.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-hid.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-vbtn.o
`-- x86_64-randconfig-074-20231218
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-hid.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_mbox.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_rapl.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_rfim.o
clang_recent_errors
|-- i386-buildonly-randconfig-002-20231217
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-amilo-rfkill.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-classmate-laptop.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-vbtn.o
|-- i386-buildonly-randconfig-005-20231217
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-events-rapl.o
|-- x86_64-randconfig-002-20231218
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-hid-intel-ish-hid-intel-ishtp.o
|-- x86_64-randconfig-003-20231218
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-kernel-cpu-mce-mce-inject.o
`-- x86_64-rhel-8.3-rust
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-events-rapl.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-kernel-cpu-mce-mce-inject.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-kvm-kvm-intel.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-acpi-nfit-nfit.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-base-regmap-regmap-spi.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-dax-dax_pmem.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-gpu-drm-i915-kvmgt.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-hid-intel-ish-hid-intel-ishtp.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvdimm-nd_e820.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-amilo-rfkill.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-classmate-laptop.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-hid.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-rst.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-vbtn.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-pmc-intel_pmc_core_pltdrv.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_mbox.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_rapl.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_rfim.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-intel_soc_dts_iosf.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-mm-hwpoison-inject.o

elapsed time: 1473m

configs tested: 173
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231218   gcc  
arc                   randconfig-002-20231218   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                          moxart_defconfig   clang
arm                   randconfig-001-20231218   gcc  
arm                   randconfig-002-20231218   gcc  
arm                   randconfig-003-20231218   gcc  
arm                   randconfig-004-20231218   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231218   gcc  
arm64                 randconfig-002-20231218   gcc  
arm64                 randconfig-003-20231218   gcc  
arm64                 randconfig-004-20231218   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231218   gcc  
csky                  randconfig-002-20231218   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231218   clang
hexagon               randconfig-002-20231218   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231217   clang
i386         buildonly-randconfig-002-20231217   clang
i386         buildonly-randconfig-003-20231217   clang
i386         buildonly-randconfig-004-20231217   clang
i386         buildonly-randconfig-005-20231217   clang
i386         buildonly-randconfig-006-20231217   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231217   clang
i386                  randconfig-002-20231217   clang
i386                  randconfig-003-20231217   clang
i386                  randconfig-004-20231217   clang
i386                  randconfig-005-20231217   clang
i386                  randconfig-006-20231217   clang
i386                  randconfig-011-20231217   gcc  
i386                  randconfig-012-20231217   gcc  
i386                  randconfig-013-20231217   gcc  
i386                  randconfig-014-20231217   gcc  
i386                  randconfig-015-20231217   gcc  
i386                  randconfig-016-20231217   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231218   gcc  
loongarch             randconfig-002-20231218   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                      bmips_stb_defconfig   clang
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231218   gcc  
nios2                 randconfig-002-20231218   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231218   gcc  
parisc                randconfig-002-20231218   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc               randconfig-001-20231218   gcc  
powerpc               randconfig-002-20231218   gcc  
powerpc               randconfig-003-20231218   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc64             randconfig-001-20231218   gcc  
powerpc64             randconfig-002-20231218   gcc  
powerpc64             randconfig-003-20231218   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231218   gcc  
riscv                 randconfig-002-20231218   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231218   clang
s390                  randconfig-002-20231218   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231218   gcc  
sh                    randconfig-002-20231218   gcc  
sh                          rsk7201_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231218   gcc  
sparc64               randconfig-002-20231218   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231218   gcc  
um                    randconfig-002-20231218   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231218   gcc  
x86_64       buildonly-randconfig-002-20231218   gcc  
x86_64       buildonly-randconfig-003-20231218   gcc  
x86_64       buildonly-randconfig-004-20231218   gcc  
x86_64       buildonly-randconfig-005-20231218   gcc  
x86_64       buildonly-randconfig-006-20231218   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231218   clang
x86_64                randconfig-002-20231218   clang
x86_64                randconfig-003-20231218   clang
x86_64                randconfig-004-20231218   clang
x86_64                randconfig-005-20231218   clang
x86_64                randconfig-006-20231218   clang
x86_64                randconfig-011-20231218   gcc  
x86_64                randconfig-012-20231218   gcc  
x86_64                randconfig-013-20231218   gcc  
x86_64                randconfig-014-20231218   gcc  
x86_64                randconfig-015-20231218   gcc  
x86_64                randconfig-016-20231218   gcc  
x86_64                randconfig-071-20231218   gcc  
x86_64                randconfig-072-20231218   gcc  
x86_64                randconfig-073-20231218   gcc  
x86_64                randconfig-074-20231218   gcc  
x86_64                randconfig-075-20231218   gcc  
x86_64                randconfig-076-20231218   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20231218   gcc  
xtensa                randconfig-002-20231218   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

