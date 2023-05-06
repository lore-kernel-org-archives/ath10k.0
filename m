Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BFCC77B7C
	for <ath10k@archiver.kernel.org>; Sat,  6 May 2023 02:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+nMfx5P/bfQtsRniiZpJixlwNbM/hlrIn6Rtp2ZWqGs=; b=dgRSv53bPgU5bo
	VYNp6P3h5gstsxgKQbLUn1FguLLVj/u2jwlavRJX1Ia7TNdDWWxrccGok1kYLPKwrR2HdnwmOcwYy
	OROCBLo0s6WOb7IjEVUXMH8wrTm8VISlbYu9nPhG5DVVxPNImlOw95zE/NgGzeqcSZarpEuq42gdy
	fuKHCUet27hnM4TF7qeDiMiPCZz+3fU4SxvRbcGOhzKhWL7YXPFoMB4utWt4qUEJBkEjUZL3irumV
	yWrTBP/ncddujYXFAoG3l/bGnx+JuT2+toapLuIaj/NQAgZcMYdI4pFohAd+t374CFacPrgqZ0NBh
	wzajd9DQNiGKP4yWx0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv7y5-00CNiw-0K;
	Sat, 06 May 2023 02:48:17 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv7y2-00CNiH-03
	for ath10k@lists.infradead.org;
	Sat, 06 May 2023 02:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683341293; x=1714877293;
  h=date:from:to:cc:subject:message-id;
  bh=s/mdkL5bfRIgDU3Fl4vOyzbV7u7CW1vyxs3EgS9noGE=;
  b=UsNEi7+ucuQIZ1b13XnAEl+Y5qMVz9CuYhystIix2AAVUDIINgXyd2B6
   hZSdE5fBYKs4W1fkqnJIfsD4Y2aGwVeSQRAao4HPP9CHvT7EGo+NnsrB1
   VN6CCu1iynjBUuXrtr70ybHoASR5q/ogMKhxrcgAHb/Ct5mCPaZI5E+P/
   VtIIKZH0J9vF2FloAnuGey0FGHeyKoAa/dgPp+LwGBgQ1OybJQT4Wz477
   EJg1zzK6EBok/Ab85H4Xb4ZI7Qvt+ZLGyffhLwQdvOc+wfapfwqqXFW87
   aHLqX2f60pTBS3GDD3JQDnmTTkKXmmOp52sf/p0xLFjxldIBNI/xEE/Z9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349373435"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="349373435"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 19:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="697813329"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="697813329"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 May 2023 19:47:35 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv7xO-00015N-2r;
	Sat, 06 May 2023 02:47:34 +0000
