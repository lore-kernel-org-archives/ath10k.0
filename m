Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43294CCF9FF
	for <ath10k@archiver.kernel.org>; Wed,  6 Sep 2023 01:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3DZuvTirISOa5CSyMtXZYjwjIALA8OH9nVB8yQtR5Rk=; b=ZVgaZ0u3QYOmh1
	EAfZTnxFgRtqajFgbhN4f7wIcVmqdPCpmU6649mf9Xu9w7H00muMg3fFUvvKmvt4iki67NmZ2eJfh
	dIhCDdQm4iPZZtOc37lh9hcKbIBR2Tu69lPCf2Vmo/0m0uiDXEvS1KY8qXfCaCSl+WWdFC8Lon0I5
	LWz7rYLsYSq+mrYeoVSgrQ3kjlzWJwUoOKDLl2Jo/1AuJdMqEwP+TX8iD0l8wjuFMNdH3ih7aJGpv
	i5hEhN146a65+ZffEmPB2/7Fh12iZIYdTYBczw+43xjgAVKXRnr0cN7NAm0wmGl/qaiG6+XJSvPYk
	rc6iwLBmiTlDfO8Yb+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdhZg-0071jj-11;
	Wed, 06 Sep 2023 01:43:20 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdhZd-0071ix-0L
	for ath10k@lists.infradead.org;
	Wed, 06 Sep 2023 01:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693964597; x=1725500597;
  h=date:from:to:cc:subject:message-id;
  bh=c8W1hR1W3BovdfBJXQVIcPPkZZIuNKcSifzMiqEX6yk=;
  b=E6va7qaBrFdjD/UeOjTJoq2hB1Sinij5N0gcKkDMi4sFNHXMEdBYnu4h
   jpED6vUpsUb8JH6gIY5txACK2Na3odRkWTHMeOzSOk1O2a94ymFAxPLZv
   M+SWOWtYq+mlBNllBawN3wSgbpgbTdgEi2IsBuUr8A4Zc5YdkwN+rqQcl
   O6Xc7Pr3fMcAp1IQltP8hAOKsB0V0ng+8+dghuIzPzakQk+F+SFlX2Bao
   pO/C+LLQKHxUQ8boEMj1zQ6l+/z7qD0bq2cgxKoLwhEkZjs5FcwXiOqWr
   3x5LY03Wxs2CQ3MsGvldRLibaqMFKzOFjcKdRSvG3AEoL05M+ai9ps+rd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="463324769"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="463324769"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 18:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="856224916"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="856224916"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2023 18:43:13 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdhZX-0002Jd-22;
	Wed, 06 Sep 2023 01:43:11 +0000
Date: Wed, 06 Sep 2023 09:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 0263687f4441d5a5eab8074d56b4693c8f0acf85
Message-ID: <202309060956.yNLn4jwb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_184317_196627_F4DA5634 
X-CRM114-Status: UNSURE (   5.52  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 0263687f4441d5a5eab8074d56b4693c8f0acf85  Revert "PCI: Release resource invalidated by coalescing"

elapsed time: 721m

configs tested: 168
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230905   gcc  
alpha                randconfig-r014-20230905   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230905   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   gcc  
arm                   randconfig-001-20230905   clang
arm                  randconfig-r031-20230905   gcc  
arm                  randconfig-r035-20230905   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230905   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r032-20230905   gcc  
hexagon               randconfig-001-20230905   clang
hexagon               randconfig-002-20230905   clang
hexagon              randconfig-r006-20230905   clang
hexagon              randconfig-r025-20230905   clang
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
loongarch            randconfig-r015-20230905   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230905   gcc  
m68k                 randconfig-r036-20230905   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                 randconfig-r011-20230905   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r034-20230905   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r002-20230905   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230905   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                     ppa8548_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230905   clang
riscv                randconfig-r023-20230905   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230905   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r003-20230905   gcc  
sh                   randconfig-r026-20230905   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r001-20230905   gcc  
sparc64              randconfig-r004-20230905   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r005-20230905   gcc  
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
x86_64               randconfig-r024-20230905   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r022-20230905   gcc  
xtensa               randconfig-r033-20230905   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
