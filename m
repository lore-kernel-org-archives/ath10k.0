Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A01BC433EF
	for <ath10k@archiver.kernel.org>; Thu, 31 Mar 2022 02:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5QFRbFt2QwHxAoxEZY6tNvcFAdD1rVNfQ9FS5HNglTo=; b=Y8Tsr8BPPtzGlH
	he6GjAu+IBC7hRqCEJvIYmeqmfl0jsHavCYnzI9v7643hnpP/LmdzAhpRxjCi0Gz50GjJkTzErlt3
	nsoS2LGhlZRhSlR+rF1rMeX/d0USif540X833pbG6mE9vs4N7lKIGfTww7gIBzT1S1c1bPm+Ka/Px
	kOKIX+kyVVD4whPnoyBEA0MrE8i4ymcjXI2xSa+VC123GLLG2daOXhYLr4WSuET5yPCaQAq9l9DY/
	+J5ysnEEchh6wVJ0c0GcDIbrR6fggIFWQFPCBi7E7Lw23yBQaN6EE8mssvWOvGaYtXT/Yx/Wme55E
	DpF2eyLVCksqyGJjWd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZkt3-000NBc-Sg; Thu, 31 Mar 2022 02:50:13 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZkt0-000N9s-Dl
 for ath10k@lists.infradead.org; Thu, 31 Mar 2022 02:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648695010; x=1680231010;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=njXUQS9CphCnYMv00Pv9pqR/MJwQBGCPFrSqJZG72qU=;
 b=ncWbO8PJmd0/bcHafX4/y/PxGHYaj2q5rm34b5WnihTyZmSdyMS55Bc3
 2WIf7jRsfFvAkbAny5cHkgHUsz+evczbsn2o4LAc9d5ehtk/voHL3Ibg/
 T2+OtGMcgq1FcKtX9g31M14LPL6RVXp1ExGEmpY5dJlKMduVUYVdzVF5u
 tHPYCd2xtfYFGpy+td+C09swp8C3iCv6FtH7H1bymuYZiflspaff5dPO4
 2ihZrY/z3yLbfp/+N9fqT5ylB+H/52o3E3pfAQ2xL6UMr3BAG/b9w1iCP
 L8nA/xphi4LDvFcdZ7ajl1kCm+DUmJr/CGlxvnTcHMBhBQ/XPn5QEGtmL w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259888557"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="259888557"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 19:39:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="547106988"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 30 Mar 2022 19:39:49 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZkiy-0000mK-8s;
 Thu, 31 Mar 2022 02:39:48 +0000
Date: Thu, 31 Mar 2022 10:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 bf431d31f76f35902b7d3c80341deff02f0b3bab
Message-ID: <62451465.edUlSPNLim4ZZisS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_195010_563452_25A4F6C6 
X-CRM114-Status: UNSURE (   4.63  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: bf431d31f76f35902b7d3c80341deff02f0b3bab  Merge branch 'ath-next' into ath-qca

elapsed time: 1032m

configs tested: 134
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
sh                          landisk_defconfig
sh                        edosk7760_defconfig
powerpc                     rainier_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
powerpc                    adder875_defconfig
m68k                             allmodconfig
sh                          rsk7264_defconfig
arm                            lart_defconfig
arm                        trizeps4_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                      pcm030_defconfig
sh                          sdk7780_defconfig
m68k                           sun3_defconfig
mips                        bcm47xx_defconfig
arm                         cm_x300_defconfig
sh                             espt_defconfig
sh                        apsh4ad0a_defconfig
powerpc                  storcenter_defconfig
sparc                               defconfig
m68k                        mvme147_defconfig
sh                ecovec24-romimage_defconfig
openrisc                  or1klitex_defconfig
arm                         at91_dt_defconfig
arc                         haps_hs_defconfig
m68k                          multi_defconfig
arm                        cerfcube_defconfig
xtensa                          iss_defconfig
sh                         ecovec24_defconfig
powerpc                      ppc6xx_defconfig
m68k                        m5407c3_defconfig
m68k                          amiga_defconfig
arm                     eseries_pxa_defconfig
m68k                       m5208evb_defconfig
powerpc                       holly_defconfig
mips                         cobalt_defconfig
arm                         nhk8815_defconfig
arm                  randconfig-c002-20220330
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
sparc                            allyesconfig
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
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20220330
s390                 randconfig-r044-20220330
arc                  randconfig-r043-20220330
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
mips                         tb0219_defconfig
powerpc                     mpc5200_defconfig
powerpc                  mpc866_ads_defconfig
arm                        vexpress_defconfig
arm                       spear13xx_defconfig
powerpc                     kmeter1_defconfig
mips                        workpad_defconfig
arm                        neponset_defconfig
arm                        magician_defconfig
powerpc                     mpc512x_defconfig
arm                     am200epdkit_defconfig
mips                   sb1250_swarm_defconfig
arm                             mxs_defconfig
powerpc                       ebony_defconfig
arm                         s3c2410_defconfig
mips                       lemote2f_defconfig
mips                      bmips_stb_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220330
hexagon              randconfig-r041-20220330

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
