Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AD6C433EF
	for <ath10k@archiver.kernel.org>; Sun, 15 May 2022 09:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KyuCQ5zvBTelUY6JqaNXGI6mULRBGJrtPeKqqAyxvHc=; b=LrZ+Q7kSDJd5sq
	iNF+rqDfg8hDyqOmoDYCe7mwwZn41cyR9XTX8dzvu+8dNGI29GT+lYOdlveR3+Tj7nG22ux+qP/jA
	GRwOduv8m8svIy/S1UDyN8B0enHxrKNnRLHBhKtebx+rJ3oHXm1P13MzDyExBWXzmHNN12B8F+gKE
	52X1R794dL+VDb4ImeEfJMpgWuJyvbeju3KxuPr9UCVSLCCItXo+VTN2q+JOCplAIawMc4l+SsvVw
	EbnOPN4APy+2oT9dZG66g0EV3GAO0kZ1SlmAcLHlbsk15wMMFfu8xE3N79TgCRLoX5iW5Fh6eEHTU
	Hho14KRDOTLbG4ngLANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqAMQ-003YSN-Pd; Sun, 15 May 2022 09:16:22 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqAMM-003YRV-J7
 for ath10k@lists.infradead.org; Sun, 15 May 2022 09:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652606178; x=1684142178;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=kqKahO2vZ8VsC2fP9GpgYdKCM7xVWXS+FeD7xEyzDxw=;
 b=jlMbM3NPKVF7/O9SwY1c35FO+U5t1iHHVqUvAPk43PMK8/2c2ZGWErht
 bWMSI89sI6JE2EO3OXMa2QI4bIj3ZNiLN8+EJXEsJvTHrShXvF3NeVZ/p
 XdcaVWXCgSrTdPqT3iE419XTHtWkbaUT+yIzZ9SQf29R2Mm9XbhcVwewj
 f/su0khzdEXl3zV7B8smKglBrp/nte4+B0TOcxmGldYegmwvHUK59LrJB
 9n9NOwbKz8ddY2aqRtGsOZStrrRSTzW0uaDcaGs4IjjIaikIyh90pCogt
 WpDOB8iw4ZIOgavxQJ1AsjRmd7waKp+djhEspHQDOOzRGH/99WeTGViSP A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="270738121"
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; d="scan'208";a="270738121"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2022 02:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; d="scan'208";a="604441113"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 15 May 2022 02:16:08 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nqAMC-0001UN-3G;
 Sun, 15 May 2022 09:16:08 +0000
Date: Sun, 15 May 2022 17:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 25c321e8534e9efe1869b548e7912faffed1f5be
Message-ID: <6280c4c6.0fspgpS7x7AfbsWX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_021618_740916_D94D5CA1 
X-CRM114-Status: UNSURE (   5.66  )
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
branch HEAD: 25c321e8534e9efe1869b548e7912faffed1f5be  ath11k: remove redundant assignment to variables vht_mcs and he_mcs

elapsed time: 6748m

