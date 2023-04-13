Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB07CC77B6E
	for <ath10k@archiver.kernel.org>; Thu, 13 Apr 2023 00:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6dvgJXuldJjcHL8/leNylV2tdNB2/Pmivg3xFeGHy4k=; b=RRezrM10dMV8Ll
	FqIf/ZFRrt/wQVY4VXnbd7hDVVoK9SijdGr4vOUKOu4hYrOF2OR69oTdsq4xMV6HlK0ytBHrRRa+q
	kyeHGfoZZKce33iFz4BVvTpZoMaL2KbtcxySqf57OEOOEyJ2ZT/HC2+z+CnSn5S1LmboJTbr8MfoA
	ZTn4lGYCFeULs7neDDXL6MDUtuEKl7bZAPo9ho4q4aSovONEOjKuAyLXnthnBPV8tt0GuWKOtB/1A
	lVadfZyns++iKBv5nQNyZyU8hJ2J8hCxVDjnPvbhH7JFt8SP3/xdtHYadGbHkd1zFgvKhFiI2dzNx
	l89douA3Ow4yqM0+FNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmkhW-004gqL-2x;
	Thu, 13 Apr 2023 00:20:34 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmkhU-004gp1-19
	for ath10k@lists.infradead.org;
	Thu, 13 Apr 2023 00:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681345232; x=1712881232;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bp4Du8ixQdzM/F9hbx0IjnF3I/2wO+gdDB/s4rafwxE=;
  b=hAePIa+dpk+g7pVHVovUw52dj2UO7j3PgRn+gGeN+n/cONotjoBKFFnz
   ez/18GLjthJmKKBCRNYj7lgr+7j46/iYnALOdqcL+rhYoUKsB+vfp460g
   b/PHPPrRLVqYiswKiWoDV/XGP4i6IHGeh/RCxAWK9Y7+ANu8ZAHBsgiBK
   qoteZ5jfpMWCLFTrJ4+q0IdAbFULwuOHiU9oJBd0Mie4HciGDhQdpvFlq
   22xG4dTl/w9OLU+BOUhbp8/D0axX8FdJCnHmF7+Z3kg+Lx6/zVe/DIkfW
   31+8khNHjFDlPXXAFuDjVxpiIPdzDLzRLUnhwfvSAO5/gO1W3u6ggD/Aj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="323675766"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="323675766"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 17:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863515533"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="863515533"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2023 17:20:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmkhO-000Y9v-31;
	Thu, 13 Apr 2023 00:20:26 +0000
Date: Thu, 13 Apr 2023 08:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 b9235aef84929e5330cb87125a6baf1cf7988983
Message-ID: <64374ab5.TJeR43+A9XbZw+TH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_172032_404531_6C651D5C 
X-CRM114-Status: UNSURE (   4.16  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: b9235aef84929e5330cb87125a6baf1cf7988983  wifi: ath12k: Remove redundant pci_clear_master

elapsed time: 724m

configs tested: 113
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230410   gcc  
alpha                randconfig-r026-20230410   gcc  
alpha                randconfig-r034-20230410   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230410   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230412   clang
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230409   clang
arm64                randconfig-r022-20230410   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230410   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                 randconfig-r006-20230410   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230409   gcc  
ia64                 randconfig-r022-20230409   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r022-20230412   gcc  
loongarch            randconfig-r024-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230412   gcc  
m68k                 randconfig-r013-20230412   gcc  
m68k                 randconfig-r032-20230409   gcc  
microblaze           randconfig-r032-20230410   gcc  
microblaze           randconfig-r033-20230410   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r036-20230409   gcc  
openrisc             randconfig-r031-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230409   gcc  
parisc               randconfig-r011-20230410   gcc  
parisc               randconfig-r016-20230412   gcc  
parisc               randconfig-r023-20230409   gcc  
parisc               randconfig-r034-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230410   clang
powerpc              randconfig-r006-20230409   clang
powerpc              randconfig-r014-20230412   gcc  
powerpc              randconfig-r015-20230410   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230412   gcc  
riscv                randconfig-r024-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r024-20230412   gcc  
s390                 randconfig-r026-20230409   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230412   gcc  
sh                   randconfig-r025-20230409   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230412   gcc  
sparc                randconfig-r035-20230409   gcc  
sparc64              randconfig-r023-20230412   gcc  
sparc64              randconfig-r025-20230410   gcc  
sparc64              randconfig-r036-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64               randconfig-r021-20230410   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r014-20230410   gcc  
xtensa               randconfig-r015-20230409   gcc  
xtensa               randconfig-r016-20230409   gcc  
xtensa               randconfig-r025-20230412   gcc  
xtensa               randconfig-r035-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
