Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCC0C77B73
	for <ath10k@archiver.kernel.org>; Thu, 27 Apr 2023 06:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+goLgX0jiVnl404u/4cjvdttYKNzgO+tQht4jPkZY+Q=; b=npKQgsukvSJ8+Z
	/HQLYcbhTcFz3C4mH1I0iUPDV7mTX6SwZm1X2TCFc3QtW33E+cdjAPRhdlh83khUXeQ1eTtGIL7iY
	e5QLGkcyOyKXe1p3bUjVhPQ1wJwI3xi9d1uUrpQFkC70DnGCYHG4sgLiAunrwZRBXtTn6FfHz0olQ
	Y58rWP8cWQ62EFg0tLoWJOZMivPItGiBiZSmUnSoZ9/oYziBD+Xxw2oVHg2nppdzJhWyiApcLKtln
	/vrNuaySDE2tNGUe+HUNClzVvvrrm6Ndc0prfVaBoQHQ6gNjVvW042v1bLBogfGKPhVx8AeiOdCWA
	32ZrHaM8heOS3F1bXP3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prvDu-005ZJ5-0J;
	Thu, 27 Apr 2023 06:35:22 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prvDr-005ZIb-27
	for ath10k@lists.infradead.org;
	Thu, 27 Apr 2023 06:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682577319; x=1714113319;
  h=date:from:to:cc:subject:message-id;
  bh=VlsXgEDcYuNrOr9TtM4iBDJ0Vuspkdvab+WcENzVuJ0=;
  b=LkdR1pn5AjaSiilpG4KQC4WeYceQb5+ubB3Fu3hoduIhNwpsLJhdURdB
   qLWThVaZjM5vrvCqGNoQIpPVUVxdQtLnWHc5pN9YA1vy5q2rhINUnYMqt
   19vLV6ydOwPBt6B1HHhPrm0xYAkivOF2sEVBKg3r4CgdtRj6+egYfvlWh
   CJN/7o8AgO6ZVXfNFmP1llCWtukHBI28EO2ZUCE2PC3d8rjVeU8ympWIS
   zMCdzjbruovOJmN4JO0sc9vy0n5HJrYY2K3G+nV3FxcXr5pB7DnNlaNue
   SS71TH/ojEfGG5j7imLqqOvhjIwMLsXIfvzNHb0P+/4c43ZSSj8BD6C4R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="350183131"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="350183131"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 23:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="763664631"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="763664631"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2023 23:35:15 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prvDm-00003P-2H;
	Thu, 27 Apr 2023 06:35:14 +0000
Date: Thu, 27 Apr 2023 14:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 c3087b3ef17a99163b2b3b6e02be67f90812e1fc
Message-ID: <20230427063450.uvozx%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_233519_775772_268788EB 
X-CRM114-Status: UNSURE (   5.30  )
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
branch HEAD: c3087b3ef17a99163b2b3b6e02be67f90812e1fc  Merge branch 'pending' into master-pending

elapsed time: 926m

configs tested: 97
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r034-20230426   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230426   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230426   clang
arm                                 defconfig   gcc  
arm                  randconfig-r036-20230426   gcc  
arm                  randconfig-r046-20230426   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230426   clang
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230426   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r012-20230426   clang
hexagon              randconfig-r013-20230426   clang
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
ia64                 randconfig-r024-20230426   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230426   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230426   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230426   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230426   gcc  
openrisc     buildonly-randconfig-r006-20230426   gcc  
openrisc             randconfig-r001-20230426   gcc  
openrisc             randconfig-r006-20230426   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r026-20230426   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230426   gcc  
riscv                randconfig-r042-20230426   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230426   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230426   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230426   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r021-20230426   gcc  
sparc64              randconfig-r022-20230426   gcc  
sparc64              randconfig-r023-20230426   gcc  
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
xtensa               randconfig-r003-20230426   gcc  
xtensa               randconfig-r005-20230426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
