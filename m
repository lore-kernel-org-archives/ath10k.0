Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF44C4345F
	for <ath10k@archiver.kernel.org>; Fri, 19 Apr 2024 06:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ulIt27wyb91nB2D2j8JgFcm62Mag8kg+JOPl0eEfMHg=; b=SlMj0mrAlxQ88SiibZUvFlwaaV
	qx9kQqnwgcItzVNyaWQFIPmPH0Od3EZyZKa4I0bD2gec8tFE4Rm9dc+2dV8F85YoDTiXN/R9dfNlF
	LSCQQ1ENO9ty2a2y5B0/b7FbTdlB6g+2YSRAEvVqe6z/iEVCXacpehfWsVkmnVM7WYaf/MTuXJjSz
	i5T6RVU4rO8ZJ8nZtArS/hGV1I3PaomDc72TUQUKvE5nqJDLQesbb+W15W/HGksveten4kRLTxvCR
	cHvTkZFQIXzIyWYIhFIRl8txaHYDpAU/pRp9PWhro0IslWfTKMfy2ULASvAchmyjCRLPWIKFYGDzX
	VU7GxG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxhk3-00000004cd5-4AWd;
	Fri, 19 Apr 2024 06:29:00 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxhjw-00000004cbX-285L
	for ath10k@lists.infradead.org;
	Fri, 19 Apr 2024 06:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713508133; x=1745044133;
  h=date:from:to:cc:subject:message-id;
  bh=LTzXjXFUx/qW+RlwDBy8aYwmyirCYWBT2nxfIosLxD4=;
  b=RD1e1at9EdZuUv96A1bxv5GVLT7jBv4vkNiUX4TZkFvqspUse/jZJvbV
   waWDfQcR5FB8FPgYyrBqy5aS+mQI0tI/R3aX2v0FnA11gwb6HygAPOoE8
   yi20oknwuZ9y7q30yiq4cER/cpSc81LpthMwjOoAeWX1jU24jH7hzNbvt
   b/0znc31tcrFot0Plc4rvKbouN7CiQmwuZtnT4/MZ5hwuVtdmbdTK0b2c
   slKwbqbzWCuBuZf/5hToDiQDvLssVgd8RFl/GL/2IyT/q5SDvhKCQQaWt
   WHkt6YlmwXzkRz5XwA9YOfgm1xiU1kd1ANDRzXkLXaxBooomzmAAB0GGG
   g==;
X-CSE-ConnectionGUID: 9UF7st/JRmOEblSkqy9T+g==
X-CSE-MsgGUID: +quIm6bnT4+l4i9venA4vw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9219641"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9219641"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 23:28:52 -0700
X-CSE-ConnectionGUID: x9ScHy2hQyum/8VSnVQqPQ==
X-CSE-MsgGUID: Ul7VOMzuQrSED0VOhNNhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="54442271"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Apr 2024 23:28:49 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxhjf-0009gs-1w;
	Fri, 19 Apr 2024 06:28:39 +0000
Date: Fri, 19 Apr 2024 14:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 c416602943dd36fbd13af7496430723935c867a3
Message-ID: <202404191424.4jjRKi6m-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_232852_619275_866A6530 
X-CRM114-Status: UNSURE (   3.86  )
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
branch HEAD: c416602943dd36fbd13af7496430723935c867a3  Add localversion-wireless-testing-ath

elapsed time: 889m

configs tested: 110
configs skipped: 3

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
arc                   randconfig-001-20240419   gcc  
arc                   randconfig-002-20240419   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240419   gcc  
arm                   randconfig-002-20240419   clang
arm                   randconfig-003-20240419   gcc  
arm                   randconfig-004-20240419   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240419   clang
arm64                 randconfig-002-20240419   clang
arm64                 randconfig-003-20240419   clang
arm64                 randconfig-004-20240419   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240419   gcc  
csky                  randconfig-002-20240419   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-002-20240419   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240419   clang
i386         buildonly-randconfig-002-20240419   gcc  
i386         buildonly-randconfig-003-20240419   gcc  
i386         buildonly-randconfig-004-20240419   gcc  
i386         buildonly-randconfig-005-20240419   gcc  
i386         buildonly-randconfig-006-20240419   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240419   clang
i386                  randconfig-002-20240419   clang
i386                  randconfig-003-20240419   clang
i386                  randconfig-004-20240419   gcc  
i386                  randconfig-005-20240419   clang
i386                  randconfig-006-20240419   clang
i386                  randconfig-011-20240419   gcc  
i386                  randconfig-012-20240419   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

