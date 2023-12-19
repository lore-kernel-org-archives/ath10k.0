Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7A7C41535
	for <ath10k@archiver.kernel.org>; Tue, 19 Dec 2023 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UCLPWjUP9hRupIslqzRdOJPqVlPOzqnUCBkrytSoidk=; b=hPzlxoEQ6hO+amFmuzMDPy/Erm
	I9pz8ZAIUn6hYQUX/Z+bnhlKIE+j1S1iPklHasLUzteeXxWaJE9EBanaFrmI8IQ7b/cZ5rYpxi/09
	oAvCk/z/qUa2lk3ob6hOrAq+tZC+NZuajU+YvyNQJieGfesd04ijA6HLDlGSNd74X8yAU1M3y9N5j
	E747uH4PhAvy6EGo6aWLgSbBxFTpWt4TMygH3Ngp0wnyLpFmIiwvSTxU8Dt3fxf6Dn+F0zOIwQfVR
	UmVxAcvbRg0WYyF2rfes9kzn8Ywc5I9jh4gS3kNGjcy4QsMPW327s54u7OZq9z1qxWew97K578pLw
	vtQvgUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFg0Q-00FLTd-0C;
	Tue, 19 Dec 2023 19:43:54 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFg0N-00FLSB-0u
	for ath10k@lists.infradead.org;
	Tue, 19 Dec 2023 19:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703015031; x=1734551031;
  h=date:from:to:cc:subject:message-id;
  bh=u7iohl37FopPkZX1lndITVSYIHJtttBwc6zRqG64PGY=;
  b=b2gvBk3DqKYmvCwAA1VooqG9D0Ka3w5cgbpV8rI+8Lar9s4KoVYZcHz0
   9SzjYAjY5x/XfkXqdr1Y94dG67nu9C8LLGCySi8ar860D3o9/WzINtJwE
   GqTb3phCfPJTlag6jhUhh0OhvcP/BfPLn12Vc+HVKq1O3mlUhdEKUkVoz
   y6y53a7p4jCJj9UkgiY366s8xrW6TQkJo/dcAPd5DF0RdwprVy9/NMFwX
   p31kz/WBjCGlJWVtYRE5ch4HNLT0K/C8qJ5WP7fyruL3PpFJTn698x4dd
   iqf/1BtrE5lQ5Stj3BfCU9kzcJGcEmjg1zrEmqLhTyAbuYyQVWuHEECO6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="375860353"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="375860353"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 11:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="1023228602"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="1023228602"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Dec 2023 11:43:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFg0A-0005s9-1t;
	Tue, 19 Dec 2023 19:43:38 +0000
Date: Wed, 20 Dec 2023 03:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 52f8c45fa36df0754b4562b7b535be8475304ebe
Message-ID: <202312200334.Za84vh3x-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_114351_360704_9AFC163F 
X-CRM114-Status: UNSURE (   3.76  )
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
branch HEAD: 52f8c45fa36df0754b4562b7b535be8475304ebe  wifi: ath12k: support default regdb while searching board-2.bin for WCN7850

elapsed time: 1485m

configs tested: 108
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231219   clang
i386         buildonly-randconfig-002-20231219   clang
i386         buildonly-randconfig-003-20231219   clang
i386         buildonly-randconfig-004-20231219   clang
i386         buildonly-randconfig-005-20231219   clang
i386         buildonly-randconfig-006-20231219   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231219   clang
i386                  randconfig-002-20231219   clang
i386                  randconfig-003-20231219   clang
i386                  randconfig-004-20231219   clang
i386                  randconfig-005-20231219   clang
i386                  randconfig-006-20231219   clang
i386                  randconfig-011-20231219   gcc  
i386                  randconfig-012-20231219   gcc  
i386                  randconfig-013-20231219   gcc  
i386                  randconfig-014-20231219   gcc  
i386                  randconfig-015-20231219   gcc  
i386                  randconfig-016-20231219   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                  decstation_64_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc                     tqm8555_defconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231220   gcc  
x86_64       buildonly-randconfig-002-20231220   gcc  
x86_64       buildonly-randconfig-003-20231220   gcc  
x86_64       buildonly-randconfig-004-20231220   gcc  
x86_64       buildonly-randconfig-005-20231220   gcc  
x86_64       buildonly-randconfig-006-20231220   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231220   clang
x86_64                randconfig-002-20231220   clang
x86_64                randconfig-003-20231220   clang
x86_64                          rhel-8.3-rust   clang
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

