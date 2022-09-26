Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29CEC07E9D
	for <ath10k@archiver.kernel.org>; Mon, 26 Sep 2022 21:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GU6tPvTeYTpNX0XhM2sX8RL8bUKmD99J/hr2m2lHLX8=; b=eFIMH52rAygZVP
	GFJu2OKmOWWw7CKHdNRN4kycwXGFIT9WPzBT4S6zbdEpZAx+K1FjDUqatNchK37gAYzCf4XIGRP2C
	2moRiUqmmZoQB0lk4lmIXc9kDlTiRlI13OUC/o7s6cYksO5+2atw67dCuS4ry1RmaYjqtljgcKtUz
	AhXQsQfUeVCk59Rp7S9oM7Ml9+k2zt5bKJvQIhgR/1OFR3QJVh7Ax3Q4Rjkdg2a4a+abRWExzCPbW
	3eTfEdY8HQG9cc8UJxxYoyl6Nl0V1STEERsQ1AdXJpki8kbUaX0SH4kolULZx4+uo7qurJVuHRrQf
	LmPb5oou5A1Lv1lrUJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw6J-0076ht-A9; Mon, 26 Sep 2022 21:57:19 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocw6H-0076gu-56
	for ath10k@lists.infradead.org; Mon, 26 Sep 2022 21:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664229437; x=1695765437;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dxq5xYlTaYhEsa5imDoJXWnqSWwCnetD7d0sen3edbA=;
  b=RoN7QvmFxJj8NxpOwEEzbZZodu9mCgJhGGbED4OUb7B4tmw+RdfTGsXr
   EFTpEFaSi8SuHmjU6G4v9WLhjpk3i9GarfDRHMdBoiQ521uQnAJVvxRcW
   LudtRgxwV83eifvSDiOV/G9rTUaQYJH3iMQGPgb7HmN4W+89RXxqZJMQp
   qkW1pXK6FDhy4P5NlAahfWzoeUNvMdStaZcf7vwZ29eMJrn6kOKbppriT
   FYaLIp3Mh9dcNXQZyNNij49vpKerOg2CAHRXTcFDS/74JvQZ+hFbCGD16
   5ahwwq64LWMDLyJe3QaViQYzAJq+HnQtsRDV5BqU9UsaxxQWTIS8pfmq8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327506174"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="327506174"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 14:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="710292402"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; 
   d="scan'208";a="710292402"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2022 14:57:12 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocw6C-0000I2-05;
	Mon, 26 Sep 2022 21:57:12 +0000
Date: Tue, 27 Sep 2022 05:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 92764e24ac9f6e105b3513f32f70dd94f67437ac
Message-ID: <6332202e.lGfTYR0mAEFVi7kX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_145717_238432_68CA6BCD 
X-CRM114-Status: UNSURE (   7.08  )
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
branch HEAD: 92764e24ac9f6e105b3513f32f70dd94f67437ac  Add localversion-wireless-testing-ath

elapsed time: 724m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                              defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
s390                             allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
sh                               allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
arm                                 defconfig
x86_64               randconfig-a003-20220926
x86_64                           rhel-8.3-syz
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
i386                 randconfig-a001-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a004-20220926
arc                  randconfig-r043-20220925
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
ia64                             allmodconfig

clang tested configs:
x86_64               randconfig-a012-20220926
i386                 randconfig-a011-20220926
hexagon              randconfig-r045-20220925
x86_64               randconfig-a014-20220926
hexagon              randconfig-r041-20220926
i386                 randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
i386                 randconfig-a013-20220926
hexagon              randconfig-r045-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a016-20220926
i386                 randconfig-a012-20220926
hexagon              randconfig-r041-20220925
x86_64               randconfig-a015-20220926
i386                 randconfig-a015-20220926
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
