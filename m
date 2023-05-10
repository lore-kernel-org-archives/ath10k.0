Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E67C77B7C
	for <ath10k@archiver.kernel.org>; Wed, 10 May 2023 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ix8FOy45G+7iXXg1kpKT9XClbZGWGYd9vYoUe47eCuU=; b=3qsDdXN8JhzJ++
	pAKT3v+khOQJinEyGSsCU9SIL76NiJgMAKm4UldraI2bJdSUHz4DCM10PwwGIgk+CBcDZOsYzlNRS
	8KLlLrK/Cr28H07tq5+rXWHfVGBPWD9rRnbbvRvJqF2nBhptNzgE4Ofx3aITV8Ulbh6hQW9fdfzhT
	klaBi3VdDuwUfg0qcNN3YfBydFi3wkfwWyouSa6iaMZwv+RXhe+odv+Yud4wiXpFICKVOCZyBilya
	XyZEsjUt/W1lne8a/xnwnkYv6Nw3GbtNgnhmb3eVC+wGKoQmjIUFpNJCpuIYvqDUPM82HLvuzPd7s
	JTPTp+42SEAS6hgmQJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdhh-005J9s-2q;
	Wed, 10 May 2023 06:53:37 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdhe-005J9F-2z
	for ath10k@lists.infradead.org;
	Wed, 10 May 2023 06:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683701614; x=1715237614;
  h=date:from:to:cc:subject:message-id;
  bh=jgf5VW2+isf8njmh3oHz9gtO8PpEH+al7Uo2amnfNuM=;
  b=WqjyIDXwkm18XmBhrEFdqZFCT4MimEAT7cjUlG7GQCmMnEmW2Kx1IJ3z
   wRoMtzkO1c7yL/H/b1LWDHCBCusMOjOfXKnSVf6OGYj32Z5/6C8+5GlXz
   JbaPYjhvY46RiK7ASffFUdF+Pp6YOLd5fDU9WvX3qns1/DXiZaqJnu1VD
   kLnosQItbvVlmj2PWCylGn7Y8br1P8tvzncmVq5Bd76kswgP2qU4KjsSr
   Ki1Oczi9v+mUZ7lBGh/ff3tN4gzcdIXgQ3PaDDu7U5J0gzskAouFFlOT3
   DTquUKJWpmhK4Yk6VpCYc4Q3QOpjpBn1RZ7TpcYK+tv9PGaHegEA65+GG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413434461"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="413434461"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 23:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="732039875"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="732039875"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 May 2023 23:53:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwdhQ-00030o-1h;
	Wed, 10 May 2023 06:53:20 +0000
Date: Wed, 10 May 2023 14:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 87bd401138161008fdb82fbca6e213af117bfeb9
Message-ID: <20230510065253.CAS7v%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_235335_046331_71D48B1E 
X-CRM114-Status: UNSURE (   5.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 87bd401138161008fdb82fbca6e213af117bfeb9  wifi: ath11k: EMA beacon support

elapsed time: 822m

configs tested: 163
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230509   gcc  
alpha        buildonly-randconfig-r005-20230509   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230509   gcc  
alpha                randconfig-r034-20230509   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230509   gcc  
arc          buildonly-randconfig-r005-20230509   gcc  
arc          buildonly-randconfig-r006-20230509   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230509   gcc  
arc                  randconfig-r013-20230509   gcc  
arc                  randconfig-r014-20230509   gcc  
arc                  randconfig-r031-20230509   gcc  
arc                  randconfig-r036-20230509   gcc  
arc                  randconfig-r043-20230509   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230509   gcc  
arm                                 defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                        neponset_defconfig   clang
arm                  randconfig-r024-20230509   gcc  
arm                  randconfig-r046-20230509   gcc  
arm                         s5pv210_defconfig   clang
arm                          sp7021_defconfig   clang
arm                    vt8500_v6_v7_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230509   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230509   gcc  
arm64                randconfig-r004-20230509   gcc  
arm64                randconfig-r036-20230509   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230509   gcc  
csky                 randconfig-r032-20230509   gcc  
hexagon              randconfig-r001-20230509   clang
hexagon              randconfig-r002-20230509   clang
hexagon              randconfig-r041-20230509   clang
hexagon              randconfig-r041-20230510   clang
hexagon              randconfig-r045-20230509   clang
hexagon              randconfig-r045-20230510   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r023-20230509   gcc  
ia64                 randconfig-r025-20230509   gcc  
ia64                 randconfig-r035-20230509   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230509   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230509   gcc  
loongarch            randconfig-r021-20230509   gcc  
loongarch            randconfig-r035-20230509   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230509   gcc  
m68k                 randconfig-r014-20230509   gcc  
m68k                 randconfig-r021-20230509   gcc  
m68k                 randconfig-r023-20230509   gcc  
m68k                 randconfig-r034-20230509   gcc  
microblaze   buildonly-randconfig-r002-20230509   gcc  
microblaze   buildonly-randconfig-r003-20230509   gcc  
microblaze           randconfig-r001-20230509   gcc  
microblaze           randconfig-r003-20230509   gcc  
microblaze           randconfig-r016-20230509   gcc  
microblaze           randconfig-r036-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r006-20230509   clang
nios2        buildonly-randconfig-r001-20230509   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230509   gcc  
nios2                randconfig-r006-20230509   gcc  
nios2                randconfig-r021-20230509   gcc  
nios2                randconfig-r026-20230509   gcc  
nios2                randconfig-r033-20230509   gcc  
openrisc     buildonly-randconfig-r002-20230509   gcc  
openrisc             randconfig-r004-20230509   gcc  
openrisc             randconfig-r006-20230509   gcc  
openrisc             randconfig-r011-20230509   gcc  
openrisc             randconfig-r022-20230509   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230509   gcc  
parisc               randconfig-r024-20230509   gcc  
parisc               randconfig-r035-20230509   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc8560_ads_defconfig   clang
powerpc              randconfig-r005-20230509   gcc  
powerpc              randconfig-r015-20230509   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230509   clang
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230509   clang
riscv                randconfig-r042-20230510   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230509   gcc  
s390                 randconfig-r031-20230509   gcc  
s390                 randconfig-r034-20230509   gcc  
s390                 randconfig-r044-20230509   clang
s390                 randconfig-r044-20230510   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230509   gcc  
sh                   randconfig-r002-20230509   gcc  
sh                   randconfig-r003-20230509   gcc  
sh                   randconfig-r032-20230509   gcc  
sparc        buildonly-randconfig-r004-20230509   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230509   gcc  
sparc                randconfig-r016-20230509   gcc  
sparc                randconfig-r024-20230509   gcc  
sparc                randconfig-r026-20230509   gcc  
sparc64      buildonly-randconfig-r003-20230509   gcc  
sparc64              randconfig-r005-20230509   gcc  
sparc64              randconfig-r006-20230509   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230509   gcc  
xtensa               randconfig-r001-20230509   gcc  
xtensa               randconfig-r002-20230509   gcc  
xtensa               randconfig-r004-20230509   gcc  
xtensa               randconfig-r022-20230509   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
