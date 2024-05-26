Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33259C25B75
	for <ath10k@archiver.kernel.org>; Sun, 26 May 2024 05:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Ofd9sOYAgYaNk9YqPTml63jDCbzHT+X/2rVyDjcduQ=; b=VaOx3kNtFBif3+EfumVVaeMlaT
	lTzLeA3gXS+usJOZbwLXtL9tOT7NA44pmzRuXim5RGijbAMgZQF+UdL6Qt+R4Yym3VvfTJGaKaJDp
	cw6Uy+jk4JCI77NxQq4RVCOq1SwQloFJwQRxD+yd2q2ipHRx7eTy4dNQvWeOhUk0OFbpQZZEzk6pc
	b2haoYf/YkiX65XQKYvAY2eMrR332xEkcqawL9bHlSDMiIWU5GDrdRCN5zKyapPwDXCrJQZD9giLT
	OLy5D4S/ZDArCicFjyf0DtTrKuGc8kFbQiZhjW2c1OIfZ4pt+Nlf2akcJAcDsNNzy6J/Cuv1HXbx+
	JKqOl/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB6N3-0000000CBiQ-2XGi;
	Sun, 26 May 2024 05:24:37 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB6N0-0000000CBi3-3Cqj
	for ath10k@lists.infradead.org;
	Sun, 26 May 2024 05:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716701074; x=1748237074;
  h=date:from:to:cc:subject:message-id;
  bh=RP2cpU9OeTGVR4tsZkF0f0kCQ6UEeInZ5srynuzdIJU=;
  b=PsxG6dUbNhl4iQiT5H/4chv+MRCvLnzNHufmepl8J2sDJACpjTX6jm41
   +6JBi7JUpH7H9NDGA523wlwMufDXnQ3NyuRZY8BzztsRCLMdkD+Bp6f7c
   C+/a5PCjXJu3BRMiIpZgaAYpwFhOIJ1CnwCAeUZcIf7f1RzcEKOQEfX7C
   XGpN6rTYPYkBBGeIv9Lr0ZRkD5e9bzMr6wzOCku3KirkDQY+cnCCTRhIT
   5BUZOYVbzBs4TZHO+ptgZiW5ykLzbXQvsJBwYLBTW1PD4aclZJ+M74y32
   6k0YGRVDtgPSIilWpWWokY87xY0wcDnw1DNzTXR7w6zUs7W9U8CoWu7mQ
   w==;
X-CSE-ConnectionGUID: c08aHtRkSF+dWJhdi9b1fw==
X-CSE-MsgGUID: 7OKB41HeTh+sVJ6ohfZMkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="12815165"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="12815165"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 22:24:29 -0700
X-CSE-ConnectionGUID: 2nCZYbOsTKW2g6iF5VtUBg==
X-CSE-MsgGUID: XncO1dOHSY+KlHxaWKjtUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="65229164"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 May 2024 22:24:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB6Mr-0007lF-2l;
	Sun, 26 May 2024 05:24:26 +0000
Date: Sun, 26 May 2024 13:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 68eaacb5ce0b7ce33f5524fc01c98dde66988412
Message-ID: <202405261339.TGQLjsAO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_222434_893824_6A326DBF 
X-CRM114-Status: UNSURE (   4.19  )
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
branch HEAD: 68eaacb5ce0b7ce33f5524fc01c98dde66988412  wifi: ath12k: fix wrong definition of CE ring's base address

elapsed time: 1180m

configs tested: 176
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
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240526   gcc  
arc                   randconfig-002-20240526   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-002-20240526   gcc  
arm                   randconfig-004-20240526   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240526   gcc  
arm64                 randconfig-003-20240526   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240526   gcc  
csky                  randconfig-002-20240526   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240525   gcc  
i386         buildonly-randconfig-002-20240525   gcc  
i386         buildonly-randconfig-002-20240526   gcc  
i386         buildonly-randconfig-003-20240525   gcc  
i386         buildonly-randconfig-003-20240526   gcc  
i386         buildonly-randconfig-004-20240525   clang
i386         buildonly-randconfig-005-20240525   gcc  
i386         buildonly-randconfig-006-20240525   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240525   clang
i386                  randconfig-002-20240525   gcc  
i386                  randconfig-003-20240525   clang
i386                  randconfig-004-20240525   clang
i386                  randconfig-005-20240525   gcc  
i386                  randconfig-005-20240526   gcc  
i386                  randconfig-006-20240525   gcc  
i386                  randconfig-011-20240525   clang
i386                  randconfig-012-20240525   clang
i386                  randconfig-012-20240526   gcc  
i386                  randconfig-013-20240525   clang
i386                  randconfig-013-20240526   gcc  
i386                  randconfig-014-20240525   gcc  
i386                  randconfig-014-20240526   gcc  
i386                  randconfig-015-20240525   clang
i386                  randconfig-015-20240526   gcc  
i386                  randconfig-016-20240525   gcc  
i386                  randconfig-016-20240526   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240526   gcc  
loongarch             randconfig-002-20240526   gcc  
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
mips                           ip32_defconfig   clang
mips                     loongson1b_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240526   gcc  
nios2                 randconfig-002-20240526   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240526   gcc  
parisc                randconfig-002-20240526   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-003-20240526   gcc  
powerpc64             randconfig-002-20240526   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240526   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240526   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240526   gcc  
sh                    randconfig-002-20240526   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240526   gcc  
sparc64               randconfig-002-20240526   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240525   clang
x86_64       buildonly-randconfig-001-20240526   clang
x86_64       buildonly-randconfig-002-20240526   clang
x86_64       buildonly-randconfig-003-20240526   gcc  
x86_64       buildonly-randconfig-004-20240526   clang
x86_64       buildonly-randconfig-005-20240526   clang
x86_64       buildonly-randconfig-006-20240526   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240525   clang
x86_64                randconfig-001-20240526   clang
x86_64                randconfig-002-20240525   clang
x86_64                randconfig-002-20240526   clang
x86_64                randconfig-003-20240525   clang
x86_64                randconfig-003-20240526   clang
x86_64                randconfig-004-20240525   clang
x86_64                randconfig-004-20240526   gcc  
x86_64                randconfig-005-20240525   clang
x86_64                randconfig-005-20240526   gcc  
x86_64                randconfig-006-20240525   clang
x86_64                randconfig-006-20240526   clang
x86_64                randconfig-011-20240525   clang
x86_64                randconfig-011-20240526   gcc  
x86_64                randconfig-012-20240525   clang
x86_64                randconfig-012-20240526   gcc  
x86_64                randconfig-013-20240526   gcc  
x86_64                randconfig-014-20240525   clang
x86_64                randconfig-014-20240526   gcc  
x86_64                randconfig-015-20240526   gcc  
x86_64                randconfig-016-20240525   clang
x86_64                randconfig-016-20240526   clang
x86_64                randconfig-071-20240526   gcc  
x86_64                randconfig-072-20240525   clang
x86_64                randconfig-072-20240526   clang
x86_64                randconfig-073-20240525   clang
x86_64                randconfig-073-20240526   clang
x86_64                randconfig-074-20240526   clang
x86_64                randconfig-075-20240526   clang
x86_64                randconfig-076-20240525   clang
x86_64                randconfig-076-20240526   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240526   gcc  
xtensa                randconfig-002-20240526   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

