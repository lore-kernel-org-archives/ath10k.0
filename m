Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E5DC4332F
	for <ath10k@archiver.kernel.org>; Wed, 19 Jan 2022 21:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ySfsn2YTtQgxJQxsLioF+NlFWGQagTRJ43T95kfwss=; b=gEzv0vj+LlAZ5H
	ryetQBVTaowTGKsjCn5FqfR8c/i2mc3z6JRGWRvfOH+NKJiuEhSHKRpI7JhrSk4YbbWd3T7a3WiZt
	u/Q+9r/TRAif/cftXvSXX01wBQHTzTt7dUz0Tn0Xslia7HfoJlOdx26ul9YCYD0FEX+IPx5bkaOjE
	pkPGRY7X6Pq2O3wD5U1FdivZtydkKQqfqBq9MjN5gyJpInmV9lRAysnyvnrF4sI+FtfnkFYWGz8+l
	T3Eu40qgt6iWGlmgV1a2eH/6d21b/JsJ2TumOa6kiHTaXbIzGCAgGXc394ad/ULgYI9eiiZYHcgZn
	HlCUL11d6Fi7lAsrQ6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAIfL-007Wzo-0b; Wed, 19 Jan 2022 21:38:51 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAIfG-007Wy8-Ts
 for ath10k@lists.infradead.org; Wed, 19 Jan 2022 21:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642628326; x=1674164326;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=sV5EnlzEvlqDEZLHfbsTjrRLoKcnOGIJMqiGsbYnPtg=;
 b=TRpFfPLNINe+IBverSxQp6QUp0HZcASCL4VQUhWFClxOFxDV1pWw3/wb
 cUth5D3QnTitU1799vpbsQX6hUqgpjoq2UH3G4qYZqJueN5j2SAXgnODF
 OZ4afrG5TDzxNvPZ8oT6X1kPmvZ/0KqiVlOFOnVytM/Org34ASKqoI4JP
 7x046H2iTg/7mgRh5RC159Ax1zsKzO97MG4QQIvcuo/Tx90JRM3u9zf95
 RvSNzEmoa9tyo4YQfKXMpyYwWIfUj7V0iaXIXuMm9vusmmWK76ul4F7qp
 W7hRnTa/OnNCcFBUWC4Pr6j39mGheEsnHPOM+oa9ollLcos5LHTi9GjgO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244992953"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="244992953"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="578975516"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jan 2022 13:38:41 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nAIfB-000Dls-B7; Wed, 19 Jan 2022 21:38:41 +0000
Date: Thu, 20 Jan 2022 05:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 51395cf204f27a466fd74c1d328fce1d3283166c
Message-ID: <61e884ca.Eo9w/WyZ6Rfbkh8s%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_133847_051157_964D5E61 
X-CRM114-Status: UNSURE (   5.94  )
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
branch HEAD: 51395cf204f27a466fd74c1d328fce1d3283166c  wcn36xx: Add SNR reporting via get_survey()

elapsed time: 726m

configs tested: 202
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220117
mips                 randconfig-c004-20220117
powerpc              randconfig-c003-20220118
i386                          randconfig-c001
powerpc              randconfig-c003-20220117
arc                        vdk_hs38_defconfig
m68k                            q40_defconfig
sh                ecovec24-romimage_defconfig
mips                             allmodconfig
arc                          axs101_defconfig
sh                            migor_defconfig
arm                        shmobile_defconfig
s390                             allyesconfig
sh                           se7712_defconfig
ia64                        generic_defconfig
nios2                            alldefconfig
sh                         ap325rxa_defconfig
sh                          urquell_defconfig
arc                           tb10x_defconfig
mips                         mpc30x_defconfig
sh                         ecovec24_defconfig
riscv                            allyesconfig
sh                         microdev_defconfig
arc                            hsdk_defconfig
arm                         lubbock_defconfig
powerpc                     tqm8555_defconfig
sh                          sdk7786_defconfig
arm                      footbridge_defconfig
powerpc                  iss476-smp_defconfig
mips                        bcm47xx_defconfig
sh                            shmin_defconfig
h8300                    h8300h-sim_defconfig
sh                          rsk7201_defconfig
powerpc                 linkstation_defconfig
powerpc                     tqm8548_defconfig
um                               alldefconfig
mips                           ip32_defconfig
m68k                        m5407c3_defconfig
powerpc                     taishan_defconfig
mips                       bmips_be_defconfig
sh                     magicpanelr2_defconfig
openrisc                            defconfig
sh                   sh7770_generic_defconfig
arm                        oxnas_v6_defconfig
powerpc                    klondike_defconfig
um                             i386_defconfig
csky                             alldefconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
sh                          r7780mp_defconfig
m68k                          hp300_defconfig
powerpc                      chrp32_defconfig
xtensa                         virt_defconfig
powerpc                        cell_defconfig
mips                  maltasmvp_eva_defconfig
xtensa                       common_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                      maltasmvp_defconfig
sh                             sh03_defconfig
sh                          sdk7780_defconfig
m68k                         apollo_defconfig
arm                         s3c6400_defconfig
arm                       multi_v4t_defconfig
arc                        nsim_700_defconfig
arm                           tegra_defconfig
mips                      loongson3_defconfig
openrisc                    or1ksim_defconfig
xtensa                    smp_lx200_defconfig
powerpc                      ep88xc_defconfig
nios2                         10m50_defconfig
powerpc                        warp_defconfig
powerpc                       eiger_defconfig
arm                          gemini_defconfig
arc                     haps_hs_smp_defconfig
arm                      integrator_defconfig
mips                      fuloong2e_defconfig
arm                          badge4_defconfig
sh                              ul2_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
arm                  randconfig-c002-20220119
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
sh                               allmodconfig
parisc                              defconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a016-20220117
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a015-20220117
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a012-20220117
i386                 randconfig-a016-20220117
i386                 randconfig-a014-20220117
i386                 randconfig-a015-20220117
i386                 randconfig-a011-20220117
i386                 randconfig-a013-20220117
riscv                randconfig-r042-20220119
s390                 randconfig-r044-20220119
arc                  randconfig-r043-20220119
riscv                randconfig-r042-20220117
arc                  randconfig-r043-20220116
arc                  randconfig-r043-20220117
s390                 randconfig-r044-20220117
arc                  randconfig-r043-20220118
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
arm                  randconfig-c002-20220118
arm                  randconfig-c002-20220119
riscv                randconfig-c006-20220119
riscv                randconfig-c006-20220118
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
powerpc              randconfig-c003-20220119
powerpc              randconfig-c003-20220118
i386                          randconfig-c001
s390                 randconfig-c005-20220119
mips                 randconfig-c004-20220119
mips                 randconfig-c004-20220116
arm                                 defconfig
riscv                            alldefconfig
arm                            mmp2_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     kilauea_defconfig
arm                  colibri_pxa300_defconfig
mips                           ip22_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                   sb1250_swarm_defconfig
i386                             allyesconfig
powerpc               mpc834x_itxgp_defconfig
arm                         socfpga_defconfig
powerpc                   bluestone_defconfig
arm                        spear3xx_defconfig
arm                          ep93xx_defconfig
powerpc                  mpc866_ads_defconfig
hexagon                             defconfig
mips                      maltaaprp_defconfig
x86_64               randconfig-a005-20220117
x86_64               randconfig-a004-20220117
x86_64               randconfig-a001-20220117
x86_64               randconfig-a006-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
i386                 randconfig-a005-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
