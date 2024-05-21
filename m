Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47438C25B74
	for <ath10k@archiver.kernel.org>; Tue, 21 May 2024 23:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xGg3oujtRCYSNSrGBZOEatGUVnrPfHjtuQeIW77QECM=; b=qtzDZnx6EtgjjMxYDWDM9TZ/ng
	4trM7KdZ4dx7dwHt4oF/pUR5ITQ4WMOWJVYELN9pDK5Bn5LBavTIAhUBVCuNO1a8Hj3SY/zsAejll
	Y9ov5/pWPyDFgBCq9ZEQgUDgQfrXnvJHJTVIeeT1t0sLRV8k8xbUPxU/GCSON48agl81oB+/VbRF5
	SiHfd0cexxArBBYqONF2wwJj6zyw6F9R9UUCg9ioERDoAykGSViiz3Ajm5NYNzLRTr1BrmvstWC4I
	eTGl8Qqx+IRKZ0xQb3PnjxYNGaU1b3CfC7dT6/oxFjMReFuPzhCqvh2vvdSIBdkTm17nWjDMivxp3
	3sL7c/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Z1h-00000001LxK-2fxg;
	Tue, 21 May 2024 23:36:13 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Z1d-00000001Lwt-3GGq
	for ath10k@lists.infradead.org;
	Tue, 21 May 2024 23:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716334570; x=1747870570;
  h=date:from:to:cc:subject:message-id;
  bh=zOADilY3S+mPunuRQpFacmoNOu8ZPLmEweNEc+iYNPI=;
  b=LO3SUzkT5JDk4NZAFkvj03ixEW5oSbJwg240y5mpSCGP/+Mnx4eM5NOp
   SHpVhEirnDiaz+1yxxlxLtRMt/1778rZLUI0zwIGmzEtYygaRxUHnuj3F
   6BsgXgquNhMkZJSMl7BndvIzhJcNJV5yFqKu2MFwyrn+qgcgNfC5Q5SVM
   lENtX63aOOL+U+Y3quKtSDcfiihvGeT5hljHW68+zaudiUduHARCHIy8f
   L1VgvCMRLQThOdiK4aMkckEK4uMJolbqFAw8L9gLj9WcLlQRF/fVgvFUz
   85U9AIaqebGp9QPRW1UQP9aPeWc3QIEdhJaardKln8kXzA2AkWc1MjYRB
   w==;
X-CSE-ConnectionGUID: +1mpPUKnSTiv2dCzCelR+g==
X-CSE-MsgGUID: hQM6kfxqTlW56d2flNeqKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16388104"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="16388104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 16:35:49 -0700
X-CSE-ConnectionGUID: hxjsGmilSXWlLjU5A6P/hg==
X-CSE-MsgGUID: N7eToLqyRL2Pya6CZ0LF4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33105734"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2024 16:35:47 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9Z1F-0000pp-2X;
	Tue, 21 May 2024 23:35:45 +0000
Date: Wed, 22 May 2024 07:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 33370412eced2dc7f81f4324e109d69319cafd82
Message-ID: <202405220758.LQWuzjl7-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_163609_917053_34E4319E 
X-CRM114-Status: UNSURE (   4.01  )
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
branch HEAD: 33370412eced2dc7f81f4324e109d69319cafd82  wifi: ath12k: fix Smatch warnings on ath12k_core_suspend()

elapsed time: 903m

configs tested: 163
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
arc                   randconfig-001-20240521   gcc  
arc                   randconfig-002-20240521   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240521   gcc  
arm                   randconfig-002-20240521   gcc  
arm                   randconfig-003-20240521   clang
arm                   randconfig-004-20240521   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240521   clang
arm64                 randconfig-002-20240521   gcc  
arm64                 randconfig-003-20240521   clang
arm64                 randconfig-004-20240521   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240521   gcc  
csky                  randconfig-002-20240521   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240521   clang
hexagon               randconfig-002-20240521   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240521   clang
i386         buildonly-randconfig-002-20240521   clang
i386         buildonly-randconfig-003-20240521   gcc  
i386         buildonly-randconfig-004-20240521   clang
i386         buildonly-randconfig-005-20240521   gcc  
i386         buildonly-randconfig-006-20240521   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240521   gcc  
i386                  randconfig-002-20240521   clang
i386                  randconfig-003-20240521   gcc  
i386                  randconfig-004-20240521   gcc  
i386                  randconfig-005-20240521   gcc  
i386                  randconfig-006-20240521   clang
i386                  randconfig-011-20240521   gcc  
i386                  randconfig-012-20240521   clang
i386                  randconfig-013-20240521   clang
i386                  randconfig-014-20240521   clang
i386                  randconfig-015-20240521   clang
i386                  randconfig-016-20240521   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240521   gcc  
loongarch             randconfig-002-20240521   gcc  
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
nios2                 randconfig-001-20240521   gcc  
nios2                 randconfig-002-20240521   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240521   gcc  
parisc                randconfig-002-20240521   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240521   clang
powerpc               randconfig-002-20240521   gcc  
powerpc               randconfig-003-20240521   clang
powerpc64             randconfig-001-20240521   clang
powerpc64             randconfig-002-20240521   gcc  
powerpc64             randconfig-003-20240521   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240521   clang
riscv                 randconfig-002-20240521   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240521   clang
s390                  randconfig-002-20240521   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240521   gcc  
sh                    randconfig-002-20240521   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240521   gcc  
sparc64               randconfig-002-20240521   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240521   gcc  
um                    randconfig-002-20240521   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240521   clang
x86_64       buildonly-randconfig-002-20240521   clang
x86_64       buildonly-randconfig-003-20240521   gcc  
x86_64       buildonly-randconfig-004-20240521   clang
x86_64       buildonly-randconfig-005-20240521   gcc  
x86_64       buildonly-randconfig-006-20240521   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240521   clang
x86_64                randconfig-002-20240521   clang
x86_64                randconfig-003-20240521   clang
x86_64                randconfig-004-20240521   clang
x86_64                randconfig-005-20240521   clang
x86_64                randconfig-006-20240521   clang
x86_64                randconfig-011-20240521   clang
x86_64                randconfig-012-20240521   gcc  
x86_64                randconfig-013-20240521   gcc  
x86_64                randconfig-014-20240521   clang
x86_64                randconfig-015-20240521   clang
x86_64                randconfig-016-20240521   gcc  
x86_64                randconfig-071-20240521   gcc  
x86_64                randconfig-072-20240521   clang
x86_64                randconfig-073-20240521   clang
x86_64                randconfig-074-20240521   gcc  
x86_64                randconfig-075-20240521   gcc  
x86_64                randconfig-076-20240521   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240521   gcc  
xtensa                randconfig-002-20240521   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

