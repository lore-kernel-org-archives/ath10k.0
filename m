Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36918E78480
	for <ath10k@archiver.kernel.org>; Sun,  1 Oct 2023 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZPX6pBK3bW6g5+fjE0NQ0vR1kISOs9rFRd8SXVh5hCU=; b=PE9fmg3pzDMEAL
	dEY763TIjVpdjbBA1yPl1SWHZrU/GAOHO38LfWP0RcAgS5BuS0jKqxOp01nf9SWCuLeQkJI01jL+t
	1CJ/tVHbR/XA+BI0rLPubyWiH7W8/qMaO4Y7Bu4/QMF3GQAUrKSDg58M5KgOs4j74Pr1hYeHAswLV
	uj0hOZJdN0Htz70uWd94t2KHpncWdATRzLbDZk06Sv5av1ypV9vcZcOYvTXfoG2moi1M0UnEA5SI7
	EqaNhB9vBJRkk1ukPPDIbnrC5dcS66MQBiu2CGQj5Xi5mqP4hFWHjJNrJkUnfotn+vM8Op5sG3QbO
	C6ZRPCdUoH5NHQioQlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qn1yb-00BYx6-24;
	Sun, 01 Oct 2023 19:19:37 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qn1yY-00BYwj-0B
	for ath10k@lists.infradead.org;
	Sun, 01 Oct 2023 19:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696187973; x=1727723973;
  h=date:from:to:cc:subject:message-id;
  bh=2ZurJLq5hHBGDX96ARmB4WmFtHiB8TOQnucw6UMSq58=;
  b=N9APBVqSV6+QZkVk+6ryFoAaq0q7CIRJ/u+/J4j4cydbeXg9ithI9aEO
   0pzmCK6Muf/+XWwHqog0vFg6J35attO4dV0ugrCg9P8x9TXJ+cpq2Ka9/
   bkK/4RH33FUcsZ7Hzo7D5U++b4EwRs3gpUB+ZvWGJcxebTQ4bykXfrnMN
   +/P/mviBqftSg+Y1Js7CTrmy8wyQts1ge3kF1rbWFb+/M9jDAKUrP/Aqi
   uBVrjZqrxhJlHJiUwi+hnWk2LgPem8Dhrg3rxL1pSici73Ftpwi8Rtm3W
   xSlcx6nsq/yGY4PSmhJF0/8Xz0NG3IMMLt6FByNftqVP0RnmKjtSTFwlH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="372897155"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="372897155"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 12:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="727079493"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="727079493"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Oct 2023 12:19:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn1yQ-0005Ld-1E;
	Sun, 01 Oct 2023 19:19:26 +0000
Date: Mon, 02 Oct 2023 03:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 0bbbc06997138a36bdd05778a55207ccbef8ca04
Message-ID: <202310020337.wStI2k4E-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_121934_192219_C05B74D5 
X-CRM114-Status: UNSURE (   5.33  )
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
branch HEAD: 0bbbc06997138a36bdd05778a55207ccbef8ca04  Merge branch 'pending' into master-pending

elapsed time: 2289m

configs tested: 106
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
arc                   randconfig-001-20230930   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230930   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230930   gcc  
i386                  randconfig-002-20230930   gcc  
i386                  randconfig-003-20230930   gcc  
i386                  randconfig-004-20230930   gcc  
i386                  randconfig-005-20230930   gcc  
i386                  randconfig-006-20230930   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230930   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230930   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230930   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230930   gcc  
x86_64       buildonly-randconfig-002-20230930   gcc  
x86_64       buildonly-randconfig-003-20230930   gcc  
x86_64       buildonly-randconfig-004-20230930   gcc  
x86_64       buildonly-randconfig-005-20230930   gcc  
x86_64       buildonly-randconfig-006-20230930   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230930   gcc  
x86_64                randconfig-002-20230930   gcc  
x86_64                randconfig-003-20230930   gcc  
x86_64                randconfig-004-20230930   gcc  
x86_64                randconfig-005-20230930   gcc  
x86_64                randconfig-006-20230930   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
