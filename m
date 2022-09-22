Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77B4ECAAD8
	for <ath10k@archiver.kernel.org>; Thu, 22 Sep 2022 02:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EAkrBFtyw0WbbmsIoDt8D6FwpMJdrMJD9BYZbHL59Ng=; b=WuFOT19XuravIo
	NbDhvHUUAmp4V0iaGRwSBQgEeeevWnCbHSQJ1xB6xqpflYX8rOdaPo88y7wX0br1a9OI4Syax6/Ge
	UavkgjABy8+B/lL/YM6bd3TmtkKiPkgnwMna6ny8njmWggLqHrXTN3ZNXz8zhFdwIkOTf8wqikC34
	D3FyhEQsrfQgMQzuJeAYm8T8375hBQD0ABY7SWJ8OWGoHvErxF2MVhhDbKT54nfpEmDNKoQcK1X2X
	tdOBWm7HrixgNjtg4eX25MmXuvCeNCPX41hX0HsLnopgXgPgULueoubRZMh8NqS0wGhR7T15E21Bw
	l5uSRz5FlwqPnAsKP9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCD4-00DAll-03; Thu, 22 Sep 2022 02:45:06 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCCz-00DAkE-OZ
	for ath10k@lists.infradead.org; Thu, 22 Sep 2022 02:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663814701; x=1695350701;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ea+/KKqYhJnEXdyoQ3sHICMffUbC0rK7fCGVXdwR0KA=;
  b=j0JkPUbzptBQjeW1c6JgKHRsLk91AhsNV898zTFX9l5xymiZ02ynUEsC
   IWCaDPyqohyO6sQqQK5n8DqTMsS7nrEOocZdUKwp8Mpwelnwhyh4e+Uqv
   pLACZrStHJe3HhRdY0XjLW8fI3jYv4TiAsdeYL5URZ7XhK4VP/EVszdUN
   5sbmwECrgJR18ifsk5xUaSJZhAHWiIDK3m4gER2hOadfqBJkZ47FXSW9p
   Rw97C0uHtegNZX9+FkECXZZEoWtOqT0eB2zWJP5KNJhJjYbtJ9T2Gv+MT
   g1bUNR1v8fZpP1xSai4fa34WUMPA4tS18Xk0ImRJgjhKMrHaqVMsVCqRr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="287256216"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="287256216"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 19:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="708699008"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2022 19:44:57 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obCCu-0004Df-1E;
	Thu, 22 Sep 2022 02:44:56 +0000
Date: Thu, 22 Sep 2022 10:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 58ad8517bfb9576630c5f2ef6db4475e38fd47d0
Message-ID: <632bcbf8.cUcyve/rNkhV2iMU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_194501_890023_823747FE 
X-CRM114-Status: UNSURE (   7.28  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 58ad8517bfb9576630c5f2ef6db4475e38fd47d0  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
arc                  randconfig-r043-20220921
s390                                defconfig
riscv                randconfig-r042-20220921
s390                             allmodconfig
i386                                defconfig
x86_64                        randconfig-a013
s390                 randconfig-r044-20220921
powerpc                           allnoconfig
x86_64                        randconfig-a011
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a015
sh                               allmodconfig
s390                             allyesconfig
arm                                 defconfig
x86_64                              defconfig
i386                          randconfig-a014
x86_64                               rhel-8.3
i386                          randconfig-a012
i386                          randconfig-a016
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
i386                          randconfig-a001
arm                              allyesconfig
x86_64                        randconfig-a004
m68k                             allyesconfig
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a006
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
powerpc                      bamboo_defconfig
arm                           h5000_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
sparc64                          alldefconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220922
i386                          randconfig-c001
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc              randconfig-c003-20220921
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
m68k                       m5208evb_defconfig
arm                        multi_v7_defconfig
powerpc                      makalu_defconfig
powerpc                     stx_gp3_defconfig
arm                          exynos_defconfig
m68k                                defconfig
sh                 kfr2r09-romimage_defconfig
i386                             alldefconfig
powerpc                      ppc6xx_defconfig
powerpc                    adder875_defconfig
sh                               j2_defconfig
sh                             espt_defconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a006
x86_64                        randconfig-k001
powerpc                    gamecube_defconfig
arm                         orion5x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
