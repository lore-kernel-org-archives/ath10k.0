Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFD7C433F5
	for <ath10k@archiver.kernel.org>; Sat, 20 Nov 2021 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bKRULsG3WYOewvm0C/81UBXyaAR+vs66+0oENgONx/0=; b=vktPOMbKYO9FP3
	KLaVlH/45GzPqd0Q6zhtD8RkcgHiJo6tgdNEZNMMxNbkQG3NKsOBiQs04evG/Nm978u5DEdPQXvca
	j8poOumIXmsi3A5xOmytEBRVEf+kz1zM4Xx3/4NIsGnByCg50soORdx4eWiGCn2mE0YGIeL5wZr0s
	N5DgEdx40k1jQiTzSm39jGogTxWjKKdAP72GHqcBQD+yHhZ60WQENcuD4lWcw5L2Qq4hTjqWYzooC
	O9qsSUXcb/4BDh00zTz9CagQUCBPLd/waZE50XABkO+pyjkvzdHZ1hhGrrSHx6bu4Gg8Ni6I3ibkT
	jmppNPMhBhzRhS9jugRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moFaU-00BtQT-26; Sat, 20 Nov 2021 01:54:42 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moFaP-00BtPv-Qx
 for ath10k@lists.infradead.org; Sat, 20 Nov 2021 01:54:39 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="297939689"
