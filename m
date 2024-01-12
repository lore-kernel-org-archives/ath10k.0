Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D95C4706C
	for <ath10k@archiver.kernel.org>; Fri, 12 Jan 2024 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rJIZiYW9JbFsZmgioNTJ57INM4MEkEHzGjDI0tpSp3A=; b=q/bvbFcwC8JptqB9cvLctlq3r0
	DiO1171741Dne1bJ4A4rkM9vfIgp4cqUe5Ldisn73yP1keC0wHzj8yR1oMsHOEFQaRgV0DmoIiE3b
	0br7Yjm44+LIt81upIQ1RL0Hp8WSsePDyO/+Hp+R5P9whq5RaK5D+aV1n67VxjvdZuK+PA3qKuUS1
	019oFn0jzsKMVvdKpFetE7d4fAxyV1jUAyNSOWGTuUkz37ULLI1cqb1Wso9FaNxfUtMxnoVbIpPUI
	2kQhcrWKjou4mAbDMOPYMY4AVh+KNa/HqNYdLq+AxBbp62nWyX3ZoDZgpiCAxHzXul8oxSwApg+HR
	TwRvjJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMVF-003dSy-2s;
	Fri, 12 Jan 2024 18:43:37 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMVC-003dRy-0k
	for ath10k@lists.infradead.org;
	Fri, 12 Jan 2024 18:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705085014; x=1736621014;
  h=date:from:to:cc:subject:message-id;
  bh=l96ldPidXd5jDocSY/yybmJVPB+mRq5nk+jO/BoiNXc=;
  b=HHDimcNZNLgUJQR1gzmmIOxP+UHiSk1ODa9YfylD5AavwIWB+mdfqvZq
   lABrhG1qF+6Y+SoNaRmfGN2EW5j9z1JbE8wX5bd7iNcuw3RrVnjvcWtvx
   Ph7HVyovB+4XssrT15yJEPE957McIK0+UPuyjGr0u+rVGahmskMu0zjwE
   m6g443c17bT1Wo1JiQ4yrSTF6QQRvE3U7uYhCthyjbGlEVo4d5mTV5zTt
   UAlA/C5Vw4KySe8kO6K65t4yXDjPWhDVALqdd90RNA22QXPuW6vSsGchD
   BKqGMXZb5UJ8OSXLDElcKyqTZ6DH02l6R3eaLi/0mpfl9xFL64hkkDM8f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="12614174"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="12614174"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 10:43:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="873454167"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="873454167"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2024 10:43:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOMV7-0009lB-0u;
	Fri, 12 Jan 2024 18:43:29 +0000
Date: Sat, 13 Jan 2024 02:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 dc1702f7b1340dd741bca1005ab52a2c92cc6c84
Message-ID: <202401130244.tEk5gIFW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_104334_370221_8B19A174 
X-CRM114-Status: UNSURE (   5.13  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: dc1702f7b1340dd741bca1005ab52a2c92cc6c84  Add localversion-wireless-testing-ath

elapsed time: 1706m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240112   gcc  
arc                   randconfig-002-20240112   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240112   clang
arm                   randconfig-002-20240112   clang
arm                   randconfig-003-20240112   clang
arm                   randconfig-004-20240112   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240112   clang
arm64                 randconfig-002-20240112   clang
arm64                 randconfig-003-20240112   clang
arm64                 randconfig-004-20240112   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240112   gcc  
csky                  randconfig-002-20240112   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240112   clang
hexagon               randconfig-002-20240112   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240112   clang
i386         buildonly-randconfig-002-20240112   clang
i386         buildonly-randconfig-003-20240112   clang
i386         buildonly-randconfig-004-20240112   clang
i386         buildonly-randconfig-005-20240112   clang
i386         buildonly-randconfig-006-20240112   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240112   clang
i386                  randconfig-002-20240112   clang
i386                  randconfig-003-20240112   clang
i386                  randconfig-004-20240112   clang
i386                  randconfig-005-20240112   clang
i386                  randconfig-006-20240112   clang
i386                  randconfig-011-20240112   gcc  
i386                  randconfig-012-20240112   gcc  
i386                  randconfig-013-20240112   gcc  
i386                  randconfig-014-20240112   gcc  
i386                  randconfig-015-20240112   gcc  
i386                  randconfig-016-20240112   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240112   gcc  
loongarch             randconfig-002-20240112   gcc  
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
nios2                 randconfig-001-20240112   gcc  
nios2                 randconfig-002-20240112   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240112   gcc  
parisc                randconfig-002-20240112   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240112   clang
powerpc               randconfig-002-20240112   clang
powerpc               randconfig-003-20240112   clang
powerpc64             randconfig-001-20240112   clang
powerpc64             randconfig-002-20240112   clang
powerpc64             randconfig-003-20240112   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240112   clang
riscv                 randconfig-002-20240112   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240112   gcc  
s390                  randconfig-002-20240112   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240112   gcc  
sh                    randconfig-002-20240112   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240112   gcc  
sparc64               randconfig-002-20240112   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20240112   clang
um                    randconfig-002-20240112   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240112   gcc  
xtensa                randconfig-002-20240112   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

