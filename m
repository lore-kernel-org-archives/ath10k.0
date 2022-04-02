Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7413C433F5
	for <ath10k@archiver.kernel.org>; Sat,  2 Apr 2022 00:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7GWtWLB0OO+Y6L9ZoyZup/QyciAXHKoPU3pN9VJu6Sg=; b=I3Sy9sFJXk4qMG
	8ZWKSxciK+PzmsUJwoYTf8spKQtRrC0Mgd8/DV5YJOZrHCvOLq0NTJPaXQqprttASAHAwP7HsacwV
	BS3y9uqBxEsTStBQ2BhzMSYquLHyDL718nHg/jvWcHpCNqNSpBP6yKrYpc9dNEMR345h8449bgP4L
	iT4IqArtvDgoWFIs0osa/0NHFgIo2DRcSLNOTVhKk9rBpLl+W1dDZEOdrtCn3mWbSgC20xunPlugy
	9e0s+SwdGCTZudKA9UU0hPB2x6NE+k8PV/jxaQquZojQLUhOVE4I1bbIY1PlbBeDzuiNahA0U7YYL
	DKI30Z/UYoxa3Z6RnVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naS4u-007fg1-9P; Sat, 02 Apr 2022 00:57:20 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naS4p-007fem-3O
 for ath10k@lists.infradead.org; Sat, 02 Apr 2022 00:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648861035; x=1680397035;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=2Kd/TlVPN0ScN4T0M1D/bIQ1YN3T7NK0cYtuzE2uJXw=;
 b=PZRkFMD7HBkLSBJ82/huuyRJDlw9TI0MVh2ijmRW39xDs5gwpF5thfvQ
 iqIeq7+H0H5TU7myFCDi8iFgZv2X7FaOkoclsRMejRcDD6oS5YvtUUu/Q
 n2R9/kI5S68DY+bZp9J8WwSRKBXAa8LvzX8tkBXr8xi1h42lglzw9UI0O
 MQAjllw1MD5DPvCfxV0I7G86tHq017URaVI1NwVoM6YcfqfC3p395fzar
 4am4A6ZfoHX0PmLF6GwQ1voeWXxFDUUICmsTA7wzifHw79tJ+KUaQAoYX
 xmiHiDnvMBLjWKgxqdPUCht6Yr6jJtJ+sDZWd41S3sIWqY37K74sBE677 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="257841305"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="257841305"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 17:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="504354782"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 01 Apr 2022 17:57:08 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1naS4h-0001dw-Ox;
 Sat, 02 Apr 2022 00:57:07 +0000
Date: Sat, 02 Apr 2022 08:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 57b7042c114767b7330b14a260f61732e556742e
Message-ID: <62479f2f.XfbjWGbVyl73GZm+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_175715_184536_86811A28 
X-CRM114-Status: UNSURE (   6.61  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 57b7042c114767b7330b14a260f61732e556742e  Add localversion-wireless-testing-ath

elapsed time: 742m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                          randconfig-c001
mips                           xway_defconfig
sh                          lboxre2_defconfig
arm                           h5000_defconfig
powerpc                       holly_defconfig
arm                         lubbock_defconfig
m68k                          atari_defconfig
arm                        oxnas_v6_defconfig
mips                    maltaup_xpa_defconfig
sparc                       sparc32_defconfig
m68k                         apollo_defconfig
sh                          rsk7269_defconfig
arm                        keystone_defconfig
sh                          polaris_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220331
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220331
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc              randconfig-c003-20220331
x86_64                        randconfig-c007
s390                 randconfig-c005-20220331
arm                  randconfig-c002-20220331
i386                          randconfig-c001
riscv                randconfig-c006-20220331
mips                 randconfig-c004-20220331
mips                        bcm63xx_defconfig
arm                         mv78xx0_defconfig
arm                         palmz72_defconfig
mips                           ip22_defconfig
powerpc                     kilauea_defconfig
arm                       netwinder_defconfig
arm                       imx_v4_v5_defconfig
arm                        vexpress_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220331
hexagon              randconfig-r045-20220331
s390                 randconfig-r044-20220331
riscv                randconfig-r042-20220331

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
