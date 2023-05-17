Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D9C7EE22
	for <ath10k@archiver.kernel.org>; Wed, 17 May 2023 20:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VmXS5/yH9FHqjIIhMb6CKP9wBGqD2b9ZOUC17+g86fM=; b=pGtWRTbBP/IkWh
	2XKXddHjeUz/NZ/S44gUOx84Yopn90/CJWeSbx9KpNK2PMk7shbNmMHLI2Q2w0kwmvE46wY86vvIp
	h2x4Ic4PGtF+PSMkSuLUz77vHCYdszCn6MOEEdUhUM0rEgoO9I2H3OYsZn59OoIkXZdCjD0wyCijh
	toHXz2KR5AEnlnSc1hvIOwhxGXUnwSujSYb25mx3XXCp3UeCBVvDGTGwes8kSKMZnBXVPPn5HnBce
	YO6BNiWt6GktUPJmKJeBeMhyUCPoE1hN5yjm0geYpjBTFXxptrUC7m8GZzRp/7z6mWuEwyntaxEYp
	Q2ezq7x5TQsQICiTI5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzNqB-00B0CF-1x;
	Wed, 17 May 2023 20:33:43 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzNq7-00B0BO-2q
	for ath10k@lists.infradead.org;
	Wed, 17 May 2023 20:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684355619; x=1715891619;
  h=date:from:to:cc:subject:message-id;
  bh=bEhLVEAEwBQhtZyz2+X6gSzpJgRlWhgGWEm7VERvmjI=;
  b=C8oISi6ER1JfoKbkd3rJvB6I24ClEDd0D/JLWJn0EIO7A6sGZUWZTuPg
   qTQTX/nGPjXyO4xxjx59wNSCr/+FH8ebSrlXwqcTB/SDRDqTndh7zfWr5
   vGcZnLrDOSVa1NauCUGRa0SUYw4uvuy1+1E0ABJ2203GHFyrh7sHdd66f
   Ktxfjp/GHnFcOybU4L/TOZ4pwgCbtFPyD2W+IQkMR5jk9qwBFEAMiluWX
   YqwxQSlfkrpEwvVc+AJrO8rJO/kUoZv4TZhD6ZMEuB8XlrC98uV6JJsu1
   iTuMwT0Wely0P+tp6rEKJuRyd3WdJ1DgnFhpEHgu7PKFs/f42ewzinptq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="417530049"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="417530049"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 13:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="948397359"
X-IronPort-AV: E=Sophos;i="5.99,283,1677571200"; 
   d="scan'208";a="948397359"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 May 2023 13:33:36 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzNq4-0009Bh-0g;
	Wed, 17 May 2023 20:33:36 +0000
