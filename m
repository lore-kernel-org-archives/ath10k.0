Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01441C32771
	for <ath10k@archiver.kernel.org>; Mon, 26 Sep 2022 21:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AP+RvfUbIZOdQLzmPe92WxrfNyTlogr/avi5nvrLwbY=; b=iHe4NWH9ldVALP
	9ZI6gUu9Blp7ehD9Xk3baDZ7MLbrQdo4j49iGIGPvC3E1O3o5sGLtpmmVNWhV1oPo/d4OsTbGjaQ7
	bB4pAofpDkC1Ekn6C57pmfC13EQoPhMFdp+K0fNjwB7vpM5LuVaIyly3/cu8+d7mekIs+c77ufC9a
	UrvQvC4fQJpwKPV0sPA08fYJdzpZly4dQfPiD37OoyMsxDNhkNoFOWy0UNt+fGQ/1KcP9cTrU1n+E
	T6J15LRz5rnWoxPE6KHJ10HqdWDYJOUB1qpynIdLGaQtczE41f2vwgoGzSZqmmbo0KVJD9Qs7GKDt
	V/1WdethSsAphKcIJvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw6M-0076iq-DY; Mon, 26 Sep 2022 21:57:22 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw6I-0076gp-1w
	for ath10k@lists.infradead.org; Mon, 26 Sep 2022 21:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664229437; x=1695765437;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3OfyftGeqOmDEcvlvsnqe6BUVQSRtx2p5TABCtEcNoM=;
  b=n8UMeKKWPEEV0peNX/Vp4rneWm/XQMqFTx0pg9OXaOCWi5Dbm8GXYujd
   2rlhJRKEGaWG8eOD/oIVyyramIqQS7LsUXPaO6Sqj2BOJzKVX3qgumYM+
   XydXxgKsopdNE8QYOAq9uLzpa3Yx2TFAVamLlOjwqadSEF54A43z4YWmr
   f9/sqQkri5oy7ikd+etBd+0D1alyVdQYv8HTjHluFbH+VEfBJow0IxIne
   yGvpsX96lx4L079kSbOYLcBNOAD216p6ne2CcE5eCjM2zwLJCGhPti2rP
   F5Vlqqx3CDHn8e1rnYuarUUu+wHoYhlY2fVFsJuLdmhnSTyFTOliaPzST
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="365187081"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="365187081"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 14:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="689731342"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="689731342"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2022 14:57:12 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocw6B-0000Hu-38;
	Mon, 26 Sep 2022 21:57:11 +0000
Date: Tue, 27 Sep 2022 05:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 c00c00aea17265fd90ee8b574063e9a25d0400ff
Message-ID: <63322030.WDjFVmYWWCKp2ANp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_145718_171072_92F02E1C 
X-CRM114-Status: UNSURE (   5.84  )
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
branch HEAD: c00c00aea17265fd90ee8b574063e9a25d0400ff  wifi: wil6210: debugfs: use DEFINE_SHOW_ATTRIBUTE to simplify fw_capabilities/fw_version

elapsed time: 723m

configs tested: 87
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                           x86_64_defconfig
alpha                               defconfig
um                             i386_defconfig
s390                             allmodconfig
s390                                defconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
s390                             allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
sh                               allmodconfig
x86_64                        randconfig-a006
x86_64                           allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
i386                                defconfig
arc                              allyesconfig
m68k                             allyesconfig
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
arc                  randconfig-r043-20220925
i386                 randconfig-a001-20220926
i386                 randconfig-a004-20220926
i386                          randconfig-a014
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
riscv                randconfig-r042-20220925
i386                 randconfig-a002-20220926
i386                          randconfig-a012
i386                 randconfig-a003-20220926
i386                          randconfig-a016
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
hexagon              randconfig-r041-20220926
x86_64               randconfig-a014-20220926
i386                          randconfig-a013
x86_64               randconfig-a016-20220926
i386                          randconfig-a015
x86_64               randconfig-a013-20220926
i386                          randconfig-a011
hexagon              randconfig-r045-20220926
x86_64               randconfig-a011-20220926
hexagon              randconfig-r041-20220925
x86_64               randconfig-a015-20220926
riscv                randconfig-r042-20220926
x86_64               randconfig-a012-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-k001
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
