Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A921FC48BEB
	for <ath10k@archiver.kernel.org>; Thu, 15 Feb 2024 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ycKFOzoKqhf2BqPOEyEH6LhUDj5/dtRPMXk1I3NMFSA=; b=NFtHuT8wAoJ2UblK7pmd7uidHq
	lbLFB9CWlFXkxV41TCS5fqSiEXnIasMC/SQecTS2qm32YP3J7g3Ezui1Dtae6cPNamoAqMVCQLyoa
	Pg0qcFPArZZR2H2zPt9171mYNLNZppnpF5H75JPHlHQzjGNbA8SCpT3qkbuXAUhYCdwZupjcGe70n
	FSL4TcjyT1f1OGbiu7ZA1h5XWNIfIb7J2TdIlAkTQwl2p5LD9/+8/lP8H2AmbSvSQ4sDIW64qCbQQ
	rf/K9Qo79n81Vu9uvM0RZtvk2sT6w0Ca45cmcE2S+vmGekskml5P7TyAGgugy9uSdPi4CLXQby9V8
	Fbhx7+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raYBW-0000000FcPH-18uQ;
	Thu, 15 Feb 2024 09:37:38 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raYBU-0000000FcLf-0cpx
	for ath10k@lists.infradead.org;
	Thu, 15 Feb 2024 09:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707989856; x=1739525856;
  h=date:from:to:cc:subject:message-id;
  bh=KLez63H4r/HY6Z7K5nB57/+q+1E7qHIiTccbd6jugnM=;
  b=ZpCmI5pKcn1ApbhQ5LMJO06KCQg9DzJsA+nvgiqT1sXU+HCeDU/D3bUa
   8dveNuPoRq2JkQIgzdM1XANPl2qW20BnPkW5o0DGC0fQsX3jGPztqtmqU
   AQPRkQle2JweBwjpSlAB3H/FcXCmH5bbCVkF4WHDCE5CQkevJV9VOTRqV
   6pV80BGDi29NmAh8skYi3BlKyDshu+T+m4IpNidSXBOqJm3N5yfK8tXf3
   82p256J7jT8feWWv/hGfgkdyAgmpWj8NIuDui4NkR8uVaC2V7jDvCtAvZ
   m/D1JfyRo4CLlsQ4brqtgIMwSvMK7D3sex+LvFjkKp3hBkb19leZ0U3aF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1945540"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="1945540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 01:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="8090555"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Feb 2024 01:37:35 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raYBH-0000OJ-2v;
	Thu, 15 Feb 2024 09:37:27 +0000
Date: Thu, 15 Feb 2024 17:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 0e57f2082e9699e4cbcba1fee5a35152e100bf13
Message-ID: <202402151709.muUIpGaw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_013736_233215_C8D88310 
X-CRM114-Status: UNSURE (   4.13  )
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
branch HEAD: 0e57f2082e9699e4cbcba1fee5a35152e100bf13  Merge branch 'pending' into master-pending

elapsed time: 1450m

configs tested: 160
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240215   gcc  
arc                   randconfig-002-20240215   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20240215   clang
arm                   randconfig-002-20240215   gcc  
arm                   randconfig-003-20240215   gcc  
arm                   randconfig-004-20240215   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240215   clang
arm64                 randconfig-002-20240215   clang
arm64                 randconfig-003-20240215   gcc  
arm64                 randconfig-004-20240215   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240215   gcc  
csky                  randconfig-002-20240215   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240215   clang
hexagon               randconfig-002-20240215   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240215   clang
i386         buildonly-randconfig-002-20240215   clang
i386         buildonly-randconfig-003-20240215   clang
i386         buildonly-randconfig-004-20240215   clang
i386         buildonly-randconfig-005-20240215   clang
i386         buildonly-randconfig-006-20240215   clang
i386                                defconfig   clang
i386                  randconfig-001-20240215   gcc  
i386                  randconfig-002-20240215   gcc  
i386                  randconfig-003-20240215   clang
i386                  randconfig-004-20240215   gcc  
i386                  randconfig-005-20240215   gcc  
i386                  randconfig-006-20240215   gcc  
i386                  randconfig-011-20240215   clang
i386                  randconfig-012-20240215   clang
i386                  randconfig-013-20240215   gcc  
i386                  randconfig-014-20240215   gcc  
i386                  randconfig-015-20240215   clang
i386                  randconfig-016-20240215   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240215   gcc  
loongarch             randconfig-002-20240215   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   clang
mips                         db1xxx_defconfig   clang
mips                      fuloong2e_defconfig   gcc  
mips                     loongson2k_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240215   gcc  
nios2                 randconfig-002-20240215   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240215   gcc  
parisc                randconfig-002-20240215   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                       maple_defconfig   clang
powerpc               randconfig-001-20240215   gcc  
powerpc               randconfig-002-20240215   clang
powerpc               randconfig-003-20240215   clang
powerpc64             randconfig-001-20240215   clang
powerpc64             randconfig-002-20240215   gcc  
powerpc64             randconfig-003-20240215   clang
riscv                            allmodconfig   clang
riscv                            allyesconfig   clang
riscv                 randconfig-001-20240215   gcc  
riscv                 randconfig-002-20240215   gcc  
s390                             allmodconfig   clang
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240215   clang
s390                  randconfig-002-20240215   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240215   gcc  
sh                    randconfig-002-20240215   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240215   gcc  
sparc64               randconfig-002-20240215   gcc  
um                    randconfig-001-20240215   gcc  
um                    randconfig-002-20240215   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240215   clang
x86_64       buildonly-randconfig-002-20240215   clang
x86_64       buildonly-randconfig-003-20240215   gcc  
x86_64       buildonly-randconfig-004-20240215   gcc  
x86_64       buildonly-randconfig-005-20240215   clang
x86_64       buildonly-randconfig-006-20240215   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240215   clang
x86_64                randconfig-002-20240215   clang
x86_64                randconfig-003-20240215   gcc  
x86_64                randconfig-004-20240215   clang
x86_64                randconfig-005-20240215   clang
x86_64                randconfig-006-20240215   clang
x86_64                randconfig-011-20240215   gcc  
x86_64                randconfig-012-20240215   gcc  
x86_64                randconfig-013-20240215   gcc  
x86_64                randconfig-014-20240215   gcc  
x86_64                randconfig-015-20240215   gcc  
x86_64                randconfig-016-20240215   clang
x86_64                randconfig-071-20240215   clang
x86_64                randconfig-072-20240215   clang
x86_64                randconfig-073-20240215   gcc  
x86_64                randconfig-074-20240215   gcc  
x86_64                randconfig-075-20240215   clang
x86_64                randconfig-076-20240215   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240215   gcc  
xtensa                randconfig-002-20240215   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

