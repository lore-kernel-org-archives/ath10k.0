Return-Path: <SRS0=prmI=NW=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F07C4320A
	for <ath10k@archiver.kernel.org>; Tue, 31 Aug 2021 10:36:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF5860C3E
	for <ath10k@archiver.kernel.org>; Tue, 31 Aug 2021 10:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EF5860C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3VFBymqKPaDDtlHVQaeKct21raT0aqjaOChrW9l2zlU=; b=DTSQ2CYKAjc0Gf
	6Y9xrafZEufxD9GlqPv9BQXYoel0ZPGw7fXwR2Zy+X6kv6jZho8jddpqHmRBpFnEQkIRXU9pI4u9o
	x716U00IxLgLIpY0m9dlrD3x7nGyQ7YYojgJyOm6zi987e+xpY36f/rzIBVtNDALGD/CWM5wEHYU9
	0Ru51xRxRhSLIWY6maNuSAjRMd/Y/9QGC4L/bsRlLVyOyENNWOAfys1ek5SSZk5toJTYTVn8TRcna
	NffcNhi5MuHOinPsAUr5oEV2ZDfu+n5tZ1bNGlrj6GOUp5A3HLxOccmXvMyL90xmrq0u+TSmSbE0L
	X+TJoVHsJUSfaJl+Hmhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL18B-0023JM-Lu; Tue, 31 Aug 2021 10:36:39 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL186-0023If-5I
 for ath10k@lists.infradead.org; Tue, 31 Aug 2021 10:36:38 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="205665878"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="205665878"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 03:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="687660550"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2021 03:36:26 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mL17x-0006Ok-LG; Tue, 31 Aug 2021 10:36:25 +0000
Date: Tue, 31 Aug 2021 18:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:pending] BUILD SUCCESS
 9c48ba9b7907261ae87dc0629fe44155fcfe5d09
Message-ID: <612e05fe.WlLEwo4BlB9K/Klg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_033634_304962_224B041D 
X-CRM114-Status: UNSURE (   6.35  )
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
branch HEAD: 9c48ba9b7907261ae87dc0629fe44155fcfe5d09  ath9k: owl-loader: fetch pci init values through nvmem

elapsed time: 2302m

