Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A667CC41513
	for <ath10k@archiver.kernel.org>; Sun, 23 Jul 2023 02:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nn2N237wGezgTVOpLsyA4M7UWKlep9HlmG+03sZvYOM=; b=bI6NEeQ3422vOy
	x19ys8wIUgdTy35kBEEJ42O3nKLCdPP3eWFPWPxzcZUSE3d0tBG1dI8g47l389VClXrGxMl6pTc8g
	pWnWRVO47iDBSy4SR4GvDeyDGkCC65bvEapH7dt83Q+5k3h6uxgrqHHCLe5OcwZ71DsaR8O0IIeS/
	0YRKjn3Rl/9BAADJEOizrBWfHSBrYUsrG6e0YZ+4lVdPCScdXd7nEXR/+DWpVuSZ0MANf46D1DGLk
	3C5iImMUnca0EPAXGpfZNZ5BVyvOgP2V/VFqwNKTKY67PcqJZdlOpVdYOVLXUhi5ApKGqY/+2eFZq
	7KsHhRofEb2pSKOzB0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNPAQ-00075E-2H;
	Sun, 23 Jul 2023 02:49:54 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNPAM-00074I-2U
	for ath10k@lists.infradead.org;
	Sun, 23 Jul 2023 02:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690080590; x=1721616590;
  h=date:from:to:cc:subject:message-id;
  bh=nVe2FqEa4VSA0XSuVfRQ31Tlbff+UmbY4J3Qia0WXVE=;
  b=bewmaLRcs4q1oim2aGGv1aIM+mewHhB2E6H7N51zjVSt7PToW5EG+bZJ
   gNcDKZbI7VGCmAeKQnPdEUEnxg4K4V8valXiktq2fAHE09u5GZm7InjOH
   gVIp9eFwfiVc5tmYbgA4tk1nPgG2pK60JsB6o3ySl/V6GRGgxG3qWWlCg
   kBku/OWp7TDnhRjmGQqBmStR0FEcPWlO108b/YrjDPXCze7r3jHCNOS/7
   EjoVrUYynYmmmQ2j2ALKtsG1phLvZXHy9OBBmvwRxcfp8tfYyE8GOyX6t
   lbSCnmYEf+8fZwEV4T+a71SqyRkaLg47LAsw8z90WchhspkIzNIv7c6NL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="453619641"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="453619641"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 19:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="760388934"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="760388934"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Jul 2023 19:49:43 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNPAE-0008lp-2E;
	Sun, 23 Jul 2023 02:49:42 +0000
Date: Sun, 23 Jul 2023 10:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 75d87912aa404df37686c922be1dea8579b835cd
Message-ID: <202307231053.tsCXNX9Z-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_194950_824879_C235D466 
X-CRM114-Status: UNSURE (   5.45  )
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
branch HEAD: 75d87912aa404df37686c922be1dea8579b835cd  Merge branch 'pending' into master-pending

elapsed time: 720m

configs tested: 112
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230722   gcc  
arc                  randconfig-r043-20230722   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r035-20230722   clang
arm                  randconfig-r046-20230722   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230722   clang
csky                                defconfig   gcc  
csky                 randconfig-r031-20230722   gcc  
csky                 randconfig-r034-20230722   gcc  
hexagon              randconfig-r016-20230722   clang
hexagon              randconfig-r041-20230722   clang
hexagon              randconfig-r045-20230722   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230722   gcc  
i386         buildonly-randconfig-r005-20230722   gcc  
i386         buildonly-randconfig-r006-20230722   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230722   gcc  
i386                 randconfig-i002-20230722   gcc  
i386                 randconfig-i003-20230722   gcc  
i386                 randconfig-i004-20230722   gcc  
i386                 randconfig-i005-20230722   gcc  
i386                 randconfig-i006-20230722   gcc  
i386                 randconfig-i011-20230720   clang
i386                 randconfig-i011-20230723   gcc  
i386                 randconfig-i012-20230720   clang
i386                 randconfig-i012-20230723   gcc  
i386                 randconfig-i013-20230720   clang
i386                 randconfig-i013-20230723   gcc  
i386                 randconfig-i014-20230720   clang
i386                 randconfig-i014-20230723   gcc  
i386                 randconfig-i015-20230723   gcc  
i386                 randconfig-i016-20230723   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230722   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230722   gcc  
mips                 randconfig-r032-20230722   clang
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230722   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230722   gcc  
parisc               randconfig-r002-20230722   gcc  
parisc               randconfig-r012-20230722   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230722   gcc  
powerpc              randconfig-r025-20230722   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230722   gcc  
riscv                randconfig-r042-20230722   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230722   gcc  
s390                 randconfig-r044-20230722   clang
sh                               allmodconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r022-20230722   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r024-20230722   gcc  
um                   randconfig-r036-20230722   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230722   gcc  
x86_64       buildonly-randconfig-r002-20230722   gcc  
x86_64       buildonly-randconfig-r003-20230722   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r005-20230722   gcc  
x86_64               randconfig-x001-20230720   clang
x86_64               randconfig-x002-20230720   clang
x86_64               randconfig-x003-20230720   clang
x86_64               randconfig-x004-20230720   clang
x86_64               randconfig-x005-20230720   clang
x86_64               randconfig-x006-20230720   clang
x86_64               randconfig-x011-20230722   gcc  
x86_64               randconfig-x012-20230722   gcc  
x86_64               randconfig-x013-20230722   gcc  
x86_64               randconfig-x014-20230722   gcc  
x86_64               randconfig-x015-20230722   gcc  
x86_64               randconfig-x016-20230722   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r033-20230722   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