configs tested: 302
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20220509
i386                          randconfig-c001
sh                               j2_defconfig
sh                         ap325rxa_defconfig
sh                      rts7751r2d1_defconfig
arm                       imx_v6_v7_defconfig
powerpc                       ppc64_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7705_defconfig
ia64                            zx1_defconfig
mips                       capcella_defconfig
sh                          rsk7269_defconfig
xtensa                         virt_defconfig
um                                  defconfig
m68k                       m5249evb_defconfig
sh                          urquell_defconfig
powerpc                       eiger_defconfig
mips                           xway_defconfig
powerpc                      pasemi_defconfig
arm                        mini2440_defconfig
arm                        multi_v7_defconfig
m68k                        m5272c3_defconfig
sh                          rsk7201_defconfig
arm                         at91_dt_defconfig
arm                       omap2plus_defconfig
ia64                             alldefconfig
sh                          rsk7203_defconfig
arm                        spear6xx_defconfig
h8300                            allyesconfig
arm                           h3600_defconfig
arm                          iop32x_defconfig
arm                         cm_x300_defconfig
parisc64                         alldefconfig
m68k                            mac_defconfig
powerpc                        warp_defconfig
powerpc                     taishan_defconfig
sh                          r7785rp_defconfig
sh                                  defconfig
powerpc                  storcenter_defconfig
mips                           ci20_defconfig
sh                           se7721_defconfig
m68k                       m5275evb_defconfig
arm                           stm32_defconfig
arm                       aspeed_g5_defconfig
powerpc                    sam440ep_defconfig
sh                           se7619_defconfig
h8300                       h8s-sim_defconfig
sparc                            alldefconfig
powerpc                       maple_defconfig
arm                           viper_defconfig
sparc64                             defconfig
nios2                            alldefconfig
arm                            zeus_defconfig
sh                           sh2007_defconfig
i386                                defconfig
m68k                             allmodconfig
sparc                       sparc32_defconfig
powerpc                      mgcoge_defconfig
arm                            pleb_defconfig
powerpc                     sequoia_defconfig
sh                          polaris_defconfig
sh                            hp6xx_defconfig
arc                         haps_hs_defconfig
mips                     decstation_defconfig
sh                          sdk7780_defconfig
sh                         ecovec24_defconfig
arm                        keystone_defconfig
openrisc                            defconfig
arm                          pxa910_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                        sh7763rdp_defconfig
sh                   sh7724_generic_defconfig
powerpc                mpc7448_hpc2_defconfig
h8300                    h8300h-sim_defconfig
nios2                            allyesconfig
sparc                       sparc64_defconfig
m68k                          multi_defconfig
s390                             allyesconfig
arm                         lpc18xx_defconfig
powerpc                 mpc8540_ads_defconfig
nios2                         10m50_defconfig
arm                        cerfcube_defconfig
powerpc                     stx_gp3_defconfig
arm64                            alldefconfig
m68k                          sun3x_defconfig
s390                                defconfig
arm                         lubbock_defconfig
openrisc                 simple_smp_defconfig
csky                                defconfig
s390                       zfcpdump_defconfig
arc                          axs103_defconfig
sh                           se7751_defconfig
parisc                           alldefconfig
arc                      axs103_smp_defconfig
m68k                       m5208evb_defconfig
powerpc                      pcm030_defconfig
sh                        apsh4ad0a_defconfig
sh                   rts7751r2dplus_defconfig
arm                           sunxi_defconfig
sh                         apsh4a3a_defconfig
xtensa                    xip_kc705_defconfig
mips                         tb0226_defconfig
powerpc                 canyonlands_defconfig
mips                            ar7_defconfig
xtensa                    smp_lx200_defconfig
sh                         microdev_defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
nios2                               defconfig
arm                          simpad_defconfig
ia64                         bigsur_defconfig
xtensa                       common_defconfig
sh                          kfr2r09_defconfig
sh                            migor_defconfig
powerpc                     tqm8555_defconfig
powerpc                      cm5200_defconfig
arm                            mps2_defconfig
parisc                generic-32bit_defconfig
alpha                            allyesconfig
arm                        shmobile_defconfig
sh                               alldefconfig
mips                  maltasmvp_eva_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
ia64                                defconfig
powerpc                      ppc6xx_defconfig
m68k                          amiga_defconfig
m68k                             alldefconfig
sh                          lboxre2_defconfig
mips                        bcm47xx_defconfig
arm                         axm55xx_defconfig
arm                           tegra_defconfig
sh                        sh7757lcr_defconfig
sh                           se7722_defconfig
arm                          exynos_defconfig
openrisc                  or1klitex_defconfig
sh                          r7780mp_defconfig
m68k                        stmark2_defconfig
m68k                       bvme6000_defconfig
sh                           se7206_defconfig
sh                            shmin_defconfig
xtensa                  nommu_kc705_defconfig
sh                     sh7710voipgw_defconfig
ia64                          tiger_defconfig
arm                         assabet_defconfig
mips                            gpr_defconfig
microblaze                          defconfig
powerpc                    adder875_defconfig
powerpc                         ps3_defconfig
ia64                      gensparse_defconfig
arm                          lpd270_defconfig
arc                           tb10x_defconfig
arc                            hsdk_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc834x_itx_defconfig
um                               alldefconfig
arc                    vdk_hs38_smp_defconfig
riscv                    nommu_k210_defconfig
sh                           se7724_defconfig
powerpc                     tqm8548_defconfig
arc                        nsim_700_defconfig
powerpc                      ep88xc_defconfig
powerpc                     tqm8541_defconfig
sh                           se7712_defconfig
openrisc                         alldefconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
arc                              allyesconfig
alpha                               defconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20220509
x86_64               randconfig-a012-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a014-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a012-20220509
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
arc                  randconfig-r043-20220512
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64               randconfig-c007-20220509
i386                 randconfig-c001-20220509
powerpc              randconfig-c003-20220509
riscv                randconfig-c006-20220509
mips                 randconfig-c004-20220509
arm                  randconfig-c002-20220509
s390                 randconfig-c005-20220509
powerpc              randconfig-c003-20220510
x86_64                        randconfig-c007
riscv                randconfig-c006-20220510
mips                 randconfig-c004-20220510
i386                          randconfig-c001
arm                  randconfig-c002-20220510
s390                 randconfig-c005-20220510
powerpc              randconfig-c003-20220512
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
arm                  randconfig-c002-20220512
s390                 randconfig-c005-20220512
mips                        bcm63xx_defconfig
powerpc                     tqm5200_defconfig
powerpc                          allyesconfig
arm                           omap1_defconfig
mips                     cu1830-neo_defconfig
powerpc                      acadia_defconfig
powerpc                    mvme5100_defconfig
arm                                 defconfig
arm                         socfpga_defconfig
powerpc                     akebono_defconfig
powerpc                     powernv_defconfig
powerpc                          allmodconfig
mips                       rbtx49xx_defconfig
mips                        maltaup_defconfig
mips                      maltaaprp_defconfig
mips                        omega2p_defconfig
arm                       netwinder_defconfig
powerpc                          g5_defconfig
powerpc                     tqm8560_defconfig
hexagon                             defconfig
powerpc                 xes_mpc85xx_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
arm                          ixp4xx_defconfig
powerpc                  mpc885_ads_defconfig
arm                         shannon_defconfig
arm                       aspeed_g4_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                          collie_defconfig
arm                          pxa168_defconfig
x86_64               randconfig-a006-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a003-20220509
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
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
hexagon              randconfig-r045-20220509
hexagon              randconfig-r041-20220509

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
