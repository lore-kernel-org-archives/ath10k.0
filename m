Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AEBC433EF
	for <ath10k@archiver.kernel.org>; Thu, 13 Jan 2022 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BRqwD8R8OZpx0tIYa6+avQZGBMeX6a6FLq0stY8WaBQ=; b=KBdnChBJDZl0HK
	Dw4VgBm+AOe8tsJMN93HNNl94vqAiECaECu1cyPje+h++WrSwR4HIeIiw+DqqMTIZoISfhGuDBsGF
	+2MsddqYaBg/jV6GGtX3tTPRrELlBdvQTsF9f48JM24oItnlE/XERB4MRq00NHGn7GYzVrHzGl+jd
	I6eTkd5msQfDbh6esx/VrwMGrV7YprgcCe11PPqnXg3ls+UM22E0Okxy2lOfJ2t/Fyk7MgkW/kAWs
	quuxF03FKn0UrRNopefYNziriDqP/ZVat86+KMhtulYAPI0d2p12Cgz+t6Lend2TVGD/vLGTh1NwK
	4CrkNeXiAqfboEhpYMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n80gH-006C37-HZ; Thu, 13 Jan 2022 14:02:21 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n80gE-006C2p-IV
 for ath10k@lists.infradead.org; Thu, 13 Jan 2022 14:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642082538; x=1673618538;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=XCsPqJLQA2l0dOXBHceLIDUHsxi0Ti+oshy92hutMgE=;
 b=A45J7XyZZpmXKZl8/J5tNdy8aSo1hPhwsa4m96fK+dz0KZe7KCs/rlYK
 XywMocKqrkuBgI+OyrMLKU9zDzyjCSuMAASkUGwXlhoKvEgyC3oo2QeA9
 jNOHgaEdc9EEju2ojwIc6ya2DOApQFaRsD22T4upgfc+Z9dOCTXDJcyx6
 7dhb5NwcELXjSyktBxLt0/vGc6VfmkZPvaVZAhVWq696fHSWp5SWanyTm
 Ll67oz0tFxgv5IBuYwHjtdgn80wrY3MRzcQFPsTLQY+SUUtHpt/+uDdag
 sxeqJZpqnw6J3WR4trhFq4Q+EWNwls3x0kOnOzWjhsL6Vo0y3//LtvxeW Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="268363605"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="268363605"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 06:01:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="473221909"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 13 Jan 2022 06:01:50 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n80fl-0007HC-Gg; Thu, 13 Jan 2022 14:01:49 +0000
Date: Thu, 13 Jan 2022 22:01:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 ea6d15c16241965bbdfb4967a354ccd1bf88cda3
Message-ID: <61e030c1.75vawnCVF/BwDU69%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_060218_867986_04562336 
X-CRM114-Status: UNSURE (   6.58  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: ea6d15c16241965bbdfb4967a354ccd1bf88cda3  Merge branch 'ath-next' into ath-qca

elapsed time: 1761m

configs tested: 154
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
mips                 randconfig-c004-20220112
arm                           corgi_defconfig
ia64                        generic_defconfig
arm                            xcep_defconfig
powerpc                       holly_defconfig
mips                         tb0226_defconfig
sh                           se7722_defconfig
mips                            ar7_defconfig
parisc                           allyesconfig
mips                        vocore2_defconfig
sh                          lboxre2_defconfig
sh                          rsk7269_defconfig
sh                          r7780mp_defconfig
arm                         vf610m4_defconfig
arm                             pxa_defconfig
m68k                          atari_defconfig
powerpc                    klondike_defconfig
arm                           stm32_defconfig
powerpc                      bamboo_defconfig
csky                             alldefconfig
powerpc                      mgcoge_defconfig
x86_64                              defconfig
powerpc                         wii_defconfig
arm                        realview_defconfig
powerpc                  storcenter_defconfig
arm                         assabet_defconfig
sh                          polaris_defconfig
arm                       aspeed_g5_defconfig
mips                      maltasmvp_defconfig
mips                           ci20_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
ia64                             alldefconfig
mips                     decstation_defconfig
powerpc                        warp_defconfig
mips                  maltasmvp_eva_defconfig
xtensa                  audio_kc705_defconfig
mips                 decstation_r4k_defconfig
arm                         cm_x300_defconfig
arm                            qcom_defconfig
parisc                           alldefconfig
arm                        spear6xx_defconfig
xtensa                  cadence_csp_defconfig
powerpc                    adder875_defconfig
ia64                                defconfig
sh                     sh7710voipgw_defconfig
arm                      integrator_defconfig
powerpc                  iss476-smp_defconfig
powerpc                     taishan_defconfig
arm                          simpad_defconfig
xtensa                generic_kc705_defconfig
nios2                            allyesconfig
mips                           ip32_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                    sam440ep_defconfig
arc                            hsdk_defconfig
sh                           se7751_defconfig
sh                           se7724_defconfig
mips                     loongson1b_defconfig
powerpc                      cm5200_defconfig
arm                  randconfig-c002-20220113
arm                  randconfig-c002-20220112
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
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
s390                                defconfig
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
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func

clang tested configs:
arm                  randconfig-c002-20220113
x86_64                        randconfig-c007
riscv                randconfig-c006-20220113
powerpc              randconfig-c003-20220113
i386                          randconfig-c001
mips                 randconfig-c004-20220113
powerpc              randconfig-c003-20220112
s390                 randconfig-c005-20220112
mips                 randconfig-c004-20220112
arm                  randconfig-c002-20220112
riscv                randconfig-c006-20220112
arm                         shannon_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                          collie_defconfig
arm                          pcm027_defconfig
arm                     am200epdkit_defconfig
arm                         palmz72_defconfig
arm                          imote2_defconfig
arm                             mxs_defconfig
arm                          pxa168_defconfig
mips                          rm200_defconfig
arm                          ixp4xx_defconfig
hexagon                             defconfig
arm                        spear3xx_defconfig
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
hexagon              randconfig-r045-20220112
riscv                randconfig-r042-20220112
hexagon              randconfig-r041-20220112

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
