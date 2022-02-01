Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E0BC433EF
	for <ath10k@archiver.kernel.org>; Tue,  1 Feb 2022 02:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VeUiwnM+UKg3mYPlROFb3fimoE4w6OF9L9rXQWZZ+Vw=; b=Hprt3fDvlPLVxy
	3g3k3cnSjfGSGMTY00Aft12jzBC3y82gxzBekqjwzZvptw1vTKnqE9prordscThJw6fDJfJOZzXsB
	F/9x+OTZQcImAj8DYodNrosrI0ZYc6OoPfUItxET5tf3q4UcRAc7craSe5GvKNKPaMCuOnKZTaujt
	w6vY/I6Vd3nqPg2wLcCTMhqJzwKWhsgSZym1WiWcWdfTd19iSo7o7+xzGNDmubwHhm4lZFktP966d
	EbJOdG1FL7ET3BO+PNCPYEgeHepbYhdS20ZThfpnXwN2scS/fY0XJ/8ffdwgkqDczSR2cd/EtzRDf
	4zQZ0KQtTc9iSGQ8Q8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEj5N-00B1WL-Gp; Tue, 01 Feb 2022 02:40:01 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEj5J-00B1UK-2D
 for ath10k@lists.infradead.org; Tue, 01 Feb 2022 02:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643683196; x=1675219196;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=BAzcDDt++5Bxc9+2u4LNESvqPLWJQDtbs8i5/h7+POU=;
 b=NJPI/p2JpRPzE63v6/x/+wdu1RF6wRWaEmZ/LiSXxQrR8LO0jQonTbYT
 5MWKIpBwWY7vUU/Gz+51RBgn4QlblLeTX3cNX+zy5xYe4Bt5eXRGGwTg1
 jQX77FvIHG1bUL9jhZHUJBHFuv86YcNbkqk/XGYWlUZ7aeDb7jYWunMyz
 pkOfG2lcJWLqVfDbbopfMQs9meWzWs+Q8FRAZPnLaeWzzXPXJB8sOOLTJ
 QKMGKscjHnr2VFUsgD+NME5fssW42AO42Uo61zJnvDlhVT6vk1wTcZA8I
 vtCSKqAf1K5xk8BBLINokAqEW+AWaeQVQw+Z+fSq1gHzwTlgoOcP9O5cc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247827478"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="247827478"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 18:39:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="770977957"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2022 18:39:08 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEj4W-000Sdm-3k; Tue, 01 Feb 2022 02:39:08 +0000
Date: Tue, 01 Feb 2022 10:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4bc69c08d5237c87d8eea5b9edd7e3538cbdf461
Message-ID: <61f89d22.ihAvSLmqLfofZv40%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_183957_183807_5DF13003 
X-CRM114-Status: UNSURE (   5.00  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 4bc69c08d5237c87d8eea5b9edd7e3538cbdf461  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 158
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
powerpc              randconfig-c003-20220131
sh                          rsk7203_defconfig
m68k                       m5475evb_defconfig
powerpc                mpc7448_hpc2_defconfig
m68k                        m5307c3_defconfig
sh                        sh7763rdp_defconfig
mips                         mpc30x_defconfig
sh                 kfr2r09-romimage_defconfig
sh                               alldefconfig
arm                          pxa910_defconfig
arm                          lpd270_defconfig
m68k                       m5208evb_defconfig
mips                 decstation_r4k_defconfig
powerpc                        warp_defconfig
arm                        oxnas_v6_defconfig
sh                          rsk7269_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc837x_rdb_defconfig
parisc                           alldefconfig
xtensa                           allyesconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc837x_mds_defconfig
riscv                    nommu_k210_defconfig
mips                      fuloong2e_defconfig
powerpc                      arches_defconfig
arm                           stm32_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     asp8347_defconfig
arm                      footbridge_defconfig
sh                          kfr2r09_defconfig
sh                           se7724_defconfig
ia64                        generic_defconfig
sh                           se7343_defconfig
sh                             shx3_defconfig
csky                             alldefconfig
powerpc                       eiger_defconfig
powerpc                        cell_defconfig
microblaze                      mmu_defconfig
powerpc                      ep88xc_defconfig
powerpc                 mpc8540_ads_defconfig
arc                          axs103_defconfig
arc                                 defconfig
m68k                          sun3x_defconfig
mips                      maltasmvp_defconfig
powerpc                      bamboo_defconfig
mips                        jmr3927_defconfig
arm                         at91_dt_defconfig
arc                      axs103_smp_defconfig
mips                           jazz_defconfig
arm                             ezx_defconfig
arm                         nhk8815_defconfig
openrisc                         alldefconfig
mips                         db1xxx_defconfig
x86_64                           alldefconfig
xtensa                  nommu_kc705_defconfig
arm                       omap2plus_defconfig
mips                       capcella_defconfig
sh                        apsh4ad0a_defconfig
arm                            mps2_defconfig
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220130
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc                          allyesconfig
arm                             mxs_defconfig
arm                        spear3xx_defconfig
mips                        bcm63xx_defconfig
arm                       versatile_defconfig
arm                         orion5x_defconfig
mips                   sb1250_swarm_defconfig
mips                        omega2p_defconfig
powerpc                      katmai_defconfig
powerpc                    ge_imp3a_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r041-20220130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
