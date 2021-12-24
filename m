Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DEEC433F5
	for <ath10k@archiver.kernel.org>; Fri, 24 Dec 2021 04:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QTYGOTmHUz46D2ejoUiaxCj2yTq3G2tFVabdpwZSy8U=; b=Viv4nOkfR8rwkn
	mdiXwK9D9cHjhB31Mi0AYyRkqWiwuluiVR9m5HXecnpg2egwhJsZ8yrmxAsUhs0UtIMT5pfNU+FXP
	CKUC5qn3PNVsPbnnyY/N6H+DPJWZKRFT+wthzCQ54QECX680dSFKGIVo4oF2r2XWTs0KMNY5rgo4i
	OvgBSMWblZrbXAPIDGAn0+lAzqiaFQACtXgrA0fd84GJV2ltmhz7TjkKEuSpcy3TbwbC41M87162b
	HkhlTyg0IvKC7Svv2TXQXdE4PMJDMVyeKTJwiRNECRXhHKlcdO7yMu5bxPEBKRK6zD6rWDXnaVMMY
	a/b/gNF1aBdp6FRggoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0bo2-00Djb4-S0; Fri, 24 Dec 2021 04:03:46 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0bny-00Djad-PU
 for ath10k@lists.infradead.org; Fri, 24 Dec 2021 04:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640318622; x=1671854622;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=d1bbSi4CqjNcjZHhxpAEVSmcSJHeUMlpMWL3J5KWeEI=;
 b=RFaNdfw4KWSKxXoXA2GmdNHOtVPD66dzggFXHS3sY8xvv2ZyIqBStKlQ
 /FStrQF4yVmXpIJo+A17A4HrXLEdzphRJmbHsQnMDB/duFOuAINCacyQI
 uELvsohtBirzxi/iWij22zx8oq4PmB6e3bqchAypZVK2glvj0BbaO9yCo
 MoYABDkWn/M2IPIYp0QzhdP3xbiRM5Ef1YXw+O8eRN+omiQuZ2CxsJWsK
 1KyLaGaY7s7bH0qxf2nbvS2Hp9r2w4l/AXJ4jhr+7FtXlAXcyldMmo2cm
 HGQ7NJ9BkFQKleZxDMJqw2BkQUbgKZ6uHK1pB+c5iIldvDmi0a7pV4K42 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="228224554"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="228224554"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 20:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="759421107"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 23 Dec 2021 20:03:34 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n0bnq-0002bD-65; Fri, 24 Dec 2021 04:03:34 +0000
Date: Fri, 24 Dec 2021 12:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 6e778959aa4aa2b369ae746a3455e25ec26d2d7d
Message-ID: <61c5465d.Bs3/TXCPJCp7zsB4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_200342_930794_2B526B36 
X-CRM114-Status: UNSURE (   5.24  )
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
branch HEAD: 6e778959aa4aa2b369ae746a3455e25ec26d2d7d  ath11k: Refactor the fallback routine when peer create fails

elapsed time: 1043m

configs tested: 155
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211223
powerpc                     mpc5200_defconfig
arm                       imx_v6_v7_defconfig
sh                   rts7751r2dplus_defconfig
arm                   milbeaut_m10v_defconfig
sh                      rts7751r2d1_defconfig
m68k                        mvme147_defconfig
arm                         lubbock_defconfig
mips                             allmodconfig
powerpc                      mgcoge_defconfig
powerpc                    mvme5100_defconfig
m68k                         amcore_defconfig
alpha                            alldefconfig
sh                           se7343_defconfig
arm                       spear13xx_defconfig
arm                      integrator_defconfig
mips                        vocore2_defconfig
arm                          simpad_defconfig
arm                       aspeed_g4_defconfig
arm                             pxa_defconfig
sh                          kfr2r09_defconfig
powerpc                 mpc832x_mds_defconfig
ia64                             allyesconfig
powerpc                     skiroot_defconfig
powerpc                      ep88xc_defconfig
mips                     decstation_defconfig
arc                            hsdk_defconfig
powerpc                      pmac32_defconfig
arm                        oxnas_v6_defconfig
powerpc                     ppa8548_defconfig
mips                         tb0219_defconfig
powerpc                      pcm030_defconfig
powerpc                    amigaone_defconfig
powerpc                      arches_defconfig
sh                        apsh4ad0a_defconfig
arm                           sunxi_defconfig
arm                           corgi_defconfig
powerpc                     redwood_defconfig
arm                          iop32x_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 linkstation_defconfig
arm                           u8500_defconfig
arm                            xcep_defconfig
um                               alldefconfig
mips                 decstation_r4k_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
mips                     cu1000-neo_defconfig
arm                           stm32_defconfig
powerpc                       ppc64_defconfig
mips                         tb0287_defconfig
arm                       cns3420vb_defconfig
mips                         cobalt_defconfig
mips                     loongson1b_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                           se7721_defconfig
sh                           se7724_defconfig
arm                     eseries_pxa_defconfig
powerpc64                           defconfig
arm                        neponset_defconfig
um                             i386_defconfig
arm                         lpc18xx_defconfig
arm                          exynos_defconfig
sh                          lboxre2_defconfig
sh                ecovec24-romimage_defconfig
m68k                            mac_defconfig
arm                  randconfig-c002-20211223
arm                  randconfig-c002-20211224
ia64                             allmodconfig
ia64                                defconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
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
x86_64               randconfig-a013-20211223
x86_64               randconfig-a015-20211223
x86_64               randconfig-a014-20211223
x86_64               randconfig-a011-20211223
x86_64               randconfig-a012-20211223
x86_64               randconfig-a016-20211223
i386                 randconfig-a012-20211223
i386                 randconfig-a011-20211223
i386                 randconfig-a014-20211223
i386                 randconfig-a016-20211223
i386                 randconfig-a015-20211223
i386                 randconfig-a013-20211223
arc                  randconfig-r043-20211223
riscv                randconfig-r042-20211223
s390                 randconfig-r044-20211223
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20211223
x86_64               randconfig-a003-20211223
x86_64               randconfig-a005-20211223
x86_64               randconfig-a006-20211223
x86_64               randconfig-a004-20211223
x86_64               randconfig-a002-20211223
i386                 randconfig-a006-20211223
i386                 randconfig-a004-20211223
i386                 randconfig-a002-20211223
i386                 randconfig-a003-20211223
i386                 randconfig-a005-20211223
i386                 randconfig-a001-20211223
x86_64               randconfig-a013-20211224
x86_64               randconfig-a014-20211224
x86_64               randconfig-a015-20211224
x86_64               randconfig-a012-20211224
x86_64               randconfig-a011-20211224
x86_64               randconfig-a016-20211224
hexagon              randconfig-r041-20211223
hexagon              randconfig-r045-20211223

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
