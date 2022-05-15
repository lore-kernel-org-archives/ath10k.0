Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D2EC433EF
	for <ath10k@archiver.kernel.org>; Sun, 15 May 2022 06:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lYcE/1TfNPa5znPP26swy9pSTVw02hUsvJHVrJgvqe4=; b=LB9uzGcL7xEqpU
	Hn+8cpOWc2e4YyEb+JcvE+5sZtNPaIe0kH9ukoJ0wr6xC3hohsB4+dmol41ae0wNh/kPZA9QlBo4F
	ta9vBSrK2iKK3ndbPTSeTadaiCwxLpXBEYG4kZ7nACeNhpJowQcBjt+33OC7v8ifZ/I3cSmp6xUw2
	IPRwLnlAHqWneXF7Ex/ZONrZPFB0WijEeqVMxO6WhsEys/CPUDsRMnlIfqnBQ9//b7HjPTCzahc64
	+9CYdxbwe+JVwudOQGgDTjD7gmo+EY2sdBkjVgmhQLPSqhKGBFXZxy0gADLjSSGu+Ia+w9/cfLrtI
	YGS3CMZWi1zZj50a0GoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nq7fn-003Hup-Vg; Sun, 15 May 2022 06:24:12 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nq7fk-003Hu1-4p
 for ath10k@lists.infradead.org; Sun, 15 May 2022 06:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652595848; x=1684131848;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=thh/vtDjbkxhxWCAF1nufjl/YRHbTWMPRda3Um7wAeg=;
 b=hIXQm2nm334s2KZKAYnkkqC2KPPdsVJyBdof+7y7tY5aUNxlY9XL5//K
 kxAU3/at7AA2Vem8rxEcbPimKRwNmTRZQ2GGzYfPOyRhezh3SIiGa4qJE
 UXdm8QKetzDqh8Tsyp6PJhwW67C3Z9MuXuqp8xdbieHwJNDn325W+hQs/
 LEyU0S/mEIuPr9DnAjBv8NRI3xA7M+iX6wJdbvUJnegTwugAL7pH0Easr
 HdWwkM43sKK6UyU6sQ8kXoopeyPBzwpOxK3a8nvgn8agbmxGcLa4K77u1
 xTseE8a+nrqepES8bYnBVZr3iEU/fKCZeK0nGcVww40bk+XRW4H0zEnbz g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="251115857"
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; d="scan'208";a="251115857"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2022 23:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,227,1647327600"; d="scan'208";a="712955562"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 14 May 2022 23:24:03 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nq7fe-0001NA-Nb;
 Sun, 15 May 2022 06:24:02 +0000
Date: Sun, 15 May 2022 14:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 48f30a42d008c85b29a860cda3aa266942409519
Message-ID: <62809c62.YpZWgKKrth7zy6Nu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_232408_292839_E5AB1192 
X-CRM114-Status: UNSURE (   5.10  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 48f30a42d008c85b29a860cda3aa266942409519  Merge branch 'ath-next' into ath-qca

elapsed time: 6575m

configs tested: 206
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
ia64                            zx1_defconfig
powerpc                       ppc64_defconfig
arm                       imx_v6_v7_defconfig
sh                           se7705_defconfig
xtensa                  cadence_csp_defconfig
arm                           stm32_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                     tqm8555_defconfig
arm                          iop32x_defconfig
arm                           h3600_defconfig
arm                         cm_x300_defconfig
powerpc                       eiger_defconfig
mips                           ci20_defconfig
sh                           se7721_defconfig
m68k                       m5275evb_defconfig
h8300                       h8s-sim_defconfig
sparc                            alldefconfig
powerpc                       maple_defconfig
arm                           viper_defconfig
sparc                       sparc32_defconfig
powerpc                      mgcoge_defconfig
arm                            pleb_defconfig
sh                   secureedge5410_defconfig
mips                     decstation_defconfig
sh                          sdk7780_defconfig
sh                         ecovec24_defconfig
sh                             sh03_defconfig
arc                        vdk_hs38_defconfig
riscv                               defconfig
powerpc                       holly_defconfig
mips                            ar7_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                        cerfcube_defconfig
powerpc                     stx_gp3_defconfig
arm64                            alldefconfig
m68k                          sun3x_defconfig
arc                      axs103_smp_defconfig
arm                        keystone_defconfig
parisc                           alldefconfig
powerpc                      makalu_defconfig
sh                          r7785rp_defconfig
sh                        apsh4ad0a_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      pcm030_defconfig
parisc                generic-32bit_defconfig
s390                       zfcpdump_defconfig
arm                        shmobile_defconfig
sh                               alldefconfig
mips                  maltasmvp_eva_defconfig
sh                        sh7763rdp_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
ia64                                defconfig
m68k                             alldefconfig
openrisc                            defconfig
sh                          lboxre2_defconfig
powerpc                    sam440ep_defconfig
powerpc                      chrp32_defconfig
ia64                      gensparse_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                       m5208evb_defconfig
arm                       omap2plus_defconfig
arm                         assabet_defconfig
sh                           se7751_defconfig
arm                            zeus_defconfig
mips                            gpr_defconfig
arm                        trizeps4_defconfig
sh                         apsh4a3a_defconfig
sh                                  defconfig
arm                           corgi_defconfig
sh                        sh7785lcr_defconfig
m68k                       m5249evb_defconfig
arc                           tb10x_defconfig
arc                            hsdk_defconfig
arc                        nsim_700_defconfig
ia64                         bigsur_defconfig
m68k                          atari_defconfig
arm                         lpc18xx_defconfig
sh                           se7343_defconfig
arc                     haps_hs_smp_defconfig
arm                         s3c6400_defconfig
mips                         mpc30x_defconfig
x86_64               randconfig-c001-20220509
i386                 randconfig-c001-20220509
arm                  randconfig-c002-20220509
x86_64                        randconfig-c001
arm                  randconfig-c002-20220512
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a015-20220509
x86_64               randconfig-a012-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a014-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a012-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
s390                 randconfig-r044-20220512
riscv                randconfig-r042-20220512
arc                  randconfig-r043-20220512
s390                 randconfig-r044-20220510
riscv                randconfig-r042-20220510
arc                  randconfig-r043-20220510
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
mips                 randconfig-c004-20220512
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220512
arm                  randconfig-c002-20220512
s390                 randconfig-c005-20220512
i386                          randconfig-c001
riscv                randconfig-c006-20220512
arm                       versatile_defconfig
powerpc                     tqm5200_defconfig
powerpc                          allyesconfig
arm                  colibri_pxa300_defconfig
arm                          pcm027_defconfig
mips                     loongson2k_defconfig
arm                       netwinder_defconfig
riscv                    nommu_virt_defconfig
arm                           spitz_defconfig
arm                     am200epdkit_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                  mpc885_ads_defconfig
mips                          ath79_defconfig
x86_64               randconfig-a006-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a003-20220509
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220509
hexagon              randconfig-r045-20220509

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
