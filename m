Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97B2C25B75
	for <ath10k@archiver.kernel.org>; Sun, 12 May 2024 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NI/7nayfgJ58i3hOxC9cKIb7lyoddzzk22KPOY/Vpvw=; b=zQgIS+L5LF917kmhA6rn1Fp+uW
	MNm6/ULJeKyLYYfpBrzEe+smbgzA/RU7lr4bLpx3G6G3O7OXR2svGi7IpgGKFeExYoEC9VPLPjdX+
	ZdmiuwHNsq4MPgw47aXVqfjhI1wnzpPS0XtGo0mrCkoUcA3fILNpUMUkStaIPxH0H7IJL7zbHOE/C
	xalwHNammBlV2nRtkhXeFlGXTeWnIcxtlZHGkO9Mof29ObNJ4e8+qB6Dz7gj+P5xppbqkZYfOUoSV
	L6URSaONdoPMK/oXjICwQ5MxM/e5n5Jm9RgLegRwdPG7JYwmZatltzlX/FRFFO+9CO8TNiC/V3DBV
	QPulcRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6APp-0000000A7eB-3Ekv;
	Sun, 12 May 2024 14:43:05 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6APm-0000000A7dM-1Qh9
	for ath10k@lists.infradead.org;
	Sun, 12 May 2024 14:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715524982; x=1747060982;
  h=date:from:to:cc:subject:message-id;
  bh=dxhz9nkpsnYRUtoCirGXW4ya0ooDE8bhAz7lPpeenfE=;
  b=QDuhif2NLqISzQEDn5I6kazozjsbHTeqvW4NigEIDqZ4XT6D3GUNeX/x
   xSAr2H6jurRzz4SE5azDHozH2A+Ry8mRlTM3cZdj8fQ2TEjr7kpsRt99/
   yXQ3tszX3Wu4Cu4cDUY/0qOwyZD9Ihzi9C9i7iERKcxodc3EY4q9KL7ZJ
   cAtJnN+O8yubObLJxWj2RZ5eGR9/NBCqvhX2Fy4KgLdVmjNdBQkGbsvA0
   qV2KVGXOkNZvahu9ha4OzyMTLbLSjPG4Qd4rKeW6E1Q69rrGHIh8MEIlL
   sbsaqEPIkosUUdqjduLUzS+DajoqUKhJqIQSbujly3vOIrZuNirW3m6WM
   w==;
X-CSE-ConnectionGUID: FY2NY95fSU6R0cl45Z1BVw==
X-CSE-MsgGUID: 6Y4LTXseTmew9AmMrAdFFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11619338"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="11619338"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 07:42:59 -0700
X-CSE-ConnectionGUID: KZRaLJu+RRmUMJjN7Dh1Dg==
X-CSE-MsgGUID: PFFgMT3vTbSmXws8mPRbvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="67596328"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 May 2024 07:42:59 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6APg-0008eV-0o;
	Sun, 12 May 2024 14:42:56 +0000
Date: Sun, 12 May 2024 22:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 da1d4fd072856a43f4b93ec29b6d8c3c622e7556
Message-ID: <202405122213.crLSJClj-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_074302_650759_D80FC727 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: da1d4fd072856a43f4b93ec29b6d8c3c622e7556  Merge branch 'pending' into master-pending

elapsed time: 1450m

configs tested: 162
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
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240512   gcc  
arc                   randconfig-002-20240512   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   clang
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240512   gcc  
arm                   randconfig-002-20240512   clang
arm                   randconfig-003-20240512   clang
arm                   randconfig-004-20240512   gcc  
arm                       versatile_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240512   clang
arm64                 randconfig-002-20240512   clang
arm64                 randconfig-003-20240512   clang
arm64                 randconfig-004-20240512   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240512   gcc  
csky                  randconfig-002-20240512   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240512   clang
hexagon               randconfig-002-20240512   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240512   gcc  
i386         buildonly-randconfig-002-20240512   clang
i386         buildonly-randconfig-003-20240512   gcc  
i386         buildonly-randconfig-004-20240512   gcc  
i386         buildonly-randconfig-005-20240512   gcc  
i386         buildonly-randconfig-006-20240512   clang
i386                                defconfig   clang
i386                  randconfig-001-20240512   clang
i386                  randconfig-002-20240512   clang
i386                  randconfig-003-20240512   clang
i386                  randconfig-004-20240512   gcc  
i386                  randconfig-005-20240512   clang
i386                  randconfig-006-20240512   clang
i386                  randconfig-011-20240512   gcc  
i386                  randconfig-012-20240512   clang
i386                  randconfig-013-20240512   gcc  
i386                  randconfig-014-20240512   clang
i386                  randconfig-015-20240512   gcc  
i386                  randconfig-016-20240512   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240512   gcc  
loongarch             randconfig-002-20240512   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240512   gcc  
nios2                 randconfig-002-20240512   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240512   gcc  
parisc                randconfig-002-20240512   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-001-20240512   clang
powerpc               randconfig-002-20240512   clang
powerpc               randconfig-003-20240512   clang
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
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
x86_64       buildonly-randconfig-001-20240512   clang
x86_64       buildonly-randconfig-002-20240512   clang
x86_64       buildonly-randconfig-003-20240512   clang
x86_64       buildonly-randconfig-004-20240512   gcc  
x86_64       buildonly-randconfig-005-20240512   clang
x86_64       buildonly-randconfig-006-20240512   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240512   gcc  
x86_64                randconfig-002-20240512   gcc  
x86_64                randconfig-003-20240512   clang
x86_64                randconfig-004-20240512   gcc  
x86_64                randconfig-005-20240512   gcc  
x86_64                randconfig-006-20240512   gcc  
x86_64                randconfig-011-20240512   gcc  
x86_64                randconfig-012-20240512   gcc  
x86_64                randconfig-013-20240512   clang
x86_64                randconfig-014-20240512   gcc  
x86_64                randconfig-015-20240512   clang
x86_64                randconfig-016-20240512   clang
x86_64                randconfig-071-20240512   clang
x86_64                randconfig-072-20240512   gcc  
x86_64                randconfig-073-20240512   gcc  
x86_64                randconfig-074-20240512   clang
x86_64                randconfig-075-20240512   clang
x86_64                randconfig-076-20240512   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

