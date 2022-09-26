Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6485C6FA82
	for <ath10k@archiver.kernel.org>; Mon, 26 Sep 2022 21:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ZPI23Vb1hWVNBZUa76oFOZLfMvGOK7+iBgkMGPDBJo=; b=EE7iwNkzK9eoWq
	R5Og1W+RBhXSs+u/lkYgh+srD8yADu2ptC3uofJcdYlL5DAYReMRcOP/dMS0WfCCqFTbuqt9R3HOA
	rthik7jVBZTfLbUmu8pOf/8bYFmUMNyBEaX2g9uvKleMenqCWhZJYhIJw0/GvayMU4JKne2K951/e
	uU6sAfW5RbrugP2th1KNu0x+NC3e0o2eBIyTnSmsDY0AnTIwxvKEX/IP6ozBNoIZCOsuQgAyMUdU9
	GNMOOFOq0wtyJmM/WZfjA3ypKRkDeJkr23K5v/SYvWqb1bNRsz/VKMC25S4AWGk2nT+ynEDljWFTk
	YqkiePXV1ewhacRNqD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw6O-0076jE-2s; Mon, 26 Sep 2022 21:57:24 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw6K-0076gp-48
	for ath10k@lists.infradead.org; Mon, 26 Sep 2022 21:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664229439; x=1695765439;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xP8V7CHgTM1OKLcJDvbl9XaqmOja850wbwXPodOrkzY=;
  b=VM7fvmL4gtrgkmUgpeliwOMKSJqB3wVuXJ68t/bE+wlLvNOz+Tqw6gWz
   CYQS67dz3YFQgz61+12XbjUOucMHsd3w2zfakC5InzxEzDM/CbDgiBFiN
   8t9u70aY1uzHWEuH4Cj/R1ZbLwcEkdGKU2fOjPa6BWNgy9SugbdcY8ZZk
   GwEVxuvWCjibcve+y6GABRVNSg0O4lqjI8kjCBWtIpqgUAtJEsJ98FJ1z
   wZ3MXOnW6VhVr6dVHTogIaECFUXFpDW54II6gaeoJRIGOtL5SeiPq8wab
   5wEpPV3moqLsZmTHuqiLB0M0ARxUY0kF52v8ErdEaOwkzJRx9Fr1yzpPZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="365187082"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="365187082"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 14:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="689731343"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="689731343"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2022 14:57:12 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocw6B-0000Hw-3C;
	Mon, 26 Sep 2022 21:57:11 +0000
Date: Tue, 27 Sep 2022 05:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 d78c8b7131dc69abaa6d9131006ba30f9a51e41b
Message-ID: <6332202b.Q7XJ22vPMkRVOfy0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_145720_254645_AE7C1B28 
X-CRM114-Status: UNSURE (   5.87  )
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
branch HEAD: d78c8b7131dc69abaa6d9131006ba30f9a51e41b  wifi: ath11k: Fix deadlock during WoWLAN suspend

elapsed time: 724m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                             allmodconfig
s390                                defconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                 randconfig-a001-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
x86_64                           rhel-8.3-syz
i386                 randconfig-a004-20220926
x86_64                         rhel-8.3-kunit
i386                 randconfig-a005-20220926
x86_64                           rhel-8.3-kvm
i386                 randconfig-a006-20220926
x86_64                           allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                                defconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a002
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                             allyesconfig
arc                  randconfig-r043-20220925
riscv                randconfig-r042-20220925
arm                              allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
ia64                             allmodconfig
sh                   secureedge5410_defconfig
arm                          gemini_defconfig
powerpc                      tqm8xx_defconfig
sh                               alldefconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a003-20220926
s390                          debug_defconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220925
i386                 randconfig-a011-20220926
hexagon              randconfig-r041-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
hexagon              randconfig-r045-20220926
i386                 randconfig-a012-20220926
hexagon              randconfig-r041-20220925
i386                 randconfig-a015-20220926
riscv                randconfig-r042-20220926
i386                 randconfig-a016-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a015-20220926
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
