Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2112DCD1284
	for <ath10k@archiver.kernel.org>; Thu, 11 Apr 2024 12:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8UZ2D3noSTG6VvYR/Au8ba8Tn/xzaGJC36fqRXbBO1k=; b=2+9r2TQ2ScSwj8WyufFi6wxE1a
	IsNVWLNMYlPyXcsQjD71pyeecTjFgEChGVKlPBTv9zuUgFTpfs7IiGW+O33N33V/4BBZTkZjT/NGk
	fk00W8mzkudU5Z4V4NvrEYAXomwROcGRVbNBalZ6DUz9YrgHSEXs7c+wFGhCTIn0Is1G2+TEN91PU
	Z7/+ETo4eAq+Rv1XGiiwi6AdmVNxBGQ38GBojLelj+6h04iDbEfTGrhUZMf8uXrl+yvOt7hrnCVAX
	kojWPRD0PXlJ2FKNcySIMEvZcsjyCU2cdSooGD1m3lOHz5F/lv0VssGD5DP1ubK9rQZCWOsqVLTWb
	gZvRZrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruu0w-0000000C32g-01XY;
	Thu, 11 Apr 2024 12:58:50 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruu0j-0000000C2uW-0ruu
	for ath10k@lists.infradead.org;
	Thu, 11 Apr 2024 12:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712840317; x=1744376317;
  h=date:from:to:cc:subject:message-id;
  bh=7mhNbviPeYYisaH/PxD1klytci/CqB80ZI2JlZiBT3w=;
  b=ArJR1ySvucHN/rrsTO/4cqSmC3Zx7rvmF1e1Ei1AVJ310a7eDaJ56ijW
   L/M+GrDomkaj4ShLoiSCODD8cbFjXiF69H3U9FmD4WVq/Uwg3O47BAr3b
   imVxnNIF1v6LwrLTp7oJO/Uv6nBeY52kMtTATZAKknzf2zcSP3mW85aCk
   0CAcJrU5eV/hucUYEbA1pt2g4KcCA0RfHfLOK1x+6gpI4Eje1FP57zURP
   FoKwIiK0r9UKSgv31g0BW7cgSYfTsSPRnAIr4mLS/JQwVYU3Q82njwB9Z
   WRR/40WGzzlXtGv9XTlLSp41HiK9LPzqFkEDTsXi87DnJa8dD1Zp7nMUs
   w==;
X-CSE-ConnectionGUID: L4i+hsc1QWmYKWKeQYq7Vg==
X-CSE-MsgGUID: M3nBO7P3TI6bSNKk4Twq0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19638388"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="19638388"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 05:58:32 -0700
X-CSE-ConnectionGUID: MRFqqKUmSXCvzDX4Om1ITQ==
X-CSE-MsgGUID: LQ5dM+coQIm+n163A0FDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21392798"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2024 05:58:31 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruu0a-0008cz-24;
	Thu, 11 Apr 2024 12:58:28 +0000
Date: Thu, 11 Apr 2024 20:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 363e7193eaf258fe7f04e8db560bd8a282a12cd9
Message-ID: <202404112035.Mzddo4qy-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_055837_864746_0569D43D 
X-CRM114-Status: UNSURE (   3.59  )
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
branch HEAD: 363e7193eaf258fe7f04e8db560bd8a282a12cd9  Add localversion-wireless-testing-ath

elapsed time: 1359m

configs tested: 175
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
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20240411   gcc  
arc                   randconfig-002-20240411   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240411   gcc  
arm                   randconfig-002-20240411   gcc  
arm                   randconfig-003-20240411   clang
arm                   randconfig-004-20240411   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240411   clang
arm64                 randconfig-002-20240411   gcc  
arm64                 randconfig-003-20240411   gcc  
arm64                 randconfig-004-20240411   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240411   gcc  
csky                  randconfig-002-20240411   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240411   clang
hexagon               randconfig-002-20240411   clang
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
loongarch             randconfig-001-20240411   gcc  
loongarch             randconfig-002-20240411   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240411   gcc  
nios2                 randconfig-002-20240411   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240411   gcc  
parisc                randconfig-002-20240411   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240411   gcc  
powerpc               randconfig-002-20240411   clang
powerpc               randconfig-003-20240411   gcc  
powerpc64             randconfig-001-20240411   clang
powerpc64             randconfig-002-20240411   gcc  
powerpc64             randconfig-003-20240411   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240411   clang
riscv                 randconfig-002-20240411   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240411   clang
s390                  randconfig-002-20240411   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                    randconfig-001-20240411   gcc  
sh                    randconfig-002-20240411   gcc  
sh                           se7206_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240411   gcc  
sparc64               randconfig-002-20240411   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240411   gcc  
um                    randconfig-002-20240411   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240411   gcc  
x86_64       buildonly-randconfig-002-20240411   clang
x86_64       buildonly-randconfig-003-20240411   clang
x86_64       buildonly-randconfig-004-20240411   gcc  
x86_64       buildonly-randconfig-005-20240411   clang
x86_64       buildonly-randconfig-006-20240411   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240411   clang
x86_64                randconfig-002-20240411   clang
x86_64                randconfig-003-20240411   gcc  
x86_64                randconfig-004-20240411   clang
x86_64                randconfig-005-20240411   gcc  
x86_64                randconfig-006-20240411   clang
x86_64                randconfig-011-20240411   clang
x86_64                randconfig-012-20240411   gcc  
x86_64                randconfig-013-20240411   clang
x86_64                randconfig-014-20240411   gcc  
x86_64                randconfig-015-20240411   gcc  
x86_64                randconfig-016-20240411   gcc  
x86_64                randconfig-071-20240411   clang
x86_64                randconfig-072-20240411   clang
x86_64                randconfig-073-20240411   clang
x86_64                randconfig-074-20240411   gcc  
x86_64                randconfig-075-20240411   gcc  
x86_64                randconfig-076-20240411   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240411   gcc  
xtensa                randconfig-002-20240411   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

