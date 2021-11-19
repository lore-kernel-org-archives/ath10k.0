Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEEEC433EF
	for <ath10k@archiver.kernel.org>; Fri, 19 Nov 2021 22:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XR1VKOl9ZnBNmYQ0wfr7WnBItxpe+m6BLIOh76pKTMs=; b=OrZAGjJkd2cJmO
	URoENZi9UHfNdPa1e5sIqRpNLqmnzaRM2BD2Cc/SPqpeD1SOnSP/IAYzYzYMqv2bRtzboxC9JsA81
	b5IMDVZK0tDwmz9ib2EkrcTJj1gV8Xrjj/jBWVYnaGHIURCgBHeL0n1RWF3QTpHfM4Wu3ozrav87o
	kooHz9P/OGmMkhYr7/+aSv8MTF4rK1u6uftjE3PK/lN54YsSzpe4GNJYAqY/DkjAE/uNQF5p0z0fB
	vx2jt3d6gzyKWX+3KZu77hUwNYFI/prYefV0CFnIDWkk0jNsFEUlyDPAKPQK1TL28prIw9jukHrHE
	WY4Tl1O12kzo62IJnw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moBwr-00BdWh-Pd; Fri, 19 Nov 2021 22:01:33 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moBwn-00BdV6-Vs
 for ath10k@lists.infradead.org; Fri, 19 Nov 2021 22:01:31 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="258294896"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="258294896"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 14:01:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="551204531"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 19 Nov 2021 14:01:26 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1moBwj-00050U-KX; Fri, 19 Nov 2021 22:01:25 +0000
Date: Sat, 20 Nov 2021 06:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 5125b9a9c420ee91e2c258ea96a8261a49e7449d
Message-ID: <61981e7d.jFl0Nr1zYtzPVaDG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_140130_082771_27F6CC30 
X-CRM114-Status: UNSURE (   6.32  )
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
branch HEAD: 5125b9a9c420ee91e2c258ea96a8261a49e7449d  ath9k: fix intr_txqs setting

elapsed time: 721m

configs tested: 227
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
powerpc                         ps3_defconfig
sh                                  defconfig
arc                      axs103_smp_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
sh                           se7722_defconfig
mips                      fuloong2e_defconfig
mips                        omega2p_defconfig
arm                             rpc_defconfig
sparc64                             defconfig
sh                           sh2007_defconfig
powerpc                        warp_defconfig
arm                        mvebu_v7_defconfig
sh                        dreamcast_defconfig
arm                         orion5x_defconfig
arm                  colibri_pxa300_defconfig
arm                           h3600_defconfig
arc                    vdk_hs38_smp_defconfig
riscv                    nommu_virt_defconfig
mips                   sb1250_swarm_defconfig
powerpc                      walnut_defconfig
arm                        mvebu_v5_defconfig
mips                         mpc30x_defconfig
powerpc                      acadia_defconfig
s390                          debug_defconfig
powerpc                 mpc8540_ads_defconfig
mips                malta_qemu_32r6_defconfig
arm                           omap1_defconfig
arm                         palmz72_defconfig
arc                     nsimosci_hs_defconfig
nios2                               defconfig
arm                           stm32_defconfig
arm                        realview_defconfig
s390                             alldefconfig
powerpc                      pcm030_defconfig
arm                     eseries_pxa_defconfig
powerpc                     powernv_defconfig
sh                           se7750_defconfig
powerpc                   bluestone_defconfig
mips                     loongson2k_defconfig
arc                         haps_hs_defconfig
mips                     loongson1b_defconfig
mips                          malta_defconfig
arm                         lubbock_defconfig
arc                          axs103_defconfig
powerpc                      chrp32_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         s5pv210_defconfig
m68k                        stmark2_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                      bmips_stb_defconfig
nds32                               defconfig
arm                       cns3420vb_defconfig
arm                       netwinder_defconfig
powerpc                      katmai_defconfig
arm                      integrator_defconfig
powerpc                     mpc5200_defconfig
powerpc                       maple_defconfig
mips                           gcw0_defconfig
mips                           ip22_defconfig
arm                        spear3xx_defconfig
m68k                         amcore_defconfig
mips                    maltaup_xpa_defconfig
arm                     am200epdkit_defconfig
sh                           se7343_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      pasemi_defconfig
powerpc                     rainier_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                          collie_defconfig
m68k                             alldefconfig
arc                     haps_hs_smp_defconfig
sh                   sh7770_generic_defconfig
mips                       bmips_be_defconfig
m68k                            mac_defconfig
sh                        edosk7760_defconfig
arm                      pxa255-idp_defconfig
h8300                     edosk2674_defconfig
arm                             mxs_defconfig
sh                               allmodconfig
arm                            hisi_defconfig
mips                           ip27_defconfig
openrisc                 simple_smp_defconfig
i386                             alldefconfig
sh                          sdk7786_defconfig
arm                            mmp2_defconfig
powerpc                 mpc837x_mds_defconfig
sh                   sh7724_generic_defconfig
mips                         db1xxx_defconfig
arm                        cerfcube_defconfig
arm                          pxa168_defconfig
m68k                          multi_defconfig
arm                              alldefconfig
xtensa                          iss_defconfig
microblaze                          defconfig
arm                           sunxi_defconfig
s390                       zfcpdump_defconfig
powerpc                      ppc40x_defconfig
powerpc                        icon_defconfig
arm                           tegra_defconfig
ia64                            zx1_defconfig
openrisc                            defconfig
powerpc                      cm5200_defconfig
ia64                             alldefconfig
arm                       imx_v6_v7_defconfig
m68k                          sun3x_defconfig
powerpc64                        alldefconfig
powerpc                 mpc834x_mds_defconfig
mips                 decstation_r4k_defconfig
mips                           rs90_defconfig
arm                         mv78xx0_defconfig
sh                        sh7785lcr_defconfig
arm                  randconfig-c002-20211118
arm                  randconfig-c002-20211119
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
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
i386                 randconfig-a016-20211120
i386                 randconfig-a015-20211120
i386                 randconfig-a012-20211120
i386                 randconfig-a013-20211120
i386                 randconfig-a014-20211120
i386                 randconfig-a011-20211120
i386                 randconfig-a016-20211118
i386                 randconfig-a014-20211118
i386                 randconfig-a012-20211118
i386                 randconfig-a011-20211118
i386                 randconfig-a013-20211118
i386                 randconfig-a015-20211118
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
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20211118
x86_64               randconfig-c007-20211118
arm                  randconfig-c002-20211118
s390                 randconfig-c005-20211118
powerpc              randconfig-c003-20211118
riscv                randconfig-c006-20211118
mips                 randconfig-c004-20211118
i386                 randconfig-c001-20211119
x86_64               randconfig-c007-20211119
arm                  randconfig-c002-20211119
s390                 randconfig-c005-20211119
powerpc              randconfig-c003-20211119
riscv                randconfig-c006-20211119
x86_64               randconfig-a005-20211118
x86_64               randconfig-a003-20211118
x86_64               randconfig-a001-20211118
x86_64               randconfig-a002-20211118
x86_64               randconfig-a006-20211118
x86_64               randconfig-a004-20211118
i386                 randconfig-a006-20211118
i386                 randconfig-a003-20211118
i386                 randconfig-a001-20211118
i386                 randconfig-a005-20211118
i386                 randconfig-a004-20211118
i386                 randconfig-a002-20211118
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
