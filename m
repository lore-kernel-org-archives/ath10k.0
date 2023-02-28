Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF497C64ED6
	for <ath10k@archiver.kernel.org>; Tue, 28 Feb 2023 00:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SLziCmYRwF2+DB2N/vPqbtqQMQGirMLOAQZew8ljAks=; b=isj1t+u6IOROr+
	JBKqC9AnnViEtWSLT3LPao82e+hMK/txP/qAfeMhzjelVjuEmvTAdFiA28vqzkzqdg3HH6vLI8H+v
	ezJ5O8KWZiyH+8Xy9bhe4smuGLHtzliKoMvc/vdX84kyb+TL4e9GjDWm0Ad5jLEndvLiKUi9fnZbN
	qGJ3J/tVf58mf0kMdi6Lzj2yuLScwmQB+94jEzCC+bLtHYwpfwOjW56eaGpjUtz6mfelSl4nf/4R7
	yq2OQXXqvmu/T2unW0jgBV5z6IR01Q7pMDUAK7Frw9uqimE4V/Edu1KT7C+xTuGzTruBKYW5sosV4
	ndkb9z2E6leM7BXuBt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoG4-00BgV2-Qu; Tue, 28 Feb 2023 00:54:20 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoG1-00BgTv-Q8
	for ath10k@lists.infradead.org; Tue, 28 Feb 2023 00:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677545657; x=1709081657;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Dlk2bU2Vwn+G8ML6LIhAEbqC9lhvj2JU1qNA44nFwWc=;
  b=AHieSIPJIBFrjYxwwy4xOcRVoq7kSYIh3ualGPdITD5W67MeaedegGYJ
   Cl2WvnI3A7Mv73A4bOzNB4t+2wctPdet1iT0oBLGSYLS80uqEZkWC94hH
   m0g+P/FTFi2/iqwPGGNeiSNRuT+mQX1G0CAjtVdhyoc+nC6F1FzvsPQqD
   HmxxJ9YUH9Sb/xoeWQTKhs/L18H5KR/59/aitQbqVvUSl5Id2Tl6O953D
   TAIr6rIUT1Jhuy2AHCvsu02VZWXA3v3lgUMtOPkpMA/Fc9qBcUUnpt1Gv
   hUtfKymLU1PISKNWvwS30oHnY3oAJpjeA7Fi7hOOukSXPvDEdQ8eBHgB/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="396573910"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="396573910"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 16:54:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="762961907"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="762961907"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2023 16:54:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWoFu-0004wL-0O;
	Tue, 28 Feb 2023 00:54:10 +0000
Date: Tue, 28 Feb 2023 08:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 ebf82988f844dd98e6b007cffcc5e95986056995
Message-ID: <63fd507b.2FpAdaNrkGOCTgQw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_165417_929796_5BB895E1 
X-CRM114-Status: UNSURE (   5.37  )
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
branch HEAD: ebf82988f844dd98e6b007cffcc5e95986056995  wifi: ath11k: generate rx and tx mcs maps for supported HE mcs

elapsed time: 722m

configs tested: 133
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r035-20230226   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230226   gcc  
arc                  randconfig-r032-20230226   gcc  
arc                  randconfig-r034-20230226   gcc  
arc                  randconfig-r043-20230226   gcc  
arc                  randconfig-r043-20230227   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r015-20230227   clang
arm                  randconfig-r026-20230226   gcc  
arm                  randconfig-r036-20230226   clang
arm                  randconfig-r046-20230226   gcc  
arm                  randconfig-r046-20230227   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230227   clang
arm64        buildonly-randconfig-r004-20230227   clang
arm64        buildonly-randconfig-r006-20230226   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r006-20230227   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230226   gcc  
csky                 randconfig-r006-20230226   gcc  
csky                 randconfig-r023-20230227   gcc  
hexagon              randconfig-r032-20230227   clang
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
i386                 randconfig-r014-20230227   gcc  
i386                 randconfig-r022-20230227   gcc  
i386                 randconfig-r034-20230227   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r036-20230227   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r024-20230227   gcc  
microblaze           randconfig-r006-20230227   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230227   gcc  
mips                 randconfig-r021-20230226   gcc  
mips                 randconfig-r025-20230227   clang
nios2                               defconfig   gcc  
nios2                randconfig-r025-20230226   gcc  
openrisc     buildonly-randconfig-r005-20230226   gcc  
openrisc             randconfig-r003-20230226   gcc  
openrisc             randconfig-r005-20230226   gcc  
openrisc             randconfig-r005-20230227   gcc  
openrisc             randconfig-r016-20230226   gcc  
openrisc             randconfig-r031-20230226   gcc  
openrisc             randconfig-r031-20230227   gcc  
parisc       buildonly-randconfig-r004-20230226   gcc  
parisc       buildonly-randconfig-r005-20230227   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230226   gcc  
parisc               randconfig-r024-20230226   gcc  
parisc               randconfig-r035-20230227   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230227   clang
powerpc              randconfig-r021-20230227   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230227   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230226   clang
riscv                randconfig-r015-20230226   clang
riscv                randconfig-r042-20230226   clang
riscv                randconfig-r042-20230227   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r016-20230227   gcc  
s390                 randconfig-r026-20230227   gcc  
s390                 randconfig-r044-20230226   clang
s390                 randconfig-r044-20230227   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r011-20230226   gcc  
sparc        buildonly-randconfig-r002-20230226   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230226   gcc  
sparc64      buildonly-randconfig-r003-20230226   gcc  
sparc64              randconfig-r012-20230226   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230227   clang
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
x86_64               randconfig-r004-20230227   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230227   gcc  
xtensa               randconfig-r033-20230226   gcc  
xtensa               randconfig-r033-20230227   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
