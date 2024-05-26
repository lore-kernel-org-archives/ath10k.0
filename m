Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2102C25B75
	for <ath10k@archiver.kernel.org>; Sun, 26 May 2024 03:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sg9gN9IJuvsokO+TNbY1AFEyMvqCWx7oWPgcgxPbMIs=; b=ZkTYnOKSJ8t67lr/7mR+cM3ppK
	LZCX4Gj3dI6rLpP9O0nph1AZkazP9fuDE5DuoNxMES+izIZSKlXtsjzo71ErLHHYb3tUEblrGlPX4
	wRYLTRviUfOSCkFZkBs7hdRfsIN96LEIcyEZKHzsY8qUsT0/YQKE+fYRqeFkjEGBX4J4YJPU0479W
	QXzOsNYIDpbEW0HoQTSuKnaEXzDV1labJyXKQik7f9hodtW6L2d9gjzA8uukERHh/hYkdC/dXrOnK
	sFebjpPBaHe+ltKmosF1iok71f1pehyORpvueZPoSTiCKYnuzL8NiXMyYbpIWcUFks5U70jTvLlZH
	6b0LFNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB4ik-0000000C6fn-3gGq;
	Sun, 26 May 2024 03:38:54 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB4ih-0000000C6fC-2SAd
	for ath10k@lists.infradead.org;
	Sun, 26 May 2024 03:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716694731; x=1748230731;
  h=date:from:to:cc:subject:message-id;
  bh=/V+dSxcwo3iL/BHT42eYkN4eTE7qZt6raKyTGRE0t7E=;
  b=Br4DQl2t1odb5Tyrh/zJEKMiE1EasOngSVRRIhuXI52iI9xJtrY3KIlC
   2f2dBBTvurLIvEWfF+nWv8s2TLjKsa/0i5Y90L485k5xN6lcTxVclU2Sg
   bXW6qel3+2gsRs8h4ZFRPTIOOmf99/eC8O4wj+qt00TJMi3yql50dzO/e
   butrwXol2zxqB6ak0y86Dbi/QMKqNibWmljS/Pz9OIHGOfEE53WJIqC+r
   rRdh/BLxlp67B2hBZ6AwUi49pSgHHLkNairqJGgp5W6VMeD8R2CbYjdhU
   JzpgrJbPnN34ipdxNiaX8yOF1J26ymbpfO8XdAhKwRQs1Sjoq3nwQImRP
   g==;
X-CSE-ConnectionGUID: qOZyRSy6Sx6kDUinx0S+Sg==
X-CSE-MsgGUID: tWEvxORbT9yq/JRXycb7BQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="12812909"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="12812909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 20:38:45 -0700
X-CSE-ConnectionGUID: Igt+vSxcQnqbvqsOzotQUg==
X-CSE-MsgGUID: BSbk7//cTbCPC6O1pHTMQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34504802"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 May 2024 20:38:44 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB4iX-0007iF-2H;
	Sun, 26 May 2024 03:38:41 +0000
Date: Sun, 26 May 2024 11:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 8c4ded3fadc0a498a749ff37f3da4a630f1d29b3
Message-ID: <202405261152.VL0elU8H-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_203851_722109_427C0BBC 
X-CRM114-Status: UNSURE (   3.96  )
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
branch HEAD: 8c4ded3fadc0a498a749ff37f3da4a630f1d29b3  Merge branch 'ath-next' into ath-qca

elapsed time: 1111m

