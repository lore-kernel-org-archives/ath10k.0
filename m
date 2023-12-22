Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA629C46CD3
	for <ath10k@archiver.kernel.org>; Fri, 22 Dec 2023 03:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rXoKpo1DQe2TbagXahWyXjIX2hL7WBQfaPFR5Sgm1a0=; b=Mz+QF++Va/0w2oLjTY+ElvWWe3
	vZFkyEScV/6WyTvpiT7NFyb6XzZ0yq70t/T+Rf/OjAtOFVYcCAaJAZYuD/BfuRdjATZ7aEFrjZT6C
	iHd7uNX9LRkXpezqBavK4VCVNFlPmXUl95d2/9XfpwYVJJUGa8dQjvVV8nqUP5QSnVzN1k1hvFU0C
	YHY6JTrtZbQcwzcOzl0KWxzJrB3OaSWH6/HTQWHkoUNpSSbMhefWYTMAacio9Z3mog9VDnp9Ho8gv
	0HmV+7i//XiM3lQcFeS0ZRr0dIdCePjtB5en0BVGNP+tlwxNO7pXRTjrwyKSUHUGbb0jF5tUmCgXu
	8nEKU32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWHF-004lbQ-2x;
	Fri, 22 Dec 2023 03:32:45 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWHB-004lae-0z
	for ath10k@lists.infradead.org;
	Fri, 22 Dec 2023 03:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703215961; x=1734751961;
  h=date:from:to:cc:subject:message-id;
  bh=USXRamyhxUBT2HJOWyq8pN2O/sxo2Xphuq72ajhgEjA=;
  b=e1T/TNNIsEv5Q2StN5NXPcmLIyhMIireXMnT0ldytiql45zbIhU6ds1K
   xEYPA0nnM7WzLnStJzBjgYi6RWUAHWmaQZ6ffpoGp3ohaaOGQUCMCk+Sc
   JA2I99SbkXt2hwb4u/5wuHq8XScyoRdfwUfiY9PfVnYiVVJEshq5BIQbr
   Or5dyMC/LLn+Tjj5c6qpwgOyprO/TiOxgNbU2yGbJWwTA5cy8PRo+F56C
   p7YcUZlbSTRT6zYWdvkEUwaMTsLIHbkcJZElsnqJYNz3muJXZKD5N/Qso
   tSZTlW51o9PbigiDxZOTfnqDgpNiD5bVyA4RqUCQfxwl4NzHFXBkUOXyx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="427223744"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="427223744"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 19:32:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="18910800"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2023 19:32:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGWH6-00092M-0d;
	Fri, 22 Dec 2023 03:32:36 +0000
Date: Fri, 22 Dec 2023 11:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 d024f361d40f4ee09f675a4b8e6cd4872ba56653
Message-ID: <202312221101.hX5TSacF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_193241_415424_06AA755F 
X-CRM114-Status: UNSURE (   4.83  )
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
branch HEAD: d024f361d40f4ee09f675a4b8e6cd4872ba56653  Merge branch 'ath-next' into ath-qca

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-buildonly-randconfig-002-20231222
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-hid-intel-ish-hid-intel-ishtp.o
|-- i386-buildonly-randconfig-004-20231222
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-events-rapl.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-arch-x86-kernel-cpu-mce-mce-inject.o
|-- i386-buildonly-randconfig-005-20231222
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-mm-hwpoison-inject.o
|-- i386-randconfig-005-20231222
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-amilo-rfkill.o
`-- parisc-allmodconfig
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-mm-hwpoison-inject.o
clang_recent_errors
|-- i386-randconfig-016-20231222
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-amilo-rfkill.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-classmate-laptop.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-hid.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-platform-x86-intel-intel-vbtn.o
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-thermal-intel-intel_soc_dts_iosf.o
`-- powerpc-allmodconfig
    |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-dax-dax_pmem.o
    `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-mm-hwpoison-inject.o

elapsed time: 1960m

configs tested: 109
configs skipped: 1

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
arc                   randconfig-001-20231222   gcc  
arc                   randconfig-002-20231222   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20231222   gcc  
arm                   randconfig-002-20231222   gcc  
arm                   randconfig-003-20231222   gcc  
arm                   randconfig-004-20231222   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231222   gcc  
arm64                 randconfig-002-20231222   gcc  
arm64                 randconfig-003-20231222   gcc  
arm64                 randconfig-004-20231222   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231222   gcc  
csky                  randconfig-002-20231222   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231222   clang
hexagon               randconfig-002-20231222   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231222   gcc  
i386         buildonly-randconfig-002-20231222   gcc  
i386         buildonly-randconfig-003-20231222   gcc  
i386         buildonly-randconfig-004-20231222   gcc  
i386         buildonly-randconfig-005-20231222   gcc  
i386         buildonly-randconfig-006-20231222   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231222   gcc  
i386                  randconfig-002-20231222   gcc  
i386                  randconfig-003-20231222   gcc  
i386                  randconfig-004-20231222   gcc  
i386                  randconfig-005-20231222   gcc  
i386                  randconfig-006-20231222   gcc  
i386                  randconfig-011-20231222   clang
i386                  randconfig-012-20231222   clang
i386                  randconfig-013-20231222   clang
i386                  randconfig-014-20231222   clang
i386                  randconfig-015-20231222   clang
i386                  randconfig-016-20231222   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231222   gcc  
loongarch             randconfig-002-20231222   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231222   gcc  
nios2                 randconfig-002-20231222   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231222   gcc  
parisc                randconfig-002-20231222   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20231222   gcc  
powerpc               randconfig-002-20231222   gcc  
powerpc               randconfig-003-20231222   gcc  
powerpc64             randconfig-001-20231222   gcc  
powerpc64             randconfig-002-20231222   gcc  
powerpc64             randconfig-003-20231222   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20231222   gcc  
riscv                 randconfig-002-20231222   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231222   clang
s390                  randconfig-002-20231222   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20231222   gcc  
sh                    randconfig-002-20231222   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231222   gcc  
sparc64               randconfig-002-20231222   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20231222   gcc  
um                    randconfig-002-20231222   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231222   gcc  
xtensa                randconfig-002-20231222   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

