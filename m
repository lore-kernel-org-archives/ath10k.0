Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D495EB64DA
	for <ath10k@archiver.kernel.org>; Fri, 16 Jun 2023 01:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vdx5xIaTm4V/KvovMCWnkbsJ/OB3KlWgZcuAx9UUZzY=; b=Udyq3BrryE8VZM
	+kJGkXl4GrlRegxXdu+xPCiu1+le4O6ESpMPyafxdL+fC8/EiBX0++lFNGdL7K22LiiKsMsNwaLND
	31UxKtma6brrvRkCjKc0SzUOlw1LcAI0jApWMP2KP8xpS9mR6uYohbczYXVzDWhZtBPQayqtDdIRM
	rhQ0oDTYhHnnk38WdRhOhCvX/4QBlSLlja3i8Bcn87Pe5vxh4sql8hNWWeUPHirgBduzpehbJ9er7
	GVwcVqwfXWDWgjWxdxIg9zsSSAhmLgy/bKPaKLIwGJvKLB6tPqvAEeTxZ6L/6Ho2oieCBCaosDb9i
	7qIlw3ZPDYJc1YEBM1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ykI-00GZaK-0Q;
	Fri, 16 Jun 2023 01:59:26 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ykE-00GZZW-2h
	for ath10k@lists.infradead.org;
	Fri, 16 Jun 2023 01:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686880762; x=1718416762;
  h=date:from:to:cc:subject:message-id;
  bh=5X6GVcXJCZwUMnyZE3BdLkB4gJ3Ptj/sOYfPOTxZ00c=;
  b=MSs7+zXJo9lGevDsq0fjUNflxsSFhDxFoneq0NQn+cxj4UTyUSvz+/UX
   2XpxsO3vZdtCAtIkkPRVsGWbC24e7iIUWwqjImsDf93/3dC6o1dY9N1wC
   nPsO38r/+0USsjGWlbKBKheXvmswMNUAfvose0fSzGKRu43S//8qzGh0e
   7Y/qXDhNcc3HOwkPF+ciIihJP2RPAJJrmm8V+O9JGP0oE4PEMSlsWkBVO
   T7ExX/iPZafhB5yYrMmJkcZesARCwcOSxNXxIqwXMERmdsMHlol+02NLZ
   Ov7L8QW17C9XR2o9sryTloOGy9PwJlouakAqHE7lBsDUzRzn8p4llin1F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="357965776"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="357965776"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 18:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="1042904223"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="1042904223"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2023 18:59:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9yjs-0000e9-2u;
	Fri, 16 Jun 2023 01:59:00 +0000
Date: Fri, 16 Jun 2023 09:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 83878a6ffd0d86883ee3588f6d42fbd29b093e21
Message-ID: <202306160957.liMpvEnG-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_185922_906528_94404C23 
X-CRM114-Status: UNSURE (   4.03  )
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
branch HEAD: 83878a6ffd0d86883ee3588f6d42fbd29b093e21  Add localversion-wireless-testing-ath

elapsed time: 834m

configs tested: 115
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r031-20230615   gcc  
arc                  randconfig-r043-20230614   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm          buildonly-randconfig-r001-20230614   clang
arm                                 defconfig   gcc  
arm                            dove_defconfig   clang
arm                      footbridge_defconfig   gcc  
arm                  randconfig-r046-20230614   clang
arm                         s5pv210_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r004-20230615   clang
hexagon              randconfig-r024-20230615   clang
hexagon              randconfig-r025-20230615   clang
hexagon              randconfig-r041-20230614   clang
hexagon              randconfig-r045-20230614   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r005-20230614   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230615   gcc  
i386                 randconfig-i002-20230615   gcc  
i386                 randconfig-i003-20230615   gcc  
i386                 randconfig-i004-20230615   gcc  
i386                 randconfig-i005-20230615   gcc  
i386                 randconfig-i006-20230615   gcc  
i386                 randconfig-i011-20230615   clang
i386                 randconfig-i012-20230615   clang
i386                 randconfig-i013-20230615   clang
i386                 randconfig-i014-20230615   clang
i386                 randconfig-i015-20230615   clang
i386                 randconfig-i016-20230615   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230615   gcc  
loongarch            randconfig-r015-20230614   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r032-20230615   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip27_defconfig   clang
mips                           jazz_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                 randconfig-r023-20230615   gcc  
nios2                         10m50_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230615   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230615   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc              randconfig-r011-20230614   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv        buildonly-randconfig-r003-20230614   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230614   gcc  
riscv                randconfig-r042-20230614   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230614   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230614   gcc  
s390                 randconfig-r026-20230615   clang
s390                 randconfig-r036-20230615   gcc  
s390                 randconfig-r044-20230614   gcc  
sh                               allmodconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                   randconfig-r034-20230615   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r001-20230615   gcc  
sparc64              randconfig-r022-20230615   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230615   gcc  
x86_64               randconfig-a002-20230615   gcc  
x86_64               randconfig-a003-20230615   gcc  
x86_64               randconfig-a004-20230615   gcc  
x86_64               randconfig-a005-20230615   gcc  
x86_64               randconfig-a006-20230615   gcc  
x86_64               randconfig-a011-20230615   clang
x86_64               randconfig-a012-20230615   clang
x86_64               randconfig-a013-20230615   clang
x86_64               randconfig-a014-20230615   clang
x86_64               randconfig-a015-20230615   clang
x86_64               randconfig-a016-20230615   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230614   gcc  
xtensa                       common_defconfig   gcc  
xtensa               randconfig-r016-20230614   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
