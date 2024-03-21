Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBC0C54E68
	for <ath10k@archiver.kernel.org>; Thu, 21 Mar 2024 03:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ImznnTlrVotzwohJBaBiiW4QNas37OMFWCPU5b7o/PQ=; b=Af/ciS2FWbtIq/4cLrQh6I24To
	AXqCI9uaU+abEOSSoLi8Bo/kM5ks+PuX5XXO0tyxfgaZuRSMiH+TiyvHsIA58u2fPLnkbQMolld02
	/g+3mSBrKxddqQlNr3gclw+MgL3mn/4iZ+P7PbakUQ473cjngYI876BJbdWqpRUmgrPrU5/Qrv44i
	/j6OVt4XVoRmufVzAWIGSMC3sKxqMJo4vogpgbSw8amNwFa0yRUGKjzHNnWbyFUfSPAVW2eRy1oZy
	dFdDGq4hfslLQDgpyLfgRklGXwhJyGebxNXFR1mIYvviLtd+Z94nXATgpo92SAoWSM7UtujAGpy9I
	WiMWGaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn98X-00000001i7Y-0kdN;
	Thu, 21 Mar 2024 03:30:37 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn98U-00000001i6w-09X4
	for ath10k@lists.infradead.org;
	Thu, 21 Mar 2024 03:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710991834; x=1742527834;
  h=date:from:to:cc:subject:message-id;
  bh=19H7TQSrGUgcdMEXtjfTxOVol0u84bHU5cpzhK8pqoU=;
  b=KbMPRSid4BU2LxEZAnY4P9aswgGwY3gUIYVsxNE9y8glYilGl7FE/1tL
   8TjyAvTyCaz5bmHgdWSlWKRoG63W8Xd+d7PyrJUyaeX/DAybQYtDBaQzG
   Ir08yedyZTy/MsX6eiuuOYl2bOJK7hsuYFbz6Rakkuzg/0GWg/zC6+hY0
   Ps2TE8/tmenWWubAYrs63jnFfrLodkHtpWfqF9a25Y01NJc5oRElZgGW6
   b/gBZ3Wxt8Q6YEVON2O5A78EVaQJkkPc6WKWtk14xFOjqYEWcBUKXwIex
   HyA/roR9tLICnSGv5Iib6INgrWoVeWirGMTtJkqg+wc8dAyUjtbbUmERu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6074941"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="6074941"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 20:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="18837344"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2024 20:30:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rn98P-000J7Y-1B;
	Thu, 21 Mar 2024 03:30:29 +0000
Date: Thu, 21 Mar 2024 11:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 11181026d9754b99feec6dad63d7bfad0d4055dc
Message-ID: <202403211159.mQBDgDc1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_203034_348187_494B32A0 
X-CRM114-Status: UNSURE (   3.83  )
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
branch HEAD: 11181026d9754b99feec6dad63d7bfad0d4055dc  wifi: ath11k: remove duplicate definitions in wmi.h

elapsed time: 733m

configs tested: 179
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
arc                   randconfig-001-20240321   gcc  
arc                   randconfig-002-20240321   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   clang
arm                          ep93xx_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240321   clang
arm                   randconfig-002-20240321   gcc  
arm                   randconfig-003-20240321   clang
arm                   randconfig-004-20240321   clang
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240321   clang
arm64                 randconfig-002-20240321   clang
arm64                 randconfig-003-20240321   clang
arm64                 randconfig-004-20240321   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240321   gcc  
csky                  randconfig-002-20240321   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240321   clang
hexagon               randconfig-002-20240321   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240321   gcc  
i386         buildonly-randconfig-002-20240321   gcc  
i386         buildonly-randconfig-003-20240321   clang
i386         buildonly-randconfig-004-20240321   clang
i386         buildonly-randconfig-005-20240321   gcc  
i386         buildonly-randconfig-006-20240321   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240321   clang
i386                  randconfig-002-20240321   gcc  
i386                  randconfig-003-20240321   gcc  
i386                  randconfig-004-20240321   clang
i386                  randconfig-005-20240321   clang
i386                  randconfig-006-20240321   gcc  
i386                  randconfig-011-20240321   clang
i386                  randconfig-012-20240321   gcc  
i386                  randconfig-013-20240321   gcc  
i386                  randconfig-014-20240321   gcc  
i386                  randconfig-015-20240321   gcc  
i386                  randconfig-016-20240321   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240321   gcc  
loongarch             randconfig-002-20240321   gcc  
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
mips                malta_qemu_32r6_defconfig   gcc  
mips                           mtx1_defconfig   clang
mips                   sb1250_swarm_defconfig   gcc  
mips                           xway_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240321   gcc  
nios2                 randconfig-002-20240321   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240321   gcc  
parisc                randconfig-002-20240321   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      cm5200_defconfig   clang
powerpc                   currituck_defconfig   clang
powerpc                  iss476-smp_defconfig   gcc  
powerpc                       maple_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc               randconfig-001-20240321   clang
powerpc               randconfig-002-20240321   gcc  
powerpc               randconfig-003-20240321   clang
powerpc64             randconfig-001-20240321   clang
powerpc64             randconfig-002-20240321   clang
powerpc64             randconfig-003-20240321   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240321   clang
riscv                 randconfig-002-20240321   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240321   clang
s390                  randconfig-002-20240321   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240321   gcc  
sh                    randconfig-002-20240321   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240321   gcc  
sparc64               randconfig-002-20240321   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240321   gcc  
um                    randconfig-002-20240321   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240321   gcc  
x86_64       buildonly-randconfig-002-20240321   clang
x86_64       buildonly-randconfig-003-20240321   clang
x86_64       buildonly-randconfig-004-20240321   clang
x86_64       buildonly-randconfig-005-20240321   clang
x86_64       buildonly-randconfig-006-20240321   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240321   gcc  
x86_64                randconfig-002-20240321   clang
x86_64                randconfig-003-20240321   gcc  
x86_64                randconfig-004-20240321   gcc  
x86_64                randconfig-005-20240321   gcc  
x86_64                randconfig-006-20240321   gcc  
x86_64                randconfig-011-20240321   clang
x86_64                randconfig-012-20240321   gcc  
x86_64                randconfig-013-20240321   clang
x86_64                randconfig-014-20240321   gcc  
x86_64                randconfig-015-20240321   gcc  
x86_64                randconfig-016-20240321   gcc  
x86_64                randconfig-071-20240321   clang
x86_64                randconfig-072-20240321   gcc  
x86_64                randconfig-073-20240321   gcc  
x86_64                randconfig-074-20240321   clang
x86_64                randconfig-075-20240321   clang
x86_64                randconfig-076-20240321   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240321   gcc  
xtensa                randconfig-002-20240321   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

