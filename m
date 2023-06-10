Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F44C7EE29
	for <ath10k@archiver.kernel.org>; Sat, 10 Jun 2023 04:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aDjc/rFlrdubbMmK5ycuAhQ68xsMbXQJYStXOGrmEVA=; b=icWBg+RHHsSotB
	lKc0sG1llM2liwvPVs5Z+OFJas1F56S6r0SZUwP2vheVYEiOSwUmbdV/1TIY+qYo5QATsvQ1JLJKt
	7VJ1ejDxPeHs3Rbq/+E4t7vvin3TRFicnGT82qiBrbRhfgSAXsXXvfc7JA2zMq2Bu4uYxo8dPKq07
	XDU8FmtWSc2CQOKE57Oj0lkLimEW76qN3YsrMk+HKxwcXjSATz3ipllqz50z1pJnXogqC7EzAWlq5
	cAd2uub6lPprF9u3EQsZuE2RKrlgi6jRCHdt9rNKa19Wolns6347By0xvCWJCmZCt0KXH9VvIyTLh
	p6eJ1u0egSqzpe9kwkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7pmy-00F8Gg-2p;
	Sat, 10 Jun 2023 04:01:20 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7pmv-00F8Eg-2h
	for ath10k@lists.infradead.org;
	Sat, 10 Jun 2023 04:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686369677; x=1717905677;
  h=date:from:to:cc:subject:message-id;
  bh=Y1YtK0YYsdbXXjbwgnyxJnfcjfDof00cw95dFwUr+CA=;
  b=LJt3HOkkBEqMVPDFiQbmjIP1Skcf77Jh0ymTye+iT4zOXzEzGsbpqEF3
   KSlaypL30oNQmWepEm9bOZVGmn6kPIV1Pb420m6ooXqrRWmOkAw7Dv6Ht
   g7+24Id6oJ6zoOfUKUXVsYvMjmVQxLpXhrrPS2rN007XuYIg/jpUAXdRk
   7AGlgdJG6UIVnKDGiLRNk78voDmYcihhea8jrl9wayeGKim1g9V29IbOl
   K7Gvq5xC9QUrYA1bOejyMTNZ+W+qdKT/POI3Rrg5vKwJZPRE+4jpUvOdP
   K0J9/ezFE9O4harySGv5/Rd+yHba6mIo5uCr+NHBW9Ksm5bCkz8e+bXjI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="347373578"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="347373578"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 21:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="660975525"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="660975525"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Jun 2023 21:01:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7pmn-0009gc-1j;
	Sat, 10 Jun 2023 04:01:09 +0000
Date: Sat, 10 Jun 2023 12:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 3b3d60fff1f7ecd2966a2f4f9b20a80630b93682
Message-ID: <202306101257.JqL8uBfO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_210117_917967_BD418FCD 
X-CRM114-Status: UNSURE (   6.72  )
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
branch HEAD: 3b3d60fff1f7ecd2966a2f4f9b20a80630b93682  Add localversion-wireless-testing-ath

elapsed time: 722m

configs tested: 126
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230608   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r015-20230608   gcc  
arc                  randconfig-r043-20230609   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230608   clang
arm                  randconfig-r005-20230608   clang
arm                  randconfig-r006-20230608   clang
arm                  randconfig-r033-20230609   gcc  
arm                  randconfig-r046-20230609   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230608   clang
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r001-20230608   clang
hexagon              randconfig-r041-20230609   clang
hexagon              randconfig-r045-20230609   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230608   gcc  
i386                 randconfig-i002-20230608   gcc  
i386                 randconfig-i003-20230608   gcc  
i386                 randconfig-i004-20230608   gcc  
i386                 randconfig-i005-20230608   gcc  
i386                 randconfig-i006-20230608   gcc  
i386                 randconfig-i011-20230608   clang
i386                 randconfig-i012-20230608   clang
i386                 randconfig-i013-20230608   clang
i386                 randconfig-i014-20230608   clang
i386                 randconfig-i015-20230608   clang
i386                 randconfig-i016-20230608   clang
i386                 randconfig-i051-20230608   gcc  
i386                 randconfig-i052-20230608   gcc  
i386                 randconfig-i053-20230608   gcc  
i386                 randconfig-i054-20230608   gcc  
i386                 randconfig-i055-20230608   gcc  
i386                 randconfig-i056-20230608   gcc  
i386                 randconfig-i061-20230608   gcc  
i386                 randconfig-i062-20230608   gcc  
i386                 randconfig-i063-20230608   gcc  
i386                 randconfig-i064-20230608   gcc  
i386                 randconfig-i065-20230608   gcc  
i386                 randconfig-i066-20230608   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230608   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r011-20230608   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r006-20230608   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r004-20230608   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230609   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r032-20230609   clang
s390                 randconfig-r044-20230609   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230608   gcc  
sh                   randconfig-r014-20230608   gcc  
sh                   randconfig-r025-20230608   gcc  
sh                   randconfig-r036-20230609   gcc  
sparc                            allyesconfig   gcc  
sparc        buildonly-randconfig-r003-20230608   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230608   gcc  
sparc                randconfig-r026-20230608   gcc  
sparc                randconfig-r031-20230609   gcc  
sparc64      buildonly-randconfig-r005-20230608   gcc  
sparc64              randconfig-r016-20230608   gcc  
sparc64              randconfig-r023-20230608   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230608   gcc  
x86_64               randconfig-a002-20230608   gcc  
x86_64               randconfig-a003-20230608   gcc  
x86_64               randconfig-a004-20230608   gcc  
x86_64               randconfig-a005-20230608   gcc  
x86_64               randconfig-a006-20230608   gcc  
x86_64               randconfig-a011-20230608   clang
x86_64               randconfig-a012-20230608   clang
x86_64               randconfig-a013-20230608   clang
x86_64               randconfig-a014-20230608   clang
x86_64               randconfig-a015-20230608   clang
x86_64               randconfig-a016-20230608   clang
x86_64               randconfig-r002-20230608   gcc  
x86_64               randconfig-x051-20230608   clang
x86_64               randconfig-x052-20230608   clang
x86_64               randconfig-x053-20230608   clang
x86_64               randconfig-x054-20230608   clang
x86_64               randconfig-x055-20230608   clang
x86_64               randconfig-x056-20230608   clang
x86_64               randconfig-x061-20230608   clang
x86_64               randconfig-x062-20230608   clang
x86_64               randconfig-x063-20230608   clang
x86_64               randconfig-x064-20230608   clang
x86_64               randconfig-x065-20230608   clang
x86_64               randconfig-x066-20230608   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r021-20230608   gcc  
xtensa               randconfig-r035-20230609   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
