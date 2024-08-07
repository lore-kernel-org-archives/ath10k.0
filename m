Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04D2C49EA1
	for <ath10k@archiver.kernel.org>; Wed,  7 Aug 2024 01:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3tp05hZrVGHqAhh9nFPiKij8qvB+A2AgA1vhKFAQoyg=; b=Vy+7DRGix8ETFF5UySB0XU8eSm
	Jxu/4bzoOq/mdgTafdPlcorGi2cu9JRotmu0/zURWe9bL8rTilKf9BhYMhC72/GeltqzYo7yJhBjH
	oiTBP7mDq8W8yj/Yg4eFxjKXj8WLTMYmqTJcL8CWaftgK4aIMhgmycmJhVqxUa8vpycXY+87CJLuO
	CnFBbsbvpCDkfDjqbC16k79oFuw+G9tZKA1NQh5B2x7mvdO6r4B153wvmDw7bWcG/bekK9mwUHSIW
	oS4gCCWkveWqHcrn/5kwK387X6HcPlQoDHOMm9C8mMfCnrgoUQJ3qES7p2tKAvXDLEn53aUtID0wp
	GkICkInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbVUl-00000003Wzd-3JcR;
	Wed, 07 Aug 2024 01:29:43 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbVUi-00000003Wxw-0lAD
	for ath10k@lists.infradead.org;
	Wed, 07 Aug 2024 01:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722994180; x=1754530180;
  h=date:from:to:cc:subject:message-id;
  bh=rMiEpVvcFNuATbKk/1khDUAwTROtkqi0pUEPCWEXXtc=;
  b=lIONcvpBR1dY+nkeqHAgqjMu/1FxVTnWwuGFVZMymwS9UIAfNMm1LuXR
   FTIfQ41NzgHqaqZ520SXzB+bqwk28Fpp6RSZwTHmC94K06za6VxmwYb4L
   l+xhT1gOfH9nmGM3FooOxzWMnZapP332/7IOLJuKevX1SzZ2mprilskmS
   Px53jcLLXxsk9RjGNWrCd5GMN45+fKtOJKtOtjuT/MvaBaM2ojQX8IOBg
   gYyG89aO/TM+hZwyvxUKNHYJhia1s0TxTM97zS0yz6p4aRo9M1bq6No8r
   X4wpdXhuRbS17tGYsPONHNjQeNH/pdUF9zbZPmhENkOGu4sa4JdI1OjsI
   Q==;
X-CSE-ConnectionGUID: B6D8LCvaTFaZ7nGp+kNdFA==
X-CSE-MsgGUID: fRqtWqVXTC6gH2Kp7cWjzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="38552473"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="38552473"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 18:29:36 -0700
X-CSE-ConnectionGUID: BAtPShOXTomWQimQkYQa4Q==
X-CSE-MsgGUID: 7XLkYiyNQAurD9i0ocfhfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56380909"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2024 18:29:34 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbVUa-00052B-0D;
	Wed, 07 Aug 2024 01:29:32 +0000
Date: Wed, 07 Aug 2024 09:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:main-pending] BUILD SUCCESS
 91e22fccfc3efe5a8e67c684375ddab98f00a795
