Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D208C46CA2
	for <ath10k@archiver.kernel.org>; Tue, 19 Dec 2023 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7sCqINCdIOWOeE/kLMbhPs7vjRQnEuXIrWIAgBswJE=; b=R7pRbnilwqHWEYPTPRlxr5Bx2L
	MjoChrEGBdtvufkheDpmMH1cydpo8boA+Zi80MfYiF657whWiGemvu6PEVLJdqShmLgdQBB9QHSye
	nWZgOD4PF9whh9YMrmjxWyfLJHOpdTERp7vABBiMaF8lQXFSAfOOJLgmCH4cdBXpKCm/GW3c3oRGF
	5gXlDSorJIQ5CqiXdwABhgof53hRJH+TVQPmALD4GnB5T3eEwG4Yv9XbRXEaQI2DPOhF0K+xwlSSN
	KtayB/n00h0RFdCHpGn8AQgR6nlC1Qe5fhcHmojL/4pmQ1/Xs1zRKBpgc0GUvhUfqMC7qPuHiGE1B
	gJ6llx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFg2P-00FLdn-1T;
	Tue, 19 Dec 2023 19:45:57 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFg2L-00FLd3-2Z
	for ath10k@lists.infradead.org;
	Tue, 19 Dec 2023 19:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703015153; x=1734551153;
  h=date:from:to:cc:subject:message-id;
  bh=WVqMy/JHZcCiAZa0LreX1nl2SgyGOoB4UWKWD5Cw6iY=;
  b=geJIyJWV24hfwd7hkvsM4/SU6sAkqZXsFCPmsu550eX7g1Qg3WqRQsY8
   1KzqQ5sS4dOLFi3F+DbTbfv7UPv4xL9OyB+J0gDcC2H7Px9f03BX6GDqL
   SA/BSQt1EMSkxJ2zsmGxwj+BpzaTdXsypbdjQ3TWRA/QcTRcHOxfx1DpS
   qqNNtplzQWJz/TfvT4yu1mau61vRPE7PleEL8sMKb5pVpxzgsWETv+X7R
   NY5SK4wSyqAizd/7MrpvU+tiXjPsQftfU3dpGRpt/MDq1sUAe69O726kt
   08jmgji7TMlJC+J8mMojREY98kx1UW8DqDce7/BM1F3of497X1ntEcokJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="392880447"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="392880447"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 11:45:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="805015422"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="805015422"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Dec 2023 11:45:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFg26-0005sT-2K;
	Tue, 19 Dec 2023 19:45:38 +0000
Date: Wed, 20 Dec 2023 03:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 68518adc8760d2c514d8588ef6bbb45f9bc8b18f
Message-ID: <202312200324.xa4zUr2i-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_114553_847810_07DE4323 
X-CRM114-Status: UNSURE (   4.84  )
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
branch HEAD: 68518adc8760d2c514d8588ef6bbb45f9bc8b18f  Merge branch 'ath-next' into ath-qca

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-s3c6400_defconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-base-regmap-regmap-spi.o
|-- i386-randconfig-015-20231219
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-classmate-laptop.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-rst.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-pmc-intel_pmc_core_pltdrv.o
|-- x86_64-buildonly-randconfig-001-20231220
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-acpi-nfit-nfit.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-hid.o
|-- x86_64-buildonly-randconfig-005-20231220
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-kvm-kvm-intel.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvdimm-nd_e820.o
|-- x86_64-randconfig-072-20231220
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-kvm-kvm-intel.o
`-- x86_64-randconfig-073-20231220
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-classmate-laptop.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-hid.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-pmc-intel_pmc_core_pltdrv.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_mbox.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_rfim.o
clang_recent_errors
|-- i386-buildonly-randconfig-003-20231219
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-amilo-rfkill.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-classmate-laptop.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-vbtn.o
|-- i386-buildonly-randconfig-004-20231219
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-rst.o
|-- x86_64-randconfig-002-20231220
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-kernel-cpu-mce-mce-inject.o
|-- x86_64-randconfig-003-20231220
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-nvdimm-nd_e820.o
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

elapsed time: 1487m

configs tested: 124
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231220   gcc  
arc                   randconfig-002-20231220   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v5_defconfig   clang
arm                   randconfig-001-20231220   gcc  
arm                   randconfig-002-20231220   gcc  
arm                         s3c6400_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231219   clang
i386         buildonly-randconfig-002-20231219   clang
i386         buildonly-randconfig-003-20231219   clang
i386         buildonly-randconfig-004-20231219   clang
i386         buildonly-randconfig-005-20231219   clang
i386         buildonly-randconfig-006-20231219   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231219   clang
i386                  randconfig-002-20231219   clang
i386                  randconfig-003-20231219   clang
i386                  randconfig-004-20231219   clang
i386                  randconfig-005-20231219   clang
i386                  randconfig-006-20231219   clang
i386                  randconfig-011-20231219   gcc  
i386                  randconfig-012-20231219   gcc  
i386                  randconfig-013-20231219   gcc  
i386                  randconfig-014-20231219   gcc  
i386                  randconfig-015-20231219   gcc  
i386                  randconfig-016-20231219   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc                     redwood_defconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231220   gcc  
x86_64       buildonly-randconfig-002-20231220   gcc  
x86_64       buildonly-randconfig-003-20231220   gcc  
x86_64       buildonly-randconfig-004-20231220   gcc  
x86_64       buildonly-randconfig-005-20231220   gcc  
x86_64       buildonly-randconfig-006-20231220   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231220   clang
x86_64                randconfig-002-20231220   clang
x86_64                randconfig-003-20231220   clang
x86_64                randconfig-004-20231220   clang
x86_64                randconfig-005-20231220   clang
x86_64                randconfig-006-20231220   clang
x86_64                randconfig-011-20231220   gcc  
x86_64                randconfig-012-20231220   gcc  
x86_64                randconfig-013-20231220   gcc  
x86_64                randconfig-014-20231220   gcc  
x86_64                randconfig-015-20231220   gcc  
x86_64                randconfig-016-20231220   gcc  
x86_64                randconfig-071-20231220   gcc  
x86_64                randconfig-072-20231220   gcc  
x86_64                randconfig-073-20231220   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

