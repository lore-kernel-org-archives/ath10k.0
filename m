Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11017C77B7C
	for <ath10k@archiver.kernel.org>; Fri, 12 May 2023 21:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7IaU8P0gOfx4KPFpKA6zizRwzlat63WrsvU++yf/g9o=; b=cEL6i4ph+VHMwM
	j5ZLSw4OcCBVB4jWAUBodR4yIBGeVVTiFssxcliV3E3NB5Or382QlfEjouVlKTVOJeUGyxm6WLi6G
	ksQyYwjkjprN1DbqNr5vC4tan/924J7wbbRP4kuntgy+LOBgLQSmMdXw0fotMN9eMgbdldLawrbBe
	2Q/8VhIoWcBm/ixQl+q1eN95H5kv6ZsODKDeNTVod1nCy+R8Piq+eRWzKgXzajfd2nlEwZsaTMozx
	zYvF2dOeBWnR0MEab+Wxnd9F3/4C7/ntxdBbpMbGJkRTZU+kcoHrDWxCZG4JNp9gtLnS1OiL42+p8
	p9Krkh1sLUn0JZznRnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaDD-00D449-0i;
	Fri, 12 May 2023 21:22:03 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaDA-00D43L-04
	for ath10k@lists.infradead.org;
	Fri, 12 May 2023 21:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683926520; x=1715462520;
  h=date:from:to:cc:subject:message-id;
  bh=p3EjUaQ5EpyBMNeIbe1MwGjanbV9HOFziROtwrzyl0g=;
  b=WlS87p9BOlSlVgmCH5B+HWeTdY4ULnmiONWBypqjsk6T2lyb/PgaHfb+
   xU9a5T0mW0ePYZ/vpocFKHPvjMGoeArHrUMwyY93PxUaVe4TEW3zVuViZ
   LV9IW8+5YXKlysuFN34DVQxv8ikPzxuCXPvgH8GHLd6crTDCLWk7QuRgd
   qiQYYO/7fZbTyA1LGgqeOIzdEaZiomAbEKAK6bnDQw8H8UmVOCX6wZPzk
   i8Yjd27t6dv32YIFv74aI9SFaai97HD1qRY4XRP7fqOIZH2vtW/xttXgk
   iLg6ik8BaHtdsra/udk6fHqSSOLU46wkFJt+TYyfQzfql0694mCqU6M+s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414266088"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414266088"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 14:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="789964967"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="789964967"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 May 2023 14:21:57 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxaD6-00057O-1y;
	Fri, 12 May 2023 21:21:56 +0000
Date: Sat, 13 May 2023 05:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD REGRESSION
 229ea354bdd24bf3c33c9447674fab8d609e24a2
Message-ID: <20230512212134._CSX0%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_142200_163509_FF7DB015 
X-CRM114-Status: UNSURE (   4.19  )
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
branch HEAD: 229ea354bdd24bf3c33c9447674fab8d609e24a2  wifi: ath11k: Allow ath11k to boot without caldata in ftm mode

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305122213.1eOA66xV-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath11k/testmode.h:17:6: warning: no previous prototype for 'ath11k_tm_wmi_event' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/testmode.h:19: multiple definition of `ath11k_tm_wmi_event'; drivers/net/wireless/ath/ath11k/wmi.o:drivers/net/wireless/ath/ath11k/testmode.h:19: first defined here

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-defconfig
|   |-- drivers-net-wireless-ath-ath11k-testmode.h:warning:no-previous-prototype-for-ath11k_tm_wmi_event
|   `-- multiple-definition-of-ath11k_tm_wmi_event-drivers-net-wireless-ath-ath11k-wmi.o:drivers-net-wireless-ath-ath11k-testmode.h:first-defined-here
`-- sh-randconfig-r003-20230511
    `-- drivers-net-wireless-ath-ath11k-testmode.h:warning:no-previous-prototype-for-ath11k_tm_wmi_event

elapsed time: 721m

