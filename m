Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CB7C77B75
	for <ath10k@archiver.kernel.org>; Fri, 12 May 2023 21:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JG6F0t6NS1K6/cwNbOiaY18ta4HLgsVFsDF2vCifnNg=; b=0TzxfEbz3c9ApJ
	8nzsc7/3c3Y/6jpSreQMoE/DrQu2ULbejoLuoyh0uMwLcpCycUSs00AKs9hclQSX1hs8uRFZs3mE9
	SvOXvWvM0H+vj+5UhwLM8Q8LGT7xpLq2lEbIUk7F+VHGTfhG/KRn1AYeM4NWoDqrxdKWDNmdlt+85
	MlyqV50UGVF6yAFAbi3oLQLGz+irfxoFOPMgVHRHWWjUxcTs9FcnLQf623/u4u07Z/ThIyvEbX4TE
	ruqUEZgqxWtVh1WwGx5iOnCqzzKm4zOItwAoCNju3Tw5gAmIE+dt7FHBMMCm5sfDGxg+FYgMqM9Lz
	hUxqLQuE8Fut/mpqKkPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaDF-00D44b-1l;
	Fri, 12 May 2023 21:22:05 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxaDB-00D43L-2s
	for ath10k@lists.infradead.org;
	Fri, 12 May 2023 21:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683926521; x=1715462521;
  h=date:from:to:cc:subject:message-id;
  bh=a7B3xBRdyDq3HDgScqQjtlhPUfqtf4RAN4ruo8nB9OE=;
  b=YPH/yxkSEbhvrrLXWGdyzTKTpHpm3munspWAFTZn2irijdWyo0ZO8v43
   hvTxkbf5wduSZqkU989O0/A1FhA/VTPn4JJDoqd4ioeMi6vIPOfBIH0l0
   3JCqQ3Et/DKubjH3sMNXPfweDwni2TQSNMY5S7g7aAYkJgNiHRgplpVkf
   KGr8j7q/SBvwWHrHuD1alH0o9IQrUaAzplXbLPwWp9lEpmV0LJ3Z/Ppm+
   uO/X7HV0AEYM2ngrb7mh1KKRU/YW4ygk9Yijta4NeRm9mAgJDmAF8jHyv
   4dX1R0U5Q8x3wE7X2U/A/wwPrE1VSGUHZ/Sp9ZajqQXgdqGuOQDtauGam
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414266086"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414266086"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 14:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="789964966"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="789964966"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 May 2023 14:21:57 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxaD6-00057M-1u;
	Fri, 12 May 2023 21:21:56 +0000
Date: Sat, 13 May 2023 05:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 07aeb62bbd46a85f49df24dec569fd30d6616a6d
Message-ID: <20230512212144.SC46t%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_142201_985956_4AF387F8 
X-CRM114-Status: UNSURE (   4.82  )
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
branch HEAD: 07aeb62bbd46a85f49df24dec569fd30d6616a6d  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 174
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230509   gcc  
alpha                randconfig-r016-20230509   gcc  
alpha                randconfig-r035-20230512   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230509   gcc  
arc                  randconfig-r023-20230509   gcc  
arc                  randconfig-r024-20230512   gcc  
arc                  randconfig-r025-20230509   gcc  
arc                  randconfig-r043-20230509   gcc  
arc                  randconfig-r043-20230511   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r001-20230512   gcc  
arm                                 defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                  randconfig-r013-20230512   gcc  
arm                  randconfig-r016-20230509   gcc  
arm                  randconfig-r046-20230509   gcc  
arm                  randconfig-r046-20230511   clang
arm                        spear6xx_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230509   clang
arm64                randconfig-r014-20230509   clang
arm64                randconfig-r035-20230509   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230509   gcc  
csky                 randconfig-r011-20230509   gcc  
csky                 randconfig-r034-20230511   gcc  
hexagon              randconfig-r004-20230509   clang
hexagon              randconfig-r023-20230512   clang
hexagon              randconfig-r024-20230509   clang
hexagon              randconfig-r026-20230511   clang
hexagon              randconfig-r032-20230511   clang
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
ia64                 randconfig-r011-20230512   gcc  
ia64                 randconfig-r026-20230509   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230512   gcc  
loongarch    buildonly-randconfig-r005-20230512   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230509   gcc  
loongarch            randconfig-r021-20230509   gcc  
loongarch            randconfig-r025-20230512   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r012-20230509   gcc  
m68k                 randconfig-r013-20230509   gcc  
m68k                 randconfig-r031-20230509   gcc  
microblaze           randconfig-r004-20230509   gcc  
microblaze           randconfig-r013-20230509   gcc  
microblaze           randconfig-r034-20230509   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r015-20230509   gcc  
mips                 randconfig-r022-20230509   gcc  
mips                 randconfig-r024-20230511   clang
mips                 randconfig-r036-20230512   clang
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230511   gcc  
nios2                randconfig-r031-20230512   gcc  
nios2                randconfig-r035-20230511   gcc  
nios2                randconfig-r036-20230509   gcc  
openrisc             randconfig-r002-20230511   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230509   gcc  
parisc               randconfig-r003-20230509   gcc  
parisc               randconfig-r003-20230511   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230512   clang
powerpc      buildonly-randconfig-r004-20230512   clang
powerpc                        icon_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc              randconfig-r003-20230511   clang
powerpc              randconfig-r014-20230511   gcc  
powerpc              randconfig-r024-20230509   clang
powerpc              randconfig-r026-20230512   clang
powerpc              randconfig-r033-20230511   clang
powerpc              randconfig-r033-20230512   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r021-20230509   clang
riscv                randconfig-r036-20230511   clang
riscv                randconfig-r042-20230509   clang
riscv                randconfig-r042-20230511   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r013-20230511   gcc  
s390                 randconfig-r015-20230512   clang
s390                 randconfig-r016-20230512   clang
s390                 randconfig-r021-20230511   gcc  
s390                 randconfig-r031-20230511   clang
s390                 randconfig-r044-20230509   clang
s390                 randconfig-r044-20230511   gcc  
sh                               allmodconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                   randconfig-r014-20230509   gcc  
sh                   randconfig-r015-20230509   gcc  
sh                   randconfig-r015-20230511   gcc  
sh                   randconfig-r032-20230509   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc        buildonly-randconfig-r006-20230512   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230511   gcc  
sparc                randconfig-r006-20230511   gcc  
sparc                randconfig-r011-20230511   gcc  
sparc                randconfig-r012-20230511   gcc  
sparc                randconfig-r022-20230512   gcc  
sparc                randconfig-r036-20230511   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r031-20230511   gcc  
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
xtensa               randconfig-r001-20230511   gcc  
xtensa               randconfig-r022-20230511   gcc  
xtensa               randconfig-r033-20230509   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
