Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D99C25B77
	for <ath10k@archiver.kernel.org>; Tue, 21 May 2024 00:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jnSKUELo/6idW3cjDIry/lbq5oB0wFb3ypKa3ZzZRlI=; b=Rf+TorNWKdBAOoZNKTtkUjw+Hp
	MtqxZJUx0QF2WPK37l7tLaEo0zsYirY71drTINuVlSv/jJdYjbwdeGUmWbKq+t6i8lXAePO3j2ddJ
	0tYHiRDff9dE04L4Iq/7pCnhKH2Yzv0zdC3y7q5oIbm3UDsOeMvmSZ1VjIp25cXmd7t+sd08eoEMA
	7ETku/BrvlqLLxVDrfxmLFviRd9qGSemoq6+5H0JsuLWVR7Kv5Py3eDAZGR1EpzbupRWIpW2sEcxa
	hIATsX1bvx5SvQ4mAqSx+Ocis1zuyWinKvJN5X/ppd8l502JnoPI1PMKk5kk7cbL/c3V++2eAVDDr
	1Ks7rovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9DbS-0000000FvF7-0CRQ;
	Tue, 21 May 2024 00:43:42 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9DbP-0000000FvE1-0l1g
	for ath10k@lists.infradead.org;
	Tue, 21 May 2024 00:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716252219; x=1747788219;
  h=date:from:to:cc:subject:message-id;
  bh=ZmWmz0NKXrPlpsVlmDR2n9/SN3vlBg8Nr64Zma91eOM=;
  b=JtPhrDnlUuraWxS+s0SUTX4LLR50k6uT3g5DejHv0mpG9bI437KBD6hs
   vxNaSnSXJXiFtF2to0i8uA7eebUGtcTqcVC6jEyjiDS+E13Hx1yq0dMk/
   TN6Po7V3Wfnu8o9GnJE/h+5z/k3SkNurCH3jksosS/OS03ZxbwMDruPEl
   xCm+13OcWnbAAvQs6y5I8VoAMUhqzPCeX1aGzR+KIYspDDNXpuc0MHVAu
   wZFiFEOhvuBhEIR2yLVhJ28fw2es3ZVEcNCIzYaS0IdHWpgqPIYFn4KfU
   u+ZMkIUjGXLRj3B4b+OhoLMruRrD7EtqTwNKJpNtEp+YMA2C0/jQXD/r2
   g==;
X-CSE-ConnectionGUID: xjnKNkGVS5mBorJyRr4vRQ==
X-CSE-MsgGUID: ayAUqObeSLW9uKnzeZMKXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="22993327"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="22993327"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 17:43:36 -0700
X-CSE-ConnectionGUID: kq+VXa+sTuK03W4LP9pekA==
X-CSE-MsgGUID: raxvIEhzT/uDJqyNdIQF5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="32592678"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2024 17:43:36 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9DbJ-0005K4-0v;
	Tue, 21 May 2024 00:43:33 +0000
Date: Tue, 21 May 2024 08:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-current] BUILD SUCCESS
 21ae74e1bf18331ae5e279bd96304b3630828009
Message-ID: <202405210828.ma3J0g5r-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_174339_287514_3D71382D 
X-CRM114-Status: UNSURE (   3.90  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-current
branch HEAD: 21ae74e1bf18331ae5e279bd96304b3630828009  wifi: ath10k: fix QCOM_RPROC_COMMON dependency

elapsed time: 736m

configs tested: 163
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
arc                   randconfig-001-20240520   gcc  
arc                   randconfig-002-20240520   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240520   clang
arm                   randconfig-002-20240520   clang
arm                   randconfig-003-20240520   gcc  
arm                   randconfig-004-20240520   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240520   clang
arm64                 randconfig-002-20240520   clang
arm64                 randconfig-003-20240520   clang
arm64                 randconfig-004-20240520   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240520   gcc  
csky                  randconfig-002-20240520   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240520   clang
hexagon               randconfig-002-20240520   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240520   clang
i386         buildonly-randconfig-002-20240520   clang
i386         buildonly-randconfig-003-20240520   clang
i386         buildonly-randconfig-004-20240520   clang
i386         buildonly-randconfig-005-20240520   clang
i386         buildonly-randconfig-006-20240520   clang
i386                                defconfig   clang
i386                  randconfig-001-20240520   clang
i386                  randconfig-002-20240520   clang
i386                  randconfig-003-20240520   gcc  
i386                  randconfig-004-20240520   gcc  
i386                  randconfig-005-20240520   clang
i386                  randconfig-006-20240520   gcc  
i386                  randconfig-011-20240520   gcc  
i386                  randconfig-012-20240520   gcc  
i386                  randconfig-013-20240520   clang
i386                  randconfig-014-20240520   gcc  
i386                  randconfig-015-20240520   clang
i386                  randconfig-016-20240520   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240520   gcc  
loongarch             randconfig-002-20240520   gcc  
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
nios2                 randconfig-001-20240520   gcc  
nios2                 randconfig-002-20240520   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240520   gcc  
parisc                randconfig-002-20240520   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240520   gcc  
powerpc               randconfig-002-20240520   clang
powerpc               randconfig-003-20240520   clang
powerpc64             randconfig-001-20240520   clang
powerpc64             randconfig-002-20240520   gcc  
powerpc64             randconfig-003-20240520   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240520   gcc  
riscv                 randconfig-002-20240520   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240520   gcc  
s390                  randconfig-002-20240520   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240520   gcc  
sh                    randconfig-002-20240520   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240520   gcc  
sparc64               randconfig-002-20240520   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240520   clang
um                    randconfig-002-20240520   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240520   clang
x86_64       buildonly-randconfig-002-20240520   gcc  
x86_64       buildonly-randconfig-003-20240520   gcc  
x86_64       buildonly-randconfig-004-20240520   gcc  
x86_64       buildonly-randconfig-005-20240520   gcc  
x86_64       buildonly-randconfig-006-20240520   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240520   clang
x86_64                randconfig-002-20240520   gcc  
x86_64                randconfig-003-20240520   gcc  
x86_64                randconfig-004-20240520   gcc  
x86_64                randconfig-005-20240520   gcc  
x86_64                randconfig-006-20240520   clang
x86_64                randconfig-011-20240520   clang
x86_64                randconfig-012-20240520   gcc  
x86_64                randconfig-013-20240520   clang
x86_64                randconfig-014-20240520   clang
x86_64                randconfig-015-20240520   gcc  
x86_64                randconfig-016-20240520   gcc  
x86_64                randconfig-071-20240520   clang
x86_64                randconfig-072-20240520   gcc  
x86_64                randconfig-073-20240520   clang
x86_64                randconfig-074-20240520   gcc  
x86_64                randconfig-075-20240520   clang
x86_64                randconfig-076-20240520   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240520   gcc  
xtensa                randconfig-002-20240520   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

