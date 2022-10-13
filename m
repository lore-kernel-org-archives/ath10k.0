Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDECC4332F
	for <ath10k@archiver.kernel.org>; Thu, 13 Oct 2022 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oddas4sgnpOB3HR4PPMqzgky0xuFqBYQw7EPEaBJfQs=; b=rzgnxasvSDRmfm
	+9ku0U3wl0Yws4XR5WNjAevdRxxtPaL4LZ9pSwqD5Beh3vyaIXg44gKvSVAZxhcYLUGgEZNHVzF2a
	A2HRMzpLggWgCI16M8rCNjM3KjnFQc54ibVH5apHDTIiuQsqoVZ5IxraDvO1n9cqfP+UFws1PbhpK
	XqtoY0fMczwhI8g3w6nfPy6PDqcsqomaFcuhNU8yocPtAXw0PCqGb+qygwtfOwCqRoZXAhGEdNK1T
	4TDBKmcfkeRZTcbUj1fj78QuOFzy8+wF6AwucPFbXKDIrrK1AP9Be/XdTdhMFtuHk0SNPKgDlUxHO
	tthxH8bLM0cTT90ihBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oioJE-00APX3-Sg; Thu, 13 Oct 2022 02:50:56 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oioJC-00APTV-5k
	for ath10k@lists.infradead.org; Thu, 13 Oct 2022 02:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665629454; x=1697165454;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fBpHl/+wrd7qStYuh6ZcYhfYYZ167O0qMS+YifpzR5k=;
  b=QZ6qJRjVuaP34C3OTq1oeEYMMKHpbWWXsRJ/xf8+/x1igvRsZILFf5qr
   xr9bL+UZ4zppWx9mZOIXDMhTbiPYmxK03sN2vLcGpZYGo4PeA8JRdgt/t
   Tj7HHwlJAGodwPwSB0p4F7IiBLi0xqcCMMsz298YbOIiSQ+kVi5ZYEn69
   FXHZbzyCp4Nz39oesOcUhg4kNkw14vFRTOvEI41wYE+U1rodyDKthmSyL
   K13pu6WjcfY2skqWY4WbPpb82uaMImb3uI0j5QUYl61ZDadLKmss32uS4
   XJcR4g/zh+4fNFCVIv6ql1xPUyu8hK+j6GmSLRvZNBTMdeYWdhfjnnn9+
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="284688803"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="284688803"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 19:50:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="658004848"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="658004848"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2022 19:50:44 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oioJ1-0004X5-1q;
	Thu, 13 Oct 2022 02:50:43 +0000
Date: Thu, 13 Oct 2022 10:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 377cd919a645ffc40b5631ddb2b8c726f1e89b85
Message-ID: <63477cce.7qsKkboPJ5fW0KcE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_195054_319073_E75DB01F 
X-CRM114-Status: UNSURE (   4.04  )
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
branch HEAD: 377cd919a645ffc40b5631ddb2b8c726f1e89b85  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 104
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-syz
um                             i386_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a013
arc                  randconfig-r043-20221012
alpha                            allyesconfig
riscv                randconfig-r042-20221012
powerpc                           allnoconfig
s390                 randconfig-r044-20221012
m68k                             allyesconfig
i386                          randconfig-a014
x86_64                        randconfig-a004
x86_64                        randconfig-a011
x86_64                           allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a001
x86_64                        randconfig-a002
i386                          randconfig-a003
arm                                 defconfig
arc                                 defconfig
mips                             allyesconfig
i386                             allyesconfig
sh                               allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a015
i386                          randconfig-a012
alpha                               defconfig
i386                          randconfig-a016
i386                          randconfig-a005
s390                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
s390                                defconfig
s390                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
ia64                             allmodconfig
arc                        nsimosci_defconfig
sh                            hp6xx_defconfig
powerpc                      cm5200_defconfig
arm                        mini2440_defconfig
powerpc                     stx_gp3_defconfig
arm                         lpc18xx_defconfig
powerpc                  storcenter_defconfig
powerpc                 linkstation_defconfig
mips                         bigsur_defconfig
sh                           se7780_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig
sh                ecovec24-romimage_defconfig
sh                          urquell_defconfig
arm                         at91_dt_defconfig
arc                     nsimosci_hs_defconfig
arm                         nhk8815_defconfig
arm                        multi_v7_defconfig
arc                     haps_hs_smp_defconfig
sh                          kfr2r09_defconfig
loongarch                 loongson3_defconfig
xtensa                           allyesconfig
mips                 decstation_r4k_defconfig
xtensa                    xip_kc705_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
mips                        vocore2_defconfig
powerpc                      ppc40x_defconfig
sh                            shmin_defconfig
sh                        apsh4ad0a_defconfig
powerpc                       maple_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
nios2                               defconfig

clang tested configs:
hexagon              randconfig-r041-20221012
hexagon              randconfig-r045-20221012
i386                          randconfig-a013
x86_64                        randconfig-a016
i386                          randconfig-a011
x86_64                        randconfig-a005
i386                          randconfig-a002
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a003
x86_64                        randconfig-a014
i386                          randconfig-a015
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-k001
powerpc                     tqm5200_defconfig
powerpc                          allmodconfig
powerpc                     mpc5200_defconfig
arm                           omap1_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
