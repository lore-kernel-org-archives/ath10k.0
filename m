Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB91C6FD1C
	for <ath10k@archiver.kernel.org>; Sat, 25 Mar 2023 03:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3KjJlk8Ad8qjrsmJNgyjRYr5pLa9ykaFWSUprF0NbjM=; b=3HcYvyhulyDM1u
	mUqkVu6WfY5NDzFrv2aYkp2Aco6n2chqTJjZRPaUmtcmSpz6dimkJsaUVQmnqZ8MOP2rqcYZh7Oe0
	ektY1orTo5ztGSt1H5wvd0rKP3Ye/VSRFTO5Iq9AXWuzTtUKyE57cAzv6Qn5R2DpydgVXHy6QnAFB
	TeMyszkaQytoPQm9ZQLx3K5K/kDRqZhX+ZZc1TD9VKWhh8WdD3uzAQwZUW+xTJ8acIFDj9NBLAcRU
	p55IYg0/61YJr+WjGFJ8sOJblREqPE+UwkiMm9Lans8Xn++uDIlPeZVYlXZrq7m133U4LVcfdHTBK
	hoaJeE/jq2RHIh/ObiDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfuB8-00619v-28;
	Sat, 25 Mar 2023 03:02:50 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfuB6-00618l-1X
	for ath10k@lists.infradead.org;
	Sat, 25 Mar 2023 03:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679713368; x=1711249368;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DHkxAw6Xt60uMxXfl4ilMfkE1gKKGoLedvifav6YGD4=;
  b=C/uFBlpdIJ5CWlk4noHSW+yRPzJN3aU04HqpZ05TtRkq3WOdi4NGVyHU
   nuL8iFc3ywjl14VrUR9geEhsTxpF7LYo5+rqbxW3FcoCCxGG9Nbvnj2gb
   rXjpSyFio3R/V8NveO5GX4NSJFBF3bU9eaTFg2CfcY8VaqkSf2aC0/JBV
   Dg3QR0zAqtHjJlAUywhppUuw9BZWpya+9bPcdvvheMfbPjbRyDSMFv6Up
   aZezJL+kGNQmWB8O2olOzsgx8S2ax2Yoq6p3p+n7wVyNtJ7pa/Gzvb87U
   pC8cdJhuesRwcu4kkZIIhXWM4RAJtMIkqHLbcdwvNp/J9of/ClHGjMT/I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338651615"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="338651615"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 20:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="676381891"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="676381891"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2023 20:02:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfuB2-000Ftn-1A;
	Sat, 25 Mar 2023 03:02:44 +0000
Date: Sat, 25 Mar 2023 11:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 c2bb0e7b1c446c3bee2c2bae368ce9a5bd72a4a3
Message-ID: <641e644f.Rqjn9pEJ0uqAxVL5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_200248_528925_43A401FF 
X-CRM114-Status: UNSURE (   4.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: c2bb0e7b1c446c3bee2c2bae368ce9a5bd72a4a3  Merge branch 'ath-next' into ath-qca

elapsed time: 721m

configs tested: 102
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r034-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r021-20230322   clang
arm                  randconfig-r033-20230322   gcc  
arm                  randconfig-r046-20230322   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r022-20230322   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230322   gcc  
csky                 randconfig-r025-20230322   gcc  
csky                 randconfig-r026-20230322   gcc  
csky                 randconfig-r036-20230322   gcc  
hexagon              randconfig-r002-20230322   clang
hexagon              randconfig-r004-20230322   clang
hexagon              randconfig-r012-20230322   clang
hexagon              randconfig-r013-20230322   clang
hexagon              randconfig-r035-20230322   clang
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
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
ia64                 randconfig-r001-20230324   gcc  
ia64                 randconfig-r005-20230322   gcc  
ia64                 randconfig-r032-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230322   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230322   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230322   gcc  
mips                 randconfig-r015-20230322   clang
mips                 randconfig-r023-20230322   clang
nios2        buildonly-randconfig-r002-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230324   gcc  
nios2                randconfig-r016-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230324   gcc  
parisc               randconfig-r006-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230324   clang
s390                 randconfig-r031-20230322   clang
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r011-20230322   gcc  
sparc                               defconfig   gcc  
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
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
