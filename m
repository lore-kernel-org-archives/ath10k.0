Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CE6C27C52
	for <ath10k@archiver.kernel.org>; Wed,  5 Jun 2024 18:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=acTCNibMKdpVo/9Sfu/0y8db2HIMVgX+/JtTeCiw4AI=; b=SjgYd2XQGamrkl/4eSlUGWcIO2
	4xzs5ynt7xaiiTCDD2zrui+6pey2OdWwpu05jYtdQeVATdcvNd3tgTgK43FxRTzL+8UjLdQkSDE3p
	ORE7YWITGKqsmRhaCxVMNCDXRT7Ryri6qYnBwXUB6DXAqpA1TeTHx+FGo6xRIEc/DL2J6RyuV6WSz
	A0xzmOEgNDNgZmjygmrvCZ9f8aXGFmSgVfZMW7OZfFV70Mbb/J3QYEs8PD2WBQcab0pMp6wA+sNNn
	YaWp4+g2BQLywQG4A2T6Q9fDLuTqWhDJHrhGNsCDiW3KZirlA2lWiQa1zjvuExtb/l3crNhzQiOnO
	PCoXJ2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv8h-000000077ym-34Xx;
	Wed, 05 Jun 2024 18:13:35 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEv8e-000000077xG-1NOg
	for ath10k@lists.infradead.org;
	Wed, 05 Jun 2024 18:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717611212; x=1749147212;
  h=date:from:to:cc:subject:message-id;
  bh=4fG2GhS5dYYSLHM74AxtG+ADdT8KiiGskKSyAqSQq7M=;
  b=l8IC5+YgQii0oJatCbRC9j4fNhcr0IrzbylQa92GABHfH6GOSz9WooDy
   mv6mkjD9LtRU62O6xkc1PfZtZi+YSfrSpOvfvXyGxP4Jq/Fw6b/8yBBVl
   PDyyXaGIlECiMFNi2PAqiIvdzrkhpezQwOdffD106akhXXoykUE789DL+
   z1JwSvkdL3Q6RIdawHF81GJh5igfNkvP7nheEkYwm9dWLwYrHVJdSnjnh
   mhL4vfAH76QFQoM89snM4vgWi88VO/1V0seEybWKXxsXqAc1sZvwBDbwE
   2Ff3sSbt9K8z64tbmMWHRrgr18rx9e3vvqY9bW8cPiCW6TlI7EHHeBV9e
   g==;
X-CSE-ConnectionGUID: +OHX17SJSAajNwKQat8XZg==
X-CSE-MsgGUID: D7XUnlciSwaiuryP6pLRhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14377989"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="14377989"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 11:13:30 -0700
X-CSE-ConnectionGUID: qo8DYlRUQjWmqjPtGB/zmg==
X-CSE-MsgGUID: JjbMFh0TTGuNoYOVvzsETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="37565471"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2024 11:13:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEv8Z-00022k-0n;
	Wed, 05 Jun 2024 18:13:27 +0000
Date: Thu, 06 Jun 2024 02:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 cf899366dcc92549ed47b45c1d4aa7ee6696995f
Message-ID: <202406060239.mgGOgqHN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_111332_433127_CBE7AFB9 
X-CRM114-Status: UNSURE (   3.65  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: cf899366dcc92549ed47b45c1d4aa7ee6696995f  wifi: ath11k: use 'time_left' variable with wait_event_timeout()

elapsed time: 1480m

configs tested: 133
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
arc                   randconfig-001-20240605   gcc  
arc                   randconfig-002-20240605   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240605   clang
arm                   randconfig-002-20240605   clang
arm                   randconfig-003-20240605   clang
arm                   randconfig-004-20240605   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240605   gcc  
arm64                 randconfig-002-20240605   clang
arm64                 randconfig-003-20240605   clang
arm64                 randconfig-004-20240605   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240605   gcc  
csky                  randconfig-002-20240605   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240605   clang
hexagon               randconfig-002-20240605   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240605   gcc  
i386         buildonly-randconfig-002-20240605   gcc  
i386         buildonly-randconfig-003-20240605   gcc  
i386         buildonly-randconfig-004-20240605   gcc  
i386         buildonly-randconfig-005-20240605   gcc  
i386         buildonly-randconfig-006-20240605   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240605   gcc  
i386                  randconfig-002-20240605   clang
i386                  randconfig-003-20240605   gcc  
i386                  randconfig-004-20240605   gcc  
i386                  randconfig-005-20240605   gcc  
i386                  randconfig-006-20240605   gcc  
i386                  randconfig-011-20240605   gcc  
i386                  randconfig-012-20240605   gcc  
i386                  randconfig-013-20240605   clang
i386                  randconfig-014-20240605   clang
i386                  randconfig-015-20240605   gcc  
i386                  randconfig-016-20240605   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240605   gcc  
loongarch             randconfig-002-20240605   gcc  
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
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240605   gcc  
nios2                 randconfig-002-20240605   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240605   gcc  
parisc                randconfig-002-20240605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240605   gcc  
powerpc               randconfig-002-20240605   gcc  
powerpc               randconfig-003-20240605   gcc  
powerpc64             randconfig-001-20240605   gcc  
powerpc64             randconfig-002-20240605   clang
powerpc64             randconfig-003-20240605   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240605   gcc  
riscv                 randconfig-002-20240605   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240605   gcc  
s390                  randconfig-002-20240605   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240605   gcc  
sh                    randconfig-002-20240605   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240605   gcc  
sparc64               randconfig-002-20240605   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240605   gcc  
um                    randconfig-002-20240605   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240605   gcc  
x86_64       buildonly-randconfig-002-20240605   gcc  
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240605   gcc  
xtensa                randconfig-002-20240605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

