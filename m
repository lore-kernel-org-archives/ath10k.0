Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE6CC25B74
	for <ath10k@archiver.kernel.org>; Tue, 14 May 2024 02:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZsHUcVxTeSprX0DmeHK90FNz8TmLHbgWTYGAICJCegE=; b=iuwmCpIJIIGrvMNQHYS5Fw1N4f
	rR0KpBo3aUJ02EYRHrrohhn4qJAK7YOcCE+sXt9Tdor2fi9rS6WcC+OL4yRXuqVUoXU2pNYVB1R/6
	vET+FoIeUDzJv1JCK7JCOYk5Gdyi6y9jWuCZFPttcy1amkOFiT9+Nu4vE7fcNR40yKfyHVD1kyl08
	xSnIgqHzHX+whv2OZNJqQYrsqPcVxWAMC58/pcnI0hsx7bKAPi+d38Dmv371Qj7ZQnnFQ6jI4UFtb
	o3oi/OKMTWSq/TUnKBLNlyQ78/JGXEvtMPebFL8DHP1zATw76JxpEcQT/h4gnZsC334grRJuagnpj
	c8PRqGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6iKz-0000000Eqxs-1GcJ;
	Tue, 14 May 2024 02:56:21 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6iKw-0000000Eqwj-0cxm
	for ath10k@lists.infradead.org;
	Tue, 14 May 2024 02:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715655378; x=1747191378;
  h=date:from:to:cc:subject:message-id;
  bh=xJvSAatg9d6ZqefQ4TEIHAhPCaIODmfhmQTvN602MO4=;
  b=k5n0falrZJH+IbU29GBonVYIuabcotz+FN4LAkhCDPjNrx4jjVGjttUX
   O6ayOks5vLpyQSa5tJtUJDNgnk52twk70zEsNS0CSl8ikisJHjb0TYF8N
   ikj5Ut+8mviiFELawXm0pcdlfZEzA09CsXBBYVzY708KoOmLTDRPFMz56
   dZV3jk3Mrmhiol+DAUZwNDIzgf0kWXTttEVHv9WT0G7MPtGuHmYib4g7J
   uJrdb5crDYIbrDdecdYWuAgbHaOVKwhXQ27hCOLGML226XKE0a6yQtVsr
   A+MTER+EyH6ff1+GWzC8oB23Kf0NylmozEmmU2oBnWtYBJFpH6fpoWWs8
   g==;
X-CSE-ConnectionGUID: zfWNWvbtSzyoQEn80CKDDQ==
X-CSE-MsgGUID: N/uxcnBzSm2k+PeoXf+CfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11489942"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11489942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 19:56:11 -0700
X-CSE-ConnectionGUID: Z0PYWTSiQKyjdT9JQJRz2A==
X-CSE-MsgGUID: aAecogEBT1yOCAm0HT6plw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30658206"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 May 2024 19:56:10 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6iKl-000Ayh-0h;
	Tue, 14 May 2024 02:56:07 +0000
Date: Tue, 14 May 2024 10:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 0ef7606c6012f05a1f5398e3a1964c35eb9c08a4
Message-ID: <202405141046.mw7z0kOJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_195618_235774_53B46803 
X-CRM114-Status: UNSURE (   3.99  )
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
branch HEAD: 0ef7606c6012f05a1f5398e3a1964c35eb9c08a4  Add localversion-wireless-testing-ath

elapsed time: 733m

configs tested: 178
configs skipped: 4

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
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240514   gcc  
arc                   randconfig-002-20240514   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240514   clang
arm                   randconfig-002-20240514   gcc  
arm                   randconfig-003-20240514   gcc  
arm                   randconfig-004-20240514   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240514   clang
arm64                 randconfig-002-20240514   clang
arm64                 randconfig-003-20240514   gcc  
arm64                 randconfig-004-20240514   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240514   gcc  
csky                  randconfig-002-20240514   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240514   clang
hexagon               randconfig-002-20240514   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240514   clang
i386         buildonly-randconfig-002-20240514   clang
i386         buildonly-randconfig-003-20240514   gcc  
i386         buildonly-randconfig-004-20240514   clang
i386         buildonly-randconfig-005-20240514   gcc  
i386         buildonly-randconfig-006-20240514   clang
i386                                defconfig   clang
i386                  randconfig-001-20240514   gcc  
i386                  randconfig-002-20240514   clang
i386                  randconfig-003-20240514   gcc  
i386                  randconfig-004-20240514   clang
i386                  randconfig-005-20240514   clang
i386                  randconfig-006-20240514   clang
i386                  randconfig-011-20240514   clang
i386                  randconfig-012-20240514   gcc  
i386                  randconfig-013-20240514   gcc  
i386                  randconfig-014-20240514   clang
i386                  randconfig-015-20240514   gcc  
i386                  randconfig-016-20240514   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240514   gcc  
loongarch             randconfig-002-20240514   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                        maltaup_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240514   gcc  
nios2                 randconfig-002-20240514   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240514   gcc  
parisc                randconfig-002-20240514   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      cm5200_defconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                       maple_defconfig   clang
powerpc               randconfig-001-20240514   gcc  
powerpc               randconfig-002-20240514   gcc  
powerpc               randconfig-003-20240514   clang
powerpc                     redwood_defconfig   clang
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240514   clang
powerpc64             randconfig-002-20240514   clang
powerpc64             randconfig-003-20240514   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240514   gcc  
riscv                 randconfig-002-20240514   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240514   gcc  
s390                  randconfig-002-20240514   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240514   gcc  
sh                    randconfig-002-20240514   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240514   gcc  
sparc64               randconfig-002-20240514   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240514   clang
um                    randconfig-002-20240514   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240514   clang
x86_64       buildonly-randconfig-002-20240514   clang
x86_64       buildonly-randconfig-003-20240514   gcc  
x86_64       buildonly-randconfig-004-20240514   clang
x86_64       buildonly-randconfig-005-20240514   clang
x86_64       buildonly-randconfig-006-20240514   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240514   gcc  
x86_64                randconfig-002-20240514   gcc  
x86_64                randconfig-003-20240514   clang
x86_64                randconfig-004-20240514   clang
x86_64                randconfig-005-20240514   gcc  
x86_64                randconfig-006-20240514   gcc  
x86_64                randconfig-011-20240514   clang
x86_64                randconfig-012-20240514   gcc  
x86_64                randconfig-013-20240514   gcc  
x86_64                randconfig-014-20240514   clang
x86_64                randconfig-015-20240514   gcc  
x86_64                randconfig-016-20240514   gcc  
x86_64                randconfig-071-20240514   clang
x86_64                randconfig-072-20240514   clang
x86_64                randconfig-073-20240514   gcc  
x86_64                randconfig-074-20240514   gcc  
x86_64                randconfig-075-20240514   clang
x86_64                randconfig-076-20240514   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240514   gcc  
xtensa                randconfig-002-20240514   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

