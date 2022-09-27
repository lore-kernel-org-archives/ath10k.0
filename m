Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED81FC07E9D
	for <ath10k@archiver.kernel.org>; Tue, 27 Sep 2022 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X4xC1uhBayfI1hAeFGCuPioQxO+qP8ZYM39fzL4PHbA=; b=tYiPsHYtETpVdn
	uKUjuillGfkvktMCfg2Rlbfp2l45lllPP7OZSAtBMwoNRRjJe496zUHcIr25XQXqIV+qqaYKF9kqq
	AY1y4WuKfO+6U3ZYJTT5wIkawZ10/Fl9zmZ5xVVHFRbH4Kft29jUvKVunzdPkh0o5SPwc0onjW21R
	JFoZW8sgZDZ56MkoIR86DFD9ghkYGiq72Vyjnqz9GNpow9ZXcMDr3AC4dzAcOzMELq8Tal98p1hL/
	Mr2elfyRhTX3MkHAN9k/Kyqha7nOGneXEsHz9/WmGck2DKsrOQ+bggo+/Guc3g8SRXoa5ZHu4YH3N
	hKM+PVDknteHnefBbpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odGhU-00CTzv-FF; Tue, 27 Sep 2022 19:57:04 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odGhR-00CTzW-3n
	for ath10k@lists.infradead.org; Tue, 27 Sep 2022 19:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664308621; x=1695844621;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CPlBCZ1vwyQrW0K/MnuZaxFdVYAGqRa6Wi/rnCsrP6w=;
  b=n6vG+qch4SZVSs0pULCh3UpiEzD+mklSbDNCi8aQ0LoIk3IUtNbicFGO
   ikjosiW6Fdx+TRsBX7/W1KClqu+WCac8ahz5N2cVFIzKxcx/B/Oy/zxCV
   t3Gsf9K45ziAexW5zIPRhlaezzIMqR6ggOMgK1mdeIL9OquoWmd+ZLGNZ
   7yx2EOHiugYmu8A5KZhwFVaOQCUPWOL+SmAi0f94z9M9dsUyqFRgBZgf/
   iZIJWDVbe7dfencqYR0XzyPsQd1YH9QRKxyQt5WFJl7rcNNZGB61aGe24
   ZcxKSH9eL1+Zpj+UtLWQ+NXXwWZ2K72fkCGHdWyfbDelKPZ6l/hwDV6mt
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281138224"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="281138224"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 12:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="950416217"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="950416217"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2022 12:56:52 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1odGhH-0001X2-2C;
	Tue, 27 Sep 2022 19:56:51 +0000
Date: Wed, 28 Sep 2022 03:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 47a22f59847aef1237d7a2819bfe6e31f930e031
Message-ID: <6333554d.0G+u8j5SWD0RQ+DS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_125701_190738_D6125364 
X-CRM114-Status: UNSURE (   4.39  )
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
branch HEAD: 47a22f59847aef1237d7a2819bfe6e31f930e031  ath10k: Replace zero-length arrays with DECLARE_FLEX_ARRAY() helper

elapsed time: 779m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                                defconfig
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a001-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
s390                             allyesconfig
x86_64                              defconfig
m68k                             allmodconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                                defconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220925
i386                             allyesconfig
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
riscv                randconfig-r042-20220925
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a015-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
