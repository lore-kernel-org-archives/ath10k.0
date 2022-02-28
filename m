Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CAAC433FE
	for <ath10k@archiver.kernel.org>; Mon, 28 Feb 2022 22:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9kKQ9Krqsxh26FYR5XetFeJY6awMhV7woOSFztncdO4=; b=w9T6/ax5X3w7SM
	H3fup3/JKR4nV10WvRGBBxo5JmVlQojOskwQNiYJ0kvmLnjq6ihrGy2GsMOoI7Vced8bWrtq3BSJl
	/lEFNzPj7VVp0krjQ1NXS8ATfDVMhakIPK1K2eC6BhYgiB7xQWeGNNgP6nr47wwIMpzmEDwJiJ8xN
	XNSPMBeHVVktYpUZQVrCXSkMGfCokq/RFIHKWh32GTU8ZIXLq5RSN7kjy3V2cfQU98L2AFcvr9OUY
	aMPIc3AdBALde3TnZcsOFtnNCfClLB3ccDjTflNFf1YmLZLFoxTMEbb0fVzR/WYUUauu35EVKthbU
	hHtsJQBJ+oWTA8A1Fb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOoi2-00EJzO-BB; Mon, 28 Feb 2022 22:41:38 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOohy-00EJyW-19
 for ath10k@lists.infradead.org; Mon, 28 Feb 2022 22:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646088093; x=1677624093;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=0vmciMI6wIBSC/lYTTEjXeLP8TeTegqgwtMZ4Fe9o8s=;
 b=PVgCuU4TiHL4+1y8CrKUoSOgSMbX5inSET+r+LRWEqnavXb+/MoLkURu
 +TtmyCP0SAiRNLuMZKl//hmnyxnhTYcXB4QNPKt5JlQQGR0KyV8eJAErh
 PMSCujO7Lvt5s0LLDIM6a78w2hkHbw/wuSQi8aBNTYFkBE+dxr0cHPUmK
 0mh/2Nj2ZaLunDsEAgyTEya6HCxD5chrMY6EVQWz09JAnCog5TtwK6eK2
 PNDAJ5BfprJDERiS8i47FaQt7SBxwN4uqgty1FQYYPu4EVEj6Bsc09ktg
 hGmhKccNLEU65C179J3WnP0cj1yIglp0jGtVJ92u8aKitKyevZd1yKDu4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316219855"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="316219855"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 14:41:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="492888187"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 28 Feb 2022 14:41:31 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nOohu-0007qv-8R; Mon, 28 Feb 2022 22:41:30 +0000
Date: Tue, 01 Mar 2022 06:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 17303434b56ddbf83addcf2a17aa2ab823133bb1
Message-ID: <621d4f5a.mPeBq04kOjoEQjZI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_144134_156937_648146BD 
X-CRM114-Status: UNSURE (   5.27  )
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
branch HEAD: 17303434b56ddbf83addcf2a17aa2ab823133bb1  ath9k: make array voice_priority static const

elapsed time: 721m