Message-ID: <202408070906.wTl7LRY5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_182940_303377_CDE9869C 
X-CRM114-Status: UNSURE (   3.73  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git main-pending
branch HEAD: 91e22fccfc3efe5a8e67c684375ddab98f00a795  Merge branch 'pending' into main-pending

elapsed time: 996m

configs tested: 294
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240806   gcc-13.2.0
arc                   randconfig-002-20240806   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         at91_dt_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                           h3600_defconfig   gcc-14.1.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-14.1.0
arm                           omap1_defconfig   gcc-14.1.0
arm                             pxa_defconfig   gcc-14.1.0
arm                   randconfig-001-20240806   clang-20
arm                   randconfig-001-20240806   gcc-13.2.0
arm                   randconfig-002-20240806   gcc-13.2.0
arm                   randconfig-002-20240806   gcc-14.1.0
arm                   randconfig-003-20240806   gcc-13.2.0
arm                   randconfig-003-20240806   gcc-14.1.0
arm                   randconfig-004-20240806   gcc-13.2.0
arm                   randconfig-004-20240806   gcc-14.1.0
arm                             rpc_defconfig   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240806   clang-20
arm64                 randconfig-001-20240806   gcc-13.2.0
arm64                 randconfig-002-20240806   clang-20
arm64                 randconfig-002-20240806   gcc-13.2.0
arm64                 randconfig-003-20240806   clang-14
arm64                 randconfig-003-20240806   gcc-13.2.0
arm64                 randconfig-004-20240806   gcc-13.2.0
arm64                 randconfig-004-20240806   gcc-14.1.0
csky                             alldefconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240806   gcc-13.2.0
csky                  randconfig-001-20240806   gcc-14.1.0
csky                  randconfig-002-20240806   gcc-13.2.0
csky                  randconfig-002-20240806   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240806   clang-20
hexagon               randconfig-002-20240806   clang-17
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240806   gcc-11
i386         buildonly-randconfig-001-20240807   clang-18
i386         buildonly-randconfig-002-20240806   gcc-11
i386         buildonly-randconfig-002-20240806   gcc-12
i386         buildonly-randconfig-002-20240807   clang-18
i386         buildonly-randconfig-003-20240806   gcc-11
i386         buildonly-randconfig-003-20240806   gcc-12
i386         buildonly-randconfig-003-20240807   clang-18
i386         buildonly-randconfig-004-20240806   gcc-11
i386         buildonly-randconfig-004-20240806   gcc-12
i386         buildonly-randconfig-004-20240807   clang-18
i386         buildonly-randconfig-005-20240806   clang-18
i386         buildonly-randconfig-005-20240806   gcc-11
i386         buildonly-randconfig-005-20240807   clang-18
i386         buildonly-randconfig-006-20240806   gcc-11
i386         buildonly-randconfig-006-20240806   gcc-12
i386         buildonly-randconfig-006-20240807   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240806   clang-18
i386                  randconfig-001-20240806   gcc-11
i386                  randconfig-001-20240807   clang-18
i386                  randconfig-002-20240806   gcc-11
i386                  randconfig-002-20240806   gcc-12
i386                  randconfig-002-20240807   clang-18
i386                  randconfig-003-20240806   gcc-11
i386                  randconfig-003-20240806   gcc-12
i386                  randconfig-003-20240807   clang-18
i386                  randconfig-004-20240806   gcc-11
i386                  randconfig-004-20240806   gcc-12
i386                  randconfig-004-20240807   clang-18
i386                  randconfig-005-20240806   clang-18
i386                  randconfig-005-20240806   gcc-11
i386                  randconfig-005-20240807   clang-18
i386                  randconfig-006-20240806   clang-18
i386                  randconfig-006-20240806   gcc-11
i386                  randconfig-006-20240807   clang-18
i386                  randconfig-011-20240806   clang-18
i386                  randconfig-011-20240806   gcc-11
i386                  randconfig-011-20240807   clang-18
i386                  randconfig-012-20240806   gcc-11
i386                  randconfig-012-20240806   gcc-12
i386                  randconfig-012-20240807   clang-18
i386                  randconfig-013-20240806   clang-18
i386                  randconfig-013-20240806   gcc-11
i386                  randconfig-013-20240807   clang-18
i386                  randconfig-014-20240806   clang-18
i386                  randconfig-014-20240806   gcc-11
i386                  randconfig-014-20240807   clang-18
i386                  randconfig-015-20240806   clang-18
i386                  randconfig-015-20240806   gcc-11
i386                  randconfig-015-20240807   clang-18
i386                  randconfig-016-20240806   clang-18
i386                  randconfig-016-20240806   gcc-11
i386                  randconfig-016-20240807   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240806   gcc-13.2.0
loongarch             randconfig-001-20240806   gcc-14.1.0
loongarch             randconfig-002-20240806   gcc-13.2.0
loongarch             randconfig-002-20240806   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                        stmark2_defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                         db1xxx_defconfig   gcc-13.2.0
mips                          eyeq5_defconfig   gcc-14.1.0
mips                          eyeq6_defconfig   gcc-13.2.0
mips                           gcw0_defconfig   gcc-14.1.0
mips                           ip22_defconfig   gcc-13.2.0
mips                        vocore2_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240806   gcc-13.2.0
nios2                 randconfig-001-20240806   gcc-14.1.0
nios2                 randconfig-002-20240806   gcc-13.2.0
nios2                 randconfig-002-20240806   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                       virt_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240806   gcc-13.2.0
parisc                randconfig-001-20240806   gcc-14.1.0
parisc                randconfig-002-20240806   gcc-13.2.0
parisc                randconfig-002-20240806   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     asp8347_defconfig   gcc-13.2.0
powerpc                   bluestone_defconfig   gcc-14.1.0
powerpc                       ebony_defconfig   gcc-13.2.0
powerpc                       eiger_defconfig   gcc-14.1.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240806   gcc-13.2.0
powerpc               randconfig-001-20240806   gcc-14.1.0
powerpc               randconfig-002-20240806   clang-20
powerpc               randconfig-003-20240806   clang-20
powerpc               randconfig-003-20240806   gcc-13.2.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                     tqm8555_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240806   gcc-13.2.0
powerpc64             randconfig-001-20240806   gcc-14.1.0
powerpc64             randconfig-002-20240806   clang-16
powerpc64             randconfig-002-20240806   gcc-13.2.0
powerpc64             randconfig-003-20240806   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240806   gcc-13.2.0
riscv                 randconfig-001-20240806   gcc-14.1.0
riscv                 randconfig-002-20240806   clang-20
riscv                 randconfig-002-20240806   gcc-13.2.0
s390                             alldefconfig   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240806   clang-20
s390                  randconfig-001-20240806   gcc-13.2.0
s390                  randconfig-002-20240806   clang-20
s390                  randconfig-002-20240806   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-13.2.0
sh                     magicpanelr2_defconfig   gcc-14.1.0
sh                    randconfig-001-20240806   gcc-13.2.0
sh                    randconfig-001-20240806   gcc-14.1.0
sh                    randconfig-002-20240806   gcc-13.2.0
sh                    randconfig-002-20240806   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                          sdk7786_defconfig   gcc-14.1.0
sh                           se7705_defconfig   gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240806   gcc-13.2.0
sparc64               randconfig-001-20240806   gcc-14.1.0
sparc64               randconfig-002-20240806   gcc-13.2.0
sparc64               randconfig-002-20240806   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240806   clang-20
um                    randconfig-001-20240806   gcc-13.2.0
um                    randconfig-002-20240806   gcc-12
um                    randconfig-002-20240806   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240806   clang-18
x86_64       buildonly-randconfig-002-20240806   clang-18
x86_64       buildonly-randconfig-003-20240806   clang-18
x86_64       buildonly-randconfig-004-20240806   clang-18
x86_64       buildonly-randconfig-005-20240806   clang-18
x86_64       buildonly-randconfig-005-20240806   gcc-12
x86_64       buildonly-randconfig-006-20240806   clang-18
x86_64       buildonly-randconfig-006-20240806   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240806   clang-18
x86_64                randconfig-001-20240806   gcc-12
x86_64                randconfig-002-20240806   clang-18
x86_64                randconfig-002-20240806   gcc-11
x86_64                randconfig-003-20240806   clang-18
x86_64                randconfig-003-20240806   gcc-12
x86_64                randconfig-004-20240806   clang-18
x86_64                randconfig-005-20240806   clang-18
x86_64                randconfig-006-20240806   clang-18
x86_64                randconfig-011-20240806   clang-18
x86_64                randconfig-011-20240806   gcc-12
x86_64                randconfig-012-20240806   clang-18
x86_64                randconfig-012-20240806   gcc-12
x86_64                randconfig-013-20240806   clang-18
x86_64                randconfig-014-20240806   clang-18
x86_64                randconfig-014-20240806   gcc-12
x86_64                randconfig-015-20240806   clang-18
x86_64                randconfig-015-20240806   gcc-12
x86_64                randconfig-016-20240806   clang-18
x86_64                randconfig-016-20240806   gcc-12
x86_64                randconfig-071-20240806   clang-18
x86_64                randconfig-071-20240806   gcc-12
x86_64                randconfig-072-20240806   clang-18
x86_64                randconfig-073-20240806   clang-18
x86_64                randconfig-073-20240806   gcc-11
x86_64                randconfig-074-20240806   clang-18
x86_64                randconfig-074-20240806   gcc-12
x86_64                randconfig-075-20240806   clang-18
x86_64                randconfig-075-20240806   gcc-12
x86_64                randconfig-076-20240806   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  cadence_csp_defconfig   gcc-14.1.0
xtensa                generic_kc705_defconfig   gcc-13.2.0
xtensa                          iss_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240806   gcc-13.2.0
xtensa                randconfig-001-20240806   gcc-14.1.0
xtensa                randconfig-002-20240806   gcc-13.2.0
xtensa                randconfig-002-20240806   gcc-14.1.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0
xtensa                         virt_defconfig   gcc-13.2.0
xtensa                         virt_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

