Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CBEC77B7F
	for <ath10k@archiver.kernel.org>; Fri, 19 May 2023 08:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yThhgb6iqL/v+DGI4+PwarRRbQBvofS0IalsHILGI00=; b=mPZg2NirB/bU7j
	RT6TGh2RsXYtkjlFs53tpUvZsfvqLVt6KjUKCEUSQHjAtd780D34MLs7REd+JyoE2ciy4S0Bp/0T2
	yUjv38LBLMKDIimLRUYY1/vjbNAFa3TfbCW6Yzl7EwqdjCq+z8NinXAbkiKRXujPu9d5yfGSkAlof
	Cm0aneeXYLk3sFEsLH6M6de+HVZ8wE8iRsYwVrNjdVA2NOQHXUya6RkNHqx/b8+UrnupVtKrFgzXo
	sphkLpqwLXZW61eyq4UsX2UAuv6HL0TuDwzKI0r5XAZOjijZsj9r6in/QNsSNn5rcyoUaNfc027RB
	VGIflgytfzcJSMqo0rlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzv6r-00FSSH-3A;
	Fri, 19 May 2023 08:05:09 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzv6o-00FSR7-1X
	for ath10k@lists.infradead.org;
	Fri, 19 May 2023 08:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684483506; x=1716019506;
  h=date:from:to:cc:subject:message-id;
  bh=2xynLAHskyc+i9C2p0ZLLmmUqY/t8enyllRK5C9jfLk=;
  b=iL3lJteG1rj9YWVhv373RzYi+8M2G+sDeRbjvjK6aKPtLo3STA/+ddz+
   rRVMMlmxWx6iAtPANTHxi7zsmr8DuJPTXFTWTtXxDVLS4FpugybFizvbO
   /fH/nMy+nzG9AKomrnbaNihkXHzi77nMpEVO4N08IaFtpP2INZdGujZL6
   OBtiC7QWTS0K1aThDvkItFsqFh4kxcjUncHKTmxH9RH+yQyuVgyuDbycf
   f2nc/xmugt/mKLQu12K49KNHkD8Rf6E0YoMjKpgz1p4BCft4beiwwiouh
   0aP9s41Rg03gdPwoU3rQMRrrn4zmxPmY8T7w4w7itdpty1m5u5GAVwT/2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="332674197"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="332674197"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="772207084"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="772207084"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 May 2023 01:05:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzv6l-000AhZ-0o;
	Fri, 19 May 2023 08:05:03 +0000
Date: Fri, 19 May 2023 16:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD REGRESSION
 3b25cd422b39f1220b8504aaf8a67fcb06994021
Message-ID: <20230519080421.1Modd%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_010506_559898_029037AB 
X-CRM114-Status: UNSURE (   4.70  )
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

