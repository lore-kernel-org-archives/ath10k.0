Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF90C4345F
	for <ath10k@archiver.kernel.org>; Sat, 27 Apr 2024 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JdTz+HW2EtfKMJwDIvUYmk8a7EQhcc2RbW8qnyOcbIM=; b=prle9VnzpArDbeYbV2rAWMgzAZ
	EXqFOpSTZ6YnNVr/Ag2RnHun5yWgLSuKrXNsO68dYg2LKgjYAO+2YLky+ADiMMQKdG4zstdCALv7D
	lwCr9LmXLc240HVOk8D0+ET3S7ZjTtVrN6gCumavo3V8s8IVOByYir+4UXwPeemPrdfr6KLZNlYBH
	CJpIIbmbifEuBpHQkW7LP3dWoin0GFbet41MwG8f+2t4fsRO7UcZws4kcUDZXCk4M4VJViC1PpfwS
	YqNJ6YM725C7jRik+FcAEw5za5Vfo+BN/+NvGVW12MEmmTOg9jA+3heLrySQB94vH94i9zU8vTi69
	RNxIujqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0jTr-0000000FgiQ-36Rq;
	Sat, 27 Apr 2024 14:56:47 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0jTo-0000000FggA-040N
	for ath10k@lists.infradead.org;
	Sat, 27 Apr 2024 14:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714229804; x=1745765804;
  h=date:from:to:cc:subject:message-id;
  bh=1Oxd/p7bHIPZ8FJ6tZd7A/iiyFMeF7sLKgEPneFGBS4=;
  b=R/c/OTPpXAtR7hKQgS79bw1DG/Jq5KVSTZSXYr0UuZ9HLDubctHEcQUH
   YisFD7Ao6GAtk2e8SryTKxYC6cX5vzNJmjJ7pUnjMuhUk7Fb3H88sQbMV
   Hi95usMctIEAWOBT3y7Zf/hKHSkxBwi+/L+rDdAyC8r3pUahThM5OM9NL
   IZpSGHL3GzNw+kHnoT1ujzzXKTClU/BQHD/0GUonbjlVpUrW+pcy4lweR
   R9mkpLQPw58N8G0ySpqn5ajsToLirBu6LuVtlgczvGY5HIUBqWmzJmk52
   RdZXj0ZKx6/QpFvrSaSq0rhZ08PhaHJZtfxjkkdBFdevqj6pGCZJY3HDT
   w==;
X-CSE-ConnectionGUID: +RmohcLSRaeJXvPXbchOag==
X-CSE-MsgGUID: j1x9B+dyQ22Wc9kuwHYq0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10484449"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="10484449"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 07:56:41 -0700
X-CSE-ConnectionGUID: sVEfv7AfTmygCTvXeWkHag==
X-CSE-MsgGUID: UcJG8wh5Sqe+ue9wfPnwkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="30501156"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Apr 2024 07:56:39 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0jTh-00059m-0B;
	Sat, 27 Apr 2024 14:56:37 +0000
Date: Sat, 27 Apr 2024 22:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 fed4e95a701cd470f5fee938091ae30da3325b2b
Message-ID: <202404272253.Yp0PUlmW-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_075644_095270_F06F6A5C 
X-CRM114-Status: UNSURE (   3.63  )
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
branch HEAD: fed4e95a701cd470f5fee938091ae30da3325b2b  wifi: carl9170: add a proper sanity check for endpoints

elapsed time: 1398m

configs tested: 179
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240427   gcc  
arc                   randconfig-002-20240427   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                       multi_v4t_defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                   randconfig-001-20240427   clang
arm                   randconfig-002-20240427   clang
arm                   randconfig-003-20240427   gcc  
arm                   randconfig-004-20240427   clang
arm                       versatile_defconfig   gcc  
arm                        vexpress_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240427   clang
arm64                 randconfig-002-20240427   clang
arm64                 randconfig-003-20240427   gcc  
arm64                 randconfig-004-20240427   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240427   gcc  
csky                  randconfig-002-20240427   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240427   clang
hexagon               randconfig-002-20240427   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240427   clang
i386         buildonly-randconfig-002-20240427   gcc  
i386         buildonly-randconfig-003-20240427   clang
i386         buildonly-randconfig-004-20240427   clang
i386         buildonly-randconfig-005-20240427   clang
i386         buildonly-randconfig-006-20240427   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240427   clang
i386                  randconfig-002-20240427   gcc  
i386                  randconfig-003-20240427   clang
i386                  randconfig-004-20240427   gcc  
i386                  randconfig-005-20240427   gcc  
i386                  randconfig-006-20240427   clang
i386                  randconfig-011-20240427   gcc  
i386                  randconfig-012-20240427   gcc  
i386                  randconfig-013-20240427   clang
i386                  randconfig-014-20240427   clang
i386                  randconfig-015-20240427   gcc  
i386                  randconfig-016-20240427   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240427   gcc  
loongarch             randconfig-002-20240427   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240427   gcc  
nios2                 randconfig-002-20240427   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240427   gcc  
parisc                randconfig-002-20240427   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      cm5200_defconfig   clang
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-001-20240427   clang
powerpc               randconfig-002-20240427   clang
powerpc               randconfig-003-20240427   clang
powerpc                  storcenter_defconfig   gcc  
powerpc64             randconfig-001-20240427   gcc  
powerpc64             randconfig-002-20240427   gcc  
powerpc64             randconfig-003-20240427   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240427   clang
riscv                 randconfig-002-20240427   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240427   gcc  
s390                  randconfig-002-20240427   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                    randconfig-001-20240427   gcc  
sh                    randconfig-002-20240427   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240427   gcc  
sparc64               randconfig-002-20240427   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240427   clang
um                    randconfig-002-20240427   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240427   clang
x86_64       buildonly-randconfig-002-20240427   clang
x86_64       buildonly-randconfig-003-20240427   gcc  
x86_64       buildonly-randconfig-004-20240427   clang
x86_64       buildonly-randconfig-005-20240427   clang
x86_64       buildonly-randconfig-006-20240427   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240427   clang
x86_64                randconfig-002-20240427   clang
x86_64                randconfig-003-20240427   gcc  
x86_64                randconfig-004-20240427   clang
x86_64                randconfig-005-20240427   gcc  
x86_64                randconfig-006-20240427   gcc  
x86_64                randconfig-011-20240427   gcc  
x86_64                randconfig-012-20240427   clang
x86_64                randconfig-013-20240427   clang
x86_64                randconfig-014-20240427   clang
x86_64                randconfig-015-20240427   gcc  
x86_64                randconfig-016-20240427   gcc  
x86_64                randconfig-071-20240427   gcc  
x86_64                randconfig-072-20240427   clang
x86_64                randconfig-073-20240427   clang
x86_64                randconfig-074-20240427   clang
x86_64                randconfig-075-20240427   clang
x86_64                randconfig-076-20240427   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240427   gcc  
xtensa                randconfig-002-20240427   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

