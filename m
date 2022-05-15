Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559FCC433F5
	for <ath10k@archiver.kernel.org>; Sun, 15 May 2022 10:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gydkXaoAYQgOW5Oa+hdXEoHjIgnm1CTHWIVJMlYhKfU=; b=2f24++ou36tqSM
	/E2HqjDNrDcLqg7a4rrsFMKTTk5KOs60g2sqd10nWbZm0fO4QE5qOQ8VxUlE22eCNqJjhhvVk1J++
	wV7DDa2lO/Ek77luIxbg1mLgeYvH5gR5BtcvoGj7PiBdgPI+BmqEj4d4xdKx7lBpjb0OVoJ4X/9Ic
	1Jx3g0z2lKGFF6Utbav3PJky3A+Fg0SywTuRBRexj9bvHojsWtYvi7Ms+e6yuciZuQHwzthFYNcqk
	ZI4ZM2k85NnzHhq3GLKvrUulwWUEhVN3Sw/LIdNlG0SzrZHwF56d+SSPe9F1/KPBIHQlA/f168R2X
	KXAd3zSJkuOBGj5oNrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqBbl-003lSn-ON; Sun, 15 May 2022 10:36:17 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqBbi-003lR0-Bh
 for ath10k@lists.infradead.org; Sun, 15 May 2022 10:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652610974; x=1684146974;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=uC1eYoAR2SnxmWyIHec5hw0WCsPtOBqn5jqCVhiosrE=;
 b=RkmOW1gwtZCWm/gO9Zgryrjvvqvv6tdd8VnjjaeRTCZ31v+PweBIV1iL
 0URYd65/mKk5OVX5iAXqOjQdBFRk0cNTMWLPp0JrMx1B/Pm+Blado41g+
 OvL96LG/aRtbBC4nTxV9ISPdFphTYWAEKqeKrdfkNcrtYGrFP67Oa0Z6M
 EwyHwbfoUiSKpP1AsL7Yo0XOT/hB0SKHvI8/6YEliC2jEoRT4WnVmbNmx
 csCHNNLBnXmTC5HPsfid3jAl5GzwidlocAdgnBtswac6MS35cWXeBNAJw
 3Yzb1J4F8N5j8fDO4IRSr7YBcE3ZZlyk1DBGPOYZhq1lh6kaiC8L6YHhN g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="269445714"
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; d="scan'208";a="269445714"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2022 03:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,228,1647327600"; d="scan'208";a="671953627"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 15 May 2022 03:36:11 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nqBbe-0001XR-V0;
 Sun, 15 May 2022 10:36:10 +0000
Date: Sun, 15 May 2022 18:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 e07fc768e2dc215bcbedc82cbae38401fdf9f727
Message-ID: <6280d781.p2NDQ/XIXaeJwbKu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_033614_500448_667C8F73 
X-CRM114-Status: UNSURE (   5.47  )
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
branch HEAD: e07fc768e2dc215bcbedc82cbae38401fdf9f727  Merge branch 'pending' into master-pending

elapsed time: 6757m

