Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9110C433F5
	for <ath10k@archiver.kernel.org>; Wed, 16 Mar 2022 04:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f3R+1v8od+T88uzMbhVmDT/7SiR5PjF4o/qA27/88ko=; b=THbi3P+HjGRiNN
	QXYym2f4Nm9NaFe5+eAKaR5dWKCOqWDgmVHlChXgiUW8RRbFtUEXzZ1kPrnqwkj1YLV+/vpmHgfMO
	BbSGiyXq5yfn7K+sVa5G0NLg89dMf6bYdjm2AzGOF7U/unNGzS09I9RtQryPkE+U2GVh4A61e4hQH
	ku/7H0Yrx+gNtEry7S44ox75CgKiuUa+pzUK3uEZK3mBx4umAdZJWp3j7cVkNHjhFx07iUlxwXnbq
	guYgU5/99cvFdulBZtFMiaUiVvHd0oe/St3i9czq0gE3O9X5nvFNc25dkd4q3VZxgHWQ3R30oNiXx
	u1pMt/tWFbi6vjMKuCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nULMH-00BOy7-WD; Wed, 16 Mar 2022 04:34:02 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nULME-00BOx0-Vh
 for ath10k@lists.infradead.org; Wed, 16 Mar 2022 04:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647405238; x=1678941238;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=45qpj3W4tdxmlQ0Zd8ydXcsYf9CJAj0BmrVXkK2okvs=;
 b=CM5k0IXQzgaP+4YxihLnXW8bCBmcbtaMeByY5N0fhhYu3vD4wfz7hXQ3
 OB0r4RTQPSVo1LNAvNgb3OXi0Q7VH6EskS+YyRxc/iz8O0q0MJJ/CoU97
 nDOSQsdNTR/H27G4ZHhMsWLXlTU8fYWg00ODASDCvutvrFNcOkOJK+L/R
 4uV/eEk2286wXjSfRKa2681dMoM1ISPMk8glgu8vKwLhlcFwY0jACSc40
 soZDLdFvZ24ktlrX55RacezK4J1f5tJpFC82SaMfUznKtvBFhxVlsBvRQ
 UlUqaAEJ0cRl2s8ipQJHrN5vyPNXamM0TBB5JeUJ5C7HYlLv+u5Mlbvdb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="281268153"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="281268153"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 21:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="549845888"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 15 Mar 2022 21:33:56 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nULMB-000Bwg-SB; Wed, 16 Mar 2022 04:33:55 +0000
Date: Wed, 16 Mar 2022 12:32:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 6042ef58c13156e3c204669359495ba470b1ccfe
Message-ID: <62316877.3DtPc4glXqRwfLrv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_213359_075313_936BF705 
X-CRM114-Status: UNSURE (   5.59  )
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
branch HEAD: 6042ef58c13156e3c204669359495ba470b1ccfe  Merge branch 'pending' into master-pending

elapsed time: 725m

configs tested: 125
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
powerpc                 mpc834x_itx_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
mips                        vocore2_defconfig
alpha                               defconfig
h8300                            alldefconfig
sh                          rsk7201_defconfig
powerpc                    amigaone_defconfig
sh                          landisk_defconfig
s390                          debug_defconfig
arm                         lubbock_defconfig
powerpc                 canyonlands_defconfig
xtensa                  cadence_csp_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          rsk7269_defconfig
arm                        realview_defconfig
mips                         mpc30x_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
arm                        shmobile_defconfig
arm                          pxa910_defconfig
nios2                         3c120_defconfig
sh                          polaris_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
nds32                               defconfig
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
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a006-20220314
x86_64               randconfig-a001-20220314
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220313
arc                  randconfig-r043-20220314
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
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
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220313
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220313
riscv                randconfig-c006-20220313
i386                          randconfig-c001
mips                     cu1830-neo_defconfig
mips                        omega2p_defconfig
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220313
hexagon              randconfig-r041-20220313

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
