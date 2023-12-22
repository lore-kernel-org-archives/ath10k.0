Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339E9C41535
	for <ath10k@archiver.kernel.org>; Fri, 22 Dec 2023 04:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QIj7m45+3Ggc4FEaPGe/xLEpDRF5QFCducIzIj58xg8=; b=RLqd0WFHCTDIzqWbIs345LwhQ+
	vLo0k6SuIInCejeu6nrGjtV2+KIn3XVCBy+y9+aGOjNu1YoSp0lescDdZlwwuLE6UMjV7FCUIk1Yq
	3oPirhMjPPoCyyd6q1XtYO27ZpfwJUeaJQJlYNFKDng5YzbncpDTB3GI9WJdoNNovBxMTmHm0IODR
	/eV5Dy0M74iFu8qsKrn9Idu2N7KZSRkLn1kV8VAy8c5KSO69gWFHi4dUwTapJ6EgQTT/X02RdnjrR
	16U03L4txNPCUuqToUhlFiHUme5/VKDE+r6fZd9DceWRfXVxw3zBFI89c2Y/3SBfGZj8BaSHpHpT7
	Ol/Omz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXTT-004sud-1N;
	Fri, 22 Dec 2023 04:49:27 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXTQ-004suF-2N
	for ath10k@lists.infradead.org;
	Fri, 22 Dec 2023 04:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703220566; x=1734756566;
  h=date:from:to:cc:subject:message-id;
  bh=E1EwBqsHvb38nzP4RQQ/q5Q1d5gW2lJiycBxfUK0C+0=;
  b=OgmgpIMIBRqzATAT+Nz/WYUau6f4GnGCIndWHT7IgBh/e3dqspZc2zql
   GRXxJNTfYTMfuYWXYZ6pOBPjp+IEsEik0By6ONAetXid98RNzvD9RsLAm
   Dgu5sY/jBZOYzTLN/MGwr1bslH98876P7zOX2pNE6fvMmQPdD98lqJon7
   9Z2ph18VikYnoyJp3MdY4B4CI852Lve5Pqd6JXy2FETnIRaecJyB5VI+g
   DU9khQ+yaCAyEAuH786Pc9uLRJrsroN75Y/XDRjl5YzaA6z1aTYe8nAFV
   s+fWTtPyQgqoYSAVZ0pQDTG6cDD5eYo74BTbyJ8v5jOytSCiwGPJlnoPi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="393240081"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="393240081"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 20:49:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="1024095610"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="1024095610"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Dec 2023 20:49:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGXTL-000966-0d;
	Fri, 22 Dec 2023 04:49:19 +0000
Date: Fri, 22 Dec 2023 12:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 2cd4e3f91f264926a6b11df948417b74d52ca9b9
Message-ID: <202312221230.lTWPwW0E-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_204924_842565_EB763D68 
X-CRM114-Status: UNSURE (   4.60  )
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
branch HEAD: 2cd4e3f91f264926a6b11df948417b74d52ca9b9  Add localversion-wireless-testing-ath

Warning ids grouped by kconfigs:

clang_recent_errors
`-- x86_64-rhel-8.3-rust
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_power_floor.o
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_wt_hint.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-int34_thermal-processor_thermal_wt_req.o

elapsed time: 2037m

configs tested: 100
configs skipped: 0

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
arc                   randconfig-001-20231222   gcc  
arc                   randconfig-002-20231222   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                   randconfig-001-20231222   gcc  
arm                   randconfig-002-20231222   gcc  
arm                   randconfig-003-20231222   gcc  
arm                   randconfig-004-20231222   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                 randconfig-001-20231222   gcc  
arm64                 randconfig-002-20231222   gcc  
arm64                 randconfig-003-20231222   gcc  
arm64                 randconfig-004-20231222   gcc  
csky                             allmodconfig   gcc  
csky                             allyesconfig   gcc  
csky                  randconfig-001-20231222   gcc  
csky                  randconfig-002-20231222   gcc  
hexagon               randconfig-001-20231222   clang
hexagon               randconfig-002-20231222   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231222   gcc  
i386         buildonly-randconfig-002-20231222   gcc  
i386         buildonly-randconfig-003-20231222   gcc  
i386         buildonly-randconfig-004-20231222   gcc  
i386         buildonly-randconfig-005-20231222   gcc  
i386         buildonly-randconfig-006-20231222   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231222   gcc  
i386                  randconfig-002-20231222   gcc  
i386                  randconfig-003-20231222   gcc  
i386                  randconfig-004-20231222   gcc  
i386                  randconfig-005-20231222   gcc  
i386                  randconfig-006-20231222   gcc  
i386                  randconfig-011-20231222   clang
i386                  randconfig-012-20231222   clang
i386                  randconfig-013-20231222   clang
i386                  randconfig-014-20231222   clang
i386                  randconfig-015-20231222   clang
i386                  randconfig-016-20231222   clang
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20231222   gcc  
loongarch             randconfig-002-20231222   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20231222   gcc  
nios2                 randconfig-002-20231222   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231222   gcc  
parisc                randconfig-002-20231222   gcc  
powerpc                          allmodconfig   clang
powerpc               randconfig-001-20231222   gcc  
powerpc               randconfig-002-20231222   gcc  
powerpc               randconfig-003-20231222   gcc  
powerpc64             randconfig-001-20231222   gcc  
powerpc64             randconfig-002-20231222   gcc  
powerpc64             randconfig-003-20231222   gcc  
riscv                 randconfig-001-20231222   gcc  
riscv                 randconfig-002-20231222   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231222   gcc  
x86_64       buildonly-randconfig-002-20231222   gcc  
x86_64       buildonly-randconfig-003-20231222   gcc  
x86_64       buildonly-randconfig-004-20231222   gcc  
x86_64       buildonly-randconfig-005-20231222   gcc  
x86_64       buildonly-randconfig-006-20231222   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231222   clang
x86_64                randconfig-002-20231222   clang
x86_64                randconfig-003-20231222   clang
x86_64                randconfig-004-20231222   clang
x86_64                randconfig-005-20231222   clang
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

