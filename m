Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD9EC4345F
	for <ath10k@archiver.kernel.org>; Fri, 12 Apr 2024 01:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XpLGtiQTAyOAiwawiw+DmFDkt+oTDy65qO6YNly9Xeo=; b=cQ/3CrBYxV6HR/6MHmPn0ojR2j
	90GPXGJQmXZQ9u0THZEOVV11HNkFitkAb5C622fUjR4kSN7qiqRkGnOe+hazWmHISk4aZ3IkN0db0
	MnFYMU9FCUripnoMVAedmQU44IBBcqTpZTJ85AtNF/p/7oKFebZWaJu7m2HdpA70Lcnhb8MfWdoRF
	I5f/72gacLDqznAazNy5tMnRK6HW3sOcNI0DlYSEoJibwwKEMARES+N883KYRW+Q2c3b50ounroSH
	GvtZEptpwp6lbWxvOmzioxkrxsOVmj/r3GmVWhkkDBN9aMLfFMKFd/Ghy1i2oJ5jQvice0yIjjCEp
	Q58bS3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv64V-0000000EoKP-2Isa;
	Fri, 12 Apr 2024 01:51:19 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv64R-0000000EoHk-3TJi
	for ath10k@lists.infradead.org;
	Fri, 12 Apr 2024 01:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712886676; x=1744422676;
  h=date:from:to:cc:subject:message-id;
  bh=gU0BXkuFNzMkJ3EbHC361pNHNpdI2BCyZJ8qRXF08HM=;
  b=VOxd3XvO6i6B8Hy0ZLBQcmsCVZ70rAiRwBFOrOA/uVtg/+hb2urzL7Kd
   0k8eBunUoGw5SBdO6r2Wch57mGQTlH2uBDBu750TgeiIDi4ZoaxD0HTFJ
   i8yNfWHu1PpVN6R0Pxu8zYzMDYYuFv5aS8BcAizuvCzhhCbbAaLrVz8EG
   Fc0DALFkH8rF9B2b9fzVWEh6hD5mNU3OCti93n0t7SgUpfIiqntXbwqII
   qa1eNNo27lXyBZyxvnlQNLu9zqaAPr4dq9VjVk2ukoTd7jTGDvco8GNpH
   uxs8zGdhM0aK2s8Mu4jP/a0f1b3gNmqt4sCLo31tHukBI2zn4rsdu1bqd
   A==;
X-CSE-ConnectionGUID: V4uGRpytRSqO9mRh6B1now==
X-CSE-MsgGUID: 1ulJtwC6Qyqml2sp4e+0gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12122805"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="12122805"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 18:51:14 -0700
X-CSE-ConnectionGUID: IZGjFHV6R5ew4EJs19uLow==
X-CSE-MsgGUID: x6JyQ9FwRquDDdgxhZJgrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="58511450"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2024 18:51:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv64M-0009En-1F;
	Fri, 12 Apr 2024 01:51:10 +0000
Date: Fri, 12 Apr 2024 09:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 ebbdaef16a808f08f6e16acb2d0ed988bb0edf42
Message-ID: <202404120900.SzUOFp0t-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_185115_938603_8FC2E7F0 
X-CRM114-Status: UNSURE (   3.77  )
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
branch HEAD: ebbdaef16a808f08f6e16acb2d0ed988bb0edf42  Merge branch 'pending' into master-pending

elapsed time: 928m

configs tested: 179
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
arc                   randconfig-001-20240412   gcc  
arc                   randconfig-002-20240412   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20240412   gcc  
arm                   randconfig-002-20240412   clang
arm                   randconfig-003-20240412   clang
arm                   randconfig-004-20240412   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240412   gcc  
arm64                 randconfig-002-20240412   gcc  
arm64                 randconfig-003-20240412   clang
arm64                 randconfig-004-20240412   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240412   gcc  
csky                  randconfig-002-20240412   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240412   clang
hexagon               randconfig-002-20240412   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240411   clang
i386         buildonly-randconfig-002-20240411   clang
i386         buildonly-randconfig-003-20240411   clang
i386         buildonly-randconfig-004-20240411   clang
i386         buildonly-randconfig-005-20240411   clang
i386         buildonly-randconfig-006-20240411   clang
i386                                defconfig   clang
i386                  randconfig-001-20240411   gcc  
i386                  randconfig-002-20240411   gcc  
i386                  randconfig-003-20240411   clang
i386                  randconfig-004-20240411   clang
i386                  randconfig-005-20240411   gcc  
i386                  randconfig-006-20240411   clang
i386                  randconfig-011-20240411   clang
i386                  randconfig-012-20240411   gcc  
i386                  randconfig-013-20240411   gcc  
i386                  randconfig-014-20240411   gcc  
i386                  randconfig-015-20240411   clang
i386                  randconfig-016-20240411   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240412   gcc  
loongarch             randconfig-002-20240412   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240412   gcc  
nios2                 randconfig-002-20240412   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240412   gcc  
parisc                randconfig-002-20240412   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   motionpro_defconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc                      ppc40x_defconfig   clang
powerpc               randconfig-001-20240412   clang
powerpc               randconfig-002-20240412   clang
powerpc               randconfig-003-20240412   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc64             randconfig-001-20240412   gcc  
powerpc64             randconfig-002-20240412   gcc  
powerpc64             randconfig-003-20240412   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240412   clang
riscv                 randconfig-002-20240412   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240412   gcc  
s390                  randconfig-002-20240412   gcc  
s390                       zfcpdump_defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240412   gcc  
sh                    randconfig-002-20240412   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240412   gcc  
sparc64               randconfig-002-20240412   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240412   clang
um                    randconfig-002-20240412   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240412   gcc  
x86_64       buildonly-randconfig-002-20240412   gcc  
x86_64       buildonly-randconfig-003-20240412   gcc  
x86_64       buildonly-randconfig-004-20240412   clang
x86_64       buildonly-randconfig-005-20240412   clang
x86_64       buildonly-randconfig-006-20240412   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240412   clang
x86_64                randconfig-002-20240412   gcc  
x86_64                randconfig-003-20240412   gcc  
x86_64                randconfig-004-20240412   clang
x86_64                randconfig-005-20240412   clang
x86_64                randconfig-006-20240412   clang
x86_64                randconfig-011-20240412   clang
x86_64                randconfig-012-20240412   gcc  
x86_64                randconfig-013-20240412   clang
x86_64                randconfig-014-20240412   clang
x86_64                randconfig-015-20240412   clang
x86_64                randconfig-016-20240412   gcc  
x86_64                randconfig-071-20240412   gcc  
x86_64                randconfig-072-20240412   clang
x86_64                randconfig-073-20240412   clang
x86_64                randconfig-074-20240412   gcc  
x86_64                randconfig-075-20240412   gcc  
x86_64                randconfig-076-20240412   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240412   gcc  
xtensa                randconfig-002-20240412   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

