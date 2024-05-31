Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AE4C25B75
	for <ath10k@archiver.kernel.org>; Fri, 31 May 2024 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KuhZS/iywfJwOcKPTZHXkH75Mqnt82GYnTFjnLyvCvo=; b=ch1Avot1/sqy8vtgyrqGD/kblM
	ItlRfrKOH/9anC4wLm335V5LOvawLKutqSWpKVCSb339FE4ovgGNrNxm+UFMCg1QjKBhyxUWpa+2H
	ReHA8N3AxW3WGCLA/Bi+hNCmMn9rS4kswI3HMlyfHuENgW0blnRCQFsn2a8afG8VuQSX9I6x4iOTZ
	UodS7qEUKXBNn0yPGgedl919LUvNXwISabBOfPHBUT5G/gnGKSieJtHiVY9tDSEfR7kQp9TkUSjQR
	eiQ3+QFZfspC3CTcVQJ+9gcMfUbhuvVxuWCqBeZBRO08HYzDoad2XZkehRJb546hJrFX7b9RI2zhS
	6eCfqoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD56B-0000000Apw8-1u2e;
	Fri, 31 May 2024 16:27:23 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD565-0000000Apup-0ptT
	for ath10k@lists.infradead.org;
	Fri, 31 May 2024 16:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717172837; x=1748708837;
  h=date:from:to:cc:subject:message-id;
  bh=j4fv8k25kgajB9pcn/tcdVL2NZaFRyvw2lcS99wz3Gw=;
  b=c+weRtaaH5067bJbpeOHMythtM73eGZD1glzKzBscYlCbSqwIxSC4tXt
   pt8aqbUxkWjiQ9nO8GYc6l3YKBpiBv3kXWd0f6T0K/yo25yv4aSbwufTD
   aA/HY2oO5fLF3hF9NzqqsxdQjfBRJ8/seWpsrSr1Wx3r5XgbYjodl43sH
   cADHTM6QDC3s17+oUk4283KIMNXtGQIdQF3KaPAzxzs16pn7mvvW1tbF0
   M8OpN7Ln+0VmF3XYC1BuFNdgtV0Cra2GmtpfUpL25JOImZjSpSalDJtRS
   NwB3u1kvAGDa/6K2YylaDpJ0v/A2grKyLWGph4Jz93GO4vlWIzXk92M8z
   A==;
X-CSE-ConnectionGUID: E7dwB7GwQbmSEqk+7uB1FA==
X-CSE-MsgGUID: QVVczFjeQayJVwdg0O5Etw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="16675392"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="16675392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 09:27:16 -0700
X-CSE-ConnectionGUID: ziYMBEnmSFuUuYeQi5sG9A==
X-CSE-MsgGUID: GX6gKsXCRNCfA5o6seociQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36151035"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2024 09:27:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD560-000HLD-1V;
	Fri, 31 May 2024 16:27:12 +0000
Date: Sat, 01 Jun 2024 00:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 808d8551998b7461b610e7a2d6f65e2b31186578
Message-ID: <202406010019.NUktKbF6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_092719_986762_B955CDD0 
X-CRM114-Status: UNSURE (   4.03  )
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
branch HEAD: 808d8551998b7461b610e7a2d6f65e2b31186578  Merge branch 'ath-next' into ath-qca

elapsed time: 1456m

configs tested: 154
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
arc                   randconfig-001-20240531   gcc  
arc                   randconfig-002-20240531   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   clang
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                   milbeaut_m10v_defconfig   clang
arm                   randconfig-001-20240531   clang
arm                   randconfig-002-20240531   clang
arm                   randconfig-003-20240531   clang
arm                   randconfig-004-20240531   clang
arm                         s3c6400_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240531   clang
arm64                 randconfig-002-20240531   clang
arm64                 randconfig-003-20240531   gcc  
arm64                 randconfig-004-20240531   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240531   gcc  
csky                  randconfig-002-20240531   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240531   clang
hexagon               randconfig-002-20240531   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240531   clang
i386         buildonly-randconfig-002-20240531   gcc  
i386         buildonly-randconfig-003-20240531   gcc  
i386         buildonly-randconfig-004-20240531   clang
i386         buildonly-randconfig-005-20240531   gcc  
i386         buildonly-randconfig-006-20240531   clang
i386                                defconfig   clang
i386                  randconfig-001-20240531   gcc  
i386                  randconfig-002-20240531   clang
i386                  randconfig-003-20240531   clang
i386                  randconfig-004-20240531   gcc  
i386                  randconfig-005-20240531   clang
i386                  randconfig-006-20240531   clang
i386                  randconfig-011-20240531   clang
i386                  randconfig-012-20240531   gcc  
i386                  randconfig-013-20240531   gcc  
i386                  randconfig-014-20240531   clang
i386                  randconfig-015-20240531   gcc  
i386                  randconfig-016-20240531   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240531   gcc  
loongarch             randconfig-002-20240531   gcc  
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
mips                          eyeq5_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240531   gcc  
nios2                 randconfig-002-20240531   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240531   gcc  
parisc                randconfig-002-20240531   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240531   clang
powerpc               randconfig-002-20240531   clang
powerpc               randconfig-003-20240531   gcc  
powerpc64             randconfig-001-20240531   clang
powerpc64             randconfig-002-20240531   clang
powerpc64             randconfig-003-20240531   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240531   clang
riscv                 randconfig-002-20240531   clang
s390                              allnoconfig   clang
s390                                defconfig   clang
s390                  randconfig-001-20240531   gcc  
s390                  randconfig-002-20240531   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240531   gcc  
sh                    randconfig-002-20240531   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240531   gcc  
sparc64               randconfig-002-20240531   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240531   gcc  
um                    randconfig-002-20240531   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240531   clang
x86_64       buildonly-randconfig-002-20240531   gcc  
x86_64       buildonly-randconfig-003-20240531   clang
x86_64       buildonly-randconfig-004-20240531   clang
x86_64       buildonly-randconfig-005-20240531   gcc  
x86_64       buildonly-randconfig-006-20240531   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240531   gcc  
x86_64                randconfig-002-20240531   clang
x86_64                randconfig-003-20240531   gcc  
x86_64                randconfig-004-20240531   gcc  
x86_64                randconfig-005-20240531   gcc  
x86_64                randconfig-006-20240531   gcc  
x86_64                randconfig-011-20240531   clang
x86_64                randconfig-012-20240531   gcc  
x86_64                randconfig-013-20240531   gcc  
x86_64                randconfig-014-20240531   clang
x86_64                randconfig-015-20240531   gcc  
x86_64                randconfig-016-20240531   gcc  
x86_64                randconfig-071-20240531   clang
x86_64                randconfig-072-20240531   gcc  
x86_64                randconfig-073-20240531   gcc  
x86_64                randconfig-074-20240531   gcc  
x86_64                randconfig-075-20240531   clang
x86_64                randconfig-076-20240531   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240531   gcc  
xtensa                randconfig-002-20240531   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

