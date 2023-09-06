Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E094CCFA00
	for <ath10k@archiver.kernel.org>; Wed,  6 Sep 2023 01:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/sHmVgdkc0sTRB+gEfMaJEbBz2znoAvz9SknwA1OUuE=; b=a9mj0PvusR66/3
	X5HfS0R8T7KRycE65j74X7BqYY3BSwkYwgGxV03K0xoRfZ+nuQqsuQZRFGmJc6ScCyY1kwGMe7lQr
	f1j1b6Mi22w0QtUqUFlLY0el0KYgrxHyr9X0JEEWfNE9TlUCVHY/VdhY9ut3fPMWfxmmxKvy6VTlP
	zYwXJgxfKRuvn4f8sUAkdi8d3gZL99m54BA14kqaePhEDMg5ND5EjgCNXVdWjkZnvsJGFDYdb5hGX
	g9JY/sEt4nlM2ahqzMOYLMlpjnYB9DEdBwK8SX8wA9MIMoa/FThyixfdtptKBt3ODXAoXuPn+ezIY
	ETkgOLPF8WPTLPxDW9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdhZj-0071kL-27;
	Wed, 06 Sep 2023 01:43:23 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdhZf-0071iw-1t
	for ath10k@lists.infradead.org;
	Wed, 06 Sep 2023 01:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693964599; x=1725500599;
  h=date:from:to:cc:subject:message-id;
  bh=HHIZVVa74pQdvbHBQE4L/CrvT/XfzH6EoVSpEBWYd8o=;
  b=E7rU0kcvIPPSj8aff2ZZ6Fu8G9cEjOTzRfCTZr5L9j6PiOJdaP5JJFU5
   pBxoXdEfedwVebSvLpOtixbkowEyjv3CEtOhTUkvsZqoAtO9V4DwAEHNE
   WDIpH9DhdfJCOLc1mVsLGWo0O6p9mf2gv1JxsQtAhxmvd1EG+jtY5UNNy
   bRQd5uxOzTix6TXpnkoIEK89l8ihZvTo+fLwnEMxE9c6aHWk+wDrfDM4n
   REeylFn7+Q4NtW5Grox2hfNHS4AfWTjcdcYg94RHtaZkbMHKF3lhcMlxS
   UA0zX6z4ZcrqS9vei4u/9TQZBt50IVSfnugTOrWNZaCEbw6wGYkihs5sG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="367161812"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="367161812"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 18:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="718058637"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="718058637"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Sep 2023 18:43:14 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdhZX-0002Jf-27;
	Wed, 06 Sep 2023 01:43:11 +0000
Date: Wed, 06 Sep 2023 09:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 0f4bfafc6f4ea84344d033a026882924e18d428e
Message-ID: <202309060905.uOlRgHMI-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_184319_663696_90FDA334 
X-CRM114-Status: UNSURE (   5.09  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 0f4bfafc6f4ea84344d033a026882924e18d428e  Merge branch 'ath-next' into ath-qca

elapsed time: 721m

configs tested: 173
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
arc                   randconfig-001-20230905   gcc  
arc                  randconfig-r011-20230905   gcc  
arc                  randconfig-r031-20230905   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20230905   clang
arm                  randconfig-r015-20230905   clang
arm                  randconfig-r034-20230905   gcc  
arm                         s3c6400_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230905   gcc  
arm64                randconfig-r032-20230905   clang
arm64                randconfig-r035-20230905   clang
arm64                randconfig-r036-20230905   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon               randconfig-001-20230905   clang
hexagon               randconfig-002-20230905   clang
hexagon              randconfig-r001-20230905   clang
hexagon              randconfig-r022-20230905   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230905   clang
i386         buildonly-randconfig-002-20230905   clang
i386         buildonly-randconfig-003-20230905   clang
i386         buildonly-randconfig-004-20230905   clang
i386         buildonly-randconfig-005-20230905   clang
i386         buildonly-randconfig-006-20230905   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230905   clang
i386                  randconfig-002-20230905   clang
i386                  randconfig-003-20230905   clang
i386                  randconfig-004-20230905   clang
i386                  randconfig-005-20230905   clang
i386                  randconfig-006-20230905   clang
i386                  randconfig-011-20230905   gcc  
i386                  randconfig-012-20230905   gcc  
i386                  randconfig-013-20230905   gcc  
i386                  randconfig-014-20230905   gcc  
i386                  randconfig-015-20230905   gcc  
i386                  randconfig-016-20230905   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230905   gcc  
loongarch            randconfig-r026-20230905   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                 randconfig-r021-20230905   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
mips                           rs90_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230905   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230905   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc              randconfig-r004-20230905   clang
powerpc              randconfig-r014-20230905   gcc  
powerpc                    socrates_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230905   clang
riscv                randconfig-r012-20230905   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230905   gcc  
s390                 randconfig-r024-20230905   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230905   gcc  
sparc                randconfig-r033-20230905   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r003-20230905   gcc  
sparc64              randconfig-r025-20230905   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230905   clang
x86_64       buildonly-randconfig-002-20230905   clang
x86_64       buildonly-randconfig-003-20230905   clang
x86_64       buildonly-randconfig-004-20230905   clang
x86_64       buildonly-randconfig-005-20230905   clang
x86_64       buildonly-randconfig-006-20230905   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230905   gcc  
x86_64                randconfig-002-20230905   gcc  
x86_64                randconfig-003-20230905   gcc  
x86_64                randconfig-004-20230905   gcc  
x86_64                randconfig-005-20230905   gcc  
x86_64                randconfig-006-20230905   gcc  
x86_64                randconfig-011-20230905   clang
x86_64                randconfig-012-20230905   clang
x86_64                randconfig-013-20230905   clang
x86_64                randconfig-014-20230905   clang
x86_64                randconfig-015-20230905   clang
x86_64                randconfig-016-20230905   clang
x86_64                randconfig-071-20230905   clang
x86_64                randconfig-072-20230905   clang
x86_64                randconfig-073-20230905   clang
x86_64                randconfig-074-20230905   clang
x86_64                randconfig-075-20230905   clang
x86_64                randconfig-076-20230905   clang
x86_64               randconfig-r006-20230905   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r023-20230905   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
