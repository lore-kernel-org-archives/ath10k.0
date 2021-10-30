Return-Path: <SRS0=GKjs=PS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB852C433F5
	for <ath10k@archiver.kernel.org>; Sat, 30 Oct 2021 02:04:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8173060E98
	for <ath10k@archiver.kernel.org>; Sat, 30 Oct 2021 02:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8173060E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qoe/mgYrNy8bofU8bFEky7Bd5cvARDT/7/jk9dC7Otw=; b=xUmq28mL+nvkSW
	9vtqgRe83docuiIYb7X3HnyRw63IuKMJ/Oi5ginQfG7TWqH4zXAfqUiEXloANWmRW8CJoqvGB64ne
	AKL4RNLB12ruP4RA1e6RxkSzVy1MoZB4m4gj5n0xtKU8YKlRrWs27PzyNuhVttyvLMAHXplVLn/vK
	QCNJdnT5vvUrRzN7xl1FCqTy9EdG/WucmxLk1lFujF9exxbVlnIHBM0a1Jeqi7rbbLgqwgc0IM4Kt
	QaSmMWCpHBWz7esc+Yv5y1XrIHbUeUjsB2gnoosfsavD/+R9rV+uypAFF4SIYjkLtAqCY67DaatSC
	+los8UPfeFa9DYpx8OPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgdjQ-00CdKH-Ap; Sat, 30 Oct 2021 02:04:28 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgdjM-00CdK0-LV
 for ath10k@lists.infradead.org; Sat, 30 Oct 2021 02:04:26 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10152"; a="291625528"
X-IronPort-AV: E=Sophos;i="5.87,194,1631602800"; d="scan'208";a="291625528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 19:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,194,1631602800"; d="scan'208";a="666024565"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 29 Oct 2021 19:04:18 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mgdjG-0000wQ-4d; Sat, 30 Oct 2021 02:04:18 +0000
Date: Sat, 30 Oct 2021 10:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 c1b9ca365deae667192be9fe24db244919971234
Message-ID: <617ca7fb.8kLWQPkA7NqA2yrt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_190424_789871_9D273910 
X-CRM114-Status: UNSURE (   4.77  )
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
branch HEAD: c1b9ca365deae667192be9fe24db244919971234  ath6kl: fix division by zero in send path

elapsed time: 2467m

configs tested: 176
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211028
powerpc              randconfig-c003-20211028
s390                       zfcpdump_defconfig
powerpc                 mpc8272_ads_defconfig
arc                              alldefconfig
sh                            shmin_defconfig
powerpc                 canyonlands_defconfig
mips                        vocore2_defconfig
mips                         rt305x_defconfig
arm                   milbeaut_m10v_defconfig
arm                          exynos_defconfig
sh                           sh2007_defconfig
powerpc                  iss476-smp_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           xway_defconfig
parisc                generic-64bit_defconfig
powerpc                     pseries_defconfig
arm                          ixp4xx_defconfig
arm                        trizeps4_defconfig
nios2                         3c120_defconfig
arc                         haps_hs_defconfig
m68k                       m5249evb_defconfig
arc                     nsimosci_hs_defconfig
sh                     magicpanelr2_defconfig
sh                          lboxre2_defconfig
arm                            lart_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                      loongson3_defconfig
arm                            mps2_defconfig
mips                   sb1250_swarm_defconfig
sh                          r7785rp_defconfig
arm                       netwinder_defconfig
h8300                               defconfig
arm                           sunxi_defconfig
mips                      fuloong2e_defconfig
arm                           h3600_defconfig
arm                         s5pv210_defconfig
s390                             alldefconfig
arm                         socfpga_defconfig
mips                      malta_kvm_defconfig
arm                            pleb_defconfig
openrisc                    or1ksim_defconfig
powerpc                    sam440ep_defconfig
powerpc                      mgcoge_defconfig
sh                           se7751_defconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                            mac_defconfig
um                               alldefconfig
sh                           se7705_defconfig
mips                      bmips_stb_defconfig
arm                           u8500_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         shannon_defconfig
nios2                         10m50_defconfig
arm64                            alldefconfig
powerpc                        warp_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                     tqm5200_defconfig
arm                           stm32_defconfig
arm                           tegra_defconfig
m68k                        stmark2_defconfig
arm                     davinci_all_defconfig
arm                       aspeed_g5_defconfig
arm                           omap1_defconfig
arm                          lpd270_defconfig
powerpc                 mpc832x_mds_defconfig
mips                          malta_defconfig
xtensa                          iss_defconfig
arm                          imote2_defconfig
mips                         tb0219_defconfig
arm                          ep93xx_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  randconfig-c002-20211028
arm                  randconfig-c002-20211029
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
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
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20211028
i386                 randconfig-a003-20211028
i386                 randconfig-a002-20211028
i386                 randconfig-a006-20211028
i386                 randconfig-a001-20211028
i386                 randconfig-a005-20211028
x86_64               randconfig-a015-20211029
x86_64               randconfig-a013-20211029
x86_64               randconfig-a011-20211029
x86_64               randconfig-a014-20211029
x86_64               randconfig-a012-20211029
x86_64               randconfig-a016-20211029
i386                 randconfig-a012-20211029
i386                 randconfig-a013-20211029
i386                 randconfig-a011-20211029
i386                 randconfig-a015-20211029
i386                 randconfig-a016-20211029
i386                 randconfig-a014-20211029
x86_64               randconfig-a002-20211028
x86_64               randconfig-a004-20211028
x86_64               randconfig-a005-20211028
x86_64               randconfig-a001-20211028
x86_64               randconfig-a006-20211028
x86_64               randconfig-a003-20211028
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
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211028
powerpc              randconfig-c003-20211028
riscv                randconfig-c006-20211028
x86_64               randconfig-c007-20211028
mips                 randconfig-c004-20211028
s390                 randconfig-c005-20211028
i386                 randconfig-c001-20211028
x86_64               randconfig-a015-20211028
x86_64               randconfig-a013-20211028
x86_64               randconfig-a011-20211028
x86_64               randconfig-a014-20211028
x86_64               randconfig-a012-20211028
x86_64               randconfig-a016-20211028
i386                 randconfig-a012-20211028
i386                 randconfig-a013-20211028
i386                 randconfig-a011-20211028
i386                 randconfig-a015-20211028
i386                 randconfig-a016-20211028
i386                 randconfig-a014-20211028
hexagon              randconfig-r045-20211028
riscv                randconfig-r042-20211028
s390                 randconfig-r044-20211028
hexagon              randconfig-r041-20211028
hexagon              randconfig-r045-20211029
hexagon              randconfig-r041-20211029

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