Date: Thu, 18 May 2023 04:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 df8e3729ffc0aa645839693f74ee7b6d999cdf64
Message-ID: <20230517203317.ckEPB%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_133340_002464_0D32FB1D 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: INFO setup_repo_specs: /db/releases/20230517200055/lkp-src/repo/*/kvalo-ath
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: df8e3729ffc0aa645839693f74ee7b6d999cdf64  wifi: ath11k: Send HT fixed rate in WMI peer fixed param

elapsed time: 721m

configs tested: 258
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230517   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230517   gcc  
alpha                randconfig-r022-20230517   gcc  
alpha                randconfig-r024-20230517   gcc  
alpha                randconfig-r034-20230517   gcc  
alpha                randconfig-r035-20230517   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230517   gcc  
arc          buildonly-randconfig-r006-20230517   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r001-20230517   gcc  
arc                  randconfig-r022-20230517   gcc  
arc                  randconfig-r023-20230517   gcc  
arc                  randconfig-r025-20230517   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230517   clang
arm                        clps711x_defconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                        mvebu_v7_defconfig   gcc  
arm                  randconfig-r031-20230517   gcc  
arm                  randconfig-r034-20230517   gcc  
arm                  randconfig-r035-20230517   gcc  
arm                  randconfig-r036-20230517   gcc  
arm                  randconfig-r046-20230517   clang
arm                        shmobile_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230517   clang
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230517   clang
arm64                randconfig-r014-20230517   gcc  
arm64                randconfig-r024-20230517   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230517   gcc  
csky                 randconfig-r021-20230517   gcc  
csky                 randconfig-r024-20230517   gcc  
csky                 randconfig-r025-20230517   gcc  
hexagon              randconfig-r012-20230517   clang
hexagon              randconfig-r016-20230517   clang
hexagon              randconfig-r041-20230517   clang
hexagon              randconfig-r045-20230517   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a004   clang
i386                          randconfig-a006   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a014   gcc  
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                      gensparse_defconfig   gcc  
ia64                 randconfig-r005-20230517   gcc  
ia64                 randconfig-r012-20230517   gcc  
ia64                 randconfig-r013-20230517   gcc  
ia64                 randconfig-r023-20230517   gcc  
ia64                 randconfig-r036-20230517   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230517   gcc  
loongarch    buildonly-randconfig-r005-20230517   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230517   gcc  
loongarch            randconfig-r004-20230517   gcc  
loongarch            randconfig-r011-20230517   gcc  
loongarch            randconfig-r022-20230517   gcc  
loongarch            randconfig-r032-20230517   gcc  
loongarch            randconfig-r033-20230517   gcc  
loongarch            randconfig-r035-20230517   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r005-20230517   gcc  
m68k                 randconfig-r015-20230517   gcc  
m68k                 randconfig-r023-20230517   gcc  
m68k                 randconfig-r034-20230517   gcc  
microblaze   buildonly-randconfig-r002-20230517   gcc  
microblaze   buildonly-randconfig-r003-20230517   gcc  
microblaze           randconfig-r006-20230517   gcc  
microblaze           randconfig-r012-20230517   gcc  
microblaze           randconfig-r021-20230517   gcc  
microblaze           randconfig-r025-20230517   gcc  
microblaze           randconfig-r031-20230517   gcc  
microblaze           randconfig-r033-20230517   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   clang
mips                     loongson1c_defconfig   clang
mips                      maltasmvp_defconfig   gcc  
mips                        maltaup_defconfig   clang
mips                 randconfig-r006-20230517   gcc  
mips                 randconfig-r032-20230517   gcc  
mips                        vocore2_defconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allyesconfig   gcc  
nios2        buildonly-randconfig-r002-20230517   gcc  
nios2        buildonly-randconfig-r006-20230517   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230517   gcc  
nios2                randconfig-r004-20230517   gcc  
nios2                randconfig-r013-20230517   gcc  
nios2                randconfig-r023-20230517   gcc  
nios2                randconfig-r025-20230517   gcc  
nios2                randconfig-r032-20230517   gcc  
openrisc             randconfig-r001-20230517   gcc  
openrisc             randconfig-r002-20230517   gcc  
openrisc             randconfig-r003-20230517   gcc  
openrisc             randconfig-r011-20230517   gcc  
openrisc             randconfig-r012-20230517   gcc  
openrisc             randconfig-r013-20230517   gcc  
openrisc             randconfig-r031-20230517   gcc  
openrisc             randconfig-r035-20230517   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230517   gcc  
parisc               randconfig-r016-20230517   gcc  
parisc               randconfig-r024-20230517   gcc  
parisc               randconfig-r026-20230517   gcc  
parisc               randconfig-r032-20230517   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230517   gcc  
powerpc                        fsp2_defconfig   clang
powerpc                 linkstation_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc              randconfig-r016-20230517   gcc  
powerpc                    socrates_defconfig   clang
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                      walnut_defconfig   clang
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230517   gcc  
riscv        buildonly-randconfig-r003-20230517   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230517   clang
riscv                randconfig-r002-20230517   clang
riscv                randconfig-r005-20230517   clang
riscv                randconfig-r011-20230517   gcc  
riscv                randconfig-r014-20230517   gcc  
riscv                randconfig-r015-20230517   gcc  
riscv                randconfig-r024-20230517   gcc  
riscv                randconfig-r026-20230517   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r004-20230517   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r016-20230517   gcc  
s390                 randconfig-r021-20230517   gcc  
s390                 randconfig-r022-20230517   gcc  
s390                 randconfig-r026-20230517   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230517   gcc  
sh           buildonly-randconfig-r005-20230517   gcc  
sh           buildonly-randconfig-r006-20230517   gcc  
sh                          polaris_defconfig   gcc  
sh                   randconfig-r005-20230517   gcc  
sh                   randconfig-r015-20230517   gcc  
sh                   randconfig-r021-20230517   gcc  
sh                   randconfig-r022-20230517   gcc  
sh                   randconfig-r024-20230517   gcc  
sh                   randconfig-r025-20230517   gcc  
sh                   randconfig-r036-20230517   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230517   gcc  
sparc                randconfig-r003-20230517   gcc  
sparc                randconfig-r021-20230517   gcc  
sparc                randconfig-r022-20230517   gcc  
sparc                randconfig-r023-20230517   gcc  
sparc                randconfig-r024-20230517   gcc  
sparc                randconfig-r033-20230517   gcc  
sparc                randconfig-r036-20230517   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64      buildonly-randconfig-r001-20230517   gcc  
sparc64      buildonly-randconfig-r004-20230517   gcc  
sparc64      buildonly-randconfig-r005-20230517   gcc  
sparc64              randconfig-r005-20230517   gcc  
sparc64              randconfig-r016-20230517   gcc  
sparc64              randconfig-r026-20230517   gcc  
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
x86_64                        randconfig-x052   clang
x86_64                        randconfig-x054   clang
x86_64                        randconfig-x056   clang
x86_64                        randconfig-x061   gcc  
x86_64                        randconfig-x063   gcc  
x86_64                        randconfig-x065   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa       buildonly-randconfig-r001-20230517   gcc  
xtensa       buildonly-randconfig-r003-20230517   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r004-20230517   gcc  
xtensa               randconfig-r012-20230517   gcc  
xtensa               randconfig-r025-20230517   gcc  
xtensa               randconfig-r026-20230517   gcc  
xtensa               randconfig-r031-20230517   gcc  
xtensa               randconfig-r032-20230517   gcc  
xtensa                    smp_lx200_defconfig   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
