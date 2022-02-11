Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EFFC433FE
	for <ath10k@archiver.kernel.org>; Fri, 11 Feb 2022 02:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BxlKQUFgwnnOZtwsKcAXCwJRtRnEmrasRzcLSQ3vGYU=; b=E6eZhGdZl4p0L4
	Qwo2PQB+xF73XLBsdF2ZnnCfe9MeB9+eMuaYL2MW+GrkM7Ys6K4XWQu8pprCy3Nr4Vmjw+rhcdwZD
	2D/PU6iYFs6JmrrOu1h4wGZ6FX3hSMSXkbR8Mbsfb2xnWgc2PLpw36Tw3HMC9L72dDV/n2VF/DnwA
	R+Zq8497mKvWQxjoTt9v7o2EGUFeF8LnKPUUFFroGMQqEteh1DfUoiMpVclbOkC7vJkf7KIDUXInu
	zTnpm1pCmQBvDZk6OqvsPMnXu6YWdHBL7CkQ/Mm50wzZMKDgy4wj90vwL4TAf5JsYco+ljQMxlZhe
	FVy86g4HtMxPX9Os/vXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nILZv-005VoW-EE; Fri, 11 Feb 2022 02:22:31 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nILZr-005Vng-BC
 for ath10k@lists.infradead.org; Fri, 11 Feb 2022 02:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644546147; x=1676082147;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=v4m9Ze01W/BbFsVkHjK1rnp0MR4v32/5iUY1iLVkuFo=;
 b=hMsi5pF0P05jNhoBaSadxCFT2hPp9u8tPCbNEXdkrWDg4oZYFzq5HU5N
 MTyVMNJlXZ+L8PKsevm3IEDc7CH4sNvVX+BfNPiXyc5uU43pYX1fLiJUl
 y/ynxidBfQP3LaCNtTKYm8lToZIO/Ie8UgYK6gePzInYMvvJnpuJ0jBpW
 lW2+uVSmj/uGwtOEfLQMskrHOTR192/csqaVww4bGjsgemhVKvLnu0a7m
 Fsgph1rDC3FOXCYNx/SITVtUcM3g8+fJgC2v9KrY27B+ZkwozPTqkH0tm
 o763v75FaIIPPXj3P+vFc48dk8rhRnSTVgGkaSY+3u3uTqnbSob2GgD9e A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248473609"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="248473609"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 18:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="679370793"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2022 18:22:25 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nILZp-00042g-6a; Fri, 11 Feb 2022 02:22:25 +0000
Date: Fri, 11 Feb 2022 10:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 9a4dbe8c276e1d26533f2e4191c2b5dbef2d7b1e
Message-ID: <6205c85c.rvLDbzvxSsr2DJJ2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_182227_438093_7D2FBA4C 
X-CRM114-Status: UNSURE (   5.85  )
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
branch HEAD: 9a4dbe8c276e1d26533f2e4191c2b5dbef2d7b1e  ath11k: support GTK rekey offload

elapsed time: 721m

configs tested: 177
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220210
i386                          randconfig-c001
xtensa                         virt_defconfig
powerpc64                           defconfig
powerpc                     sequoia_defconfig
arm                          iop32x_defconfig
h8300                               defconfig
sh                           se7722_defconfig
sh                         ecovec24_defconfig
alpha                               defconfig
arm                         lpc18xx_defconfig
powerpc                       ppc64_defconfig
arm                        mini2440_defconfig
arm                       multi_v4t_defconfig
openrisc                 simple_smp_defconfig
sh                           se7206_defconfig
sh                            hp6xx_defconfig
parisc                generic-64bit_defconfig
arm                         cm_x300_defconfig
sh                            titan_defconfig
x86_64                           alldefconfig
powerpc                      ppc40x_defconfig
sh                        sh7757lcr_defconfig
arm                        shmobile_defconfig
mips                           ip32_defconfig
m68k                            q40_defconfig
powerpc                        warp_defconfig
s390                                defconfig
riscv                    nommu_k210_defconfig
powerpc                 mpc834x_itx_defconfig
arm                             ezx_defconfig
arm                        cerfcube_defconfig
nios2                            alldefconfig
sh                          urquell_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                       m5249evb_defconfig
powerpc                     tqm8541_defconfig
arm                           h3600_defconfig
powerpc                       eiger_defconfig
arm                         s3c6400_defconfig
csky                             alldefconfig
powerpc                      ep88xc_defconfig
ia64                         bigsur_defconfig
sh                        dreamcast_defconfig
arc                     nsimosci_hs_defconfig
mips                             allmodconfig
powerpc64                        alldefconfig
sh                                  defconfig
m68k                        m5407c3_defconfig
sh                   sh7770_generic_defconfig
arm                             pxa_defconfig
csky                                defconfig
powerpc                    klondike_defconfig
arc                              alldefconfig
um                                  defconfig
s390                          debug_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
alpha                            allyesconfig
m68k                          hp300_defconfig
powerpc                     tqm8555_defconfig
xtensa                              defconfig
arm                      jornada720_defconfig
arm                           sunxi_defconfig
powerpc                 linkstation_defconfig
sh                         microdev_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        multi_v7_defconfig
sh                           se7750_defconfig
m68k                          amiga_defconfig
alpha                            alldefconfig
powerpc                      arches_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20220210
arm                  randconfig-c002-20220209
arm                  randconfig-c002-20220211
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220209
arc                  randconfig-r043-20220208
arc                  randconfig-r043-20220209
riscv                randconfig-r042-20220210
riscv                randconfig-r042-20220209
arc                  randconfig-r043-20220210
s390                 randconfig-r044-20220210
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220209
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220209
i386                          randconfig-c001
mips                 randconfig-c004-20220209
arm                  randconfig-c002-20220209
riscv                randconfig-c006-20220210
powerpc              randconfig-c003-20220210
arm                  randconfig-c002-20220210
mips                 randconfig-c004-20220210
powerpc                     ksi8560_defconfig
powerpc                      ppc44x_defconfig
mips                            e55_defconfig
x86_64                           allyesconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
powerpc                    ge_imp3a_defconfig
arm                        multi_v5_defconfig
mips                       rbtx49xx_defconfig
hexagon                             defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     tqm5200_defconfig
powerpc                       ebony_defconfig
mips                      pic32mzda_defconfig
powerpc                     kilauea_defconfig
powerpc                     mpc5200_defconfig
powerpc                     akebono_defconfig
mips                          ath79_defconfig
arm                           omap1_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220210
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220210
hexagon              randconfig-r041-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
