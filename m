Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0CDC0015E
	for <ath10k@archiver.kernel.org>; Thu,  3 Aug 2023 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ysP4B5D7mXOv4Sqz2MdSjIha+Agtkav/B0t99Ea4NLM=; b=QorNF7zsIhsSPw
	QfCGM5poJHHlB7S2uPKW3KdZayGPEzYU0Vrf5ZkLQd2UVl8fKSjBcj0GP60tH/HN09TurBMPcq7kx
	gK7LVJkCCx200yksgm8jIEK5USGhAQDKk/1ZDLeAZ5zLSq71YVL0DZ255XrF2u85Mh8kBZr8378CT
	TAx8ifB/B7H8jmxVqRGsa/GTd3+FbVXS/eRMVKOxOt+DfVkZusvcYkUZW2fGIbsrhNQ2Q6jPWa2Ek
	d+D7r4LeaXmKjpdmdIawxTB1R6J0bXX2TN5MDumsSC0uTy7jLJc1elYqWVozv4gEUdvFlhIY0AN1A
	BPkX1fze3sqo7gEbEjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTAp-006w7w-1o;
	Thu, 03 Aug 2023 07:55:07 +0000
Received: from [192.55.52.93] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTAl-006w6k-0S
	for ath10k@lists.infradead.org;
	Thu, 03 Aug 2023 07:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691049303; x=1722585303;
  h=date:from:to:cc:subject:message-id;
  bh=0gWqsw5MlpiEr360836f+RqJoKp5D4GjIF8tj/e9mTM=;
  b=kzKCqAsZmiSq/dpYmGse5yCpZAIjNMkDSxXgKIo6nCszvrKaieE+qW7A
   dmlHuohRAPMjHwTkDJb1ilzEjFomBAhOS79nTuhUpROoU9TpQM6I5S18L
   R+nUUAxVOwBKyBioCxUpmKCDpqS4W28ZwhQJYGpEo2Iicx5I9h6bd2hnB
   zIeF3gNoZWTMuraVXhZtfHmHhITe6ZqmsAzfb4tSBHRBUk0dAhvy23AiQ
   luIHRR4RcGmQzt5kHtDogLKUXyFmJQljpk8DFFJ0bhxSM5ywQTPE/edUr
   blThQV9kMCSvoSarVs8SqJbo0BSGapztTAb1USlHkfcoHebAozgT8KxW0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367257143"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="367257143"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 00:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="843492858"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="843492858"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 00:55:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRTAi-0001sV-1T;
	Thu, 03 Aug 2023 07:55:00 +0000
Date: Thu, 03 Aug 2023 15:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 6da7bb6d17b1af6d1fa9e3bc9d043ea18ee498f1
Message-ID: <202308031557.PWc56bxa-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_005503_197387_C860BC13 
X-CRM114-Status: UNSURE (   6.25  )
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
branch HEAD: 6da7bb6d17b1af6d1fa9e3bc9d043ea18ee498f1  Add localversion-wireless-testing-ath

elapsed time: 866m

configs tested: 111
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r034-20230731   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230731   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230801   gcc  
arm                  randconfig-r046-20230731   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r036-20230731   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230801   gcc  
hexagon              randconfig-r041-20230731   clang
hexagon              randconfig-r045-20230731   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r006-20230731   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230731   gcc  
i386                 randconfig-i002-20230731   gcc  
i386                 randconfig-i003-20230731   gcc  
i386                 randconfig-i004-20230731   gcc  
i386                 randconfig-i005-20230731   gcc  
i386                 randconfig-i006-20230731   gcc  
i386                 randconfig-i011-20230801   clang
i386                 randconfig-i012-20230801   clang
i386                 randconfig-i013-20230801   clang
i386                 randconfig-i014-20230801   clang
i386                 randconfig-i015-20230801   clang
i386                 randconfig-i016-20230801   clang
i386                 randconfig-r024-20230731   clang
i386                 randconfig-r035-20230731   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                 randconfig-r016-20230801   gcc  
microblaze           randconfig-r005-20230801   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                 randconfig-r001-20230801   clang
mips                 randconfig-r022-20230731   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r015-20230801   gcc  
openrisc             randconfig-r031-20230731   gcc  
openrisc             randconfig-r032-20230731   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230731   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     mpc5200_defconfig   clang
powerpc              randconfig-r003-20230801   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230801   clang
riscv                randconfig-r025-20230731   clang
riscv                randconfig-r042-20230731   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r021-20230731   clang
s390                 randconfig-r044-20230731   clang
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230731   gcc  
sparc64              randconfig-r002-20230801   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r014-20230801   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230731   gcc  
x86_64       buildonly-randconfig-r002-20230731   gcc  
x86_64       buildonly-randconfig-r003-20230731   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230731   clang
x86_64               randconfig-x002-20230731   clang
x86_64               randconfig-x003-20230731   clang
x86_64               randconfig-x004-20230731   clang
x86_64               randconfig-x005-20230731   clang
x86_64               randconfig-x006-20230731   clang
x86_64               randconfig-x011-20230731   gcc  
x86_64               randconfig-x012-20230731   gcc  
x86_64               randconfig-x013-20230731   gcc  
x86_64               randconfig-x014-20230731   gcc  
x86_64               randconfig-x015-20230731   gcc  
x86_64               randconfig-x016-20230731   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
