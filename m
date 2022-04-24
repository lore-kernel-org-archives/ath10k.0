Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E279C433F5
	for <ath10k@archiver.kernel.org>; Sun, 24 Apr 2022 22:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ie2gWqL8Jbc6kN/NXOUrHFGPMDXKi1m5dWjx/jJ/2FI=; b=N7xafYBUh+IpPE
	vDynYw0cB6mek+dJTSEelIUhyJiiq9qAOUGukkhFMiaXT/9LJct/dFRIB7KvdhxmsZJ8W3Hmlai5q
	DF1D4eqe2+XxszmdcFN5hb4T/+XZ5bViKKV4Rjijrg0QLVLsvOr1Pdt5GdWqxGivFG1k5jT4aGayJ
	oWmFyd3wAp4O4aRuW7LAejCDO4xdFdK3N+L6G08NR5F8OxO5LoJJczI2wraMc/D+Yi3r8foyzYOh7
	PU/R8nHHNJHJlgZBfKnz07w7qX18m/CPygpReVhWn00KSmHExEHAoD563ph1b9VVzAyKzrlV1iYj1
	vsf2zDcRhjcfbW0FwwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nikl6-007TwQ-V1; Sun, 24 Apr 2022 22:31:13 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nikl3-007Tvw-B5
 for ath10k@lists.infradead.org; Sun, 24 Apr 2022 22:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650839469; x=1682375469;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=waxMvxztq99wsCQmE9R4oi7XxjSmEshqxhD6faPYKDY=;
 b=LQcVJo4dFLwn5RDg1dr9PuDD+lVHYP3NFdFGzzvgzIzhAFsgtOpRTaqb
 luXz/AjzsyBCzveLMGUFqhdIREj9Qz2wdh9iEB7MjTdzFarEHyiMGsR2d
 wvobml3ENnqBi6fAcvKW9dzvbm8jydNNih1sWJZWP5jO/VUL6O/C58yRL
 fVRiJ25gKmWq0PNgwgJ8R+kF4TNQyQgeGzgdgD4QWk/0fdjkEX7Hc13xp
 owB30fvGkT+oywJV7fAFAn+Zi43SDcwPd7CuB8Q16RiUgjZEWrLyPRH1+
 WfRTWbxZ1ptFIx9Kj8pKs6/2hDtCw4+3Xq5JKAkvW9SFGyBqlEWPZVEnR w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="245019859"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="245019859"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2022 15:31:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="627787506"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 24 Apr 2022 15:31:04 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nikky-0001qR-6N;
 Sun, 24 Apr 2022 22:31:04 +0000
Date: Mon, 25 Apr 2022 06:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 36b576b5f874897c538809dd62c88bcf64cc835e
Message-ID: <6265cf73.IIiimKVgIwzmGJKo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_153109_437654_1CC1E9F2 
X-CRM114-Status: UNSURE (   5.63  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: 36b576b5f874897c538809dd62c88bcf64cc835e  ath11k: update debugfs support for mupltiple radios in PCI bus

elapsed time: 723m

configs tested: 110
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                           se7750_defconfig
sh                           sh2007_defconfig
i386                                defconfig
powerpc                       maple_defconfig
sh                        sh7763rdp_defconfig
arc                          axs103_defconfig
sh                         ap325rxa_defconfig
arm                          pxa3xx_defconfig
arm                           imxrt_defconfig
sh                           se7780_defconfig
parisc64                            defconfig
sh                      rts7751r2d1_defconfig
parisc                generic-64bit_defconfig
powerpc                      pasemi_defconfig
sh                                  defconfig
arm                           corgi_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                    maltaup_xpa_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220424
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                  randconfig-r043-20220424
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220424
mips                 randconfig-c004-20220424
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220424
powerpc              randconfig-c003-20220424
arm                   milbeaut_m10v_defconfig
arm                  colibri_pxa270_defconfig
arm                         orion5x_defconfig
arm                        spear3xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r041-20220424
hexagon              randconfig-r045-20220424
riscv                randconfig-r042-20220424
s390                 randconfig-r044-20220424

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
