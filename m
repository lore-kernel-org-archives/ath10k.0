Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A7EC25B7A
	for <ath10k@archiver.kernel.org>; Fri, 24 May 2024 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5C4AL8noFCS/sj5BhDZdVat9EFLktDHO9bAiQ7x+qfg=; b=uDA7VjXPYQTSh0PeRkN3dPUg/7
	+a0gvT4CzcVEVnHOQQw75l5m3IZ54Z+QzdfCYUkPHIdz2vpMfTeRPxpds2ZQZ4GJ/ZIE7+xw5u9pT
	vq0eVEpZ5ajOY5A2dnhQeh+mbDOt156ScSLEwrdTCsO35QCiET1BK/HCjzA9bZvyCHAc+Z+ubyXtF
	EHmDeJq0l26urcS9nyKoyJAx++oPO38KZfzLuYN66tG50a1v1SXw6zwx6fimrjs6G+cg5PoFvBfEx
	FIU+GWW4pRufk9zrJka1Se55sAfKU89dqtq+7jFnnX8ayB2GxaY14TgJyM2y97nRu7FuVPbB0NTzj
	JvRLI0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAVCh-0000000910d-3ONR;
	Fri, 24 May 2024 13:43:27 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAVCe-000000090zA-1Zb0
	for ath10k@lists.infradead.org;
	Fri, 24 May 2024 13:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716558204; x=1748094204;
  h=date:from:to:cc:subject:message-id;
  bh=QFpBba/+NPcoEllway3HgDTEwtO8bmZGecmxMt0/7ME=;
  b=KNqDniA1fnX7Ika27/LIDmJBlf4L9KAI3LSh79pDbnpmiIOpjY6RDkhQ
   Mb4qvmVRTmN2GHI5L91/DGm7GXw6NhNOyV190biJAn3GTozQBQRtj0NgL
   luTtuoOUvn8MRlfw8qe0SRD5nvbYs4JzulhDp+SAOSCov7Ha6301ugq0G
   Hj8zN5vcu2xUH/UPqpOVyJdUOn1I2O20g9kL8NuNS5d6yrIc4AFsxj0Ny
   QBqsETXDegm18LnnULY/EjFK5lOjTSFakaeS1qPyqBgWEUqjjHpVYhhlX
   PSt8aBVgQDpgXGplN2j+CtAwQ8ISWt5UKz6b64b2UgTxB2MT/3AVwWbu8
   w==;
X-CSE-ConnectionGUID: oaiJER0jSbOKnLDQnIMD2w==
X-CSE-MsgGUID: O2th7YXHRKiP6d2BxZRhnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30442416"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="30442416"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 06:43:20 -0700
X-CSE-ConnectionGUID: 8vd4faTdRhaw356iiyiFVA==
X-CSE-MsgGUID: DwuEJn8PT2qg+rHJoa2PBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="34043573"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 06:43:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAVCX-0005S5-0W;
	Fri, 24 May 2024 13:43:17 +0000
Date: Fri, 24 May 2024 21:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-current] BUILD SUCCESS
 6e16782d6b4a724f9c9dcd49471219643593b60c
Message-ID: <202405242101.dyuVW7dW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_064324_500547_6BB9D3A4 
X-CRM114-Status: UNSURE (   3.90  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-current
branch HEAD: 6e16782d6b4a724f9c9dcd49471219643593b60c  wifi: ath11k: move power type check to ASSOC stage when connecting to 6 GHz AP

elapsed time: 1449m

configs tested: 162
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
arc                   randconfig-001-20240524   gcc  
arc                   randconfig-002-20240524   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240524   clang
arm                   randconfig-002-20240524   gcc  
arm                   randconfig-003-20240524   gcc  
arm                   randconfig-004-20240524   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240524   clang
arm64                 randconfig-002-20240524   clang
arm64                 randconfig-003-20240524   gcc  
arm64                 randconfig-004-20240524   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240524   gcc  
csky                  randconfig-002-20240524   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240524   clang
hexagon               randconfig-002-20240524   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240524   clang
i386         buildonly-randconfig-002-20240524   clang
i386         buildonly-randconfig-003-20240524   gcc  
i386         buildonly-randconfig-004-20240524   clang
i386         buildonly-randconfig-005-20240524   clang
i386         buildonly-randconfig-006-20240524   clang
i386                                defconfig   clang
i386                  randconfig-001-20240524   clang
i386                  randconfig-002-20240524   clang
i386                  randconfig-003-20240524   clang
i386                  randconfig-004-20240524   clang
i386                  randconfig-005-20240524   gcc  
i386                  randconfig-006-20240524   clang
i386                  randconfig-011-20240524   clang
i386                  randconfig-012-20240524   gcc  
i386                  randconfig-013-20240524   gcc  
i386                  randconfig-014-20240524   clang
i386                  randconfig-015-20240524   clang
i386                  randconfig-016-20240524   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240524   gcc  
loongarch             randconfig-002-20240524   gcc  
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
nios2                 randconfig-001-20240524   gcc  
nios2                 randconfig-002-20240524   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240524   gcc  
parisc                randconfig-002-20240524   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240524   gcc  
powerpc               randconfig-002-20240524   gcc  
powerpc               randconfig-003-20240524   clang
powerpc64             randconfig-001-20240524   gcc  
powerpc64             randconfig-002-20240524   gcc  
powerpc64             randconfig-003-20240524   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240524   gcc  
riscv                 randconfig-002-20240524   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240524   gcc  
s390                  randconfig-002-20240524   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240524   gcc  
sh                    randconfig-002-20240524   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240524   gcc  
sparc64               randconfig-002-20240524   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240524   gcc  
um                    randconfig-002-20240524   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240524   gcc  
x86_64       buildonly-randconfig-002-20240524   gcc  
x86_64       buildonly-randconfig-003-20240524   clang
x86_64       buildonly-randconfig-004-20240524   gcc  
x86_64       buildonly-randconfig-005-20240524   gcc  
x86_64       buildonly-randconfig-006-20240524   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240524   gcc  
x86_64                randconfig-002-20240524   clang
x86_64                randconfig-003-20240524   clang
x86_64                randconfig-004-20240524   clang
x86_64                randconfig-005-20240524   clang
x86_64                randconfig-006-20240524   gcc  
x86_64                randconfig-011-20240524   gcc  
x86_64                randconfig-012-20240524   clang
x86_64                randconfig-013-20240524   clang
x86_64                randconfig-014-20240524   gcc  
x86_64                randconfig-015-20240524   gcc  
x86_64                randconfig-016-20240524   clang
x86_64                randconfig-071-20240524   gcc  
x86_64                randconfig-072-20240524   clang
x86_64                randconfig-073-20240524   gcc  
x86_64                randconfig-074-20240524   gcc  
x86_64                randconfig-075-20240524   clang
x86_64                randconfig-076-20240524   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240524   gcc  
xtensa                randconfig-002-20240524   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

