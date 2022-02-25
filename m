Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09546C433EF
	for <ath10k@archiver.kernel.org>; Fri, 25 Feb 2022 04:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G2aJemdfYfXXCUfmm8NvKZ2GN1AlFCPmNbbZwqFvFb4=; b=D3jhTG5ZGFU0sZ
	zF7/uEWBFhxeAKeeFqyMSEronX5EML9uhaWxbOSeGwCz8Tid6AEwRrtlLrvXUkQ6XVOOVc6nwOF49
	KPzfZtCSNq54rHsAlNa6J7T6Iz8VP+i50miD8o9NB1Faz/pIiE4TdrUSoDEg1ra9cMC3Z2uSNfJ6a
	cKvLsdi016/zLznYYCySVmk4t9hJ6Y1O//MN4Nq6QCERzwVmglol6NHdnXAwsCYj6SQNHYScnuoKb
	13yzp4uYgO2MdSc75fQ+BSzx4KxYOF6sgHsrImorjXEq6ZYQs7mLpU+MehXpu7wNQ+ynMHc0BaYtG
	mBO9xb0TWW7RrNu10M4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNSQS-003JSP-B6; Fri, 25 Feb 2022 04:41:52 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNSQN-003JQI-Kk
 for ath10k@lists.infradead.org; Fri, 25 Feb 2022 04:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645764107; x=1677300107;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=SxWQku5A+z5qAhGABXv91xcHMx7yYbXy742VukiYZHI=;
 b=VeBRA67t9sDpZHFOT2im/O3fAiHdqWM73S6pFoCN/hVSbFxDdoKw7KG6
 jqK6icJUBQN+5UtettcV+DMlg+MY3P7Qwckb+F9VN0ZdAs6yMsS2BXDiK
 MM4r2Q4n1AYPWAhdej0jI3Et2+zuRwhOq4SqSYhu6D+SEOHwPw0q9YSi3
 M9NLJHg9b7KjHf8xfiEfu6yD9WDqNjML/LRUXuGYX2QM1Y0ETh5gzSa8x
 ripLKCkCyTB808MV5qpGb6BJJ2+f66J0Chraa/WVpLopESOtXJvPJaymq
 0FoWJG0AmYqFEDxQkzT5LM8HJ7sPKEGg3rR47VLA2AGMlCyqCXWIGTEY5 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252341291"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="252341291"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 20:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="509139514"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 24 Feb 2022 20:41:45 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nNSQL-0003rI-09; Fri, 25 Feb 2022 04:41:45 +0000
Date: Fri, 25 Feb 2022 12:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 35313606d5ffe932f3128d977514bac8fb85bfef
Message-ID: <62185dee.cZC+C47jq/gmTTnT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_204147_792982_7D43C759 
X-CRM114-Status: UNSURE (   4.67  )
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
branch HEAD: 35313606d5ffe932f3128d977514bac8fb85bfef  Merge branch 'pending' into master-pending

elapsed time: 729m

configs tested: 145
configs skipped: 4

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
powerpc              randconfig-c003-20220225
powerpc                    amigaone_defconfig
powerpc                      cm5200_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            zeus_defconfig
powerpc                       maple_defconfig
arm                        spear6xx_defconfig
powerpc                     sequoia_defconfig
microblaze                      mmu_defconfig
powerpc                  iss476-smp_defconfig
arm                         axm55xx_defconfig
nios2                            allyesconfig
xtensa                          iss_defconfig
powerpc                     mpc83xx_defconfig
ia64                            zx1_defconfig
powerpc                     stx_gp3_defconfig
sh                   sh7724_generic_defconfig
arc                     haps_hs_smp_defconfig
powerpc                        cell_defconfig
sh                           se7750_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc834x_mds_defconfig
sh                     magicpanelr2_defconfig
x86_64                              defconfig
sparc                               defconfig
m68k                          amiga_defconfig
mips                       bmips_be_defconfig
sh                            migor_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           se7712_defconfig
arm                          iop32x_defconfig
powerpc                       eiger_defconfig
sparc                            allyesconfig
powerpc                     asp8347_defconfig
powerpc                     tqm8555_defconfig
m68k                       m5275evb_defconfig
arm                         nhk8815_defconfig
arm                          gemini_defconfig
arm                         s3c6400_defconfig
arc                     nsimosci_hs_defconfig
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
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
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220224
arc                  randconfig-r043-20220224
arc                  randconfig-r043-20220223
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
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220224
x86_64                        randconfig-c007
arm                  randconfig-c002-20220224
mips                 randconfig-c004-20220224
i386                          randconfig-c001
riscv                randconfig-c006-20220224
powerpc              randconfig-c003-20220223
arm                  randconfig-c002-20220223
mips                 randconfig-c004-20220223
riscv                randconfig-c006-20220223
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
riscv                    nommu_virt_defconfig
arm                                 defconfig
arm                         hackkit_defconfig
powerpc                     tqm8560_defconfig
arm                         socfpga_defconfig
mips                           ip22_defconfig
arm                      tct_hammer_defconfig
powerpc                   lite5200b_defconfig
arm                          moxart_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220223
hexagon              randconfig-r041-20220223
riscv                randconfig-r042-20220223
hexagon              randconfig-r045-20220224
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220224
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
