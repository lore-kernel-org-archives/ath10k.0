Return-Path: <SRS0=Qc8+=PJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43335C433EF
	for <ath10k@archiver.kernel.org>; Thu, 21 Oct 2021 04:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D354C60FE8
	for <ath10k@archiver.kernel.org>; Thu, 21 Oct 2021 04:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D354C60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6V0R9eaagjEoBzNPxqh+oPDCkGviTKddMiY/I8PIml4=; b=t3kyde2IyCZB7z
	fU7oRVCCo7Igxz4eHucU35kQVHA6basDqR4VqhloKkjdNSXChT9ojh4Sumo0Dy62G/GNC03NcSM6e
	rbYdO2WHFB1MgPLEZSzksRNakzVq13yHip/c5mJAjETjP+1mESx9niOIGnm9b/4oqu9qMnredeeGx
	IWHDjHyzPd9o4T7OfvfzgJaVo/XRH2QK8h99zg1eEaHxeFHrnZv3mFyjssblSO1thkO7mgPWAVFQM
	MyZAG2YwKiLaMyKxP2xlihC3DX2cmP23C301V/7f2YxLk25AkHqPxPqeULask08OLxNyl0OTB/ZqT
	IhhRHi+aR9p8WcnbFzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdPjd-006Okg-Ij; Thu, 21 Oct 2021 04:31:21 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdPjZ-006OkP-Nk
 for ath10k@lists.infradead.org; Thu, 21 Oct 2021 04:31:19 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="227710738"
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="227710738"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 21:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,168,1631602800"; d="scan'208";a="494946097"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 20 Oct 2021 21:31:15 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mdPjW-000DyY-Q2; Thu, 21 Oct 2021 04:31:14 +0000
Date: Thu, 21 Oct 2021 12:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 a5b5f2cfe7dafd4f2a2912f23c31575cdcba64b7
Message-ID: <6170ed0b.r7M9Dt+Veyxs0YyV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_213117_827424_12543579 
X-CRM114-Status: UNSURE (   4.89  )
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
branch HEAD: a5b5f2cfe7dafd4f2a2912f23c31575cdcba64b7  Merge branch 'pending' into master-pending

elapsed time: 1100m

configs tested: 147
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20211019
powerpc                      tqm8xx_defconfig
arm                         s5pv210_defconfig
powerpc                     taishan_defconfig
powerpc                     kilauea_defconfig
m68k                          hp300_defconfig
nios2                         3c120_defconfig
arm                        mvebu_v5_defconfig
arm                        vexpress_defconfig
arm                      integrator_defconfig
powerpc                    amigaone_defconfig
mips                        maltaup_defconfig
arm                      pxa255-idp_defconfig
arm                            hisi_defconfig
s390                             alldefconfig
sh                           se7780_defconfig
arm                         shannon_defconfig
csky                             alldefconfig
m68k                          sun3x_defconfig
powerpc                      ppc40x_defconfig
sh                             shx3_defconfig
sh                          polaris_defconfig
powerpc                      pcm030_defconfig
powerpc                      katmai_defconfig
m68k                       m5275evb_defconfig
arm                          ixp4xx_defconfig
powerpc                          g5_defconfig
sparc                       sparc64_defconfig
arm                           viper_defconfig
arm                         bcm2835_defconfig
arm                             mxs_defconfig
arm                       cns3420vb_defconfig
powerpc                      pmac32_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          kfr2r09_defconfig
powerpc                     sequoia_defconfig
arm                          exynos_defconfig
arm                         orion5x_defconfig
mips                         rt305x_defconfig
mips                        workpad_defconfig
arm                          gemini_defconfig
arm                        mini2440_defconfig
mips                      maltasmvp_defconfig
mips                             allyesconfig
sh                           se7712_defconfig
arm                            mps2_defconfig
powerpc                     ppa8548_defconfig
mips                           gcw0_defconfig
mips                       rbtx49xx_defconfig
mips                          ath25_defconfig
xtensa                  nommu_kc705_defconfig
arm                  randconfig-c002-20211019
x86_64               randconfig-c001-20211019
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
arc                              allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
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
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20211020
i386                 randconfig-a003-20211020
i386                 randconfig-a002-20211020
i386                 randconfig-a005-20211020
i386                 randconfig-a006-20211020
i386                 randconfig-a001-20211020
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
arc                  randconfig-r043-20211020
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20211019
x86_64               randconfig-a006-20211019
x86_64               randconfig-a005-20211019
x86_64               randconfig-a001-20211019
x86_64               randconfig-a002-20211019
x86_64               randconfig-a003-20211019
i386                 randconfig-a001-20211019
i386                 randconfig-a003-20211019
i386                 randconfig-a004-20211019
i386                 randconfig-a005-20211019
i386                 randconfig-a002-20211019
i386                 randconfig-a006-20211019
x86_64               randconfig-a013-20211020
x86_64               randconfig-a015-20211020
x86_64               randconfig-a011-20211020
x86_64               randconfig-a014-20211020
x86_64               randconfig-a016-20211020
x86_64               randconfig-a012-20211020
hexagon              randconfig-r041-20211019
hexagon              randconfig-r045-20211019
riscv                randconfig-r042-20211020
s390                 randconfig-r044-20211020
hexagon              randconfig-r045-20211020
hexagon              randconfig-r041-20211020

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
