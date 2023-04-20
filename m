Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D1FC77B73
	for <ath10k@archiver.kernel.org>; Thu, 20 Apr 2023 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pThcqcnO2M/EKySkXf6YvL5ji7p1HtxIWGmzKiTT8yI=; b=G0wpETbK69xnkM
	POT/xs+1+0eN9XgA7pIzLSfJuxXctSoD47fSPNeNMcDhxzVWNBCQfMyD1U5T2Tm+mren/1fK4mt82
	12Ls6h8S+UH6GYO6PNG9aCShorYEqzP+FCd6/ZGS74oxbZP/e8kB/IDwQUvaL1T1by32Z89vh9z9p
	o4qO85fdmcLiG7mPLdDrQs6+RSWOMTxbflQLGzBz5iVm/yXQYRA/qIX7M32CkUwb4FoYNKRL0m4Z0
	a3BNnqXlwUqOTYzjRigpiApDSqPiZMYlopAGbC79c1//VcC7I9K+JF/t2o5fwRoEWYY11G0KV81jl
	vUAlbUuz243vRYc2xNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppUs5-008G7r-0H;
	Thu, 20 Apr 2023 14:02:49 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppUs2-008G7A-1Z
	for ath10k@lists.infradead.org;
	Thu, 20 Apr 2023 14:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681999366; x=1713535366;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OO48JOu9nj5VcrXFxJQQuGjPsU6dK275cFB4jBIRbeg=;
  b=mIZsRh1VR4kk83kAWiidrPxd/j4eYksv61ArUbPbnVBHkZOmJ/rwSgDK
   xYRfoZswBwMEwBq5d9ZXn2JkrgtGWV5rzTgpODetql0OxmtqaC+M90G1Y
   edwSStaFbJSyOUnJ/GqR13uBnJLVGefdli/FhFTnKnbBxFWrYTJQvpfX1
   sZ5kPdioh8yQCxuxoVpNWOt5Tq/ngzqGHQRw2Y2gnTezLdUdNiFZcLZPM
   cm8l0p4J8RGJ64YrrqwYqfDqkxS8dDMCLwEgNZQWXgnN8MAp1BYkPl/hg
   XuJVbWuWlf4CW8k/a3lVbBz0ofwoDtmD6T/ZBYS1lJdGa4efggh/OQBS5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325345687"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="325345687"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 07:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="866267794"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="866267794"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Apr 2023 07:02:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppUry-000fry-0P;
	Thu, 20 Apr 2023 14:02:42 +0000
Date: Thu, 20 Apr 2023 22:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 db4269116443ea4133c76fe6ab74146d623edef2
Message-ID: <644145c7.GFfEEPNZpRHZ1E8/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_070246_621895_5BEB2234 
X-CRM114-Status: UNSURE (   4.29  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: db4269116443ea4133c76fe6ab74146d623edef2  wifi: ath11k: support reading radio MAC from DT

elapsed time: 1348m

configs tested: 148
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230417   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r016-20230420   gcc  
alpha                randconfig-r033-20230416   gcc  
alpha                randconfig-r033-20230420   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230416   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230417   gcc  
arc                  randconfig-r014-20230420   gcc  
arc                  randconfig-r032-20230416   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230417   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230416   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230418   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230417   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230417   gcc  
arm64                randconfig-r022-20230416   gcc  
arm64                randconfig-r036-20230417   gcc  
csky         buildonly-randconfig-r004-20230417   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r024-20230416   gcc  
csky                 randconfig-r032-20230420   gcc  
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r041-20230418   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
hexagon              randconfig-r045-20230418   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r002-20230417   gcc  
ia64         buildonly-randconfig-r005-20230416   gcc  
ia64                                defconfig   gcc  
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230418   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r031-20230420   gcc  
loongarch            randconfig-r034-20230420   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230418   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230416   gcc  
m68k                 randconfig-r013-20230420   gcc  
m68k                 randconfig-r024-20230417   gcc  
m68k                 randconfig-r026-20230417   gcc  
m68k                 randconfig-r034-20230417   gcc  
microblaze   buildonly-randconfig-r003-20230416   gcc  
microblaze   buildonly-randconfig-r003-20230418   gcc  
microblaze           randconfig-r004-20230418   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r025-20230417   gcc  
mips                 randconfig-r031-20230418   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230416   gcc  
nios2                randconfig-r003-20230418   gcc  
nios2                randconfig-r011-20230420   gcc  
nios2                randconfig-r012-20230420   gcc  
openrisc     buildonly-randconfig-r006-20230417   gcc  
openrisc             randconfig-r005-20230418   gcc  
openrisc             randconfig-r035-20230420   gcc  
parisc       buildonly-randconfig-r004-20230416   gcc  
parisc       buildonly-randconfig-r004-20230417   gcc  
parisc       buildonly-randconfig-r005-20230416   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230417   gcc  
parisc               randconfig-r031-20230417   gcc  
parisc               randconfig-r032-20230418   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc              randconfig-r026-20230416   gcc  
powerpc              randconfig-r033-20230417   gcc  
powerpc                    sam440ep_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230416   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r003-20230416   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r016-20230419   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc        buildonly-randconfig-r001-20230416   gcc  
sparc        buildonly-randconfig-r002-20230418   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230417   gcc  
sparc64      buildonly-randconfig-r002-20230416   gcc  
sparc64              randconfig-r003-20230416   gcc  
sparc64              randconfig-r021-20230416   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230418   gcc  
xtensa       buildonly-randconfig-r002-20230416   gcc  
xtensa                          iss_defconfig   gcc  
xtensa               randconfig-r035-20230417   gcc  
xtensa               randconfig-r035-20230418   gcc  
xtensa               randconfig-r036-20230420   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
