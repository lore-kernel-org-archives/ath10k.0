Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B623FE92FD4
	for <ath10k@archiver.kernel.org>; Fri,  6 Oct 2023 02:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yTl8BTfgfFtUYpGncUTDFVPdX74wHzzAuR7INp1u3rw=; b=y8cviQfU2dQnrd
	C8V2ICrFt1PWrr0ynnPMZJcfXmNkTcVoIQfvqrLeqT+Vi48ZPEXs6g+OmL1yiB7g+zvylC2aODtes
	E1c4k/t2sHP495UzXtNy9fqtEfg6E4LjuDcvW+sq+Q1Q00jKkIH3CnHAZs0W1ysnPr0Qj2ybKgecP
	NCWllMeAuMLHVhFkjbhTt9lnInqrS824l1v9IEO9Q0JSn9Lf86sS8ld3qVXOfbM6CY/Y15rw/tpk/
	9tMiGAW/xQoqzJZtSrg2eX+jo+WmVMhewGh5rpxfre7Vznh+Qg6/CamMn6F7STFMYft7Ns/t6kcxS
	YB+F9l3/FX+ZRWqrD4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoaVE-004mBV-0s;
	Fri, 06 Oct 2023 02:23:44 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoaVB-004mAe-2l
	for ath10k@lists.infradead.org;
	Fri, 06 Oct 2023 02:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696559021; x=1728095021;
  h=date:from:to:cc:subject:message-id;
  bh=1dl5eII20MV74nyjoTIjcSVaDO49Be5btG7fr8fTdpU=;
  b=e3Vp1ifJsxjA2rvZ7beTsNlpp5iCDFMBwTFjkUDNpObvHqctBUaL0Wlr
   MAurk1f9xVnj9dTLhVC3m4IzQyn9sNaxW00SC4EaNWje2ih7I6LJSQrH5
   WqbOnS16ZSGs7S6xJJoYeT+DUhIlqHVbQT6Gd5sz4ICh5qBoIoI6s2cof
   6pDy2v0Puu7IZ7ItC7ZYURHftO9qGYySu5uYHMf5fo7n4Rf8EuJQu21cu
   ShDIyeUZlVb70NLluz0N6WYfFGDUTnALZPqHaA6nC0pJhQzMRERP1NQfO
   jvext3jC+oydUjhWNkuT/2GD+YtUPljzwnhzjNlafu8nqxqSPYha4XldD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363020812"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363020812"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 19:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="842662048"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="842662048"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Oct 2023 19:23:37 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoaV4-000M9U-2K;
	Fri, 06 Oct 2023 02:23:34 +0000
Date: Fri, 06 Oct 2023 10:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 3b961e3a412d9d4b70418f53d07847af0a7ea376
Message-ID: <202310061042.JEmXzX8S-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_192341_942383_682046EE 
X-CRM114-Status: UNSURE (   4.78  )
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
branch HEAD: 3b961e3a412d9d4b70418f53d07847af0a7ea376  Merge branch 'pending' into master-pending

elapsed time: 1164m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231005   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                   randconfig-001-20231005   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231005   gcc  
i386         buildonly-randconfig-002-20231005   gcc  
i386         buildonly-randconfig-003-20231005   gcc  
i386         buildonly-randconfig-004-20231005   gcc  
i386         buildonly-randconfig-005-20231005   gcc  
i386         buildonly-randconfig-006-20231005   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231005   gcc  
i386                  randconfig-002-20231005   gcc  
i386                  randconfig-003-20231005   gcc  
i386                  randconfig-004-20231005   gcc  
i386                  randconfig-005-20231005   gcc  
i386                  randconfig-006-20231005   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231005   gcc  
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
nios2                            alldefconfig   gcc  
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
powerpc                      walnut_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
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
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231005   gcc  
x86_64                randconfig-002-20231005   gcc  
x86_64                randconfig-003-20231005   gcc  
x86_64                randconfig-004-20231005   gcc  
x86_64                randconfig-005-20231005   gcc  
x86_64                randconfig-006-20231005   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
