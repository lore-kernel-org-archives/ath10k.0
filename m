Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B19C6FD1D
	for <ath10k@archiver.kernel.org>; Thu, 16 Mar 2023 01:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TwgrRrCDOdTZXk/9Ev7YY0/wXOdYo3gvRMyBIgOFrOw=; b=Li/CoEwcii4O3C
	wHC9alUtAF0iM/5bZ9YxzPCj8oz3/P9AicBWC2z2CYUOsWb+u4Dlp9bn4nmBFg/QX5K/tdOAKSlNm
	gnj2JqZyWom5PHrFIMruMcHrQH+S13x9nTe2mNU7DeMFBpOVKJvVyKQhkMGupT+/MDgXw5Ti7mQY9
	bAl6lq0YjQC7fd1oIrBZxsuDYVhl6GCCl12mRyYkxExuXCIxS6aKGpvxevzaPCzSM8Yv5iT40lZtb
	MMiN5fdnd69eBP5cmkn4FBkMzS6pE4VhmD0gj2Enpwx9d0N04K2OCXtNAfzyUnq3xXkT6ndBFEE0V
	aGDPXf+Wu0R7qpe0823w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pccHE-00EtCe-0d;
	Thu, 16 Mar 2023 01:19:32 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pccHA-00EtB6-1h
	for ath10k@lists.infradead.org;
	Thu, 16 Mar 2023 01:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678929568; x=1710465568;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WtT0C+nM4ARCep+ho5AFsn7NdbOwtgKlP05sxxKZc/8=;
  b=PJbPZjiTpwVKvDOhIrSmCPVk9tWyaplmMWKAnvaGlUZ+Ivvnvp60y8bN
   H1wheLu2JrF0oYY2XzCEdxSmC5lIhbx8JFR/yH4+NRqiUy8lqwKZfwHxs
   V/hQBPA/H1gpVBdtdKofMrpOKSsRYO0wArlIB2R6bakwm0qVjD42eanf9
   JrEc4tEUSai/2m0lgWnskgE7r0cW+Vbl/sTMd5MdejscX/Rq+MgrcfpXY
   M2Ly93ChMeSGBEWsyugXfZyZvsmQBvR6O3n+7N7hyOrA1ysCiApgCK/w7
   OGqTvGDfVfhww2HamNpX3U7eRlPz981Ta+nVwNq49AFyU3apXWOoIxr9F
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="337876842"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="337876842"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 18:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="853813298"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="853813298"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Mar 2023 18:19:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pccGw-0008C3-2l;
	Thu, 16 Mar 2023 01:19:14 +0000
