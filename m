Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69154C41535
	for <ath10k@archiver.kernel.org>; Fri, 22 Dec 2023 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PptGfnDjU8IQh2YHhf0Mz7Auf6hpdBOytpCVDURytz8=; b=0UixA4gD7V7cYsgtyu01rMHFWw
	7dhXKCdq0azQYMHAJA1G3GOZFVJRgG9FUoqIzRc3Lmvsc8ABlXZV1jjxaQ5hXOZfKCx1hWPq4Wj2x
	q0+Ln2HqEefudWpaPfTq66b90RI35zetSgx8WYj0U3zLrQr/v2vR9hX/dXGT0NWf9tu6P07X4PBpb
	lGhuncGiZ9pDpM5WyOIz4D7rWcZYCjs+YDAZFol/2FrQX5N3VPs8pRrfYEfxCFOSEllo/rj9+byju
	cuBstJG517u3ocPTmy0rvcYHWnT5UekP9qNYgvXijBjAsg86/vJL6dUhE2XVqvrm0uVf7A2Ot40X0
	NyGLuRVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYf5-0052iX-2c;
	Fri, 22 Dec 2023 06:05:31 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGYf3-0052hC-0A
	for ath10k@lists.infradead.org;
	Fri, 22 Dec 2023 06:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703225129; x=1734761129;
  h=date:from:to:cc:subject:message-id;
  bh=MZISBVxiABY5n47eVlo2SFPKVTkdCadCRzeEwkIpJ9g=;
  b=Df4ol60BQU4xaZDsv+tiBsMUIchP4TLXpI3xA7YVJDEhTeqVngEwIS0a
   Ufr3mxRplSfIagpM45Yd+Uk74m5Yp5xbFpManpwizR0akHnX+RrExf9Ce
   8fY4BVAeouSaR9cTJ2gC9qQTRfonvfbDDOgYXRifoTUVx8ChvP5uv60F2
   7UiD20mDwleh9QWhCg/Fq0cwdfdO2HovFNTzgz+pWstOToqzKPHKCXMsT
   6D93xG/VOJIZM1zGNF34ZVYm26y9lPE2Ku5RW6gJydwtCipxPPeI/+SfM
   h3VNmVnhbO2e7HPT9VL1sSyAJ0/ZTfPyqof85e9sPONZV0y0ef8u+rcTC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="2908717"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="2908717"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 22:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="776960962"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="776960962"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Dec 2023 22:05:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGYey-00097b-0t;
	Fri, 22 Dec 2023 06:05:24 +0000
Date: Fri, 22 Dec 2023 14:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e7ab40b733094dfc50dad58bbce81f544af1d8cc
Message-ID: <202312221433.3BeF2tS3-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_220529_127174_940DDA02 
X-CRM114-Status: UNSURE (   5.01  )
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
branch HEAD: e7ab40b733094dfc50dad58bbce81f544af1d8cc  wifi: ath12k: Make QMI message rules const

elapsed time: 2113m

configs tested: 97
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
arm                                 defconfig   clang
arm                   randconfig-001-20231222   gcc  
arm                   randconfig-002-20231222   gcc  
arm                   randconfig-003-20231222   gcc  
arm                   randconfig-004-20231222   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231222   gcc  
arm64                 randconfig-002-20231222   gcc  
arm64                 randconfig-003-20231222   gcc  
arm64                 randconfig-004-20231222   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                  randconfig-001-20231222   gcc  
csky                  randconfig-002-20231222   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
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
loongarch             randconfig-001-20231222   gcc  
loongarch             randconfig-002-20231222   gcc  
nios2                 randconfig-001-20231222   gcc  
nios2                 randconfig-002-20231222   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231222   gcc  
parisc                randconfig-002-20231222   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20231222   gcc  
powerpc               randconfig-002-20231222   gcc  
powerpc               randconfig-003-20231222   gcc  
powerpc64             randconfig-001-20231222   gcc  
powerpc64             randconfig-002-20231222   gcc  
powerpc64             randconfig-003-20231222   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20231222   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
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
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

