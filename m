Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9415DC77B61
	for <ath10k@archiver.kernel.org>; Thu, 27 Apr 2023 03:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=otTGhGB3VPs2FRF/xWjGF8tkQ4vPcRJOj8Uf0c6YWy8=; b=lD3MLNBkbns6Z7
	0Tai961kNXCpvC0QPEfpoNUTT/ZefHHQABJZgcm3bECxqAt8tuOK9UAozTUp3ZSUvD8yLGf1N17KF
	JcGVBkOP4xXROou0u9rGK00O9JHjbmZNB0l2WieWGQhp+dEajvTZ+Tkl8nihccEbHcq4mt4lz17lc
	VzOsTZHO9PtS4g+X7XzoNSKQtCqy+y0DrzAxHsCSH/Sw+RZQOU/fFnn7Cu9dqWJZAcEvMY+g+pxPc
	hXxWy9Vx191bX9+MQvVeOKJn5aaF6hz05nYmCQOhh9CL/fxUVOeuy1lEYob6AkzY8d3C1+4TGA/p+
	1mrCWsdcfH3jHfQBziPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prs1W-005KW7-2O;
	Thu, 27 Apr 2023 03:10:22 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prs1T-005KVO-36
	for ath10k@lists.infradead.org;
	Thu, 27 Apr 2023 03:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682565019; x=1714101019;
  h=date:from:to:cc:subject:message-id;
  bh=ObtUtvS2McpknKIyuHK9nPpy6G7lBsA6Pxv8c/ir3IM=;
  b=Six4EV36BaGODmYbKZKSki6ySBarh4s+6PkH2LF8xcz4/YNeIlHJUhIL
   yclRz++kI+kUyZqPqwXLTzLmFKb08Z8ewFwWrR7xTCxHIpp+htWGEWiLO
   jG4LAG82pAxN03da07XaA941HTD78v1uDEc7UE0xsMoF8kP1HIeFjmXOQ
   kXfTHDlDNOBosMh3DNParl1VQ0aV+0aGYdThdKgaVLNbPcolWnMIL6xyT
   e2QpTYX6XWpPf0oAe1RDY3T6ncK1Z8FvIzT5vJSsJQL9wZ+lZmIryGxuG
   jcGC2e4ArqDMR2tx+ktC++Q04XYJLxkTe4wAcvgV5iwR0Yb0pAq4qpzD3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="327626135"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="327626135"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 20:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="726845132"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="726845132"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Apr 2023 20:10:00 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prs1A-0000gL-0S;
	Thu, 27 Apr 2023 03:10:00 +0000
Date: Thu, 27 Apr 2023 11:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e671fb86ecc03ce15a89cda8553621248ccf620c
Message-ID: <20230427030952.YsX3V%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_201020_040576_F88BD0B3 
X-CRM114-Status: UNSURE (   5.61  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: e671fb86ecc03ce15a89cda8553621248ccf620c  wifi: ath12k: send WMI_PEER_REORDER_QUEUE_SETUP_CMDID when ADDBA session starts

elapsed time: 725m

configs tested: 98
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230426   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230426   gcc  
arc                  randconfig-r043-20230426   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230426   gcc  
arm                  randconfig-r046-20230426   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230426   clang
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r005-20230426   clang
hexagon              randconfig-r006-20230426   clang
hexagon              randconfig-r041-20230426   clang
hexagon              randconfig-r045-20230426   clang
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
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230426   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r026-20230426   gcc  
loongarch            randconfig-r031-20230426   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r023-20230426   gcc  
microblaze           randconfig-r035-20230426   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r024-20230426   clang
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230426   gcc  
nios2                randconfig-r034-20230426   gcc  
openrisc             randconfig-r015-20230426   gcc  
openrisc             randconfig-r025-20230426   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230426   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r032-20230426   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230426   gcc  
riscv                randconfig-r042-20230426   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230426   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230426   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230426   gcc  
sh           buildonly-randconfig-r004-20230426   gcc  
sh                   randconfig-r012-20230426   gcc  
sh                   randconfig-r036-20230426   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r014-20230426   gcc  
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
