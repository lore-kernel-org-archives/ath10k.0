Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27D1C4167B
	for <ath10k@archiver.kernel.org>; Fri,  8 Dec 2023 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t9x6Bqhm7HewL2h7fReJDrsGAJUGDpFBFTSAXmrwDeg=; b=dX1Y87Y9C4OtQ+gz1efpFlIeGD
	7qPe6zycAPNBEwlGNe+doFE2R6/G9mNVfvCfBluM7sINynb2iqyf5PJ0xyrWZLu99ObyQwqjLvjpT
	ROP7e8u0CPf2BtTKqLNRCFE8oyvvN9zkviMP69/Vm7P7hHX8MlWN7YM1Osw35FiO6GG4iTCK2rZNR
	/pxY/9r8cWufyS9Q1oPC3IAbIYe7sh6t7kGwx3WfnfCDlQjvwdAIc8hXxCkJacQ4ofXWWm7Y+060L
	2iol+LGczQcg83O3lAyoYGuzKCJdO5OcilbFSvVXFnnFa/I8euB65sSJWK7vrCTIXem/iitA6Y3Py
	AXHOregA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBd59-00FwQv-1K;
	Fri, 08 Dec 2023 15:48:03 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBd55-00FwQb-2W
	for ath10k@lists.infradead.org;
	Fri, 08 Dec 2023 15:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702050479; x=1733586479;
  h=date:from:to:cc:subject:message-id;
  bh=MaFemL3IvxjblBS5lUrZohz6Wuwc0juTWDeAVvSk6OA=;
  b=MHgbavbxon3B/xN3mb1mYN3bKFswH27fMfFaUQ4vOYINKg4wSFjN1O15
   b6o5OTjcYIOkf8/w3rA4s+KMs5gQotT6Fc59cCjtZ78aUoj1oGn6dgIlz
   jbNwMhVKyy0pDObmQSqSJLm5uYvoZ2Vmwz9ssZlAet8Y8HYGuR1jIqwYT
   mdn4av8SYFN9LRliXmRCj9zHDh5DNLXnnhLZaTpxSfG7VZG9wcjt9C31J
   E2lDdfycw+Z8LB3zgRjnM1k4mDIC8+iFS0nuLFo1wLA81KBaJRg8ZZ8G6
   6Y+206Ze9Xm7J5AXQ4e8nf1HC826Tw0kjQ82XDd6bwZtQvbiDxTG502JU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1300852"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1300852"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 07:47:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="915995370"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="915995370"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2023 07:47:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBd52-000Duy-0e;
	Fri, 08 Dec 2023 15:47:56 +0000
Date: Fri, 08 Dec 2023 23:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 6783f10a1d076297a66b5b57e0a96d8c8363271b
Message-ID: <202312082310.wGqlq8aw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_074759_828117_71E07154 
X-CRM114-Status: UNSURE (   4.80  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 6783f10a1d076297a66b5b57e0a96d8c8363271b  wifi: ath5k: remove unused ath5k_eeprom_info::ee_antenna

elapsed time: 1756m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231208   gcc  
arc                   randconfig-002-20231208   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231208   clang
arm                   randconfig-002-20231208   clang
arm                   randconfig-003-20231208   clang
arm                   randconfig-004-20231208   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231208   clang
arm64                 randconfig-002-20231208   clang
arm64                 randconfig-003-20231208   clang
arm64                 randconfig-004-20231208   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231208   gcc  
csky                  randconfig-002-20231208   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231208   clang
hexagon               randconfig-002-20231208   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231208   clang
i386         buildonly-randconfig-002-20231208   clang
i386         buildonly-randconfig-003-20231208   clang
i386         buildonly-randconfig-004-20231208   clang
i386         buildonly-randconfig-005-20231208   clang
i386         buildonly-randconfig-006-20231208   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231208   clang
i386                  randconfig-002-20231208   clang
i386                  randconfig-003-20231208   clang
i386                  randconfig-004-20231208   clang
i386                  randconfig-005-20231208   clang
i386                  randconfig-006-20231208   clang
i386                  randconfig-011-20231208   gcc  
i386                  randconfig-012-20231208   gcc  
i386                  randconfig-013-20231208   gcc  
i386                  randconfig-014-20231208   gcc  
i386                  randconfig-015-20231208   gcc  
i386                  randconfig-016-20231208   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231208   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