X-IronPort-AV: E=Sophos;i="5.87,249,1631602800"; d="scan'208";a="297939689"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 17:54:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,249,1631602800"; d="scan'208";a="496109943"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 19 Nov 2021 17:54:34 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1moFaL-0005D5-EW; Sat, 20 Nov 2021 01:54:33 +0000
Date: Sat, 20 Nov 2021 09:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 4f51d74c4f508d6149c82cac8cf032db27a5d306
Message-ID: <61985547.KTeG8hRwLRsDhufa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_175437_954014_2A259413 
X-CRM114-Status: UNSURE (   4.42  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 4f51d74c4f508d6149c82cac8cf032db27a5d306  ath11k: add spectral/CFR buffer validation support

elapsed time: 725m

configs tested: 210
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211119
i386                 randconfig-c001-20211118
mips                 randconfig-c004-20211118
arm                        spear6xx_defconfig
powerpc                     tqm8555_defconfig
xtensa                       common_defconfig
sh                        dreamcast_defconfig
powerpc                        cell_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                  colibri_pxa300_defconfig
arm                           h3600_defconfig
arc                    vdk_hs38_smp_defconfig
riscv                    nommu_virt_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      walnut_defconfig
mips                             allyesconfig
arm                        mvebu_v5_defconfig
mips                         mpc30x_defconfig
powerpc                      acadia_defconfig
s390                          debug_defconfig
powerpc                 mpc8540_ads_defconfig
mips                malta_qemu_32r6_defconfig
arm                           omap1_defconfig
arm                         palmz72_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7750_defconfig
powerpc                   bluestone_defconfig
mips                     loongson2k_defconfig
arc                         haps_hs_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                           jazz_defconfig
sh                          r7785rp_defconfig
parisc                generic-64bit_defconfig
sparc                       sparc32_defconfig
xtensa                  cadence_csp_defconfig
powerpc                      chrp32_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         s5pv210_defconfig
m68k                        stmark2_defconfig
sh                           se7705_defconfig
mips                        maltaup_defconfig
arm                      footbridge_defconfig
arc                           tb10x_defconfig
x86_64                              defconfig
arm                       cns3420vb_defconfig
arm                       netwinder_defconfig
powerpc                      katmai_defconfig
arm                      integrator_defconfig
powerpc                     mpc5200_defconfig
powerpc                       maple_defconfig
mips                           gcw0_defconfig
mips                           ip22_defconfig
arm                        spear3xx_defconfig
sh                                  defconfig
m68k                         amcore_defconfig
mips                    maltaup_xpa_defconfig
arm                     am200epdkit_defconfig
sh                           se7343_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      pasemi_defconfig
powerpc                     rainier_defconfig
sparc64                             defconfig
riscv             nommu_k210_sdcard_defconfig
arm                          collie_defconfig
h8300                     edosk2674_defconfig
arm                             mxs_defconfig
sh                               allmodconfig
arm                           stm32_defconfig
arm                            hisi_defconfig
mips                  cavium_octeon_defconfig
m68k                        m5407c3_defconfig
arm                        vexpress_defconfig
powerpc                 mpc837x_mds_defconfig
mips                          rm200_defconfig
sh                          sdk7786_defconfig
arm                        oxnas_v6_defconfig
sh                           se7780_defconfig
sh                   sh7724_generic_defconfig
mips                         db1xxx_defconfig
arm                        cerfcube_defconfig
arm                          pxa168_defconfig
m68k                          multi_defconfig
arm                              alldefconfig
powerpc                       holly_defconfig
arm                        mini2440_defconfig
i386                                defconfig
mips                       bmips_be_defconfig
sh                           se7619_defconfig
arm                           tegra_defconfig
ia64                            zx1_defconfig
arm                         hackkit_defconfig
arm                     eseries_pxa_defconfig
sh                        sh7763rdp_defconfig
mips                           rs90_defconfig
arm                         mv78xx0_defconfig
ia64                             alldefconfig
sh                        sh7785lcr_defconfig
arm                  randconfig-c002-20211119
arm                  randconfig-c002-20211118
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211119
x86_64               randconfig-a003-20211119
x86_64               randconfig-a002-20211119
x86_64               randconfig-a001-20211119
x86_64               randconfig-a006-20211119
x86_64               randconfig-a004-20211119
i386                 randconfig-a006-20211119
i386                 randconfig-a003-20211119
i386                 randconfig-a001-20211119
i386                 randconfig-a005-20211119
i386                 randconfig-a004-20211119
i386                 randconfig-a002-20211119
x86_64               randconfig-a015-20211118
x86_64               randconfig-a012-20211118
x86_64               randconfig-a011-20211118
x86_64               randconfig-a013-20211118
x86_64               randconfig-a016-20211118
x86_64               randconfig-a014-20211118
i386                 randconfig-a016-20211118
i386                 randconfig-a014-20211118
i386                 randconfig-a012-20211118
i386                 randconfig-a011-20211118
i386                 randconfig-a013-20211118
i386                 randconfig-a015-20211118
i386                 randconfig-a016-20211120
i386                 randconfig-a015-20211120
i386                 randconfig-a012-20211120
i386                 randconfig-a013-20211120
i386                 randconfig-a014-20211120
i386                 randconfig-a011-20211120
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
i386                 randconfig-c001-20211119
x86_64               randconfig-c007-20211119
arm                  randconfig-c002-20211119
s390                 randconfig-c005-20211119
powerpc              randconfig-c003-20211119
riscv                randconfig-c006-20211119
i386                 randconfig-c001-20211118
x86_64               randconfig-c007-20211118
arm                  randconfig-c002-20211118
s390                 randconfig-c005-20211118
powerpc              randconfig-c003-20211118
riscv                randconfig-c006-20211118
mips                 randconfig-c004-20211118
i386                 randconfig-a006-20211118
i386                 randconfig-a003-20211118
i386                 randconfig-a001-20211118
i386                 randconfig-a005-20211118
i386                 randconfig-a004-20211118
i386                 randconfig-a002-20211118
x86_64               randconfig-a005-20211118
x86_64               randconfig-a003-20211118
x86_64               randconfig-a001-20211118
x86_64               randconfig-a002-20211118
x86_64               randconfig-a006-20211118
x86_64               randconfig-a004-20211118
x86_64               randconfig-a015-20211119
x86_64               randconfig-a011-20211119
x86_64               randconfig-a012-20211119
x86_64               randconfig-a013-20211119
x86_64               randconfig-a016-20211119
x86_64               randconfig-a014-20211119
hexagon              randconfig-r045-20211119
hexagon              randconfig-r041-20211119
riscv                randconfig-r042-20211119
s390                 randconfig-r044-20211119
hexagon              randconfig-r045-20211118
hexagon              randconfig-r041-20211118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
