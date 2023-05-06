Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB7AC77B7D
	for <ath10k@archiver.kernel.org>; Sat,  6 May 2023 02:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rmLPWvS62+/NdAHnSKhnFPNKy9EEuAm/M89cN54dquA=; b=aMhoaFykVlPldv
	1TRdd/Nq25vKb1+zz1r1QPR92RJjZLE92IALHij2/JX+ZnPlATVLeP11jtUO9GeiZIQnV8FU/xq2t
	eOMZhAgtiVR+KgCLyuNiFsx/DeBdAVDllwS89HE0j/7poWd+4SusBHLi61jJZ3elMNIa4VEVs3h7y
	PC6ltaMBh7A+e6LgTg22/fM3EF4r8+iQHXp1TBfDPjxnGThzEh0PW2XywnKuPHuwVI5n8vIW1sFPN
	+cIimECS5cqDbzUyenzb31WbZyFDe86gv5mBmKJiKmCkVEbh26lbUYP5jtsyyAdDZxv5ubMxzH6ww
	WswI5+Ks5cnKXJ1j1HXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv7i2-00CMPc-3A;
	Sat, 06 May 2023 02:31:42 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv7hz-00CMOx-1z
	for ath10k@lists.infradead.org;
	Sat, 06 May 2023 02:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683340299; x=1714876299;
  h=date:from:to:cc:subject:message-id;
  bh=FqTVrwTeeRhycOwtCvbFhkjovp1Nzdp7rgRBlLmnmXY=;
  b=FZsKWU3cyfBY+b6AhBybVbnwLTa/q8spqCnY4ZQ1Acqm0sbZHOqdWL+E
   GoWVHgorHtylfoMP59nJhMb8Ur4lGBB0cpzipU/A+s4Ss88LQDdaUvvai
   7vtwvQs6DRQZnZVECKcnokKtYnMKwrxFNLcw14hXNC/PIKubOSQNA1Z1g
   +KYTe8NDFFHl9sz27RelLA8LXrjgVPDRkVuTGF0DNMs1OFXYHL0HURitT
   NlpyrccoRycEK4KUhDCk4xUw5cgyDBfVfLva5uxXAKNEvzS2oDQPz/wqp
   anCY1l5B+4RNpUuYLI+KBf5JidN2k63oVyESUOE022THg2vxj38OmGsrF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="352388305"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="352388305"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 19:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="762681650"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="762681650"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 May 2023 19:31:35 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv7hu-00014b-1T;
	Sat, 06 May 2023 02:31:34 +0000
Date: Sat, 06 May 2023 10:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 91dce40914337bc47ac95e00f2b055169ee53697
Message-ID: <20230506023134.yXXSG%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_193139_704700_966E7A41 
X-CRM114-Status: UNSURE (   3.80  )
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
branch HEAD: 91dce40914337bc47ac95e00f2b055169ee53697  wifi: ath11k: Use list_count_nodes()

elapsed time: 783m

