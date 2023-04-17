Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF71FC77B72
	for <ath10k@archiver.kernel.org>; Mon, 17 Apr 2023 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qA2coQ07GrWs7elNhSgcrkxu324GQR8zpea0xpoTFSM=; b=vwvp4/PPr/k+tP
	GNzFoDdxebUI/AhhNcgo7NbqlOftn35gFcaqrFm/cEMH6dUCRxTK/h4ez6NU/FrDtPkHwZ3N6KCqM
	whBYIe9Vh/iprkW0NcMjz9qnDj5W5itVeV5ql2+a2Y1WzVdLGl9bqwoJ6qFjTq8ziF7HiOjARVVW5
	1N5ZYhD8yyFvwQdH2kM2BzvGJHBj846yIBIqk/KsgDE1hyX7oQ5UPuZr+7NcsRFIz6JfwZdbofepz
	ss+fsJLrqLL11SgWhmxuNyp3VPdSmJafL1g6hBlnYuikQqXn2OTEMhJ7vRXEUboo7WdpT3sv5h7MO
	Myrl4ZZ2hm0oaDnkYrrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poY24-000N2i-0f;
	Mon, 17 Apr 2023 23:13:12 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poY21-000N2J-11
	for ath10k@lists.infradead.org;
	Mon, 17 Apr 2023 23:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681773189; x=1713309189;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z81Ws6SA2682kMV3bG4EXnzec/NwbNSucLGIceYiZvc=;
  b=kMRouXXbsNiDpqDS4EP1/vqH8HL+o5nwbbpj9hFrgT4Ch9z7N+Sax/zL
   a7h7BL5DkBVmjQ4ZmFz8gKb5aPHFdZ75L3+AetKfhnhv32DJHvOBAIpEG
   y1/wOopncu7rwauHT+PGtZjzqqu+LX3nAlcD4uR8qdvz5z7xIqVEq2xWj
   g2t/HOyagJRbvZkinpyVwfR3WtcAXVlag9PHVmIDvTrWmgySzYnQuRceO
   TOO+M5ywNm4ZElyMFc5a71dxkp/sm634HTc1QrpVrD+/rOLRUEjD712gI
   iwVNnz+rbPMDd+z/2rpmmxn7gdFWnPQumAlPU/VM7Qmg9h8jTbx1WPVzz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="324647188"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="324647188"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="865158093"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="865158093"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Apr 2023 16:13:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poY1y-000cj9-0x;
	Mon, 17 Apr 2023 23:13:06 +0000
Date: Tue, 18 Apr 2023 07:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e04e4b6e01e71978d5df92a5f25b472e1827b46b
Message-ID: <643dd24b.F77pIDLrFiEH4SdN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_161309_400976_44191F33 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: e04e4b6e01e71978d5df92a5f25b472e1827b46b  wifi: ath9k: fix per-packet TX-power cap for TPC

elapsed time: 732m

configs tested: 113
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230416   gcc  
alpha                randconfig-r032-20230416   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r033-20230416   gcc  
arc                  randconfig-r034-20230416   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230416   clang
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230416   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r024-20230417   gcc  
csky                 randconfig-r025-20230416   gcc  
csky                 randconfig-r033-20230417   gcc  
csky                 randconfig-r035-20230417   gcc  
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
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
ia64                                defconfig   gcc  
ia64                 randconfig-r022-20230416   gcc  
ia64                 randconfig-r022-20230417   gcc  
ia64                 randconfig-r026-20230416   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r034-20230417   gcc  
loongarch            randconfig-r036-20230416   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r021-20230417   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r014-20230417   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r025-20230417   gcc  
openrisc             randconfig-r002-20230417   gcc  
openrisc             randconfig-r011-20230417   gcc  
openrisc             randconfig-r035-20230416   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230416   gcc  
parisc               randconfig-r006-20230417   gcc  
parisc               randconfig-r021-20230416   gcc  
parisc               randconfig-r023-20230416   gcc  
parisc               randconfig-r024-20230416   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r016-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230417   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r011-20230416   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r031-20230416   gcc  
sparc64              randconfig-r003-20230416   gcc  
sparc64              randconfig-r026-20230417   gcc  
sparc64              randconfig-r036-20230417   gcc  
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
x86_64               randconfig-k001-20230417   clang
x86_64               randconfig-r032-20230417   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r004-20230417   gcc  
xtensa               randconfig-r015-20230416   gcc  
xtensa               randconfig-r031-20230417   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
