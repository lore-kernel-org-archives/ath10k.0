Return-Path: <SRS0=eV2A=QE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BABC433EF
	for <ath10k@archiver.kernel.org>; Wed, 17 Nov 2021 20:24:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DF8261AEC
	for <ath10k@archiver.kernel.org>; Wed, 17 Nov 2021 20:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DF8261AEC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IoCtT0aEoRaVbNJtqOclZQPhmVqb8QkL9Ta2wGWRuRE=; b=Eh/jVnsn2pQBvN
	aEKAq655PMQA0TKHFHAzTFIdiCjrVp9zcR/3PDpySHCAy33VIjAxtCUFgQIGsy3bsEED17SMjXI62
	Pq2kJ/0A7sleyu1tQVUA9GM3Fyd/CBCFVJR7GiVo6EZ/venJIsEl3/qc/rY5fFCxZ8mkjMJ9fKLkm
	wfMFbhZYJs6SyFF7s0Hy5S2ZiSibY/3e5cSdC8shq0ixFxTtuEV04Ri88t7z+hk2ybVId/D+hpSQM
	T4+BZK75mzBnXIoG1bOKLl8TGQP9nmDY1k+MIoFQPE0Pxm7AVt73SrOoHxXoePwJBJQL2eim1nN7+
	kbq62r0n+ZR1SVTKi76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnRSm-006EjT-04; Wed, 17 Nov 2021 20:23:24 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnRSi-006EiB-7C
 for ath10k@lists.infradead.org; Wed, 17 Nov 2021 20:23:21 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221261293"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="221261293"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 12:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="455027781"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 17 Nov 2021 12:23:15 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mnRSc-0002Br-8u; Wed, 17 Nov 2021 20:23:14 +0000
Date: Thu, 18 Nov 2021 04:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 64bc3aa02ae78b1fcb1b850e0eb1f0622002bfaa
Message-ID: <61956495.vPQgKSowEx17nlvz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_122320_337294_054284E6 
X-CRM114-Status: UNSURE (   6.42  )
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
branch HEAD: 64bc3aa02ae78b1fcb1b850e0eb1f0622002bfaa  ath11k: reset RSN/WPA present state for open BSS

elapsed time: 724m

configs tested: 170
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211117
powerpc              randconfig-c003-20211117
s390                       zfcpdump_defconfig
arm                          gemini_defconfig
powerpc                      mgcoge_defconfig
ia64                          tiger_defconfig
arm                         lpc18xx_defconfig
sh                          urquell_defconfig
nios2                         10m50_defconfig
powerpc                   currituck_defconfig
arm                          collie_defconfig
powerpc                     kilauea_defconfig
sh                          rsk7269_defconfig
riscv                            alldefconfig
alpha                               defconfig
powerpc                     stx_gp3_defconfig
arc                     nsimosci_hs_defconfig
mips                     loongson2k_defconfig
x86_64                           allyesconfig
powerpc               mpc834x_itxgp_defconfig
x86_64                              defconfig
mips                         cobalt_defconfig
powerpc                    adder875_defconfig
ia64                                defconfig
sh                         apsh4a3a_defconfig
arm                          ep93xx_defconfig
mips                          ath79_defconfig
sh                         ecovec24_defconfig
openrisc                         alldefconfig
powerpc                     pq2fads_defconfig
powerpc                 mpc8272_ads_defconfig
sh                           se7712_defconfig
mips                          rb532_defconfig
arm                          simpad_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    ge_imp3a_defconfig
um                           x86_64_defconfig
sh                   secureedge5410_defconfig
s390                             allmodconfig
mips                      loongson3_defconfig
h8300                       h8s-sim_defconfig
arm                           stm32_defconfig
xtensa                    smp_lx200_defconfig
m68k                        mvme147_defconfig
powerpc                     mpc83xx_defconfig
sh                   sh7724_generic_defconfig
mips                      malta_kvm_defconfig
powerpc                 mpc832x_mds_defconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
sh                          lboxre2_defconfig
powerpc                         ps3_defconfig
ia64                        generic_defconfig
powerpc                    socrates_defconfig
m68k                          atari_defconfig
mips                      bmips_stb_defconfig
powerpc                      cm5200_defconfig
arm                        mvebu_v7_defconfig
arm                          exynos_defconfig
powerpc                   motionpro_defconfig
arm                       omap2plus_defconfig
powerpc                 xes_mpc85xx_defconfig
sparc                       sparc32_defconfig
riscv                          rv32_defconfig
m68k                        stmark2_defconfig
powerpc                     mpc5200_defconfig
arm                       aspeed_g5_defconfig
sh                           se7619_defconfig
arm                              alldefconfig
sh                 kfr2r09-romimage_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                        cell_defconfig
um                             i386_defconfig
powerpc                       holly_defconfig
xtensa                              defconfig
arm                            mps2_defconfig
sh                        edosk7705_defconfig
m68k                         amcore_defconfig
arm                           tegra_defconfig
powerpc                 mpc837x_mds_defconfig
ia64                             alldefconfig
arc                        nsimosci_defconfig
arc                         haps_hs_defconfig
sh                        apsh4ad0a_defconfig
arm                         s3c2410_defconfig
h8300                            alldefconfig
mips                         tb0287_defconfig
powerpc64                           defconfig
powerpc                      acadia_defconfig
arm                       versatile_defconfig
arm                            dove_defconfig
arm                  randconfig-c002-20211117
ia64                             allmodconfig
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
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211117
x86_64               randconfig-a003-20211117
x86_64               randconfig-a002-20211117
x86_64               randconfig-a001-20211117
x86_64               randconfig-a006-20211117
x86_64               randconfig-a004-20211117
i386                 randconfig-a006-20211117
i386                 randconfig-a003-20211117
i386                 randconfig-a005-20211117
i386                 randconfig-a001-20211117
i386                 randconfig-a004-20211117
i386                 randconfig-a002-20211117
arc                  randconfig-r043-20211117
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211117
i386                 randconfig-c001-20211117
arm                  randconfig-c002-20211117
riscv                randconfig-c006-20211117
powerpc              randconfig-c003-20211117
s390                 randconfig-c005-20211117
mips                 randconfig-c004-20211117
x86_64               randconfig-a015-20211117
x86_64               randconfig-a013-20211117
x86_64               randconfig-a011-20211117
x86_64               randconfig-a012-20211117
x86_64               randconfig-a016-20211117
x86_64               randconfig-a014-20211117
i386                 randconfig-a014-20211117
i386                 randconfig-a016-20211117
i386                 randconfig-a012-20211117
i386                 randconfig-a013-20211117
i386                 randconfig-a011-20211117
i386                 randconfig-a015-20211117
hexagon              randconfig-r045-20211117
hexagon              randconfig-r041-20211117
s390                 randconfig-r044-20211117
riscv                randconfig-r042-20211117

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