configs tested: 323
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
arm                       imx_v6_v7_defconfig
powerpc                       ppc64_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7705_defconfig
ia64                            zx1_defconfig
arm                           stm32_defconfig
csky                                defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                     tqm8555_defconfig
arm                          simpad_defconfig
arm                        cerfcube_defconfig
sh                          r7785rp_defconfig
sh                          urquell_defconfig
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
mips                             allyesconfig
mips                         tb0226_defconfig
arm                       omap2plus_defconfig
ia64                             alldefconfig
sh                          rsk7203_defconfig
arm                        spear6xx_defconfig
h8300                            allyesconfig
arm                           h3600_defconfig
arm                          iop32x_defconfig
arm                         cm_x300_defconfig
sh                        sh7763rdp_defconfig
arm                         axm55xx_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc8540_ads_defconfig
parisc64                         alldefconfig
m68k                            mac_defconfig
powerpc                        warp_defconfig
powerpc                     taishan_defconfig
sh                                  defconfig
powerpc                  storcenter_defconfig
mips                           ci20_defconfig
sh                           se7721_defconfig
h8300                       h8s-sim_defconfig
sparc                            alldefconfig
powerpc                       maple_defconfig
arm                           viper_defconfig
sparc64                             defconfig
nios2                            alldefconfig
arm                            zeus_defconfig
sparc                       sparc32_defconfig
powerpc                      mgcoge_defconfig
arm                            pleb_defconfig
xtensa                         virt_defconfig
m68k                            q40_defconfig
arm                        keystone_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-64bit_defconfig
sh                   secureedge5410_defconfig
arc                                 defconfig
mips                             allmodconfig
mips                     decstation_defconfig
sh                          sdk7780_defconfig
sh                         ecovec24_defconfig
ia64                          tiger_defconfig
m68k                           sun3_defconfig
openrisc                            defconfig
arm                          pxa910_defconfig
sparc64                          alldefconfig
sh                   sh7724_generic_defconfig
powerpc                mpc7448_hpc2_defconfig
h8300                    h8300h-sim_defconfig
nios2                            allyesconfig
sparc                       sparc64_defconfig
m68k                          multi_defconfig
mips                            ar7_defconfig
powerpc                       holly_defconfig
arm                        trizeps4_defconfig
powerpc                     stx_gp3_defconfig
arm64                            alldefconfig
m68k                          sun3x_defconfig
riscv                               defconfig
arc                     haps_hs_smp_defconfig
m68k                        mvme16x_defconfig
powerpc                      makalu_defconfig
m68k                       m5208evb_defconfig
powerpc                      pcm030_defconfig
mips                       capcella_defconfig
nios2                         10m50_defconfig
sh                        apsh4ad0a_defconfig
sh                   rts7751r2dplus_defconfig
nios2                         3c120_defconfig
m68k                       bvme6000_defconfig
xtensa                    smp_lx200_defconfig
sh                         microdev_defconfig
powerpc                      bamboo_defconfig
arc                        nsim_700_defconfig
arm                     eseries_pxa_defconfig
sh                 kfr2r09-romimage_defconfig
i386                             alldefconfig
ia64                         bigsur_defconfig
m68k                        mvme147_defconfig
arm                             ezx_defconfig
sh                          lboxre2_defconfig
sh                          rsk7201_defconfig
powerpc                      cm5200_defconfig
arm                            mps2_defconfig
parisc                generic-32bit_defconfig
alpha                            allyesconfig
s390                       zfcpdump_defconfig
arm                        shmobile_defconfig
sh                               alldefconfig
mips                  maltasmvp_eva_defconfig
powerpc                    adder875_defconfig
arm                            qcom_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                           allnoconfig
powerpc                        cell_defconfig
ia64                                defconfig
xtensa                          iss_defconfig
arm                         nhk8815_defconfig
m68k                             alldefconfig
m68k                          atari_defconfig
arm                           tegra_defconfig
sh                        sh7757lcr_defconfig
arm                        oxnas_v6_defconfig
mips                           gcw0_defconfig
powerpc                    sam440ep_defconfig
powerpc                      chrp32_defconfig
powerpc                 mpc834x_mds_defconfig
arc                      axs103_smp_defconfig
arm                        clps711x_defconfig
arc                     nsimosci_hs_defconfig
sh                  sh7785lcr_32bit_defconfig
xtensa                  nommu_kc705_defconfig
mips                 decstation_r4k_defconfig
openrisc                  or1klitex_defconfig
sh                           se7751_defconfig
arm                         assabet_defconfig
mips                            gpr_defconfig
sh                         apsh4a3a_defconfig
arm                           corgi_defconfig
sh                        sh7785lcr_defconfig
powerpc                    amigaone_defconfig
sh                          landisk_defconfig
m68k                       m5249evb_defconfig
arc                           tb10x_defconfig
arc                            hsdk_defconfig
arm                         lpc18xx_defconfig
sh                           se7343_defconfig
powerpc                         wii_defconfig
um                                  defconfig
arc                        nsimosci_defconfig
sh                           se7750_defconfig
arc                          axs101_defconfig
arm                         s3c6400_defconfig
mips                         mpc30x_defconfig
arm                        realview_defconfig
mips                     loongson1b_defconfig
powerpc                  iss476-smp_defconfig
sh                          sdk7786_defconfig
sh                          rsk7264_defconfig
sh                            hp6xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                     tqm8541_defconfig
sh                          r7780mp_defconfig
mips                       bmips_be_defconfig
x86_64               randconfig-c001-20220509
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
alpha                               defconfig
xtensa                           allyesconfig
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
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a012-20220509
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
riscv                    nommu_k210_defconfig
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
powerpc              randconfig-c003-20220512
x86_64                        randconfig-c007
riscv                randconfig-c006-20220512
mips                 randconfig-c004-20220512
i386                          randconfig-c001
arm                  randconfig-c002-20220512
x86_64               randconfig-c007-20220509
i386                 randconfig-c001-20220509
powerpc              randconfig-c003-20220509
riscv                randconfig-c006-20220509
mips                 randconfig-c004-20220509
arm                  randconfig-c002-20220509
s390                 randconfig-c005-20220509
mips                        bcm63xx_defconfig
powerpc                     tqm5200_defconfig
powerpc                          allyesconfig
powerpc                      acadia_defconfig
mips                     loongson2k_defconfig
powerpc                      ppc64e_defconfig
x86_64                           allyesconfig
arm                         orion5x_defconfig
arm                         socfpga_defconfig
arm                      pxa255-idp_defconfig
arm                  colibri_pxa270_defconfig
arm                        magician_defconfig
arm                       netwinder_defconfig
riscv                    nommu_virt_defconfig
arm                           spitz_defconfig
mips                  cavium_octeon_defconfig
powerpc                     tqm8540_defconfig
riscv                             allnoconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc8272_ads_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
arm                          ixp4xx_defconfig
mips                           ip27_defconfig
arm                        mvebu_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                          moxart_defconfig
powerpc                   lite5200b_defconfig
powerpc                  mpc885_ads_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      ppc44x_defconfig
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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
