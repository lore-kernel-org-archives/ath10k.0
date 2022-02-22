Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A83C433F5
	for <ath10k@archiver.kernel.org>; Tue, 22 Feb 2022 00:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3x4pkSS/GlT4KXY4NVsDdYF0hw3lWwEb5ESeaQsGpuE=; b=lMlg/ToXwuvNij
	UZnP1ett34CIXE1MVkpX6W4fIe/on3IuPn/5GA1nTF5wc2/x2QHj0R6Y8jYixmI5o8bHnq7lsshZI
	LQjyIQzg2Kf+vRFgUoXTVc4D4Ft7WafUvpi1CSK3EipQBoOhj4KLjLe+ncLpgWICj5XlnQDZan4w4
	wtWh8jfcaVBzcpT5fztXcslexhacAd1zCPSLadutAeFYzRmyV/b4gab3oNB7593PsKkiA4NB3MP2Q
	Ro/vB87p9Tj2gcYdUY8XeJvy4j4J2C4ri37dRGp9d/drpIB2/oZ1xj3hmWQlO65Y3imICfQX3meL8
	OVU+zKJaLONh2RroqVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMIhg-007Vp6-3o; Tue, 22 Feb 2022 00:06:52 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMIhd-007VoU-5T
 for ath10k@lists.infradead.org; Tue, 22 Feb 2022 00:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645488409; x=1677024409;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=PqnWK5FHUlOJ9nxg3r+UsFXMDyYNt/LrOiMpjiUTGhE=;
 b=G0Ch1g1eka6rPTOWxbLd03KuP7xabkruFLrHqdoCDjUSOnZZJkLb+K1u
 n4J5Yd7f6AX7AgD3q6z29eddRSgE8bODIy1i8XgRAnycMGyyQkUHIBw1M
 zhZLMpGPZn2rEnkr0yTeiI1V2EHzmZjOAEwb3X8dGOAzwe2OVg7aqmKxi
 yuo8aAOOyVQonBHPNBGmrsLOpubJn5bhXcfVbEzLur/JRhZkQX+8cn4zP
 5OlS6QX8NOkeEkCwM+pkY+L/L35YlQMwrWPN6NOss7zbaRtRVE4OhEEV3
 Yei8nCLAQXs92yixeQyFFPazmobJgr2xJlYBpsSnV1IML4SYZPHWMoo1i A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249161951"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="249161951"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 16:06:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="776121644"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2022 16:06:46 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMIhZ-00027Q-NC; Tue, 22 Feb 2022 00:06:45 +0000
Date: Tue, 22 Feb 2022 08:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 261b07519518bd14cb168b287b17e1d195f8d0c8
Message-ID: <621428d6.EN3b4KNdewj33fy0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_160649_261595_A36DFD40 
X-CRM114-Status: UNSURE (   6.24  )
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
branch HEAD: 261b07519518bd14cb168b287b17e1d195f8d0c8  ath11k: Fix frames flush failure caused by deadlock

elapsed time: 729m

configs tested: 139
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220221
powerpc                      chrp32_defconfig
sh                         ap325rxa_defconfig
sh                   secureedge5410_defconfig
mips                         mpc30x_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                        mvme147_defconfig
powerpc                       ppc64_defconfig
alpha                            alldefconfig
sh                           se7724_defconfig
mips                             allyesconfig
arm                      jornada720_defconfig
sh                               allmodconfig
powerpc                  storcenter_defconfig
mips                         tb0226_defconfig
mips                           ip32_defconfig
sh                            hp6xx_defconfig
sh                           se7721_defconfig
powerpc                 linkstation_defconfig
microblaze                      mmu_defconfig
sh                        sh7763rdp_defconfig
mips                           jazz_defconfig
m68k                        m5407c3_defconfig
s390                             allyesconfig
sh                   rts7751r2dplus_defconfig
arm                          pxa3xx_defconfig
powerpc                        warp_defconfig
sh                           sh2007_defconfig
csky                             alldefconfig
powerpc                     asp8347_defconfig
powerpc                     tqm8555_defconfig
arm                        clps711x_defconfig
arm                            pleb_defconfig
powerpc                       holly_defconfig
sh                   sh7770_generic_defconfig
xtensa                  cadence_csp_defconfig
powerpc                    amigaone_defconfig
powerpc                     redwood_defconfig
mips                         db1xxx_defconfig
sh                ecovec24-romimage_defconfig
powerpc                         ps3_defconfig
mips                        jmr3927_defconfig
sparc64                             defconfig
sh                        sh7757lcr_defconfig
arc                           tb10x_defconfig
arm                        mvebu_v7_defconfig
powerpc                        cell_defconfig
powerpc                  iss476-smp_defconfig
s390                                defconfig
arm                  randconfig-c002-20220221
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
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
parisc                              defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a006-20220221
i386                 randconfig-a004-20220221
x86_64               randconfig-a003-20220221
x86_64               randconfig-a002-20220221
x86_64               randconfig-a005-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a004-20220221
arc                  randconfig-r043-20220221
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
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220221
x86_64               randconfig-c007-20220221
arm                  randconfig-c002-20220221
mips                 randconfig-c004-20220221
i386                 randconfig-c001-20220221
riscv                randconfig-c006-20220221
arm                          moxart_defconfig
arm                  colibri_pxa270_defconfig
arm                         shannon_defconfig
arm                            mmp2_defconfig
mips                      pic32mzda_defconfig
x86_64               randconfig-a015-20220221
x86_64               randconfig-a011-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a012-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a013-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221
s390                 randconfig-r044-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
