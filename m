Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01416C41535
	for <ath10k@archiver.kernel.org>; Sat, 16 Dec 2023 17:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0JQ/5YCT0XWfaBmGGYcgHymDR7OxfM/LeUtd/JQfvmg=; b=E6/nRr7JI1nr6fIH1wH9JFtlEu
	ldgOaIc+AwKtdu4Y7TUFbxVArGna3ZwHZUzyFh5o3dsED51n3vFqY9RsG+wNS6IuRRcOPulC1v7uu
	X99IjR5Rpl+E4uRlItQRlQG2Q71qvJLpEWjLnBAMouXsue+MamIPUqk+pDpyzRSIZGgQJZZGaL4AU
	nXvwpR6ErXJIwzOvRWxp9rky0tUpdqAbNCEOu03Bx5FlvOYWEs1NDb5A+tlLROghzO1kIJblPhrNk
	QoIeEtIbQG2dIhG4M4SwYo6yU9s0q+bMow4gr5cWgPcdczUIjWW/WU4iwFcacL1YPjy+MBBIuEIFd
	fiqj17HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEY7b-006Qgc-17;
	Sat, 16 Dec 2023 17:06:39 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEY7Y-006QgC-0V
	for ath10k@lists.infradead.org;
	Sat, 16 Dec 2023 17:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702746396; x=1734282396;
  h=date:from:to:cc:subject:message-id;
  bh=y4c69qQDesN9F3YKKzX3gLayWQse2rximVWDzDn2NhU=;
  b=RvKSLoHXMMsguZJ6YCyM5Fmx2vSZxxxceP8/mV7ACAXK1Pf6yiKjx3+a
   tMCaunbYdFMaVSApGemwrw6/zHKvjzOOAZITEJFzVrsr88co0erLVa3eb
   VmEZSgWqiHOfolNnrTqPYJoNNQoR9gKg247ew1y3hjbVWGkdIy4bsBszf
   v5xMvsvrgyfbvvlbEvCJLsNxiVK/OQCLdgLoD1Q1NBfFZIaWZU2yCXhui
   s1yC3SmZoR+0Wq7TEUS7BqWZR0z9f2r9pPzWTeueMLhvzu4h3hHC3RIsR
   Vtx4zULXrLagMHWr4DIWLzcbCojGfy85hkXYuigLplWrlmK6+FTm3n7T8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="385801928"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="385801928"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 09:06:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="865736664"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="865736664"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2023 09:06:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEY7T-0001va-2M;
	Sat, 16 Dec 2023 17:06:31 +0000
Date: Sun, 17 Dec 2023 01:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 75d04d8a7a2a652528e94ddc821fcf4afb095ace
Message-ID: <202312170118.0ZowYOuE-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_090636_240377_66F19998 
X-CRM114-Status: UNSURE (   5.06  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 75d04d8a7a2a652528e94ddc821fcf4afb095ace  Add localversion-wireless-testing-ath

Warning ids grouped by kconfigs:

clang_recent_errors
`-- x86_64-rhel-8.3-rust
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_power_floor.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_wt_hint.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_wt_req.o

elapsed time: 1477m

configs tested: 121
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231216   gcc  
arc                   randconfig-002-20231216   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231216   gcc  
arm                   randconfig-002-20231216   gcc  
arm                   randconfig-003-20231216   gcc  
arm                   randconfig-004-20231216   gcc  
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
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
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
powerpc               randconfig-001-20231216   gcc  
powerpc               randconfig-002-20231216   gcc  
powerpc               randconfig-003-20231216   gcc  
powerpc64             randconfig-001-20231216   gcc  
powerpc64             randconfig-002-20231216   gcc  
powerpc64             randconfig-003-20231216   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231216   gcc  
riscv                 randconfig-002-20231216   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
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
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

