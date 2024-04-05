Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E95C67861
	for <ath10k@archiver.kernel.org>; Fri,  5 Apr 2024 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aIQIO9IAvnmIG2L2ZDeeSUwG7cmEgnZHyOyBPu6zBdM=; b=P1GLBvb1Hf1BGdkqD0l9EKuwvu
	C4k4uQ331KHpCp0fsyGTliQc4pgbD8EPmYby6Z7tUF4KPywHE35R8PVPvCUKpfXZfjQNA3UCu1se0
	g4ewfSPOeclBIabWpg35vo3/YNz3CBY6/vcEuoLTP2jhAG+a8gzhq/YRuOS8PVlrzGVHaW4ecgj2O
	gbshLxtXQylXvZ31ppbWc7cprdhS3tgaKhuILKGfBetXF96A7U903jYAybruFbr0MUU4Ew/vc6X8+
	+3cgvurMGiy8IYMMZjrteC7Wn8Ysu8vu+TjI2gc3zmf8GnIAPiq0gwH8mMPS+EcWdTCrkX/TcoqBh
	b0aRa+bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rshCs-00000006WlD-3gZr;
	Fri, 05 Apr 2024 10:54:02 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rshCp-00000006Wjs-1KkB
	for ath10k@lists.infradead.org;
	Fri, 05 Apr 2024 10:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712314440; x=1743850440;
  h=date:from:to:cc:subject:message-id;
  bh=2Fa/S2qEe07q0AfubWpV1SsWBtgVseyHIZUn40KDJFA=;
  b=FX4Mv81n1YzPZIsv2sOzyruwknHUEP63vLYB4yBlklH1MCkQbOUiE3UL
   wLwWu6KMoJd3AZSE0GUb6czK0Vbe3EEYur0/TPdmqZDdZQxVwDKnlgcMo
   fNkcKy96kH78q0+VmEA8buAMjTQnDGNzVgJGeuci2JVGi0hxBBIl9ak4c
   /EIvO738iMynbacy09kw5FD8cvYXT52ULIIY+j+paqOhOwg5pOkEFV04W
   zXd+u99YmObzZJCUlC7w/qr4Ob21ylucWNWAVdO3IcgG9agwiV4bg7sJ+
   zmFsLSj2XXL6pDkfhYnOS53riO+OHtaacU4kaWTzh9Ua0uEmOgU4oWL0e
   g==;
X-CSE-ConnectionGUID: i2Fwat5FSlOZRpveGlTW0g==
X-CSE-MsgGUID: L0AN0QkrQhahJMSY4/uMQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18778578"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="18778578"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 03:53:43 -0700
X-CSE-ConnectionGUID: Q36dbyb6S6mm4YZkKvwPYA==
X-CSE-MsgGUID: 6Su00SlbRy2epB/ToHhGqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="23805616"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Apr 2024 03:53:41 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rshCV-0002A2-0L;
	Fri, 05 Apr 2024 10:53:39 +0000
