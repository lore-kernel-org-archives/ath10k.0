Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA16C77B7C
	for <ath10k@archiver.kernel.org>; Wed, 10 May 2023 05:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4C/j9JNGdAxC1bY3/h6o/D7CrFFlwOKyvTS2VqLLZcY=; b=MYqjpKph2ODRAo
	GpSVYSrlAZutwbm9O6dk3w/AqhYhffPtRxexOI5rqynRH/Q1DoOvhalNxhbDjZU4fkOFcpXZNIqyQ
	w6QTFDFbvctD1LEAnt5dWVt19zvWVRRlWvAMEQffDU+8lXcyPrI1DHhJx9peaq7+7QN7Co5Y5IMvH
	okOCjEje1kp6u/49/vzcoU8pph+b/4h7abnMJLVh037l2ptmxeBY/OUNMLcDyIpbPKCpTC7gxq7DX
	5nB1cRv+32NMsT1mLjObXSNE/1nFdJ/8yrk7atNEayLlfVcRjkJU9lRweQl/RO+SI08XV8iZdCsvr
	QrcHi12al7l3U+uIi5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwcJV-0058tn-0c;
	Wed, 10 May 2023 05:24:33 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwcJS-0058sb-1A
	for ath10k@lists.infradead.org;
	Wed, 10 May 2023 05:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683696270; x=1715232270;
  h=date:from:to:cc:subject:message-id;
  bh=eNsmB+w6skc4IJkI4FA+G2NiknWIx2jcETLSoYMPFQI=;
  b=Y+xJuLRXH234pwQ/fedTh6ut7a9pBUvNkWKKmS4QGeCl1bpjnWmqVLDK
   FfSHUjVYzggLAVKE8OeJ97O/GNdwlOs913Bx3p3TZKk9Ir2zNC0W0qBHD
   DwwIsg8NzRYyq9weDQWzGyvgkJyurBUoluUs2Qcny4WZ0D/9uwThV40fp
   Zc/FGEI5zZ7aD35F6/zqy5et2c5XSx4qoMoN308nnQ6+8YymhTrb1Cy/o
   NSaQvtqHEjsPJ2E0EpGjvzSyTzbsGQYhpIyO74J6UbdQzQIPUmL2/bZrz
   QUtAX9jD1n+vk+mEJaNZ3m7uXD8usEi7quZDdsRWGIMD++OF4JotbPAqe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="339370605"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="339370605"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 22:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="768795044"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="768795044"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 May 2023 22:24:18 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwcJG-0002x3-18;
	Wed, 10 May 2023 05:24:18 +0000
Date: Wed, 10 May 2023 13:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 43fc1a21995fb95636f597f05090a5eff68338c4
Message-ID: <20230510052322.cIh4-%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_222430_446729_284AAD94 
X-CRM114-Status: UNSURE (   7.37  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 43fc1a21995fb95636f597f05090a5eff68338c4  Add localversion-wireless-testing-ath

elapsed time: 730m

configs tested: 143
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230509   gcc  
arc          buildonly-randconfig-r005-20230509   gcc  
arc          buildonly-randconfig-r006-20230509   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230509   gcc  
arc                  randconfig-r036-20230509   gcc  
arc                  randconfig-r043-20230509   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r003-20230509   gcc  
arm                                 defconfig   gcc  
arm                        neponset_defconfig   clang
arm                  randconfig-r024-20230509   gcc  
arm                  randconfig-r046-20230509   gcc  
arm                         s5pv210_defconfig   clang
arm                          sp7021_defconfig   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230509   gcc  
arm64        buildonly-randconfig-r006-20230509   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230509   gcc  
arm64                randconfig-r004-20230509   gcc  
arm64                randconfig-r023-20230509   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230509   gcc  
csky                 randconfig-r015-20230509   gcc  
csky                 randconfig-r033-20230509   gcc  
hexagon              randconfig-r021-20230509   clang
hexagon              randconfig-r041-20230509   clang
hexagon              randconfig-r041-20230510   clang
hexagon              randconfig-r045-20230509   clang
hexagon              randconfig-r045-20230510   clang
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
loongarch    buildonly-randconfig-r002-20230509   gcc  
loongarch    buildonly-randconfig-r005-20230509   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230509   gcc  
loongarch            randconfig-r013-20230509   gcc  
loongarch            randconfig-r021-20230509   gcc  
loongarch            randconfig-r026-20230509   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230509   gcc  
m68k                 randconfig-r023-20230509   gcc  
m68k                 randconfig-r034-20230509   gcc  
microblaze   buildonly-randconfig-r003-20230509   gcc  
microblaze           randconfig-r001-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r004-20230509   clang
nios2        buildonly-randconfig-r001-20230509   gcc  
nios2        buildonly-randconfig-r006-20230509   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230509   gcc  
nios2                randconfig-r021-20230509   gcc  
nios2                randconfig-r024-20230509   gcc  
nios2                randconfig-r026-20230509   gcc  
nios2                randconfig-r033-20230509   gcc  
openrisc             randconfig-r036-20230509   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230509   gcc  
parisc               randconfig-r035-20230509   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230509   clang
powerpc                 mpc8560_ads_defconfig   clang
powerpc              randconfig-r005-20230509   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230509   clang
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230509   clang
riscv                randconfig-r042-20230510   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230509   clang
s390                 randconfig-r044-20230509   clang
s390                 randconfig-r044-20230510   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230509   gcc  
sh                   randconfig-r025-20230509   gcc  
sh                   randconfig-r032-20230509   gcc  
sparc        buildonly-randconfig-r004-20230509   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230509   gcc  
sparc                randconfig-r011-20230509   gcc  
sparc                randconfig-r012-20230509   gcc  
sparc                randconfig-r015-20230509   gcc  
sparc                randconfig-r016-20230509   gcc  
sparc                randconfig-r024-20230509   gcc  
sparc                randconfig-r026-20230509   gcc  
sparc64      buildonly-randconfig-r003-20230509   gcc  
sparc64              randconfig-r005-20230509   gcc  
sparc64              randconfig-r006-20230509   gcc  
sparc64              randconfig-r016-20230509   gcc  
sparc64              randconfig-r032-20230509   gcc  
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
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230509   gcc  
xtensa               randconfig-r022-20230509   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
