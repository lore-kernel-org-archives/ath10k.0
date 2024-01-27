Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C1EC48285
	for <ath10k@archiver.kernel.org>; Sat, 27 Jan 2024 03:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kZTU/0lNll7IzZd135u1t/RoCpdZ0/DzoR0Z/Wk1YSQ=; b=lyKU7Dc6csVWpm6KSkm92qFSok
	zFoLgP7QrCWN6gGfdeSpB/GEU/Dk33kC2ISG4fRAVeJaIAcCoNtE2MkusT20o1nbsB7vIZq0JK3sM
	lvshGc50SVnL9CNIiMQer5VdnSyybfzVwzlooqhp5LDMkxfcj6X8MnyCYXU8RsJaiHMUfbyfBUGU0
	A1ydiJN5ZYxg0O6UF8YeGQLbmQmq6j2qAvZcVIuotkGl58W+yyxoob93KGOEsrqdYCuAld1/BKDh/
	jx3oxF186dEPvXtJMJnGXf/Y/M1qAQz9jFa9VPGxTVw0c2uui+ki3LoKh24iSjKlRJHAOuOty8WP3
	mLaKI/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTZgD-00000006gpw-2KD8;
	Sat, 27 Jan 2024 03:48:29 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTZgA-00000006gno-00SZ
	for ath10k@lists.infradead.org;
	Sat, 27 Jan 2024 03:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706327305; x=1737863305;
  h=date:from:to:cc:subject:message-id;
  bh=e57BPTHU4eG/E5RShG5qLMTOBmKCxFd48daKyNKC+bk=;
  b=cjoLJ/qqxob7CFE+ateL6QdVTRvrBoYKZ4iiEb4fmokE4Rvl8XogqPmG
   OfkQNgM+FMvTaU2pcmSlvUvJeVwiJ0w3nCSp6wtJjQ0nDEmp7Wszo1pFq
   G9b2ha93HeWbwHJO6YBsbicMNJeTqXa0iQGVPqjg4GaUm4m3Gwy9O//Mo
   KA8WK2z7DCrjRKddU1BQgwTqbwPRJc5xZGog7Av7Fha1KxqjjLdGQB9mC
   F5bWwk1aw/9yJuV+plpBfEDNmxresTGcg0zjSZ+j+1Vb3X7Pn5jW5t1HG
   Szmy9bnFA0n2MiUbQawqEFxCwRL2V4ERZfWo2hCV2BZj2WpHmJ/6vWtiF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="399801404"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="399801404"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 19:48:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857592594"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="857592594"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jan 2024 19:48:22 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTZg4-0001c2-1k;
	Sat, 27 Jan 2024 03:48:20 +0000
Date: Sat, 27 Jan 2024 11:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 17f4b952f067b1f87d14e6df4c8c216fe7a245d1
Message-ID: <202401271155.lPFjK3rz-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_194826_138490_A9F385F8 
X-CRM114-Status: UNSURE (   6.39  )
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
branch HEAD: 17f4b952f067b1f87d14e6df4c8c216fe7a245d1  Add localversion-wireless-testing-ath

elapsed time: 2090m

configs tested: 91
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-002-20240127   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                              allnoconfig   clang
i386         buildonly-randconfig-001-20240126   clang
i386         buildonly-randconfig-002-20240126   clang
i386         buildonly-randconfig-003-20240126   clang
i386         buildonly-randconfig-004-20240126   clang
i386         buildonly-randconfig-005-20240126   clang
i386         buildonly-randconfig-006-20240126   clang
i386                  randconfig-001-20240126   clang
i386                  randconfig-002-20240126   clang
i386                  randconfig-003-20240126   clang
i386                  randconfig-004-20240126   clang
i386                  randconfig-005-20240126   clang
i386                  randconfig-006-20240126   clang
i386                  randconfig-011-20240126   gcc  
i386                  randconfig-012-20240126   gcc  
i386                  randconfig-013-20240126   gcc  
i386                  randconfig-014-20240126   gcc  
i386                  randconfig-015-20240126   gcc  
i386                  randconfig-016-20240126   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                                allnoconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

