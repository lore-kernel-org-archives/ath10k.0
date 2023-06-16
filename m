Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9D2EB64DB
	for <ath10k@archiver.kernel.org>; Fri, 16 Jun 2023 00:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hqpxD8JjH9KnNa4IwqkFpqch4h+JkOX7wZaTDLagAJA=; b=lpxMq9GOD8cu9N
	bKzu0ivhq2OeHpZWuKO5XISaG9YVsnhokv7iYk2+u78zRHzy3nLyh3SlTXCz9x0K/ytQ2LNhr3ZOK
	PK408z7vddNXT9yjnASjQ7RC2bmW2q8LPH7YEvfQ5ya+RTSEA1StP66xQo/OntHgvTzMUA6BDByDM
	Jqygip891Uemp7QmL2ohmPoOySrmyRo0CZYutAA07PU/Yv4tjcxV0olFa1ivvHiYPIIVzNmSvLQcS
	7qQGxh5sbQmXxv0+U4tDIAuU0fwqbrSPN/WBGOivkWkJki3evngnkM2bE3ZPEeRo3Sehdp2wFAzCW
	wUT3olKuqre41jqcCyqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9xAL-00GPmS-2f;
	Fri, 16 Jun 2023 00:18:13 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9xAJ-00GPl4-0K
	for ath10k@lists.infradead.org;
	Fri, 16 Jun 2023 00:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686874691; x=1718410691;
  h=date:from:to:cc:subject:message-id;
  bh=ZdqpH1aQjFabRKqLzkGLHmm1s3fJypFpnF4qAJndNEo=;
  b=cgWDdZwuH727vbOl5OvKsD4neVwA8hNSoy4M9Q1dwAsvc1wJSqFj0u17
   Qn1GUwWAyuLZDqBDKlLbXsbUIW9uQqeVY7Zy1dVEu87wCd5Vy6ibqZFnj
   Dl2o6Y/4KKDaM6UcWXCpTu3aKlMhxo3aTp2NaU2gwypaI8iud5kHzYsfA
   j9yAtE3CO+n5f7wxKsONvr/K7iSshbT2+YQeg9TqnMxCnywM7d4PoK3Om
   y+K6/kbQoR4HXCSwft4MU6YaIEyBh9/PPR147cxdHsnN5PHCVuY3OSMSv
   +nnp5lziOA14I5lo3L6JIehRke9vJvKcOQuOhHv4avVulnrXnFz8eo6HJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="357949554"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="357949554"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 17:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="886882533"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="886882533"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Jun 2023 17:17:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9xA5-0000Yr-2i;
	Fri, 16 Jun 2023 00:17:57 +0000
Date: Fri, 16 Jun 2023 08:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 1a09aaa751220b9e193b11e04fe414aa67927556
Message-ID: <202306160859.jjrtVX96-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_171811_149454_7DAF4E94 
X-CRM114-Status: UNSURE (   4.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 1a09aaa751220b9e193b11e04fe414aa67927556  wifi: ath11k: add support DT ieee80211-freq-limit

elapsed time: 732m

configs tested: 120
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                  randconfig-r043-20230615   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                  randconfig-r002-20230615   clang
arm                  randconfig-r046-20230615   gcc  
arm                        spear6xx_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r003-20230614   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r033-20230615   clang
hexagon              randconfig-r041-20230615   clang
hexagon              randconfig-r045-20230615   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230615   gcc  
i386                 randconfig-i002-20230615   gcc  
i386                 randconfig-i003-20230615   gcc  
i386                 randconfig-i004-20230615   gcc  
i386                 randconfig-i005-20230615   gcc  
i386                 randconfig-i006-20230615   gcc  
i386                 randconfig-i011-20230615   clang
i386                 randconfig-i012-20230615   clang
i386                 randconfig-i013-20230615   clang
i386                 randconfig-i014-20230615   clang
i386                 randconfig-i015-20230615   clang
i386                 randconfig-i016-20230615   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230614   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230614   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230614   gcc  
microblaze           randconfig-r031-20230615   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                 randconfig-r035-20230615   clang
mips                   sb1250_swarm_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r021-20230615   gcc  
nios2                randconfig-r022-20230615   gcc  
openrisc     buildonly-randconfig-r001-20230614   gcc  
openrisc     buildonly-randconfig-r006-20230614   gcc  
openrisc             randconfig-r012-20230614   gcc  
openrisc             randconfig-r026-20230615   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230615   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r011-20230614   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r036-20230615   gcc  
riscv                randconfig-r042-20230615   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230614   gcc  
s390                 randconfig-r032-20230615   gcc  
s390                 randconfig-r044-20230615   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230615   gcc  
sh                   randconfig-r004-20230615   gcc  
sh                   randconfig-r016-20230614   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230615   gcc  
sparc                randconfig-r024-20230615   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230615   gcc  
x86_64               randconfig-a002-20230615   gcc  
x86_64               randconfig-a003-20230615   gcc  
x86_64               randconfig-a004-20230615   gcc  
x86_64               randconfig-a005-20230615   gcc  
x86_64               randconfig-a006-20230615   gcc  
x86_64               randconfig-a011-20230615   clang
x86_64               randconfig-a012-20230615   clang
x86_64               randconfig-a013-20230615   clang
x86_64               randconfig-a014-20230615   clang
x86_64               randconfig-a015-20230615   clang
x86_64               randconfig-a016-20230615   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230614   gcc  
xtensa               randconfig-r015-20230614   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
