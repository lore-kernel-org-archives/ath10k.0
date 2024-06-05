Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40133C25B76
	for <ath10k@archiver.kernel.org>; Wed,  5 Jun 2024 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OGuYPnEbWWPTXFnT9HJKaXhE/3KIv5OJeAROT/Y69VQ=; b=sOSMAX9iVeWo3NPqLO96i9W4EB
	Pmq7zoHq35WXKbXyeniaEV7WC90pgqH4+drUm/t2QVG6gbUB6kXVyyDLgB1EG1moBKv+p317TPSKX
	tSr0O0b2OwdG/WpAn84x3VxJ0zPEtmpuIqs1nWgfLg76iZAwPleIshq3W7ms0vt2sFEpzCp56zb45
	2eEbbjNwutR3IVCmSCv556uqGVexGIRR3ve/wV4u//gZ2JYOxvzxRKu0/YGOG/RtNW+5ud91pMIxI
	cjHuVwGhCjIy9cKMhKektBerhjbJq/JBNlTs0vNUcr3H1LE61d8+O39hdo2w6mirx0tTzjRWUlR1K
	JIQRT1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEucu-000000070NL-1mOp;
	Wed, 05 Jun 2024 17:40:44 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEucr-000000070MB-0jfc
	for ath10k@lists.infradead.org;
	Wed, 05 Jun 2024 17:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717609241; x=1749145241;
  h=date:from:to:cc:subject:message-id;
  bh=YG4EJGbktIQbYLK6RHnHrKY5uZ+Zd4ar+esJsA05Bjo=;
  b=h8IbsUH9vdNhd+7S0G7XZ5T35w9xZNEZu5uS34aQoXZtp4oan0VoewMI
   qLN8K9LxY+DIjh23ItYU1L4eDAG07Y/+4K5BNt/If8GgZc/u1Esmt2Dkc
   hTFAqJhYSXKqnzfPM2t62LdWBxUyWAWyShAvswq19I/hXilATvFG3UKCV
   nEdSXrPNaV6fBPK4z+paBYZ67NDqapHfbomysvDCnlzqSRO1xAg0tnD/0
   1udM4XIAVIdQ8rMpW6huo3BwY5ay3IdIXL5iot9YNXIiKwEvoZe6HmNJc
   PivSEZAqHMW1fLFhv6ql2MfsguAEqTp4paQSsT43Ayfzi2GywIjhbaAqG
   Q==;
X-CSE-ConnectionGUID: csjjEyJGT/mzoJMlQ98gAw==
X-CSE-MsgGUID: 10rlJaTcQF+RZEsLWUM/jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25642792"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="25642792"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 10:40:25 -0700
X-CSE-ConnectionGUID: 2/QrdamdTeaFB/Nb1RArlQ==
X-CSE-MsgGUID: pnm5FY+JThq1HmD2jIlqaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="37736748"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Jun 2024 10:40:24 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEucY-00020R-20;
	Wed, 05 Jun 2024 17:40:22 +0000
Date: Thu, 06 Jun 2024 01:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD REGRESSION
 6f446d0a1af020dd164a006adc327f4fd3d5dacd
