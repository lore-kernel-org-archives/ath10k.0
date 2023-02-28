Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9FDC64ED6
	for <ath10k@archiver.kernel.org>; Tue, 28 Feb 2023 02:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/AUIGAS7stNjiaNcmdT6su6YxLR9IUa77ht+Xckp4R4=; b=zmrQZNS05a0CZv
	ZgADIO20cGbPdNz016scXP8eVU9UVt09QrbvO102by6CyHKRp8I9D6YrX+ZmZkyRPGIs2nwu/SETn
	EfQ32uofxesIHdQjRNw+iGQInmUjabAEET1cvZGquuJ+xpSclYDDikmjVylWuJLRrdhhBQ8zA9wyM
	n6nfttJuUOCuaazvJS7Culxz63W8s3gsjZc4Sv17C+V/dj0R8usW7/AxtRR1pg5ERHroFkdGvTXV5
	itUzrYnRf4Ye7pew9Cj/vq4ri+HAGAa7lRhg2HFKw86o05mXc34Xqct28f8EtH0MFepNQ2W4boK1B
	M3xC3xIWUKse49OwKIIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWpnz-00BpOK-7R; Tue, 28 Feb 2023 02:33:27 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWpnv-00BpNY-Ad
	for ath10k@lists.infradead.org; Tue, 28 Feb 2023 02:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677551603; x=1709087603;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LogUcP+C6Qew87H17CWkMtQYVtWmHtxFJYHW5jFlu6c=;
  b=YgeAOnF9sg6JITZiRcS1a2uboEiDWSWqQaW7GveZvO5zV58agCuU0Fai
   qaSeTqnM6pjeS6CaRa8DuVYjHf0CJqJ858rh8veILxnBjvD4+Gn6SSAbH
   QceTRxSQPdicKzI8+HCBx5wcH50af5IbKjQZbHwWO7lsKc3P60eRnKEJS
   1XiKH4sNaj/+CSsVKYpGnerBbV9kYMoXr1XllDe6VsVFz2q+4CMEbQ6De
   2VR65HzekdmGWAmghw2qpxJPXJBOQ51YeO5JkL4a4urIE0NE1YygXgg1q
   T+Ji3xPUmzDZm3c4DICFnQm0busY8AegMPaTV7mXv6vnueeh2ChqRThkh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332753494"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="332753494"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 18:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="783646612"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="783646612"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2023 18:33:13 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWpnk-00050V-22;
	Tue, 28 Feb 2023 02:33:12 +0000
Date: Tue, 28 Feb 2023 10:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 6fda96b511694e387b7112f2c268d0adab480e3d
Message-ID: <63fd67e3.YBq+V/l1+tCXXTVb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_183323_414481_C361B32B 
X-CRM114-Status: UNSURE (   6.23  )
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
branch HEAD: 6fda96b511694e387b7112f2c268d0adab480e3d  Merge branch 'ath-next' into ath-qca

elapsed time: 821m

configs tested: 131
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230226   gcc  
alpha        buildonly-randconfig-r003-20230227   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230227   gcc  
alpha                randconfig-r006-20230227   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230226   gcc  
arc                  randconfig-r043-20230227   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r006-20230226   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r023-20230226   gcc  
arm                  randconfig-r024-20230227   clang
arm                  randconfig-r046-20230226   gcc  
arm                  randconfig-r046-20230227   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230226   clang
arm64                randconfig-r026-20230227   gcc  
arm64                randconfig-r031-20230227   clang
csky                                defconfig   gcc  
csky                 randconfig-r011-20230227   gcc  
csky                 randconfig-r036-20230226   gcc  
hexagon      buildonly-randconfig-r004-20230227   clang
hexagon              randconfig-r013-20230226   clang
hexagon              randconfig-r015-20230226   clang
hexagon              randconfig-r041-20230226   clang
hexagon              randconfig-r041-20230227   clang
hexagon              randconfig-r045-20230226   clang
hexagon              randconfig-r045-20230227   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230227   clang
i386                 randconfig-a002-20230227   clang
i386                 randconfig-a003-20230227   clang
i386                 randconfig-a004-20230227   clang
i386                 randconfig-a005-20230227   clang
i386                 randconfig-a006-20230227   clang
i386                 randconfig-a011-20230227   gcc  
i386                 randconfig-a012-20230227   gcc  
i386                 randconfig-a013-20230227   gcc  
i386                 randconfig-a014-20230227   gcc  
i386                 randconfig-a015-20230227   gcc  
i386                 randconfig-a016-20230227   gcc  
i386                 randconfig-r023-20230227   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230226   gcc  
ia64                 randconfig-r022-20230227   gcc  
ia64                 randconfig-r024-20230226   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230226   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230226   gcc  
loongarch            randconfig-r011-20230226   gcc  
loongarch            randconfig-r031-20230226   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230227   gcc  
m68k                 randconfig-r016-20230227   gcc  
microblaze           randconfig-r025-20230226   gcc  
microblaze           randconfig-r035-20230226   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r014-20230227   clang
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230226   gcc  
openrisc             randconfig-r004-20230226   gcc  
openrisc             randconfig-r022-20230226   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230227   gcc  
parisc               randconfig-r015-20230227   gcc  
parisc               randconfig-r034-20230226   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r001-20230227   clang
powerpc              randconfig-r006-20230226   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r034-20230227   clang
riscv                randconfig-r036-20230227   clang
riscv                randconfig-r042-20230226   clang
riscv                randconfig-r042-20230227   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230227   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230226   clang
s390                 randconfig-r044-20230227   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230226   gcc  
sh                   randconfig-r004-20230227   gcc  
sh                   randconfig-r012-20230226   gcc  
sh                   randconfig-r025-20230227   gcc  
sh                   randconfig-r032-20230227   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r016-20230226   gcc  
sparc                randconfig-r026-20230226   gcc  
sparc64      buildonly-randconfig-r005-20230227   gcc  
sparc64              randconfig-r033-20230227   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r006-20230227   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230227   clang
x86_64               randconfig-a002-20230227   clang
x86_64               randconfig-a003-20230227   clang
x86_64               randconfig-a004-20230227   clang
x86_64               randconfig-a005-20230227   clang
x86_64               randconfig-a006-20230227   clang
x86_64               randconfig-a011-20230227   gcc  
x86_64               randconfig-a012-20230227   gcc  
x86_64               randconfig-a013-20230227   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64               randconfig-a015-20230227   gcc  
x86_64               randconfig-a016-20230227   gcc  
x86_64               randconfig-r035-20230227   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230227   gcc  
xtensa               randconfig-r033-20230226   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
