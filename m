Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D04EC67861
	for <ath10k@archiver.kernel.org>; Tue,  9 Apr 2024 05:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yeWKrsWLvilMkJgXaMwoZ77arz1bRxPVR8YBD/q1Wlk=; b=ahhILgvGONPFF5bWyQEjXgvyUw
	/rqntO0jcI6w/7a+8JHsoH3/vhI/6o++ry45oBFtRM8QE+quhqyYNSqZN9pCJWE3qKO4AQ+vcKIox
	pbS6bpAunbEpZaaYszLiUeEgJLRT9HQEhu3qt48HZqrEfLsoW6cHFj3pl9GeJ6tASOUtG2n2rxDwc
	eRyf4Zbjg4qGT5mdNmGb/S1zesy7NC3qo8PVr97aPMTmsRI/l9UmpLdQrl3dlsr5vNZwLkV8ZBleF
	gOj/ZR0c0KqHwHJY/ciSFgn9nr7jAq9lnm1G2aJ9ROis4PkWPrOKLk5pBmHv7ss3VNOGbaHQBoIiu
	prsDb/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru40R-00000000Pzy-3Bmr;
	Tue, 09 Apr 2024 05:26:51 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru40O-00000000PzM-1QoS
	for ath10k@lists.infradead.org;
	Tue, 09 Apr 2024 05:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712640408; x=1744176408;
  h=date:from:to:cc:subject:message-id;
  bh=4jEh1NmG75fYgEEgXPmGTJ+2NxWuZAN5iYYYRXcLL98=;
  b=aP39vhJRayHK6k5IijQpL4kda0JSn3/XjCCcsquOfpjM4y4CODkfIRC1
   3G48F0/8yAD3N5whelqo5YGfXwpP4YDcfEPLAh5PBWnMVVd3NGYmsZMAQ
   FzGKCxhK9va1ZeSnkmds0VzpK8h5jGQsDlzWIYK6fJ+kCM3ZNWTWu6Tm4
   Gbuot+vNFYVA1J8E53UGdhtGa2yIoxnA7NkuC/y+Ztwqu/Ngr4nc2l9iE
   qGJWyUO/DvcOZTBdGFHD0zuRoBPOVc86lKDwt/FV3mguf/2+d/xJBL13U
   jxy8uJ2kVwJOVuj/0dvnCNa5l3wnn8clCQNo31ts1Dr8oBpCj6mNFK5TE
   g==;
X-CSE-ConnectionGUID: FqyNyR+cTzCJzucQWDhQEQ==
X-CSE-MsgGUID: A0gdnQIPSomRR06SyH+8Hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8066018"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="8066018"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 22:26:43 -0700
X-CSE-ConnectionGUID: w3odS4kISqmFqzwfjA1xAg==
X-CSE-MsgGUID: KnlKjYxrRiaQdM9QxFTc5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="24749292"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2024 22:26:41 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru40F-0005lk-1t;
	Tue, 09 Apr 2024 05:26:39 +0000
Date: Tue, 09 Apr 2024 13:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4747c5397a989d69786903c6fe1a6d01efbd899d
Message-ID: <202404091351.98lIIKWq-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_222648_453076_8A331F7B 
X-CRM114-Status: UNSURE (   3.40  )
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
branch HEAD: 4747c5397a989d69786903c6fe1a6d01efbd899d  Merge branch 'pending' into master-pending

elapsed time: 855m

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
arc                   randconfig-001-20240409   gcc  
arc                   randconfig-002-20240409   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   clang
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                            hisi_defconfig   gcc  
arm                   randconfig-001-20240409   gcc  
arm                   randconfig-002-20240409   clang
arm                   randconfig-003-20240409   clang
arm                   randconfig-004-20240409   gcc  
arm                        spear6xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240409   gcc  
arm64                 randconfig-002-20240409   gcc  
arm64                 randconfig-003-20240409   clang
arm64                 randconfig-004-20240409   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240409   gcc  
csky                  randconfig-002-20240409   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240409   clang
hexagon               randconfig-002-20240409   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240409   clang
i386         buildonly-randconfig-002-20240409   clang
i386         buildonly-randconfig-003-20240409   gcc  
i386         buildonly-randconfig-004-20240409   clang
i386         buildonly-randconfig-005-20240409   gcc  
i386         buildonly-randconfig-006-20240409   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240409   clang
i386                  randconfig-002-20240409   gcc  
i386                  randconfig-003-20240409   clang
i386                  randconfig-004-20240409   gcc  
i386                  randconfig-005-20240409   gcc  
i386                  randconfig-006-20240409   clang
i386                  randconfig-011-20240409   gcc  
i386                  randconfig-012-20240409   clang
i386                  randconfig-013-20240409   clang
i386                  randconfig-014-20240409   clang
i386                  randconfig-015-20240409   gcc  
i386                  randconfig-016-20240409   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240409   gcc  
loongarch             randconfig-002-20240409   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   gcc  
mips                     loongson1b_defconfig   clang
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240409   gcc  
nios2                 randconfig-002-20240409   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240409   gcc  
parisc                randconfig-002-20240409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      chrp32_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc                       maple_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc               randconfig-001-20240409   clang
powerpc               randconfig-002-20240409   gcc  
powerpc               randconfig-003-20240409   clang
powerpc64             randconfig-001-20240409   gcc  
powerpc64             randconfig-002-20240409   clang
powerpc64             randconfig-003-20240409   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240409   clang
riscv                 randconfig-002-20240409   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240409   gcc  
s390                  randconfig-002-20240409   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20240409   gcc  
sh                    randconfig-002-20240409   gcc  
sh                           se7780_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240409   gcc  
sparc64               randconfig-002-20240409   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240409   clang
um                    randconfig-002-20240409   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240409   gcc  
xtensa                randconfig-002-20240409   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

