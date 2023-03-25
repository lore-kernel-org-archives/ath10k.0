Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190EEC76195
	for <ath10k@archiver.kernel.org>; Sat, 25 Mar 2023 03:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2j/p4Ax9blbKHkssMxiB25RkDZtDlhsRJXizD39JolE=; b=d+OdegsmFTc9dN
	HZIWfaZ/UBhGT6Bts12bbo/86XqZMTILH0nqecCmFQZf4G05PAZSTdGUoKcK6ZmO6gdXIWcrSd67p
	673L7M6VT+Nw1WpRS+PGjUxvMAkknEBA71xQCtJjVQyQ8CUuVYypk4bKARmnk+/w0quBzUVM3rRxn
	SbFOLSMG7RxAejI6WLCA0ChkLFpmLjwp4Hf9UgDX/GEhyfJVeH4zLt/fx6SAq9MNkK/Fnz0ITRQT7
	Pw8OD2giZzw3f2E4MefrW9p6ZaHiC9/z/KgrlKFQXokI6W44GecPWeGFuM7GopLlTGGF/oejH21AF
	WaPlE3dBk2l33H0QnTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfuB9-0061A2-0V;
	Sat, 25 Mar 2023 03:02:51 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfuB6-006196-1l
	for ath10k@lists.infradead.org;
	Sat, 25 Mar 2023 03:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679713368; x=1711249368;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oQfPm8XDhcEkc54/5JloPIOCIhZbWVZeEDPTN1p+tUc=;
  b=W6eALquYU3CFDubQvL0wlD9o/RcNOu5vbanfO8P8GoKgkv3xqWeYCEig
   a5+0vexEMwDyZ4kOJ1c93D8f0lDsyt1XSUA3t1Ra385ACYL7RDkZcnTGn
   k9eJzfqeOVSSmxkoyUT8tMe4DwfixxlZyuvyH3PDbMYnVMCpNBzg29uvx
   FtUjC/m7aQDvswKCZzWfnat6chbLSNMcikVUGA/NyIqkJEK+bn51hTu8H
   tPBQCqF0MU2v6kF9j3UGDdTFfj0j7yot9fQKZH7uAfnaRTirryr9nDq8J
   ZAodWE2EyOLc0KIM9J7hPgOJj/ngJZf4PDexOP1Fk4NCPCGX3bTpZ953p
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="338651618"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="338651618"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 20:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="676381892"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="676381892"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2023 20:02:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfuB2-000Ftj-12;
	Sat, 25 Mar 2023 03:02:44 +0000
Date: Sat, 25 Mar 2023 11:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 1be3640cbb4a52ac9a2653ff20d68f983366092c
Message-ID: <641e643c.EUEJX0wZaCzOQ0I4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_200248_594950_25F77C9D 
X-CRM114-Status: UNSURE (   4.69  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 1be3640cbb4a52ac9a2653ff20d68f983366092c  wifi: carl9170: Replace fake flex-array with flexible-array member

elapsed time: 721m

configs tested: 131
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230322   gcc  
alpha                randconfig-r035-20230322   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r023-20230322   gcc  
arc                  randconfig-r024-20230322   gcc  
arc                  randconfig-r025-20230324   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          moxart_defconfig   clang
arm                  randconfig-r032-20230322   gcc  
arm                  randconfig-r046-20230322   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230322   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r012-20230322   gcc  
hexagon                          alldefconfig   clang
hexagon              randconfig-r031-20230322   clang
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
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
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230322   gcc  
ia64                 randconfig-r005-20230322   gcc  
ia64                 randconfig-r013-20230322   gcc  
ia64                 randconfig-r022-20230324   gcc  
ia64                 randconfig-r034-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r032-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r026-20230322   gcc  
m68k                 randconfig-r034-20230322   gcc  
microblaze           randconfig-r021-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                 randconfig-r026-20230324   clang
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230322   gcc  
nios2                randconfig-r033-20230322   gcc  
openrisc             randconfig-r012-20230322   gcc  
openrisc             randconfig-r016-20230322   gcc  
parisc       buildonly-randconfig-r003-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r024-20230322   gcc  
parisc               randconfig-r025-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230322   gcc  
powerpc      buildonly-randconfig-r005-20230322   gcc  
powerpc                        fsp2_defconfig   clang
powerpc              randconfig-r001-20230322   clang
powerpc              randconfig-r035-20230322   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230322   clang
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230322   clang
s390                 randconfig-r011-20230322   gcc  
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230322   gcc  
sh                            migor_defconfig   gcc  
sh                   randconfig-r014-20230322   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc        buildonly-randconfig-r004-20230322   gcc  
sparc        buildonly-randconfig-r005-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230322   gcc  
sparc64      buildonly-randconfig-r001-20230322   gcc  
sparc64      buildonly-randconfig-r006-20230322   gcc  
sparc64              randconfig-r002-20230322   gcc  
sparc64              randconfig-r022-20230322   gcc  
sparc64              randconfig-r024-20230324   gcc  
sparc64              randconfig-r036-20230322   gcc  
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
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa               randconfig-r033-20230322   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
