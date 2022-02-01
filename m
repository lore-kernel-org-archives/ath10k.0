Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA61C433F5
	for <ath10k@archiver.kernel.org>; Tue,  1 Feb 2022 02:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DOmhsRB826gPmjNxwACgWtyjWGpgvcgBHU7ClBxt5AY=; b=3Dc5Ag8FWu7WPm
	Vg0Dv3qer1hD5Ay4FOxvdGII0Bxn9UISHFc4ilVdJpx8K/Hu+aMgngT+uF47ghWtBGB+GBG3TyxoA
	9gbb+Hh5Qqojgwe/3f7R74GN+ctBhG6zGkuY5cwhHIhblV864QZEIBWx3AQxP4q1MQReEqNGjXFOl
	qczjJhlisK8vYTPbTWGCcsIHipBbhlnlP2xOSVvanBgL7G/vrFcNH/6EaeoCUv3DhxwnpaYS/GU/I
	vBQOUqmYV7wBK3M9+703sa2tayTG9HfHWT6IWpDvTqSOrPPHF9srjHCpPLi+7goBVJM/l/PmEkOmY
	zKbYESxuypYvaz6MSGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEj5L-00B1VW-M8; Tue, 01 Feb 2022 02:39:59 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEj5I-00B1UH-W6
 for ath10k@lists.infradead.org; Tue, 01 Feb 2022 02:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643683196; x=1675219196;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=4dIkTn7TV1R0bVDu7tRcKH3mEfd9Yv3Q0KZhjFcOvRg=;
 b=eu+1zLeyt65FJLhXInRt5syfUFjmAgghwgMbAHjCZiclK+3mar1GAF8m
 Hx9CeAdQ83ve0wD5G8RB+B3hVlzHBga7Wxt14OthyAsirThtjwxO5jWIT
 G8dhe0Y4AujkX6VslFB74PIEQDmaoz/WieOaC6Fx8VyJcRwvwkewlnmSN
 Vyp/5bOsMVe6QGDSMPI/bnWCr5+29AKxxF5KfhWIgMzUxdYCEZ5bZ+SyZ
 ItjJebK0EaIKlXgW+Q4bdQWy0aH5H9Po9oYQvNn6IKlBUI+XsJNzOsVR1
 nfsg1LQpMkdIxJx9G9kQ1osVCrQRb/JaRY+jlbDFnmQLK14VapvQAuXq0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247378223"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="247378223"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 18:39:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; d="scan'208";a="582885644"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2022 18:39:09 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEj4X-000Se7-8C; Tue, 01 Feb 2022 02:39:09 +0000
Date: Tue, 01 Feb 2022 10:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 83592241506d03249501954c6da90ef47dc12213
Message-ID: <61f89d19.F2RTdGSsSme4xpnT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_183957_145933_B637EF8B 
X-CRM114-Status: UNSURE (   5.47  )
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
branch HEAD: 83592241506d03249501954c6da90ef47dc12213  ath11k: add debugfs for TWT debug calls

elapsed time: 722m

configs tested: 147
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
sh                          rsk7203_defconfig
m68k                       m5475evb_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7763rdp_defconfig
mips                         mpc30x_defconfig
sh                 kfr2r09-romimage_defconfig
sh                               alldefconfig
arm                          pxa910_defconfig
arm                          lpd270_defconfig
m68k                       m5208evb_defconfig
mips                 decstation_r4k_defconfig
powerpc                        warp_defconfig
arm                        oxnas_v6_defconfig
sh                          rsk7269_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc837x_rdb_defconfig
parisc                           alldefconfig
xtensa                           allyesconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc837x_mds_defconfig
riscv                    nommu_k210_defconfig
mips                      fuloong2e_defconfig
powerpc                      arches_defconfig
arm                           stm32_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     asp8347_defconfig
arm                      footbridge_defconfig
sh                          kfr2r09_defconfig
sh                           se7724_defconfig
ia64                        generic_defconfig
sh                           se7343_defconfig
sh                             shx3_defconfig
csky                             alldefconfig
microblaze                      mmu_defconfig
powerpc                       eiger_defconfig
powerpc                        cell_defconfig
arc                                 defconfig
m68k                          sun3x_defconfig
mips                      maltasmvp_defconfig
mips                        jmr3927_defconfig
powerpc                      bamboo_defconfig
openrisc                         alldefconfig
mips                         db1xxx_defconfig
x86_64                           alldefconfig
xtensa                  nommu_kc705_defconfig
arm                       omap2plus_defconfig
mips                       capcella_defconfig
sh                        apsh4ad0a_defconfig
arm                            mps2_defconfig
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220130
ia64                             allmodconfig
ia64                                defconfig
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
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                          allyesconfig
arm                             mxs_defconfig
arm                        spear3xx_defconfig
mips                        bcm63xx_defconfig
arm                       versatile_defconfig
arm                         orion5x_defconfig
mips                   sb1250_swarm_defconfig
arm                        magician_defconfig
powerpc                 xes_mpc85xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r041-20220130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
