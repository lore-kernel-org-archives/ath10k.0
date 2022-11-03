Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BE0C43219
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 05:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rqiUbef1UELyJjHHN1vaX2cnZkzb6RnX6r6ZWS8sl7A=; b=XXZkgsN1eQdLKG
	NNim8umygvBLzdEKL8c8or8dumI/mAFXIP8lrguWAwNisRh19mvySN10ccQCoWYmioFuj3uM33QzX
	xCEB20OzFdd/R4/zdhzfin8VA9fKZvonv8TlF5NEpXmxThtiJCULrbQkEtgbGY8lgu20MCKKFm5Kz
	x1CFQK0JHHw+ddaGT54lhaRSFfxoiSpM6TSSJpCxGLdwcmm6mwxhNk/nXeckUBA4BmxYxnDjYxawb
	3B9S4+IINHCvkeapVeBQ6+BA1IWCyFfbwndyU0NyvzcxtPI6X+bkqfcwhVlJrzVcWUi+7Kphw5asd
	Zvebpb852It6rBU9XMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqT5f-00GCqJ-Pg; Thu, 03 Nov 2022 05:48:35 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqT5c-00GCoF-Og
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 05:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667454512; x=1698990512;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d6Imyd0MNLwIChg/nGfRwpCKVrE67gfP2RhbR5ZsAVE=;
  b=Y+4J15NwX6HScfq94uc4beECOGBtuGCwmM0d0giqJzsr25NoNws0dFsV
   Jwz5gLZRpcx2rGvbGxsG4A1nfcSqvk1oQAYsMypxY0alhod6d98wuZdsN
   1eDbIv6wpLEy4wjRw3hf+QBMyRAfbx2OWOyLfv8vbVqqzP+3Q+WiLwE2f
   lb9jj0HvffqV6Z2hxBMDT1Jj9r/z8CttndIsqxTqWFH45Z5wqNJcR7OdS
   06c1v0UkP66so1ljKpr1UVB7NbV30qqQuS+Fr+0ymmN+d1CIgh0Wvvd0b
   Z4LpjXfNv18pnIrC+ylGlHR9+RSGL/j34PaXGSrYeOXp14o3PFbEKiHuc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="395900158"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="395900158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 22:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="665832513"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="665832513"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Nov 2022 22:48:19 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqT5O-000FY5-2u;
	Thu, 03 Nov 2022 05:48:18 +0000
Date: Thu, 03 Nov 2022 13:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 0da022960da575deb01323aeab254005a234f06e
Message-ID: <63635617.TjmCUh/4+p3w1K8J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_224832_892803_6664C770 
X-CRM114-Status: UNSURE (   4.05  )
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
branch HEAD: 0da022960da575deb01323aeab254005a234f06e  Merge branch 'pending' into master-pending

elapsed time: 725m

configs tested: 82
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
ia64                             allmodconfig
powerpc                           allnoconfig
s390                                defconfig
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
sh                               allmodconfig
s390                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                               rhel-8.3
x86_64                              defconfig
alpha                            allyesconfig
x86_64                        randconfig-a002
arc                              allyesconfig
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a004
x86_64                        randconfig-a011
i386                                defconfig
m68k                             allmodconfig
x86_64                        randconfig-a015
m68k                             allyesconfig
i386                          randconfig-a014
arc                  randconfig-r043-20221102
i386                          randconfig-a012
i386                             allyesconfig
s390                 randconfig-r044-20221102
riscv                randconfig-r042-20221102
i386                          randconfig-a016
m68k                         apollo_defconfig
mips                     decstation_defconfig
sparc                       sparc32_defconfig
m68k                          multi_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                        multi_v7_defconfig
arm                         s3c6400_defconfig
sh                        apsh4ad0a_defconfig
arm                           tegra_defconfig
sh                          rsk7203_defconfig
i386                          randconfig-c001
sh                                  defconfig
arc                            hsdk_defconfig
sh                 kfr2r09-romimage_defconfig
parisc                           allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
hexagon              randconfig-r041-20221102
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20221102
riscv                randconfig-r042-20221103
hexagon              randconfig-r041-20221103
hexagon              randconfig-r045-20221103
s390                 randconfig-r044-20221103
mips                     loongson1c_defconfig
mips                           mtx1_defconfig
powerpc               mpc834x_itxgp_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