configs tested: 190
configs skipped: 24

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230505   gcc  
alpha        buildonly-randconfig-r006-20230502   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230501   gcc  
alpha                randconfig-r003-20230505   gcc  
alpha                randconfig-r011-20230430   gcc  
alpha                randconfig-r021-20230430   gcc  
alpha                randconfig-r024-20230505   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230501   gcc  
arc          buildonly-randconfig-r006-20230430   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230502   gcc  
arc                  randconfig-r022-20230505   gcc  
arc                  randconfig-r023-20230430   gcc  
arc                  randconfig-r023-20230501   gcc  
arc                  randconfig-r025-20230502   gcc  
arc                  randconfig-r033-20230505   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arc                  randconfig-r043-20230504   gcc  
arc                  randconfig-r043-20230505   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230430   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230430   clang
arm                  randconfig-r002-20230501   clang
arm                  randconfig-r013-20230502   clang
arm                  randconfig-r016-20230430   gcc  
arm                  randconfig-r026-20230501   gcc  
arm                  randconfig-r032-20230505   clang
arm                  randconfig-r033-20230430   clang
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm                  randconfig-r046-20230504   clang
arm                  randconfig-r046-20230505   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230505   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230501   gcc  
arm64                randconfig-r022-20230502   gcc  
csky         buildonly-randconfig-r005-20230501   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230502   gcc  
csky                 randconfig-r022-20230430   gcc  
csky                 randconfig-r031-20230501   gcc  
hexagon      buildonly-randconfig-r001-20230505   clang
hexagon      buildonly-randconfig-r003-20230502   clang
hexagon              randconfig-r001-20230430   clang
hexagon              randconfig-r005-20230502   clang
hexagon              randconfig-r006-20230501   clang
hexagon              randconfig-r025-20230430   clang
hexagon              randconfig-r025-20230501   clang
hexagon              randconfig-r041-20230430   clang
hexagon              randconfig-r041-20230501   clang
hexagon              randconfig-r041-20230504   clang
hexagon              randconfig-r041-20230505   clang
hexagon              randconfig-r045-20230430   clang
hexagon              randconfig-r045-20230501   clang
hexagon              randconfig-r045-20230504   clang
hexagon              randconfig-r045-20230505   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230501   gcc  
i386                 randconfig-a002-20230501   gcc  
i386                 randconfig-a003-20230501   gcc  
i386                 randconfig-a004-20230501   gcc  
i386                 randconfig-a005-20230501   gcc  
i386                 randconfig-a006-20230501   gcc  
i386                 randconfig-a011-20230501   clang
i386                 randconfig-a012-20230501   clang
i386                 randconfig-a013-20230501   clang
i386                 randconfig-a014-20230501   clang
i386                 randconfig-a015-20230501   clang
i386                 randconfig-a016-20230501   clang
i386                 randconfig-r024-20230501   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r014-20230430   gcc  
ia64                 randconfig-r036-20230505   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r026-20230502   gcc  
loongarch            randconfig-r031-20230430   gcc  
loongarch            randconfig-r033-20230501   gcc  
loongarch            randconfig-r035-20230430   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230430   gcc  
m68k                 randconfig-r013-20230430   gcc  
m68k                 randconfig-r035-20230501   gcc  
microblaze           randconfig-r013-20230501   gcc  
microblaze           randconfig-r016-20230502   gcc  
microblaze           randconfig-r016-20230504   gcc  
microblaze           randconfig-r023-20230502   gcc  
microblaze           randconfig-r034-20230430   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230502   gcc  
mips                 randconfig-r004-20230502   gcc  
mips                 randconfig-r015-20230504   clang
mips                 randconfig-r035-20230502   gcc  
nios2        buildonly-randconfig-r002-20230502   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r006-20230505   gcc  
nios2                randconfig-r015-20230430   gcc  
nios2                randconfig-r016-20230501   gcc  
nios2                randconfig-r036-20230502   gcc  
openrisc     buildonly-randconfig-r004-20230430   gcc  
openrisc     buildonly-randconfig-r006-20230505   gcc  
openrisc             randconfig-r021-20230502   gcc  
openrisc             randconfig-r024-20230430   gcc  
openrisc             randconfig-r035-20230505   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230502   gcc  
parisc               randconfig-r005-20230430   gcc  
parisc               randconfig-r021-20230505   gcc  
parisc               randconfig-r034-20230505   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r012-20230501   clang
powerpc              randconfig-r014-20230504   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230504   gcc  
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                randconfig-r042-20230504   gcc  
riscv                randconfig-r042-20230505   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r001-20230501   clang
s390         buildonly-randconfig-r004-20230502   gcc  
s390         buildonly-randconfig-r005-20230502   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230502   gcc  
s390                 randconfig-r026-20230505   clang
s390                 randconfig-r033-20230502   clang
s390                 randconfig-r036-20230501   gcc  
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
s390                 randconfig-r044-20230504   gcc  
s390                 randconfig-r044-20230505   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230505   gcc  
sh                   randconfig-r004-20230430   gcc  
sh                   randconfig-r005-20230505   gcc  
sh                   randconfig-r011-20230502   gcc  
sh                   randconfig-r022-20230501   gcc  
sh                   randconfig-r023-20230505   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230430   gcc  
sparc                randconfig-r003-20230502   gcc  
sparc                randconfig-r021-20230501   gcc  
sparc                randconfig-r026-20230430   gcc  
sparc                randconfig-r031-20230502   gcc  
sparc                randconfig-r034-20230502   gcc  
sparc64      buildonly-randconfig-r003-20230430   gcc  
sparc64              randconfig-r005-20230501   gcc  
sparc64              randconfig-r024-20230502   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230501   gcc  
x86_64               randconfig-a002-20230501   gcc  
x86_64               randconfig-a003-20230501   gcc  
x86_64               randconfig-a004-20230501   gcc  
x86_64               randconfig-a005-20230501   gcc  
x86_64               randconfig-a006-20230501   gcc  
x86_64               randconfig-a011-20230501   clang
x86_64               randconfig-a012-20230501   clang
x86_64               randconfig-a013-20230501   clang
x86_64               randconfig-a014-20230501   clang
x86_64               randconfig-a015-20230501   clang
x86_64               randconfig-a016-20230501   clang
x86_64               randconfig-r034-20230501   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230430   gcc  
xtensa               randconfig-r012-20230504   gcc  
xtensa               randconfig-r032-20230501   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
