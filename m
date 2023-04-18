Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74649C77B76
	for <ath10k@archiver.kernel.org>; Tue, 18 Apr 2023 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oqtD/PmlT2fOKRO3SZCRUVgaI0nPllYsc5q8krMXcSY=; b=gl/n23pfhV8SmK
	TpnQs3xfQRZ87v4ApqSzFCCz/5cgpO2cibz9Ld8FcJw6lIWEw5hUhw7Yj+P/YMsw58wcXJdIcyoV2
	HK7gPRfsLzfETnSw2FiXyE0kI0ZT5x8CZD644IT/nJZaCp7kaqi1gZXjuVCKFU4UCqHVcdi1syBN5
	KZhYj+rheCqOAy8QpHEiS5fC8bnJiW5XVJdMtyc9X0sXxc1bBH5cst4u+4IH9Uo1X8uNoFq8xtC7o
	50tWyWPV1tqyt2EUoRYc9B8oF3PXYaAJr9Ge+M0yUjx+JGJn3Zqte+Pis4HyphFLk+1UvF0g2EdeL
	C6ZxC1tqEprQg0EAaiLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pot0x-003P53-0E;
	Tue, 18 Apr 2023 21:37:27 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pot0t-003P3g-0w
	for ath10k@lists.infradead.org;
	Tue, 18 Apr 2023 21:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681853843; x=1713389843;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jkaA3FB8Ev78pts4VFoReEH7pT31uwy1C+8OGAWc5jc=;
  b=TNfNofwRdr3KGzFbAQ9rCtyPHu3iWI0EqD0O3DhTPO4OgtoBCSBNkRLg
   5a4RlQmbngvvmJ2ubsTL6X5TGrJ47dBN3EYBEU4VtWIo7FMQt2YBrcJgS
   d1x0L0lg2JpUeyD60KQzWwi1MNZXoNVuefGPVPEobuPZLQmkX8kd71jfq
   Aq7xHLs2te4BOA2I2dgoMqakv1ANV1sGZJ1mWS8MMqH+qPG0UCtju0X5O
   nqYDadR3U/XWPSpClYvtj0rNR2+Z7C9lGQWVB1XYWWaQPH8AfYR7t8R4Q
   N/FKhW+7JbzzX7TlBkciC0ezugrrDth+LesF49NqLnR0DJx+28Yxe8jMu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="347144730"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="347144730"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 14:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="723831642"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="723831642"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Apr 2023 14:37:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pot0g-000e5K-0N;
	Tue, 18 Apr 2023 21:37:10 +0000
Date: Wed, 19 Apr 2023 05:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 f384847bf49fe67b54b71574a17b488080fc0b0d
Message-ID: <643f0d82.Oo/jHuzVNEFQVuoV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_143723_377948_E96E5878 
X-CRM114-Status: UNSURE (   6.59  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: f384847bf49fe67b54b71574a17b488080fc0b0d  Merge branch 'pending' into master-pending

elapsed time: 731m

configs tested: 126
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230417   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230417   gcc  
arc                  randconfig-r043-20230418   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r006-20230418   clang
arm                                 defconfig   gcc  
arm                  randconfig-r035-20230417   clang
arm                  randconfig-r046-20230418   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230417   gcc  
arm64        buildonly-randconfig-r004-20230416   clang
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230418   clang
arm64                randconfig-r006-20230417   gcc  
arm64                randconfig-r033-20230417   gcc  
csky         buildonly-randconfig-r004-20230417   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230417   gcc  
csky                 randconfig-r034-20230416   gcc  
hexagon              randconfig-r001-20230417   clang
hexagon              randconfig-r013-20230416   clang
hexagon              randconfig-r041-20230418   clang
hexagon              randconfig-r045-20230418   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230416   gcc  
ia64                 randconfig-r005-20230416   gcc  
ia64                 randconfig-r006-20230416   gcc  
ia64                 randconfig-r011-20230416   gcc  
ia64                 randconfig-r014-20230418   gcc  
ia64                 randconfig-r032-20230417   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230416   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230418   gcc  
m68k                 randconfig-r006-20230418   gcc  
m68k                 randconfig-r015-20230416   gcc  
microblaze   buildonly-randconfig-r003-20230418   gcc  
microblaze           randconfig-r003-20230416   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r004-20230418   gcc  
mips                 randconfig-r002-20230418   gcc  
mips                 randconfig-r004-20230417   clang
mips                 randconfig-r013-20230417   gcc  
mips                 randconfig-r033-20230416   gcc  
mips                 randconfig-r036-20230416   gcc  
nios2        buildonly-randconfig-r001-20230416   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230417   gcc  
nios2                randconfig-r015-20230418   gcc  
openrisc     buildonly-randconfig-r001-20230418   gcc  
openrisc     buildonly-randconfig-r005-20230417   gcc  
openrisc             randconfig-r014-20230416   gcc  
parisc       buildonly-randconfig-r002-20230416   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230417   gcc  
parisc               randconfig-r032-20230416   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r005-20230416   gcc  
powerpc              randconfig-r015-20230417   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230418   gcc  
riscv        buildonly-randconfig-r006-20230417   clang
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230417   gcc  
riscv                randconfig-r012-20230418   gcc  
riscv                randconfig-r035-20230416   clang
riscv                randconfig-r042-20230418   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230417   clang
s390                                defconfig   gcc  
s390                 randconfig-r044-20230418   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230418   gcc  
sh                   randconfig-r003-20230417   gcc  
sh                   randconfig-r011-20230418   gcc  
sh                   randconfig-r012-20230417   gcc  
sh                   randconfig-r013-20230418   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230416   gcc  
sparc64              randconfig-r016-20230416   gcc  
sparc64              randconfig-r016-20230418   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r001-20230416   gcc  
xtensa               randconfig-r034-20230417   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
