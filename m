Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725E3C54E5C
	for <ath10k@archiver.kernel.org>; Sat,  9 Mar 2024 04:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=95r56RiCwXCOX91DTU9UG52WLr7IyICLD5bKzNPvUXs=; b=rKo4UohZw3OfV5PdsBZnadVs9f
	kgMl8f5B4lHpAaxov8n4F4bD7Y6TIybanyF1BcXidkZPKcQWXlUU6sT3d+NEArlTnwiT4/RcYgF8a
	taq722Ix8DFGgnNQBSTcMkjur4chfCJ6xOMjE1v2Pjp56qkuU1U7EQ3m9nd4L2LP6FnwE6s7G+4Il
	SRv5ru8mxBH+NyrD+XkUvAXmmHGX9QwZ3A55mxulWO94xqksYqP6A+saZbRCj0UtFG/tmuN2ggBXW
	IvwJ6eGb8z+MdeEfNOT7q1g5pQbic9GsDmkBy08+WTDZ7dMcqo8OBcZJbP9ILMSsRPKO5aZn14XFA
	yrEy9J+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rinsi-0000000CM3f-26Oo;
	Sat, 09 Mar 2024 04:00:20 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rinsf-0000000CM2i-0gIw
	for ath10k@lists.infradead.org;
	Sat, 09 Mar 2024 04:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709956817; x=1741492817;
  h=date:from:to:cc:subject:message-id;
  bh=b+jc1RMz0Po2bLDvi0Rzf3YLI2MXlWMvxRnMeHWHs4o=;
  b=n1vRAWjDGh7xjar+pWvYaEwU5F83ytLQmE+A1jd0h9a3SsJMCYazWDdm
   HQlCHmpe41aNdoRkHLlwfzj68+xs2/jcHllMtEqdKW+DI0YvwswusODcN
   4HUf5Bt6ErpQ+SqZqijfB1Mvhij2GwkVVoLeajkVeiEOFLVlJ5It4PU3H
   XjZUVJi6BF8ibYK1Brk2yJtcmvQ/6fSkFurMyV9NNn/kkwQJHb4OvMpwF
   /gdfuAtWuqsaW9dHcOs6qI1hlGrbyCED4fRrMFcbMVV3IMQhtt9zN9HLu
   pDt0FAueB3d5iCjH/H7C7Y723llkZThl2Lns4W9lyTkroZIOFk50vc+w8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4819670"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="4819670"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 20:00:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10715031"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2024 20:00:12 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rinsX-0006xB-2M;
	Sat, 09 Mar 2024 04:00:09 +0000
Date: Sat, 09 Mar 2024 12:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 6e723d2df5ce8b7cf260d812db2f852b32bcba57
Message-ID: <202403091203.WyRZtRDs-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_200017_321350_67503D80 
X-CRM114-Status: UNSURE (   3.84  )
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
branch HEAD: 6e723d2df5ce8b7cf260d812db2f852b32bcba57  Merge branch 'ath-next' into ath-qca

elapsed time: 743m

configs tested: 128
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
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240309   clang
i386         buildonly-randconfig-002-20240309   clang
i386         buildonly-randconfig-003-20240309   gcc  
i386         buildonly-randconfig-004-20240309   gcc  
i386         buildonly-randconfig-005-20240309   gcc  
i386         buildonly-randconfig-006-20240309   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240309   gcc  
i386                  randconfig-002-20240309   gcc  
i386                  randconfig-003-20240309   clang
i386                  randconfig-004-20240309   clang
i386                  randconfig-005-20240309   clang
i386                  randconfig-006-20240309   gcc  
i386                  randconfig-011-20240309   gcc  
i386                  randconfig-012-20240309   gcc  
i386                  randconfig-013-20240309   clang
i386                  randconfig-014-20240309   clang
i386                  randconfig-015-20240309   clang
i386                  randconfig-016-20240309   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240309   clang
x86_64       buildonly-randconfig-003-20240309   clang
x86_64       buildonly-randconfig-006-20240309   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-002-20240309   clang
x86_64                randconfig-003-20240309   clang
x86_64                randconfig-005-20240309   clang
x86_64                randconfig-011-20240309   clang
x86_64                randconfig-012-20240309   clang
x86_64                randconfig-013-20240309   clang
x86_64                randconfig-076-20240309   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

