Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4C8C5478C
	for <ath10k@archiver.kernel.org>; Thu, 29 Feb 2024 02:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BVWeJ5J2Uc1A9BEqzdBw3RyKr01u2Ycln/Yqrsj6vy8=; b=onjhu8lTD7bsbSK8V8g7WOZ+Eo
	V4YZAKP0IRt0ikqKsHoxHFr0SoB3ptS10Yc9Aw19A3h6eU8MmLgDn+MpPDWtTO2G98EN66KJbre3G
	DxpLxDhQWQoq+uaiWwSroPcH0q4ydHZwbz8IDTKHedgPILgnP1JXjUMoaEd2Y+aLuMK33x+fwg+o7
	No1WtHsLiO2eVSD66kZIQiNlNF47byLCgzPhSyxTWIk7ZlGLdGMHsG6UhZvcwqoPZUhgcel2WUuA/
	iFVu8K+bhobDpAx/Lw7cvFjgxEY3bkduXx0m4xhZZSgDW6fn5U8TYChkSLkYkE6no2KTuqgS8uDCh
	XfhPR4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWRX-0000000Bn7J-33br;
	Thu, 29 Feb 2024 02:46:43 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWRU-0000000Bn6p-2RJL
	for ath10k@lists.infradead.org;
	Thu, 29 Feb 2024 02:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709174800; x=1740710800;
  h=date:from:to:cc:subject:message-id;
  bh=VKIeI5EdxuLt70q/XjnU01P6uBut8+JErpLbwdFnhsE=;
  b=a+AmYv5tw0h5xCa9DRHHRKRrBffRKj/jTAbxiW4azEghZprRafbF5hqx
   9dIBrYu9G2e3T2W0gmYIMyf45V2J1DO38cmE39kQGZHc09WEND6ObndKt
   HXOT0WltiRByTmOdRYXbUkrKAV1YS6pd0IAGEEXjQTkH9wZr1YPJTWhN+
   tDwGB2daK/V6QS9qNehgTgP4GCb3iKJZV9Y+vIyhJsWuUEUkIpykQNwrA
   9/uZWPfqc4Wn9xjZEM24peYMgKFEAlr0nI2SDGCMltq9S/SEDC0dJaxsD
   MLpcedi5M0NDKdUC0BEqSF+s9cnaQjuIlZDPf5mU4c5NZpe1Tmy17TgYh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="6561587"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="6561587"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 18:46:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="8028114"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Feb 2024 18:46:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfWPE-000Cac-2K;
	Thu, 29 Feb 2024 02:45:33 +0000
Date: Thu, 29 Feb 2024 10:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 9f1cf0c0205ab8742682bcb0e0e4c940cb5f138a
Message-ID: <202402291030.YVpd5qTC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_184640_660112_493D5E4A 
X-CRM114-Status: UNSURE (   4.22  )
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
branch HEAD: 9f1cf0c0205ab8742682bcb0e0e4c940cb5f138a  Merge branch 'pending' into master-pending

elapsed time: 732m

configs tested: 136
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
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
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
i386         buildonly-randconfig-001-20240229   clang
i386         buildonly-randconfig-002-20240229   gcc  
i386         buildonly-randconfig-003-20240229   gcc  
i386         buildonly-randconfig-004-20240229   clang
i386         buildonly-randconfig-005-20240229   gcc  
i386         buildonly-randconfig-006-20240229   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240229   clang
i386                  randconfig-002-20240229   gcc  
i386                  randconfig-003-20240229   clang
i386                  randconfig-004-20240229   gcc  
i386                  randconfig-005-20240229   gcc  
i386                  randconfig-006-20240229   gcc  
i386                  randconfig-011-20240229   gcc  
i386                  randconfig-012-20240229   gcc  
i386                  randconfig-013-20240229   clang
i386                  randconfig-014-20240229   clang
i386                  randconfig-015-20240229   clang
i386                  randconfig-016-20240229   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
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
mips                  cavium_octeon_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
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
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
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
x86_64       buildonly-randconfig-001-20240229   gcc  
x86_64       buildonly-randconfig-002-20240229   clang
x86_64       buildonly-randconfig-003-20240229   gcc  
x86_64       buildonly-randconfig-004-20240229   gcc  
x86_64       buildonly-randconfig-005-20240229   gcc  
x86_64       buildonly-randconfig-006-20240229   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240229   clang
x86_64                randconfig-002-20240229   clang
x86_64                randconfig-003-20240229   clang
x86_64                randconfig-004-20240229   clang
x86_64                randconfig-005-20240229   clang
x86_64                randconfig-006-20240229   clang
x86_64                randconfig-011-20240229   gcc  
x86_64                randconfig-012-20240229   gcc  
x86_64                randconfig-013-20240229   gcc  
x86_64                randconfig-014-20240229   gcc  
x86_64                randconfig-015-20240229   gcc  
x86_64                randconfig-016-20240229   gcc  
x86_64                randconfig-071-20240229   clang
x86_64                randconfig-072-20240229   clang
x86_64                randconfig-073-20240229   clang
x86_64                randconfig-074-20240229   clang
x86_64                randconfig-075-20240229   gcc  
x86_64                randconfig-076-20240229   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