configs tested: 219
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220228
arm                            lart_defconfig
arm                         assabet_defconfig
arm                          simpad_defconfig
sh                           se7780_defconfig
mips                         db1xxx_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                ecovec24-romimage_defconfig
m68k                            mac_defconfig
sh                     sh7710voipgw_defconfig
powerpc                      bamboo_defconfig
parisc                generic-32bit_defconfig
sh                               alldefconfig
mips                         tb0226_defconfig
powerpc                  iss476-smp_defconfig
arc                         haps_hs_defconfig
powerpc                      cm5200_defconfig
arc                        nsim_700_defconfig
xtensa                           alldefconfig
powerpc                    amigaone_defconfig
sparc                            allyesconfig
powerpc                     sequoia_defconfig
alpha                               defconfig
arm                       omap2plus_defconfig
powerpc                     tqm8555_defconfig
mips                         mpc30x_defconfig
arm                        cerfcube_defconfig
mips                       bmips_be_defconfig
mips                         rt305x_defconfig
sh                          rsk7269_defconfig
sh                        sh7785lcr_defconfig
sh                         ecovec24_defconfig
arm                        multi_v7_defconfig
arm                         lpc18xx_defconfig
sh                           sh2007_defconfig
arc                     nsimosci_hs_defconfig
openrisc                    or1ksim_defconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
sh                          r7780mp_defconfig
sh                           se7724_defconfig
sh                          sdk7780_defconfig
arm                            pleb_defconfig
microblaze                      mmu_defconfig
arm                        clps711x_defconfig
sh                 kfr2r09-romimage_defconfig
um                                  defconfig
powerpc                       maple_defconfig
powerpc                   currituck_defconfig
m68k                             allyesconfig
arm                          gemini_defconfig
powerpc                      makalu_defconfig
m68k                        mvme16x_defconfig
sh                           se7619_defconfig
powerpc                    adder875_defconfig
mips                      fuloong2e_defconfig
sh                         microdev_defconfig
mips                           ci20_defconfig
sh                          lboxre2_defconfig
nios2                               defconfig
sh                        sh7757lcr_defconfig
xtensa                          iss_defconfig
arm                      integrator_defconfig
m68k                                defconfig
powerpc                   motionpro_defconfig
um                           x86_64_defconfig
sh                      rts7751r2d1_defconfig
sh                          polaris_defconfig
sh                             sh03_defconfig
xtensa                    smp_lx200_defconfig
sh                          landisk_defconfig
powerpc                      ppc6xx_defconfig
ia64                             allyesconfig
arc                          axs103_defconfig
xtensa                       common_defconfig
arm                        oxnas_v6_defconfig
sh                           se7206_defconfig
arc                        vdk_hs38_defconfig
nds32                               defconfig
arm                             ezx_defconfig
openrisc                         alldefconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
arm                          badge4_defconfig
s390                       zfcpdump_defconfig
powerpc                      mgcoge_defconfig
powerpc                         ps3_defconfig
arm                        realview_defconfig
arm                          iop32x_defconfig
arc                          axs101_defconfig
powerpc                      chrp32_defconfig
m68k                         amcore_defconfig
powerpc                     taishan_defconfig
sh                          urquell_defconfig
powerpc                     rainier_defconfig
arm                          pxa910_defconfig
ia64                             allmodconfig
m68k                         apollo_defconfig
arm                        spear6xx_defconfig
m68k                          amiga_defconfig
arm                           viper_defconfig
arm                  randconfig-c002-20220228
arm                  randconfig-c002-20220227
ia64                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
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
x86_64               randconfig-a011-20220228
x86_64               randconfig-a015-20220228
x86_64               randconfig-a014-20220228
x86_64               randconfig-a013-20220228
x86_64               randconfig-a016-20220228
x86_64               randconfig-a012-20220228
i386                 randconfig-a016-20220228
i386                 randconfig-a012-20220228
i386                 randconfig-a015-20220228
i386                 randconfig-a011-20220228
i386                 randconfig-a013-20220228
i386                 randconfig-a014-20220228
s390                 randconfig-r044-20220228
arc                  randconfig-r043-20220228
arc                  randconfig-r043-20220227
riscv                randconfig-r042-20220228
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220227
x86_64                        randconfig-c007
arm                  randconfig-c002-20220227
mips                 randconfig-c004-20220227
s390                 randconfig-c005-20220227
i386                          randconfig-c001
riscv                randconfig-c006-20220227
arm                          imote2_defconfig
hexagon                          alldefconfig
arm                          collie_defconfig
mips                          rm200_defconfig
mips                   sb1250_swarm_defconfig
mips                      bmips_stb_defconfig
arm                        magician_defconfig
powerpc                       ebony_defconfig
powerpc                      ppc44x_defconfig
mips                           mtx1_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
riscv                    nommu_virt_defconfig
powerpc                     ksi8560_defconfig
powerpc                        icon_defconfig
arm                       cns3420vb_defconfig
arm                        neponset_defconfig
arm                       imx_v4_v5_defconfig
powerpc                      pmac32_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
arm                           sama7_defconfig
x86_64               randconfig-a003-20220228
x86_64               randconfig-a005-20220228
x86_64               randconfig-a002-20220228
x86_64               randconfig-a006-20220228
x86_64               randconfig-a001-20220228
x86_64               randconfig-a004-20220228
i386                 randconfig-a002-20220228
i386                 randconfig-a001-20220228
i386                 randconfig-a005-20220228
i386                 randconfig-a003-20220228
i386                 randconfig-a006-20220228
i386                 randconfig-a004-20220228
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
riscv                randconfig-r042-20220227

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