configs tested: 185
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
arc                   randconfig-001-20240526   gcc  
arc                   randconfig-002-20240526   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240526   clang
arm                   randconfig-002-20240526   gcc  
arm                   randconfig-003-20240526   clang
arm                   randconfig-004-20240526   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240526   gcc  
arm64                 randconfig-002-20240526   clang
arm64                 randconfig-003-20240526   gcc  
arm64                 randconfig-004-20240526   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240526   gcc  
csky                  randconfig-002-20240526   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240526   clang
hexagon               randconfig-002-20240526   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240525   gcc  
i386         buildonly-randconfig-002-20240525   gcc  
i386         buildonly-randconfig-002-20240526   gcc  
i386         buildonly-randconfig-003-20240525   gcc  
i386         buildonly-randconfig-003-20240526   gcc  
i386         buildonly-randconfig-004-20240525   clang
i386         buildonly-randconfig-005-20240525   gcc  
i386         buildonly-randconfig-006-20240525   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240525   clang
i386                  randconfig-002-20240525   gcc  
i386                  randconfig-003-20240525   clang
i386                  randconfig-004-20240525   clang
i386                  randconfig-005-20240525   gcc  
i386                  randconfig-005-20240526   gcc  
i386                  randconfig-006-20240525   gcc  
i386                  randconfig-011-20240525   clang
i386                  randconfig-012-20240525   clang
i386                  randconfig-012-20240526   gcc  
i386                  randconfig-013-20240525   clang
i386                  randconfig-013-20240526   gcc  
i386                  randconfig-014-20240525   gcc  
i386                  randconfig-014-20240526   gcc  
i386                  randconfig-015-20240525   clang
i386                  randconfig-015-20240526   gcc  
i386                  randconfig-016-20240525   gcc  
i386                  randconfig-016-20240526   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240526   gcc  
loongarch             randconfig-002-20240526   gcc  
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
nios2                 randconfig-001-20240526   gcc  
nios2                 randconfig-002-20240526   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240526   gcc  
parisc                randconfig-002-20240526   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240526   clang
powerpc               randconfig-002-20240526   clang
powerpc               randconfig-003-20240526   gcc  
powerpc64             randconfig-001-20240526   clang
powerpc64             randconfig-002-20240526   gcc  
powerpc64             randconfig-003-20240526   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240526   clang
riscv                 randconfig-002-20240526   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240526   clang
s390                  randconfig-002-20240526   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240526   gcc  
sh                    randconfig-002-20240526   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240526   gcc  
sparc64               randconfig-002-20240526   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240526   clang
um                    randconfig-002-20240526   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240525   clang
x86_64       buildonly-randconfig-001-20240526   clang
x86_64       buildonly-randconfig-002-20240526   clang
x86_64       buildonly-randconfig-003-20240526   gcc  
x86_64       buildonly-randconfig-004-20240526   clang
x86_64       buildonly-randconfig-005-20240526   clang
x86_64       buildonly-randconfig-006-20240526   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240525   clang
x86_64                randconfig-001-20240526   clang
x86_64                randconfig-002-20240525   clang
x86_64                randconfig-002-20240526   clang
x86_64                randconfig-003-20240525   clang
x86_64                randconfig-003-20240526   clang
x86_64                randconfig-004-20240525   clang
x86_64                randconfig-004-20240526   gcc  
x86_64                randconfig-005-20240525   clang
x86_64                randconfig-005-20240526   gcc  
x86_64                randconfig-006-20240525   clang
x86_64                randconfig-006-20240526   clang
x86_64                randconfig-011-20240525   clang
x86_64                randconfig-011-20240526   gcc  
x86_64                randconfig-012-20240525   clang
x86_64                randconfig-012-20240526   gcc  
x86_64                randconfig-013-20240526   gcc  
x86_64                randconfig-014-20240525   clang
x86_64                randconfig-014-20240526   gcc  
x86_64                randconfig-015-20240526   gcc  
x86_64                randconfig-016-20240525   clang
x86_64                randconfig-016-20240526   clang
x86_64                randconfig-071-20240526   gcc  
x86_64                randconfig-072-20240525   clang
x86_64                randconfig-072-20240526   clang
x86_64                randconfig-073-20240525   clang
x86_64                randconfig-073-20240526   clang
x86_64                randconfig-074-20240526   clang
x86_64                randconfig-075-20240526   clang
x86_64                randconfig-076-20240525   clang
x86_64                randconfig-076-20240526   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240526   gcc  
xtensa                randconfig-002-20240526   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

