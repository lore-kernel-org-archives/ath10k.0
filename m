Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E9AC433F5
	for <ath10k@archiver.kernel.org>; Sat, 26 Feb 2022 01:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B9bhwLmSOiofPd7Kf7w4/qD2xz6/nzFPk47MqJsfmro=; b=DAMMO3BYIw9luq
	onQnpokcnuK4c0r8IhXsujX80wWAJD1/dUF5f3s0tbmKrHOlGGcZt5wj8qYIEmk/i8hDrgg1Fvtlf
	itnVBDwZs+kdcqYX/36nIlLsbMY8LuHV0vqwGvJ0+cucSFApbDqEdJyQaLr20aIgkb3ha10TGNS/x
	UqZN/W9UgYd0vYfuCiJjVC1q4BgBGKAi6G84RL2ISjyY9Nxq4ybzkftq21uL+5oL+UG+a+RkK3qrU
	rF68PcJKTuuoyCUB23fbb9NfiRfbZcynM9l63ckrZJBUoVGiGYgvYpAHdqO/q9UbokvWfCg8Gq28H
	8idaitcnEDw0sQVJqHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNmK6-007Lin-ME; Sat, 26 Feb 2022 01:56:38 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNmK3-007LiB-Gv
 for ath10k@lists.infradead.org; Sat, 26 Feb 2022 01:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645840595; x=1677376595;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=IGqlHC4ICFARvj3cAgzXXP1zb8mUP79BIGOzooJ1aCo=;
 b=czNsr5pGiT85Lun8E1z7yVdIc/MygS/nroCvI44UjqOxxjsubDKsdYsp
 2o5Cg7P+XCJw+vAHd+7x9bVVUVfdnMsj3aAySDEUaxYz7Q69eYi5flKGv
 O6V/k29eREEBwWTwWLjwODirOOrID8t3k9u08mRDWDpee1ggUu7QgsyFR
 ZGgxn5/vJ6o1oNSwZvQsxoWuiTiyN+PpnwfHmfos7xAIUmF8S9pPrr61g
 mlUfQjZ7PYXtJXqrB5uAtmquqF2Ez4ctH5U0ASZr8RnkswZlnnf0r636l
 tG5NvzZTlLJYvgDsvWmG8EYt3a2aId2X8D7uHVMY9hDyp9gKWMHW4zRf/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="236126087"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="236126087"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 17:56:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="777578928"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 25 Feb 2022 17:56:32 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nNmJz-0004vo-Og; Sat, 26 Feb 2022 01:56:31 +0000
Date: Sat, 26 Feb 2022 09:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 35981e0bcc7ba83bb42f786486a0d5696cb36ecd
Message-ID: <6219889e.rOGNPkuKVvz2Qtln%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_175635_644030_B5434F67 
X-CRM114-Status: UNSURE (   5.81  )
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
branch HEAD: 35981e0bcc7ba83bb42f786486a0d5696cb36ecd  ath6kl: wmi: Replace one-element array with flexible-array member in struct wmi_aplist_event

elapsed time: 722m

configs tested: 126
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
mips                 randconfig-c004-20220225
powerpc              randconfig-c003-20220225
s390                          debug_defconfig
arm                        shmobile_defconfig
sh                         microdev_defconfig
xtensa                           allyesconfig
sh                          sdk7780_defconfig
powerpc                     asp8347_defconfig
arm                          exynos_defconfig
arm                           tegra_defconfig
xtensa                         virt_defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                       m5475evb_defconfig
powerpc                     tqm8548_defconfig
arm                            zeus_defconfig
arc                            hsdk_defconfig
arm                        keystone_defconfig
arm                           sama5_defconfig
microblaze                      mmu_defconfig
arm                           h5000_defconfig
parisc                generic-64bit_defconfig
powerpc                     tqm8555_defconfig
h8300                               defconfig
arc                          axs103_defconfig
mips                     decstation_defconfig
mips                         tb0226_defconfig
um                               alldefconfig
arm                      integrator_defconfig
arm                  randconfig-c002-20220225
arm                  randconfig-c002-20220226
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
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
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220225
s390                 randconfig-r044-20220226
riscv                randconfig-r042-20220226
arc                  randconfig-r043-20220226
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
arm                        vexpress_defconfig
arm                        magician_defconfig
mips                malta_qemu_32r6_defconfig
arm                         lpc32xx_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     ppa8548_defconfig
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
hexagon              randconfig-r041-20220226
hexagon              randconfig-r045-20220226
s390                 randconfig-r044-20220225
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