Date: Fri, 05 Apr 2024 18:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 565759ce814ab91ea3e32403aa05bd67d061856e
Message-ID: <202404051800.ytbzKcLe-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_035359_501940_AF2C50C1 
X-CRM114-Status: UNSURE (   3.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 565759ce814ab91ea3e32403aa05bd67d061856e  wifi: ath6kl: sdio: simplify module initialization

elapsed time: 1467m

configs tested: 217
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240404   gcc  
arc                   randconfig-001-20240405   gcc  
arc                   randconfig-002-20240404   gcc  
arc                   randconfig-002-20240405   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        neponset_defconfig   gcc  
arm                   randconfig-001-20240404   gcc  
arm                   randconfig-001-20240405   gcc  
arm                   randconfig-002-20240404   gcc  
arm                   randconfig-003-20240404   clang
arm                   randconfig-003-20240405   gcc  
arm                   randconfig-004-20240404   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240404   gcc  
arm64                 randconfig-001-20240405   gcc  
arm64                 randconfig-002-20240404   gcc  
arm64                 randconfig-002-20240405   gcc  
arm64                 randconfig-003-20240404   clang
arm64                 randconfig-003-20240405   gcc  
arm64                 randconfig-004-20240404   gcc  
arm64                 randconfig-004-20240405   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240404   gcc  
csky                  randconfig-001-20240405   gcc  
csky                  randconfig-002-20240404   gcc  
csky                  randconfig-002-20240405   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240404   clang
hexagon               randconfig-002-20240404   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240404   gcc  
i386         buildonly-randconfig-002-20240404   clang
i386         buildonly-randconfig-003-20240404   clang
i386         buildonly-randconfig-003-20240405   clang
i386         buildonly-randconfig-004-20240404   gcc  
i386         buildonly-randconfig-005-20240404   clang
i386         buildonly-randconfig-005-20240405   clang
i386         buildonly-randconfig-006-20240404   gcc  
i386         buildonly-randconfig-006-20240405   clang
i386                                defconfig   clang
i386                  randconfig-001-20240404   gcc  
i386                  randconfig-001-20240405   clang
i386                  randconfig-002-20240404   clang
i386                  randconfig-003-20240404   clang
i386                  randconfig-003-20240405   clang
i386                  randconfig-004-20240404   gcc  
i386                  randconfig-004-20240405   clang
i386                  randconfig-005-20240404   clang
i386                  randconfig-005-20240405   clang
i386                  randconfig-006-20240404   clang
i386                  randconfig-011-20240404   gcc  
i386                  randconfig-011-20240405   clang
i386                  randconfig-012-20240404   clang
i386                  randconfig-013-20240404   gcc  
i386                  randconfig-014-20240404   clang
i386                  randconfig-015-20240404   gcc  
i386                  randconfig-016-20240404   gcc  
i386                  randconfig-016-20240405   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240404   gcc  
loongarch             randconfig-001-20240405   gcc  
loongarch             randconfig-002-20240404   gcc  
loongarch             randconfig-002-20240405   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240404   gcc  
nios2                 randconfig-001-20240405   gcc  
nios2                 randconfig-002-20240404   gcc  
nios2                 randconfig-002-20240405   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240404   gcc  
parisc                randconfig-001-20240405   gcc  
parisc                randconfig-002-20240404   gcc  
parisc                randconfig-002-20240405   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc               randconfig-001-20240404   gcc  
powerpc               randconfig-002-20240404   gcc  
powerpc               randconfig-003-20240404   clang
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240404   gcc  
powerpc64             randconfig-001-20240405   gcc  
powerpc64             randconfig-002-20240404   clang
powerpc64             randconfig-002-20240405   gcc  
powerpc64             randconfig-003-20240404   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240404   clang
riscv                 randconfig-002-20240404   clang
riscv                 randconfig-002-20240405   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240404   gcc  
s390                  randconfig-002-20240404   gcc  
s390                  randconfig-002-20240405   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240404   gcc  
sh                    randconfig-001-20240405   gcc  
sh                    randconfig-002-20240404   gcc  
sh                    randconfig-002-20240405   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240404   gcc  
sparc64               randconfig-001-20240405   gcc  
sparc64               randconfig-002-20240404   gcc  
sparc64               randconfig-002-20240405   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240404   clang
um                    randconfig-001-20240405   gcc  
um                    randconfig-002-20240404   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240405   clang
x86_64       buildonly-randconfig-002-20240405   clang
x86_64       buildonly-randconfig-003-20240405   gcc  
x86_64       buildonly-randconfig-004-20240405   gcc  
x86_64       buildonly-randconfig-005-20240405   clang
x86_64       buildonly-randconfig-006-20240405   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240405   clang
x86_64                randconfig-002-20240405   clang
x86_64                randconfig-003-20240405   clang
x86_64                randconfig-004-20240405   gcc  
x86_64                randconfig-005-20240405   clang
x86_64                randconfig-006-20240405   gcc  
x86_64                randconfig-011-20240405   clang
x86_64                randconfig-012-20240405   gcc  
x86_64                randconfig-013-20240405   gcc  
x86_64                randconfig-014-20240405   clang
x86_64                randconfig-015-20240405   gcc  
x86_64                randconfig-016-20240405   gcc  
x86_64                randconfig-071-20240405   gcc  
x86_64                randconfig-072-20240405   gcc  
x86_64                randconfig-073-20240405   gcc  
x86_64                randconfig-074-20240405   gcc  
x86_64                randconfig-075-20240405   gcc  
x86_64                randconfig-076-20240405   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240404   gcc  
xtensa                randconfig-001-20240405   gcc  
xtensa                randconfig-002-20240404   gcc  
xtensa                randconfig-002-20240405   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