configs tested: 183
configs skipped: 12

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230511   gcc  
alpha                randconfig-r005-20230509   gcc  
alpha                randconfig-r006-20230511   gcc  
alpha                randconfig-r011-20230509   gcc  
alpha                randconfig-r014-20230510   gcc  
alpha                randconfig-r015-20230510   gcc  
alpha                randconfig-r015-20230511   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230509   gcc  
arc                  randconfig-r014-20230509   gcc  
arc                  randconfig-r043-20230509   gcc  
arc                  randconfig-r043-20230511   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r013-20230510   gcc  
arm                  randconfig-r016-20230509   gcc  
arm                  randconfig-r021-20230511   clang
arm                  randconfig-r023-20230511   clang
arm                  randconfig-r024-20230509   gcc  
arm                  randconfig-r025-20230511   clang
arm                  randconfig-r031-20230511   gcc  
arm                  randconfig-r033-20230509   clang
arm                  randconfig-r046-20230509   gcc  
arm                  randconfig-r046-20230511   clang
arm                        spear6xx_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r001-20230511   gcc  
csky         buildonly-randconfig-r002-20230511   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230511   gcc  
csky                 randconfig-r005-20230511   gcc  
csky                 randconfig-r011-20230512   gcc  
csky                 randconfig-r021-20230511   gcc  
csky                 randconfig-r023-20230511   gcc  
hexagon      buildonly-randconfig-r003-20230509   clang
hexagon              randconfig-r004-20230509   clang
hexagon              randconfig-r011-20230511   clang
hexagon              randconfig-r015-20230511   clang
hexagon              randconfig-r024-20230509   clang
hexagon              randconfig-r032-20230511   clang
hexagon              randconfig-r034-20230511   clang
hexagon              randconfig-r036-20230509   clang
hexagon              randconfig-r041-20230509   clang
hexagon              randconfig-r041-20230511   clang
hexagon              randconfig-r045-20230509   clang
hexagon              randconfig-r045-20230511   clang
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
ia64                         bigsur_defconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r002-20230511   gcc  
ia64                 randconfig-r006-20230509   gcc  
ia64                 randconfig-r035-20230511   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230511   gcc  
loongarch            randconfig-r013-20230509   gcc  
loongarch            randconfig-r014-20230511   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230509   gcc  
m68k                 randconfig-r012-20230509   gcc  
m68k                 randconfig-r012-20230511   gcc  
m68k                 randconfig-r014-20230511   gcc  
m68k                 randconfig-r021-20230509   gcc  
m68k                 randconfig-r032-20230509   gcc  
microblaze           randconfig-r005-20230511   gcc  
microblaze           randconfig-r013-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips         buildonly-randconfig-r003-20230511   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r004-20230511   gcc  
mips                 randconfig-r015-20230509   gcc  
mips                 randconfig-r024-20230511   clang
nios2        buildonly-randconfig-r006-20230509   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230509   gcc  
nios2                randconfig-r016-20230511   gcc  
nios2                randconfig-r025-20230511   gcc  
nios2                randconfig-r026-20230509   gcc  
nios2                randconfig-r033-20230511   gcc  
nios2                randconfig-r035-20230509   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r004-20230511   gcc  
parisc       buildonly-randconfig-r005-20230511   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230509   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r005-20230509   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc              randconfig-r003-20230511   clang
powerpc              randconfig-r005-20230509   gcc  
powerpc              randconfig-r022-20230511   gcc  
powerpc              randconfig-r034-20230509   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r012-20230511   gcc  
riscv                randconfig-r021-20230509   clang
riscv                randconfig-r026-20230509   clang
riscv                randconfig-r036-20230511   clang
riscv                randconfig-r042-20230509   clang
riscv                randconfig-r042-20230511   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230511   gcc  
s390                 randconfig-r026-20230511   gcc  
s390                 randconfig-r031-20230511   clang
s390                 randconfig-r032-20230511   clang
s390                 randconfig-r044-20230509   clang
s390                 randconfig-r044-20230511   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230512   gcc  
sh                   randconfig-r014-20230509   gcc  
sh                   randconfig-r024-20230511   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230509   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230509   gcc  
sparc                randconfig-r012-20230512   gcc  
sparc                randconfig-r015-20230509   gcc  
sparc                randconfig-r016-20230509   gcc  
sparc                randconfig-r016-20230510   gcc  
sparc                randconfig-r031-20230509   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64              randconfig-r011-20230510   gcc  
sparc64              randconfig-r012-20230510   gcc  
sparc64              randconfig-r016-20230511   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230509   gcc  
xtensa               randconfig-r004-20230509   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
