Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEE7C54E58
	for <ath10k@archiver.kernel.org>; Tue, 12 Mar 2024 01:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ya4FROKker9y3hCfQSTDJkeZH+NzmhMcKUrizp1Tlgg=; b=WOb2+yodpnUTC57y6SYqKKyrTy
	UEvAW2kcOJUXJWfhbrNI6R2w2aa2JfTfhWL+vCpGzLLI+dJy1/bn2LLBLWFliEu2F25K8eamisnyp
	fP1ZD47wKtekZboK1sJHQEpi3ORtp72BpX7xsg6P1I1VcwdB83oRr9a9CCMJDf6l92PJcNx9XW+yo
	zDHkcWKNSLNkLXw3pbnW7J8LWSiTquRU6PONE+iCU38q4lPjMiKg+ijwmrWQdT/hyzFZryBG+hlkw
	pHPL7hwGGEAONON7AC+1+rni9O9Rh4ogl79S4WRwwZ2TaU0Be6x8kSeMWHBkJpXB6uJJ3zNjvRSFn
	5K0RoHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjr6m-00000003r2m-1lJ2;
	Tue, 12 Mar 2024 01:39:12 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjr6i-00000003r24-48Ug
	for ath10k@lists.infradead.org;
	Tue, 12 Mar 2024 01:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710207550; x=1741743550;
  h=date:from:to:cc:subject:message-id;
  bh=kxYYy6YJtYi5sWgtRE6m7WGhl5jPOjUYdXAJg+kGN7I=;
  b=acOe7lnooZEYBsAWSelBwc807Q9SioUHS/+oANO1EOMmEZTK4KTkhzb0
   6/jTwrlO85ggqH287DOKxdkV1/PGmZm2i4CxPCG0aDof9u7H7ySieXBtu
   a6Yc5CHNR1LZH7yGZ8WSeR3HfCbyNhziQfvWHonDxL8a6vQ4DyvCFfKwa
   vhhx3FETOlZvtniT5v38y5GZ+ZqwLFyoA+Dn1qQoQ0z2aUpwwMfFqWxP6
   MrmWONvqFi0OrgHi3c9VYB0/BbZyIKocZbt40/a240cdYiKIgg7dWz7ET
   Icdyao8RLQceTHqQnyHqyJE6rDmhVamoXxi6647TLeeVqn/SOjYX0eWyF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5034222"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="5034222"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 18:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="11462950"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2024 18:39:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjr6d-0009cu-14;
	Tue, 12 Mar 2024 01:39:03 +0000
Date: Tue, 12 Mar 2024 09:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4fb973c546f3b56d9f220dd0a1c87dd29043791d
Message-ID: <202403120922.lCCLVwBQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_183909_092772_70B64426 
X-CRM114-Status: UNSURE (   4.39  )
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
branch HEAD: 4fb973c546f3b56d9f220dd0a1c87dd29043791d  Merge branch 'pending' into master-pending

elapsed time: 731m

configs tested: 180
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
arc                   randconfig-001-20240312   gcc  
arc                   randconfig-002-20240312   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   clang
arm                         axm55xx_defconfig   clang
arm                                 defconfig   clang
arm                         mv78xx0_defconfig   clang
arm                   randconfig-001-20240312   clang
arm                   randconfig-002-20240312   gcc  
arm                   randconfig-003-20240312   gcc  
arm                   randconfig-004-20240312   clang
arm                             rpc_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240312   gcc  
arm64                 randconfig-002-20240312   gcc  
arm64                 randconfig-003-20240312   gcc  
arm64                 randconfig-004-20240312   clang
csky                             alldefconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240312   gcc  
csky                  randconfig-002-20240312   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240312   clang
hexagon               randconfig-002-20240312   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240311   clang
i386         buildonly-randconfig-002-20240311   clang
i386         buildonly-randconfig-003-20240311   clang
i386         buildonly-randconfig-004-20240311   gcc  
i386         buildonly-randconfig-005-20240311   clang
i386         buildonly-randconfig-006-20240311   clang
i386                                defconfig   clang
i386                  randconfig-001-20240311   gcc  
i386                  randconfig-002-20240311   gcc  
i386                  randconfig-003-20240311   clang
i386                  randconfig-004-20240311   clang
i386                  randconfig-005-20240311   gcc  
i386                  randconfig-006-20240311   clang
i386                  randconfig-011-20240311   gcc  
i386                  randconfig-012-20240311   gcc  
i386                  randconfig-013-20240311   clang
i386                  randconfig-014-20240311   gcc  
i386                  randconfig-015-20240311   clang
i386                  randconfig-016-20240311   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240312   gcc  
loongarch             randconfig-002-20240312   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                        maltaup_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240312   gcc  
nios2                 randconfig-002-20240312   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240312   gcc  
parisc                randconfig-002-20240312   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   currituck_defconfig   clang
powerpc               randconfig-001-20240312   gcc  
powerpc               randconfig-002-20240312   clang
powerpc               randconfig-003-20240312   gcc  
powerpc                     taishan_defconfig   clang
powerpc                      walnut_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240312   clang
powerpc64             randconfig-002-20240312   clang
powerpc64             randconfig-003-20240312   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240312   clang
riscv                 randconfig-002-20240312   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240312   clang
s390                  randconfig-002-20240312   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240312   gcc  
sh                    randconfig-002-20240312   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240312   gcc  
sparc64               randconfig-002-20240312   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240312   gcc  
um                    randconfig-002-20240312   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240312   clang
x86_64       buildonly-randconfig-002-20240312   clang
x86_64       buildonly-randconfig-003-20240312   clang
x86_64       buildonly-randconfig-004-20240312   clang
x86_64       buildonly-randconfig-005-20240312   gcc  
x86_64       buildonly-randconfig-006-20240312   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240312   clang
x86_64                randconfig-002-20240312   clang
x86_64                randconfig-003-20240312   gcc  
x86_64                randconfig-004-20240312   gcc  
x86_64                randconfig-005-20240312   gcc  
x86_64                randconfig-006-20240312   clang
x86_64                randconfig-011-20240312   gcc  
x86_64                randconfig-012-20240312   clang
x86_64                randconfig-013-20240312   gcc  
x86_64                randconfig-014-20240312   gcc  
x86_64                randconfig-015-20240312   clang
x86_64                randconfig-016-20240312   clang
x86_64                randconfig-071-20240312   gcc  
x86_64                randconfig-072-20240312   gcc  
x86_64                randconfig-073-20240312   clang
x86_64                randconfig-074-20240312   gcc  
x86_64                randconfig-075-20240312   gcc  
x86_64                randconfig-076-20240312   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240312   gcc  
xtensa                randconfig-002-20240312   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