Date: Thu, 16 Mar 2023 09:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 3df3715e556027e94246b2cb30986563362a65f4
Message-ID: <64126e5c.o0gBW+4z5ucIO/O5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_181928_583618_F2CE61A9 
X-CRM114-Status: UNSURE (   4.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 3df3715e556027e94246b2cb30986563362a65f4  Add localversion-wireless-testing-ath

elapsed time: 729m

configs tested: 245
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230313   gcc  
alpha                randconfig-r025-20230312   gcc  
alpha                randconfig-r026-20230313   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc          buildonly-randconfig-r001-20230312   gcc  
arc          buildonly-randconfig-r004-20230312   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230312   gcc  
arc                  randconfig-r004-20230312   gcc  
arc                  randconfig-r011-20230313   gcc  
arc                  randconfig-r013-20230313   gcc  
arc                  randconfig-r014-20230312   gcc  
arc                  randconfig-r016-20230312   gcc  
arc                  randconfig-r021-20230312   gcc  
arc                  randconfig-r023-20230313   gcc  
arc                  randconfig-r031-20230312   gcc  
arc                  randconfig-r034-20230312   gcc  
arc                  randconfig-r043-20230312   gcc  
arc                  randconfig-r043-20230313   gcc  
arc                  randconfig-r043-20230315   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230313   gcc  
arm          buildonly-randconfig-r005-20230313   gcc  
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                  randconfig-r004-20230313   clang
arm                  randconfig-r006-20230312   gcc  
arm                  randconfig-r013-20230313   gcc  
arm                  randconfig-r016-20230313   gcc  
arm                  randconfig-r035-20230312   gcc  
arm                  randconfig-r046-20230312   clang
arm                  randconfig-r046-20230313   gcc  
arm                  randconfig-r046-20230315   gcc  
arm                        shmobile_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230313   gcc  
arm64        buildonly-randconfig-r006-20230313   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230312   clang
arm64                randconfig-r003-20230313   gcc  
arm64                randconfig-r005-20230312   clang
arm64                randconfig-r011-20230312   gcc  
arm64                randconfig-r012-20230312   gcc  
arm64                randconfig-r014-20230312   gcc  
arm64                randconfig-r015-20230313   clang
arm64                randconfig-r022-20230312   gcc  
arm64                randconfig-r034-20230313   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230313   gcc  
csky                 randconfig-r012-20230313   gcc  
csky                 randconfig-r015-20230312   gcc  
csky                 randconfig-r022-20230313   gcc  
csky                 randconfig-r023-20230312   gcc  
csky                 randconfig-r025-20230313   gcc  
csky                 randconfig-r026-20230312   gcc  
csky                 randconfig-r035-20230312   gcc  
csky                 randconfig-r036-20230313   gcc  
hexagon      buildonly-randconfig-r001-20230313   clang
hexagon              randconfig-r023-20230313   clang
hexagon              randconfig-r041-20230312   clang
hexagon              randconfig-r041-20230313   clang
hexagon              randconfig-r045-20230312   clang
hexagon              randconfig-r045-20230313   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r002-20230313   gcc  
i386         buildonly-randconfig-r003-20230313   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230313   gcc  
i386                 randconfig-a002-20230313   gcc  
i386                 randconfig-a003-20230313   gcc  
i386                 randconfig-a004-20230313   gcc  
i386                 randconfig-a005-20230313   gcc  
i386                 randconfig-a006-20230313   gcc  
i386                 randconfig-a011-20230313   clang
i386                 randconfig-a012-20230313   clang
i386                 randconfig-a013-20230313   clang
i386                 randconfig-a014-20230313   clang
i386                 randconfig-a015-20230313   clang
i386                 randconfig-a016-20230313   clang
i386                 randconfig-r005-20230313   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230312   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230312   gcc  
ia64                 randconfig-r002-20230313   gcc  
ia64                 randconfig-r011-20230312   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230313   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230312   gcc  
loongarch            randconfig-r021-20230313   gcc  
loongarch            randconfig-r026-20230312   gcc  
loongarch            randconfig-r036-20230313   gcc  
m68k                             allmodconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230312   gcc  
m68k                 randconfig-r006-20230312   gcc  
m68k                 randconfig-r014-20230313   gcc  
m68k                 randconfig-r015-20230313   gcc  
m68k                 randconfig-r016-20230312   gcc  
m68k                 randconfig-r025-20230313   gcc  
m68k                 randconfig-r032-20230312   gcc  
microblaze   buildonly-randconfig-r002-20230312   gcc  
microblaze   buildonly-randconfig-r005-20230312   gcc  
microblaze   buildonly-randconfig-r006-20230312   gcc  
microblaze           randconfig-r001-20230312   gcc  
microblaze           randconfig-r001-20230313   gcc  
microblaze           randconfig-r006-20230312   gcc  
microblaze           randconfig-r006-20230313   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230313   clang
mips                 randconfig-r003-20230313   clang
mips                 randconfig-r014-20230313   gcc  
mips                 randconfig-r015-20230313   gcc  
mips                 randconfig-r022-20230313   gcc  
mips                 randconfig-r023-20230312   clang
mips                 randconfig-r025-20230312   clang
mips                 randconfig-r033-20230312   gcc  
mips                 randconfig-r035-20230312   gcc  
nios2        buildonly-randconfig-r001-20230313   gcc  
nios2        buildonly-randconfig-r003-20230312   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230312   gcc  
nios2                randconfig-r013-20230312   gcc  
nios2                randconfig-r023-20230313   gcc  
nios2                randconfig-r025-20230313   gcc  
nios2                randconfig-r026-20230312   gcc  
openrisc     buildonly-randconfig-r001-20230312   gcc  
openrisc     buildonly-randconfig-r003-20230312   gcc  
openrisc     buildonly-randconfig-r005-20230313   gcc  
openrisc             randconfig-r013-20230313   gcc  
openrisc             randconfig-r014-20230312   gcc  
openrisc             randconfig-r023-20230312   gcc  
openrisc             randconfig-r026-20230312   gcc  
openrisc             randconfig-r032-20230312   gcc  
openrisc             randconfig-r036-20230312   gcc  
parisc       buildonly-randconfig-r006-20230312   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230312   gcc  
parisc               randconfig-r005-20230312   gcc  
parisc               randconfig-r021-20230313   gcc  
parisc               randconfig-r033-20230313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc              randconfig-r003-20230313   gcc  
powerpc              randconfig-r012-20230312   gcc  
powerpc              randconfig-r015-20230312   gcc  
powerpc              randconfig-r023-20230312   gcc  
powerpc              randconfig-r031-20230312   clang
powerpc              randconfig-r036-20230312   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230312   gcc  
riscv        buildonly-randconfig-r004-20230312   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                randconfig-r006-20230313   gcc  
riscv                randconfig-r022-20230312   gcc  
riscv                randconfig-r025-20230312   gcc  
riscv                randconfig-r026-20230313   clang
riscv                randconfig-r032-20230313   gcc  
riscv                randconfig-r042-20230312   gcc  
riscv                randconfig-r042-20230313   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230312   gcc  
s390                 randconfig-r044-20230312   gcc  
s390                 randconfig-r044-20230313   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230312   gcc  
sh           buildonly-randconfig-r006-20230313   gcc  
sh                   randconfig-r004-20230313   gcc  
sh                   randconfig-r005-20230312   gcc  
sh                   randconfig-r005-20230313   gcc  
sh                   randconfig-r021-20230313   gcc  
sh                   randconfig-r024-20230313   gcc  
sh                          rsk7269_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc        buildonly-randconfig-r003-20230313   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230313   gcc  
sparc                randconfig-r024-20230312   gcc  
sparc                randconfig-r025-20230313   gcc  
sparc                randconfig-r034-20230312   gcc  
sparc64      buildonly-randconfig-r002-20230313   gcc  
sparc64              randconfig-r002-20230312   gcc  
sparc64              randconfig-r004-20230312   gcc  
sparc64              randconfig-r004-20230313   gcc  
sparc64              randconfig-r012-20230313   gcc  
sparc64              randconfig-r021-20230312   gcc  
sparc64              randconfig-r025-20230312   gcc  
sparc64              randconfig-r026-20230312   gcc  
sparc64              randconfig-r033-20230313   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r005-20230313   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230313   gcc  
x86_64               randconfig-a002-20230313   gcc  
x86_64               randconfig-a003-20230313   gcc  
x86_64               randconfig-a004-20230313   gcc  
x86_64               randconfig-a005-20230313   gcc  
x86_64               randconfig-a006-20230313   gcc  
x86_64               randconfig-a011-20230313   clang
x86_64                        randconfig-a011   gcc  
x86_64               randconfig-a012-20230313   clang
x86_64               randconfig-a013-20230313   clang
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230313   clang
x86_64               randconfig-a015-20230313   clang
x86_64                        randconfig-a015   gcc  
x86_64               randconfig-a016-20230313   clang
x86_64                        randconfig-k001   clang
x86_64               randconfig-r024-20230313   clang
x86_64               randconfig-r035-20230313   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230312   gcc  
xtensa       buildonly-randconfig-r004-20230312   gcc  
xtensa                       common_defconfig   gcc  
xtensa               randconfig-r016-20230312   gcc  
xtensa               randconfig-r016-20230313   gcc  
xtensa               randconfig-r021-20230313   gcc  
xtensa               randconfig-r023-20230312   gcc  
xtensa               randconfig-r024-20230313   gcc  
xtensa               randconfig-r032-20230313   gcc  
xtensa               randconfig-r036-20230312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
