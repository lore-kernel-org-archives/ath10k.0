Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF86C48260
	for <ath10k@archiver.kernel.org>; Thu, 25 Jan 2024 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=87NisgDYOLjoZqNl4hNZqTR1lILSk9N56o2OHgItj8M=; b=EJHS4YRjGkezlxs8PEuNlN7T3x
	zCrtZjhtPTTIRlpdHdI7h6DgDqI1ZyqqID5DdmlStphRwCmtxBgk0jZkSygE4Io1jdfricJ76hPO4
	8vn14ehCdjROflzI3VOmz1YjdBsZude+BP1w3w/jokMdxdBVTY5pugBh65QZQDvnutE0y//7pLuot
	ZEuWp5ghgHljlPn3HRoWYufCL7Nxyr8zyNXhlb0/igNY7b/Y3wt7iiIWXMMV2UXxCUuVVqyi2CThQ
	pt4nOsYsEvhRW2X7OaC/fue8EDUiTG+K1Cj51vOMVg0qT2LhYTI3fBDibdYx9Q3w8DN0Ap9sDnhb2
	m3oq6dQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Jv-00000000Cfj-409Q;
	Thu, 25 Jan 2024 14:03:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Ju-00000000Ced-2ci3
	for ath10k@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=87NisgDYOLjoZqNl4hNZqTR1lILSk9N56o2OHgItj8M=; b=HMg8dJFsz74z8KtBqnvIVz7n3p
	WABnqTtfPaOLLBIFWFwELxJkbOSsaGFNZiPo9vAixzcC4KceEvtgvdrkJ97mTuT/IHOSHQ/6u5I/J
	j7q/X6LhrOkp6mH6O21UB+Nl7+gx8aLxK0kBD5HvQLcFDdELNr4RZaMuMY5jdgdH7KlctyaQfwayq
	YY277sP8rKPOsjDiFl8EqgxqoG0EELuHAvITzgaGav1Igzr8kSI1anNEYFhdVhUuD28mX36LEp6v5
	tfzuoH6IxC+KqTmdfbdubSzKLQBbeiUi1dTsZ0zmKnrjoLZz2QTIaFuDuROMJK1KRs4AeUFAjxa9b
	li0jDRCw==;
Received: from mgamail.intel.com ([192.55.52.93])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSxjs-00000005Ab2-2rLi
	for ath10k@lists.infradead.org;
	Thu, 25 Jan 2024 11:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706181464; x=1737717464;
  h=date:from:to:cc:subject:message-id;
  bh=0C6RL0P9AXXXcLyBDdQa66Ur6XD8i3rtvOEEJ/3gOmQ=;
  b=f88r+aLSBMAsGURzAzA2z8sRYkwOIiuybmnfxgQrtC+JbSBnV8ufjfaw
   mo25CP6DB7MV+7X8g9whma0joKLmaJozY4FiStpMhkXz4li+wR4zFMfi9
   A/eKOk1lHUo4at0y+fOb5f5gX7EmDAJ7bQHh+wmvLqfTih0hXVfwiMkpl
   Gm4zR9f968iAMrLSz/co0CeopEasVD35WWW0owOlN6i/fHauf6uCKGaSY
   mjC1RnuCRQ/q5J6UmEkUjRPYF24jmfdwktlz+MK7FRX3gj02RBN+7V54G
   sJ809dhWwxBe0s7QYQ1MXzTK9R5St40AUSRic64yVTeilMU67ApFnTbDm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399295111"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="399295111"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 03:16:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28453376"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Jan 2024 03:16:33 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSxig-0008vT-2x;
	Thu, 25 Jan 2024 11:16:30 +0000
Date: Thu, 25 Jan 2024 19:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 67a48d937fac917947540c9f89630d472cd61fcb
Message-ID: <202401251953.aHiSOJen-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_111745_151483_FD132FA1 
X-CRM114-Status: UNSURE (   5.48  )
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
branch HEAD: 67a48d937fac917947540c9f89630d472cd61fcb  wifi: ath12k: Fix issues in channel list update

elapsed time: 1491m

configs tested: 118
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240125   gcc  
arc                   randconfig-002-20240125   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240125   gcc  
arm                   randconfig-002-20240125   gcc  
arm                   randconfig-003-20240125   gcc  
arm                   randconfig-004-20240125   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240125   gcc  
arm64                 randconfig-002-20240125   gcc  
arm64                 randconfig-003-20240125   gcc  
arm64                 randconfig-004-20240125   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240125   gcc  
csky                  randconfig-002-20240125   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240125   clang
hexagon               randconfig-002-20240125   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240124   clang
i386         buildonly-randconfig-002-20240124   clang
i386         buildonly-randconfig-003-20240124   clang
i386         buildonly-randconfig-004-20240124   clang
i386         buildonly-randconfig-005-20240124   clang
i386         buildonly-randconfig-006-20240124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240124   clang
i386                  randconfig-002-20240124   clang
i386                  randconfig-003-20240124   clang
i386                  randconfig-004-20240124   clang
i386                  randconfig-005-20240124   clang
i386                  randconfig-006-20240124   clang
i386                  randconfig-011-20240124   gcc  
i386                  randconfig-012-20240124   gcc  
i386                  randconfig-013-20240124   gcc  
i386                  randconfig-014-20240124   gcc  
i386                  randconfig-015-20240124   gcc  
i386                  randconfig-016-20240124   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240125   gcc  
loongarch             randconfig-002-20240125   gcc  
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
nios2                 randconfig-001-20240125   gcc  
nios2                 randconfig-002-20240125   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240125   gcc  
parisc                randconfig-002-20240125   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240125   gcc  
powerpc               randconfig-002-20240125   gcc  
powerpc               randconfig-003-20240125   gcc  
powerpc64             randconfig-001-20240125   gcc  
powerpc64             randconfig-002-20240125   gcc  
powerpc64             randconfig-003-20240125   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20240125   gcc  
riscv                 randconfig-002-20240125   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240125   clang
s390                  randconfig-002-20240125   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240125   gcc  
sh                    randconfig-002-20240125   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240125   gcc  
sparc64               randconfig-002-20240125   gcc  
um                    randconfig-001-20240125   gcc  
um                    randconfig-002-20240125   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240125   gcc  
x86_64       buildonly-randconfig-002-20240125   gcc  
x86_64       buildonly-randconfig-003-20240125   gcc  
x86_64       buildonly-randconfig-004-20240125   gcc  
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240125   gcc  
xtensa                randconfig-002-20240125   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

