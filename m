Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95188C3DA4A
	for <ath10k@archiver.kernel.org>; Tue,  6 Aug 2024 02:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pm+TmBzXZZm4fJxsxwYpUUPS6RrQDpCv63EQkKxq3Fk=; b=ja6I2lYpKc2Mz1rFjpfwL6ckel
	0mcdDm3XYgNWSFoEb06DXMD808NG75sgNBscKaDcEo1T9lJY7KS73H5cMNDPcAMc1polRJq90boMC
	h0nQ9uDV8OrKDmEtbTMAbollzlWX4oir0aNjvztyWuCx0a5+mtb23nd3CUkwBAw/YSV0FIfSuOHvw
	mSoq2BTw8dvfmLfPjLSuyLSzSAzCtBGznUt2yGhP+KVbKrTUlMHxHCzHAMXW2qLWztjKcNJ+Vmfg/
	Sut5kmz64sjuG8khSvkTYLM/hICyHMum3skyykuw9t+8Zc+wcb/tLlNlvZxhdtiEpDl/rLrqyAGGN
	ZUXeacqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb9aU-00000000DPe-0rfq;
	Tue, 06 Aug 2024 02:06:10 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb9aQ-00000000DOo-3Nvr
	for ath10k@lists.infradead.org;
	Tue, 06 Aug 2024 02:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722909967; x=1754445967;
  h=date:from:to:cc:subject:message-id;
  bh=Ve7QgUcJvtFGn+tfYdArtQuEAR4TUgAiJXvzBG2ZIGU=;
  b=BPJsIq4xUwAEn1wLw+wY+2yI+ducPo/e97NtO+CPDvCEDG3hdVH5vn+K
   cGUz7m95B/zHkvcRk08jJwrifSMTNIcWA8OhYfay5iQ6fQq6LoAYl2Uuo
   e7zO59ZHzqURaZ2UU3XXN+9D/jYFZUUUep0Z6KxZwv+LPrD21RW6greN1
   wdruKBYoLzwDNeADtNIrW/j7tylrDV+rS3OcJlaHtp4nC4f2DIy45HbxH
   kQbEzQWR74KAtaXWd6vhNFIEp2cfqGAkKEUgEy5oQmAIrccXLAmrKhr+Q
   28SJvo1Oe6tsYYYx2f0qVSq6BBxJ9se0XsAd4T7ndfq2yAVEv4iEdAELN
   A==;
X-CSE-ConnectionGUID: 4qwlCdwwSqeWmBW/tdoL/Q==
X-CSE-MsgGUID: hNVwRkxqTp6w+LZwje+LRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21023916"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="21023916"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 19:06:05 -0700
X-CSE-ConnectionGUID: z5t1cS71Qdy1to8A+zyqZA==
X-CSE-MsgGUID: qYDYGNoXRPycOWWICq5hqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="86950146"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Aug 2024 19:06:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb9aL-00043c-18;
	Tue, 06 Aug 2024 02:06:01 +0000
