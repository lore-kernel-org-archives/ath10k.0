Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3F0C54E58
	for <ath10k@archiver.kernel.org>; Tue, 12 Mar 2024 01:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ap71QLUmOn2qF7ZBev4ddOVadIVCKRr8g0XZHBpPA6I=; b=v3utkxdI3GfIoPzjoqJFpcRFtD
	quzt1N8S90MGJUVlJjf0V/oAlnpvv3OVX9uKh42W0AvZYJgRzmpveSI0TCJMKgXPCm6XGk1roWuPj
	+ckfL433WKP4l4CTFVJj8kLVa0SI76bkk3MmaWwWMKNSkCD0VzQlfUw73c4Aj1o0V+P83eEJYXbo8
	jHWQjRZ8Td3JSdV2wJIzWev30uL0g7v+oWRbHZqdQqGm/+dMwDjas+BoQk9sAT//fbLvi2i4zQfHZ
	Xz7E73ElG4ZVS4lwACn7KKK9eN0OJe3n2NSvef5pyHsOgQjZtSMUl0v37ux1AK/cqGGw5pQEipgiZ
	n/1IdA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjqnO-00000003n5F-0PVk;
	Tue, 12 Mar 2024 01:19:10 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjqnK-00000003n4R-49aE
	for ath10k@lists.infradead.org;
	Tue, 12 Mar 2024 01:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710206348; x=1741742348;
  h=date:from:to:cc:subject:message-id;
  bh=+qAeFYcmRXoQebUIOyClD6bu/wj1BP4UNOlKbCVWIr4=;
  b=epS06KmUzHIPQyDOP6Eb6GtY83dR1EFVASDwIbv/JXmyuC+SizyR1wA+
   RfWPpRIF1728ZMIrwwiUG4NMH19LgnKUrE5WlJ3JtrW+KWwlPYW8kl1ZR
   0h1XxBjfTmm3r6WPc+DYT7Nz9UU54SVHfwRLv/9k++3bO1bbdpqY2m44w
   1KzjBVjQP46bULCuA4FWcavKI1kcCAKxP2DWSpIm2Vk57lr9EUyreTKkA
   qXVOGTWZ/tjQt6dYj5vSKis8tAz0WeZ6idzkIul85ca9u24nYf+CvPWnC
   FjBFnZ1YDADYhM5G/AGizKPBojEaC4Q4CQ/bNpir9YwYL9xOc15Ir6MTy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15460028"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="15460028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 18:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="48809835"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Mar 2024 18:19:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjqnG-0009bS-1j;
	Tue, 12 Mar 2024 01:19:02 +0000
Date: Tue, 12 Mar 2024 09:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 a368b0a9854ee2a466a55f95c0ce2208e4aaf0b0
Message-ID: <202403120915.FWG75icJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_181907_169049_4015DDC8 
X-CRM114-Status: UNSURE (   4.52  )
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
branch HEAD: a368b0a9854ee2a466a55f95c0ce2208e4aaf0b0  wifi: ath11k: adjust a comment to reflect reality

elapsed time: 736m

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
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240312   gcc  
arc                   randconfig-002-20240312   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   clang
arm                          pxa3xx_defconfig   clang
arm                   randconfig-001-20240312   clang
arm                   randconfig-002-20240312   gcc  
arm                   randconfig-003-20240312   gcc  
arm                   randconfig-004-20240312   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240312   gcc  
arm64                 randconfig-002-20240312   gcc  
arm64                 randconfig-003-20240312   gcc  
arm64                 randconfig-004-20240312   clang
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
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                         db1xxx_defconfig   clang
mips                    maltaup_xpa_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240312   gcc  
nios2                 randconfig-002-20240312   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
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
powerpc                          g5_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc               randconfig-001-20240312   gcc  
powerpc               randconfig-002-20240312   clang
powerpc               randconfig-003-20240312   gcc  
powerpc                     tqm8540_defconfig   gcc  
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
s390                          debug_defconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240312   clang
s390                  randconfig-002-20240312   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                    randconfig-001-20240312   gcc  
sh                    randconfig-002-20240312   gcc  
sh                           sh2007_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
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
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

