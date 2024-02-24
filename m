Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FB6C48BF6
	for <ath10k@archiver.kernel.org>; Sat, 24 Feb 2024 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y1oYDbXkPtdou4no6rv9jxKmM57NkBPprNvpdd1BwBs=; b=OkKBGha0y/QYepL83/TxN2fYMC
	+miAUir8HEEqZHdMCWoyVjmCV7QOSszrOaB9/Ek+oIt/1W2MvMvVOKEAdhHmwvCMXlJSwAUQ7FTyf
	M2NAYMyVpxTqqH0Cq6fl8dPxDiXTwvGaBYJ15C/yBsWpetwiTzrVLC50V+kvJ2HF6svLLx+04mAy0
	oxtE4Tp8DQ204PJKLnU0x7VQKNDOh3RBDGhOV4tg5JTwKa5RRox+WTgFxouOKJESmanG4ocJYLfT6
	uhSnCWa8PS3zqs28ijaWAOCGp52LfRwGLev03I117bV2/lKxDNnHEcFlGsqUsXoho20WjX2q7jYH0
	0OoDZQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdsIX-0000000CwOW-3Pcm;
	Sat, 24 Feb 2024 13:42:37 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdsIT-0000000CwNu-3iBD
	for ath10k@lists.infradead.org;
	Sat, 24 Feb 2024 13:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708782154; x=1740318154;
  h=date:from:to:cc:subject:message-id;
  bh=IvzVaJvlUGhe4SPUbxcF47gEPo/DBow1IccA69VGI7k=;
  b=jaftCDcdQxIyOolJjsSERM9ymq38x84AOEbDDMHmeJ8DXESffOiJEQcB
   toyQ48H/1zQaIwguFpgGe5iRlFrkgpEpy/db/dVXXZ+gPZWnGaSO4zEVS
   xuntsXmhNZpokHoJ5sXyXQAmPpIK4ZdChMdNSCb8i75C5kh65OSISUBro
   vsiYfiH9/rXc3+Kc33zJ9YZiyGO7AFWj26h67qJkXE4qzYTCv3m5C6wDD
   6c//DL/7Zne/LKn23v8OhMZXRuyj2vOoMYNMqdm2NFoTaqROtonqtPPzR
   AL6ELjui2bPcT4zrffJncoi0ETed9YuCtVbvljJQxJIkjsHKvi9gq1xX/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6056487"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6056487"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 05:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="29373440"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Feb 2024 05:42:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdsIF-0008ZY-0v;
	Sat, 24 Feb 2024 13:42:19 +0000
Date: Sat, 24 Feb 2024 21:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 e5eab68bc6899289678100d59a4ae9aa4bf506dc
Message-ID: <202402242114.wKrdAFul-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_054234_006449_E514302E 
X-CRM114-Status: UNSURE (   3.92  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: e5eab68bc6899289678100d59a4ae9aa4bf506dc  Merge branch 'pending' into master-pending

elapsed time: 1279m

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
arc                   randconfig-001-20240224   gcc  
arc                   randconfig-002-20240224   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240224   gcc  
arm                   randconfig-002-20240224   gcc  
arm                   randconfig-003-20240224   gcc  
arm                   randconfig-004-20240224   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240224   gcc  
arm64                 randconfig-002-20240224   gcc  
arm64                 randconfig-003-20240224   clang
arm64                 randconfig-004-20240224   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240224   gcc  
csky                  randconfig-002-20240224   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240224   clang
hexagon               randconfig-002-20240224   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240224   gcc  
i386         buildonly-randconfig-002-20240224   clang
i386         buildonly-randconfig-003-20240224   gcc  
i386         buildonly-randconfig-004-20240224   gcc  
i386         buildonly-randconfig-005-20240224   clang
i386         buildonly-randconfig-006-20240224   clang
i386                                defconfig   clang
i386                  randconfig-001-20240224   gcc  
i386                  randconfig-002-20240224   clang
i386                  randconfig-003-20240224   clang
i386                  randconfig-004-20240224   gcc  
i386                  randconfig-005-20240224   gcc  
i386                  randconfig-006-20240224   gcc  
i386                  randconfig-011-20240224   gcc  
i386                  randconfig-012-20240224   gcc  
i386                  randconfig-013-20240224   clang
i386                  randconfig-014-20240224   clang
i386                  randconfig-015-20240224   clang
i386                  randconfig-016-20240224   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240224   gcc  
loongarch             randconfig-002-20240224   gcc  
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
nios2                 randconfig-001-20240224   gcc  
nios2                 randconfig-002-20240224   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240224   gcc  
parisc                randconfig-002-20240224   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240224   clang
powerpc               randconfig-002-20240224   clang
powerpc               randconfig-003-20240224   clang
powerpc64             randconfig-001-20240224   gcc  
powerpc64             randconfig-002-20240224   clang
powerpc64             randconfig-003-20240224   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240224   gcc  
riscv                 randconfig-002-20240224   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240224   gcc  
s390                  randconfig-002-20240224   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240224   gcc  
sh                    randconfig-002-20240224   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240224   gcc  
sparc64               randconfig-002-20240224   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240224   gcc  
um                    randconfig-002-20240224   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240224   clang
x86_64       buildonly-randconfig-002-20240224   clang
x86_64       buildonly-randconfig-003-20240224   clang
x86_64       buildonly-randconfig-004-20240224   clang
x86_64       buildonly-randconfig-005-20240224   clang
x86_64       buildonly-randconfig-006-20240224   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240224   clang
x86_64                randconfig-002-20240224   gcc  
x86_64                randconfig-003-20240224   clang
x86_64                randconfig-004-20240224   gcc  
x86_64                randconfig-005-20240224   gcc  
x86_64                randconfig-006-20240224   clang
x86_64                randconfig-011-20240224   gcc  
x86_64                randconfig-012-20240224   gcc  
x86_64                randconfig-013-20240224   gcc  
x86_64                randconfig-014-20240224   clang
x86_64                randconfig-015-20240224   clang
x86_64                randconfig-016-20240224   clang
x86_64                randconfig-071-20240224   gcc  
x86_64                randconfig-072-20240224   clang
x86_64                randconfig-073-20240224   clang
x86_64                randconfig-074-20240224   gcc  
x86_64                randconfig-075-20240224   gcc  
x86_64                randconfig-076-20240224   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240224   gcc  
xtensa                randconfig-002-20240224   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

