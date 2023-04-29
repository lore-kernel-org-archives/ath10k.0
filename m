Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6745C77B7C
	for <ath10k@archiver.kernel.org>; Sat, 29 Apr 2023 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LRkAF/vnndqU5q5T7MNROxoW31icowYop7SaWk7pFcw=; b=kDE6X5oOTYVPky
	P35W1w5Xch9GF1NUAPq4AiBOOxjv+rf8I5vyzKaUaMRvZ9bSyDbyEGd0otCaOhBILlzpFqu/LsMM0
	Gv+yGEUDttyeIPHXiMbWBHz1kDYW0AHL3+aE8YGgV5JeJ4dpJI7LE/wLySpi8w7jnuvKyrRVDTeMS
	9zT6Eog22gPfmDcagauCwxHlVbPbsCp+n2L9XvGgOn4fdXBv94/dCpJQRkBBXiye1C9nBOEtQjaeu
	9bILCJP+0htCkjLgE+rpkcqgbNPgTZza16mK+hLLDvDyjL6bhJVBDi2Ta2pLsSPBxmXIKkwcphH6P
	DcCDlWxpEXUhYWy3ra2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pspE6-00CzjL-1Y;
	Sat, 29 Apr 2023 18:23:18 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pspE3-00Czif-01
	for ath10k@lists.infradead.org;
	Sat, 29 Apr 2023 18:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682792594; x=1714328594;
  h=date:from:to:cc:subject:message-id;
  bh=mL6ZF+BtCVcTzK0c/vnzr4Ete9vyofND8nfGzADAugs=;
  b=PTO1W35RP8pwDvBLGUffAycx5pGsCjBo2ttDYbJsMvpvDUbTyBtJdJ16
   2N3aniQW0/5rtekIdr7GLtTKmrc96QUnanfuNQxRQsL8lxdMU7zjR0jXI
   5hiuYvzr9filkv6TJaAJabXvD0aO0UFneNd2cLF2tWxIzfSzTEU70O//w
   4QK8h60Tq5aQi/UwR9aeT5szgUKY8yGTkjWgoidaJs68FHu2QynfFnUla
   2KKQlXbnFSW49ZqEmZhbDW+jgKim27Fc+Ht+LxeyQv7feUTMV6b9V2W6F
   RGJQwMFCzjpj6xbm6Uojx4oRPHu//o9PPyLBgm0PhJns0XwXobanVPzuF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="375982274"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="375982274"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 11:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="725811449"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="725811449"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Apr 2023 11:23:10 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pspDx-0001IO-2x;
	Sat, 29 Apr 2023 18:23:09 +0000
Date: Sun, 30 Apr 2023 02:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 19a1e626daef3b59e091ccbec40fb95ef21f4ad5
Message-ID: <20230429182248.NjfHX%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_112315_112110_417C361D 
X-CRM114-Status: UNSURE (   5.39  )
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
branch HEAD: 19a1e626daef3b59e091ccbec40fb95ef21f4ad5  wifi: ath12k: increase vdev setup timeout

elapsed time: 723m

configs tested: 111
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230428   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r011-20230428   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230429   gcc  
arc                  randconfig-r012-20230428   gcc  
arc                  randconfig-r026-20230428   gcc  
arc                  randconfig-r031-20230428   gcc  
arc                  randconfig-r043-20230428   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230428   clang
arm                  randconfig-r022-20230429   gcc  
arm                  randconfig-r023-20230428   clang
arm                  randconfig-r046-20230428   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230428   clang
arm64                               defconfig   gcc  
arm64                randconfig-r032-20230428   clang
csky                                defconfig   gcc  
csky                 randconfig-r003-20230429   gcc  
csky                 randconfig-r036-20230428   gcc  
hexagon              randconfig-r021-20230429   clang
hexagon              randconfig-r041-20230428   clang
hexagon              randconfig-r045-20230428   clang
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
ia64                 randconfig-r006-20230428   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r024-20230428   gcc  
loongarch            randconfig-r024-20230429   gcc  
loongarch            randconfig-r034-20230428   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230428   gcc  
microblaze   buildonly-randconfig-r005-20230428   gcc  
microblaze           randconfig-r004-20230429   gcc  
microblaze           randconfig-r015-20230428   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230428   clang
mips                 randconfig-r023-20230429   gcc  
nios2        buildonly-randconfig-r001-20230428   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230429   gcc  
nios2                randconfig-r003-20230428   gcc  
nios2                randconfig-r033-20230428   gcc  
nios2                randconfig-r035-20230428   gcc  
openrisc             randconfig-r004-20230428   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230428   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r026-20230429   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230428   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230428   clang
riscv                randconfig-r005-20230429   gcc  
riscv                randconfig-r042-20230428   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r025-20230428   gcc  
s390                 randconfig-r044-20230428   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r022-20230428   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230429   gcc  
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
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
