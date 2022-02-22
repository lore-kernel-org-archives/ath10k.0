Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6390C433F5
	for <ath10k@archiver.kernel.org>; Tue, 22 Feb 2022 02:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JJwYcGY0eyKyADUKV2AozIrLLDd+BjGYeEod/gJz7uQ=; b=AkHNKhNGsz8gnm
	u0PYGYVsc4ybiH0eOY3kKob6yyCUpqEL2CucNEpsGJj+pEkEYg55/U8sg4mL2xyLBa11dZId5NIxC
	pYoaayzJmb8pfUeg3WLLcg8EiBz+woNpCtYzWaBeYuF0SHYnN9S6jyVfNPsdLOQjrvM1Fx0TdAfql
	CzM3T2qb7xeD7WVu0CvjdfALaJckhZufPZsryINeGlIOGxGDdkgmRP27JRTMxEJC7ffvqYVmXnmz9
	ZUP3xNGPrKLcORK3E8JDknWNDov7n22fVR0LQMdyQEEmLK2dkQh4udqyEEtWxzb1qreqv6fevvsU5
	vykxYyQAKVJOcTYfFa5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nML7h-007lxc-N3; Tue, 22 Feb 2022 02:41:53 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nML7f-007lxF-5O
 for ath10k@lists.infradead.org; Tue, 22 Feb 2022 02:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645497711; x=1677033711;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=jema7bABg80Fd2Gt4CH3IkpKEHUjC0Cr7/bBTTqHoyw=;
 b=ViAXrwIHM/z3TFIS1YkbncAbDP6JDNTWW6xHIUPzZPK3gop5ZCoMRtyw
 r5g2sxvgDovhQ6ILhgKJWtx7txIsj+qslmxe1bGGrqWBTOJudy5MAYheT
 1Rc21VYBig+WUwmDaWPtx8QVFKYoJIAigwgC6QQgwv7Ih0XGFbDgJUn4A
 T10+xNqyCe1w0kJUMzi5OFJ62nydMOGwy77prMDN3MdVyXsA0LVPedG9J
 T21j/ePW6ADXveex4SPUAzNDLyZbtd/9F3XiV2QBMKZhE8d0aDloJztNL
 QLiOz7GsFM6d5X5Dmwa5ivKEkZxQcZZWfrTf4mFMcrCMp90QvrdXFy8BS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249177876"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="249177876"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 18:41:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="776150724"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2022 18:41:49 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nML7c-0002Ez-GA; Tue, 22 Feb 2022 02:41:48 +0000
Date: Tue, 22 Feb 2022 10:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 f46337435631266071958fa8ac36002fc7eb318d
Message-ID: <62144d56.BolGlT5pGgWRgRJv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_184151_261049_7AC6E1C4 
X-CRM114-Status: UNSURE (   6.23  )
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
branch HEAD: f46337435631266071958fa8ac36002fc7eb318d  ath10k: fix pointer arithmetic error in trace call

elapsed time: 737m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220221
powerpc                      chrp32_defconfig
sh                         ap325rxa_defconfig
sh                   secureedge5410_defconfig
mips                         mpc30x_defconfig
mips                           gcw0_defconfig
mips                  decstation_64_defconfig
sh                          lboxre2_defconfig
xtensa                         virt_defconfig
ia64                          tiger_defconfig
arm                          iop32x_defconfig
sh                             shx3_defconfig
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
m68k                        m5407c3_defconfig
s390                             allyesconfig
sh                   rts7751r2dplus_defconfig
m68k                       m5475evb_defconfig
arm                         nhk8815_defconfig
arm                          pxa3xx_defconfig
powerpc                        warp_defconfig
sh                           sh2007_defconfig
arm                          gemini_defconfig
powerpc                      pasemi_defconfig
m68k                          sun3x_defconfig
mips                         cobalt_defconfig
arm                        clps711x_defconfig
arm                            pleb_defconfig
powerpc                       holly_defconfig
sh                   sh7770_generic_defconfig
xtensa                  cadence_csp_defconfig
powerpc                    amigaone_defconfig
powerpc                     redwood_defconfig
sh                ecovec24-romimage_defconfig
powerpc                         ps3_defconfig
mips                        jmr3927_defconfig
sparc64                             defconfig
sh                        sh7757lcr_defconfig
mips                         db1xxx_defconfig
arc                           tb10x_defconfig
arm                        mvebu_v7_defconfig
powerpc                        cell_defconfig
powerpc                  iss476-smp_defconfig
sh                          rsk7269_defconfig
powerpc                     tqm8555_defconfig
sh                        apsh4ad0a_defconfig
arm                           sunxi_defconfig
arm                  randconfig-c002-20220221
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
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
x86_64               randconfig-a002-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a003-20220221
x86_64               randconfig-a004-20220221
x86_64               randconfig-a005-20220221
x86_64               randconfig-a006-20220221
i386                 randconfig-a002-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a006-20220221
i386                 randconfig-a004-20220221
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
powerpc              randconfig-c003-20220221
x86_64               randconfig-c007-20220221
arm                  randconfig-c002-20220221
mips                 randconfig-c004-20220221
i386                 randconfig-c001-20220221
riscv                randconfig-c006-20220221
arm                          moxart_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        vexpress_defconfig
arm                          collie_defconfig
x86_64               randconfig-a011-20220221
x86_64               randconfig-a015-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
