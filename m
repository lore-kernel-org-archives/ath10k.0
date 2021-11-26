Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B45C433EF
	for <ath10k@archiver.kernel.org>; Fri, 26 Nov 2021 23:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yJ+GhJ29PVUUJeiYBs2r4S+ZefxNItBxW7UCBBbHtr0=; b=NC/I5LGW0Ii68U
	BLQ+u98FOobdXdh44AT7SIrl5KSHtApAXaWL+3T4yaOmFL1VrrZfUZyw0uLRU3jo9TVNacZaa+pfT
	UkmBlzMsOY4PUR6kXuWYtnMfagZ08L4rgJV9la+Pp2JszVE3XF+FjpFPAX+lQcGgQgDAoxdOB/usf
	iDIYy+BFYlMN9eq6W/4LfPlaF7R7qfRmyIUOKI2Fd+go22xy+wAkzjGEEDjbJeFCt5hRD6oXfMW8d
	pRL+xRo3Oh+zcSFEJ67tC6aMqL/H2IGRwlHIe4MxmpkEtXhCDX2EGb1bVhOwzcA+bUcSuUgi3LBpH
	7kChNqAgiugkk9kSZ8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqkPF-00ByNC-FO; Fri, 26 Nov 2021 23:13:25 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqkPC-00ByMP-Ob
 for ath10k@lists.infradead.org; Fri, 26 Nov 2021 23:13:24 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="296526160"
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; d="scan'208";a="296526160"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 15:13:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; d="scan'208";a="510115531"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 26 Nov 2021 15:13:20 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqkP9-0008k2-QD; Fri, 26 Nov 2021 23:13:19 +0000
Date: Sat, 27 Nov 2021 07:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 bafe5e82c3a93012b77e88edefa14ee6f8c317c9
Message-ID: <61a169ec.q5WB8SbnFthTYVj2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_151322_910722_6D19288E 
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
branch HEAD: bafe5e82c3a93012b77e88edefa14ee6f8c317c9  Revert "bus: mhi: Early MHI resume failure in non M3 state"

elapsed time: 722m

configs tested: 149
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211126
powerpc              randconfig-c003-20211126
mips                 randconfig-c004-20211126
i386                 randconfig-c001-20211125
sh                          rsk7269_defconfig
powerpc                    adder875_defconfig
sh                               j2_defconfig
powerpc                     akebono_defconfig
arm                         axm55xx_defconfig
arm                           omap1_defconfig
parisc                generic-32bit_defconfig
csky                                defconfig
sh                   secureedge5410_defconfig
powerpc                      ppc64e_defconfig
powerpc                     tqm8560_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          collie_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      chrp32_defconfig
arm                         hackkit_defconfig
arm                        clps711x_defconfig
sh                          rsk7203_defconfig
riscv                            alldefconfig
sparc                       sparc64_defconfig
powerpc                        warp_defconfig
arm                        mvebu_v7_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     tqm8540_defconfig
arm                       imx_v4_v5_defconfig
sh                         ap325rxa_defconfig
powerpc                      obs600_defconfig
arc                        nsim_700_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                       m5208evb_defconfig
riscv                               defconfig
arm                       aspeed_g4_defconfig
sh                          kfr2r09_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
powerpc                     ksi8560_defconfig
nds32                             allnoconfig
powerpc                      bamboo_defconfig
powerpc                     tqm8555_defconfig
microblaze                          defconfig
arm64                            alldefconfig
powerpc                     rainier_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     mpc5200_defconfig
sh                           se7722_defconfig
sh                          sdk7780_defconfig
arm                          pcm027_defconfig
powerpc                    gamecube_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     stx_gp3_defconfig
arm                              alldefconfig
m68k                         apollo_defconfig
m68k                        m5407c3_defconfig
arm                            pleb_defconfig
sh                            titan_defconfig
xtensa                    smp_lx200_defconfig
arm                         s3c6400_defconfig
sh                         microdev_defconfig
arm                  colibri_pxa270_defconfig
arm                  randconfig-c002-20211126
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
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
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a014-20211126
x86_64               randconfig-a011-20211126
x86_64               randconfig-a012-20211126
x86_64               randconfig-a016-20211126
x86_64               randconfig-a013-20211126
x86_64               randconfig-a015-20211126
i386                 randconfig-a016-20211126
i386                 randconfig-a015-20211126
i386                 randconfig-a012-20211126
i386                 randconfig-a013-20211126
i386                 randconfig-a014-20211126
i386                 randconfig-a011-20211126
arc                  randconfig-r043-20211126
s390                 randconfig-r044-20211126
riscv                randconfig-r042-20211126
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211126
i386                 randconfig-c001-20211126
powerpc              randconfig-c003-20211126
riscv                randconfig-c006-20211126
arm                  randconfig-c002-20211126
x86_64               randconfig-c007-20211126
mips                 randconfig-c004-20211126
x86_64               randconfig-a001-20211126
x86_64               randconfig-a003-20211126
x86_64               randconfig-a006-20211126
x86_64               randconfig-a004-20211126
x86_64               randconfig-a005-20211126
x86_64               randconfig-a002-20211126
i386                 randconfig-a002-20211126
i386                 randconfig-a001-20211126
i386                 randconfig-a005-20211126
i386                 randconfig-a006-20211126
i386                 randconfig-a004-20211126
i386                 randconfig-a003-20211126
hexagon              randconfig-r045-20211126
hexagon              randconfig-r041-20211126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
