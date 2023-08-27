Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34314C83F11
	for <ath10k@archiver.kernel.org>; Sun, 27 Aug 2023 17:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ii+YSOLW22hHNj2bUHkmG8QnATJsc8udtg97r9jHhIg=; b=IbWk8pCcrCXRRp
	03EtmD/QK+sXR67YQGOag78qohJuEWwWsalZ6O9mjqVbemIHniCoMIKJ7U+DU+aZXNWDk1rB0z89K
	4eKyDT0xb7KN6UFzEiX8wnfcuU63Xda+J6PxyAcYrNrhdiKAcCIYuvTENbwZzfM+V70LjE7bOOm7d
	3iFjYeTLwXg3MAqCQsvfD9FSyBtAxAxD9gm34ASzBgTfFsPjXXkoZTZbSmIIFPXg9ceDZVUuvLZEc
	geLv2QDrcp2SgK2IEpooIV9qcl6cUDSJMlxRw1Dw/c3l37T6Ruy3tcpaRwTUIEaU/sqcTO8wjLZ9M
	oGml2ynGtG08u2Hn2gEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaJv2-008KCO-0v;
	Sun, 27 Aug 2023 17:51:24 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaJuz-008KBM-0e
	for ath10k@lists.infradead.org;
	Sun, 27 Aug 2023 17:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693158681; x=1724694681;
  h=date:from:to:cc:subject:message-id;
  bh=TEeTtT83xyGcYVZ1zb+uL4MO7l8/yPtwijGobl2Rn6Y=;
  b=DDvs7WVq5DiBqK31Swt3yNVQjaVCJUK+uQQ37PxJO/jhnAgZAXvpBDok
   Vnn3u1WCknos7M+ydcYp/FbohKhFua8EWqmZU8GmqpI1lICka3jj+zm5V
   N/ptSrnajSxTKVHGBgi4ipGYxtbKWiPmXV2D+PybJJwXyGj0dEgmqHSCb
   XPwUTTE8EJrdjIa4Ht/uz+hCSvzyF6wDx1Na6ixhTNRJBdRuv6QVEdUjG
   Qy2OkhxyG5qmZOYPC3iabTqPpTQc+YXrb6l/KWa32hWN9Jr1EHvDrIxO9
   /lM7zqA+qVibGRTmTq/YAD30shTqkYgtmoKHWIDwaJdiNypO5dmhz/Uck
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372364914"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="372364914"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 10:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="803452804"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="803452804"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 27 Aug 2023 10:50:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaJud-000649-0w;
	Sun, 27 Aug 2023 17:50:59 +0000
Date: Mon, 28 Aug 2023 01:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 b69bda9ae4e4706b0271dbf212639988c27568a6
Message-ID: <202308280152.ujhoPbsK-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_105121_285081_4B2AE16C 
X-CRM114-Status: UNSURE (   4.73  )
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
branch HEAD: b69bda9ae4e4706b0271dbf212639988c27568a6  wifi: ath11k: fix tid bitmap is 0 in peer rx mu stats

elapsed time: 2155m

configs tested: 157
configs skipped: 2

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
arc                   randconfig-001-20230826   gcc  
arc                  randconfig-r014-20230826   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230826   gcc  
arm                  randconfig-r035-20230826   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r034-20230826   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230826   gcc  
hexagon               randconfig-001-20230826   clang
hexagon               randconfig-002-20230826   clang
i386         buildonly-randconfig-001-20230826   gcc  
i386         buildonly-randconfig-002-20230826   gcc  
i386         buildonly-randconfig-003-20230826   gcc  
i386         buildonly-randconfig-004-20230826   gcc  
i386         buildonly-randconfig-005-20230826   gcc  
i386         buildonly-randconfig-006-20230826   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230826   gcc  
i386                  randconfig-002-20230826   gcc  
i386                  randconfig-003-20230826   gcc  
i386                  randconfig-004-20230826   gcc  
i386                  randconfig-005-20230826   gcc  
i386                  randconfig-006-20230826   gcc  
i386                  randconfig-011-20230826   clang
i386                  randconfig-012-20230826   clang
i386                  randconfig-013-20230826   clang
i386                  randconfig-014-20230826   clang
i386                  randconfig-015-20230826   clang
i386                  randconfig-016-20230826   clang
i386                 randconfig-r001-20230826   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230826   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r006-20230826   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r011-20230826   gcc  
mips                 randconfig-r031-20230826   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230826   gcc  
nios2                randconfig-r025-20230826   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r002-20230826   gcc  
openrisc             randconfig-r023-20230826   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc64            randconfig-r033-20230826   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230826   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230826   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r021-20230826   gcc  
sh                   randconfig-r026-20230826   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230826   gcc  
sparc                randconfig-r015-20230826   gcc  
sparc                randconfig-r032-20230826   gcc  
sparc                randconfig-r036-20230826   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r005-20230826   gcc  
sparc64              randconfig-r013-20230826   gcc  
sparc64              randconfig-r024-20230826   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230826   gcc  
x86_64       buildonly-randconfig-002-20230826   gcc  
x86_64       buildonly-randconfig-003-20230826   gcc  
x86_64       buildonly-randconfig-004-20230826   gcc  
x86_64       buildonly-randconfig-005-20230826   gcc  
x86_64       buildonly-randconfig-006-20230826   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230826   clang
x86_64                randconfig-002-20230826   clang
x86_64                randconfig-003-20230826   clang
x86_64                randconfig-004-20230826   clang
x86_64                randconfig-005-20230826   clang
x86_64                randconfig-006-20230826   clang
x86_64                randconfig-011-20230826   gcc  
x86_64                randconfig-012-20230826   gcc  
x86_64                randconfig-013-20230826   gcc  
x86_64                randconfig-014-20230826   gcc  
x86_64                randconfig-015-20230826   gcc  
x86_64                randconfig-016-20230826   gcc  
x86_64                randconfig-071-20230826   gcc  
x86_64                randconfig-072-20230826   gcc  
x86_64                randconfig-073-20230826   gcc  
x86_64                randconfig-074-20230826   gcc  
x86_64                randconfig-075-20230826   gcc  
x86_64                randconfig-076-20230826   gcc  
x86_64               randconfig-r022-20230826   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r003-20230826   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
