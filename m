Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD5FC61D97
	for <ath10k@archiver.kernel.org>; Fri, 24 Nov 2023 11:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=okh+b7ibgsS18Ko38HQXBtDFwf5glFX3rJ+fapW6A0c=; b=0LuDj9qKNOBywJ
	V3QYYQjGgD7vvkIc4/9PttoZ3r7ZWpU3OPi0a9dPWreKXuRSTj3ysczL7LMtKFKUT6eMr7bxjgZRj
	moCA5/9WqoF5LXK/9thdAh//3g1AHJIvWMIsC7uVi8+P0IaBtkWeNkXMrDeoatvaDqk8soaHstNyT
	pCZWOIFrBkLmZo+oT2h1KqfH2vjD85Hj3HQnTZZ80wdCbHeUscbYX9qK+loZV51PtU22EZQFarqxE
	e/nbIxUma2R1/hi3TjwrxD1vJrFJAUsUWWAkB02d2Fby4PncgRQ63Aloxv7WRa0GxnYQ6xfF3ySWp
	TuWTOPMYjavTuwUgbk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Tvg-006vnG-2A;
	Fri, 24 Nov 2023 11:01:00 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Tvd-006vm1-1c
	for ath10k@lists.infradead.org;
	Fri, 24 Nov 2023 11:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700823657; x=1732359657;
  h=date:from:to:cc:subject:message-id;
  bh=gLeuztrM3/ASPWZQAm7s7cmRcYw/Myy2UEX+6jFmDjk=;
  b=RhsZmxnosX+5a4uK1Og6pEARnIiMAHCBVstUulmeissj+/GzoYoIgczd
   xx2jYDZYHKsFNXAC6uzdwAf2/vybVgOt9MbW0kdLCyaCOUa6iEVu0Ys+4
   ICi6zjZFcgm7+3qpdJdAELSb+1xNomriKkLwb8LUWPUxiyeOyilZYi8fn
   nNA4311ma4e8LoR3hP4cyXU1yO8t+W2RJEwiSc6VjN0QdIZdQyMJbEUj8
   XK+PeJpQG92fQReB3JWCTB+J8inujv/GD3q+WDHuAA6C8vuItdBRJm7fR
   ko2c9jmNgyPeSZJ8kQsTy06S3CcsPzM4JUy1Lwa5TWLkFZBcnJB6/eBqM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392171809"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="392171809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="8935841"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2023 03:00:46 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6TvQ-0002ZS-0g;
	Fri, 24 Nov 2023 11:00:44 +0000
Date: Fri, 24 Nov 2023 18:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 bebbb478b782d75b793c12d4ee19e90b38d4b7a5
Message-ID: <202311241843.JO5MTjgX-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_030057_547779_532B9FA0 
X-CRM114-Status: UNSURE (   4.27  )
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
branch HEAD: bebbb478b782d75b793c12d4ee19e90b38d4b7a5  Merge branch 'ath-next' into ath-qca

elapsed time: 2413m

configs tested: 179
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231123   gcc  
arc                   randconfig-002-20231123   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                            mps2_defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                   randconfig-001-20231123   gcc  
arm                   randconfig-002-20231123   gcc  
arm                   randconfig-003-20231123   gcc  
arm                   randconfig-004-20231123   gcc  
arm                           sama5_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231123   gcc  
arm64                 randconfig-002-20231123   gcc  
arm64                 randconfig-003-20231123   gcc  
arm64                 randconfig-004-20231123   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231123   gcc  
csky                  randconfig-002-20231123   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231123   gcc  
i386         buildonly-randconfig-002-20231123   gcc  
i386         buildonly-randconfig-003-20231123   gcc  
i386         buildonly-randconfig-004-20231123   gcc  
i386         buildonly-randconfig-005-20231123   gcc  
i386         buildonly-randconfig-006-20231123   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231123   gcc  
i386                  randconfig-002-20231123   gcc  
i386                  randconfig-003-20231123   gcc  
i386                  randconfig-004-20231123   gcc  
i386                  randconfig-005-20231123   gcc  
i386                  randconfig-006-20231123   gcc  
i386                  randconfig-011-20231123   clang
i386                  randconfig-012-20231123   clang
i386                  randconfig-013-20231123   clang
i386                  randconfig-014-20231123   clang
i386                  randconfig-015-20231123   clang
i386                  randconfig-016-20231123   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231123   gcc  
loongarch             randconfig-002-20231123   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                          rb532_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231123   gcc  
nios2                 randconfig-002-20231123   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231123   gcc  
parisc                randconfig-002-20231123   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc               randconfig-001-20231123   gcc  
powerpc               randconfig-002-20231123   gcc  
powerpc               randconfig-003-20231123   gcc  
powerpc64             randconfig-001-20231123   gcc  
powerpc64             randconfig-002-20231123   gcc  
powerpc64             randconfig-003-20231123   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231123   gcc  
riscv                 randconfig-002-20231123   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20231123   gcc  
sh                    randconfig-002-20231123   gcc  
sh                           se7724_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231123   gcc  
sparc64               randconfig-002-20231123   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231123   gcc  
um                    randconfig-002-20231123   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231123   gcc  
x86_64       buildonly-randconfig-002-20231123   gcc  
x86_64       buildonly-randconfig-003-20231123   gcc  
x86_64       buildonly-randconfig-004-20231123   gcc  
x86_64       buildonly-randconfig-005-20231123   gcc  
x86_64       buildonly-randconfig-006-20231123   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231123   gcc  
x86_64                randconfig-012-20231123   gcc  
x86_64                randconfig-013-20231123   gcc  
x86_64                randconfig-014-20231123   gcc  
x86_64                randconfig-015-20231123   gcc  
x86_64                randconfig-016-20231123   gcc  
x86_64                randconfig-071-20231123   gcc  
x86_64                randconfig-072-20231123   gcc  
x86_64                randconfig-073-20231123   gcc  
x86_64                randconfig-074-20231123   gcc  
x86_64                randconfig-075-20231123   gcc  
x86_64                randconfig-076-20231123   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231123   gcc  
xtensa                randconfig-002-20231123   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
