Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0502BC4332F
	for <ath10k@archiver.kernel.org>; Thu, 22 Dec 2022 01:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o47EJLV3FgZFKXJBGas2H6ktdc+wksTM2Ce/v+Hiy8w=; b=EkheuG6VLrJLTD
	TzJklM1dC4G1REdqDG2yY15TykOcD+VPpDA0AvX/jsm7uoKyHrAV5HVcNwDzaWYbW0QiIsZd6FYXM
	Qpl7pp5zYYM8ghpKBxsN3Y/tG/II8bT15/B146V1KxwUfx0XT2ky5DVjavrn7mMcPtjis6QONZjv/
	nG7GOX1xicY+lZ/cpii18eoknqlZT3Enct8PUHwENcF8ixSdaVi4tAA50KNjgdS53AHbES5IfqIpL
	+/sLje5l7D+GNvIApF3VHpEmsMEICUAfv4Ne24vKOG5Wom+cmYrCrgqGy3ZtcXtSStBEwBX4BHfdq
	H+pJ6Z7Wu1BU5qJmwHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ASC-005BEX-9B; Thu, 22 Dec 2022 01:33:00 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ARw-005B87-CF
	for ath10k@lists.infradead.org; Thu, 22 Dec 2022 01:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671672764; x=1703208764;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gpYpTenV8x18OsCWf7c1x7N/MWg3IyBv1DLdaio72HU=;
  b=oFlo1qsu3TCMc3PDGFZFtiacHyOaG3pHgrcUbSOCUNsx97C2mOjPZd/l
   PMaaZAX3fuzwW9WwdLV1ldrK3Y97scOuJAQzRSCNtA5lFo/5Peb4N4eXY
   X2T/gQb+KY5fnm03ofnbyyEIRK3uoEoYn0BbsKXw7w1DI18gH5nLi39kc
   FFteP8vjW7wBFzlgFYQ3Yoj+45Qq52EJrCY9HZ8GkyIaG0NqopW3MJ5pc
   Ph2A17xMp6xA9lqYmbsV7fFRI9fQCTMRl7QU7PYU/G5jKtZC3e8nqrTEU
   ecIUYkk+un1aMB1rZAt4dDpzkYSHN2QIE17UhuW6lp+NKFEwQo7qhBIi6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="382241175"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="382241175"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 17:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="980401182"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="980401182"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Dec 2022 17:31:58 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8ARB-000B5F-2U;
	Thu, 22 Dec 2022 01:31:57 +0000
Date: Thu, 22 Dec 2022 09:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4401157f55af1a75de3568c38b83f3c4072508a5
Message-ID: <63a3b355.Q/S7tDKTcbCV6Pi9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_173244_552024_FFC6E819 
X-CRM114-Status: UNSURE (   4.13  )
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
branch HEAD: 4401157f55af1a75de3568c38b83f3c4072508a5  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 105
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                            allnoconfig
ia64                             allmodconfig
x86_64               randconfig-a002-20221219
x86_64               randconfig-a003-20221219
x86_64               randconfig-a001-20221219
x86_64               randconfig-a005-20221219
powerpc                           allnoconfig
x86_64               randconfig-a004-20221219
x86_64               randconfig-a006-20221219
s390                             allyesconfig
arm                                 defconfig
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
i386                 randconfig-a004-20221219
i386                 randconfig-a001-20221219
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
i386                 randconfig-a003-20221219
nios2                         10m50_defconfig
mips                             allyesconfig
m68k                             allyesconfig
riscv                randconfig-r042-20221218
powerpc                          allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                 randconfig-a002-20221219
i386                 randconfig-a006-20221219
i386                 randconfig-a005-20221219
arm64                            allyesconfig
arc                  randconfig-r043-20221219
alpha                            allyesconfig
m68k                          multi_defconfig
arm                  randconfig-r046-20221219
arc                          axs103_defconfig
arm                              allyesconfig
arc                  randconfig-r043-20221218
i386                             allyesconfig
i386                                defconfig
arm                           sunxi_defconfig
s390                 randconfig-r044-20221218
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
powerpc                      mgcoge_defconfig
mips                            ar7_defconfig
arm                            lart_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                           viper_defconfig
powerpc                  iss476-smp_defconfig
sh                           sh2007_defconfig
powerpc                 linkstation_defconfig
m68k                        m5307c3_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                        shmobile_defconfig
powerpc                       eiger_defconfig
xtensa                              defconfig
m68k                                defconfig
m68k                            mac_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
csky                                defconfig
i386                          randconfig-c001
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
sh                            hp6xx_defconfig

clang tested configs:
x86_64               randconfig-a011-20221219
arm                  randconfig-r046-20221218
i386                 randconfig-a014-20221219
hexagon              randconfig-r041-20221218
mips                          rm200_defconfig
i386                 randconfig-a012-20221219
i386                 randconfig-a013-20221219
hexagon              randconfig-r045-20221219
s390                 randconfig-r044-20221219
i386                 randconfig-a015-20221219
x86_64               randconfig-a012-20221219
hexagon              randconfig-r041-20221219
i386                 randconfig-a011-20221219
i386                 randconfig-a016-20221219
hexagon              randconfig-r045-20221218
x86_64               randconfig-a014-20221219
powerpc                      katmai_defconfig
x86_64               randconfig-a013-20221219
x86_64               randconfig-a016-20221219
powerpc                  mpc885_ads_defconfig
powerpc                    mvme5100_defconfig
x86_64               randconfig-a015-20221219
arm                           spitz_defconfig
riscv                randconfig-r042-20221219
x86_64                        randconfig-k001
x86_64                          rhel-8.3-rust
arm                        spear3xx_defconfig
s390                 randconfig-r044-20221221
riscv                randconfig-r042-20221221
hexagon              randconfig-r045-20221221

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
