Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1402EC433F5
	for <ath10k@archiver.kernel.org>; Tue, 24 May 2022 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YHD3hgIiG/CyzdTUlcCQgJgn0JiLKbtqLOEVOiNie4k=; b=08FTGjqarm1GZ1
	2RlZX7yTny5wuMmbeEZVfh8P64NHLjOZ+62GJyoDxnh4mcuDhSi7zC2o8AfnbOvZxVNFMJPn0cFPS
	5Jaji3ecZu3xLYad0tQq0EUDXpAOM87saf7wZ7yGPb8dtjLhFAmp1BQHQbZBAF0fWLCJHRK9Hy3jb
	LDyXn8Kh0qpqHlkS/J94hz82nvVgNed0oPpLk3EJ+SsTYeSBa0QmWVGAJ8+SwasGk6Qzgwze7D/iE
	FnDGskK3R1+wOmQDMjvT0HPn1mmG4KPJXruFL/9QDtlqIRf8foA+EKQLcgYu+OVEBL15JVX1G4XSA
	Y/J5zqBVSxWkFeSgl+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntPq5-007EC3-SP; Tue, 24 May 2022 08:24:25 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntPq2-007EBD-Ls
 for ath10k@lists.infradead.org; Tue, 24 May 2022 08:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653380662; x=1684916662;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=PDMeofKyelv9Zyb/Os7/ldj3RCn9Bkjp1l4mZG43VwY=;
 b=BhYM2nuoi03sN0RJDpDWCej/LKeb5l9mG04z9rXlmpXiFpginvN3trzW
 isZ0pKj12m9ffeZwkxm94/hb7yI5v7Qtyci9KYPTEcAWZF5x9SZB5e69x
 xQWLkwfmCRbqFm69WgMmvaweXh+76wwOab0FwODYR+NzjEiRxs4i9/iRr
 /0J+gHbolL5AKgj3UwF4kmylGN4pdJO0+k0uxKcgnEycwytmGuH2+gMHh
 LBdCg/zZqfBV7GqA8HfCAvqIurd1j/PBCk1/DoRsASWAOsI3ADBdivKls
 7gOlWLVoiYv2QRXJGkSX3Xeg5NPN+fk3iwLt1Bey4G6UVat8Wchb3RLQs g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="255532312"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="255532312"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 01:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="559033375"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 24 May 2022 01:24:10 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ntPpp-0001sQ-Sx;
 Tue, 24 May 2022 08:24:09 +0000
Date: Tue, 24 May 2022 16:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 77503ba72d24e819151f2694f8841e673142f030
Message-ID: <628c95f7.+SjAuLv8mtKE9OK3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_012422_809919_86B19124 
X-CRM114-Status: UNSURE (   6.79  )
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
branch HEAD: 77503ba72d24e819151f2694f8841e673142f030  Merge branch 'pending' into master-pending

elapsed time: 749m

configs tested: 99
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
mips                     decstation_defconfig
um                               alldefconfig
sh                          r7785rp_defconfig
sh                          lboxre2_defconfig
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
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                              debian-10.3
i386                             allyesconfig
i386                   debian-10.3-kselftests
sparc                               defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220523
x86_64               randconfig-a006-20220523
x86_64               randconfig-a001-20220523
x86_64               randconfig-a004-20220523
x86_64               randconfig-a002-20220523
x86_64               randconfig-a005-20220523
i386                 randconfig-a001-20220523
i386                 randconfig-a003-20220523
i386                 randconfig-a002-20220523
i386                 randconfig-a005-20220523
i386                 randconfig-a006-20220523
i386                 randconfig-a004-20220523
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220523
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
arc                  randconfig-r043-20220522
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                         lpc32xx_defconfig
powerpc                  mpc866_ads_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a014-20220523
i386                 randconfig-a011-20220523
i386                 randconfig-a013-20220523
i386                 randconfig-a016-20220523
i386                 randconfig-a012-20220523
i386                 randconfig-a015-20220523
riscv                randconfig-r042-20220523
hexagon              randconfig-r041-20220523
hexagon              randconfig-r045-20220523
hexagon              randconfig-r041-20220522
s390                 randconfig-r044-20220523
hexagon              randconfig-r045-20220522
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
