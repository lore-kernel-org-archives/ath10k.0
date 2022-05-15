Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A6FC433EF
	for <ath10k@archiver.kernel.org>; Sun, 15 May 2022 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xBhEhHo8H+2XBPhDdC2o6lXYtNG8NiqoQ6hvcAR2+Ro=; b=xCmSDvqqA9MLov
	Ly4yaS7ZiZA4pbZCvqgZTKQl9yyYOuU7XrnhPdHdA+Tuc4fsSdSeaheh8YIzmMaMci6WBvAqxvoiQ
	ViGRo+PAYlPufC6LkB30EW4MlIMT13V6MQT3Zu8LPuPG9JwXYjqg5QQ+JJZLGzsjZrXOVOc30X4L9
	ivmvPxksAtszbRs4/952AP+9hurR9IUsibeSsceAZNQOrrFspW4gkXleJ74mW4QdnedQraTlSwHOr
	JpEuFI/i/T1QqLNaahMDncldMsMLHure18WR5Yna87KmOYfU2EIwJRiRl25U7EkPqa5HzXsFUVR+v
	vL8ZKeEK8P636zJj4GDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqCjy-003vPj-0R; Sun, 15 May 2022 11:48:50 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqCjt-003vPG-SZ
 for ath10k@lists.infradead.org; Sun, 15 May 2022 11:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652615325; x=1684151325;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=0YAbvnMYfkIyru0bC96GwsQ+Aitfz6EIe6aXXYmsJPM=;
 b=Ykf2/GWGZQTMNsUGtgZ2I0ID4dUWaL4w+P1B7v0FyGHD0UmQ/OzAcfSR
 eGoXeXYelIcFbjUyqHfnanJvSWapq3eWK611wAWat0BQCCmV7dMVFIKx5
 uvA+cs2IcPK8p6B/wj/KK9kRfcM6tf49KQ/JT5633/WpJG4StZg7Rg/Hy
 Ilh4IW4vrhLUoBuSS7XMZL6nPGKC4lm0sQdHb2Mbbww7dO5oKuwusrF5o
 wOo4gOeDxSEuKVPPHIGWlOEpZKim7a0LCFEDZX5lw6EUwmd7zrp04Yqy6
 W8mBbaDMVIPQmtvaa3dzT+DfMzDNUADLp9SWErnZPWQxDExXn64/J9mwj g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="357033289"
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; d="scan'208";a="357033289"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2022 04:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; d="scan'208";a="699138012"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 15 May 2022 04:48:40 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nqCjm-0001an-Pf;
 Sun, 15 May 2022 11:48:38 +0000
Date: Sun, 15 May 2022 19:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 14c24bc11b43da59fe41d79d3c1b29decc3d21f3
Message-ID: <6280e85a.NFe7NOcTA9bT9MOI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_044846_036310_48231A1E 
X-CRM114-Status: UNSURE (   3.80  )
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
branch HEAD: 14c24bc11b43da59fe41d79d3c1b29decc3d21f3  Add localversion-wireless-testing-ath

elapsed time: 6899m

