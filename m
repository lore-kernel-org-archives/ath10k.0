Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09762C41535
	for <ath10k@archiver.kernel.org>; Sat, 16 Dec 2023 17:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EDPu3tgulLbs+9lSQ8fz7KLhFT6xOZci4M/7Z0njS3E=; b=HdzHJSjnPA0Dc2d8CR5gOZ0Nkl
	ES+AnuPUawz/dQhaRV+gOLTtjWUTNR9Cq9BpZpxlx82Hy7hc4i/gxhjxHNgc9SV6QYOCqobcmiSkP
	Jgq2XNCpkNVWt22Jt7NiNG+lvrVsmsCq3XPm7QWe5/JddfUDd2Dz9w5cPc5BwPgxO3zhAjYiWu2I7
	ewIfRVlsEpdual7PjonJUPeAY3lrXjyWDjPvpegylafcGBwgSTm4qaZ/LOJlP2QicsFLYBpr3xpA+
	h2kM5/GRSKSQCnhO4q+IbxfICQCyD8SeNvFnsRCVgf7czlwGT2aeSbjBe3QlrCD08jhHx8W1ryLGI
	mCftIdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEY5j-006QZA-27;
	Sat, 16 Dec 2023 17:04:43 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEY5g-006QYj-1z
	for ath10k@lists.infradead.org;
	Sat, 16 Dec 2023 17:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702746281; x=1734282281;
  h=date:from:to:cc:subject:message-id;
  bh=nWNHcm81jNycCzAN1pbtl/7F+GohVyqGbdeXEyYFFcA=;
  b=Z4PWT7ePeoxoN1gX4W5RCRW5YceHLv2Mb9CVYPVglYkTkENbHsmlVV4l
   NOytNyJVCm9n+yAF233dfKyfrr2qLuTo333295y63lDpTydNrqbm2abyP
   PqhhVHFlP0e7mjzrChX79A345TpcfK7FR2nmFUigj54Pr4/k2yZOTcg+T
   FQ4fnKXKwijE0CkPo+7j7vPhRDRKeU66midv3lkh7bFBbqux+ZK/YKxo5
   o/7odV/UzpXG1Iy2x+BFjRqTb+GvKj2uTfw/ICa8FoHMGszK9xvhutb2y
   11adgQcSMAe7EIEJrlJg+8qPPmwacUEaaV8tgaudBq1T9vXJbHS5+vEp7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="8739457"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="8739457"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 09:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="16657870"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Dec 2023 09:04:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEY5X-0001vG-1w;
	Sat, 16 Dec 2023 17:04:31 +0000
Date: Sun, 17 Dec 2023 01:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 fd6ed1772b2c639370b7b41602d4c925dbd003d4
Message-ID: <202312170142.VydvLp9c-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_090440_764215_BA7FDACD 
X-CRM114-Status: UNSURE (   3.58  )
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
branch HEAD: fd6ed1772b2c639370b7b41602d4c925dbd003d4  wifi: ath11k: workaround too long expansion sparse warnings

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm-randconfig-002-20231216
    `-- WARNING:modpost:drivers-rtc-rtc-imxdi:section-mismatch-in-reference:dryice_rtc_driver-(section:.data)-dryice_rtc_remove-(section:.exit.text)

elapsed time: 1475m

configs tested: 162
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231216   gcc  
arc                   randconfig-002-20231216   gcc  
arm                               allnoconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v5_defconfig   clang
arm                   randconfig-001-20231216   gcc  
arm                   randconfig-002-20231216   gcc  
arm                   randconfig-003-20231216   gcc  
arm                   randconfig-004-20231216   gcc  
arm                        vexpress_defconfig   clang
arm64                            alldefconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231216   gcc  
arm64                 randconfig-002-20231216   gcc  
arm64                 randconfig-003-20231216   gcc  
arm64                 randconfig-004-20231216   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231216   gcc  
csky                  randconfig-002-20231216   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231216   clang
hexagon               randconfig-002-20231216   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231216   gcc  
i386         buildonly-randconfig-002-20231216   gcc  
i386         buildonly-randconfig-003-20231216   gcc  
i386         buildonly-randconfig-004-20231216   gcc  
i386         buildonly-randconfig-005-20231216   gcc  
i386         buildonly-randconfig-006-20231216   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231216   gcc  
i386                  randconfig-002-20231216   gcc  
i386                  randconfig-003-20231216   gcc  
i386                  randconfig-004-20231216   gcc  
i386                  randconfig-005-20231216   gcc  
i386                  randconfig-006-20231216   gcc  
i386                  randconfig-011-20231216   clang
i386                  randconfig-012-20231216   clang
i386                  randconfig-013-20231216   clang
i386                  randconfig-014-20231216   clang
i386                  randconfig-015-20231216   clang
i386                  randconfig-016-20231216   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231216   gcc  
loongarch             randconfig-002-20231216   gcc  
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
mips                          ath25_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231216   gcc  
nios2                 randconfig-002-20231216   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231216   gcc  
parisc                randconfig-002-20231216   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       ebony_defconfig   clang
powerpc                      makalu_defconfig   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc               randconfig-001-20231216   gcc  
powerpc               randconfig-002-20231216   gcc  
powerpc               randconfig-003-20231216   gcc  
powerpc64             randconfig-001-20231216   gcc  
powerpc64             randconfig-002-20231216   gcc  
powerpc64             randconfig-003-20231216   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231216   gcc  
riscv                 randconfig-002-20231216   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231216   clang
s390                  randconfig-002-20231216   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231216   gcc  
sh                    randconfig-002-20231216   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
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
x86_64       buildonly-randconfig-001-20231216   gcc  
x86_64       buildonly-randconfig-002-20231216   gcc  
x86_64       buildonly-randconfig-003-20231216   gcc  
x86_64       buildonly-randconfig-004-20231216   gcc  
x86_64       buildonly-randconfig-005-20231216   gcc  
x86_64       buildonly-randconfig-006-20231216   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231216   clang
x86_64                randconfig-002-20231216   clang
x86_64                randconfig-003-20231216   clang
x86_64                randconfig-004-20231216   clang
x86_64                randconfig-005-20231216   clang
x86_64                randconfig-006-20231216   clang
x86_64                randconfig-011-20231216   gcc  
x86_64                randconfig-012-20231216   gcc  
x86_64                randconfig-013-20231216   gcc  
x86_64                randconfig-014-20231216   gcc  
x86_64                randconfig-015-20231216   gcc  
x86_64                randconfig-016-20231216   gcc  
x86_64                randconfig-071-20231216   gcc  
x86_64                randconfig-072-20231216   gcc  
x86_64                randconfig-073-20231216   gcc  
x86_64                randconfig-074-20231216   gcc  
x86_64                randconfig-075-20231216   gcc  
x86_64                randconfig-076-20231216   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

