Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32138C7EE29
	for <ath10k@archiver.kernel.org>; Sat, 10 Jun 2023 05:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Zla4HkC8iFpN10sBIaz0Z/cX0/22cxKE03nJYsel2o=; b=RUQeMjkItdn1oo
	kY6QTumvCWLorQcmf9rC66jImtAZA2FqFKb9d+ShyzIe8Gwglzt7B7V/sb0xz1pWOzQQh8HCG5uDf
	eJle3MS95hDQBXY1VG3BDhBkVdFSkA5aaksGjuO3tQbYgdsf5JBUG4GbJ9ns0h8YYtYce8l0kSwdz
	9wXrvyMDKBquOZOUfNRnR93jY7h0c2QYIYimACydccz+qFuaPKXOZcOYoKd8pgme5PU2wZQzRVUzv
	fLfAGIil2tuBuLUpmiiB43kZGMnjqTZQCdt6Qyf1x5gzpn9aksOfFVG71rUJM/fWhnip4zylAQ0HQ
	aGlHhBGPfnh9oRNRpxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7rNl-00FJ6A-2W;
	Sat, 10 Jun 2023 05:43:25 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7rNi-00FJ4Q-2e
	for ath10k@lists.infradead.org;
	Sat, 10 Jun 2023 05:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686375802; x=1717911802;
  h=date:from:to:cc:subject:message-id;
  bh=pNBwf16ViuUcQmwWF+EIkqcdACQ3HePrwlkas7lG8oo=;
  b=iaAITW7GZHCYGPl/3IIRQTli4MAVunIR0Vc4KlWKDg80dsDAlFA479Le
   VVp5ZpNX4uo6N4rNlE1y/tDEHTJdnBoAEr9jLGfA1tDOBQjDrAfbU/+PH
   XqnvhmKR1q4kAmL2ABEfcFulw96HKap7AkoSUX5TxOx3LZX1J+PCh81xW
   vyk6azktHYCBOHVkbC8ckc+GTgfv11TtdnFoT6pCn2tzWZKzoDGBur/Cn
   d4siWYQj2G7SaKgSpfvGDKC7YGxU+9cYIdh31sBqGclLwUWZffa0gYTJg
   gqlwPmV+kHwyrcygdQlviCv4U3uIw9sD1/25qBjCGMn6hGVPtDjMrJuEh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338095253"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338095253"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 22:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854963727"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="854963727"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 22:43:19 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7rNe-0009n0-1i;
	Sat, 10 Jun 2023 05:43:18 +0000
Date: Sat, 10 Jun 2023 13:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 ff5324129dc820dfb8575b6166da58918cfd8fe1
Message-ID: <202306101309.EVaKRumc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_224322_875646_5030C23B 
X-CRM114-Status: UNSURE (   5.42  )
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
branch HEAD: ff5324129dc820dfb8575b6166da58918cfd8fe1  Merge branch 'ath-next' into ath-qca

elapsed time: 824m

configs tested: 126
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230608   gcc  
alpha                randconfig-r023-20230608   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230608   gcc  
arc                  randconfig-r025-20230608   gcc  
arc                  randconfig-r043-20230608   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230608   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230608   clang
csky                                defconfig   gcc  
csky                 randconfig-r016-20230609   gcc  
csky                 randconfig-r035-20230609   gcc  
csky                 randconfig-r036-20230609   gcc  
hexagon              randconfig-r041-20230608   clang
hexagon              randconfig-r045-20230608   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230608   gcc  
i386                 randconfig-i002-20230608   gcc  
i386                 randconfig-i003-20230608   gcc  
i386                 randconfig-i004-20230608   gcc  
i386                 randconfig-i005-20230608   gcc  
i386                 randconfig-i006-20230608   gcc  
i386                 randconfig-i011-20230608   clang
i386                 randconfig-i012-20230608   clang
i386                 randconfig-i013-20230608   clang
i386                 randconfig-i014-20230608   clang
i386                 randconfig-i015-20230608   clang
i386                 randconfig-i016-20230608   clang
i386                 randconfig-i051-20230608   gcc  
i386                 randconfig-i052-20230608   gcc  
i386                 randconfig-i053-20230608   gcc  
i386                 randconfig-i054-20230608   gcc  
i386                 randconfig-i055-20230608   gcc  
i386                 randconfig-i056-20230608   gcc  
i386                 randconfig-i061-20230608   gcc  
i386                 randconfig-i062-20230608   gcc  
i386                 randconfig-i063-20230608   gcc  
i386                 randconfig-i064-20230608   gcc  
i386                 randconfig-i065-20230608   gcc  
i386                 randconfig-i066-20230608   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k         buildonly-randconfig-r003-20230608   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r024-20230608   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230608   clang
mips                 randconfig-r002-20230608   clang
mips                 randconfig-r012-20230609   clang
mips                 randconfig-r013-20230609   clang
mips                 randconfig-r033-20230609   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230609   gcc  
nios2                randconfig-r015-20230609   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230608   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230608   clang
s390         buildonly-randconfig-r002-20230608   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230608   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230608   gcc  
sh                   randconfig-r026-20230608   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230609   gcc  
sparc                randconfig-r031-20230609   gcc  
sparc                randconfig-r032-20230609   gcc  
sparc64              randconfig-r006-20230608   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230608   gcc  
x86_64               randconfig-a002-20230608   gcc  
x86_64               randconfig-a003-20230608   gcc  
x86_64               randconfig-a004-20230608   gcc  
x86_64               randconfig-a005-20230608   gcc  
x86_64               randconfig-a006-20230608   gcc  
x86_64               randconfig-a011-20230608   clang
x86_64               randconfig-a012-20230608   clang
x86_64               randconfig-a013-20230608   clang
x86_64               randconfig-a014-20230608   clang
x86_64               randconfig-a015-20230608   clang
x86_64               randconfig-a016-20230608   clang
x86_64               randconfig-r001-20230608   gcc  
x86_64               randconfig-r034-20230609   clang
x86_64               randconfig-x051-20230608   clang
x86_64               randconfig-x052-20230608   clang
x86_64               randconfig-x053-20230608   clang
x86_64               randconfig-x054-20230608   clang
x86_64               randconfig-x055-20230608   clang
x86_64               randconfig-x056-20230608   clang
x86_64               randconfig-x061-20230608   clang
x86_64               randconfig-x062-20230608   clang
x86_64               randconfig-x063-20230608   clang
x86_64               randconfig-x064-20230608   clang
x86_64               randconfig-x065-20230608   clang
x86_64               randconfig-x066-20230608   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
