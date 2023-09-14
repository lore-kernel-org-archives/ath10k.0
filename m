Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEFCEEAA62
	for <ath10k@archiver.kernel.org>; Thu, 14 Sep 2023 18:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DqOMtxqBypJnn6/WJ9WJA4+1p1X6rO5Npzvu2Ie8NMg=; b=yLANW35e9er1/L
	imN00KBukLORxPdvdT1SsBVsDMyPUYJY/awZpXBV6KlBCl5LUzWl3tGJI+QOtrlek9oH1p1Y/v60i
	jEXb6f8nsrBC5mZKHWCjrXoFO4hMwCJ+DVa/7rMLQVsqtdBh8GPr17znEsTgADKh+axYiWRL+McXM
	T4L4xDeyXS56d34bxlsbRCupLn9YqITqmvqFMm3sXddJvLBRnQ3p5ZPkXYsDRoBzAU2nTfOVetwJU
	S2TpYvALnYcL1oEOCtc5uezb16ArF+9DOK3WW56Pue717uiFzNdebShwMPR+E+Z42J7XdDHVrYAv5
	V6oEUJWRl2WGPfNdc91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgr8y-0094T1-0j;
	Thu, 14 Sep 2023 18:32:48 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgr8u-0094S6-10
	for ath10k@lists.infradead.org;
	Thu, 14 Sep 2023 18:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694716364; x=1726252364;
  h=date:from:to:cc:subject:message-id;
  bh=/i2rdShCpWcn8bLEh6MLoR/yiu95aMxUofilVjRHih8=;
  b=lL/WXgOKWEnp5EX4wMsnsL1ymO0Wxg4F0na+sSB+RXg2qaQI7FT0wdzK
   y8AmF6y+2a/w+RibmSOdHpCP066/2LWyPKDiutS04YLZOWMK0sc711y8D
   ChVdsVZydwRvVesj8LuSrexbS82WjVxgCEQ/f6Yx1kPVSigLENsW3oO7G
   QqIQYBiLlmHjIUuVy39ujLvONo4xb0BeCyzO/vMQ4/ZzebrOKXEkNib9j
   LqLOPzCRlrqXX6pi10PZOmh3ueXUijgFjZM1guThswHNXtimTowOM4Vnz
   aQ+rFlyFSxXE5AWQaQ74cMBrT13VzsDnn7Gled2svBK1O/08cvdxS2UNQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358454828"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="358454828"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 11:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918336854"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="918336854"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Sep 2023 11:32:26 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgr8Z-0001wP-3D;
	Thu, 14 Sep 2023 18:32:23 +0000
Date: Fri, 15 Sep 2023 02:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath11k-testmode] BUILD SUCCESS WITH WARNING
 ba2a7d5c57ba0703f64cf849c0299ac23eb1c1f5
Message-ID: <202309150228.qaOUiatn-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_113244_374368_EA259242 
X-CRM114-Status: UNSURE (   2.94  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-testmode
branch HEAD: ba2a7d5c57ba0703f64cf849c0299ac23eb1c1f5  wifi: ath12k: Fill pdev id for fw test cmd

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202309140338.JIMolIml-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath12k/testmode.c:28:16: warning: no previous prototype for 'ath12k_tm_get_ar' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- arc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- csky-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- csky-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- loongarch-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- loongarch-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- microblaze-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- microblaze-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- openrisc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- openrisc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- parisc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- parisc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- sparc-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- sparc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- sparc64-allmodconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
|-- sparc64-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar
`-- x86_64-allyesconfig
    `-- drivers-net-wireless-ath-ath12k-testmode.c:warning:no-previous-prototype-for-ath12k_tm_get_ar

elapsed time: 1529m

configs tested: 151
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230914   gcc  
arc                   randconfig-001-20230915   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230914   gcc  
arm                   randconfig-001-20230915   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20230914   gcc  
i386         buildonly-randconfig-002-20230914   gcc  
i386         buildonly-randconfig-003-20230914   gcc  
i386         buildonly-randconfig-004-20230914   gcc  
i386         buildonly-randconfig-005-20230914   gcc  
i386         buildonly-randconfig-006-20230914   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230914   gcc  
i386                  randconfig-002-20230914   gcc  
i386                  randconfig-003-20230914   gcc  
i386                  randconfig-004-20230914   gcc  
i386                  randconfig-005-20230914   gcc  
i386                  randconfig-006-20230914   gcc  
i386                  randconfig-011-20230914   gcc  
i386                  randconfig-011-20230915   gcc  
i386                  randconfig-012-20230914   gcc  
i386                  randconfig-012-20230915   gcc  
i386                  randconfig-013-20230914   gcc  
i386                  randconfig-013-20230915   gcc  
i386                  randconfig-014-20230914   gcc  
i386                  randconfig-014-20230915   gcc  
i386                  randconfig-015-20230914   gcc  
i386                  randconfig-015-20230915   gcc  
i386                  randconfig-016-20230914   gcc  
i386                  randconfig-016-20230915   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230914   gcc  
loongarch             randconfig-001-20230915   gcc  
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
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230914   gcc  
riscv                 randconfig-001-20230915   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230914   gcc  
s390                  randconfig-001-20230915   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230914   gcc  
sparc                 randconfig-001-20230915   gcc  
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
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230914   gcc  
x86_64       buildonly-randconfig-001-20230915   gcc  
x86_64       buildonly-randconfig-002-20230914   gcc  
x86_64       buildonly-randconfig-002-20230915   gcc  
x86_64       buildonly-randconfig-003-20230914   gcc  
x86_64       buildonly-randconfig-003-20230915   gcc  
x86_64       buildonly-randconfig-004-20230914   gcc  
x86_64       buildonly-randconfig-004-20230915   gcc  
x86_64       buildonly-randconfig-005-20230914   gcc  
x86_64       buildonly-randconfig-005-20230915   gcc  
x86_64       buildonly-randconfig-006-20230914   gcc  
x86_64       buildonly-randconfig-006-20230915   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230914   gcc  
x86_64                randconfig-002-20230914   gcc  
x86_64                randconfig-003-20230914   gcc  
x86_64                randconfig-004-20230914   gcc  
x86_64                randconfig-005-20230914   gcc  
x86_64                randconfig-006-20230914   gcc  
x86_64                randconfig-011-20230914   gcc  
x86_64                randconfig-012-20230914   gcc  
x86_64                randconfig-013-20230914   gcc  
x86_64                randconfig-014-20230914   gcc  
x86_64                randconfig-015-20230914   gcc  
x86_64                randconfig-016-20230914   gcc  
x86_64                randconfig-071-20230914   gcc  
x86_64                randconfig-072-20230914   gcc  
x86_64                randconfig-073-20230914   gcc  
x86_64                randconfig-074-20230914   gcc  
x86_64                randconfig-075-20230914   gcc  
x86_64                randconfig-076-20230914   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
