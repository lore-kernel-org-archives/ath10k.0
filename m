Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1C1C77B75
	for <ath10k@archiver.kernel.org>; Sat,  6 May 2023 01:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IXzqJOWiKUyVlREdfTi8k/d7BNeNh3SiVkCf27ZbtiQ=; b=TIM2Z7GxP/ZGk3
	iBLc6LlxDZ2jFBk+CEzKSXxOFQ3EP/3NORThDkhvJkjVEBp+e+St3LmKEilSqAGcC60IvllngwpdI
	9y8PmR26/Vt+EmESo3Tb9hk7UmWbZQ/EaIwZDOYYYBvwI9mkgiEav/e9o5tTX8xK2+6SKwEKc/qXZ
	+vhNht3irGVmUJ4+9ALkghfQHgtXgJozETZL7unxC4AAesb8P0/lK78Kb/B8wFoC2NEBdIAWUIOC8
	5sHQME5p5NBymUKXZLVKvP/t6E0fO5Ul67hOXxFo57h2lbMffNc9mb9z3iI9j9Od31ZO0ZWa8PLx2
	Nj21kV27Vs7LuvTyI4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv6uh-00CHmW-0m;
	Sat, 06 May 2023 01:40:43 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv6ud-00CHm0-1J
	for ath10k@lists.infradead.org;
	Sat, 06 May 2023 01:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683337239; x=1714873239;
  h=date:from:to:cc:subject:message-id;
  bh=P9kCg9d2lFiA+WH/OzSRRH1QKZLUiCbQKU3LNq9T124=;
  b=GdVOQcbn4wuOBJeAIabG34nzmNn1IEXoty4xy+VQyJRZ6cQSpO/hYEV6
   aM8TvRvTh3MyUHdwrHnoWqXwkbDPZuXAzwJSi5JSMQst4b4VsLyrJGmnP
   jS3ukNDBzcetkUe/sDMg/5yzlQPB/J6Iw1BJ9J6f/TMLrehKgkQ0gkPfz
   d7QOgkCUmNo57GPowo5+UdYCKG0A3jG/hTEbRUPYImGDielM1BvPx9HbL
   Kpk2PaKAwQsA2w/FRPBFnSZJmV1nnGw75CO3OJPBi+YtWZZqxMlwjdoU1
   w+0CGtd024JMBhZVFoHq4FZa3swKrK6nOsGCU+IklTrEf4dyG1VxIjV8u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="351477663"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="351477663"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 18:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="700687436"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="700687436"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 May 2023 18:40:33 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv6uX-00012Q-0z;
	Sat, 06 May 2023 01:40:33 +0000
Date: Sat, 06 May 2023 09:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 74db3a7cfd28edaaaaf0abaa551bc1658bc5dc08
Message-ID: <20230506013934.M9_Fc%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_184039_527427_6E6B8013 
X-CRM114-Status: UNSURE (   4.40  )
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
branch HEAD: 74db3a7cfd28edaaaaf0abaa551bc1658bc5dc08  Merge branch 'pending' into master-pending

elapsed time: 728m

