Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF14BC4332F
	for <ath10k@archiver.kernel.org>; Fri, 21 Oct 2022 05:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XEnMRRjoxgqVoKkPmMvPpNdL5n/4w5bWzp2Zmivnhvk=; b=GiFQrltsEEZR0T
	+CI4lxVocKpBjOV2dvHdKZNiZm979vKLGttLR+3XB+NvVzoXIxmb2b39XTyOe4xbhm0tkSxUd2Eue
	MvJTquXXabqgM+GbROfwDXkj0EBLWfLVoMDJsw5s2XDCxQF9mV0MSnDcMsCq9BV4WSegB36lnYB4R
	/Ib/AGruhEFjlz31sPMyJ9kI42v+hXZJLw7o2spuHap5zqL/ARg5SaBCW0tSlhU2e6GA4cPPzYPg7
	GtjM1IiCLFgO6Ae4prq0lE3MKypBjY6Q3VvfdxutO7nIO/eWymaOMpNsQ/khwC8EPIXjh2E57rDxr
	vZFwc0EI3vTGpCiDHciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olkGd-005IlJ-Un; Fri, 21 Oct 2022 05:08:23 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olkGb-005Ij7-I7
	for ath10k@lists.infradead.org; Fri, 21 Oct 2022 05:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666328901; x=1697864901;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1c10zouk4KxDQ7PrzstVeVaoevctyb0QdAUind8Pkcg=;
  b=WL2rNKLBRmB0Xrbm8tCx1TIjBht08tFN7dZFNnp3O1fDfBPx0WcPNdmV
   vW5xvteeH0hpEU3EcEdcb7SaUg3TXuxrmVwyEoP/VylIUlk/S0vq3ClDl
   Cwo2Yik9ccacQS+amwmm2B/8Ek8oqYwsobTI/nBEkQeW8xSOBprXtkfUS
   ZZMz+Ypt4W8Kkkg8X96E042viDNIVhFLeRGwA9ICE8HjpvVZx2e1u+pSb
   sADJyLYKMsdrEPwT0NgcyBsznVX92tBJcKKzxv0Nej88CibGkYDnlGYma
   N5dUjVFL+0iy7mGiEyv9y6cZtA1RzNmd2I9REiqOZoe1xP81DX5eEuclQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="306903627"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="306903627"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 22:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772821397"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="772821397"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2022 22:08:19 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1olkGY-00029R-1n;
	Fri, 21 Oct 2022 05:08:18 +0000
Date: Fri, 21 Oct 2022 13:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 acd4324e5f1f11351630234297f95076f0ac9a2f
Message-ID: <63522936.pf5FADV8ER2f8V3B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_220821_736720_37E8FC64 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: acd4324e5f1f11351630234297f95076f0ac9a2f  wifi: ath10k: Delay the unmapping of the buffer

elapsed time: 2807m

