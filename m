Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D04C001DF
	for <ath10k@archiver.kernel.org>; Thu,  3 Aug 2023 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0kDgCSWO4ktcOev6IN/6x+k7LXXlw1mTvDgtNGP4f94=; b=aU7uZYLyEnmBB5
	3ag2Pk0PJotdY6zfkWh91VV7J94ngUkRKlFQrn120z2XBMPOSFScrsbOUlgDrT7IMoe9OQ0w1hbz2
	E0mTBZqaJl1dlVChdhzq20E4Bemzp2sJPcww87ET+zYOT7vt8aC6nel9qEIy5ekko2tifANueDtT3
	rE7WmEhwYBPqIbU74MVOiDA/Sw3GwSSyOs66kUfrMm8MXvsiYtjzWQ5WcxilPii9nuiX2ExuOAPGN
	+dxzBacbkFGJeQvRDrr0aMs1vmUOYhdfmKwA3Obaj09rIy61JmWeSiweT6YAF9h+Nd/5bc2gr+kVD
	HDATd93nQzL5cMmVDFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRgBn-00AwOw-0N;
	Thu, 03 Aug 2023 21:48:59 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRgBk-00AwNf-1U
	for ath10k@lists.infradead.org;
	Thu, 03 Aug 2023 21:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691099336; x=1722635336;
  h=date:from:to:cc:subject:message-id;
  bh=1PppiX6xvx4rYIfjDtQIpvK90P5sfRYlUPRGllKtgDw=;
  b=Eq/AuFkkre27qY4aQ0aErA2M9YjAfuKlccCWM/2G6E6zlO6OmVMLTQNz
   t2nvtsA5vyGhqhNZJsvxBPk8oeuZeuyc7YT3Vj76jAsp6e9501Sl4An2u
   Wz+L4mNmbJ4Gl/gnX3+RfslY9/+ARZWA2c6hmgi+qC+ng5nyGDBssDqQG
   PcyYu0mkltrzdqDQOPHParucwZqYm13i8XeXqiNW7ttJtml89AoaT89s6
   JuKqu/z0A+AP+XiZTlJOmMCM16KTn+Fm8y0lcZw3IYhFgFdb2vMMiy2+o
   4H7RsH/wFMQLqXG5niZBwYNLpacYEUAMHEjOpO1iMAzlPiDBJ0lfOPYgt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="433857398"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="433857398"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 14:48:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="853444194"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="853444194"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Aug 2023 14:48:50 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRgBe-0002N5-0x;
	Thu, 03 Aug 2023 21:48:50 +0000
Date: Fri, 04 Aug 2023 05:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 8198950ccb7d311f8b4389441d8dcb597f926340
Message-ID: <202308040501.Po3YA7DM-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_144856_542002_1B2492A4 
X-CRM114-Status: UNSURE (   4.25  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 8198950ccb7d311f8b4389441d8dcb597f926340  wifi: ath12k: avoid deadlock by change ieee80211_queue_work for regd_update_work

elapsed time: 727m

configs tested: 111
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r021-20230803   gcc  
arc                  randconfig-r043-20230802   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                  randconfig-r032-20230801   clang
arm                  randconfig-r046-20230802   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230731   clang
csky                                defconfig   gcc  
csky                 randconfig-r006-20230801   gcc  
csky                 randconfig-r034-20230801   gcc  
hexagon              randconfig-r022-20230803   clang
hexagon              randconfig-r041-20230802   clang
hexagon              randconfig-r045-20230802   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r006-20230731   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230801   gcc  
i386                 randconfig-i002-20230801   gcc  
i386                 randconfig-i003-20230801   gcc  
i386                 randconfig-i004-20230801   gcc  
i386                 randconfig-i005-20230801   gcc  
i386                 randconfig-i006-20230801   gcc  
i386                 randconfig-i011-20230801   clang
i386                 randconfig-i012-20230801   clang
i386                 randconfig-i013-20230801   clang
i386                 randconfig-i014-20230801   clang
i386                 randconfig-i015-20230801   clang
i386                 randconfig-i016-20230801   clang
i386                 randconfig-r033-20230801   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230803   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r005-20230801   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip22_defconfig   clang
mips                 randconfig-r001-20230801   clang
mips                 randconfig-r025-20230803   gcc  
mips                       rbtx49xx_defconfig   clang
nios2                               defconfig   gcc  
openrisc             randconfig-r013-20230731   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r015-20230731   gcc  
parisc               randconfig-r023-20230803   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230801   gcc  
powerpc              randconfig-r036-20230801   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230802   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r011-20230731   clang
s390                 randconfig-r035-20230801   gcc  
s390                 randconfig-r044-20230802   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r016-20230731   gcc  
sh                   randconfig-r031-20230801   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r002-20230801   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230731   gcc  
x86_64       buildonly-randconfig-r002-20230731   gcc  
x86_64       buildonly-randconfig-r003-20230731   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r012-20230731   clang
x86_64               randconfig-x001-20230731   clang
x86_64               randconfig-x002-20230731   clang
x86_64               randconfig-x003-20230731   clang
x86_64               randconfig-x004-20230731   clang
x86_64               randconfig-x005-20230731   clang
x86_64               randconfig-x006-20230731   clang
x86_64               randconfig-x011-20230731   gcc  
x86_64               randconfig-x012-20230731   gcc  
x86_64               randconfig-x013-20230731   gcc  
x86_64               randconfig-x014-20230731   gcc  
x86_64               randconfig-x015-20230731   gcc  
x86_64               randconfig-x016-20230731   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r026-20230803   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
