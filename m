Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD69C54798
	for <ath10k@archiver.kernel.org>; Tue, 27 Feb 2024 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fqdrcNUlXVw7RjSWbSeuTP2vslMoxabHy+i86uSBrtY=; b=pb7R+zxt05LazIy0KCQ88Yt0vJ
	39qKotg2qAFmDtvYSowykeeaSnWSUyBrL/Y8pzpTQi1HUNYiHAuYp4fEQ+jb6+S48eUVolfEFOyNL
	mO782Ae3m8jWHRSGQZh1xi1g5VSu8JXaLqNLEkj0FordrJuAyPjSBlmVbemrYQhwsxN1MjNXdw0yT
	DyDCS1NWxwA3tyqk7G4AyMxHF7apXb+TMxlF+8mp2B2xxOoirBQ84jnkThMyBYzG3i5uPkq0/+ZCj
	5gBE1/1EIPDIIQNPuTyHlwYjQX51GOXYb8SBdsHhBas11LEpH6dK7U7OV5+7tZZ5rSpemd5NohmcH
	nvN/DAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revtd-00000004zNI-0YRz;
	Tue, 27 Feb 2024 11:45:17 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revta-00000004zLQ-2p3i
	for ath10k@lists.infradead.org;
	Tue, 27 Feb 2024 11:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709034315; x=1740570315;
  h=date:from:to:cc:subject:message-id;
  bh=RNMgnl4+TCXu+LQP8PwvOU15Z0r/esjy42q6kHflVck=;
  b=U1EVVFFv8kJXWBJc8Y+X90HrhjuDnOOe5cxzXPffxj8k7of0xcvDeYd5
   mvElX4SK01Ep46B6ixTJ8UaQZrE+S1FRCVHBQBG1uHFAqf7q2CEQsoKj3
   zoO01J8t6fiwpZRzVsc/udLDjSrerMdFZ/0TAH5ZYzyaUS+W7Qoc8rodV
   5kcy23y4YsLDePeQ59X+kqlROgNwX3VE/dejM56Ht5+2ZzcgT7RRpvy3M
   rAR0ssPrXCZTr0GL4lUhCjyaojzK9N6v/ll87TiX+3MaWJ7CCzJGtEP1X
   0yYxQtvJd1JZrB8vyfoNc5aB2C7D9mEQt/9XFosT1m30rj7q+B5UYLXYf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14517527"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="14517527"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 03:45:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6994738"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Feb 2024 03:45:10 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1revtU-000BBZ-10;
	Tue, 27 Feb 2024 11:45:08 +0000
Date: Tue, 27 Feb 2024 19:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 9d26e48b475334732e56414976f1921b819eff56
Message-ID: <202402271926.kJFBtN6A-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_034514_827581_A972FC9E 
X-CRM114-Status: UNSURE (   4.42  )
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
branch HEAD: 9d26e48b475334732e56414976f1921b819eff56  wifi: ath12k: fix license in p2p.c and p2p.h

elapsed time: 1048m

configs tested: 147
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
arc                   randconfig-001-20240227   gcc  
arc                   randconfig-002-20240227   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240227   gcc  
arm                   randconfig-002-20240227   gcc  
arm                   randconfig-003-20240227   gcc  
arm                   randconfig-004-20240227   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240227   clang
arm64                 randconfig-002-20240227   gcc  
arm64                 randconfig-003-20240227   gcc  
arm64                 randconfig-004-20240227   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240227   gcc  
csky                  randconfig-002-20240227   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240227   clang
hexagon               randconfig-002-20240227   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240227   gcc  
i386         buildonly-randconfig-002-20240227   gcc  
i386                                defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240227   gcc  
loongarch             randconfig-002-20240227   gcc  
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
nios2                 randconfig-001-20240227   gcc  
nios2                 randconfig-002-20240227   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240227   gcc  
parisc                randconfig-002-20240227   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240227   clang
powerpc               randconfig-002-20240227   gcc  
powerpc               randconfig-003-20240227   clang
powerpc64             randconfig-001-20240227   clang
powerpc64             randconfig-002-20240227   gcc  
powerpc64             randconfig-003-20240227   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240227   gcc  
riscv                 randconfig-002-20240227   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240227   gcc  
s390                  randconfig-002-20240227   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240227   gcc  
sh                    randconfig-002-20240227   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240227   gcc  
sparc64               randconfig-002-20240227   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240227   clang
um                    randconfig-002-20240227   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240227   clang
x86_64       buildonly-randconfig-002-20240227   gcc  
x86_64       buildonly-randconfig-003-20240227   clang
x86_64       buildonly-randconfig-004-20240227   clang
x86_64       buildonly-randconfig-005-20240227   clang
x86_64       buildonly-randconfig-006-20240227   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240227   clang
x86_64                randconfig-002-20240227   clang
x86_64                randconfig-003-20240227   gcc  
x86_64                randconfig-004-20240227   gcc  
x86_64                randconfig-005-20240227   gcc  
x86_64                randconfig-006-20240227   gcc  
x86_64                randconfig-011-20240227   gcc  
x86_64                randconfig-012-20240227   gcc  
x86_64                randconfig-013-20240227   clang
x86_64                randconfig-014-20240227   gcc  
x86_64                randconfig-015-20240227   gcc  
x86_64                randconfig-016-20240227   gcc  
x86_64                randconfig-071-20240227   gcc  
x86_64                randconfig-072-20240227   clang
x86_64                randconfig-073-20240227   gcc  
x86_64                randconfig-074-20240227   clang
x86_64                randconfig-075-20240227   clang
x86_64                randconfig-076-20240227   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240227   gcc  
xtensa                randconfig-002-20240227   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

