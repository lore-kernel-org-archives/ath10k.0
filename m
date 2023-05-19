Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAB8C77B7F
	for <ath10k@archiver.kernel.org>; Fri, 19 May 2023 05:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SOnAbnNjVkMSu9XBCyahriBXKrRxiUz1vYLm9MZEe9E=; b=SD4K+ENeARnjy6
	+YmjsjyDpIu84vy67plecavDIFynHB5lI4N9tFNQvL8CfBo0tOUtqbs0nLYBfRpadWZnPYOk5WyKp
	NcPI8D07xLvlyzhvY8/iSCIIOhUq72KcfcWqaq56XLPthYpkucxhnid4rxcXmkO1SPDcQzpNRorPG
	fg3q/a/q77japeiWjgyJLukvFnN9tJmojkndvMElPf2s3BLDxR4w2NgGVpThk+BTDl0/uHoOiBCqn
	gg+X9JLXloOIXjsHe6ZuQDbO+qQV53d3FTohmkBz/tGDmktT33SEel0FVWYcX+FGQylFzTQamH0Mw
	/GPTe7uVUGlhwU+xaqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzsiq-00F9ih-1o;
	Fri, 19 May 2023 05:32:12 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzsim-00F9gp-2I
	for ath10k@lists.infradead.org;
	Fri, 19 May 2023 05:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684474328; x=1716010328;
  h=date:from:to:cc:subject:message-id;
  bh=XJpRDbMAW/eN/zyLMUBpjkoZuwIJCxqpEvdOukVj/bY=;
  b=mGZ8GTnYMx0rXUXshkdHQKnvhVt55H1vpIyxWd9ksq0zvVG9UCnuyDpI
   hqWHOF1pPH9eoQEmtifbjC4bYvG10a7iqJKixPgjN1FqIISfjZNiZP6bR
   Cv7+Oa++9TsGXxB7+SIRTStm9ZiCaGWYpJ2qWI1whO3h6P1uOF2KhsbB0
   EpMqObeW31KvjYmcSWHxD9iI4q01Sp6fGf1adt4czMqkLgsSYLC8/k9oX
   yztBK4pnOnjNzqp+AAhxUhE4QonG8irYNM+wVIywljSVr5gXZHwD80qsu
   oTlkLUTz9R1zXK1XREb2jERC3z303F+RDRn1PlTU/NzeJixtyLV4CBPds
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341723546"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="341723546"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 22:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="876717152"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="876717152"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 May 2023 22:32:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzsid-000Acw-1V;
	Fri, 19 May 2023 05:31:59 +0000
Date: Fri, 19 May 2023 13:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 446059a5c7c407fdd9f289feb50bfc8bb69a5429
Message-ID: <20230519053104.Ixl8P%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_223208_843476_E010A03D 
X-CRM114-Status: UNSURE (   6.10  )
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
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 446059a5c7c407fdd9f289feb50bfc8bb69a5429  Merge branch 'pending' into master-pending

elapsed time: 725m

configs tested: 195
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230517   gcc  
alpha                randconfig-r014-20230517   gcc  
alpha                randconfig-r023-20230517   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230517   gcc  
arc          buildonly-randconfig-r006-20230517   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                  randconfig-r004-20230517   gcc  
arc                  randconfig-r013-20230517   gcc  
arc                  randconfig-r024-20230517   gcc  
arc                  randconfig-r043-20230518   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r005-20230517   gcc  
arm                  randconfig-r034-20230517   gcc  
arm                  randconfig-r036-20230517   gcc  
arm                  randconfig-r046-20230517   clang
arm                  randconfig-r046-20230518   gcc  
arm                        spear3xx_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230517   clang
arm64                randconfig-r011-20230517   gcc  
arm64                randconfig-r012-20230517   gcc  
csky         buildonly-randconfig-r001-20230519   gcc  
csky         buildonly-randconfig-r003-20230519   gcc  
csky         buildonly-randconfig-r005-20230517   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230517   gcc  
hexagon              randconfig-r041-20230517   clang
hexagon              randconfig-r041-20230518   clang
hexagon              randconfig-r045-20230517   clang
hexagon              randconfig-r045-20230518   clang
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
ia64         buildonly-randconfig-r002-20230517   gcc  
ia64         buildonly-randconfig-r006-20230519   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r005-20230517   gcc  
ia64                 randconfig-r011-20230517   gcc  
ia64                 randconfig-r013-20230517   gcc  
ia64                 randconfig-r022-20230517   gcc  
ia64                 randconfig-r036-20230517   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230517   gcc  
loongarch    buildonly-randconfig-r002-20230519   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230517   gcc  
loongarch            randconfig-r003-20230517   gcc  
loongarch            randconfig-r023-20230517   gcc  
loongarch            randconfig-r033-20230517   gcc  
loongarch            randconfig-r035-20230517   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230517   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                 randconfig-r022-20230517   gcc  
m68k                 randconfig-r024-20230517   gcc  
m68k                 randconfig-r034-20230517   gcc  
microblaze   buildonly-randconfig-r003-20230517   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r003-20230517   gcc  
microblaze           randconfig-r021-20230517   gcc  
microblaze           randconfig-r031-20230517   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                           ci20_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r015-20230517   clang
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230517   gcc  
nios2                randconfig-r025-20230517   gcc  
openrisc     buildonly-randconfig-r005-20230519   gcc  
openrisc             randconfig-r011-20230517   gcc  
openrisc             randconfig-r012-20230517   gcc  
openrisc             randconfig-r035-20230517   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230517   gcc  
parisc               randconfig-r026-20230517   gcc  
parisc               randconfig-r032-20230517   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                      ppc64e_defconfig   clang
powerpc              randconfig-r012-20230517   gcc  
powerpc              randconfig-r014-20230517   gcc  
powerpc              randconfig-r016-20230517   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230518   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230517   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230517   clang
s390                 randconfig-r006-20230517   clang
s390                 randconfig-r016-20230517   gcc  
s390                 randconfig-r026-20230517   gcc  
s390                 randconfig-r044-20230518   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230517   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r002-20230517   gcc  
sh                   randconfig-r023-20230517   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230517   gcc  
sparc                randconfig-r006-20230517   gcc  
sparc                randconfig-r012-20230517   gcc  
sparc                randconfig-r022-20230517   gcc  
sparc                randconfig-r024-20230517   gcc  
sparc                randconfig-r033-20230517   gcc  
sparc64      buildonly-randconfig-r004-20230519   gcc  
sparc64              randconfig-r001-20230517   gcc  
sparc64              randconfig-r026-20230517   gcc  
sparc64              randconfig-r033-20230517   gcc  
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
x86_64                        randconfig-x051   gcc  
x86_64                        randconfig-x052   clang
x86_64                        randconfig-x053   gcc  
x86_64                        randconfig-x054   clang
x86_64                        randconfig-x055   gcc  
x86_64                        randconfig-x056   clang
x86_64                        randconfig-x061   gcc  
x86_64                        randconfig-x062   clang
x86_64                        randconfig-x063   gcc  
x86_64                        randconfig-x064   clang
x86_64                        randconfig-x065   gcc  
x86_64                        randconfig-x066   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230517   gcc  
xtensa               randconfig-r006-20230517   gcc  
xtensa               randconfig-r034-20230517   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