Message-ID: <202406060103.NM9Paunt-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_104041_335973_E505B7DF 
X-CRM114-Status: UNSURE (   3.38  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 6f446d0a1af020dd164a006adc327f4fd3d5dacd  Merge branch 'pending' into master-pending

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202406050650.VgDMtMhL-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath11k/pci.c:708:13: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/net/wireless/ath/ath11k/pci.c:708:15: error: implicit declaration of function 'vzalloc'; did you mean 'kzalloc'? [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath11k/pci.c:708:6: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
drivers/net/wireless/ath/ath11k/pci.c:708:8: error: call to undeclared function 'vzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- alpha-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- i386-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- i386-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- loongarch-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- loongarch-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- microblaze-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- microblaze-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- mips-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- mips-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- openrisc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- parisc-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- parisc-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- sparc-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- sparc64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|-- sparc64-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
|   `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
`-- um-allyesconfig
    |-- drivers-net-wireless-ath-ath11k-pci.c:error:implicit-declaration-of-function-vzalloc
    `-- drivers-net-wireless-ath-ath11k-pci.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
clang_recent_errors
|-- x86_64-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-pci.c:error:call-to-undeclared-function-vzalloc-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   `-- drivers-net-wireless-ath-ath11k-pci.c:error:incompatible-integer-to-pointer-conversion-assigning-to-void-from-int
`-- x86_64-allyesconfig
    |-- drivers-net-wireless-ath-ath11k-pci.c:error:call-to-undeclared-function-vzalloc-ISO-C99-and-later-do-not-support-implicit-function-declarations
    `-- drivers-net-wireless-ath-ath11k-pci.c:error:incompatible-integer-to-pointer-conversion-assigning-to-void-from-int

elapsed time: 1448m

configs tested: 148
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240605   gcc  
arc                   randconfig-002-20240605   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240605   clang
arm                   randconfig-002-20240605   clang
arm                   randconfig-003-20240605   clang
arm                   randconfig-004-20240605   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240605   gcc  
arm64                 randconfig-002-20240605   clang
arm64                 randconfig-003-20240605   clang
arm64                 randconfig-004-20240605   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240605   gcc  
csky                  randconfig-002-20240605   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240605   clang
hexagon               randconfig-002-20240605   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240605   gcc  
i386         buildonly-randconfig-002-20240605   gcc  
i386         buildonly-randconfig-003-20240605   gcc  
i386         buildonly-randconfig-004-20240605   gcc  
i386         buildonly-randconfig-005-20240605   gcc  
i386         buildonly-randconfig-006-20240605   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240605   gcc  
i386                  randconfig-002-20240605   clang
i386                  randconfig-003-20240605   gcc  
i386                  randconfig-004-20240605   gcc  
i386                  randconfig-005-20240605   gcc  
i386                  randconfig-006-20240605   gcc  
i386                  randconfig-011-20240605   gcc  
i386                  randconfig-012-20240605   gcc  
i386                  randconfig-013-20240605   clang
i386                  randconfig-014-20240605   clang
i386                  randconfig-015-20240605   gcc  
i386                  randconfig-016-20240605   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240605   gcc  
loongarch             randconfig-002-20240605   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240605   gcc  
nios2                 randconfig-002-20240605   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240605   gcc  
parisc                randconfig-002-20240605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240605   gcc  
powerpc               randconfig-002-20240605   gcc  
powerpc               randconfig-003-20240605   gcc  
powerpc64             randconfig-001-20240605   gcc  
powerpc64             randconfig-002-20240605   clang
powerpc64             randconfig-003-20240605   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240605   gcc  
riscv                 randconfig-002-20240605   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240605   gcc  
s390                  randconfig-002-20240605   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240605   gcc  
sh                    randconfig-002-20240605   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240605   gcc  
sparc64               randconfig-002-20240605   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240605   gcc  
um                    randconfig-002-20240605   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240605   gcc  
x86_64       buildonly-randconfig-002-20240605   gcc  
x86_64       buildonly-randconfig-003-20240605   gcc  
x86_64       buildonly-randconfig-004-20240605   clang
x86_64       buildonly-randconfig-005-20240605   clang
x86_64       buildonly-randconfig-006-20240605   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240605   clang
x86_64                randconfig-002-20240605   clang
x86_64                randconfig-003-20240605   gcc  
x86_64                randconfig-004-20240605   clang
x86_64                randconfig-005-20240605   clang
x86_64                randconfig-006-20240605   gcc  
x86_64                randconfig-011-20240605   clang
x86_64                randconfig-012-20240605   gcc  
x86_64                randconfig-013-20240605   clang
x86_64                randconfig-014-20240605   gcc  
x86_64                randconfig-015-20240605   clang
x86_64                randconfig-016-20240605   gcc  
x86_64                randconfig-071-20240605   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240605   gcc  
xtensa                randconfig-002-20240605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

