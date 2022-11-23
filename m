Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7B7C4332F
	for <ath10k@archiver.kernel.org>; Wed, 23 Nov 2022 09:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3oSsB5mG9VgOfdlURRtCNA2MNIa2hhJSzinfefKr57I=; b=a1G7ZW3Qs/UXSk
	MuEHLKsGDWMN7qWMuZMTwhnIkAwSrNs4TOpjbrxvLs0glwBzkdCTWyhTZJ70VYPQdhe6xmDQ+FKOn
	yUOFTR78uW9zXafScld1EROdWEu/kDzM+3bJeVRjRAN87sHAKhYM8yDdFeD/SF87mcm93iZTanWQx
	Q/DMYG7txsTWYGCyTTHkmZyKUGyXtMGnaqF4bVGBnMWsX7/hecDgGLUQAWG/uBOQvGe9WUlNy3Vcs
	oBiJ2dcZ20sWGSRx3vp+MI97lkaHvdM4fD7rzmpHggYUNnLYHgVjCFVPh8GAhdggqlJrfY/YSp5zD
	cC06klr4QOGvkff5nTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmLg-00G48J-5N; Wed, 23 Nov 2022 09:47:20 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmLc-00G43o-HV
	for ath10k@lists.infradead.org; Wed, 23 Nov 2022 09:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669196836; x=1700732836;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Wn9UAJBk1YYrJh7cZapkhYPh2bN9U/Pd64dDxhRQAjE=;
  b=ISFxZko9TinszVQYy4U5jFs1Gg8ak9fu3VpKNzFR+hSLdL4MRCMfGP04
   qIQ1FbcXcmjmryfYmgmpYrn4XvikacFvg7fZat+8LTIycf72dOilFmHCZ
   8LD8N/OJdN9YOiQLMmD0Ri5Fb4hR72uB/PuntcBXkXDR8oLgAt1xOWLRF
   VadlzLl4cG3yuMzVjPM9zy/Q8W8GE9gOWuOg66nXGYo9SSiyytt4OJoH9
   1mu1dd+WsguMj4n3m0f3Do/u8WMvWKfbtbjXmV2Xa5ziDzjf8jDzWNi9j
   mzDLIYg2wFHflFwwvFGOpfNc6dzCdGNQYxVwxz1H9z6/fwlDA3yNvjas+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315179921"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="315179921"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 01:47:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="619554439"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="619554439"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Nov 2022 01:47:08 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oxmLT-0002ap-2T;
	Wed, 23 Nov 2022 09:47:07 +0000
Date: Wed, 23 Nov 2022 17:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 70c1ab92e76f5a6fd42fcd751a9bb3f268033bb8
Message-ID: <637dec13.7MPUvqibs4SXjJ2A%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_014716_719208_29132D61 
X-CRM114-Status: UNSURE (   4.55  )
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
branch HEAD: 70c1ab92e76f5a6fd42fcd751a9bb3f268033bb8  Merge branch 'pending' into master-pending

elapsed time: 1477m

configs tested: 83
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
arc                                 defconfig
alpha                               defconfig
sh                               allmodconfig
um                             i386_defconfig
s390                                defconfig
um                           x86_64_defconfig
i386                 randconfig-a011-20221121
s390                             allmodconfig
i386                 randconfig-a013-20221121
ia64                             allmodconfig
i386                 randconfig-a012-20221121
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                 randconfig-a014-20221121
x86_64                           rhel-8.3-kvm
i386                 randconfig-a016-20221121
i386                 randconfig-a015-20221121
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64               randconfig-a012-20221121
x86_64               randconfig-a011-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a016-20221121
x86_64               randconfig-a015-20221121
x86_64               randconfig-a014-20221121
x86_64                              defconfig
arc                  randconfig-r043-20221120
riscv                randconfig-r042-20221121
x86_64                               rhel-8.3
arc                  randconfig-r043-20221121
s390                 randconfig-r044-20221121
x86_64                           allyesconfig
i386                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                             allyesconfig
i386                          randconfig-c001
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r041-20221120
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221120
hexagon              randconfig-r045-20221121
riscv                randconfig-r042-20221120
s390                 randconfig-r044-20221120
i386                 randconfig-a001-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a002-20221121
i386                 randconfig-a004-20221121
i386                 randconfig-a006-20221121
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
s390                 randconfig-r044-20221122
hexagon              randconfig-r041-20221122
riscv                randconfig-r042-20221122
hexagon              randconfig-r045-20221122
x86_64               randconfig-a002-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a004-20221121
x86_64               randconfig-a006-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a003-20221121
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
