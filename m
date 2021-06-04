Return-Path: <SRS0=VQBF=K6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA538C4708F
	for <ath10k@archiver.kernel.org>; Fri,  4 Jun 2021 06:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9993E6121D
	for <ath10k@archiver.kernel.org>; Fri,  4 Jun 2021 06:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9993E6121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XxCG/YxNaGYPGXCdlfB1Hqzy5SR7zcehQd7waOmPXZo=; b=vw92/Cnp8/mC4F
	DmxOmQZVs/S8JiBxE2j2fjNeaSR553kon/yDjIM+KI8fRg63W6ErLXGTymp8tspCj6Puf9SA/xiUs
	FLZAtgqfS9tEm7fgbtSaz3ZCVVnMRsK5DfyureklM41VRB/cx3hbb7O+mF/3E7ZqRslY2bc1juaAo
	pCoyqgG4mSyJiTunsYzmbhE1aSw94KImSgxdw0z6bT8ldB7gw5BqY2oh9vTHq61GBh8RMZ6zFFM1m
	SQrsAsmVXYuIVjsa+eIwuTfvKrARuJOFopI6m5hgcqFCN8OWSOOTRg0X0WRMYoETk5FhidKYpCYJk
	lblwDSpn/vkT6dqg6glA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp3Fd-00Bk3e-GW; Fri, 04 Jun 2021 06:24:13 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp3FY-00Bk0K-By
 for ath10k@lists.infradead.org; Fri, 04 Jun 2021 06:24:10 +0000
IronPort-SDR: bfKBcG2WVUa3YaeP3ouj2fSLGAKhpaJnPwmyOVSGQj8o7xW7P4jFCtbf65GejzPmhw4FxwnbH9
 pCbipmeLvuXQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204259620"
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; d="scan'208";a="204259620"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 23:24:05 -0700
IronPort-SDR: G0nDHRZrnltZ0NSBhzuM9mknFD0ulvhAg2SNo1eU3UZKYd4h2Tw1CpybbFR7YS+Qoc3dsPQ2Dy
 U4TJtRCkpiGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; d="scan'208";a="400856086"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 03 Jun 2021 23:24:04 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lp3FT-0006j9-U9; Fri, 04 Jun 2021 06:24:03 +0000
Date: Fri, 04 Jun 2021 14:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:ath-next] BUILD SUCCESS
 238ebd8b487b7fc995284e9580257801f2c76aa5
Message-ID: <60b9c6f6.nIojmpddRRbemJBC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_232408_521466_A8BEC486 
X-CRM114-Status: UNSURE (   4.19  )
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
branch HEAD: 238ebd8b487b7fc995284e9580257801f2c76aa5  ath9k: ar9003_mac: read STBC indicator from rx descriptor

elapsed time: 6980m

