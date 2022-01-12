Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5210C433EF
	for <ath10k@archiver.kernel.org>; Wed, 12 Jan 2022 20:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hCQCVdwVJunK6P0w/x4ExboWocABQVPOOVObB+S1ogc=; b=YPeOCiv1gqqt/S
	KzpavUS4vvLlPgyfuM0ep5ei6NFXQl909Fuq0dv0v2Ydii5PBJNkSHwoSCKhKsw3pFBBsDKKZ9Kpe
	h+9cWU4uiT0RjVuatRfc+zGaVgvNMH2jS/G3eHPL+LH8j0k9+ZhoH2Py4K7eLD9YDqnJs9VeUZ2/6
	/RZA2sIQbEyOsIpI/KsTQNw/yl2sTQ+atanwRz9L4IL03nEjVTSZZhswCh6X00iqXL485m7RZQ3ak
	ahu8gIAsqoP8tIyyPOF38QptqaTvTomOaib9W33levD/9SGREfrBhugdoqbdVxUYJE1gY5UXczqBi
	8sABTN6bItj7xL2atWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7kZa-003llQ-Ki; Wed, 12 Jan 2022 20:50:22 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7kZV-003ljM-Jm
 for ath10k@lists.infradead.org; Wed, 12 Jan 2022 20:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642020617; x=1673556617;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=GdQ1zSLo+VEZLFzjoLsJbaJPUwdMkS3luCZHh76v3z8=;
 b=aY0ASlcFcgkeNmsjU0XeS4jPxaYADW8db5W/BOeekmtRiZjBgzUgj01I
 RKCnjxnmMgvZhyJSH0X2dv46rMR0dgFsvlbno5A5s1P2owO2iRCxvRYZd
 ZPLcxkogudqyCjPIN6mA9dfnRTQNGiFuQ4CPenVFzN8pVW/uUt5xt1LXe
 5bQCgOC0Zbqdzooqh3mm1mEuhW5giEQ0QeuBDZuvqXkmnjbJsa2zs3nFE
 Kp5Tmdh+mkZHw3ZVsJ6f2pgUPo79DB4M5EwjSqJX0EHwilkHBC7awhQih
 3RbrW4Qi87WC+Yy+oi0w7XKmeSgkQxlVMZmejyQDATCbZtCe0t2zQe5hL g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="307199565"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="307199565"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 12:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="472974783"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 12 Jan 2022 12:50:14 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7kZR-0006Oi-J6; Wed, 12 Jan 2022 20:50:13 +0000
Date: Thu, 13 Jan 2022 04:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 564d4eceb97eaf381dd6ef6470b06377bb50c95a
Message-ID: <61df3ed2.BlaLJLu7lqKvJuRc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_125017_746173_1C5CED7B 
X-CRM114-Status: UNSURE (   5.76  )
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
branch HEAD: 564d4eceb97eaf381dd6ef6470b06377bb50c95a  ath5k: fix OOB in ath5k_eeprom_read_pcal_info_5111

elapsed time: 731m

configs tested: 156
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
mips                 randconfig-c004-20220112
arm                         cm_x300_defconfig
csky                             alldefconfig
powerpc                      ppc6xx_defconfig
powerpc                         wii_defconfig
arm                           u8500_defconfig
nds32                               defconfig
sh                           se7722_defconfig
mips                            ar7_defconfig
parisc                           allyesconfig
mips                        vocore2_defconfig
sh                          lboxre2_defconfig
sh                          rsk7269_defconfig
sh                          r7780mp_defconfig
arm                         vf610m4_defconfig
powerpc                      mgcoge_defconfig
powerpc                    klondike_defconfig
arm                           stm32_defconfig
powerpc                      bamboo_defconfig
x86_64                              defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       bvme6000_defconfig
sh                        apsh4ad0a_defconfig
sh                              ul2_defconfig
arm                        realview_defconfig
powerpc                       holly_defconfig
powerpc                  storcenter_defconfig
arm                         assabet_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
ia64                             alldefconfig
mips                     decstation_defconfig
powerpc                        warp_defconfig
arm                       omap2plus_defconfig
sparc64                             defconfig
mips                          rb532_defconfig
powerpc                    adder875_defconfig
ia64                                defconfig
sh                     sh7710voipgw_defconfig
arm                      integrator_defconfig
powerpc                  iss476-smp_defconfig
mips                      fuloong2e_defconfig
mips                           jazz_defconfig
arm64                            alldefconfig
m68k                        m5272c3_defconfig
powerpc                 mpc834x_mds_defconfig
microblaze                      mmu_defconfig
sh                           se7721_defconfig
sh                          polaris_defconfig
arm                        mini2440_defconfig
powerpc                     taishan_defconfig
arm                          simpad_defconfig
xtensa                generic_kc705_defconfig
nios2                            allyesconfig
mips                           ip32_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7705_defconfig
xtensa                  nommu_kc705_defconfig
h8300                            alldefconfig
sh                           se7751_defconfig
sh                           se7724_defconfig
mips                     loongson1b_defconfig
powerpc                      cm5200_defconfig
arm                  randconfig-c002-20220112
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
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
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220112
x86_64                        randconfig-c007
riscv                randconfig-c006-20220112
powerpc              randconfig-c003-20220112
i386                          randconfig-c001
mips                 randconfig-c004-20220112
powerpc                     akebono_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                          collie_defconfig
arm                          pcm027_defconfig
arm                     am200epdkit_defconfig
arm                         palmz72_defconfig
arm                          imote2_defconfig
arm                             mxs_defconfig
arm                          pxa168_defconfig
powerpc                  mpc866_ads_defconfig
mips                      pic32mzda_defconfig
mips                        bcm63xx_defconfig
mips                          rm200_defconfig
arm                          ixp4xx_defconfig
hexagon                             defconfig
arm                        spear3xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220112
riscv                randconfig-r042-20220112
hexagon              randconfig-r041-20220112

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
