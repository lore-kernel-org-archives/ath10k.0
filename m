Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D07C2BD09
	for <ath10k@archiver.kernel.org>; Wed,  3 Jul 2024 07:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=caOin58dBjLnsYcRTyAKqudtKr99s1GI1YJpHP+UGYQ=; b=z8HOpN3HRoiOIAja0/uPEmAVZc
	dkNTykh1EmBfjGIc1EuQn0UU1bt0RLoyliYZPIIaHxFmrwaN5FB/n4ZnTQYY1xflb6r+pDHatk9ta
	LmXQOWrZpnqBI4SySfyUeG167JgqKb6bLnD87J6x8OZJz2IygSErozoYLGc+W3PFKVvCyZwtDC5lV
	iwJd3AdBS6dWPOKe31zGN6m3ngJYoecbOPRwYV7g2m30eR1jkD3biayNCQKC0DuR+yJe/z0eWYAGx
	orTk9rAVteA/M9g8gpbSN9X15vkcO8QsB6RYqtcGAi543wTf7JEI02uUXtLtYwULCKDsktTf/CnMf
	Wj/0WMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuA8-00000009ITj-2AJ5;
	Wed, 03 Jul 2024 07:12:20 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuA6-00000009ITN-0MZd
	for ath10k@lists.infradead.org;
	Wed, 03 Jul 2024 07:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719990738; x=1751526738;
  h=date:from:to:cc:subject:message-id;
  bh=wCeKaDYNs33W4A3byvN2AukGnw0l+r5vc5WsMdWTV3Y=;
  b=YudUytll9gcHltZbKvSa0LMUopL/EC4nIF+SBlwOU+nP6239F5387kiR
   52oIUyNnbGgxf+rDi+0AuaFcbvhv7DW6Nh3pTlvL+mh8tgdtvJT9/qfQd
   o71C8EF1kZW7Liqyj0SFgM9xRBSyRrkfyrUUBkb8MJi+j8v2FWCZEwf7N
   kbRPwVq1/W1wY4oCheZMYyTorDjAuqQL1P04Gn8UwO7SP5scO3SgXTt03
   W2E3dtvZlZeRrJGImWY6ExttwiB1wbQNKYhPvp60dHUcs1vHa9ZQZymnF
   5YIw9Hyirx6CDMN0tAV3KiiBqXrXbahtLZ/Foflwj9bnoWtRHLfCQiUE9
   w==;
X-CSE-ConnectionGUID: Zko9sNJyTjaFHmcHupJ6JA==
X-CSE-MsgGUID: 5PzLZfThQSSM/THEQApmSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34741246"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="34741246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 00:12:15 -0700
X-CSE-ConnectionGUID: SbWXz9Y8TdG4i4Giwakgjw==
X-CSE-MsgGUID: 4UrmE4mPRgqVDxpGAG9KaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="50768614"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 00:12:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOu9z-000PQU-1a;
	Wed, 03 Jul 2024 07:12:11 +0000
Date: Wed, 03 Jul 2024 15:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 26fe05a9c30960422e1d62d924c6eb6344ead1ae
Message-ID: <202407031531.n6rH0wQe-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_001218_161215_8E2145FD 
X-CRM114-Status: UNSURE (   3.96  )
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
branch HEAD: 26fe05a9c30960422e1d62d924c6eb6344ead1ae  Add localversion-wireless-testing-ath

elapsed time: 2160m

