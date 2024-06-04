Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6A5C27C50
	for <ath10k@archiver.kernel.org>; Tue,  4 Jun 2024 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=22xsTD6aVUwREMq1ElmNbudrPK+RLLQWkTHZHmrKWK0=; b=wNNhHJsW3U2/KeRmZmHi1oHcIO
	gd7xtSd5hz8jil6bQXe6SOH4fZr4i86XKsi9uplJcv3OJpq23x4bjoBQ/mVDJZRsB18PjbhqyQQio
	hRpCGawTc0OpDL7+tAy9wESns6xXOhq6CTFmQbwcQk+UhRtTFYXTaIBJr5kAkti9zbxkkpSUczEHc
	idtlKpc1u3YAx3CRV3WimetmJfGfIM7a+C6roolDcEX0jt4k/6QeJCy8xpJQGqcl2m8/fLlPvm4A2
	14Gpb9g29fvpwjOydx7+HAbghJdOj4KFOa+MaZtyaZgmDUy4G36O0qoUHfFzH3XuLyFE2izwyAuTJ
	eSIzGChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEUoU-00000002cwh-1Iti;
	Tue, 04 Jun 2024 14:06:58 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEUoR-00000002cu0-2OoT
	for ath10k@lists.infradead.org;
	Tue, 04 Jun 2024 14:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717510016; x=1749046016;
  h=date:from:to:cc:subject:message-id;
  bh=ddzfQEAFGDC1KPpJLHGesm/FK7kdp1XCJAt3fcpulIM=;
  b=BqgT8dJkM6tMB2KCcRWcdWlHGTKWESw7BUVAp18Q6ln2QOUj2ZqqVWXX
   wbMkaSH7nIwwQk91oiw9zyROVKeZO4LOk+oHqya30dvskV2Zq4ESZcQoY
   rTnO7tLejkAenWlCbWxXMhFSJ7/Sb0pg2DiWQJLAMhL6VBJFErGYM/zkl
   4dyUQlSAOPQWlsn3oA0zG89Qn3FVv/W1vkk7bE60bkPb9W649WBXGGltG
   5uArCz+K5ZuKLGUFHldNDWACiQaY8KkqVT7PwwQMTO5LKXNaUbQe2PCEj
   plDo2FAnSYavF/m5EVa2FTxNnt+tjikY5ei1+DFxWGX6nLiPiNBV8Hwcn
   A==;
X-CSE-ConnectionGUID: 5ViI+iYlQgyYEj8DU2dG5A==
X-CSE-MsgGUID: kSbqwvIITAipHTyB04Xxng==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14213116"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="14213116"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 07:06:48 -0700
X-CSE-ConnectionGUID: 8rdP3QCtQHmpUpVqpjQR3g==
X-CSE-MsgGUID: Oz9yoL9ASpu0Y2wbxKoHKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37258459"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jun 2024 07:06:46 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEUoG-000NJp-0L;
	Tue, 04 Jun 2024 14:06:44 +0000
Date: Tue, 04 Jun 2024 22:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 22767241e64427bbcffea2e2d51531ab467bc4ef
Message-ID: <202406042207.bA88R12L-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_070655_770474_9EF09D58 
X-CRM114-Status: UNSURE (   3.89  )
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
branch HEAD: 22767241e64427bbcffea2e2d51531ab467bc4ef  wifi: ath12k: add hw_link_id in ath12k_pdev

elapsed time: 1476m

configs tested: 143
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
arc                   randconfig-001-20240604   gcc  
arc                   randconfig-002-20240604   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-002-20240604   gcc  
arm                   randconfig-004-20240604   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240604   gcc  
arm64                 randconfig-003-20240604   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240604   gcc  
csky                  randconfig-002-20240604   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-002-20240604   clang
i386         buildonly-randconfig-003-20240604   clang
i386         buildonly-randconfig-005-20240604   clang
i386         buildonly-randconfig-006-20240604   clang
i386                                defconfig   clang
i386                  randconfig-001-20240604   clang
i386                  randconfig-002-20240604   clang
i386                  randconfig-003-20240604   clang
i386                  randconfig-004-20240604   clang
i386                  randconfig-011-20240604   clang
i386                  randconfig-014-20240604   clang
i386                  randconfig-015-20240604   clang
i386                  randconfig-016-20240604   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240604   gcc  
loongarch             randconfig-002-20240604   gcc  
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
nios2                 randconfig-001-20240604   gcc  
nios2                 randconfig-002-20240604   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240604   gcc  
parisc                randconfig-002-20240604   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240604   gcc  
powerpc               randconfig-002-20240604   gcc  
powerpc               randconfig-003-20240604   gcc  
powerpc64             randconfig-001-20240604   gcc  
powerpc64             randconfig-002-20240604   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240604   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240604   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240604   gcc  
sh                    randconfig-002-20240604   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240604   gcc  
sparc64               randconfig-002-20240604   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240604   clang
x86_64       buildonly-randconfig-002-20240604   clang
x86_64       buildonly-randconfig-003-20240604   gcc  
x86_64       buildonly-randconfig-004-20240604   clang
x86_64       buildonly-randconfig-005-20240604   gcc  
x86_64       buildonly-randconfig-006-20240604   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240604   clang
x86_64                randconfig-002-20240604   gcc  
x86_64                randconfig-003-20240604   gcc  
x86_64                randconfig-004-20240604   gcc  
x86_64                randconfig-005-20240604   gcc  
x86_64                randconfig-006-20240604   gcc  
x86_64                randconfig-011-20240604   clang
x86_64                randconfig-012-20240604   clang
x86_64                randconfig-013-20240604   clang
x86_64                randconfig-014-20240604   clang
x86_64                randconfig-015-20240604   clang
x86_64                randconfig-016-20240604   clang
x86_64                randconfig-071-20240604   clang
x86_64                randconfig-072-20240604   gcc  
x86_64                randconfig-073-20240604   gcc  
x86_64                randconfig-074-20240604   clang
x86_64                randconfig-075-20240604   clang
x86_64                randconfig-076-20240604   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240604   gcc  
xtensa                randconfig-002-20240604   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