Date: Tue, 06 Aug 2024 10:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 f205af536ea464e3823a2043ac6c9287a4db9289
Message-ID: <202408061030.SCvAD0Tg-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_190606_952725_244C5D86 
X-CRM114-Status: UNSURE (   3.52  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: f205af536ea464e3823a2043ac6c9287a4db9289  Add localversion-wireless-testing-ath

elapsed time: 942m

configs tested: 223
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240805   gcc-13.2.0
arc                   randconfig-002-20240805   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         axm55xx_defconfig   gcc-13.2.0
arm                         bcm2835_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                      jornada720_defconfig   gcc-13.2.0
arm                        keystone_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-13.2.0
arm                   randconfig-001-20240805   gcc-13.2.0
arm                   randconfig-002-20240805   gcc-13.2.0
arm                   randconfig-003-20240805   gcc-13.2.0
arm                   randconfig-004-20240805   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240805   gcc-13.2.0
arm64                 randconfig-002-20240805   gcc-13.2.0
arm64                 randconfig-003-20240805   gcc-13.2.0
arm64                 randconfig-004-20240805   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240805   gcc-13.2.0
csky                  randconfig-002-20240805   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240805   clang-18
i386         buildonly-randconfig-002-20240805   clang-18
i386         buildonly-randconfig-003-20240805   clang-18
i386         buildonly-randconfig-004-20240805   clang-18
i386         buildonly-randconfig-005-20240805   clang-18
i386         buildonly-randconfig-006-20240805   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240805   clang-18
i386                  randconfig-002-20240805   clang-18
i386                  randconfig-003-20240805   clang-18
i386                  randconfig-004-20240805   clang-18
i386                  randconfig-005-20240805   clang-18
i386                  randconfig-006-20240805   clang-18
i386                  randconfig-011-20240805   clang-18
i386                  randconfig-012-20240805   clang-18
i386                  randconfig-013-20240805   clang-18
i386                  randconfig-014-20240805   clang-18
i386                  randconfig-015-20240805   clang-18
i386                  randconfig-016-20240805   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240805   gcc-13.2.0
loongarch             randconfig-002-20240805   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                     cu1000-neo_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-13.2.0
mips                          eyeq6_defconfig   gcc-13.2.0
mips                           ip22_defconfig   gcc-13.2.0
mips                          malta_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
mips                        vocore2_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240805   gcc-13.2.0
nios2                 randconfig-002-20240805   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                       virt_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240805   gcc-13.2.0
parisc                randconfig-002-20240805   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      chrp32_defconfig   gcc-13.2.0
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                   currituck_defconfig   gcc-13.2.0
powerpc                        fsp2_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                      ppc64e_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240805   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   gcc-13.2.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                     tqm8555_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240805   gcc-13.2.0
powerpc64             randconfig-002-20240805   gcc-13.2.0
powerpc64             randconfig-003-20240805   gcc-13.2.0
riscv                            alldefconfig   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240805   gcc-13.2.0
riscv                 randconfig-002-20240805   gcc-13.2.0
s390                             alldefconfig   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240805   gcc-13.2.0
s390                  randconfig-002-20240805   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7705_defconfig   gcc-13.2.0
sh                    randconfig-001-20240805   gcc-13.2.0
sh                    randconfig-002-20240805   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.2.0
sh                            shmin_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240805   gcc-13.2.0
sparc64               randconfig-002-20240805   gcc-13.2.0
um                               alldefconfig   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240805   gcc-13.2.0
um                    randconfig-002-20240805   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240805   gcc-12
x86_64       buildonly-randconfig-001-20240806   clang-18
x86_64       buildonly-randconfig-002-20240805   gcc-12
x86_64       buildonly-randconfig-002-20240806   clang-18
x86_64       buildonly-randconfig-003-20240805   gcc-12
x86_64       buildonly-randconfig-003-20240806   clang-18
x86_64       buildonly-randconfig-004-20240805   gcc-12
x86_64       buildonly-randconfig-004-20240806   clang-18
x86_64       buildonly-randconfig-005-20240805   gcc-12
x86_64       buildonly-randconfig-005-20240806   clang-18
x86_64       buildonly-randconfig-006-20240805   gcc-12
x86_64       buildonly-randconfig-006-20240806   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240805   gcc-12
x86_64                randconfig-001-20240806   clang-18
x86_64                randconfig-002-20240805   gcc-12
x86_64                randconfig-002-20240806   clang-18
x86_64                randconfig-003-20240805   gcc-12
x86_64                randconfig-003-20240806   clang-18
x86_64                randconfig-004-20240805   gcc-12
x86_64                randconfig-004-20240806   clang-18
x86_64                randconfig-005-20240805   gcc-12
x86_64                randconfig-005-20240806   clang-18
x86_64                randconfig-006-20240805   gcc-12
x86_64                randconfig-006-20240806   clang-18
x86_64                randconfig-011-20240805   gcc-12
x86_64                randconfig-011-20240806   clang-18
x86_64                randconfig-012-20240805   gcc-12
x86_64                randconfig-012-20240806   clang-18
x86_64                randconfig-013-20240805   gcc-12
x86_64                randconfig-013-20240806   clang-18
x86_64                randconfig-014-20240805   gcc-12
x86_64                randconfig-014-20240806   clang-18
x86_64                randconfig-015-20240805   gcc-12
x86_64                randconfig-015-20240806   clang-18
x86_64                randconfig-016-20240805   gcc-12
x86_64                randconfig-016-20240806   clang-18
x86_64                randconfig-071-20240805   gcc-12
x86_64                randconfig-071-20240806   clang-18
x86_64                randconfig-072-20240805   gcc-12
x86_64                randconfig-072-20240806   clang-18
x86_64                randconfig-073-20240805   gcc-12
x86_64                randconfig-073-20240806   clang-18
x86_64                randconfig-074-20240805   gcc-12
x86_64                randconfig-074-20240806   clang-18
x86_64                randconfig-075-20240805   gcc-12
x86_64                randconfig-075-20240806   clang-18
x86_64                randconfig-076-20240805   gcc-12
x86_64                randconfig-076-20240806   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240805   gcc-13.2.0
xtensa                randconfig-002-20240805   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