configs tested: 287
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arc                          axs101_defconfig
powerpc64                           defconfig
powerpc                    klondike_defconfig
arm                          badge4_defconfig
arm                           viper_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     powernv_defconfig
mips                        omega2p_defconfig
mips                        maltaup_defconfig
arm                           stm32_defconfig
arm                          ixp4xx_defconfig
h8300                       h8s-sim_defconfig
powerpc                 linkstation_defconfig
sh                          sdk7786_defconfig
powerpc                  storcenter_defconfig
arm                          pxa3xx_defconfig
xtensa                    xip_kc705_defconfig
parisc                           alldefconfig
m68k                       bvme6000_defconfig
microblaze                          defconfig
ia64                             allmodconfig
sh                          rsk7203_defconfig
powerpc                    adder875_defconfig
h8300                               defconfig
arm                          collie_defconfig
m68k                        m5307c3_defconfig
xtensa                           allyesconfig
nios2                               defconfig
powerpc                      tqm8xx_defconfig
riscv                    nommu_k210_defconfig
arm                          iop32x_defconfig
powerpc                       eiger_defconfig
arc                        vdk_hs38_defconfig
arc                            hsdk_defconfig
s390                             allmodconfig
arm                        vexpress_defconfig
m68k                        m5272c3_defconfig
arm                         cm_x300_defconfig
sh                          urquell_defconfig
mips                malta_qemu_32r6_defconfig
arm                       netwinder_defconfig
arm                        mvebu_v7_defconfig
powerpc                    gamecube_defconfig
arm                            qcom_defconfig
m68k                          sun3x_defconfig
sh                            shmin_defconfig
mips                 decstation_r4k_defconfig
powerpc                      pasemi_defconfig
arm                         s3c2410_defconfig
powerpc64                        alldefconfig
powerpc                        icon_defconfig
m68k                          hp300_defconfig
sh                            titan_defconfig
m68k                           sun3_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                          allyesconfig
arm                         s3c6400_defconfig
arm                        cerfcube_defconfig
microblaze                      mmu_defconfig
powerpc                      ppc44x_defconfig
m68k                            q40_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                          atari_defconfig
powerpc                   currituck_defconfig
riscv                            allyesconfig
arm                      pxa255-idp_defconfig
sh                         ecovec24_defconfig
sh                 kfr2r09-romimage_defconfig
alpha                            alldefconfig
sh                           se7751_defconfig
mips                           xway_defconfig
arm                       mainstone_defconfig
mips                          malta_defconfig
powerpc                     tqm8540_defconfig
sh                            migor_defconfig
arm                         orion5x_defconfig
arm                          pcm027_defconfig
x86_64                           alldefconfig
arm                           sunxi_defconfig
powerpc                      chrp32_defconfig
powerpc                  mpc866_ads_defconfig
arm                         bcm2835_defconfig
powerpc                      mgcoge_defconfig
arm                            pleb_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     ep8248e_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc836x_mds_defconfig
s390                          debug_defconfig
sh                           se7206_defconfig
nds32                             allnoconfig
i386                                defconfig
sh                          rsk7264_defconfig
powerpc                      ppc40x_defconfig
openrisc                            defconfig
mips                           ip32_defconfig
sh                           se7619_defconfig
mips                        nlm_xlp_defconfig
arm                          imote2_defconfig
sh                           se7750_defconfig
powerpc                     tqm8541_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                           se7712_defconfig
nios2                         10m50_defconfig
sh                   sh7770_generic_defconfig
arm                         lpc32xx_defconfig
mips                      loongson3_defconfig
s390                       zfcpdump_defconfig
powerpc                    socrates_defconfig
arm                           spitz_defconfig
mips                    maltaup_xpa_defconfig
nios2                            alldefconfig
mips                         bigsur_defconfig
arm                          ep93xx_defconfig
xtensa                  audio_kc705_defconfig
riscv                               defconfig
mips                  cavium_octeon_defconfig
nds32                               defconfig
s390                             alldefconfig
m68k                        mvme147_defconfig
m68k                             allmodconfig
powerpc                       holly_defconfig
powerpc                     tqm8555_defconfig
arm                        neponset_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          r7780mp_defconfig
arm                         nhk8815_defconfig
mips                           mtx1_defconfig
powerpc                     sbc8548_defconfig
arm                     am200epdkit_defconfig
ia64                            zx1_defconfig
powerpc                     ksi8560_defconfig
sparc                            alldefconfig
arm                         mv78xx0_defconfig
h8300                    h8300h-sim_defconfig
xtensa                       common_defconfig
mips                            ar7_defconfig
mips                      bmips_stb_defconfig
arm                  colibri_pxa270_defconfig
m68k                         apollo_defconfig
m68k                       m5249evb_defconfig
sh                        dreamcast_defconfig
um                            kunit_defconfig
arm                         at91_dt_defconfig
mips                      malta_kvm_defconfig
riscv                            alldefconfig
openrisc                 simple_smp_defconfig
arm                    vt8500_v6_v7_defconfig
mips                        workpad_defconfig
sh                               allmodconfig
arm                        mini2440_defconfig
mips                            e55_defconfig
m68k                        mvme16x_defconfig
mips                            gpr_defconfig
mips                   sb1250_swarm_defconfig
arm                            mps2_defconfig
sh                           se7721_defconfig
arm                       imx_v4_v5_defconfig
sparc64                          alldefconfig
sh                        sh7757lcr_defconfig
arm                           corgi_defconfig
xtensa                              defconfig
powerpc                     ppa8548_defconfig
parisc                generic-32bit_defconfig
sh                           sh2007_defconfig
sh                          lboxre2_defconfig
sh                        sh7763rdp_defconfig
powerpc                       ppc64_defconfig
arc                              alldefconfig
mips                        nlm_xlr_defconfig
mips                         rt305x_defconfig
xtensa                    smp_lx200_defconfig
arm                            hisi_defconfig
x86_64                            allnoconfig
arm                          gemini_defconfig
powerpc                     tqm5200_defconfig
powerpc                 canyonlands_defconfig
sh                          rsk7269_defconfig
nios2                            allyesconfig
arm                  colibri_pxa300_defconfig
arm64                            alldefconfig
riscv             nommu_k210_sdcard_defconfig
mips                       rbtx49xx_defconfig
powerpc                   bluestone_defconfig
arm                      footbridge_defconfig
powerpc                     kilauea_defconfig
mips                           rs90_defconfig
powerpc                     mpc5200_defconfig
mips                        vocore2_defconfig
sh                        edosk7705_defconfig
arm                           h3600_defconfig
powerpc                          allmodconfig
sh                          rsk7201_defconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210531
x86_64               randconfig-a003-20210531
x86_64               randconfig-a005-20210531
x86_64               randconfig-a004-20210531
x86_64               randconfig-a002-20210531
x86_64               randconfig-a001-20210531
i386                 randconfig-a002-20210531
i386                 randconfig-a001-20210531
i386                 randconfig-a005-20210531
i386                 randconfig-a006-20210531
i386                 randconfig-a004-20210531
i386                 randconfig-a003-20210531
i386                 randconfig-a002-20210530
i386                 randconfig-a001-20210530
i386                 randconfig-a005-20210530
i386                 randconfig-a006-20210530
i386                 randconfig-a004-20210530
i386                 randconfig-a003-20210530
i386                 randconfig-a003-20210601
i386                 randconfig-a006-20210601
i386                 randconfig-a004-20210601
i386                 randconfig-a001-20210601
i386                 randconfig-a002-20210601
i386                 randconfig-a005-20210601
x86_64               randconfig-a014-20210530
x86_64               randconfig-a012-20210530
x86_64               randconfig-a013-20210530
x86_64               randconfig-a016-20210530
x86_64               randconfig-a015-20210530
x86_64               randconfig-a011-20210530
i386                 randconfig-a016-20210531
i386                 randconfig-a015-20210531
i386                 randconfig-a013-20210531
i386                 randconfig-a012-20210531
i386                 randconfig-a014-20210531
i386                 randconfig-a011-20210531
i386                 randconfig-a016-20210530
i386                 randconfig-a015-20210530
i386                 randconfig-a013-20210530
i386                 randconfig-a012-20210530
i386                 randconfig-a014-20210530
i386                 randconfig-a011-20210530
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210531
x86_64               randconfig-b001-20210530
x86_64               randconfig-a006-20210530
x86_64               randconfig-a003-20210530
x86_64               randconfig-a005-20210530
x86_64               randconfig-a004-20210530
x86_64               randconfig-a002-20210530
x86_64               randconfig-a001-20210530
x86_64               randconfig-a014-20210531
x86_64               randconfig-a012-20210531
x86_64               randconfig-a013-20210531
x86_64               randconfig-a016-20210531
x86_64               randconfig-a015-20210531
x86_64               randconfig-a011-20210531

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