configs tested: 178
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230502   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230505   gcc  
alpha                randconfig-r003-20230501   gcc  
alpha                randconfig-r006-20230505   gcc  
alpha                randconfig-r021-20230502   gcc  
alpha                randconfig-r022-20230501   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230502   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230501   gcc  
arc                  randconfig-r011-20230430   gcc  
arc                  randconfig-r016-20230505   gcc  
arc                  randconfig-r025-20230430   gcc  
arc                  randconfig-r031-20230501   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arc                  randconfig-r043-20230502   gcc  
arc                  randconfig-r043-20230505   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230430   clang
arm                  randconfig-r016-20230501   gcc  
arm                  randconfig-r022-20230430   gcc  
arm                  randconfig-r025-20230502   clang
arm                  randconfig-r032-20230430   clang
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm                  randconfig-r046-20230502   clang
arm                  randconfig-r046-20230505   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230502   clang
arm64                randconfig-r006-20230430   gcc  
arm64                randconfig-r011-20230501   clang
arm64                randconfig-r014-20230504   gcc  
arm64                randconfig-r016-20230504   gcc  
arm64                randconfig-r026-20230502   gcc  
csky         buildonly-randconfig-r001-20230505   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230430   gcc  
csky                 randconfig-r016-20230430   gcc  
csky                 randconfig-r021-20230430   gcc  
csky                 randconfig-r022-20230502   gcc  
csky                 randconfig-r032-20230504   gcc  
hexagon              randconfig-r014-20230505   clang
hexagon              randconfig-r031-20230504   clang
hexagon              randconfig-r036-20230501   clang
hexagon              randconfig-r041-20230430   clang
hexagon              randconfig-r041-20230501   clang
hexagon              randconfig-r041-20230502   clang
hexagon              randconfig-r041-20230505   clang
hexagon              randconfig-r045-20230430   clang
hexagon              randconfig-r045-20230501   clang
hexagon              randconfig-r045-20230502   clang
hexagon              randconfig-r045-20230505   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230501   gcc  
i386                 randconfig-a002-20230501   gcc  
i386                 randconfig-a003-20230501   gcc  
i386                 randconfig-a004-20230501   gcc  
i386                 randconfig-a005-20230501   gcc  
i386                 randconfig-a006-20230501   gcc  
i386                 randconfig-a011-20230501   clang
i386                 randconfig-a012-20230501   clang
i386                 randconfig-a013-20230501   clang
i386                 randconfig-a014-20230501   clang
i386                 randconfig-a015-20230501   clang
i386                 randconfig-a016-20230501   clang
i386                 randconfig-r025-20230501   clang
i386                 randconfig-r026-20230501   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230505   gcc  
ia64                 randconfig-r011-20230504   gcc  
ia64                 randconfig-r036-20230504   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230502   gcc  
loongarch            randconfig-r005-20230430   gcc  
loongarch            randconfig-r013-20230430   gcc  
loongarch            randconfig-r014-20230430   gcc  
loongarch            randconfig-r023-20230501   gcc  
loongarch            randconfig-r026-20230430   gcc  
loongarch            randconfig-r034-20230504   gcc  
loongarch            randconfig-r035-20230430   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230504   gcc  
m68k                 randconfig-r033-20230504   gcc  
microblaze   buildonly-randconfig-r003-20230505   gcc  
microblaze           randconfig-r001-20230501   gcc  
microblaze           randconfig-r002-20230430   gcc  
microblaze           randconfig-r024-20230502   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r003-20230505   clang
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230502   gcc  
nios2                randconfig-r035-20230504   gcc  
openrisc             randconfig-r004-20230501   gcc  
openrisc             randconfig-r013-20230501   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r015-20230430   gcc  
parisc               randconfig-r015-20230502   gcc  
parisc               randconfig-r031-20230430   gcc  
parisc               randconfig-r032-20230501   gcc  
parisc               randconfig-r033-20230501   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r012-20230502   gcc  
powerpc              randconfig-r034-20230501   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230505   clang
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                randconfig-r042-20230502   gcc  
riscv                randconfig-r042-20230505   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230502   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230505   clang
s390                 randconfig-r013-20230504   gcc  
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
s390                 randconfig-r044-20230502   gcc  
s390                 randconfig-r044-20230505   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230505   gcc  
sh                   randconfig-r004-20230502   gcc  
sh                   randconfig-r011-20230505   gcc  
sh                   randconfig-r013-20230505   gcc  
sh                   randconfig-r014-20230502   gcc  
sh                   randconfig-r021-20230501   gcc  
sh                   randconfig-r024-20230430   gcc  
sh                   randconfig-r033-20230430   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230501   gcc  
sparc                randconfig-r012-20230430   gcc  
sparc                randconfig-r036-20230430   gcc  
sparc64              randconfig-r014-20230501   gcc  
sparc64              randconfig-r023-20230430   gcc  
sparc64              randconfig-r034-20230430   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230501   gcc  
x86_64               randconfig-a002-20230501   gcc  
x86_64               randconfig-a003-20230501   gcc  
x86_64               randconfig-a004-20230501   gcc  
x86_64               randconfig-a005-20230501   gcc  
x86_64               randconfig-a006-20230501   gcc  
x86_64               randconfig-a011-20230501   clang
x86_64               randconfig-a012-20230501   clang
x86_64               randconfig-a013-20230501   clang
x86_64               randconfig-a014-20230501   clang
x86_64               randconfig-a015-20230501   clang
x86_64               randconfig-a016-20230501   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r005-20230502   gcc  
xtensa               randconfig-r011-20230502   gcc  
xtensa               randconfig-r012-20230501   gcc  
xtensa               randconfig-r015-20230504   gcc  
xtensa               randconfig-r023-20230502   gcc  
xtensa               randconfig-r035-20230501   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
