Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580C4ECAAA1
	for <ath10k@archiver.kernel.org>; Fri, 16 Sep 2022 22:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Xo7zPp9+KEaK6TjzzZ9ewnBCRaRCIOh86wNkFbc9dI=; b=uMWglp8204c8kB
	dyA2iVsDlhhR8cC5uVeeX5Od2vCqO+bF4P9lk88TKMI4gFjJ9A/zRQ0CrIrQpaKijSJOBRnM1jCyq
	A7PJpK2SXa81fnSNbkcbtVCwa8PvJyj48NvmrYza56Spw+d+39Guu3oP/uIbg91iLeAQdYF3Drly/
	gPRnnUiZFdsMB44RbGZSL4SLTBY+BdrqskR752OWeZLQtJpaKck5NxuiT/PfWxigdG0+k1zbCm3Ng
	mGr1nnNX5hUWnOZELVZuXlhCY2aFS1ojxjxQQcMqQ86HOj2VYty8Ufje6K+zmTFj5JLD2Tv01sCUp
	Vq0jMF0Gfb1UTHdi9sOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJR8-00HRfu-1w; Fri, 16 Sep 2022 22:03:50 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJR2-00HRcE-G2
	for ath10k@lists.infradead.org; Fri, 16 Sep 2022 22:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663365824; x=1694901824;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cVZkTQFkFNfwMDP6MI/Wprv4Pv4wsbc5IOpl3u0Alts=;
  b=WdMSw0ujNik2MVcT1PjCoCCxxV/MTtJDhLpSnAyFQKOKJfJqXXbtcnEb
   KwO57OUpGL1TqdLNWioMTU9gKfQdJ97+rNxtvq3wsgmCVp5NKkctw8Rs6
   zVZUYNyc7AnGiOe1+AKVB2pncRhYw+pDm7U5c0ZfRRe6PTAGq2I/IYusF
   xkoKs3HrAuahMHe7HDtHqCbyZPJ7l2R/CHElHzl9rSQx/7h/VnCWmD8BQ
   NJmO7mj0IRqPr/P9qm8dgxvuJs5z9E/ZLk11ewRGp+toBiuoKEnJz7XD/
   s3OwTRFHb1svvyZjAXxDRsFABgR57Q43pHru/tQ9ShvP7mvZk4+u2dJJ6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="363048635"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="363048635"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 15:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="620231342"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Sep 2022 15:03:40 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZJQx-0002B5-31;
	Fri, 16 Sep 2022 22:03:39 +0000
Date: Sat, 17 Sep 2022 06:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 c6d18be90f9b0c7fb64c6138b51c49151140fb57
Message-ID: <6324f2b0.r/3+OEgNAmYqihY3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_150344_678250_A66202E5 
X-CRM114-Status: UNSURE (   4.31  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: c6d18be90f9b0c7fb64c6138b51c49151140fb57  Revert "bus: mhi: host: Move IRQ allocation to controller registration phase"

elapsed time: 727m

configs tested: 134
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
sh                               allmodconfig
i386                                defconfig
i386                          randconfig-a005
arc                  randconfig-r043-20220916
alpha                            allyesconfig
x86_64                              defconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
i386                          randconfig-a012
arm                                 defconfig
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
ia64                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arc                 nsimosci_hs_smp_defconfig
mips                  decstation_64_defconfig
s390                          debug_defconfig
powerpc                     rainier_defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                        randconfig-a011
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20220916
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arc                              alldefconfig
powerpc                     stx_gp3_defconfig
m68k                       m5475evb_defconfig
powerpc                      bamboo_defconfig
sh                        edosk7760_defconfig
sh                          polaris_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                    amigaone_defconfig
arm                        oxnas_v6_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
mips                        bcm47xx_defconfig
arc                           tb10x_defconfig
arc                          axs101_defconfig
openrisc                       virt_defconfig
mips                      maltasmvp_defconfig
loongarch                           defconfig
sh                         ecovec24_defconfig
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
arc                        nsimosci_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            hp6xx_defconfig
powerpc                   currituck_defconfig
mips                     loongson1b_defconfig
powerpc                      pcm030_defconfig
powerpc                      pasemi_defconfig
arm                       omap2plus_defconfig
powerpc                      chrp32_defconfig
openrisc                 simple_smp_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                           se7724_defconfig
m68k                          atari_defconfig
sh                          rsk7269_defconfig
powerpc                       maple_defconfig

clang tested configs:
i386                          randconfig-a002
hexagon              randconfig-r041-20220916
i386                          randconfig-a004
i386                          randconfig-a006
riscv                randconfig-r042-20220916
hexagon              randconfig-r045-20220916
s390                 randconfig-r044-20220916
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-k001
arm                          sp7021_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     mpc512x_defconfig
hexagon              randconfig-r045-20220917
hexagon              randconfig-r041-20220917

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
