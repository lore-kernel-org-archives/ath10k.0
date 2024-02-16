Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C281C48BF3
	for <ath10k@archiver.kernel.org>; Fri, 16 Feb 2024 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zhab3oVSn/jqB7KsHz0ex5q1i5QjXuWWm2CqCeLUnYc=; b=AlPSVofy4H40JyZA1DaQzuo2Fx
	iQ93V5tJoBYrFmGI/skBoki9GXUKWRTDdSdJ4AUUMzW6xHaPcRVUb+L9zvFSUoNgx2aNA4SIX+v7T
	2UQ+26+2O57jE4qPMmqS5Q1WqLO4duu+aq0xdVX26j4Ob3ONmaNUmlvr/poePXp1sN0VThz5V5gDf
	YyPNsKq2fRplwgK32GHptKfe9Jzonf51ijxbeNrwHCP+l5UKmiUpfy2sfF8YkqC9V/mnOVvqKk+4c
	czYE9dB0Ibz6RULO2Kr7B+3uV0UAJZW8HFPukQwnZOh6ZnWUDgLn24ReFQ6rJ15ybslOPy8/UVsaQ
	Pdyl9AZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rax1T-00000002FRT-388f;
	Fri, 16 Feb 2024 12:08:55 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rax1N-00000002FQg-2ZYK
	for ath10k@lists.infradead.org;
	Fri, 16 Feb 2024 12:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708085329; x=1739621329;
  h=date:from:to:cc:subject:message-id;
  bh=3I+blAtqEXlOsZ8zXX2duOwjsaCB/RfMZLobGXm5Kvk=;
  b=QCFQLOCI4SiUq1cwUmnCYr/zN5W67sBCp4duf9onyeEqTrgtXpDg0Sk7
   rnthqDhDmjHlbmnkqEJUT+sMBvvj0Ak7a8hBuW0Q5ioXsI2WgUNRk3Uqo
   XmE/+oMUC0o/wn+w6uh1cfER5NvcmSvH42pIBwqKgqoFCeI0y8xjWB7wB
   Y9N4r3IfMxfQYTNlk3+GhhtLaXgXl4lN+dl0z0XXCZd7e5oJSx44pvE5d
   k02wgebeR9MC04ri7w9V28IqA+lY6X1ViFrvXw8w9TwGCZywPpoQdCunq
   C4P8adiowJZqFMln0nxLIxk7UIWO9HKAt4PB0oPB1WCby509bSo3tbe3o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2117018"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2117018"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 04:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3901575"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Feb 2024 04:08:47 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rax1I-0001Eq-0C;
	Fri, 16 Feb 2024 12:08:44 +0000
Date: Fri, 16 Feb 2024 20:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5
Message-ID: <202402162002.9x3TxWjP-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_040852_507218_F2C85DD7 
X-CRM114-Status: UNSURE (   4.27  )
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
branch HEAD: 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5  wifi: ath11k: remove unused scan_events from struct scan_req_params

elapsed time: 1456m

configs tested: 159
configs skipped: 5

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
arc                   randconfig-001-20240216   gcc  
arc                   randconfig-002-20240216   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                          moxart_defconfig   gcc  
arm                        neponset_defconfig   gcc  
arm                   randconfig-001-20240216   clang
arm                   randconfig-002-20240216   clang
arm                   randconfig-003-20240216   gcc  
arm                   randconfig-004-20240216   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240216   clang
arm64                 randconfig-002-20240216   gcc  
arm64                 randconfig-003-20240216   clang
arm64                 randconfig-004-20240216   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240216   gcc  
csky                  randconfig-002-20240216   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240216   gcc  
i386         buildonly-randconfig-002-20240216   clang
i386         buildonly-randconfig-003-20240216   clang
i386         buildonly-randconfig-004-20240216   gcc  
i386         buildonly-randconfig-005-20240216   gcc  
i386         buildonly-randconfig-006-20240216   clang
i386                                defconfig   clang
i386                  randconfig-001-20240216   clang
i386                  randconfig-002-20240216   clang
i386                  randconfig-003-20240216   gcc  
i386                  randconfig-004-20240216   clang
i386                  randconfig-005-20240216   gcc  
i386                  randconfig-006-20240216   clang
i386                  randconfig-011-20240216   gcc  
i386                  randconfig-012-20240216   gcc  
i386                  randconfig-013-20240216   gcc  
i386                  randconfig-014-20240216   clang
i386                  randconfig-015-20240216   gcc  
i386                  randconfig-016-20240216   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240216   gcc  
loongarch             randconfig-002-20240216   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240216   gcc  
nios2                 randconfig-002-20240216   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240216   gcc  
parisc                randconfig-002-20240216   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc64             randconfig-003-20240216   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240216   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240216   gcc  
s390                  randconfig-002-20240216   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240216   gcc  
sh                    randconfig-002-20240216   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240216   gcc  
sparc64               randconfig-002-20240216   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240216   gcc  
um                    randconfig-002-20240216   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64       buildonly-randconfig-001-20240216   clang
x86_64       buildonly-randconfig-002-20240216   clang
x86_64       buildonly-randconfig-003-20240216   clang
x86_64       buildonly-randconfig-004-20240216   clang
x86_64       buildonly-randconfig-006-20240216   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-002-20240216   clang
x86_64                randconfig-006-20240216   clang
x86_64                randconfig-013-20240216   clang
x86_64                randconfig-015-20240216   clang
x86_64                randconfig-016-20240216   clang
x86_64                randconfig-071-20240216   clang
x86_64                randconfig-072-20240216   clang
x86_64                randconfig-075-20240216   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240216   gcc  
xtensa                randconfig-002-20240216   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

