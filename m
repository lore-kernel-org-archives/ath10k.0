Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C72DC77B60
	for <ath10k@archiver.kernel.org>; Sat, 29 Apr 2023 18:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TPo7BiDv8+vNufGjStySMvXQPwbmnRkGn7eby4gO13c=; b=2qDFTpiFlC71QG
	PKYnAb0uslvEJrsZ4f4SpSCfghtjmlZMPBI+iEaREKj0KF2PVg0eGgl64kZ1ouoHC4l/Y7nM1nti6
	V7xo7f0Hz7btda1S0/v5iEwhdwV69Qi3sEGhOZA4JPMxjKt85C22UDQ1pcaUp2T3NV326D/3zrCak
	cJqi80pVtAnqD0oOD4Y1GnNrIbQHSnlR5Gr8yXjjnjmOQhYIl3K1hfIaVSX97Nna8JDeBt7VlKGrQ
	FcACdx/llApJTOtRaFlq8OvdvWrrx+luN5KAF/ahZDfNH2V6H/OKzIRwA3TPyp+j2SbW4HJZjI04G
	obpkOA38+neAdTSa9syA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pspE6-00CzjS-39;
	Sat, 29 Apr 2023 18:23:18 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pspE3-00Czig-02
	for ath10k@lists.infradead.org;
	Sat, 29 Apr 2023 18:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682792594; x=1714328594;
  h=date:from:to:cc:subject:message-id;
  bh=PTLSmj7PAaLU4xIqoBBb6iDXYs2g/0Jxkbl85Z196aM=;
  b=PdcE+dVDymnLO9PYG05E5Yzh1x49JrrbDo9PuLblA6/738uDYFSUGzzN
   lFf7CKI6AQ7owZCn695XN3VR8JRGAY2HaTGieGif64jrHhq3Ru1a7Hbmn
   F/RVBXBcvQe8q0BU8a3tgXz5Qlf0niRiuYYxHcZ4DKNNBIyQl/qlv4eTO
   /WUKEegjLIt1kTCixO1/eDKmaeVWuTQc3S1829msVekSA9pqmuNkmL0YT
   QlW4rGm98wpMRRlxbTEDe+AWlWq0mSfdXY+MLVQC083OuBwHVUTTPqRye
   gSmrOCtcy5VxCwHTt8JU3QeX9O4XrAoUF4SaDkAX080/WuzBGWD/xIG9d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="347990932"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="347990932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 11:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="760141749"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="760141749"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2023 11:23:10 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pspDx-0001IU-39;
	Sat, 29 Apr 2023 18:23:09 +0000
Date: Sun, 30 Apr 2023 02:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 e5bdf714fa7a330e24392f83573eee675508c29d
Message-ID: <20230429182256.O20RS%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_112315_111996_0C2A52BD 
X-CRM114-Status: UNSURE (   4.14  )
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
branch HEAD: e5bdf714fa7a330e24392f83573eee675508c29d  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 110
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230428   gcc  
alpha                randconfig-r032-20230428   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230429   gcc  
arc                  randconfig-r023-20230429   gcc  
arc                  randconfig-r031-20230428   gcc  
arc                  randconfig-r033-20230428   gcc  
arc                  randconfig-r043-20230428   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r022-20230428   clang
arm                  randconfig-r046-20230428   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230428   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230428   gcc  
csky                 randconfig-r013-20230429   gcc  
csky                 randconfig-r024-20230429   gcc  
hexagon              randconfig-r012-20230429   clang
hexagon              randconfig-r014-20230429   clang
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
ia64                 randconfig-r003-20230429   gcc  
ia64                 randconfig-r004-20230428   gcc  
ia64                 randconfig-r022-20230429   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r021-20230429   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r005-20230428   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r005-20230428   gcc  
nios2                randconfig-r026-20230429   gcc  
openrisc             randconfig-r005-20230429   gcc  
openrisc             randconfig-r025-20230428   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230429   gcc  
parisc               randconfig-r023-20230428   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r015-20230429   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230429   gcc  
riscv                randconfig-r016-20230429   clang
riscv                randconfig-r034-20230428   clang
riscv                randconfig-r042-20230428   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230428   clang
s390                 randconfig-r011-20230429   clang
s390                 randconfig-r044-20230428   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r006-20230429   gcc  
sh                   randconfig-r035-20230428   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r025-20230429   gcc  
sparc64      buildonly-randconfig-r001-20230428   gcc  
sparc64      buildonly-randconfig-r003-20230428   gcc  
sparc64              randconfig-r001-20230428   gcc  
sparc64              randconfig-r036-20230428   gcc  
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