configs tested: 412
configs skipped: 6

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
arm                         lpc18xx_defconfig
sh                          rsk7269_defconfig
mips                          rb532_defconfig
powerpc                 mpc834x_mds_defconfig
s390                                defconfig
powerpc                  storcenter_defconfig
arm                         nhk8815_defconfig
arm                           stm32_defconfig
csky                                defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                     tqm8555_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                       bmips_be_defconfig
powerpc64                           defconfig
sh                        edosk7760_defconfig
arc                          axs101_defconfig
h8300                       h8s-sim_defconfig
xtensa                generic_kc705_defconfig
powerpc                      arches_defconfig
mips                           ip32_defconfig
arm                          simpad_defconfig
arm                        cerfcube_defconfig
sh                          r7785rp_defconfig
sh                          urquell_defconfig
mips                       capcella_defconfig
xtensa                         virt_defconfig
um                                  defconfig
m68k                       m5249evb_defconfig
ia64                         bigsur_defconfig
arm                            pleb_defconfig
xtensa                          iss_defconfig
xtensa                  audio_kc705_defconfig
xtensa                           alldefconfig
m68k                       m5275evb_defconfig
ia64                      gensparse_defconfig
xtensa                    xip_kc705_defconfig
h8300                     edosk2674_defconfig
arm                            hisi_defconfig
mips                        bcm47xx_defconfig
sh                              ul2_defconfig
sh                           se7712_defconfig
powerpc                       eiger_defconfig
mips                           xway_defconfig
powerpc                      pasemi_defconfig
arm                        mini2440_defconfig
arm                        multi_v7_defconfig
m68k                        m5272c3_defconfig
sh                          rsk7201_defconfig
arm                         at91_dt_defconfig
arc                        nsim_700_defconfig
powerpc                 linkstation_defconfig
mips                             allyesconfig
mips                         tb0226_defconfig
arm                       omap2plus_defconfig
ia64                             alldefconfig
sh                          rsk7203_defconfig
arm                        spear6xx_defconfig
arm                          iop32x_defconfig
arm                         cm_x300_defconfig
arm                           h3600_defconfig
um                               alldefconfig
xtensa                  cadence_csp_defconfig
sh                        sh7763rdp_defconfig
arm                         axm55xx_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc8540_ads_defconfig
parisc64                         alldefconfig
m68k                            mac_defconfig
powerpc                        warp_defconfig
powerpc                     taishan_defconfig
sh                                  defconfig
sparc                       sparc64_defconfig
arm                       aspeed_g5_defconfig
ia64                        generic_defconfig
xtensa                  nommu_kc705_defconfig
mips                           ci20_defconfig
sh                           se7721_defconfig
powerpc                    sam440ep_defconfig
sh                           se7619_defconfig
sparc                            alldefconfig
powerpc                       maple_defconfig
arm                           viper_defconfig
sparc64                             defconfig
nios2                            alldefconfig
arm                            zeus_defconfig
sh                           sh2007_defconfig
i386                                defconfig
sparc                       sparc32_defconfig
powerpc                      mgcoge_defconfig
sh                          polaris_defconfig
sh                            hp6xx_defconfig
arc                         haps_hs_defconfig
m68k                            q40_defconfig
arm                        keystone_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
sh                   secureedge5410_defconfig
arc                                 defconfig
mips                             allmodconfig
arm                       imx_v6_v7_defconfig
mips                     decstation_defconfig
sh                          sdk7780_defconfig
sh                         ecovec24_defconfig
ia64                            zx1_defconfig
ia64                          tiger_defconfig
m68k                           sun3_defconfig
openrisc                            defconfig
arm                          pxa910_defconfig
arm                        realview_defconfig
arm                         vf610m4_defconfig
sh                        sh7785lcr_defconfig
openrisc                    or1ksim_defconfig
sh                             sh03_defconfig
arc                        vdk_hs38_defconfig
powerpc                       holly_defconfig
sh                   sh7724_generic_defconfig
powerpc                mpc7448_hpc2_defconfig
h8300                    h8300h-sim_defconfig
nios2                            allyesconfig
m68k                          multi_defconfig
s390                             allyesconfig
nios2                         10m50_defconfig
openrisc                 simple_smp_defconfig
mips                  maltasmvp_eva_defconfig
mips                            ar7_defconfig
arm                        trizeps4_defconfig
sparc                               defconfig
sh                           se7750_defconfig
arm                          exynos_defconfig
powerpc                     stx_gp3_defconfig
arm64                            alldefconfig
m68k                          sun3x_defconfig
arm                         lubbock_defconfig
s390                       zfcpdump_defconfig
arc                          axs103_defconfig
riscv                               defconfig
arc                     haps_hs_smp_defconfig
m68k                        mvme16x_defconfig
sh                           se7751_defconfig
parisc                           alldefconfig
arc                      axs103_smp_defconfig
arm                           h5000_defconfig
powerpc64                        alldefconfig
mips                      loongson3_defconfig
m68k                       bvme6000_defconfig
powerpc                      makalu_defconfig
arc                    vdk_hs38_smp_defconfig
sh                        apsh4ad0a_defconfig
sh                   rts7751r2dplus_defconfig
nios2                         3c120_defconfig
arm                           sunxi_defconfig
sh                         apsh4a3a_defconfig
powerpc                 canyonlands_defconfig
sh                         microdev_defconfig
xtensa                    smp_lx200_defconfig
powerpc                      bamboo_defconfig
arm                     eseries_pxa_defconfig
sh                 kfr2r09-romimage_defconfig
i386                             alldefconfig
m68k                        mvme147_defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
nios2                               defconfig
xtensa                       common_defconfig
m68k                             allmodconfig
powerpc                 mpc837x_mds_defconfig
m68k                       m5208evb_defconfig
powerpc                     rainier_defconfig
arm                             ezx_defconfig
sh                          lboxre2_defconfig
sh                          kfr2r09_defconfig
sh                            migor_defconfig
sh                           se7206_defconfig
sh                             shx3_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                            mps2_defconfig
powerpc                      cm5200_defconfig
powerpc                      pcm030_defconfig
parisc                generic-32bit_defconfig
alpha                            allyesconfig
arm                        shmobile_defconfig
sh                               alldefconfig
powerpc                    adder875_defconfig
arm                            qcom_defconfig
powerpc                           allnoconfig
powerpc                        cell_defconfig
ia64                                defconfig
m68k                         amcore_defconfig
sh                            titan_defconfig
powerpc                      ppc6xx_defconfig
m68k                          amiga_defconfig
m68k                             alldefconfig
m68k                          atari_defconfig
parisc                           allyesconfig
arm                           tegra_defconfig
sh                        sh7757lcr_defconfig
sh                           se7722_defconfig
openrisc                  or1klitex_defconfig
arm                        oxnas_v6_defconfig
sh                          r7780mp_defconfig
m68k                        stmark2_defconfig
powerpc                      chrp32_defconfig
sh                            shmin_defconfig
sh                     sh7710voipgw_defconfig
arm                        clps711x_defconfig
arc                     nsimosci_hs_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                 decstation_r4k_defconfig
arm                         assabet_defconfig
mips                            gpr_defconfig
microblaze                          defconfig
powerpc                      ep88xc_defconfig
powerpc                   currituck_defconfig
arm                           corgi_defconfig
powerpc                    amigaone_defconfig
sh                          landisk_defconfig
powerpc                       ppc64_defconfig
powerpc                         ps3_defconfig
arm                          lpd270_defconfig
arc                           tb10x_defconfig
arc                            hsdk_defconfig
sh                           se7343_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc834x_itx_defconfig
arm                             rpc_defconfig
powerpc                         wii_defconfig
arc                        nsimosci_defconfig
arm                         s3c6400_defconfig
mips                         mpc30x_defconfig
microblaze                      mmu_defconfig
m68k                       m5475evb_defconfig
mips                     loongson1b_defconfig
riscv                    nommu_k210_defconfig
sh                           se7724_defconfig
powerpc                     tqm8548_defconfig
openrisc                         alldefconfig
sh                          sdk7786_defconfig
sh                          rsk7264_defconfig
powerpc                     tqm8541_defconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
x86_64                        randconfig-c001
arm                  randconfig-c002-20220512
ia64                             allyesconfig
ia64                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
alpha                               defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
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
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
s390                 randconfig-r044-20220512
riscv                randconfig-r042-20220512
arc                  randconfig-r043-20220512
arc                  randconfig-r043-20220513
s390                 randconfig-r044-20220510
riscv                randconfig-r042-20220510
arc                  randconfig-r043-20220510
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
s390                 randconfig-c005-20220512
powerpc              randconfig-c003-20220512
x86_64                        randconfig-c007
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
i386                          randconfig-c001
arm                  randconfig-c002-20220512
powerpc              randconfig-c003-20220510
riscv                randconfig-c006-20220510
mips                 randconfig-c004-20220510
arm                  randconfig-c002-20220510
mips                        bcm63xx_defconfig
powerpc                     tqm5200_defconfig
powerpc                          allyesconfig
arm                           omap1_defconfig
mips                     cu1830-neo_defconfig
powerpc                      acadia_defconfig
arm                  colibri_pxa300_defconfig
arm                          pcm027_defconfig
powerpc                    mvme5100_defconfig
arm                                 defconfig
powerpc                      ppc64e_defconfig
x86_64                           allyesconfig
arm                         orion5x_defconfig
arm                         socfpga_defconfig
powerpc                     akebono_defconfig
powerpc                     powernv_defconfig
powerpc                          allmodconfig
mips                       rbtx49xx_defconfig
mips                        maltaup_defconfig
mips                      maltaaprp_defconfig
arm                      pxa255-idp_defconfig
arm                  colibri_pxa270_defconfig
arm                        magician_defconfig
mips                        omega2p_defconfig
arm                       netwinder_defconfig
riscv                    nommu_virt_defconfig
arm                           spitz_defconfig
powerpc                          g5_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     pseries_defconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm8540_defconfig
riscv                             allnoconfig
powerpc                     tqm8560_defconfig
hexagon                             defconfig
arm                         palmz72_defconfig
mips                           ip28_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 mpc8272_ads_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
arm                          ixp4xx_defconfig
arm                          collie_defconfig
arm                       versatile_defconfig
powerpc                     ppa8548_defconfig
powerpc                        fsp2_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      pmac32_defconfig
arm                        mvebu_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          moxart_defconfig
powerpc                   lite5200b_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      ppc44x_defconfig
arm                       aspeed_g4_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                          pxa168_defconfig
powerpc                   bluestone_defconfig
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
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220512
hexagon              randconfig-r041-20220512
hexagon              randconfig-r045-20220509
hexagon              randconfig-r041-20220509
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
