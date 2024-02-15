Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2BDC48BEB
	for <ath10k@archiver.kernel.org>; Thu, 15 Feb 2024 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hlZvq+v3bHzI500fdBJpFqnV1NrOCk4GJoQH0W9FSLI=; b=Att8Ndzgw/phwecuLS5FNINx6B
	mAYCBeNfAXlk1nCpAYCmxv10wFxaqBsxFijPLkW0qE7cwTeZCbpMhIbvmtJ7Djm2RZ7HnrRMFNMWF
	nK15eVYgvGi30RfI0+ofuDFiM1ZSwiScZnlATTmphw1VtUfzFtHCrcUe2m87M9eIFNOVI6EsgFoWi
	e3NKxEn0U1N6cEnfZTaFHId02XKSSLipUpOsV1PFvsVwfb2I4xvCFksIWIyneOoaGrchM0F0DjD/n
	cXFRSE19HEROxDIP6tBaNkcDVAZ+baWNSWZA68pZdeymxOPM9CTa+HEzfWNeVhxZb3W46okanQG7J
	0BDZGhXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXeE-0000000FTVv-2uk3;
	Thu, 15 Feb 2024 09:03:14 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXeC-0000000FTUY-1tOj
	for ath10k@lists.infradead.org;
	Thu, 15 Feb 2024 09:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707987792; x=1739523792;
  h=date:from:to:cc:subject:message-id;
  bh=QqaUA2dwN6HSipS6rT4sjUSmTyIbWttim7X46xNFyqU=;
  b=jZ4lVarFZh62z04sTIMc4lwnEESRlAy4wcontCnrUJhx/fFIDhvbaPpT
   T0tx+iT4sTq5MLimYzssEC2DoOI6oU7qwiUbIbQ3Z/IDMDe66Gqdxtts/
   IGvMF733NsMaTIQzJJoiq10o+AhLhWcCsqpNctLVLna/gRByFblZKUrWL
   KpmR+pzeqiSXM/HRvjII8NJPfVkhwuKR61x8wGG9Z8Fipc8L4dpEOLRaP
   Naf+g7gDIFdH2Le9X5suSHxBVFJXuXdz17qBi10d1KxNzleiRmoEubJOI
   GkFxAFeRrNw+g6H1VH5iZb1PSs2oaWnfBXkPZjq4Y6jW/VPujudFDywYD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1918871"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="1918871"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 01:03:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826386972"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="826386972"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Feb 2024 01:03:10 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raXe8-0000MV-18;
	Thu, 15 Feb 2024 09:03:08 +0000
Date: Thu, 15 Feb 2024 16:59:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 d6b1ae33d1be02aa1bb0212f6021d4ba9f94bba7
Message-ID: <202402151651.JK2sn2de-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_010312_575279_E522CEF6 
X-CRM114-Status: UNSURE (   5.29  )
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
branch HEAD: d6b1ae33d1be02aa1bb0212f6021d4ba9f94bba7  Merge branch 'ath-next' into ath-qca

elapsed time: 1449m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240215   gcc  
arc                   randconfig-002-20240215   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                       imx_v4_v5_defconfig   clang
arm                          ixp4xx_defconfig   gcc  
arm                          moxart_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                   randconfig-001-20240215   clang
arm                   randconfig-002-20240215   gcc  
arm                   randconfig-003-20240215   gcc  
arm                   randconfig-004-20240215   gcc  
arm                           sama7_defconfig   clang
arm                        shmobile_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240215   clang
arm64                 randconfig-003-20240215   gcc  
arm64                 randconfig-004-20240215   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240215   gcc  
csky                  randconfig-002-20240215   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240215   clang
hexagon               randconfig-002-20240215   clang
i386         buildonly-randconfig-001-20240214   clang
i386         buildonly-randconfig-001-20240215   clang
i386         buildonly-randconfig-002-20240214   clang
i386         buildonly-randconfig-002-20240215   clang
i386         buildonly-randconfig-003-20240214   clang
i386         buildonly-randconfig-003-20240215   clang
i386         buildonly-randconfig-004-20240214   gcc  
i386         buildonly-randconfig-004-20240215   clang
i386         buildonly-randconfig-005-20240215   clang
i386         buildonly-randconfig-006-20240215   clang
i386                  randconfig-001-20240215   gcc  
i386                  randconfig-002-20240215   gcc  
i386                  randconfig-003-20240215   clang
i386                  randconfig-004-20240215   gcc  
i386                  randconfig-005-20240215   gcc  
i386                  randconfig-006-20240215   gcc  
i386                  randconfig-011-20240215   clang
i386                  randconfig-012-20240215   clang
i386                  randconfig-013-20240215   gcc  
i386                  randconfig-014-20240215   gcc  
i386                  randconfig-015-20240215   clang
i386                  randconfig-016-20240215   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240215   gcc  
loongarch             randconfig-002-20240215   gcc  
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
mips                        bcm63xx_defconfig   clang
mips                         db1xxx_defconfig   clang
mips                      malta_kvm_defconfig   gcc  
mips                          rb532_defconfig   clang
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240215   gcc  
nios2                 randconfig-002-20240215   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240215   gcc  
parisc                randconfig-002-20240215   gcc  
powerpc                          allmodconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                     ksi8560_defconfig   gcc  
powerpc               randconfig-001-20240215   gcc  
powerpc               randconfig-002-20240215   clang
powerpc               randconfig-003-20240215   clang
powerpc64             randconfig-001-20240215   clang
powerpc64             randconfig-002-20240215   gcc  
powerpc64             randconfig-003-20240215   clang
riscv                            allmodconfig   clang
riscv                            allyesconfig   clang
riscv                 randconfig-001-20240215   gcc  
riscv                 randconfig-002-20240215   gcc  
s390                             allmodconfig   clang
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240215   clang
s390                  randconfig-002-20240215   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240215   gcc  
sh                    randconfig-002-20240215   gcc  
sh                            shmin_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240215   gcc  
sparc64               randconfig-002-20240215   gcc  
um                               allmodconfig   clang
um                               allyesconfig   gcc  
um                    randconfig-001-20240215   gcc  
um                    randconfig-002-20240215   gcc  
x86_64       buildonly-randconfig-001-20240215   clang
x86_64       buildonly-randconfig-002-20240215   clang
x86_64       buildonly-randconfig-003-20240215   gcc  
x86_64       buildonly-randconfig-004-20240215   gcc  
x86_64       buildonly-randconfig-005-20240215   clang
x86_64       buildonly-randconfig-006-20240215   gcc  
x86_64                randconfig-001-20240215   clang
x86_64                randconfig-002-20240215   clang
x86_64                randconfig-003-20240215   gcc  
x86_64                randconfig-004-20240215   clang
x86_64                randconfig-005-20240215   clang
x86_64                randconfig-006-20240215   clang
x86_64                randconfig-011-20240215   gcc  
x86_64                randconfig-012-20240215   gcc  
x86_64                randconfig-013-20240215   gcc  
x86_64                randconfig-014-20240215   gcc  
x86_64                randconfig-015-20240215   gcc  
x86_64                randconfig-016-20240215   clang
x86_64                randconfig-071-20240215   clang
x86_64                randconfig-072-20240215   clang
x86_64                randconfig-073-20240215   gcc  
x86_64                randconfig-074-20240215   gcc  
x86_64                randconfig-075-20240215   clang
x86_64                randconfig-076-20240215   gcc  
xtensa                randconfig-001-20240215   gcc  
xtensa                randconfig-002-20240215   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

