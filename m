Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00832C433FE
	for <ath10k@archiver.kernel.org>; Tue, 11 Oct 2022 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxGzL3sTJCsT6CdzWcRib4Bk4hpck9/uKrMtIbL1llo=; b=A6NIFBZIThDjjG
	ByBF0tXPwl1aMceIytroxHqXZC/CI/Bxc68nhGyruO7Eg+XWr3T8lBmlfOk2yR6wnJ3RFR2aoIhFY
	5Xm/I0hcLOQr1VGN3xYM3Ceh1pGhxA2wN+ypTqcueV+LO3IS3xrsbGz3f9ZNZcUQSprVvT6WwGL7o
	dOtcb7OEVlRQHoxzq2f70pIyXSQxgX49dBkI2f7YFPNfWJuKkLoCBzN7pVzBuoYdHxAAAZkR7n4mx
	rMrrSi2HhkEDfmZBXPMj1WHPxrvsaMm1vFjy0cvvwL2BDnHSQWw33RUoVW+UxQ/5w3L27vHKzlkdM
	A1UlNxYuivq+3tMeB3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJG7-005MSn-5N; Tue, 11 Oct 2022 17:41:39 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJG4-005MSP-Eb
	for ath10k@lists.infradead.org; Tue, 11 Oct 2022 17:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665510096; x=1697046096;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=S1hV6O+Pm+o1fvTYEqCAIZkjXUi/Ie3fXRLzAkIpdwA=;
  b=GpeRhH8NDLHzZfujUYjRt9nuf0/PTUnL78eb0wG3ODOvtPuA8cuTNukG
   cFcuPuJGi1MAho+8eY42ASgprWEDBi4j4zKWjUsvbIG+jtUJdkAyWPYnz
   CyIqCB6GeSgjBn0GKH7Mb5KdwLg73awsZ0qtqHU9VuAM3yqxdTti4+Pis
   VKXAtJ7pha7ctCJU2/ln7KYgd73NVp2r1TDHHxJ3sGg7padnHXzbap7+i
   gRjlKOeCUGqRM8M25lOHCsLWx50y4Ke58ya6YgBATbcS72x0/QIitKwBZ
   3fX/JbwMG5SIPeFg2Pd1WOSmw4rMTm8eHo88UIDcm5V4f4f0kMICLoBZv
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="305637416"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="305637416"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 10:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="621490703"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="621490703"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2022 10:41:32 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oiJFz-00034B-1Q;
	Tue, 11 Oct 2022 17:41:31 +0000
Date: Wed, 12 Oct 2022 01:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 f55961f38b67f9456d3923d43907a3463f4a75c0
Message-ID: <6345aa9f.TLiB6hONdGpe1bjc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_104136_583490_3690738D 
X-CRM114-Status: UNSURE (   4.79  )
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
branch HEAD: f55961f38b67f9456d3923d43907a3463f4a75c0  Merge branch 'ath-next' into ath-qca

elapsed time: 746m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a012
arc                  randconfig-r043-20221010
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20221010
s390                             allmodconfig
s390                 randconfig-r044-20221010
s390                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a011-20221010
x86_64               randconfig-a014-20221010
x86_64               randconfig-a015-20221010
x86_64               randconfig-a012-20221010
x86_64               randconfig-a013-20221010
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
x86_64               randconfig-a016-20221010
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
arc                              allyesconfig
x86_64                               rhel-8.3
arm                                 defconfig
x86_64                           allyesconfig
i386                 randconfig-a013-20221010
i386                 randconfig-a015-20221010
i386                 randconfig-a016-20221010
i386                 randconfig-a011-20221010
i386                 randconfig-a014-20221010
i386                 randconfig-a012-20221010
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
m68k                             allyesconfig
sh                               allmodconfig
i386                                defconfig
arm                              allyesconfig
ia64                             allmodconfig
arm64                            allyesconfig
i386                             allyesconfig
arc                               allnoconfig
alpha                             allnoconfig
csky                              allnoconfig
riscv                             allnoconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r045-20221010
i386                 randconfig-a003-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a001-20221010
hexagon              randconfig-r041-20221010
i386                          randconfig-a015
i386                 randconfig-a006-20221010
i386                 randconfig-a004-20221010
i386                 randconfig-a005-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a002-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a005-20221010

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
