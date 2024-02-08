Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BF3C48260
	for <ath10k@archiver.kernel.org>; Thu,  8 Feb 2024 17:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F/wAHo4MoOvqpTXZRs9Sz0J+VK7MPUpZe5iVZPbJq0o=; b=h3gIvxMGEAmqz/kyJfL9RO/ZTM
	MObb+RG7iJtqAP+kkqepan+hl1HKaBSOtZT3wCHg7p1TCVkzY9pc3ma0SabjZsfFUuBAnvHqf2RhR
	up4PN5cUzQ6o34TLKz9diT08rogh4Bnb/WWbo4DfNeBy78PAjdwM3/9wiz+KTkA463FHUyINHXHth
	fq5wv9FJHqwZ9aeb2lNK7rQnNVJcsMUCG2PEHsE2rTjABXKm6bpY0XCZK63E1lmA4Q7phVERbCCcK
	MW51QRaTXPyopdkXyJKpGs5Cp9eAmkMaxKi1ZB4/ba4LvG3JuqWdRiWlqf+Zw48F6H8revDoQdcnM
	ZlN60nbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY803-0000000ES8Y-1S4J;
	Thu, 08 Feb 2024 17:15:47 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7zc-0000000ES4d-0Dgx
	for ath10k@lists.infradead.org;
	Thu, 08 Feb 2024 17:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707412520; x=1738948520;
  h=date:from:to:cc:subject:message-id;
  bh=jduIAVCGmNXrzP93bUN13gJXantmiVQsOD13nbbUlGA=;
  b=RQkSRfvImk5K1Pih+7ijP841XosXTAv9aFk3C9B4hq1x9e4I4mRXjafW
   i3YCLaAVb2cOZWfd7OKwe6jeUlnURq1BOQ7RQKQ2n1uJz6LYTSf8ED0eq
   vbaovW3izXCjh/YkwZhl0rJ28xY0zmdX6mVyp84pws8l08Toy84Kym+hg
   qGw6h+2e/XE0b0UAlsvLrKqwv+o2CkaXhlBE4cPz3pc+G6oqWdqIPV1Wt
   AJtTw6E0L9JDARZr8NfI7YzQZX82BP/878UQhwvCXZBtwpA/DCYAq4ikd
   p1xsyOwo8LDawCDseX+3ny8TBjof5141VaE4MYAXjZYOrQb/AvuQRSDR+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12637365"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="12637365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 09:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1687991"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Feb 2024 09:14:51 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY7z7-0003yY-1Y;
	Thu, 08 Feb 2024 17:14:49 +0000
Date: Fri, 09 Feb 2024 01:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 22627fd893b5370f345a05d27350970fbddf8bad
Message-ID: <202402090108.1sCpl7sj-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_091532_378457_93818FD3 
X-CRM114-Status: UNSURE (   3.96  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 22627fd893b5370f345a05d27350970fbddf8bad  wifi: ath10k: add LED and GPIO controlling support for various chipsets

elapsed time: 1462m

configs tested: 174
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
arc                   randconfig-001-20240208   gcc  
arc                   randconfig-002-20240208   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240208   gcc  
arm                   randconfig-002-20240208   gcc  
arm                   randconfig-003-20240208   gcc  
arm                   randconfig-004-20240208   clang
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240208   clang
arm64                 randconfig-002-20240208   clang
arm64                 randconfig-003-20240208   clang
arm64                 randconfig-004-20240208   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240208   gcc  
csky                  randconfig-002-20240208   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240208   clang
hexagon               randconfig-002-20240208   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240208   gcc  
i386         buildonly-randconfig-002-20240208   clang
i386         buildonly-randconfig-003-20240208   gcc  
i386         buildonly-randconfig-004-20240208   gcc  
i386         buildonly-randconfig-005-20240208   gcc  
i386         buildonly-randconfig-006-20240208   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240208   gcc  
i386                  randconfig-002-20240208   gcc  
i386                  randconfig-003-20240208   gcc  
i386                  randconfig-004-20240208   clang
i386                  randconfig-005-20240208   gcc  
i386                  randconfig-006-20240208   gcc  
i386                  randconfig-011-20240208   clang
i386                  randconfig-012-20240208   clang
i386                  randconfig-013-20240208   clang
i386                  randconfig-014-20240208   clang
i386                  randconfig-015-20240208   clang
i386                  randconfig-016-20240208   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240208   gcc  
loongarch             randconfig-002-20240208   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240208   gcc  
nios2                 randconfig-002-20240208   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240208   gcc  
parisc                randconfig-002-20240208   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240208   clang
powerpc               randconfig-002-20240208   gcc  
powerpc               randconfig-003-20240208   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-001-20240208   gcc  
powerpc64             randconfig-002-20240208   gcc  
powerpc64             randconfig-003-20240208   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240208   gcc  
riscv                 randconfig-002-20240208   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240208   clang
s390                  randconfig-002-20240208   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240208   gcc  
sh                    randconfig-002-20240208   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240208   gcc  
sparc64               randconfig-002-20240208   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240208   clang
um                    randconfig-002-20240208   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240208   clang
x86_64       buildonly-randconfig-002-20240208   clang
x86_64       buildonly-randconfig-003-20240208   gcc  
x86_64       buildonly-randconfig-004-20240208   clang
x86_64       buildonly-randconfig-005-20240208   clang
x86_64       buildonly-randconfig-006-20240208   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240208   gcc  
x86_64                randconfig-002-20240208   gcc  
x86_64                randconfig-003-20240208   gcc  
x86_64                randconfig-004-20240208   clang
x86_64                randconfig-005-20240208   gcc  
x86_64                randconfig-006-20240208   gcc  
x86_64                randconfig-011-20240208   gcc  
x86_64                randconfig-012-20240208   gcc  
x86_64                randconfig-013-20240208   clang
x86_64                randconfig-014-20240208   clang
x86_64                randconfig-015-20240208   clang
x86_64                randconfig-016-20240208   clang
x86_64                randconfig-071-20240208   clang
x86_64                randconfig-072-20240208   clang
x86_64                randconfig-073-20240208   gcc  
x86_64                randconfig-074-20240208   clang
x86_64                randconfig-075-20240208   gcc  
x86_64                randconfig-076-20240208   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240208   gcc  
xtensa                randconfig-002-20240208   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

