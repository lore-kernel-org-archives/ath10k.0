Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E92C54798
	for <ath10k@archiver.kernel.org>; Sat,  9 Mar 2024 06:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cnclts9bu2w96ic0EhVuLvo2SWHuy/w7itw66noTjEg=; b=sOjfqlhv+Fc2xAO5IAA6R+GLhu
	vITZ2nt6sjd07AsTCxF7SjDrd3ir6xZJ8G6RmL+QP7oOIGYHedmBD3PaTiE1AOB0pbJoXJW8NefTs
	Qp7xCNN/sL/uh92KvwqXI7WDQYShr+75iwGrrMoKtZL/uLYr6JRSoVKBl1DlL3tPvcBMdbqIGvMcc
	D2T3gB7tAdeHDG+K5kZ9t/U6uNQY+whB4r7eIaCkhiHI3lLmIhDbfQd0snHTrYHgNIsbc9xzb7Dj6
	vQdnHeLpFCDv/n1FHy4nTgu9KL9ESGiU0MFKLvumohacHbgDPT4ZD4+5OMt6+p0p9dUrWOBMh1QPt
	VtvIeetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riqGz-0000000Cfjj-0LP2;
	Sat, 09 Mar 2024 06:33:33 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riqGv-0000000Cfj0-1DmM
	for ath10k@lists.infradead.org;
	Sat, 09 Mar 2024 06:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709966009; x=1741502009;
  h=date:from:to:cc:subject:message-id;
  bh=lH/xkdYUjlgrtrJyV8jXBCcksIh3ox3/+CCzZb+T5bo=;
  b=iZG30OlJXNyYzIh/QdMOdaPrXc0kMAmTRbvlo+GNDxsh6gwzGTKGzZEP
   bWgnaxiKfDhCl/Yzuyu0PW6wJAY2Y/4o8kshaUv6DfogEbFRCzmLSx23i
   ItFrfdX8Y+xumJ/zKxd0apzRB+ln7vEn8EHM4reerhEn3sIT6cTeRjvGp
   kqqmwQrA4SdC/C09xl0AVqGykMaBBc8fVHnkd1BR3knQT/6+DVTdn4DkJ
   D11HL7R3XPhaBhGCLa4W8zhrq8rBmr3fWhX3VUcK0esUzqMatEKqiXQwn
   lsKU0KTU0nYHpPr/rSDPp8UxbLWnpg1shwYvgj2lLmuJID1XQ2Wdc/Oht
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="5292438"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="5292438"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 22:33:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="10675424"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 22:33:15 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riqGe-000731-1W;
	Sat, 09 Mar 2024 06:33:12 +0000
Date: Sat, 09 Mar 2024 14:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e57b7d62a1b2f496caf0beba81cec3c90fad80d5
Message-ID: <202403091403.ZOR2wz44-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_223329_400392_3C171CEF 
X-CRM114-Status: UNSURE (   3.73  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: e57b7d62a1b2f496caf0beba81cec3c90fad80d5  wifi: ath10k: poll service ready message before failing

elapsed time: 896m

configs tested: 162
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
arc                   randconfig-001-20240309   gcc  
arc                   randconfig-002-20240309   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   clang
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                            mps2_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-002-20240309   gcc  
arm                   randconfig-004-20240309   gcc  
arm                        spear6xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240309   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240309   gcc  
csky                  randconfig-002-20240309   gcc  
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
loongarch             randconfig-001-20240309   gcc  
loongarch             randconfig-002-20240309   gcc  
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
mips                      maltaaprp_defconfig   clang
mips                      pic32mzda_defconfig   gcc  
mips                          rb532_defconfig   clang
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240309   gcc  
nios2                 randconfig-002-20240309   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240309   gcc  
parisc                randconfig-002-20240309   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                      makalu_defconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc                      ppc40x_defconfig   clang
powerpc               randconfig-001-20240309   gcc  
powerpc64             randconfig-001-20240309   gcc  
powerpc64             randconfig-002-20240309   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20240309   gcc  
riscv                 randconfig-002-20240309   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240309   gcc  
sh                    randconfig-002-20240309   gcc  
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
sparc64               randconfig-001-20240309   gcc  
sparc64               randconfig-002-20240309   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240309   gcc  
xtensa                randconfig-002-20240309   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

