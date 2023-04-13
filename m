Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70848C7619A
	for <ath10k@archiver.kernel.org>; Thu, 13 Apr 2023 00:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nfSTH3RiMs97/oMLc752hKFxbmzLygbHKbdsnjA2d44=; b=zAwlZrNj24KsXh
	dW0DZidzrlHZSxT+yjdwAHZAOoEJv9bo6xISbu+2XfaVBa+QKtiWvA9Hfc/MeoYjDDYp4cBpTwTTS
	baWGQyz/5RMinjZWyHgNivPlljMYFHBVy6IDmURjQ3//kXnW9IILTYsrCmIh/gMqg3HoMt+W9WkRp
	/3WeXv3znEQL8LRjJWIxcycEtHefrQfgMcRBNc2qrnUhUx3DcS4PtuUyt+z6xYnCqCEg4Jezkh//P
	cA3nWHTCC7YJCT8BBWFkiTcb0guFQhls+DHp4DMbcqHVnx1lw1iBnxJI4+lQL2mWYj10fMZbm+XDC
	ifM4YavdnXpinboWBpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmkiU-004h3m-0O;
	Thu, 13 Apr 2023 00:21:34 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmkiQ-004h2X-26
	for ath10k@lists.infradead.org;
	Thu, 13 Apr 2023 00:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681345290; x=1712881290;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mgULIHJsl5yDxxUWUctz6XJEkwey9GM97PCheLZGkrw=;
  b=dP/Ch9XxyNF0rZNWEJZubytXCMbOY0TgXv0VgC81+rJsbl6DJPUNDoMF
   MSTboz34LADAg49AXjTlMcSw70IVA7vec/9bPr3CoiuaSLPYDiQpEdYy9
   b+Om3lLgSuL9ZfX37QUMnw05HCwwxlHGIAT2F4uXe9FVV9Um+S8K9pHi6
   EA/S1ehHsybMFjLLcUw7eBubUG+EWmWimHDKvDR/AMFJO2ZuICmrhpCWM
   6LU8X5arq4AbFIFrSd/bjGr2qXpmUz5yGX88kNDO+1Cjz48R3+xsR/VUg
   VYNUNWIq3Q3FkYCUy2L4eZ8htMitzi1vLCfOZJv51AxsM4aGPiThAQpn/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341548217"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="341548217"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 17:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691719685"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="691719685"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Apr 2023 17:21:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmkiN-000YAO-0Z;
	Thu, 13 Apr 2023 00:21:27 +0000
Date: Thu, 13 Apr 2023 08:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 b8d6a28f1df329bfb5b9a55a69d81b213d8a865a
Message-ID: <64374ace.GoyT0Y+rkqy4tK1r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_172130_699495_1BB3D7CC 
X-CRM114-Status: UNSURE (   5.70  )
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
branch HEAD: b8d6a28f1df329bfb5b9a55a69d81b213d8a865a  wifi: ath9k: fix per-packet TX-power cap for TPC

elapsed time: 720m

configs tested: 113
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230410   gcc  
alpha                randconfig-r026-20230410   gcc  
alpha                randconfig-r034-20230410   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r016-20230410   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230412   clang
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230409   clang
arm64                randconfig-r022-20230410   gcc  
csky                                defconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230410   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                 randconfig-r006-20230410   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230409   gcc  
ia64                 randconfig-r022-20230409   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r022-20230412   gcc  
loongarch            randconfig-r024-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230412   gcc  
m68k                 randconfig-r013-20230412   gcc  
m68k                 randconfig-r032-20230409   gcc  
microblaze           randconfig-r032-20230410   gcc  
microblaze           randconfig-r033-20230410   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r036-20230409   gcc  
openrisc             randconfig-r031-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230409   gcc  
parisc               randconfig-r011-20230410   gcc  
parisc               randconfig-r016-20230412   gcc  
parisc               randconfig-r023-20230409   gcc  
parisc               randconfig-r034-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r002-20230410   clang
powerpc              randconfig-r006-20230409   clang
powerpc              randconfig-r014-20230412   gcc  
powerpc              randconfig-r015-20230410   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230412   gcc  
riscv                randconfig-r024-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r024-20230412   gcc  
s390                 randconfig-r026-20230409   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r012-20230412   gcc  
sh                   randconfig-r025-20230409   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230412   gcc  
sparc                randconfig-r035-20230409   gcc  
sparc64              randconfig-r023-20230412   gcc  
sparc64              randconfig-r025-20230410   gcc  
sparc64              randconfig-r036-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64               randconfig-r021-20230410   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r014-20230410   gcc  
xtensa               randconfig-r015-20230409   gcc  
xtensa               randconfig-r016-20230409   gcc  
xtensa               randconfig-r025-20230412   gcc  
xtensa               randconfig-r035-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
