Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954D2C4167B
	for <ath10k@archiver.kernel.org>; Wed,  6 Dec 2023 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pL/+qSmfifF35SvyMH1JMBkeoyklJJ9WnqAo3SpHEwc=; b=GHoOcPs9Rjh2pNW6DPA/XFqf2K
	mOxnSZ5xyu4IsNcjQvwZCWBZokLCPWRxmRvdtsVIAxF+R3xwyfZtpZQmbPvLbnuf70ECeRH2sJtRq
	Ra+lRWYamYpciKhWadAtkSOFIrwuNAr/yUe65fs4ioaf1uA2zbIs+8LQZS+6m28TpY7FTqtlm6KKt
	MHzXNgYcapXu5ZhebXDhhneYVlm3g48Xq+5Ugo7AupEqVcg3onoEAF3zIxALqhF/Vgx9sdtMsiKUO
	yCvdLBGqcJOdRogJHxAZdJBpwLi6ShknANt0NMKj0ykkH83PeMUc3odHVbzTKSX1tozp2BbFJdnRl
	l5YX/w3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAuQ0-00AiPk-1L;
	Wed, 06 Dec 2023 16:06:36 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAuPx-00AiPB-1E
	for ath10k@lists.infradead.org;
	Wed, 06 Dec 2023 16:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701878794; x=1733414794;
  h=date:from:to:cc:subject:message-id;
  bh=DOXIFlG1d8sDe4zh6z195SRVbI7oy1Ua8S6fxYU78Tk=;
  b=Xx/oU2F2ha+izOj+qAxj8JgxBG8heudJyPMAsLPepoTFMg6jnI4knBau
   esqEmly2dkAqctQ/gsadMABc2z0hrr/oPmCfxijzSroc8StuOsgANipBx
   Q49TTLY0CKxV70PHEi6A3jpEimfBCylRtGG7HQDRh6KdodRnknjbiDFs1
   89N/LJvSjIKiBqeDaKU+ThTghI9aIk2S2q9z1isC1qh9ZFNChPRNI2Bqf
   PEa+qYGUyfaThqSRqFQ4WtzeT0DM46MOc5HQCivBQv5Ut3P3h7mpjznd1
   iR1uPn029rbY41HWYOo4fOkaTYZxxFjS8GlYPR/6h3jG8er1dE248ScYA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1151039"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1151039"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 08:06:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="747651400"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="747651400"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Dec 2023 08:06:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAuPr-000B4b-2b;
	Wed, 06 Dec 2023 16:06:27 +0000
Date: Thu, 07 Dec 2023 00:04:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 c8a5f34ad811743d1b3aeb5c54198eebd413bc6d
Message-ID: <202312070009.hdC9Kl9y-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_080633_487085_EABB14AB 
X-CRM114-Status: UNSURE (   3.55  )
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
branch HEAD: c8a5f34ad811743d1b3aeb5c54198eebd413bc6d  wifi: ath12k: avoid repeated wiphy access from hw

elapsed time: 1476m

configs tested: 138
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
arc                              allmodconfig   gcc  
arc                              allyesconfig   gcc  
arc                   randconfig-001-20231206   gcc  
arc                   randconfig-002-20231206   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                           omap1_defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231206   clang
arm                   randconfig-002-20231206   clang
arm                   randconfig-003-20231206   clang
arm                   randconfig-004-20231206   clang
arm64                            allmodconfig   clang
arm64                 randconfig-001-20231206   clang
arm64                 randconfig-002-20231206   clang
arm64                 randconfig-003-20231206   clang
arm64                 randconfig-004-20231206   clang
csky                             allmodconfig   gcc  
csky                             allyesconfig   gcc  
csky                  randconfig-001-20231206   gcc  
csky                  randconfig-002-20231206   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
hexagon               randconfig-001-20231206   clang
hexagon               randconfig-002-20231206   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231206   clang
i386         buildonly-randconfig-002-20231206   clang
i386         buildonly-randconfig-003-20231206   clang
i386         buildonly-randconfig-004-20231206   clang
i386         buildonly-randconfig-005-20231206   clang
i386         buildonly-randconfig-006-20231206   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231206   clang
i386                  randconfig-002-20231206   clang
i386                  randconfig-003-20231206   clang
i386                  randconfig-004-20231206   clang
i386                  randconfig-005-20231206   clang
i386                  randconfig-006-20231206   clang
i386                  randconfig-011-20231206   gcc  
i386                  randconfig-012-20231206   gcc  
i386                  randconfig-013-20231206   gcc  
i386                  randconfig-014-20231206   gcc  
i386                  randconfig-015-20231206   gcc  
i386                  randconfig-016-20231206   gcc  
loongarch                        allmodconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20231206   gcc  
loongarch             randconfig-002-20231206   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20231206   gcc  
nios2                 randconfig-002-20231206   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231206   gcc  
parisc                randconfig-002-20231206   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20231206   clang
powerpc               randconfig-002-20231206   clang
powerpc               randconfig-003-20231206   clang
powerpc64             randconfig-001-20231206   clang
powerpc64             randconfig-002-20231206   clang
powerpc64             randconfig-003-20231206   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20231206   clang
riscv                 randconfig-002-20231206   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231206   gcc  
s390                  randconfig-002-20231206   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                               j2_defconfig   gcc  
sh                    randconfig-001-20231206   gcc  
sh                    randconfig-002-20231206   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231206   gcc  
sparc64               randconfig-002-20231206   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20231206   clang
um                    randconfig-002-20231206   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231206   clang
x86_64       buildonly-randconfig-002-20231206   clang
x86_64       buildonly-randconfig-003-20231206   clang
x86_64       buildonly-randconfig-004-20231206   clang
x86_64       buildonly-randconfig-005-20231206   clang
x86_64       buildonly-randconfig-006-20231206   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231206   gcc  
x86_64                randconfig-002-20231206   gcc  
x86_64                randconfig-003-20231206   gcc  
x86_64                randconfig-004-20231206   gcc  
x86_64                randconfig-005-20231206   gcc  
x86_64                randconfig-006-20231206   gcc  
x86_64                randconfig-011-20231206   clang
x86_64                randconfig-012-20231206   clang
x86_64                randconfig-013-20231206   clang
x86_64                randconfig-014-20231206   clang
x86_64                randconfig-015-20231206   clang
x86_64                randconfig-016-20231206   clang
x86_64                randconfig-071-20231206   clang
x86_64                randconfig-072-20231206   clang
x86_64                randconfig-073-20231206   clang
x86_64                randconfig-074-20231206   clang
x86_64                randconfig-075-20231206   clang
x86_64                randconfig-076-20231206   clang
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231206   gcc  
xtensa                randconfig-002-20231206   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

