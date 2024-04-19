Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B0BC4345F
	for <ath10k@archiver.kernel.org>; Fri, 19 Apr 2024 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Y6FJ1wBlQkmm0BiBnRLqpx2vn9u5H5TTWrNKYI5yPs=; b=GGseq0h8M/ZIU11Luttw/kOS/J
	UjlDIHANaaIy3NIVTDWN98vyiwo6O79+Zd2U50qrfkGxNmkb5RYx/6mdL1ZEUqvW85UxsOXgUw8q6
	hb3fO+5pj1fTq+8OabYbAYNy4wJ7hI5Y/pVOZ77BvGohA+nfPcqWrJBI8ckumUG4yt4XnJtaQ1ufj
	BLicsLMyAtqZsucds1cJ10IayZJIhCfaGZkezkJtZpl6N0oYexzxTBQjxcY+pmRRV20ZzipdRdhyH
	Oapm4QVcCaq2IULY96TZsfSmlxC+m61eNZj0aRK4veHLW2BzRcIS6Z+MMZc4Jk4BgCb2oX+OtxASt
	mPhxyIkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxsvO-00000006et8-32dS;
	Fri, 19 Apr 2024 18:25:26 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxsvL-00000006erF-2pAH
	for ath10k@lists.infradead.org;
	Fri, 19 Apr 2024 18:25:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713551123; x=1745087123;
  h=date:from:to:cc:subject:message-id;
  bh=deXH0G3rJlE8+b1DAsUVqeMYQBpgN15pVtAeJFg8nKo=;
  b=eLJUGLhpj4q1R019nFwwwkfzC8XMrN1lV9Gd3QKfLGtrvwHyb/nJndy0
   zdxmZPHFRLs5MfyM1M+AISKZpKqS1tsMcIPzjKFAkw/99z8oCPB+HQQZN
   HZZVyRbEyAa77zAS+DCx0v986FgF2X5L9PkigZaOynYuzOrqnzdxRVTJd
   +gCkp1+XYurvOeE1ZRWDoqQmACPIDhPcN0TLgjimG62mh/wUY7LWDDClT
   NvxOVXJgQya963O+7TnPInviKkafnFtunp/O4tJW+4EoUTDDIvc93KZIy
   wTt7evrf7MLkq3cM3P2iwMWaghTRNnqUUsnfxC36Q5PLtMqFt200KR57D
   w==;
X-CSE-ConnectionGUID: mGw82egDTVultvpuzpl4ZA==
X-CSE-MsgGUID: HZB/5UckTfGp4Un4s0u/sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9001802"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9001802"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 11:25:22 -0700
X-CSE-ConnectionGUID: c81GGUgISjOHcx+jQ6q3fQ==
X-CSE-MsgGUID: wLgrAC/XRHiSKGQhjhWX9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="28195749"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Apr 2024 11:25:21 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxsvG-000AOS-0w;
	Fri, 19 Apr 2024 18:25:18 +0000
Date: Sat, 20 Apr 2024 02:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 5d1a18e1b0dbc588ec7ebf77e4be097565c9b86f
Message-ID: <202404200249.Cu1axrob-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_112523_808388_4DBDD4A6 
X-CRM114-Status: UNSURE (   3.80  )
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
branch HEAD: 5d1a18e1b0dbc588ec7ebf77e4be097565c9b86f  wifi: ath12k: fix kernel crash during resume

elapsed time: 817m

configs tested: 126
configs skipped: 4

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
arc                   randconfig-001-20240419   gcc  
arc                   randconfig-002-20240419   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240419   gcc  
arm                   randconfig-002-20240419   clang
arm                   randconfig-003-20240419   gcc  
arm                   randconfig-004-20240419   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240419   clang
arm64                 randconfig-002-20240419   clang
arm64                 randconfig-003-20240419   clang
arm64                 randconfig-004-20240419   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240419   gcc  
csky                  randconfig-002-20240419   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240419   clang
hexagon               randconfig-002-20240419   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240419   clang
i386         buildonly-randconfig-002-20240419   gcc  
i386         buildonly-randconfig-003-20240419   gcc  
i386         buildonly-randconfig-004-20240419   gcc  
i386         buildonly-randconfig-005-20240419   gcc  
i386         buildonly-randconfig-006-20240419   gcc  
i386                                defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240419   gcc  
loongarch             randconfig-002-20240419   gcc  
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
nios2                 randconfig-001-20240419   gcc  
nios2                 randconfig-002-20240419   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240419   gcc  
parisc                randconfig-002-20240419   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240419   gcc  
powerpc               randconfig-002-20240419   gcc  
powerpc               randconfig-003-20240419   gcc  
powerpc64             randconfig-001-20240419   gcc  
powerpc64             randconfig-002-20240419   gcc  
powerpc64             randconfig-003-20240419   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240419   clang
riscv                 randconfig-002-20240419   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240419   clang
s390                  randconfig-002-20240419   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240419   gcc  
sh                    randconfig-002-20240419   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240419   gcc  
sparc64               randconfig-002-20240419   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240419   gcc  
um                    randconfig-002-20240419   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240419   gcc  
xtensa                randconfig-002-20240419   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

