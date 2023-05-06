Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C30C77B75
	for <ath10k@archiver.kernel.org>; Sat,  6 May 2023 03:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q6Bv8fysPBAa/jVay47O+/MsWchfsXghSDf8jcdWQZ0=; b=hyw9mHcjq0bwGw
	6TBTTy5dk/Y/KSYii/jTlt+BctXttqU1vLXvpB/HsbOaofh713/LtmqiKjCa86hilOrerWG2f8woM
	wm6JhQ0dXODRyaM3cNf3Ks1pnXYBJBbQOL20vtOrZ13V7RE5s4kKv/U+9xhfks82UU7mTeW675cB+
	g2OcRliso5rIm6Y8j9s7HGb6o9E5ZBda363xki8IFfEDuQzreHn0+D1vDo0hRyT0u/PifCc8/dVVH
	nFHZsmTNrIfysFK4iNJpkOyVlcXQiLBDg0yVv6DwWv4OXdmMy1hPUMfjYDbM81CcbZ6ibrMj4ZtH5
	m0pq2h89ZFBajDWENjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv8C3-00CPNl-0v;
	Sat, 06 May 2023 03:02:43 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv8Bz-00CPN6-1W
	for ath10k@lists.infradead.org;
	Sat, 06 May 2023 03:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683342159; x=1714878159;
  h=date:from:to:cc:subject:message-id;
  bh=e39+Brfk4WtbfE/ATziMFgBe27aG2UneDhgBF8shgX8=;
  b=COXgN6pkZMunhWQyGxqcTjUWITc3okuEP5CWCYDty+Qm5zjroN7s4QNM
   yiP6r8ld7oFU8HqgF2sL2KRkZTfBQN6Q0Q7J/b/rW24aydyU2IMHa6JS4
   AZI3OjxiWoGL8Zo06rUECvkts6ZJoMy49lCBzddz8mEpLcWs1/Yxe7D+d
   Uza/nMNmDtSTgD79/OGixyeQDcYCxT50knm3x3ETvul41EwzEma9i+ymN
   +CGrXOF2fR1ReF2uDGuCm2e+ZHl14RT03kJ1tsIbMz4YHRfcc8JUsBVKo
   tDpm3cBgWtVjcM5JrFEzjwCBxW2hY1Sk1wKdCHbWcIAW6jxjHWHlMk43C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414884986"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="414884986"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 20:02:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="787386802"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="787386802"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 May 2023 20:02:36 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv8Bv-000163-0v;
	Sat, 06 May 2023 03:02:35 +0000
Date: Sat, 06 May 2023 11:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 eeb5a8c10cf569c86e56cdf92967d3b1b69296a4
Message-ID: <20230506030212.65Pl2%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_200239_588314_B5F5E74C 
X-CRM114-Status: UNSURE (   4.54  )
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
branch HEAD: eeb5a8c10cf569c86e56cdf92967d3b1b69296a4  Merge branch 'ath-next' into ath-qca

elapsed time: 812m

configs tested: 188
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230502   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230505   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230502   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r003-20230502   gcc  
arc                  randconfig-r036-20230504   gcc  
arc                  randconfig-r043-20230430   gcc  
arc                  randconfig-r043-20230501   gcc  
arc                  randconfig-r043-20230502   gcc  
arc                  randconfig-r043-20230504   gcc  
arc                  randconfig-r043-20230505   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230501   gcc  
arm                  randconfig-r024-20230505   gcc  
arm                  randconfig-r025-20230430   gcc  
arm                  randconfig-r046-20230430   gcc  
arm                  randconfig-r046-20230501   gcc  
arm                  randconfig-r046-20230502   clang
arm                  randconfig-r046-20230504   clang
arm                  randconfig-r046-20230505   gcc  
arm                           stm32_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230505   gcc  
arm64                randconfig-r011-20230505   clang
arm64                randconfig-r014-20230430   clang
arm64                randconfig-r024-20230430   clang
csky         buildonly-randconfig-r001-20230505   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230430   gcc  
csky                 randconfig-r013-20230504   gcc  
csky                 randconfig-r013-20230505   gcc  
csky                 randconfig-r021-20230505   gcc  
csky                 randconfig-r032-20230504   gcc  
csky                 randconfig-r033-20230505   gcc  
hexagon              randconfig-r013-20230502   clang
hexagon              randconfig-r026-20230430   clang
hexagon              randconfig-r031-20230505   clang
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
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r011-20230504   gcc  
ia64                 randconfig-r016-20230504   gcc  
ia64                 randconfig-r022-20230501   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230505   gcc  
loongarch            randconfig-r036-20230502   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                 randconfig-r006-20230502   gcc  
m68k                 randconfig-r012-20230502   gcc  
m68k                 randconfig-r012-20230505   gcc  
m68k                 randconfig-r022-20230505   gcc  
m68k                 randconfig-r026-20230505   gcc  
microblaze   buildonly-randconfig-r003-20230505   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r015-20230505   gcc  
microblaze           randconfig-r016-20230502   gcc  
microblaze           randconfig-r025-20230505   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                           ip22_defconfig   clang
mips                 randconfig-r012-20230501   gcc  
mips                 randconfig-r013-20230501   gcc  
mips                 randconfig-r024-20230501   gcc  
mips                          rm200_defconfig   clang
mips                         rt305x_defconfig   gcc  
mips                   sb1250_swarm_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230504   gcc  
nios2                randconfig-r034-20230502   gcc  
nios2                randconfig-r034-20230505   gcc  
nios2                randconfig-r035-20230502   gcc  
nios2                randconfig-r035-20230505   gcc  
openrisc             randconfig-r006-20230505   gcc  
openrisc             randconfig-r022-20230430   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230502   gcc  
parisc               randconfig-r021-20230430   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                      ppc64e_defconfig   clang
powerpc              randconfig-r012-20230430   clang
powerpc                      tqm8xx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230505   clang
riscv                               defconfig   gcc  
riscv                randconfig-r002-20230502   clang
riscv                randconfig-r004-20230502   clang
riscv                randconfig-r014-20230501   clang
riscv                randconfig-r015-20230501   clang
riscv                randconfig-r021-20230501   clang
riscv                randconfig-r025-20230501   clang
riscv                randconfig-r031-20230502   clang
riscv                randconfig-r032-20230505   gcc  
riscv                randconfig-r033-20230504   clang
riscv                randconfig-r042-20230430   clang
riscv                randconfig-r042-20230501   clang
riscv                randconfig-r042-20230502   gcc  
riscv                randconfig-r042-20230504   gcc  
riscv                randconfig-r042-20230505   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230502   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r032-20230502   clang
s390                 randconfig-r044-20230430   clang
s390                 randconfig-r044-20230501   clang
s390                 randconfig-r044-20230502   gcc  
s390                 randconfig-r044-20230504   gcc  
s390                 randconfig-r044-20230505   clang
sh                               allmodconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r003-20230505   gcc  
sh                   randconfig-r023-20230430   gcc  
sh                          rsk7269_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230505   gcc  
sparc                randconfig-r015-20230502   gcc  
sparc                randconfig-r023-20230501   gcc  
sparc                randconfig-r035-20230504   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r005-20230502   gcc  
sparc64              randconfig-r016-20230505   gcc  
sparc64              randconfig-r031-20230504   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
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
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64               randconfig-r016-20230501   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r014-20230505   gcc  
xtensa               randconfig-r033-20230502   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
