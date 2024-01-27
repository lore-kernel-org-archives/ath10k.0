Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E6C46CD2
	for <ath10k@archiver.kernel.org>; Sat, 27 Jan 2024 03:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9pEsCgg3BCrCLQ0VCauy2x5rmcF1JIf40jnXQz/i41Q=; b=PgbhPaMQr38g74QFEps5BBc10I
	VehVRS97Ows7zopvXxxBPQ25OHNaVF9gDS+cw3kC+chuwSJRby0qpZgLbBf6uNBu1LV/N2cG1thdY
	ywOwxRq5QJDA6auC9IGxLaRamwvx6pZlTU3ssC/7mH2sWGOczUWuwgQ2g9yBL+r+furI+RSQ86Dl1
	sWwLUTMlrNiY1m8z/3M7Zh1raMN7494ELxRuRwlPNA6shZOm84KYyRZQPp/ca+lNZTPMCa1MTrF5U
	VbCD13XjemNrZklP4H6+BI6H9KH7Bwz73stEqplE7FSJB9IMBV4wKVmSvT6YghjpvxoXyWxk4RGyd
	CplEQyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTZhJ-00000006hLW-1a2x;
	Sat, 27 Jan 2024 03:49:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTZhI-00000006hKy-0vOY
	for ath10k@bombadil.infradead.org;
	Sat, 27 Jan 2024 03:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=9pEsCgg3BCrCLQ0VCauy2x5rmcF1JIf40jnXQz/i41Q=; b=SRqz4xlzBhgk44+2wSnDD7pH03
	OZukIFA6mYm2/0eVpFuIHPd1v2gXs37LGMvihwLaY3NX4bemhnYx0AHajg03QCeyL6I/afyY0MPu1
	g+LxVeQEKZu2OKG0IR9Voiet69j+r+s2CPq5T8QVe8JTfiMOiahVc3Gjqu9X44qNYKyOQjN5DA2Pz
	4yei5z3oHzOQWmdoHEZO4HDm8GOxWVdz5aKzZmoU5JeS+05Cd8e+IjCwSNjWjFP87OBftq25kC4K5
	KQEp5XZnoue5bcZUTKQW27KFCesfGhm9o/PFKXwt/gKupFAZGxMfItrxgWxMEuMVbmIJ5ftkwceyi
	3QZ6wvmQ==;
Received: from mgamail.intel.com ([134.134.136.31])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTZhC-00000006REs-2nNX
	for ath10k@lists.infradead.org;
	Sat, 27 Jan 2024 03:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706327370; x=1737863370;
  h=date:from:to:cc:subject:message-id;
  bh=lqpxJGZxypGgE9+ISdq3cP76nA5CvhnJNxfCNWQNnhc=;
  b=nYtoy0kE7aqeZWKL/kDo7nBqSgxtw8D37wY9+TXcw4hW6ZkEpGAOHcya
   MYi5pn6/v3cwKJMeZpDNmUy1Dyb5YTNRbQpC+yFKQu9t4UUdw68bFzhCn
   icJONmw25RBRd4dONLxTSbgNwJ6Yz8nzhtRZ+o/f9YcYCpYSDjSOxFiwX
   B0wkSZrh4WwbROCtRo9G7HGYCyjGtycwCelJzdsR1pYsEMikNHpL1BxPH
   8DaGMQu1Zq9s29l+Kv/65sey8FWBF7UoOllpCGg6v3Ml+DH+d8LI9Yj0N
   ai+7GI2c2a7Gq03QO9iU3S7InZbXjvcQiyNfRQNu7juh/XnTZvlFzTmwQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="466916857"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="466916857"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 19:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29279416"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2024 19:49:23 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTZh2-0001cG-2I;
	Sat, 27 Jan 2024 03:49:20 +0000
Date: Sat, 27 Jan 2024 11:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 4a512df075f025c0c89f81427727ab1ab1c0ab61
Message-ID: <202401271127.BrSogUd6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_034931_426481_59E1CFCB 
X-CRM114-Status: UNSURE (   4.43  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 4a512df075f025c0c89f81427727ab1ab1c0ab61  Merge branch 'ath-next' into ath-qca

elapsed time: 2090m

configs tested: 132
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
arc                   randconfig-001-20240127   gcc  
arc                   randconfig-002-20240127   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240127   gcc  
arm                   randconfig-002-20240127   gcc  
arm                   randconfig-003-20240127   gcc  
arm                   randconfig-004-20240127   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240127   gcc  
arm64                 randconfig-002-20240127   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240126   clang
i386         buildonly-randconfig-002-20240126   clang
i386         buildonly-randconfig-003-20240126   clang
i386         buildonly-randconfig-004-20240126   clang
i386         buildonly-randconfig-005-20240126   clang
i386         buildonly-randconfig-006-20240126   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240126   clang
i386                  randconfig-002-20240126   clang
i386                  randconfig-003-20240126   clang
i386                  randconfig-004-20240126   clang
i386                  randconfig-005-20240126   clang
i386                  randconfig-006-20240126   clang
i386                  randconfig-011-20240126   gcc  
i386                  randconfig-012-20240126   gcc  
i386                  randconfig-013-20240126   gcc  
i386                  randconfig-014-20240126   gcc  
i386                  randconfig-015-20240126   gcc  
i386                  randconfig-016-20240126   gcc  
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
mips                              allnoconfig   clang
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
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240127   gcc  
x86_64       buildonly-randconfig-002-20240127   gcc  
x86_64       buildonly-randconfig-003-20240127   gcc  
x86_64       buildonly-randconfig-004-20240127   gcc  
x86_64       buildonly-randconfig-005-20240127   gcc  
x86_64       buildonly-randconfig-006-20240127   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240127   clang
x86_64                randconfig-002-20240127   clang
x86_64                randconfig-003-20240127   clang
x86_64                randconfig-004-20240127   clang
x86_64                randconfig-005-20240127   clang
x86_64                randconfig-006-20240127   clang
x86_64                randconfig-011-20240127   gcc  
x86_64                randconfig-012-20240127   gcc  
x86_64                randconfig-013-20240127   gcc  
x86_64                randconfig-014-20240127   gcc  
x86_64                randconfig-015-20240127   gcc  
x86_64                randconfig-016-20240127   gcc  
x86_64                randconfig-071-20240127   gcc  
x86_64                randconfig-072-20240127   gcc  
x86_64                randconfig-073-20240127   gcc  
x86_64                randconfig-074-20240127   gcc  
x86_64                randconfig-075-20240127   gcc  
x86_64                randconfig-076-20240127   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