Date: Sat, 06 May 2023 10:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 858793444bc68ad8e8fa73d20055aa8da8ab591b
Message-ID: <20230506024647.mASEB%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_194814_389761_9D823D81 
X-CRM114-Status: UNSURE (   5.29  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 858793444bc68ad8e8fa73d20055aa8da8ab591b  Add localversion-wireless-testing-ath

elapsed time: 796m

configs tested: 180
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230501   gcc  
alpha                randconfig-r036-20230504   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230501   gcc  
arc                  randconfig-r014-20230501   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arc                  randconfig-r043-20230502   gcc  
arc                  randconfig-r043-20230504   gcc  
arc                  randconfig-r043-20230505   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r014-20230502   clang
arm                  randconfig-r026-20230501   gcc  
arm                  randconfig-r031-20230504   gcc  
arm                  randconfig-r032-20230504   gcc  
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm                  randconfig-r046-20230502   clang
arm                  randconfig-r046-20230504   clang
arm                  randconfig-r046-20230505   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230430   gcc  
arm64                randconfig-r013-20230501   clang
arm64                randconfig-r015-20230430   clang
arm64                randconfig-r016-20230502   gcc  
arm64                randconfig-r021-20230502   gcc  
csky         buildonly-randconfig-r005-20230505   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230505   gcc  
csky                 randconfig-r003-20230501   gcc  
csky                 randconfig-r006-20230502   gcc  
csky                 randconfig-r011-20230502   gcc  
csky                 randconfig-r015-20230502   gcc  
csky                 randconfig-r034-20230501   gcc  
hexagon              randconfig-r014-20230505   clang
hexagon              randconfig-r021-20230501   clang
hexagon              randconfig-r041-20230430   clang
hexagon              randconfig-r041-20230501   clang
hexagon              randconfig-r041-20230502   clang
hexagon              randconfig-r041-20230504   clang
hexagon              randconfig-r041-20230505   clang
hexagon              randconfig-r045-20230430   clang
hexagon              randconfig-r045-20230501   clang
hexagon              randconfig-r045-20230502   clang
hexagon              randconfig-r045-20230504   clang
hexagon              randconfig-r045-20230505   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230501   clang
i386                 randconfig-a012-20230501   clang
i386                 randconfig-a013-20230501   clang
i386                 randconfig-a014-20230501   clang
i386                 randconfig-a015-20230501   clang
i386                 randconfig-a016-20230501   clang
i386                 randconfig-r024-20230501   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r022-20230502   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230505   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230501   gcc  
m68k                 randconfig-r001-20230502   gcc  
m68k                 randconfig-r012-20230430   gcc  
m68k                 randconfig-r036-20230430   gcc  
microblaze           randconfig-r012-20230501   gcc  
microblaze           randconfig-r033-20230504   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230505   clang
mips                 randconfig-r006-20230501   clang
mips                 randconfig-r012-20230505   gcc  
mips                 randconfig-r016-20230501   gcc  
mips                 randconfig-r033-20230430   clang
nios2        buildonly-randconfig-r002-20230505   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230505   gcc  
nios2                randconfig-r021-20230505   gcc  
nios2                randconfig-r035-20230430   gcc  
openrisc             randconfig-r004-20230502   gcc  
openrisc             randconfig-r032-20230430   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230430   gcc  
parisc               randconfig-r003-20230502   gcc  
parisc               randconfig-r023-20230501   gcc  
parisc               randconfig-r031-20230430   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230505   gcc  
powerpc              randconfig-r034-20230430   gcc  
powerpc              randconfig-r035-20230501   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230430   gcc  
riscv                randconfig-r002-20230502   clang
riscv                randconfig-r003-20230505   gcc  
riscv                randconfig-r004-20230430   gcc  
riscv                randconfig-r014-20230430   clang
riscv                randconfig-r021-20230430   clang
riscv                randconfig-r023-20230430   clang
riscv                randconfig-r026-20230430   clang
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                randconfig-r042-20230502   gcc  
riscv                randconfig-r042-20230504   gcc  
riscv                randconfig-r042-20230505   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230505   clang
s390                 randconfig-r026-20230505   clang
s390                 randconfig-r031-20230501   gcc  
s390                 randconfig-r032-20230501   gcc  
s390                 randconfig-r034-20230504   clang
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
s390                 randconfig-r044-20230502   gcc  
s390                 randconfig-r044-20230504   gcc  
s390                 randconfig-r044-20230505   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r005-20230502   gcc  
sh                   randconfig-r012-20230502   gcc  
sh                   randconfig-r016-20230505   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230430   gcc  
sparc                randconfig-r033-20230501   gcc  
sparc64              randconfig-r001-20230430   gcc  
sparc64              randconfig-r002-20230501   gcc  
sparc64              randconfig-r011-20230501   gcc  
sparc64              randconfig-r013-20230505   gcc  
sparc64              randconfig-r025-20230430   gcc  
sparc64              randconfig-r025-20230501   gcc  
sparc64              randconfig-r035-20230504   gcc  
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
x86_64               randconfig-r005-20230501   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230505   gcc  
xtensa               randconfig-r011-20230430   gcc  
xtensa               randconfig-r011-20230505   gcc  
xtensa               randconfig-r015-20230501   gcc  
xtensa               randconfig-r022-20230430   gcc  
xtensa               randconfig-r023-20230502   gcc  
xtensa               randconfig-r023-20230505   gcc  
xtensa               randconfig-r026-20230502   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
