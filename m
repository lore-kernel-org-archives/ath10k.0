Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FC0C7EE31
	for <ath10k@archiver.kernel.org>; Tue, 30 May 2023 11:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S+vnSCnVn97Ha38B1pQ96ecPiju4i3Cv9gk8YnUt9fo=; b=rCi+Crv6C02Pf5
	ZV3RLR3FbsDXi0kds3yR/DScF6fBSzcM4y6GqDAGyV8Jo1aevNyhsswgoRAwUtbZtwdkJng7SgagP
	hee2Whf2sIaM2s6/oc5EA0KkmW6JK07LOQJc65Ab5XPYZDfDbTMaKZlpYQxF6TgSZDvp5fZrjia7n
	8DecqJ9g6huB9h3MEAx/n6ZY6w0yw1C6o+QNlTwRshrH+agfuJePANV3pt9yf3/qmHnf2BjHx//0r
	2dJlsPyMA6jN1DDIXL8YWbPVK3bLkK+MuhL2AW6lZ1Sbe+0H2DGxX84oacQRGAOQ4PMME8QHY5Q/l
	/xZsUFGSEYJUnEJkculw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xtV-00Dj7u-2R;
	Tue, 30 May 2023 11:52:05 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xtS-00Dj74-1X
	for ath10k@lists.infradead.org;
	Tue, 30 May 2023 11:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685447522; x=1716983522;
  h=date:from:to:cc:subject:message-id;
  bh=o9eQnaW5EeK6hSLKMQ11WIWK+3Obpjkl6C9aHOJ2STc=;
  b=CLzC/W7kyY3wCqPr9Sjx4Yovf5ujwD64aTEhHeBBhgvwDCSDSUonfC+S
   n3FZ9v/j1hMpvFD5UCLqmM9epAokEzzSr2NyEkMQINUZXmTuvT6LfxXem
   br6MErlR0Lz+txNZYsIuLA6ZYIWuqFhbw8cid3GJpr5wPfwombbb5My63
   lN10yNY2X5ZkHXbx7qFmW/HLKtqtJNrRRXwBeaglIY5H68XG2545wAb13
   6VW4EH4AcSBUsYv+FfmQrNZlwxKkAyB7NYZBLWkQVEk6e2PG1ug1h/Igy
   GcbL86CigFsPabbmk3ZincLLeqkn1SmSHrLukI4prxNEtJ3AonoFdMuAe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="357265792"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="357265792"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 04:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683932765"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="683932765"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2023 04:52:00 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3xtP-0000HL-2y;
	Tue, 30 May 2023 11:51:59 +0000
