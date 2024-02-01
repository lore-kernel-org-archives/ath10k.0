Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E34DC4828D
	for <ath10k@archiver.kernel.org>; Thu,  1 Feb 2024 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tzmWwXzigzyyazJWE9ey8puKXyt7Vty8l60dtt6HOKE=; b=0pTzULLzhqJZvEn70CMQsucZtQ
	dGNo3Ine/egYOYXRJdFn5QbJFZ+Afo+KCKDxtAeANrmUgTmye9Iy2/1B5eAaWsMAm4YePTKjCwUsN
	v6RWqB3pOVGp73YyayqvWmaKTGCuSj8I1FHI5jj02WWxllsP2kgNQ8A0cCzOhjrKAUs/c4vzZnbTY
	gXrkq7nArEF9SLRt8DHbW/Vg4Pi1kePtYbgY0/ri5Kw8jVwAGTa3cejFX8AlQe7+eOyg3MGVMcPN6
	6nNTMifVqT+2m72+xlVA4Xpr3Jddfo1r0lLq+6/BEakBoFKjtczdPrcwTJBhvpUyns0Fnoj6hd3Wc
	ZEsWtxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVdLC-00000009Fdy-30OK;
	Thu, 01 Feb 2024 20:07:18 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVdLA-00000009FdS-3dLZ
	for ath10k@lists.infradead.org;
	Thu, 01 Feb 2024 20:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706818036; x=1738354036;
  h=date:from:to:cc:subject:message-id;
  bh=TLT0pSQrnYzGlfbM+qsiPTXgvjAuXR8cBY/FEdVH5aA=;
  b=IxE//TBBCgmrLodPwbvJ9hiKUzpV8xs5ieKyA1r+c6z40euZ8uRoP8UH
   LbTwryzK0AzIpOwvVP6viskmjEGyzursbDaXapywaBlQTQAYYGGfjWdXt
   YZKnJSC3QMjrmSuyyQjT+rZbP4iFUjnDyVpVQvfp/4XHgq8VJ/7Hcb564
   c14iLCJsG5vy9EKv/UCPOtoLO0Kv7dAaAu9nZgVKE6vWoc6zgKh7wuFLC
   Uavpemd8JmkevNNJxdqgoyroo7D+Bu1vYqzQYG5N6IlbD+g7G/39yrVY2
   IZikB5m1NaKrWOtYs9YvBD1+h7mrZULT0cwyZga97DRQp5YK1sB+ab2gc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="468222613"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="468222613"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:07:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4519348"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Feb 2024 12:07:15 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVdL5-00038W-1m;
	Thu, 01 Feb 2024 20:07:11 +0000
Date: Fri, 02 Feb 2024 04:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 d4d13947306ab3c98c84389d9397563b550b71b8
Message-ID: <202402020405.GT0YJmdg-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_120716_977609_88EC4DCC 
X-CRM114-Status: UNSURE (   4.48  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: d4d13947306ab3c98c84389d9397563b550b71b8  Add localversion-wireless-testing-ath

elapsed time: 1474m

configs tested: 173
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240201   gcc  
arc                   randconfig-002-20240201   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                   randconfig-001-20240201   gcc  
arm                   randconfig-002-20240201   gcc  
arm                   randconfig-003-20240201   gcc  
arm                   randconfig-004-20240201   gcc  
arm                         s5pv210_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240201   gcc  
arm64                 randconfig-002-20240201   gcc  
arm64                 randconfig-003-20240201   gcc  
arm64                 randconfig-004-20240201   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240201   gcc  
csky                  randconfig-002-20240201   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240201   clang
hexagon               randconfig-002-20240201   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240201   gcc  
i386         buildonly-randconfig-002-20240201   gcc  
i386         buildonly-randconfig-003-20240201   gcc  
i386         buildonly-randconfig-004-20240201   gcc  
i386         buildonly-randconfig-005-20240201   gcc  
i386         buildonly-randconfig-006-20240201   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240201   gcc  
i386                  randconfig-002-20240201   gcc  
i386                  randconfig-003-20240201   gcc  
i386                  randconfig-004-20240201   gcc  
i386                  randconfig-005-20240201   gcc  
i386                  randconfig-006-20240201   gcc  
i386                  randconfig-011-20240201   clang
i386                  randconfig-012-20240201   clang
i386                  randconfig-013-20240201   clang
i386                  randconfig-014-20240201   clang
i386                  randconfig-015-20240201   clang
i386                  randconfig-016-20240201   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240201   gcc  
loongarch             randconfig-002-20240201   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240201   gcc  
nios2                 randconfig-002-20240201   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240201   gcc  
parisc                randconfig-002-20240201   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                      ppc40x_defconfig   clang
powerpc               randconfig-001-20240201   gcc  
powerpc               randconfig-002-20240201   gcc  
powerpc               randconfig-003-20240201   gcc  
powerpc                     taishan_defconfig   clang
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240201   gcc  
powerpc64             randconfig-002-20240201   gcc  
powerpc64             randconfig-003-20240201   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240201   gcc  
riscv                 randconfig-002-20240201   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240201   clang
s390                  randconfig-002-20240201   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240201   gcc  
sh                    randconfig-002-20240201   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240201   gcc  
sparc64               randconfig-002-20240201   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240201   gcc  
um                    randconfig-002-20240201   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240201   clang
x86_64       buildonly-randconfig-002-20240201   clang
x86_64       buildonly-randconfig-003-20240201   clang
x86_64       buildonly-randconfig-004-20240201   clang
x86_64       buildonly-randconfig-005-20240201   clang
x86_64       buildonly-randconfig-006-20240201   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240201   clang
x86_64                randconfig-002-20240201   gcc  
x86_64                randconfig-003-20240201   gcc  
x86_64                randconfig-004-20240201   gcc  
x86_64                randconfig-005-20240201   gcc  
x86_64                randconfig-006-20240201   clang
x86_64                randconfig-011-20240201   clang
x86_64                randconfig-012-20240201   gcc  
x86_64                randconfig-013-20240201   gcc  
x86_64                randconfig-014-20240201   clang
x86_64                randconfig-015-20240201   gcc  
x86_64                randconfig-016-20240201   gcc  
x86_64                randconfig-071-20240201   gcc  
x86_64                randconfig-072-20240201   clang
x86_64                randconfig-073-20240201   clang
x86_64                randconfig-074-20240201   gcc  
x86_64                randconfig-075-20240201   clang
x86_64                randconfig-076-20240201   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240201   gcc  
xtensa                randconfig-002-20240201   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

