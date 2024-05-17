Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75009C04FFE
	for <ath10k@archiver.kernel.org>; Fri, 17 May 2024 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rMdxC1+gGY4nqdid9Pw3VKcFO6qqLBiqQCAefqR0XI4=; b=k3u/FwlAGwFXK9sKo1G0ei2+Pv
	Ljn4vQQtntq0rSWcxh1CVIlrYEmoZfnR7bjif/Wcl8onT/fbnseH1UQm5ARrfctMRTmKkMKk6y30Z
	HuGJ4D9NkTvfYycPC9h3xMClbFgv6nImYNYNPLPyeYTEToSbifqVe5g8Mb6pd4Bu2C7jvg8lJIxsM
	0dXqXm3xZnhn0DMUs+luw0rA769X4dTj+bvJ9HyCJ7YtAAiHJT50qJHlVX2wsHPq+6457JWw/s4SL
	Nz6xEdf0MTnBjUADe91gSF/BRFhDgSC97u8/OylXJlwPJjq9jtfcE8p/bcTehX2oMFOSqKWADLwDM
	cxad+KQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s83J2-00000008pdt-2Lsv;
	Fri, 17 May 2024 19:31:52 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s83Iz-00000008pdU-24SQ
	for ath10k@lists.infradead.org;
	Fri, 17 May 2024 19:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715974310; x=1747510310;
  h=date:from:to:cc:subject:message-id;
  bh=wIFv7Pk3f/xa1fvIshT7ZCx6HHVfUyY3uXR/ElciXbk=;
  b=M25o/qmQj5IovYPkyBn7e8rPuoqi6TIoXMkwW3q4DVG5AIyru+xbd7a9
   kLt6q/pNy51nV1/0VYRjK0gChqZVbY6PGYGCMgYqjEcZVUBGbROTGrdq8
   g14XMHGJoOqRpuLK9Nt9ETYFgSWjgyCw5IftSUEH9GnJi1o5CrN0KWWAc
   MLdIH3OfKCSlc3ULJnjJWiEgYzsOiBUejaEYkcititXMaDRNg1bz7wJMl
   nWUCiJXSBlcY8SB1ELD0oAgPVPTw9mrfN9/IEfrTXfN/pC0Y0Fsi98VPI
   bSrIgL33naTNlPvB0piNkrX5j7BqLvMTus7qLScCU0A3XyaJacxgYFvzu
   g==;
X-CSE-ConnectionGUID: PQLHxDztR2qn4jZbhDAmPw==
X-CSE-MsgGUID: Pmt4W+j4Rqim3xij3Qt+4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22749877"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="22749877"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 12:31:49 -0700
X-CSE-ConnectionGUID: i8HzmByMTtS/NMV8QxbU1g==
X-CSE-MsgGUID: 6r7y+LF7QouCk0i6tXN23w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="63080275"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 May 2024 12:31:47 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s83Iv-00014I-0i;
	Fri, 17 May 2024 19:31:45 +0000
Date: Sat, 18 May 2024 03:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-current] BUILD SUCCESS
 637c435f08ea7e77c53a2ad590b651d0de225e3b
Message-ID: <202405180355.CbLOEk8Z-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_123149_622332_A746670C 
X-CRM114-Status: UNSURE (   3.81  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-current
branch HEAD: 637c435f08ea7e77c53a2ad590b651d0de225e3b  wifi: ath11k: Fix error path in ath11k_pcic_ext_irq_config

elapsed time: 737m

configs tested: 156
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
arc                   randconfig-001-20240517   gcc  
arc                   randconfig-002-20240517   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                         nhk8815_defconfig   clang
arm                   randconfig-001-20240517   clang
arm                   randconfig-002-20240517   clang
arm                   randconfig-003-20240517   clang
arm                   randconfig-004-20240517   clang
arm                           sama7_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240517   clang
arm64                 randconfig-002-20240517   gcc  
arm64                 randconfig-003-20240517   clang
arm64                 randconfig-004-20240517   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240517   gcc  
csky                  randconfig-002-20240517   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240517   clang
hexagon               randconfig-002-20240517   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240517   clang
i386         buildonly-randconfig-002-20240517   clang
i386         buildonly-randconfig-003-20240517   gcc  
i386         buildonly-randconfig-004-20240517   clang
i386         buildonly-randconfig-005-20240517   clang
i386         buildonly-randconfig-006-20240517   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240517   gcc  
i386                  randconfig-002-20240517   gcc  
i386                  randconfig-003-20240517   gcc  
i386                  randconfig-004-20240517   gcc  
i386                  randconfig-005-20240517   gcc  
i386                  randconfig-006-20240517   gcc  
i386                  randconfig-011-20240517   gcc  
i386                  randconfig-012-20240517   clang
i386                  randconfig-013-20240517   gcc  
i386                  randconfig-014-20240517   gcc  
i386                  randconfig-015-20240517   clang
i386                  randconfig-016-20240517   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240517   gcc  
loongarch             randconfig-002-20240517   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           jazz_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
mips                         rt305x_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240517   gcc  
nios2                 randconfig-002-20240517   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240517   gcc  
parisc                randconfig-002-20240517   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                      chrp32_defconfig   clang
powerpc                      pasemi_defconfig   clang
powerpc               randconfig-001-20240517   clang
powerpc               randconfig-002-20240517   clang
powerpc               randconfig-003-20240517   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240517   gcc  
powerpc64             randconfig-002-20240517   gcc  
powerpc64             randconfig-003-20240517   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240517   clang
riscv                 randconfig-002-20240517   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240517   clang
s390                  randconfig-002-20240517   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240517   gcc  
sh                    randconfig-002-20240517   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240517   gcc  
sparc64               randconfig-002-20240517   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240517   clang
um                    randconfig-002-20240517   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20240517   gcc  
xtensa                randconfig-002-20240517   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

