Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CECC7EE2E
	for <ath10k@archiver.kernel.org>; Tue, 28 Feb 2023 01:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2mdhQ4cawkMfHn2lLnTohsMqOCxgUs9xvfk3YwYgmtU=; b=EZVwU2uPYQFj45
	R5Ez1dmDr3azwftiCA1EfjCZt9WSrz9COxxZrquae4yd4tDO/mABQXMvgTXa6IoK9UDUMvslJXAKZ
	Sdr0dEvVukxYGzXinhQpWZKqjytSqOmdN03Z2krSL1M/oJyT06cQ32iM/i2bfXLgUgJpEheVSuH4r
	oJf94ZuuHhbKOKwGVGg6oCASCjOpRlGWba4HMsuli8EeXPZdbVs4mHGJTj2kGq2qe7h6RcXNRyoRP
	gAxUnS6YVp9R9UbW0Zd3re76HwppaPZTwqDv8FIaHrovy1EwaZCKG7NkvMLagDAnW8+icwuBxZGBS
	hQdJmzu2SBci4tATYMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoj5-00BjiP-JM; Tue, 28 Feb 2023 01:24:19 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoj2-00Bjgu-FU
	for ath10k@lists.infradead.org; Tue, 28 Feb 2023 01:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677547456; x=1709083456;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0/m/MHArsbN/s/NDGQRdOBGVRr039uIkQEijZElBSVI=;
  b=cFrl+w+hqgs4ZjsLnM6NloCoTMxZ50/al2TftidnYdE9tzoLSiE+YUge
   o8KJwtWDM2B3aAhxbJJ7olLb83uNzRVwPc2ABGa1j9aviclg0IwI1sBrQ
   oCrw5nwMVK/1K5JtVXuCg93uAJVeiMSolRxqC0ml0TGxX2mgQwUMPHuch
   QljAKcUq+PyYE2iMmbXHG2gdSf1dHItpb9C1KR+Qdcto83uVjUo114Ual
   Dd0kc182nTFGtURZ2SrZhgS8NQM/3/jhdoZzR2XTraouybj9/SumxhA84
   s1A4b8FPf3dGrdph08zl0xLvwOcK+HMc0lwVcHByM8Df5WTVca+em0mPh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317819458"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="317819458"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 17:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="848073206"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="848073206"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Feb 2023 17:24:11 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWoix-0004xs-03;
	Tue, 28 Feb 2023 01:24:11 +0000
Date: Tue, 28 Feb 2023 09:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 a6116542935636dce74e0c90f9b44bb772239e8d
Message-ID: <63fd579a.hDKPgWq8n/99oW47%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_172416_591698_C12C5481 
X-CRM114-Status: UNSURE (   6.16  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: a6116542935636dce74e0c90f9b44bb772239e8d  wifi: ath11k: Allow ath11k to boot without caldata in ftm mode

elapsed time: 721m

configs tested: 130
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230227   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230226   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230227   gcc  
arc                  randconfig-r011-20230226   gcc  
arc                  randconfig-r011-20230227   gcc  
arc                  randconfig-r016-20230227   gcc  
arc                  randconfig-r043-20230226   gcc  
arc                  randconfig-r043-20230227   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r026-20230226   gcc  
arm                  randconfig-r046-20230226   gcc  
arm                  randconfig-r046-20230227   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230226   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r033-20230227   clang
csky                                defconfig   gcc  
csky                 randconfig-r023-20230227   gcc  
csky                 randconfig-r034-20230226   gcc  
hexagon              randconfig-r014-20230226   clang
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
i386                 randconfig-r022-20230227   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r002-20230227   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r016-20230226   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230227   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r024-20230227   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230226   clang
mips                 randconfig-r005-20230226   clang
mips                 randconfig-r021-20230226   gcc  
mips                 randconfig-r025-20230227   clang
nios2                               defconfig   gcc  
nios2                randconfig-r025-20230226   gcc  
nios2                randconfig-r031-20230226   gcc  
openrisc             randconfig-r004-20230226   gcc  
openrisc             randconfig-r033-20230226   gcc  
parisc       buildonly-randconfig-r004-20230226   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230227   gcc  
parisc               randconfig-r024-20230226   gcc  
parisc               randconfig-r035-20230226   gcc  
parisc               randconfig-r036-20230227   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230227   gcc  
powerpc      buildonly-randconfig-r003-20230227   gcc  
powerpc              randconfig-r021-20230227   gcc  
powerpc              randconfig-r032-20230227   clang
powerpc              randconfig-r036-20230226   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230226   clang
riscv                randconfig-r042-20230227   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230226   clang
s390                 randconfig-r012-20230227   gcc  
s390                 randconfig-r026-20230227   gcc  
s390                 randconfig-r044-20230226   clang
s390                 randconfig-r044-20230227   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230227   gcc  
sh                   randconfig-r013-20230226   gcc  
sh                   randconfig-r031-20230227   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230226   gcc  
sparc64              randconfig-r003-20230226   gcc  
sparc64              randconfig-r013-20230227   gcc  
sparc64              randconfig-r015-20230226   gcc  
sparc64              randconfig-r032-20230226   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
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
xtensa       buildonly-randconfig-r006-20230227   gcc  
xtensa               randconfig-r002-20230226   gcc  
xtensa               randconfig-r014-20230227   gcc  
xtensa               randconfig-r034-20230227   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