Date: Tue, 30 May 2023 19:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 9cc7cc5343b04d405de7ca10b4a287a4e1c5be0b
Message-ID: <20230530115130.wVEPq%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_045202_623442_32098015 
X-CRM114-Status: UNSURE (   4.93  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 9cc7cc5343b04d405de7ca10b4a287a4e1c5be0b  Merge branch 'ath-next' into ath-qca

elapsed time: 5882m

configs tested: 304
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230530   gcc  
arc                              alldefconfig   gcc  
arc                              allyesconfig   gcc  
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230526   gcc  
arc                  randconfig-r031-20230530   gcc  
arc                  randconfig-r043-20230530   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm          buildonly-randconfig-r001-20230526   gcc  
arm                                 defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r023-20230526   gcc  
csky                 randconfig-r025-20230526   gcc  
csky                 randconfig-r032-20230526   gcc  
csky                 randconfig-r032-20230530   gcc  
hexagon              randconfig-r015-20230528   clang
hexagon              randconfig-r041-20230526   clang
hexagon              randconfig-r045-20230526   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230526   gcc  
i386                 randconfig-i001-20230528   gcc  
i386                 randconfig-i001-20230530   clang
i386                 randconfig-i002-20230526   gcc  
i386                 randconfig-i002-20230528   gcc  
i386                 randconfig-i002-20230530   clang
i386                 randconfig-i003-20230526   gcc  
i386                 randconfig-i003-20230528   gcc  
i386                 randconfig-i003-20230530   clang
i386                 randconfig-i004-20230526   gcc  
i386                 randconfig-i004-20230528   gcc  
i386                 randconfig-i004-20230530   clang
i386                 randconfig-i005-20230526   gcc  
i386                 randconfig-i005-20230528   gcc  
i386                 randconfig-i005-20230530   clang
i386                 randconfig-i006-20230526   gcc  
i386                 randconfig-i006-20230528   gcc  
i386                 randconfig-i006-20230530   clang
i386                 randconfig-i011-20230526   clang
i386                 randconfig-i011-20230530   gcc  
i386                 randconfig-i012-20230526   clang
i386                 randconfig-i012-20230530   gcc  
i386                 randconfig-i013-20230526   clang
i386                 randconfig-i013-20230530   gcc  
i386                 randconfig-i014-20230526   clang
i386                 randconfig-i014-20230530   gcc  
i386                 randconfig-i015-20230526   clang
i386                 randconfig-i016-20230526   clang
i386                 randconfig-i051-20230526   gcc  
i386                 randconfig-i052-20230526   gcc  
i386                 randconfig-i053-20230526   gcc  
i386                 randconfig-i054-20230526   gcc  
i386                 randconfig-i055-20230526   gcc  
i386                 randconfig-i056-20230526   gcc  
i386                 randconfig-i061-20230526   gcc  
i386                 randconfig-i061-20230528   gcc  
i386                 randconfig-i062-20230526   gcc  
i386                 randconfig-i062-20230528   gcc  
i386                 randconfig-i063-20230526   gcc  
i386                 randconfig-i063-20230528   gcc  
i386                 randconfig-i064-20230526   gcc  
i386                 randconfig-i064-20230528   gcc  
i386                 randconfig-i065-20230526   gcc  
i386                 randconfig-i065-20230528   gcc  
i386                 randconfig-i066-20230526   gcc  
i386                 randconfig-i066-20230528   gcc  
i386                 randconfig-i071-20230528   clang
i386                 randconfig-i072-20230528   clang
i386                 randconfig-i072-20230530   gcc  
i386                 randconfig-i073-20230528   clang
i386                 randconfig-i074-20230528   clang
i386                 randconfig-i074-20230530   gcc  
i386                 randconfig-i075-20230528   clang
i386                 randconfig-i075-20230530   gcc  
i386                 randconfig-i076-20230528   clang
i386                 randconfig-i076-20230530   gcc  
i386                 randconfig-i081-20230528   clang
i386                 randconfig-i082-20230528   clang
i386                 randconfig-i082-20230530   gcc  
i386                 randconfig-i083-20230528   clang
i386                 randconfig-i083-20230530   gcc  
i386                 randconfig-i084-20230528   clang
i386                 randconfig-i084-20230530   gcc  
i386                 randconfig-i085-20230528   clang
i386                 randconfig-i085-20230530   gcc  
i386                 randconfig-i086-20230528   clang
i386                 randconfig-i091-20230526   gcc  
i386                 randconfig-i091-20230528   gcc  
i386                 randconfig-i091-20230530   clang
i386                 randconfig-i092-20230526   gcc  
i386                 randconfig-i092-20230528   gcc  
i386                 randconfig-i092-20230530   clang
i386                 randconfig-i093-20230526   gcc  
i386                 randconfig-i093-20230528   gcc  
i386                 randconfig-i093-20230530   clang
i386                 randconfig-i094-20230526   gcc  
i386                 randconfig-i094-20230528   gcc  
i386                 randconfig-i094-20230530   clang
i386                 randconfig-i095-20230526   gcc  
i386                 randconfig-i095-20230528   gcc  
i386                 randconfig-i095-20230530   clang
i386                 randconfig-i096-20230526   gcc  
i386                 randconfig-i096-20230528   gcc  
i386                 randconfig-i096-20230530   clang
i386                 randconfig-r024-20230530   gcc  
ia64                         bigsur_defconfig   gcc  
ia64                            zx1_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230526   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230526   gcc  
loongarch            randconfig-r021-20230526   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230530   gcc  
m68k                           virt_defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230526   gcc  
microblaze           randconfig-r012-20230530   gcc  
microblaze           randconfig-r023-20230530   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230530   gcc  
nios2                randconfig-r022-20230526   gcc  
openrisc             randconfig-r036-20230530   gcc  
openrisc                       virt_defconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230526   gcc  
parisc               randconfig-r036-20230526   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230526   clang
powerpc                 mpc8540_ads_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230526   clang
riscv                randconfig-r042-20230530   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230526   clang
s390                                defconfig   gcc  
s390                 randconfig-r013-20230530   gcc  
s390                 randconfig-r014-20230530   gcc  
s390                 randconfig-r034-20230526   gcc  
s390                 randconfig-r044-20230526   clang
s390                 randconfig-r044-20230530   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r012-20230526   gcc  
sh                   randconfig-r013-20230526   gcc  
sh                   randconfig-r014-20230526   gcc  
sh                   randconfig-r022-20230530   gcc  
sh                   randconfig-r026-20230526   gcc  
sh                          rsk7264_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc        buildonly-randconfig-r006-20230526   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230526   gcc  
sparc                randconfig-r016-20230530   gcc  
sparc                randconfig-r031-20230526   gcc  
sparc64              randconfig-r033-20230526   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230526   gcc  
x86_64               randconfig-a002-20230526   gcc  
x86_64               randconfig-a003-20230526   gcc  
x86_64               randconfig-a004-20230526   gcc  
x86_64               randconfig-a005-20230526   gcc  
x86_64               randconfig-a006-20230526   gcc  
x86_64               randconfig-a011-20230526   clang
x86_64               randconfig-a011-20230528   clang
x86_64               randconfig-a011-20230530   gcc  
x86_64               randconfig-a012-20230526   clang
x86_64               randconfig-a012-20230528   clang
x86_64               randconfig-a012-20230530   gcc  
x86_64               randconfig-a013-20230526   clang
x86_64               randconfig-a013-20230528   clang
x86_64               randconfig-a013-20230530   gcc  
x86_64               randconfig-a014-20230526   clang
x86_64               randconfig-a014-20230528   clang
x86_64               randconfig-a014-20230530   gcc  
x86_64               randconfig-a015-20230526   clang
x86_64               randconfig-a015-20230528   clang
x86_64               randconfig-a015-20230530   gcc  
x86_64               randconfig-a016-20230526   clang
x86_64               randconfig-a016-20230528   clang
x86_64               randconfig-a016-20230530   gcc  
x86_64               randconfig-x051-20230526   clang
x86_64               randconfig-x051-20230528   clang
x86_64               randconfig-x051-20230530   gcc  
x86_64               randconfig-x052-20230526   clang
x86_64               randconfig-x052-20230528   clang
x86_64               randconfig-x052-20230530   gcc  
x86_64               randconfig-x053-20230526   clang
x86_64               randconfig-x053-20230528   clang
x86_64               randconfig-x053-20230530   gcc  
x86_64               randconfig-x054-20230526   clang
x86_64               randconfig-x054-20230528   clang
x86_64               randconfig-x054-20230530   gcc  
x86_64               randconfig-x055-20230526   clang
x86_64               randconfig-x055-20230528   clang
x86_64               randconfig-x055-20230530   gcc  
x86_64               randconfig-x056-20230526   clang
x86_64               randconfig-x056-20230528   clang
x86_64               randconfig-x056-20230530   gcc  
x86_64               randconfig-x061-20230526   clang
x86_64               randconfig-x061-20230528   clang
x86_64               randconfig-x061-20230530   gcc  
x86_64               randconfig-x062-20230526   clang
x86_64               randconfig-x062-20230528   clang
x86_64               randconfig-x062-20230530   gcc  
x86_64               randconfig-x063-20230526   clang
x86_64               randconfig-x063-20230528   clang
x86_64               randconfig-x063-20230530   gcc  
x86_64               randconfig-x064-20230526   clang
x86_64               randconfig-x064-20230528   clang
x86_64               randconfig-x064-20230530   gcc  
x86_64               randconfig-x065-20230526   clang
x86_64               randconfig-x065-20230528   clang
x86_64               randconfig-x065-20230530   gcc  
x86_64               randconfig-x066-20230526   clang
x86_64               randconfig-x066-20230528   clang
x86_64               randconfig-x066-20230530   gcc  
x86_64               randconfig-x071-20230526   gcc  
x86_64               randconfig-x071-20230528   gcc  
x86_64               randconfig-x071-20230530   clang
x86_64               randconfig-x072-20230526   gcc  
x86_64               randconfig-x072-20230528   gcc  
x86_64               randconfig-x072-20230530   clang
x86_64               randconfig-x073-20230528   gcc  
x86_64               randconfig-x073-20230530   clang
x86_64               randconfig-x074-20230526   gcc  
x86_64               randconfig-x074-20230528   gcc  
x86_64               randconfig-x074-20230530   clang
x86_64               randconfig-x075-20230526   gcc  
x86_64               randconfig-x075-20230528   gcc  
x86_64               randconfig-x075-20230530   clang
x86_64               randconfig-x076-20230526   gcc  
x86_64               randconfig-x076-20230528   gcc  
x86_64               randconfig-x076-20230530   clang
x86_64               randconfig-x081-20230526   gcc  
x86_64               randconfig-x081-20230528   gcc  
x86_64               randconfig-x081-20230530   clang
x86_64               randconfig-x082-20230526   gcc  
x86_64               randconfig-x082-20230528   gcc  
x86_64               randconfig-x082-20230530   clang
x86_64               randconfig-x083-20230526   gcc  
x86_64               randconfig-x083-20230528   gcc  
x86_64               randconfig-x083-20230530   clang
x86_64               randconfig-x084-20230526   gcc  
x86_64               randconfig-x084-20230528   gcc  
x86_64               randconfig-x084-20230530   clang
x86_64               randconfig-x085-20230526   gcc  
x86_64               randconfig-x085-20230528   gcc  
x86_64               randconfig-x085-20230530   clang
x86_64               randconfig-x086-20230526   gcc  
x86_64               randconfig-x086-20230528   gcc  
x86_64               randconfig-x086-20230530   clang
x86_64               randconfig-x091-20230526   clang
x86_64               randconfig-x091-20230528   clang
x86_64               randconfig-x091-20230530   gcc  
x86_64               randconfig-x092-20230526   clang
x86_64               randconfig-x092-20230528   clang
x86_64               randconfig-x092-20230530   gcc  
x86_64               randconfig-x093-20230526   clang
x86_64               randconfig-x093-20230528   clang
x86_64               randconfig-x093-20230530   gcc  
x86_64               randconfig-x094-20230526   clang
x86_64               randconfig-x094-20230528   clang
x86_64               randconfig-x094-20230530   gcc  
x86_64               randconfig-x095-20230526   clang
x86_64               randconfig-x095-20230528   clang
x86_64               randconfig-x095-20230530   gcc  
x86_64               randconfig-x096-20230526   clang
x86_64               randconfig-x096-20230528   clang
x86_64               randconfig-x096-20230530   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230526   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
