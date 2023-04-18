Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AEEC77B75
	for <ath10k@archiver.kernel.org>; Tue, 18 Apr 2023 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9XVvJSpqvCp+aXRxz+nUPjfqjMwJc+nIvCt6tLgc/mI=; b=ov4LogDOlj7NxP
	DcI/oZEoGc7R4Qwm8ao1moJnkN0SnDobT8kdRiISYAh8BG2muUyK3HVCP4RNCz6dnupbjHOuM5QAP
	pEreucXLTxHFU5+eaQFzKryqqrjtzInTNgQe5D+U/HH57hW3XJqRJfxZXotUj8hVYAAevZGhQ5Zcp
	kQlI+CBOiM1Ag9j7moyH0v5R7Hqx8vBji/uGzyOMHEtlXZiHZXwz7iN9G+vNj1lhD8oeaN8nvaZ/K
	j7hGfAmtGQpBgqu29IGlMMusJSigzyNGMYF42+TdGEVxMXraFrjmqxjCBmOiQn3QHBuFkC8J2RaQ/
	YQ7ieOZi/v44tDYTJYxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pot0o-003P2z-0s;
	Tue, 18 Apr 2023 21:37:18 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pot0l-003P1I-2u
	for ath10k@lists.infradead.org;
	Tue, 18 Apr 2023 21:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681853835; x=1713389835;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8pNbIFRnqGVIAoKUywZqdJFCfnZZHwKOFScY9HnU6Lg=;
  b=aAjqy6ZYqme9ONyBZDDUo+agdGCoBNoMuI0kyBekn9IP0pbXA78/PrTE
   50wg+oTgcJE1yP65ftEAV8uAaFYF83n1fH3gfMXXDrLYyY/wl2bRZ79o/
   7Ke6yVu3CpM874a35j2E3u78bxyAyHmi5KNKczeRa1Hls7kfzaMU3OUc7
   LvYoudYEVky+pchJWoS+Wug/69VCL7/TdbXyRxv4NKTJ46DW1HdS8yBye
   kcTsF1+fpx0AmxAoq0xB+9WZO4dDQVi1VEcN3FybmOSSURaBZyjMnnq9T
   i2SluSLQ6N2M0bvCwvEK7VHv4mN41W8LocdXIiROCznHsXywCJZHZM6VE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342777534"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="342777534"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 14:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="815365406"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="815365406"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Apr 2023 14:37:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pot0g-000e5Q-0a;
	Tue, 18 Apr 2023 21:37:10 +0000
Date: Wed, 19 Apr 2023 05:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 7b8a5f8056f447d6da42c729df11d1fb0de6b1eb
Message-ID: <643f0d7a.c3ZLcSvsz0f4ff0I%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_143715_953221_C888A1C4 
X-CRM114-Status: UNSURE (   6.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 7b8a5f8056f447d6da42c729df11d1fb0de6b1eb  wifi: ath11k: Remove disabling of 80+80 and 160 MHz

elapsed time: 729m

configs tested: 132
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r015-20230418   clang
arm                  randconfig-r034-20230417   clang
arm                  randconfig-r034-20230418   gcc  
arm                  randconfig-r035-20230418   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230418   clang
arm64                randconfig-r006-20230417   gcc  
arm64                randconfig-r022-20230416   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230418   gcc  
csky                 randconfig-r024-20230416   gcc  
csky                 randconfig-r035-20230417   gcc  
hexagon              randconfig-r001-20230417   clang
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230418   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230416   gcc  
ia64                 randconfig-r005-20230416   gcc  
ia64                 randconfig-r006-20230416   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230418   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230418   gcc  
m68k                 randconfig-r006-20230418   gcc  
m68k                 randconfig-r024-20230417   gcc  
m68k                 randconfig-r026-20230417   gcc  
m68k                 randconfig-r031-20230417   gcc  
m68k                 randconfig-r033-20230418   gcc  
m68k                 randconfig-r035-20230416   gcc  
m68k                 randconfig-r036-20230417   gcc  
microblaze           randconfig-r003-20230416   gcc  
microblaze           randconfig-r012-20230418   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      malta_kvm_defconfig   clang
mips                 randconfig-r002-20230418   gcc  
mips                 randconfig-r004-20230417   clang
mips                 randconfig-r025-20230417   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230417   gcc  
openrisc             randconfig-r013-20230418   gcc  
openrisc             randconfig-r031-20230418   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230418   gcc  
powerpc      buildonly-randconfig-r003-20230418   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc              randconfig-r026-20230416   gcc  
powerpc              randconfig-r032-20230416   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230417   gcc  
riscv                randconfig-r033-20230417   gcc  
riscv                randconfig-r034-20230416   clang
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230418   gcc  
sh                   randconfig-r003-20230417   gcc  
sh                   randconfig-r031-20230416   gcc  
sh                   randconfig-r036-20230416   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230417   gcc  
sparc                randconfig-r032-20230417   gcc  
sparc                randconfig-r036-20230418   gcc  
sparc64              randconfig-r016-20230418   gcc  
sparc64              randconfig-r021-20230416   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64               randconfig-k001-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230416   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
