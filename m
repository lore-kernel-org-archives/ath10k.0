Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B218FC433EF
	for <ath10k@archiver.kernel.org>; Thu, 14 Apr 2022 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7b1koL/Oy8aeanRxIb/UMx0aVMssBnZwIgcrjZetHfU=; b=YpUTSOBkhjahSz
	MqWwgrVqTsePsmXgP06TQFUWt5JMhi2Y+NVevLCQD0NgZgt6LbFK88/T5JYd0KL7QQxW1hQNY4LFn
	CR7Yx10ktbk7tJT7TtcVJXhJeetWzjXuao0iw2hlvEPMwRriOh/cpU6ZPD0RmgyX6BMC1g4PsCKfd
	xAFOOPhjtYQfs8gFCAKZN0Lb7vfACsjaU1g+dvLsAvzJ9ikPNI383Qp3RSpz5zu8Uknq5PAZTAUuN
	cAs05K2n8OZi4RKzYVRzZ4twqYRQjUU5IVenHXP4okT36d4oYiSe28PvDb4/qF3vZtSoKvbmSBM0M
	9ZH942ohvY1iiSRDTYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf126-0069Cp-N9; Thu, 14 Apr 2022 15:05:18 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf121-0069BL-4v
 for ath10k@lists.infradead.org; Thu, 14 Apr 2022 15:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948713; x=1681484713;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=ORPQEilu5E63We9//15orQbPaUMy5loZ6752RFVjc1M=;
 b=ecZ6XVANBIUWmuuMLMVyfthL1/iWFg/2uSiI4E2h5zZzaaaI7iOUzAr3
 ykUcUUS3pyojuOpWewIftVpWCaR+fnwrR0uAaQdbcE0m9s8Vk00r47vZ+
 GLgbfUVkZCaekMHn0JyyYdj1AWZzB6fH1GAz2lKsPRQR466/5a0bWWjln
 ARWyHIkqLfTPM741+jcBu+UG1DPt9diHUXgedMumxd5z24dhzwCgjntFY
 cmHUs7CLS+R4Je/g9zVbbPda/yaM5QDMdQgQmvcg25NAyaepRlZXULlRH
 aiZY3YSTjxrM5PzMvfWtxGYV9UrUCx0QQVYvA5/zEz+GlDjo0kzRgpSty A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="244835268"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="244835268"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="527426476"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 14 Apr 2022 08:05:09 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nf11x-000137-0E;
 Thu, 14 Apr 2022 15:05:09 +0000
Date: Thu, 14 Apr 2022 23:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 0ae3697e333ad761309f0845374695af9ea569c3
Message-ID: <625837f0.BCMqxzm55+fLdcPR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_080513_309808_80E59958 
X-CRM114-Status: UNSURE (   5.10  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 0ae3697e333ad761309f0845374695af9ea569c3  Merge branch 'pending' into master-pending

elapsed time: 2744m

configs tested: 149
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                      rts7751r2d1_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                        m5307c3_defconfig
arc                        vdk_hs38_defconfig
mips                  decstation_64_defconfig
openrisc                  or1klitex_defconfig
mips                      maltasmvp_defconfig
s390                       zfcpdump_defconfig
h8300                       h8s-sim_defconfig
s390                          debug_defconfig
arm                          badge4_defconfig
arm                           u8500_defconfig
arm                          gemini_defconfig
um                                  defconfig
arm                           viper_defconfig
sh                           se7721_defconfig
um                           x86_64_defconfig
arc                            hsdk_defconfig
arc                     nsimosci_hs_defconfig
riscv                            allmodconfig
arm                        keystone_defconfig
arm                             rpc_defconfig
mips                         mpc30x_defconfig
powerpc                     pq2fads_defconfig
ia64                          tiger_defconfig
parisc64                            defconfig
sh                             sh03_defconfig
arm                           sunxi_defconfig
xtensa                           alldefconfig
x86_64                              defconfig
arm                       aspeed_g5_defconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        spear6xx_defconfig
arm                            mps2_defconfig
arm                        oxnas_v6_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220413
arm                  randconfig-c002-20220414
arm                  randconfig-c002-20220411
i386                 randconfig-c001-20220411
x86_64               randconfig-c001-20220411
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220411
riscv                randconfig-r042-20220411
s390                 randconfig-r044-20220411
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                               defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220413
arm                  randconfig-c002-20220413
i386                          randconfig-c001
riscv                randconfig-c006-20220413
mips                 randconfig-c004-20220413
arm                  colibri_pxa270_defconfig
mips                     cu1830-neo_defconfig
mips                      pic32mzda_defconfig
hexagon                             defconfig
powerpc                      ppc44x_defconfig
mips                         tb0219_defconfig
riscv                            alldefconfig
arm                                 defconfig
arm                       spear13xx_defconfig
mips                malta_qemu_32r6_defconfig
arm                       mainstone_defconfig
arm                       netwinder_defconfig
mips                        workpad_defconfig
x86_64               randconfig-a003-20220411
x86_64               randconfig-a004-20220411
x86_64               randconfig-a006-20220411
x86_64               randconfig-a001-20220411
x86_64               randconfig-a002-20220411
x86_64               randconfig-a005-20220411
i386                 randconfig-a003-20220411
i386                 randconfig-a001-20220411
i386                 randconfig-a002-20220411
i386                 randconfig-a006-20220411
i386                 randconfig-a005-20220411
i386                 randconfig-a004-20220411
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220413
hexagon              randconfig-r045-20220413
hexagon              randconfig-r041-20220411
hexagon              randconfig-r045-20220411
riscv                randconfig-r042-20220414
hexagon              randconfig-r041-20220414
hexagon              randconfig-r045-20220414

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