tree/branch: INFO setup_repo_specs: /db/releases/20230517200055/lkp-src/repo/*/kvalo-ath
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 3b25cd422b39f1220b8504aaf8a67fcb06994021  wifi: ath10k: Trigger STA disconnect after reconfig complete on hardware restart

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202305122213.1eOA66xV-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath11k/testmode.h:17:6: warning: no previous prototype for 'ath11k_tm_wmi_event' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/testmode.h:19: multiple definition of `ath11k_tm_wmi_event'; drivers/net/wireless/ath/ath11k/wmi.o:drivers/net/wireless/ath/ath11k/testmode.h:19: first defined here

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arm64-defconfig
    |-- drivers-net-wireless-ath-ath11k-testmode.h:warning:no-previous-prototype-for-ath11k_tm_wmi_event
    `-- multiple-definition-of-ath11k_tm_wmi_event-drivers-net-wireless-ath-ath11k-wmi.o:drivers-net-wireless-ath-ath11k-testmode.h:first-defined-here

elapsed time: 877m

configs tested: 181
configs skipped: 9

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230517   gcc  
alpha                randconfig-r014-20230517   gcc  
alpha                randconfig-r023-20230517   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230517   gcc  
arc          buildonly-randconfig-r006-20230517   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230517   gcc  
arc                  randconfig-r013-20230517   gcc  
arc                  randconfig-r024-20230517   gcc  
arc                  randconfig-r043-20230518   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230517   clang
arm                                 defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r003-20230517   gcc  
arm                  randconfig-r005-20230517   gcc  
arm                  randconfig-r036-20230517   gcc  
arm                  randconfig-r046-20230517   clang
arm                  randconfig-r046-20230518   gcc  
arm                        spear3xx_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r011-20230517   gcc  
arm64                randconfig-r012-20230517   gcc  
arm64                randconfig-r023-20230517   gcc  
csky         buildonly-randconfig-r004-20230517   gcc  
csky         buildonly-randconfig-r005-20230517   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r002-20230517   clang
hexagon              randconfig-r041-20230517   clang
hexagon              randconfig-r045-20230517   clang
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
ia64         buildonly-randconfig-r002-20230517   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230517   gcc  
ia64                 randconfig-r022-20230517   gcc  
ia64                 randconfig-r036-20230517   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230517   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230517   gcc  
loongarch            randconfig-r013-20230517   gcc  
loongarch            randconfig-r021-20230517   gcc  
loongarch            randconfig-r023-20230517   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k         buildonly-randconfig-r005-20230517   gcc  
m68k                                defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                 randconfig-r004-20230517   gcc  
m68k                 randconfig-r034-20230517   gcc  
microblaze   buildonly-randconfig-r002-20230517   gcc  
microblaze   buildonly-randconfig-r003-20230517   gcc  
microblaze           randconfig-r003-20230517   gcc  
microblaze           randconfig-r005-20230517   gcc  
microblaze           randconfig-r012-20230517   gcc  
microblaze           randconfig-r021-20230517   gcc  
microblaze           randconfig-r031-20230517   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                           ci20_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r015-20230517   clang
mips                 randconfig-r031-20230517   gcc  
mips                 randconfig-r034-20230517   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r006-20230517   gcc  
nios2                randconfig-r025-20230517   gcc  
openrisc             randconfig-r011-20230517   gcc  
openrisc             randconfig-r012-20230517   gcc  
openrisc             randconfig-r024-20230517   gcc  
openrisc             randconfig-r025-20230517   gcc  
openrisc             randconfig-r035-20230517   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230517   gcc  
parisc               randconfig-r026-20230517   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc                      ppc64e_defconfig   clang
powerpc              randconfig-r014-20230517   gcc  
powerpc              randconfig-r016-20230517   gcc  
powerpc              randconfig-r026-20230517   gcc  
powerpc                     redwood_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv        buildonly-randconfig-r003-20230517   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r016-20230517   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230517   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230517   clang
s390                 randconfig-r011-20230517   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r004-20230517   gcc  
sh           buildonly-randconfig-r005-20230517   gcc  
sh                   randconfig-r002-20230517   gcc  
sh                   randconfig-r022-20230517   gcc  
sh                           se7705_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230517   gcc  
sparc                randconfig-r003-20230517   gcc  
sparc                randconfig-r006-20230517   gcc  
sparc                randconfig-r022-20230517   gcc  
sparc                randconfig-r024-20230517   gcc  
sparc                randconfig-r033-20230517   gcc  
sparc64              randconfig-r001-20230517   gcc  
sparc64              randconfig-r026-20230517   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
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
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-k001   clang
x86_64                        randconfig-x052   clang
x86_64                        randconfig-x054   clang
x86_64                        randconfig-x055   gcc  
x86_64                        randconfig-x056   clang
x86_64                        randconfig-x061   gcc  
x86_64                        randconfig-x062   clang
x86_64                        randconfig-x063   gcc  
x86_64                        randconfig-x064   clang
x86_64                        randconfig-x065   gcc  
x86_64                        randconfig-x066   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230517   gcc  
xtensa               randconfig-r002-20230517   gcc  
xtensa               randconfig-r006-20230517   gcc  
xtensa               randconfig-r014-20230517   gcc  
xtensa               randconfig-r032-20230517   gcc  
xtensa               randconfig-r034-20230517   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
