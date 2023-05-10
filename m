Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D9AC77B7C
	for <ath10k@archiver.kernel.org>; Wed, 10 May 2023 21:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t6vm0DjcZQdU1ZM3MAWZ6Sqt/SR8FNSrVZB6FwViOSE=; b=DeRM1FMPsCh1C3
	dXhx0USvbaBU78o9bkW8yDhALc1MKY8ZaqrxQin2AMxNRsDfaY/3s975QrXHzxjE/d7G5qtKXU246
	qurdspyurEgfNynnZK2KPbTwpJHl6PiSVRKUAuHXvvTLdI+jPkMMtFPqI9/pl5ZiJ5LXtrbFf6xYf
	gB9DAdwNPE+MUbfS39rvmqkhfBtuc7u2/rudCBg4H3fmgCnAhP7lDGQZhzGJ5uHy9vGQGkfBxu2Jf
	cp2UcKIy0+9iV6djMC0d00JgegaGjTH3jvkPF45SqcRxdZZ7tiiGlMeeqi5bJBUCdkT0alg+TffD5
	1+mi82erw4IVgGBgDwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqzY-0071F6-1O;
	Wed, 10 May 2023 21:04:56 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqzV-0071Ed-0u
	for ath10k@lists.infradead.org;
	Wed, 10 May 2023 21:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683752693; x=1715288693;
  h=date:from:to:cc:subject:message-id;
  bh=vkxABSC7oudxNbrq+p7hfAbEFPh90/bksULoZbefbOQ=;
  b=YhPK2ovI11hC4mnxhb05sQOqA3O/azyfNlyHUF7Vv0xDe+6JdfxoT+2j
   NSEfr08GnYBGZmKzxxgVjGT1YLxm1gBb+zHPX8cwOkZqPqcyB4SUoYTf1
   b848ptoLOtkKW2UsUCizGEzDQd1/dMcDHoUfq61jkH6Fn5kspI2g3qead
   4j16Rcm680/Tq3UHdM6s4USh8liWwIEYdNHsKkfp/MJ0oqAl4k4Acqv8g
   dZGnhkBOrhmMGR46o7tKzBYQEKr48SUQQlZmGGkJL6TUMjiUmsA5Iqtmh
   +1gSt0EIxkwdkQMBDhnV8CaNaTLvCuOr5Dro4PadUDpi0NjRMAlF2iKie
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350352783"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="350352783"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 14:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873692269"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="873692269"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2023 14:04:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwqzN-0003Zc-2V;
	Wed, 10 May 2023 21:04:45 +0000
Date: Thu, 11 May 2023 05:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 aa87ead8115eafa38d7ce061fbcf12eba2548300
Message-ID: <20230510210404.npxkc%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_140453_353286_EC27062B 
X-CRM114-Status: UNSURE (   4.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: aa87ead8115eafa38d7ce061fbcf12eba2548300  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 149
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230509   gcc  
alpha                randconfig-r016-20230509   gcc  
alpha                randconfig-r034-20230509   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                  randconfig-r015-20230509   gcc  
arc                  randconfig-r031-20230509   gcc  
arc                  randconfig-r043-20230510   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        neponset_defconfig   clang
arm                  randconfig-r023-20230509   gcc  
arm                  randconfig-r046-20230510   gcc  
arm                          sp7021_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r032-20230509   gcc  
arm64                randconfig-r034-20230509   gcc  
arm64                randconfig-r036-20230509   gcc  
csky         buildonly-randconfig-r003-20230509   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r015-20230509   gcc  
csky                 randconfig-r026-20230509   gcc  
csky                 randconfig-r032-20230509   gcc  
hexagon              randconfig-r001-20230509   clang
hexagon              randconfig-r002-20230509   clang
hexagon              randconfig-r041-20230510   clang
hexagon              randconfig-r045-20230510   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r014-20230509   gcc  
ia64                 randconfig-r023-20230509   gcc  
ia64                 randconfig-r025-20230509   gcc  
ia64                 randconfig-r033-20230509   gcc  
ia64                 randconfig-r035-20230509   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230509   gcc  
loongarch            randconfig-r035-20230509   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230509   gcc  
microblaze   buildonly-randconfig-r004-20230509   gcc  
microblaze           randconfig-r022-20230509   gcc  
microblaze           randconfig-r035-20230509   gcc  
microblaze           randconfig-r036-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                 randconfig-r006-20230509   clang
mips                 randconfig-r015-20230509   gcc  
mips                 randconfig-r031-20230510   clang
nios2        buildonly-randconfig-r006-20230509   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230509   gcc  
nios2                randconfig-r012-20230509   gcc  
nios2                randconfig-r031-20230509   gcc  
nios2                randconfig-r032-20230509   gcc  
nios2                randconfig-r033-20230509   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc             randconfig-r011-20230509   gcc  
openrisc             randconfig-r022-20230509   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230509   gcc  
parisc               randconfig-r024-20230509   gcc  
parisc               randconfig-r034-20230509   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                     sequoia_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                randconfig-r031-20230509   gcc  
riscv                randconfig-r042-20230510   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230509   clang
s390                                defconfig   gcc  
s390                 randconfig-r016-20230509   clang
s390                 randconfig-r031-20230509   gcc  
s390                 randconfig-r034-20230509   gcc  
s390                 randconfig-r044-20230510   clang
sh                               allmodconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                   randconfig-r012-20230509   gcc  
sh                   randconfig-r016-20230509   gcc  
sh                          rsk7201_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230509   gcc  
sparc                randconfig-r012-20230509   gcc  
sparc                randconfig-r021-20230509   gcc  
sparc                randconfig-r036-20230509   gcc  
sparc64              randconfig-r016-20230509   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230509   gcc  
xtensa       buildonly-randconfig-r005-20230509   gcc  
xtensa                              defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r004-20230509   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
