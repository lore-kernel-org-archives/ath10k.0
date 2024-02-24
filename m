Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84C9C48BF6
	for <ath10k@archiver.kernel.org>; Sat, 24 Feb 2024 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1uRcMe69aFOVIM09C2H0qa3XGPPA671zRsqiHtWIes8=; b=JLmL/egQ2hvOxebHRCNV/K536a
	lZBa/NFKAhUfo8nfpfzn8W36COzt8jpCQoJMxQ/TI8yIYEMIrwYb42WYOOEnmNFLGs1Ejhyw7gbiT
	EQ7TVBKD+ivRNraqkviRsGZr3M5QV1Ej5GIMhr3wf9JzZCIuiHOorNxSrwh7uHfrLmHGEE2wHgRdj
	TRJNM8t7qi09qaZQed12PTcaXn2u3zcZIW44BlDvSTTfZpYHkNbNgIxPLu/qhyuka22As7PqFjZIY
	nBQFz9CMoBSB9iPuROWO+JDdZKk0cuweAbarM91nP7O3uE2GjW5szfB5WOC7OEy4/iglgaKMoRktB
	vEa8gpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdvVf-0000000DIW9-29ud;
	Sat, 24 Feb 2024 17:08:23 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdvVc-0000000DIVZ-14lb
	for ath10k@lists.infradead.org;
	Sat, 24 Feb 2024 17:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708794500; x=1740330500;
  h=date:from:to:cc:subject:message-id;
  bh=YPt6A3EqKJ5CajokpJ7NbvKA13JK2s89PCwQtdkwrGk=;
  b=Xbb9n8vvmxDUloZLhdI1ELVLaTqAfX7yLaS3LBcQogMIRhrh9b5Jcz4D
   8uqLsxaoX3nIu9bf8XskAUA8W3q4RO/xLawxdpI7lkFN6nXuQWG66NRC3
   LzFbaBpyYJrv58I5YQhMYoeP9/iPSA+KZ6z6LgVT/sa3EXv3ZITsdl2yI
   SSfiGqkxG6C8xRPJR5MOsrH/hkzOJQhpY7uDiLgGT+12xd5Mb6BLuhUP+
   DpOHB/KCCyWojSeh4Fv7tmk+I2ZVIHDmHB2IfV/qadwZMeS4teqXihgDU
   Vt7Ziqxc3Lwxpq0YsJqNmfxkdTJlHLm9Dr9Gsv0/wZJPDMVWMcXQxVb2l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3255603"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="3255603"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 09:08:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6230484"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Feb 2024 09:08:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdvVV-0008jM-1J;
	Sat, 24 Feb 2024 17:08:13 +0000
Date: Sun, 25 Feb 2024 00:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 115428b5052bd6e10b8420cca5ebc43a526ff6c6
Message-ID: <202402250019.64XjSSri-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_090820_405072_454CE4D1 
X-CRM114-Status: UNSURE (   4.00  )
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
branch HEAD: 115428b5052bd6e10b8420cca5ebc43a526ff6c6  Merge branch 'ath-next' into ath-qca

elapsed time: 1475m

configs tested: 162
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
arc                   randconfig-001-20240224   gcc  
arc                   randconfig-002-20240224   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240224   gcc  
arm                   randconfig-002-20240224   gcc  
arm                   randconfig-003-20240224   gcc  
arm                   randconfig-004-20240224   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240224   gcc  
arm64                 randconfig-002-20240224   gcc  
arm64                 randconfig-003-20240224   clang
arm64                 randconfig-004-20240224   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240224   gcc  
csky                  randconfig-002-20240224   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240224   clang
hexagon               randconfig-002-20240224   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240224   gcc  
i386         buildonly-randconfig-002-20240224   clang
i386         buildonly-randconfig-003-20240224   gcc  
i386         buildonly-randconfig-004-20240224   gcc  
i386         buildonly-randconfig-005-20240224   clang
i386         buildonly-randconfig-006-20240224   clang
i386                                defconfig   clang
i386                  randconfig-001-20240224   gcc  
i386                  randconfig-002-20240224   clang
i386                  randconfig-003-20240224   clang
i386                  randconfig-004-20240224   gcc  
i386                  randconfig-005-20240224   gcc  
i386                  randconfig-006-20240224   gcc  
i386                  randconfig-011-20240224   gcc  
i386                  randconfig-012-20240224   gcc  
i386                  randconfig-013-20240224   clang
i386                  randconfig-014-20240224   clang
i386                  randconfig-015-20240224   clang
i386                  randconfig-016-20240224   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240224   gcc  
loongarch             randconfig-002-20240224   gcc  
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
nios2                 randconfig-001-20240224   gcc  
nios2                 randconfig-002-20240224   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240224   gcc  
parisc                randconfig-002-20240224   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240224   clang
powerpc               randconfig-002-20240224   clang
powerpc               randconfig-003-20240224   clang
powerpc64             randconfig-001-20240224   gcc  
powerpc64             randconfig-002-20240224   clang
powerpc64             randconfig-003-20240224   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240224   gcc  
riscv                 randconfig-002-20240224   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240224   gcc  
s390                  randconfig-002-20240224   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240224   gcc  
sh                    randconfig-002-20240224   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240224   gcc  
sparc64               randconfig-002-20240224   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240224   gcc  
um                    randconfig-002-20240224   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240224   clang
x86_64       buildonly-randconfig-002-20240224   clang
x86_64       buildonly-randconfig-003-20240224   clang
x86_64       buildonly-randconfig-004-20240224   clang
x86_64       buildonly-randconfig-005-20240224   clang
x86_64       buildonly-randconfig-006-20240224   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240224   clang
x86_64                randconfig-002-20240224   gcc  
x86_64                randconfig-003-20240224   clang
x86_64                randconfig-004-20240224   gcc  
x86_64                randconfig-005-20240224   gcc  
x86_64                randconfig-006-20240224   clang
x86_64                randconfig-011-20240224   gcc  
x86_64                randconfig-012-20240224   gcc  
x86_64                randconfig-013-20240224   gcc  
x86_64                randconfig-014-20240224   clang
x86_64                randconfig-015-20240224   clang
x86_64                randconfig-016-20240224   clang
x86_64                randconfig-071-20240224   gcc  
x86_64                randconfig-072-20240224   clang
x86_64                randconfig-073-20240224   clang
x86_64                randconfig-074-20240224   gcc  
x86_64                randconfig-075-20240224   gcc  
x86_64                randconfig-076-20240224   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240224   gcc  
xtensa                randconfig-002-20240224   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