configs tested: 112
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240703   gcc-13.2.0
arc                   randconfig-002-20240703   gcc-13.2.0
arm                              alldefconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                     davinci_all_defconfig   gcc-13.2.0
arm                          gemini_defconfig   gcc-13.2.0
arm                        multi_v5_defconfig   gcc-13.2.0
arm                   randconfig-001-20240703   gcc-13.2.0
arm                   randconfig-002-20240703   gcc-13.2.0
arm                   randconfig-003-20240703   gcc-13.2.0
arm                   randconfig-004-20240703   gcc-13.2.0
arm                       spear13xx_defconfig   gcc-13.2.0
arm                       versatile_defconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240703   gcc-13.2.0
arm64                 randconfig-002-20240703   gcc-13.2.0
arm64                 randconfig-003-20240703   gcc-13.2.0
arm64                 randconfig-004-20240703   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240703   gcc-13.2.0
csky                  randconfig-002-20240703   gcc-13.2.0
i386         buildonly-randconfig-001-20240702   gcc-13
i386         buildonly-randconfig-002-20240702   gcc-13
i386         buildonly-randconfig-003-20240702   gcc-13
i386         buildonly-randconfig-004-20240702   gcc-13
i386         buildonly-randconfig-005-20240702   gcc-13
i386         buildonly-randconfig-006-20240702   gcc-13
i386                  randconfig-001-20240702   gcc-13
i386                  randconfig-002-20240702   gcc-13
i386                  randconfig-003-20240702   gcc-13
i386                  randconfig-004-20240702   gcc-13
i386                  randconfig-005-20240702   gcc-13
i386                  randconfig-006-20240702   gcc-13
i386                  randconfig-011-20240702   gcc-13
i386                  randconfig-012-20240702   gcc-13
i386                  randconfig-013-20240702   gcc-13
i386                  randconfig-014-20240702   gcc-13
i386                  randconfig-015-20240702   gcc-13
i386                  randconfig-016-20240702   gcc-13
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240703   gcc-13.2.0
loongarch             randconfig-002-20240703   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                         amcore_defconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          eyeq5_defconfig   gcc-13.2.0
mips                           ip27_defconfig   gcc-13.2.0
mips                      maltaaprp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240703   gcc-13.2.0
nios2                 randconfig-002-20240703   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                  or1klitex_defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240703   gcc-13.2.0
parisc                randconfig-002-20240703   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240703   gcc-13.2.0
powerpc               randconfig-002-20240703   gcc-13.2.0
powerpc               randconfig-003-20240703   gcc-13.2.0
powerpc                     tqm8560_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240703   gcc-13.2.0
powerpc64             randconfig-002-20240703   gcc-13.2.0
powerpc64             randconfig-003-20240703   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240703   gcc-13.2.0
riscv                 randconfig-002-20240703   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240703   gcc-13.2.0
s390                  randconfig-002-20240703   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               j2_defconfig   gcc-13.2.0
sh                    randconfig-001-20240703   gcc-13.2.0
sh                    randconfig-002-20240703   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sparc64               randconfig-001-20240703   gcc-13.2.0
sparc64               randconfig-002-20240703   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                    randconfig-001-20240703   gcc-13.2.0
um                    randconfig-002-20240703   gcc-13.2.0
x86_64       buildonly-randconfig-001-20240703   clang-18
x86_64       buildonly-randconfig-002-20240703   clang-18
x86_64       buildonly-randconfig-003-20240703   clang-18
x86_64       buildonly-randconfig-004-20240703   clang-18
x86_64       buildonly-randconfig-005-20240703   clang-18
x86_64       buildonly-randconfig-006-20240703   clang-18
x86_64                randconfig-001-20240703   clang-18
x86_64                randconfig-002-20240703   clang-18
x86_64                randconfig-003-20240703   clang-18
x86_64                randconfig-004-20240703   clang-18
x86_64                randconfig-005-20240703   clang-18
x86_64                randconfig-006-20240703   clang-18
x86_64                randconfig-011-20240703   clang-18
x86_64                randconfig-012-20240703   clang-18
x86_64                randconfig-013-20240703   clang-18
x86_64                randconfig-014-20240703   clang-18
x86_64                randconfig-015-20240703   clang-18
x86_64                randconfig-016-20240703   clang-18
x86_64                randconfig-071-20240703   clang-18
x86_64                randconfig-072-20240703   clang-18
x86_64                randconfig-073-20240703   clang-18
x86_64                randconfig-074-20240703   clang-18
x86_64                randconfig-075-20240703   clang-18
x86_64                randconfig-076-20240703   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240703   gcc-13.2.0
xtensa                randconfig-002-20240703   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

