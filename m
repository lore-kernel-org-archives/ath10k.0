Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77838C433EF
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 23:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NogEek7gOPAD2WQiibb4JyGNcKmmEi3+cJZJGowa5QM=; b=A+ME+RznSAUT9u
	mxpEeJAk9zTyBqlt4Dt2OpocJvIz92tfGdLaK+q0oj0giv1mF0ulTyxE4UZyE1W25tvuhuhkr3ssI
	aQxN7yOwttiZe44yR8ZiyGUroLW66Ar8kaxF0hd0VXLsFyke7KymjnzX01vaRqmz2Qc+AzCjjAOVQ
	5HLdU0frezGNBXeOGOoLID+rxs7KPWGfg7gQSCJzHxk5ZjFq82bHXvB0+MIVxMyR1vezhwbPgoPua
	dvaT98FnUF+6TUqFq1LLugvyMRGWsssipvxb42mU4ixNuu492HI1uXY2mTx0Rl+xp00bAvp8nvONL
	L8NiYZF4ugOen486MoHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNNUU-002hEZ-3C; Thu, 24 Feb 2022 23:25:42 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNNUQ-002hD8-QO
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 23:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645745138; x=1677281138;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=rhZSNRoDRoXntLY5OiwImUtvzA4SZZBMahL8mXhsGIo=;
 b=CGAuVH5h1rFfpowrg981cSFgWxmLxOnplublxSSwqjOb9Z+btmmLv+cu
 w5QZeQht4rJhM5Mk8/DxT9KJWInBCNR9g6n1l5Vrthb7yqv5yNIcmElOR
 c8cUIWOY96E5gZrivVMVAYrYcrSUQ0IcxkRVgGqvm85foVKFatk0zT1zN
 0EHXA7wPAgNUV8pFyWLx3PFuVPtJdqSHps9xmv3DFAk78wvukZD/RlLev
 ZYht5aGagaKUn2919GiYWyTFoNIyGJVZ737jXNVPKsbxQqluGpe49Acik
 j2fXIHoj2Fa/qp6sQ2n9Z6+EpFUJmENtCnl6VmdDtK7kavO0UVfxGbyHh w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252568068"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252568068"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 15:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="607588102"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2022 15:25:36 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nNNUO-0003Z9-5g; Thu, 24 Feb 2022 23:25:36 +0000
Date: Fri, 25 Feb 2022 07:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 49ffac5907a8ff30c2cfc6ff9d56fe5c81abb059
Message-ID: <621813ba.gwP9pA4BMOnNSWvg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_152538_906245_00D21711 
X-CRM114-Status: UNSURE (   6.02  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 49ffac5907a8ff30c2cfc6ff9d56fe5c81abb059  ath10k: fix pointer arithmetic error in trace call

elapsed time: 735m

configs tested: 178
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220223
powerpc                    amigaone_defconfig
powerpc                      cm5200_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            zeus_defconfig
powerpc                       maple_defconfig
s390                          debug_defconfig
mips                             allyesconfig
arm                           stm32_defconfig
arm                        spear6xx_defconfig
powerpc                     sequoia_defconfig
microblaze                      mmu_defconfig
powerpc                  iss476-smp_defconfig
sh                             espt_defconfig
arc                              alldefconfig
sh                          rsk7201_defconfig
arm                         axm55xx_defconfig
nios2                            allyesconfig
xtensa                          iss_defconfig
powerpc                 mpc8540_ads_defconfig
um                             i386_defconfig
mips                       capcella_defconfig
sh                        sh7785lcr_defconfig
powerpc                      makalu_defconfig
powerpc                     mpc83xx_defconfig
ia64                            zx1_defconfig
powerpc                     stx_gp3_defconfig
sh                   sh7724_generic_defconfig
arc                     haps_hs_smp_defconfig
powerpc                        cell_defconfig
mips                           jazz_defconfig
sh                          rsk7269_defconfig
sh                           se7750_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc834x_mds_defconfig
sh                     magicpanelr2_defconfig
mips                           gcw0_defconfig
arm                         s3c6400_defconfig
h8300                    h8300h-sim_defconfig
sh                           sh2007_defconfig
ia64                             allmodconfig
sh                           se7724_defconfig
arm                         assabet_defconfig
arc                        nsimosci_defconfig
nios2                         10m50_defconfig
sh                            titan_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           se7712_defconfig
sh                          polaris_defconfig
openrisc                         alldefconfig
powerpc                      pasemi_defconfig
arm                          iop32x_defconfig
powerpc                       eiger_defconfig
sh                          sdk7780_defconfig
mips                       bmips_be_defconfig
xtensa                       common_defconfig
nios2                               defconfig
csky                                defconfig
arm                           tegra_defconfig
ia64                             alldefconfig
arm                          gemini_defconfig
arc                     nsimosci_hs_defconfig
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220223
s390                 randconfig-r044-20220224
arc                  randconfig-r043-20220224
riscv                randconfig-r042-20220224
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220224
powerpc              randconfig-c003-20220223
x86_64                        randconfig-c007
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
mips                 randconfig-c004-20220224
mips                 randconfig-c004-20220223
i386                          randconfig-c001
riscv                randconfig-c006-20220223
riscv                randconfig-c006-20220224
s390                 randconfig-c005-20220223
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
riscv                    nommu_virt_defconfig
arm                          pcm027_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc836x_mds_defconfig
arm                          ixp4xx_defconfig
mips                          rm200_defconfig
powerpc                          g5_defconfig
arm                                 defconfig
arm                         hackkit_defconfig
powerpc                     tqm8560_defconfig
arm                         socfpga_defconfig
mips                           ip22_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        neponset_defconfig
arm                      tct_hammer_defconfig
powerpc                   lite5200b_defconfig
arm                          moxart_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220223
hexagon              randconfig-r041-20220223
riscv                randconfig-r042-20220223
hexagon              randconfig-r045-20220224
s390                 randconfig-r044-20220223
hexagon              randconfig-r041-20220224
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
