Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18C4C433F5
	for <ath10k@archiver.kernel.org>; Wed, 30 Mar 2022 21:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YpGDcJ8BFskFI8QPn6O9LCsm4slDIrRb3DuFLVexA7w=; b=enZgnW5bbwbSDM
	lZsIHj+1tzpbIw/PJN1pQV40km8twFJ+39HyvGP9P7J2LpBFO+4xsoGeVDWYzXNKGU+gC7RT1PtDZ
	5QbucQ/zw/DHB05tcP1mxHUPMjcOSf4E9hoSdMJcO7A+g0otLPdiffznjTa+Aviste8g9UF+q4YDT
	42PQMnVOh4/Y8FZzuf1swxUHvKKALGeICoqrMoPPoeEhbW7opkrh1KEHjzizgv/Hcq/kb4s8OQd7E
	1q8o0aIYQCepEwrfzjSU+09jjgItK4e2mMJ7fV5Hk6hWvcUmqogp5XivqgSBhmbU0vI7WUbqKVFYc
	1FKLTJICG2sw0q4r4tuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZgFp-00HYbH-Nh; Wed, 30 Mar 2022 21:53:25 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZgFi-00HYYu-6V
 for ath10k@lists.infradead.org; Wed, 30 Mar 2022 21:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648677198; x=1680213198;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=5/CElPvOfZ0EY4kxOufoAF+OzMzfwZtAxjatxdnc5vI=;
 b=E3Q0pjwqqZZAIR2+pjX0wJbOEYqAy9x3F6PyWTT35R+XRYjPt/q4VKbi
 M43EeNmAh2VylqbN35cCP6Z3qm4uugOQ37LLya8kXDG1XthhNInLil9aG
 s7v0/h4PkwIFc+reHvU1A5OY//4VcT0Q6Wpq8G6/EREr2CWs6+lUictsG
 qNZxsitovZv2W+lKxJdymb+R42DsH5IEqrJhMMU5jzGK2pA3ToAjwUrFt
 wEpuiIEYUS+fdgHB7oyFESyJm/NK245GA1/q2hV4fKlmUVmuRlLorvI8V
 RDS+1rvZ0pi32yl3V4GRwdOr2tXeaa4/PjiGryQ+JuHpgb3xTXjVq/Yw/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259628041"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="259628041"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 14:53:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="618686251"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2022 14:53:15 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZgFe-0000Xp-VR;
 Wed, 30 Mar 2022 21:53:14 +0000
Date: Thu, 31 Mar 2022 05:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 8d121ebc4885b65de736d9d3e39a851af5f68b78
Message-ID: <6244d114.oAmU4wsLltkr1Y+M%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_145318_341513_17C04EC7 
X-CRM114-Status: UNSURE (   5.59  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: 8d121ebc4885b65de736d9d3e39a851af5f68b78  ath11k: add register read debugfs interface for WCN6855

elapsed time: 743m

configs tested: 185
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220330
powerpc              randconfig-c003-20220330
sh                          landisk_defconfig
sh                        edosk7760_defconfig
powerpc                     rainier_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
um                             i386_defconfig
powerpc                    adder875_defconfig
m68k                             allmodconfig
powerpc                     pq2fads_defconfig
arc                     haps_hs_smp_defconfig
riscv             nommu_k210_sdcard_defconfig
um                               alldefconfig
mips                            gpr_defconfig
sh                          rsk7264_defconfig
nios2                         3c120_defconfig
sh                               alldefconfig
arm                       aspeed_g5_defconfig
parisc64                            defconfig
sh                        sh7757lcr_defconfig
powerpc                    klondike_defconfig
sparc                       sparc64_defconfig
sh                          rsk7201_defconfig
mips                            ar7_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
m68k                       m5208evb_defconfig
arc                 nsimosci_hs_smp_defconfig
xtensa                          iss_defconfig
arm                           tegra_defconfig
arm                            lart_defconfig
arm                        trizeps4_defconfig
alpha                            alldefconfig
arm                        cerfcube_defconfig
powerpc                 mpc837x_mds_defconfig
arc                     nsimosci_hs_defconfig
s390                                defconfig
powerpc                 mpc85xx_cds_defconfig
mips                  maltasmvp_eva_defconfig
ia64                        generic_defconfig
sh                           se7619_defconfig
powerpc64                        alldefconfig
mips                           gcw0_defconfig
arm                           sama5_defconfig
parisc                generic-64bit_defconfig
arm                      integrator_defconfig
powerpc                      pcm030_defconfig
sh                          sdk7780_defconfig
m68k                           sun3_defconfig
powerpc                      arches_defconfig
ia64                            zx1_defconfig
m68k                        stmark2_defconfig
powerpc                  iss476-smp_defconfig
arm                         cm_x300_defconfig
sh                             espt_defconfig
powerpc                  storcenter_defconfig
sh                        apsh4ad0a_defconfig
mips                        bcm47xx_defconfig
powerpc                 mpc834x_itx_defconfig
sh                         ap325rxa_defconfig
mips                     decstation_defconfig
sh                           se7705_defconfig
arm                         s3c6400_defconfig
m68k                         amcore_defconfig
ia64                                defconfig
riscv                               defconfig
powerpc                       eiger_defconfig
um                                  defconfig
openrisc                    or1ksim_defconfig
arm                          gemini_defconfig
powerpc                     sequoia_defconfig
arm                        shmobile_defconfig
powerpc                      ppc6xx_defconfig
sh                          urquell_defconfig
sh                          kfr2r09_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
ia64                      gensparse_defconfig
riscv                            allmodconfig
nios2                               defconfig
m68k                            q40_defconfig
mips                           jazz_defconfig
m68k                          hp300_defconfig
arm                         axm55xx_defconfig
sh                ecovec24-romimage_defconfig
arm                     eseries_pxa_defconfig
powerpc                       holly_defconfig
mips                         cobalt_defconfig
arm                         nhk8815_defconfig
sh                   sh7724_generic_defconfig
parisc                              defconfig
mips                         bigsur_defconfig
m68k                          amiga_defconfig
sh                           se7712_defconfig
csky                             alldefconfig
arm                  randconfig-c002-20220330
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                                defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
riscv                randconfig-r042-20220330
s390                 randconfig-r044-20220330
arc                  randconfig-r043-20220330
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220330
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220330
riscv                randconfig-c006-20220330
i386                          randconfig-c001
arm                  randconfig-c002-20220330
powerpc                     mpc5200_defconfig
powerpc                  mpc866_ads_defconfig
arm                        vexpress_defconfig
arm                       spear13xx_defconfig
mips                        omega2p_defconfig
powerpc                          allmodconfig
mips                          ath79_defconfig
powerpc                      obs600_defconfig
hexagon                          alldefconfig
arm                         s5pv210_defconfig
arm                     am200epdkit_defconfig
mips                        workpad_defconfig
mips                   sb1250_swarm_defconfig
powerpc                     powernv_defconfig
arm                         lpc32xx_defconfig
arm                             mxs_defconfig
mips                         tb0287_defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
powerpc                       ebony_defconfig
arm                         s3c2410_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220330
hexagon              randconfig-r041-20220330

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
