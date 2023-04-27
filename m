Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33149C77B61
	for <ath10k@archiver.kernel.org>; Thu, 27 Apr 2023 03:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HxPc9yjrdmOyQ19NDWhVGrN2pNx+rdAC4n8gXG1m1LI=; b=KY7/kIB7hH3Njd
	K9vP79T59Fq44t3WICeA8FdIsDTQow9aIYr8PoaRSCLWcoK9OM4ctPSLYnHCPONf3aiuqCxHAqFxU
	JMhtRDswGm2HfRdx1bPULKwtgbhlOlk2HeCuwRBnqkafz1JP5zXik954KR4kNUqAPYt0yKAr8xSJQ
	cJQ50QrEGcIuruhfDqFDPlD0OBadzBGDyPi7HPHpeUy6VhAMstAmcFlVdvmXFaJ5mFrfKVuqflSKO
	w/X/VA0U6sT8PP7GrYzEPhGhQa8tiTr23VO9a/PdYLM/EK2exlGN+vXdIJYbstVq6+oqpWmSy943K
	0OpB+uLQrUtye7tMncag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prs2R-005Kbs-2W;
	Thu, 27 Apr 2023 03:11:19 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prs2O-005Kar-2p
	for ath10k@lists.infradead.org;
	Thu, 27 Apr 2023 03:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682565076; x=1714101076;
  h=date:from:to:cc:subject:message-id;
  bh=X2yRfDFxkzOkS2sON3kQVtez1eiGsJkPIIb6/CkPLq8=;
  b=beUrVCizJyw/iPK0ldTCRxC/k78WBJbHOLUfOOc14I08LXIxsxcgQGqy
   BU8W93gXGSizbSaygoEsmDBfY8FXs0brz9kYgE2zpyl9bnlRIsDHprUc8
   RIZm76XObaiFcXhR+AksF5sfXCABcwzTSDS4eacB0bJ48ZkgHrhomMQQn
   yZe5gO682+S6d8a9iGdwaY8mYXI15Fela13Oc6dAhBf8qAfziv501AQoh
   dQb+m8hcAJpbvy9PDCSQMSdsxD9SNn3Hp83Twbv1eQ7m1kJ0xGEcpZ7qd
   2brskF4/P5PBVOXBGk7EmL+ZRgXChp6zgjR3IC1/sxhUCOctcCcCNsQPR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="346063671"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="346063671"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 20:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="724700158"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="724700158"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Apr 2023 20:11:00 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prs28-0000ga-0q;
	Thu, 27 Apr 2023 03:11:00 +0000
Date: Thu, 27 Apr 2023 11:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 b62dd5c017604878f79ac356997d95d65055b4fe
Message-ID: <20230427031009.HLchS%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_201116_924673_20F910D9 
X-CRM114-Status: UNSURE (   4.23  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: b62dd5c017604878f79ac356997d95d65055b4fe  wifi: ath11k: fix registration of 6Ghz-only phy without the full channel range

elapsed time: 720m

configs tested: 108
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230426   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230426   gcc  
arc                  randconfig-r006-20230426   gcc  
arc                  randconfig-r014-20230426   gcc  
arc                  randconfig-r026-20230426   gcc  
arc                  randconfig-r043-20230426   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230426   clang
arm          buildonly-randconfig-r005-20230426   clang
arm          buildonly-randconfig-r006-20230426   clang
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230426   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230426   clang
arm64                randconfig-r015-20230426   gcc  
arm64                randconfig-r033-20230426   clang
csky                                defconfig   gcc  
csky                 randconfig-r002-20230426   gcc  
csky                 randconfig-r023-20230426   gcc  
hexagon              randconfig-r012-20230426   clang
hexagon              randconfig-r013-20230426   clang
hexagon              randconfig-r015-20230426   clang
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
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230426   gcc  
microblaze   buildonly-randconfig-r005-20230426   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230426   gcc  
nios2                randconfig-r034-20230426   gcc  
nios2                randconfig-r035-20230426   gcc  
openrisc     buildonly-randconfig-r002-20230426   gcc  
openrisc             randconfig-r013-20230426   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r025-20230426   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230426   gcc  
riscv                randconfig-r031-20230426   clang
riscv                randconfig-r042-20230426   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r024-20230426   gcc  
s390                 randconfig-r044-20230426   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230426   gcc  
sh                   randconfig-r032-20230426   gcc  
sh                   randconfig-r036-20230426   gcc  
sparc        buildonly-randconfig-r003-20230426   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230426   gcc  
sparc                randconfig-r021-20230426   gcc  
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
xtensa       buildonly-randconfig-r001-20230426   gcc  
xtensa               randconfig-r022-20230426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