configs tested: 197
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210831
arc                 nsimosci_hs_smp_defconfig
m68k                          atari_defconfig
arm                         s3c2410_defconfig
sh                          rsk7201_defconfig
arm                          gemini_defconfig
powerpc64                           defconfig
powerpc                      arches_defconfig
arm                         vf610m4_defconfig
mips                           ci20_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                          hp300_defconfig
sh                          kfr2r09_defconfig
arm                       versatile_defconfig
m68k                                defconfig
xtensa                  nommu_kc705_defconfig
m68k                       m5249evb_defconfig
powerpc                 canyonlands_defconfig
sh                           sh2007_defconfig
mips                         cobalt_defconfig
arm                            xcep_defconfig
powerpc                      katmai_defconfig
arm                         s5pv210_defconfig
mips                           mtx1_defconfig
sh                          r7785rp_defconfig
arm                      jornada720_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     pq2fads_defconfig
arm                         s3c6400_defconfig
sh                        apsh4ad0a_defconfig
arm                         hackkit_defconfig
nios2                         3c120_defconfig
arm                            dove_defconfig
mips                     cu1830-neo_defconfig
alpha                            alldefconfig
sh                            titan_defconfig
mips                       bmips_be_defconfig
powerpc                     tqm8541_defconfig
mips                           ip27_defconfig
powerpc               mpc834x_itxgp_defconfig
x86_64                              defconfig
sparc                       sparc32_defconfig
sh                           se7722_defconfig
arc                         haps_hs_defconfig
sh                             espt_defconfig
sh                        edosk7705_defconfig
arm                          imote2_defconfig
powerpc                     mpc5200_defconfig
arm                         bcm2835_defconfig
arm                       netwinder_defconfig
powerpc                     tqm8555_defconfig
mips                  cavium_octeon_defconfig
sh                          rsk7203_defconfig
mips                        qi_lb60_defconfig
arm                         orion5x_defconfig
openrisc                    or1ksim_defconfig
sh                          urquell_defconfig
powerpc                    adder875_defconfig
m68k                          sun3x_defconfig
powerpc                        icon_defconfig
powerpc                      tqm8xx_defconfig
arm                          exynos_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210831
x86_64               randconfig-a001-20210831
x86_64               randconfig-a003-20210831
x86_64               randconfig-a002-20210831
x86_64               randconfig-a004-20210831
x86_64               randconfig-a006-20210831
i386                 randconfig-a005-20210831
i386                 randconfig-a002-20210831
i386                 randconfig-a003-20210831
i386                 randconfig-a006-20210831
i386                 randconfig-a004-20210831
i386                 randconfig-a001-20210831
x86_64               randconfig-a014-20210830
x86_64               randconfig-a015-20210830
x86_64               randconfig-a013-20210830
x86_64               randconfig-a016-20210830
x86_64               randconfig-a012-20210830
x86_64               randconfig-a011-20210830
x86_64               randconfig-a014-20210829
x86_64               randconfig-a016-20210829
x86_64               randconfig-a015-20210829
x86_64               randconfig-a012-20210829
x86_64               randconfig-a013-20210829
x86_64               randconfig-a011-20210829
i386                 randconfig-a011-20210829
i386                 randconfig-a016-20210829
i386                 randconfig-a012-20210829
i386                 randconfig-a014-20210829
i386                 randconfig-a013-20210829
i386                 randconfig-a015-20210829
i386                 randconfig-a016-20210830
i386                 randconfig-a011-20210830
i386                 randconfig-a015-20210830
i386                 randconfig-a014-20210830
i386                 randconfig-a012-20210830
i386                 randconfig-a013-20210830
s390                 randconfig-r044-20210830
arc                  randconfig-r043-20210830
riscv                randconfig-r042-20210830
arc                  randconfig-r043-20210829
riscv                randconfig-r042-20210829
s390                 randconfig-r044-20210829
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210831
s390                 randconfig-c005-20210831
riscv                randconfig-c006-20210831
powerpc              randconfig-c003-20210831
mips                 randconfig-c004-20210831
arm                  randconfig-c002-20210831
x86_64               randconfig-c007-20210831
i386                 randconfig-c001-20210830
s390                 randconfig-c005-20210830
riscv                randconfig-c006-20210830
powerpc              randconfig-c003-20210830
mips                 randconfig-c004-20210830
arm                  randconfig-c002-20210830
x86_64               randconfig-c007-20210830
x86_64               randconfig-a005-20210830
x86_64               randconfig-a001-20210830
x86_64               randconfig-a003-20210830
x86_64               randconfig-a002-20210830
x86_64               randconfig-a004-20210830
x86_64               randconfig-a006-20210830
i386                 randconfig-a005-20210830
i386                 randconfig-a002-20210830
i386                 randconfig-a003-20210830
i386                 randconfig-a006-20210830
i386                 randconfig-a004-20210830
i386                 randconfig-a001-20210830
x86_64               randconfig-a014-20210831
x86_64               randconfig-a015-20210831
x86_64               randconfig-a013-20210831
x86_64               randconfig-a016-20210831
x86_64               randconfig-a012-20210831
x86_64               randconfig-a011-20210831
i386                 randconfig-a016-20210831
i386                 randconfig-a011-20210831
i386                 randconfig-a015-20210831
i386                 randconfig-a014-20210831
i386                 randconfig-a012-20210831
i386                 randconfig-a013-20210831
s390                 randconfig-r044-20210831
hexagon              randconfig-r041-20210831
hexagon              randconfig-r045-20210831
riscv                randconfig-r042-20210831
hexagon              randconfig-r041-20210829
hexagon              randconfig-r045-20210829

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
