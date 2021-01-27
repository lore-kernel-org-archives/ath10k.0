Return-Path: <SRS0=gRR+=G6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C40C433DB
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 10:30:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF361206F4
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 10:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF361206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4zYh8e+7uWRxhPYNzyvDh7eieqXbXHaVyahfsLw2btw=; b=vw617emP47BgEqQkFMc/r/oOtH
	OD3cYS/k/Tjhk1HB6SsFgZsxnmM7ut6MoSy9TdP/Vfc/j+SgNps3XxXyqZ/eGhfAtB5T12dGScgLr
	pyAJsI2eKrl/gPz9LNIvEVG7pGVMW2pX2YobkxsmBz64tQ/NLwC73taMmCYO9xFRL+x625XfnAy+G
	ksqxmtAyDephaHiAQjNOOU2VcqR+QT6mM47DRoWzpr1Jd8t+DcYd5ks7r7BtMhiVJDaSAF1hXIP7V
	lSbdJkF/XcFmjWoVTP7KmsEyHRG/9+Jik/2I/7U7d/lZ05VEN71ZAXd0wHTcGxenG2K0FVTdqxkVs
	hNfV2IWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4i5B-00088w-Df; Wed, 27 Jan 2021 10:29:53 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4i57-00088G-W7
 for ath10k@lists.infradead.org; Wed, 27 Jan 2021 10:29:51 +0000
IronPort-SDR: 1b7/M+ogSNtQRHetR7iPOhK5QLu8lDAkS11EXt2WEs0A3NryKiwW5IWLMX76fmbyMxz46v3/kc
 oHJN2XWkWB3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="198853389"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="198853389"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2021 02:29:47 -0800
IronPort-SDR: yNAG8tOTH3LHtb7urrlL5VFURtN1qYfruz5mhqbn+0AhDro9LcOMzSlEJ6NxLSTOJcXJsoUK0R
 LMWLv0euwWIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; d="scan'208";a="362379011"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2021 02:29:46 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l4i53-0001W6-Td; Wed, 27 Jan 2021 10:29:45 +0000
Date: Wed, 27 Jan 2021 18:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:pending] BUILD SUCCESS
 5c94a82422585f88765f58e0f8b4b84c1fabbb31
Message-ID: <6011406a.uJWyHYO7ek+kWCPv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_052950_202625_FE57701E 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 5c94a82422585f88765f58e0f8b4b84c1fabbb31  ath9k: fix build error with LEDS_CLASS=m

elapsed time: 736m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
powerpc                     redwood_defconfig
m68k                          atari_defconfig
m68k                             allmodconfig
powerpc                     tqm8540_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                        warp_defconfig
powerpc                     tqm8560_defconfig
powerpc                      ppc44x_defconfig
xtensa                generic_kc705_defconfig
nios2                         10m50_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        clps711x_defconfig
mips                     decstation_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
powerpc                         wii_defconfig
sh                           se7780_defconfig
sh                             sh03_defconfig
arm                      footbridge_defconfig
m68k                        m5272c3_defconfig
sh                        edosk7705_defconfig
mips                         tb0287_defconfig
sh                          polaris_defconfig
xtensa                    smp_lx200_defconfig
parisc                generic-32bit_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     kilauea_defconfig
powerpc                     tqm8541_defconfig
arm                            lart_defconfig
openrisc                            defconfig
powerpc                        cell_defconfig
riscv                            allmodconfig
xtensa                    xip_kc705_defconfig
arm                       imx_v6_v7_defconfig
arm                        realview_defconfig
arm                         vf610m4_defconfig
alpha                               defconfig
mips                           ci20_defconfig
mips                         rt305x_defconfig
mips                  cavium_octeon_defconfig
arm                       netwinder_defconfig
powerpc                      katmai_defconfig
arm                           viper_defconfig
arm                        trizeps4_defconfig
arm                  colibri_pxa300_defconfig
powerpc                     taishan_defconfig
arm                            hisi_defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                                 defconfig
um                           x86_64_defconfig
arm                         lubbock_defconfig
powerpc                      acadia_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc837x_mds_defconfig
arm                      integrator_defconfig
powerpc                    adder875_defconfig
arm                       cns3420vb_defconfig
um                            kunit_defconfig
arm                             pxa_defconfig
parisc                           alldefconfig
powerpc                 mpc832x_rdb_defconfig
arm                        spear6xx_defconfig
arm                        spear3xx_defconfig
powerpc                           allnoconfig
arc                         haps_hs_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
arm                        multi_v7_defconfig
nds32                               defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20210127
x86_64               randconfig-a002-20210127
x86_64               randconfig-a001-20210127
x86_64               randconfig-a005-20210127
x86_64               randconfig-a006-20210127
x86_64               randconfig-a004-20210127
i386                 randconfig-a001-20210126
i386                 randconfig-a002-20210126
i386                 randconfig-a004-20210126
i386                 randconfig-a006-20210126
i386                 randconfig-a003-20210126
i386                 randconfig-a005-20210126
x86_64               randconfig-a012-20210126
x86_64               randconfig-a016-20210126
x86_64               randconfig-a015-20210126
x86_64               randconfig-a011-20210126
x86_64               randconfig-a013-20210126
x86_64               randconfig-a014-20210126
i386                 randconfig-a013-20210126
i386                 randconfig-a011-20210126
i386                 randconfig-a012-20210126
i386                 randconfig-a015-20210126
i386                 randconfig-a014-20210126
i386                 randconfig-a016-20210126
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210126
x86_64               randconfig-a002-20210126
x86_64               randconfig-a001-20210126
x86_64               randconfig-a005-20210126
x86_64               randconfig-a006-20210126
x86_64               randconfig-a004-20210126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