configs tested: 245
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
mips                             allyesconfig
s390                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a001
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a003
x86_64                        randconfig-a015
arc                              allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
i386                          randconfig-a005
i386                                defconfig
x86_64                              defconfig
x86_64                        randconfig-a002
i386                          randconfig-a014
x86_64                               rhel-8.3
x86_64                        randconfig-a006
i386                          randconfig-a012
x86_64                        randconfig-a004
i386                          randconfig-a016
arm                                 defconfig
i386                             allyesconfig
x86_64                           allyesconfig
sh                             shx3_defconfig
sh                          polaris_defconfig
mips                         cobalt_defconfig
arm64                            allyesconfig
arm                              allyesconfig
arc                  randconfig-r043-20221018
s390                 randconfig-r044-20221018
riscv                randconfig-r042-20221018
sh                        sh7763rdp_defconfig
sh                          sdk7780_defconfig
powerpc                    klondike_defconfig
sparc                             allnoconfig
arc                           tb10x_defconfig
m68k                        mvme16x_defconfig
arc                         haps_hs_defconfig
sh                            shmin_defconfig
sh                         apsh4a3a_defconfig
arm                        cerfcube_defconfig
mips                           jazz_defconfig
powerpc                        warp_defconfig
sh                               j2_defconfig
m68k                        m5272c3_defconfig
arm                         cm_x300_defconfig
sh                          kfr2r09_defconfig
sh                             sh03_defconfig
sh                          r7785rp_defconfig
sh                             espt_defconfig
arm                          iop32x_defconfig
sh                            hp6xx_defconfig
loongarch                         allnoconfig
arm                             pxa_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7712_defconfig
arm                          pxa3xx_defconfig
sh                   sh7770_generic_defconfig
m68k                                defconfig
sh                          urquell_defconfig
i386                          randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                      integrator_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc834x_mds_defconfig
arm64                            alldefconfig
sh                        sh7757lcr_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
xtensa                  audio_kc705_defconfig
arm                          simpad_defconfig
sh                           se7206_defconfig
powerpc                 mpc834x_itx_defconfig
ia64                          tiger_defconfig
m68k                       m5475evb_defconfig
xtensa                              defconfig
powerpc                       maple_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221019
m68k                          sun3x_defconfig
openrisc                       virt_defconfig
m68k                           virt_defconfig
xtensa                          iss_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                   currituck_defconfig
arc                        vdk_hs38_defconfig
arm                         assabet_defconfig
openrisc                            defconfig
nios2                            alldefconfig
arm                           stm32_defconfig
openrisc                  or1klitex_defconfig
mips                           gcw0_defconfig
arm                        keystone_defconfig
ia64                                defconfig
arm                        clps711x_defconfig
xtensa                           alldefconfig
csky                              allnoconfig
arm                          exynos_defconfig
nios2                               defconfig
arc                          axs101_defconfig
powerpc                   motionpro_defconfig
powerpc                     mpc83xx_defconfig
sh                          rsk7269_defconfig
s390                          debug_defconfig
sh                     sh7710voipgw_defconfig
loongarch                           defconfig
loongarch                        allmodconfig
arm                         s3c6400_defconfig
powerpc                     tqm8555_defconfig
csky                                defconfig
xtensa                         virt_defconfig
powerpc                     sequoia_defconfig
arm                           h3600_defconfig
sparc64                          alldefconfig
m68k                       bvme6000_defconfig
sh                        dreamcast_defconfig
mips                           ip32_defconfig
sh                            titan_defconfig
arm                       aspeed_g5_defconfig
m68k                          amiga_defconfig
arc                               allnoconfig
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
arm                  randconfig-c002-20221020
sparc                               defconfig
xtensa                           allyesconfig
sparc                            allyesconfig
x86_64                                  kexec
arc                  randconfig-r043-20221020
s390                 randconfig-r044-20221020
riscv                randconfig-r042-20221020
sparc                       sparc32_defconfig
arc                        nsimosci_defconfig
sh                           se7619_defconfig
arc                  randconfig-r043-20221019
mips                 randconfig-c004-20221020
ia64                         bigsur_defconfig
m68k                        stmark2_defconfig
powerpc                      cm5200_defconfig
sh                ecovec24-romimage_defconfig
arm                      footbridge_defconfig
sh                     magicpanelr2_defconfig
arm                          gemini_defconfig
mips                  maltasmvp_eva_defconfig
um                               alldefconfig
powerpc                  iss476-smp_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
openrisc                         alldefconfig
powerpc                       holly_defconfig
m68k                         apollo_defconfig
arm                        oxnas_v6_defconfig
m68k                            q40_defconfig
powerpc                     tqm8541_defconfig
powerpc                      chrp32_defconfig
sparc                            alldefconfig
arm                          badge4_defconfig
sh                           se7750_defconfig
sh                           se7343_defconfig
nios2                         10m50_defconfig
mips                           ci20_defconfig
m68k                        mvme147_defconfig
mips                       bmips_be_defconfig

clang tested configs:
riscv                randconfig-r042-20221019
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221019
hexagon              randconfig-r041-20221019
i386                          randconfig-a002
x86_64                        randconfig-a016
i386                          randconfig-a006
x86_64                        randconfig-a012
i386                          randconfig-a004
s390                 randconfig-r044-20221019
i386                          randconfig-a013
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
i386                          randconfig-a015
mips                           mtx1_defconfig
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc8560_ads_defconfig
x86_64                        randconfig-c007
mips                 randconfig-c004-20221019
i386                          randconfig-c001
s390                 randconfig-c005-20221019
arm                  randconfig-c002-20221019
riscv                randconfig-c006-20221019
powerpc              randconfig-c003-20221019
hexagon              randconfig-r045-20221018
hexagon              randconfig-r041-20221018
x86_64                        randconfig-k001
hexagon                             defconfig
powerpc                     tqm8540_defconfig
powerpc                      pmac32_defconfig
powerpc                     ksi8560_defconfig
powerpc               mpc834x_itxgp_defconfig
hexagon              randconfig-r041-20221020
hexagon              randconfig-r045-20221020
arm                       mainstone_defconfig
powerpc                      obs600_defconfig
powerpc                    gamecube_defconfig
mips                          ath79_defconfig
arm                         shannon_defconfig
mips                     cu1830-neo_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                       lemote2f_defconfig
powerpc                    socrates_defconfig
arm                         orion5x_defconfig
powerpc                     tqm8560_defconfig
powerpc                     kmeter1_defconfig
arm                           omap1_defconfig
mips                      malta_kvm_defconfig
arm                                 defconfig
arm                        magician_defconfig
arm                  colibri_pxa300_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
