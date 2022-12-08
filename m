Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1667AC3A5A7
	for <ath10k@archiver.kernel.org>; Thu,  8 Dec 2022 06:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tkOt/byt8Lmq9PCbdAjRC5RrdpyS6SyhJOtxuXQy94I=; b=gW5x3q+81aVlux
	TS42iPye8R+f3wt9ulqav7UqA2fK1m6lSuW7h4m5Pa9FnBQ42bA02t7Wfu0l7VwBJVMAAZcWS13As
	qzpwtF4HdsZLN0A++Bqg0A3+I8hU10DkGj3jBesV4bSdyMdUpvVHhrBgI5E2LWS9CX7wuaeOut7kt
	rsNUEZVIypMrUMGgn6vjCRDKlxHiL3mJBqC9Nw+VbZQZ2D/bxzUF8rm0cZ/yVqYXxqv5i8lSm6nwC
	vl1DgIKxsVnQsNST9x28APGyXUgb8phhq1BKnMzWKnhjxq+JxDM7n+XCVqTukoekWJVRcSA1UtRjq
	WR9erQuBblQl9fvUiRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3AAA-003CoU-Pg; Thu, 08 Dec 2022 06:13:42 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3AA6-003CYX-7D
	for ath10k@lists.infradead.org; Thu, 08 Dec 2022 06:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670480018; x=1702016018;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3SXG1w3sCnOF7Ht02BHz+fvt3QNlDvWHO0GfPolT+tQ=;
  b=MW7xRnNOdPR6P1jedsBTQbuQ5SjZUmd/qYSzhB+KA4/sozXG+UE/INEX
   /k/dZqJOY6NEZ3xfQ0wruZMLyDNLAVRoR97G9DInhgdfTi9xyOnKzeKOd
   XFn9Bun62TKm5VfAWpE56kVjlCwMrjahPlXItV3fo9OMEVDE9i3Waxy1e
   SudbJ0Q1plsOwl2ZMYVP1NvpzFBSq7U9jUzz50iM4XpWtTfBoXI6HYRl/
   xVmUsMk2joL23XygFoYRDTQ6QnnUQwZSdXq28g5JCS/f4a/9ed3q/C3Pw
   IUJCApj8pbhocXN1C60QMVDcwjKvJIdzE32/07ylEd+AzD4LZgeHx+XIm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="344128880"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="344128880"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 22:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="753421800"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="753421800"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2022 22:13:34 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3AA2-0000uP-0J;
	Thu, 08 Dec 2022 06:13:34 +0000
Date: Thu, 08 Dec 2022 14:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 b334eb06cc6692093ff1cdd506d614dea90e9bfc
Message-ID: <63918060.2XD3RoRgDO2GRRkB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_221338_315543_5D332D7F 
X-CRM114-Status: UNSURE (   6.80  )
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
branch HEAD: b334eb06cc6692093ff1cdd506d614dea90e9bfc  wifi: ath11k: fix monitor mode bringup crash

elapsed time: 746m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
ia64                             allmodconfig
arc                  randconfig-r043-20221207
s390                                defconfig
s390                             allmodconfig
x86_64                           rhel-8.3-syz
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
riscv                randconfig-r042-20221207
x86_64                           rhel-8.3-kvm
s390                 randconfig-r044-20221207
mips                             allyesconfig
x86_64                          rhel-8.3-rust
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                        randconfig-a013
s390                             allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a001
i386                          randconfig-a003
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                          randconfig-a005
alpha                            allyesconfig
x86_64                              defconfig
arm                                 defconfig
i386                                defconfig
x86_64                               rhel-8.3
arm                              allyesconfig
x86_64                           allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
x86_64                            allnoconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a016
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
