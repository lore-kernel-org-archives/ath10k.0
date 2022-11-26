Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6994C43217
	for <ath10k@archiver.kernel.org>; Sat, 26 Nov 2022 09:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FGtKVIqb49z3Ue2PLogtLZHexBEN6nccDDcvQ3/pmkw=; b=MrFURKKCUXGhg8
	yqno/H4vl5VwjLMOnjlWNixtxGUa4CExQXFWilvWYeAp8Uw7e31ELW371Pdc3zQLXDLDL8HELbIJ9
	IL7fO/UQORunsXnba6viO+LEGPnzSM+g5dtTrhIfZep08kK5109ci7R60ro4Q4aK/FmIKubdn8jTr
	Ostzbxs+6Zqjp3jfnmhMowmKpII4NObVJZrfrNqHHc2qypUQWoBtTBdlG4EkCn2AJ9rff8m4HreqD
	luhC+YjYhJsFfnVvxPxq08Gqn9SRhkjjQMro6z+xFaDeTBf4oUE+mv6NkE16YmUBPebZBD4HRVofk
	G/201F5p3NMVAAbBCtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyrcj-005Kac-UT; Sat, 26 Nov 2022 09:37:25 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyrcg-005KZK-Lz
	for ath10k@lists.infradead.org; Sat, 26 Nov 2022 09:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669455442; x=1700991442;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MchFb+YRTbGr6zD5TukiARh9xDAV8zcK/+blLhf3z4Y=;
  b=TpThysc1szimQGql2mdpal1FO9uj+2BNtTOl7cvJI64QlNCF9qA+6AiA
   T5ivbUyYlPfmMIgXZi5TawuDGTKcNwcn3/tmuXykv4U6o9PRiJVvZrAwy
   6epMUVdSZMXLTuzHfsbUWIf6lo0ygpVOFhMEXrjMH8kfnVZYVfNYDx2yB
   Sp12bZ4PnKDox05ccQCRYFL2KBfiBDZZMfDmx76J9PSBaSfRgxQamHNX2
   je4Lg+6mLE+cQ1PKxyjohPfPPU8zTSU3WCSSkaQ/RtpNiG/HqAiBhQwnl
   6M/lJIwwIWW0WNZkirolDYl7Ct1gvzBpAKll1UF8P3YIsFLg4+RAdOI6j
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="297941373"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="297941373"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 01:37:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="817332165"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="817332165"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Nov 2022 01:37:19 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyrcc-0006AU-36;
	Sat, 26 Nov 2022 09:37:18 +0000
Date: Sat, 26 Nov 2022 17:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 72894da679654039f078690e58b1b22a38f4e809
Message-ID: <6381de14.2Z9v48gMw62jB6tO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_013722_842798_ACAA194A 
X-CRM114-Status: UNSURE (   5.71  )
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
branch HEAD: 72894da679654039f078690e58b1b22a38f4e809  Add localversion-wireless-testing-ath

elapsed time: 1307m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20221124
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
powerpc                          allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                               rhel-8.3
x86_64                        randconfig-a015
x86_64                           allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
m68k                            q40_defconfig
arc                           tb10x_defconfig
arm                           tegra_defconfig
sparc                            alldefconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
s390                 randconfig-r044-20221126
hexagon              randconfig-r041-20221126
riscv                randconfig-r042-20221126
hexagon              randconfig-r045-20221126
powerpc                     mpc512x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
