Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB901C4167B
	for <ath10k@archiver.kernel.org>; Wed,  6 Dec 2023 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h/ahd6ukquDy52m/LBYrDYF+fjS8NeS49MHBi7HcLio=; b=1DPV56x6k/TQRjJm93pEpNJ0yq
	dD0OblSrD6vvbjMxfRDfHGov79oQEdmDPjcsJq04n6/E7+csjUvn1HNXvkCFV2ldhTEbdUPZCf7w/
	CmNFnPMB8+Qa4XVq0GJQPFkmHuMGtieuYMOq90oRhlmDimMfVbDbFEIKw3K1cmL1eppG5xNAAwF+w
	PICPTmtc974RQsKvnYWHu8hLXCh6dEWeXZ9+yDiSrXTrhnZ4KpF+rO5jewi9Ar275ILHn12sji7h4
	+TrsDOjzFEm66d9pmNtpX3wDbcBcBgLTKM7TJINirT+XnhT2sqbgRDhozlxJLPkatOY69qU4wTXTX
	e7t2NIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAuQx-00AiVP-1W;
	Wed, 06 Dec 2023 16:07:35 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAuQu-00AiUy-2G
	for ath10k@lists.infradead.org;
	Wed, 06 Dec 2023 16:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701878852; x=1733414852;
  h=date:from:to:cc:subject:message-id;
  bh=e8/Ms/odIgXK6kpmW41SEgfvs8HvSC5dtFP8wi19/Ag=;
  b=KD0R/K36QQ9MIwnQqspyqhYDm6o9Aeez2M7ZaPNLgzonLvureZCfH2Fk
   zk9+gyCrH+wG9rHC3mVo2rK4XW9Pi8XzkhcfbTu4An67e2IJD6DeKkUcM
   jm7MGn6Bvq73+zpnB4GFBnT9E7SzfLoZRzwg+sOIndGQ8GLWKBVpRDFSf
   si2a7aF446Wib62Ra/nAFVl6i4BnBszC/uSEbCY60xVa91GBGUxkK6mF8
   HUmdegHDuNjGammlYzoWzgqzxnlC5XJLX5x2C+J5HJCCQEAHB10/x1JyI
   LtisHPZkZPpAFf7JE2s06o9sly4N1QviLwunftjpGHzUguBb4stAoc1O2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="15637202"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="15637202"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 08:07:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="19362806"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2023 08:07:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAuQq-000B53-12;
	Wed, 06 Dec 2023 16:07:28 +0000
Date: Thu, 07 Dec 2023 00:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 0d4538a3d7fef1862627aa1c6f5c89b1cc9ef0d3
Message-ID: <202312070044.0OFHaVDX-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_080732_754225_CB42E7E7 
X-CRM114-Status: UNSURE (   3.74  )
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
branch HEAD: 0d4538a3d7fef1862627aa1c6f5c89b1cc9ef0d3  Add localversion-wireless-testing-ath

elapsed time: 1478m

configs tested: 138
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
arc                              allmodconfig   gcc  
arc                              allyesconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231206   gcc  
arc                   randconfig-002-20231206   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                         bcm2835_defconfig   clang
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231206   clang
arm                   randconfig-002-20231206   clang
arm                   randconfig-003-20231206   clang
arm                   randconfig-004-20231206   clang
arm                         vf610m4_defconfig   gcc  
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
loongarch             randconfig-001-20231206   gcc  
loongarch             randconfig-002-20231206   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
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
powerpc                     ksi8560_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc               randconfig-001-20231206   clang
powerpc               randconfig-002-20231206   clang
powerpc               randconfig-003-20231206   clang
powerpc                         wii_defconfig   gcc  
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
sh                ecovec24-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20231206   gcc  
sh                    randconfig-002-20231206   gcc  
sh                           se7780_defconfig   gcc  
sparc                            alldefconfig   gcc  
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

