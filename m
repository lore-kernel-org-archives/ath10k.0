Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB21C0015E
	for <ath10k@archiver.kernel.org>; Fri, 28 Jul 2023 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cyhT8OtgM6AGEXoMN8espfksZQ+9FCH60f2D6PB2XD4=; b=kpFQG9LDwCgKRn
	e/Bg49h8cpP4zqR5O33vwr8lP+7Sa2cxxbK9gHAmD0wQi3Nqe4hZmnCZ2tincLEo5n2Ebznr4SU/2
	6cYmiy/oHsTcrutocCv6ALGSJNeFXdIMoY0fXqWR4q3LLUY7hQKddYSAqIZYugnnpm7RU6btQPd1q
	aa1l48a3xMmOFq3dZ+mu5zcfx5ISfuFFM94+eY0lE2pvWKfRlzb9w1r+tM9uiPNtAZusEGgk7Qsch
	tDA6aKFa6aaDhjpsUSchTYRjKK/J8TaKgylqTvb7fK4YJZzC/RqleFKSP3lpbSAbBUIbG1hZPBUQK
	IuZmR/mNM0a1qepacW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPITu-002Jme-1X;
	Fri, 28 Jul 2023 08:05:50 +0000
Received: from [134.134.136.20] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPITq-002JlS-2x
	for ath10k@lists.infradead.org;
	Fri, 28 Jul 2023 08:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690531546; x=1722067546;
  h=date:from:to:cc:subject:message-id;
  bh=KMn0ZopJD1VRUF6NFJw5VTdlN+AOW2Q3HBnm41R5nNg=;
  b=E3y2BeA84MNhThyvmyLZxd3bfUBoslMIItmRN8xmMjfaSsFlPKHl3U/u
   4Fi5J46teZkLSylaQ5+eV88yjjh0Xq7jCRozEtpNR37ksWx8svyYElfb4
   FGPuKQx2+fVB3sJlzUjllW/xqyGMMWd5yuQFvhcvpda+sxUXTDcrN1KLo
   Ng7ZcA7ZT9oqUGhvY3qLzc1CKdxr2/0pTmlEMqIq1Gq0YrIFotmnqEDj2
   1kvsNMHBZzrQ9NgkFoHFEqi6hXeTql2Ychc5Y0Tk2Oo80vT5hKkWrAiBf
   mQ630VFhAPmQWLA/bfVmSR0i8d17nqEd5vrh4nHhyIIeqx3IavdSTUaBN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="358562071"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="358562071"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 01:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="817410522"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="817410522"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2023 01:05:42 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPITY-00030k-2H;
	Fri, 28 Jul 2023 08:05:31 +0000
Date: Fri, 28 Jul 2023 16:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 4b548ae92d7ea3a68eb39f64e2339dec4c5383b4
Message-ID: <202307281620.UpqEh09H-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_010547_022484_1E2030A8 
X-CRM114-Status: UNSURE (   5.13  )
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
branch HEAD: 4b548ae92d7ea3a68eb39f64e2339dec4c5383b4  Merge branch 'ath-next' into ath-qca

elapsed time: 935m

configs tested: 105
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230727   gcc  
alpha                randconfig-r022-20230727   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230727   gcc  
arc                  randconfig-r025-20230727   gcc  
arc                  randconfig-r043-20230727   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r012-20230727   clang
arm                  randconfig-r046-20230727   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230727   clang
arm64                randconfig-r034-20230727   clang
csky                                defconfig   gcc  
csky                 randconfig-r021-20230727   gcc  
hexagon              randconfig-r036-20230727   clang
hexagon              randconfig-r041-20230727   clang
hexagon              randconfig-r045-20230727   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230727   clang
i386         buildonly-randconfig-r005-20230727   clang
i386         buildonly-randconfig-r006-20230727   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230727   clang
i386                 randconfig-i002-20230727   clang
i386                 randconfig-i003-20230727   clang
i386                 randconfig-i004-20230727   clang
i386                 randconfig-i005-20230727   clang
i386                 randconfig-i006-20230727   clang
i386                 randconfig-i011-20230727   gcc  
i386                 randconfig-i012-20230727   gcc  
i386                 randconfig-i013-20230727   gcc  
i386                 randconfig-i014-20230727   gcc  
i386                 randconfig-i015-20230727   gcc  
i386                 randconfig-i016-20230727   gcc  
i386                 randconfig-r032-20230727   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230727   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r013-20230727   clang
nios2                               defconfig   gcc  
nios2                randconfig-r024-20230727   gcc  
openrisc             randconfig-r011-20230727   gcc  
openrisc             randconfig-r014-20230727   gcc  
openrisc             randconfig-r026-20230727   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r033-20230727   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230727   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230727   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r035-20230727   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230727   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230727   clang
x86_64       buildonly-randconfig-r002-20230727   clang
x86_64       buildonly-randconfig-r003-20230727   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230727   gcc  
x86_64               randconfig-x002-20230727   gcc  
x86_64               randconfig-x003-20230727   gcc  
x86_64               randconfig-x004-20230727   gcc  
x86_64               randconfig-x005-20230727   gcc  
x86_64               randconfig-x006-20230727   gcc  
x86_64               randconfig-x011-20230727   clang
x86_64               randconfig-x012-20230727   clang
x86_64               randconfig-x013-20230727   clang
x86_64               randconfig-x014-20230727   clang
x86_64               randconfig-x015-20230727   clang
x86_64               randconfig-x016-20230727   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r015-20230727   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
