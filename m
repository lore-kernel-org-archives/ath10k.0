Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26501EB8FA5
	for <ath10k@archiver.kernel.org>; Wed,  6 Sep 2023 04:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CLyUd6W3ZmKrxuBJCiIcFDRfkYJTA3Lv05ov3xscpg4=; b=PaUOmB52/aNV5I
	+PAbMo8Yd+OHAekf+jWWtvnaNJD9BlcRh8dPs/PTdIvErbWOHdRIU9oPWq5qkB6eu7y1aXtEYDdQM
	nfQWPkfa0yIskFccu58EGq006WeE7aPobOXuAETQKUXVlRyiaclieR/dO22WpiKgkbF/4QxQe5KUY
	NlEiFG8vupxBNxPAHrRdct9KsRYGlpcmIzeVUILnFDnP0Yjy4UUDGqL89M4CyHSMJTatYPf0sFA5Q
	QMePJoMN1aOBc65MX1GFMOenII7Eh7V1r4iD2sL0gxJpxYEVpapREJnLf7SaZGDPFTiDwbN87Q/Rp
	WMckBuUnkLIKetFeODag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdk6f-007Dct-13;
	Wed, 06 Sep 2023 04:25:33 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdk6c-007Dbu-1J
	for ath10k@lists.infradead.org;
	Wed, 06 Sep 2023 04:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693974330; x=1725510330;
  h=date:from:to:cc:subject:message-id;
  bh=Am9AVbWEYrwjpiCmeHl9eS0EILw3WNkC2d/Z2Btovnc=;
  b=cM1CMQy27wJPTQTihxHr6KjhH+nD3rryooC7+OS6VwxM6EFBUyTtUcyT
   +YsGSyYfU0XfYntXIEWaUCtF4MKKS5Q8J0FR4wzVkLfIq6r15LqxVDq29
   q8bJvIqZjzXE/l6JCWZLi+HB29pxhMtJitHHz1sRdfrHiP9lN3vXzkD3F
   z8ypnScrvKKHnKJTn1JSSW2CeDgP7Z8HxZt26jmZtiDpSQP3iUiWt8tj5
   Ajx1/Y7+rDi19FXXj4JxX7LiUowdxSLJocji2ZhK7cSGw6zfoU3LiG1Gy
   wYddWIndAUGBI2jt4cnISzpzmlGPC5OD7OVBnBBXeCjt1qRQ2vAXG0Lnc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="357277129"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="357277129"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 21:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="1072239596"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="1072239596"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Sep 2023 21:25:21 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdk6R-0002Sh-1w;
	Wed, 06 Sep 2023 04:25:19 +0000
Date: Wed, 06 Sep 2023 12:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 04399ffc1306a01683673c0f1c7e38dce82ef3ca
Message-ID: <202309061240.Gd9LBUG9-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_212530_455658_40F40D8C 
X-CRM114-Status: UNSURE (   4.14  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 04399ffc1306a01683673c0f1c7e38dce82ef3ca  wifi: ath12k: Set default beacon mode to burst mode

elapsed time: 733m

configs tested: 172
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230906   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230906   gcc  
arm                  randconfig-r013-20230906   gcc  
arm                  randconfig-r031-20230906   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230906   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230906   gcc  
hexagon               randconfig-001-20230906   clang
hexagon               randconfig-002-20230906   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230906   gcc  
i386         buildonly-randconfig-002-20230906   gcc  
i386         buildonly-randconfig-003-20230906   gcc  
i386         buildonly-randconfig-004-20230906   gcc  
i386         buildonly-randconfig-005-20230906   gcc  
i386         buildonly-randconfig-006-20230906   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230906   gcc  
i386                  randconfig-002-20230906   gcc  
i386                  randconfig-003-20230906   gcc  
i386                  randconfig-004-20230906   gcc  
i386                  randconfig-005-20230906   gcc  
i386                  randconfig-006-20230906   gcc  
i386                  randconfig-011-20230906   clang
i386                  randconfig-012-20230906   clang
i386                  randconfig-013-20230906   clang
i386                  randconfig-014-20230906   clang
i386                  randconfig-015-20230906   clang
i386                  randconfig-016-20230906   clang
i386                 randconfig-r033-20230906   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230906   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                 randconfig-r023-20230906   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                 randconfig-r001-20230906   clang
mips                 randconfig-r024-20230906   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230906   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r025-20230906   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                     ppa8548_defconfig   clang
powerpc              randconfig-r014-20230906   clang
powerpc64            randconfig-r015-20230906   clang
powerpc64            randconfig-r034-20230906   gcc  
powerpc64            randconfig-r035-20230906   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20230906   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230906   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r032-20230906   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230906   gcc  
sparc                randconfig-r003-20230906   gcc  
sparc                randconfig-r005-20230906   gcc  
sparc                randconfig-r012-20230906   gcc  
sparc                randconfig-r026-20230906   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r021-20230906   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230906   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230906   gcc  
x86_64       buildonly-randconfig-002-20230906   gcc  
x86_64       buildonly-randconfig-003-20230906   gcc  
x86_64       buildonly-randconfig-004-20230906   gcc  
x86_64       buildonly-randconfig-005-20230906   gcc  
x86_64       buildonly-randconfig-006-20230906   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230906   clang
x86_64                randconfig-002-20230906   clang
x86_64                randconfig-003-20230906   clang
x86_64                randconfig-004-20230906   clang
x86_64                randconfig-005-20230906   clang
x86_64                randconfig-006-20230906   clang
x86_64                randconfig-011-20230906   gcc  
x86_64                randconfig-012-20230906   gcc  
x86_64                randconfig-013-20230906   gcc  
x86_64                randconfig-014-20230906   gcc  
x86_64                randconfig-015-20230906   gcc  
x86_64                randconfig-016-20230906   gcc  
x86_64                randconfig-071-20230906   gcc  
x86_64                randconfig-072-20230906   gcc  
x86_64                randconfig-073-20230906   gcc  
x86_64                randconfig-074-20230906   gcc  
x86_64                randconfig-075-20230906   gcc  
x86_64                randconfig-076-20230906   gcc  
x86_64               randconfig-r022-20230906   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r036-20230906   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
