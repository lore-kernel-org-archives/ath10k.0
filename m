Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9894C4345F
	for <ath10k@archiver.kernel.org>; Fri, 26 Apr 2024 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V+CimtqsIsBXInFMmJOUQfKMims06dZnl3GE27KGazc=; b=ovvlyUrf7F4ItNb0BhgZ7KAnxf
	QEh2jxXJrz2JJtaPf4ejXbnbuu6BT6/SkQuP+o+UMj45h4zfIKI4xRa2ei+wgT5ayT/nnnUJQ/4Bm
	/8+ekO8NGEZk8S1QhtGME2lcDEOXDP7iG48lH3v5Sk2CU/Iy0tp47xaPl7r4irm9lLOggq7j70p6z
	mJYvXwCLiiUd3YxAGgwczm18Q4AiCxt+q7yCRP4yd/N7aXPZi/zhyIKEr8yGf4bQK0S6z5+9lwB1H
	e58cTmCorTIKxavLiItxT7VL5AsSFNCd5pY7+dGFgRaZD1/9/dcQq34nih22wyu29+AfvvSSV69WH
	NTAF45SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NaK-0000000D4hD-306H;
	Fri, 26 Apr 2024 15:34:00 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NaH-0000000D4fK-37u4
	for ath10k@lists.infradead.org;
	Fri, 26 Apr 2024 15:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145638; x=1745681638;
  h=date:from:to:cc:subject:message-id;
  bh=wIoapK9vimw/A/6RFcmsC9qJysba3e26JEVRSXL/220=;
  b=Ix74f/0r0jOathd/ozkv0rzy65qIBYvJdgSyw2a53HAJaOG3T/H8/1UL
   aKqk4MecphfNoC64qzJslDmKlMmbaW6Q17GgVVQ2DsKWLwQ9Sldtcu2tC
   do8f06ZDlTbEPhCBVJ8VzQ0EN2ljrhXN9EIVzAkz6qXsMch7x6u4+L3MV
   RD+tm385YXb2kEapl5gLDVdHN0RJN9NUs78Zxt+9of137Ss7hVEvnq7rv
   FIynlLnWI5xouFbFHD4MBvPfsUvgRE0CWO980FYCBsiiRo5JDOMf+6wfQ
   YnM0fxYbvLqLsMF6L2ASV0tjYLM2n6P0/prGh1XFU5Z34qs9r/oWRmhEY
   Q==;
X-CSE-ConnectionGUID: Q/AfEyssRH+rDGGIXj3cUw==
X-CSE-MsgGUID: rz+A64FNQVm+tlTFdBak5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="13716693"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="13716693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:33:56 -0700
X-CSE-ConnectionGUID: 9qEZi51GTd+qyyFN/1lXMA==
X-CSE-MsgGUID: fvKJHFPMT3C5QBYfJXC+kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25480219"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Apr 2024 08:33:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0NaC-0003rz-0Z;
	Fri, 26 Apr 2024 15:33:52 +0000
Date: Fri, 26 Apr 2024 23:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 c5186318e2cc12daabec3a89aa8e1c2881c3485b
Message-ID: <202404262336.v3bswwit-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_083357_977891_696DE61B 
X-CRM114-Status: UNSURE (   3.79  )
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
branch HEAD: c5186318e2cc12daabec3a89aa8e1c2881c3485b  Merge branch 'ath-next' into ath-qca

elapsed time: 1412m

configs tested: 164
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
arc                   randconfig-001-20240426   gcc  
arc                   randconfig-002-20240426   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240426   clang
arm                   randconfig-002-20240426   gcc  
arm                   randconfig-003-20240426   gcc  
arm                   randconfig-004-20240426   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240426   gcc  
arm64                 randconfig-002-20240426   gcc  
arm64                 randconfig-003-20240426   clang
arm64                 randconfig-004-20240426   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240426   gcc  
csky                  randconfig-002-20240426   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240426   clang
hexagon               randconfig-002-20240426   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240426   gcc  
i386         buildonly-randconfig-002-20240426   clang
i386         buildonly-randconfig-003-20240426   gcc  
i386         buildonly-randconfig-004-20240426   gcc  
i386         buildonly-randconfig-005-20240426   clang
i386         buildonly-randconfig-006-20240426   clang
i386                                defconfig   clang
i386                  randconfig-001-20240426   gcc  
i386                  randconfig-002-20240426   clang
i386                  randconfig-003-20240426   gcc  
i386                  randconfig-004-20240426   gcc  
i386                  randconfig-005-20240426   gcc  
i386                  randconfig-006-20240426   clang
i386                  randconfig-011-20240426   gcc  
i386                  randconfig-012-20240426   clang
i386                  randconfig-013-20240426   clang
i386                  randconfig-014-20240426   clang
i386                  randconfig-015-20240426   clang
i386                  randconfig-016-20240426   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240426   gcc  
loongarch             randconfig-002-20240426   gcc  
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
mips                     decstation_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240426   gcc  
nios2                 randconfig-002-20240426   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240426   gcc  
parisc                randconfig-002-20240426   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-001-20240426   clang
powerpc               randconfig-002-20240426   gcc  
powerpc               randconfig-003-20240426   clang
powerpc64             randconfig-001-20240426   gcc  
powerpc64             randconfig-002-20240426   gcc  
powerpc64             randconfig-003-20240426   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240426   clang
riscv                 randconfig-002-20240426   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240426   clang
s390                  randconfig-002-20240426   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240426   gcc  
sh                    randconfig-002-20240426   gcc  
sh                             sh03_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240426   gcc  
sparc64               randconfig-002-20240426   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240426   gcc  
um                    randconfig-002-20240426   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240426   gcc  
x86_64       buildonly-randconfig-005-20240426   gcc  
x86_64       buildonly-randconfig-006-20240426   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240426   gcc  
x86_64                randconfig-002-20240426   gcc  
x86_64                randconfig-003-20240426   gcc  
x86_64                randconfig-012-20240426   gcc  
x86_64                randconfig-013-20240426   gcc  
x86_64                randconfig-014-20240426   gcc  
x86_64                randconfig-015-20240426   gcc  
x86_64                randconfig-074-20240426   gcc  
x86_64                randconfig-075-20240426   gcc  
x86_64                randconfig-076-20240426   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240426   gcc  
xtensa                randconfig-002-20240426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

