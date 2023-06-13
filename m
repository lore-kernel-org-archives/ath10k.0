Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F85EB64D7
	for <ath10k@archiver.kernel.org>; Tue, 13 Jun 2023 21:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mDkrMFsN0a9aNl88WOzCaKOU/v+B4QDVQM7HqedCYsM=; b=EVRqsCpXYqMFy1
	72YLJwL6Ud4CSCzPDINbrFdSpGdOMe9c2p7i2dYhFyYxAXZGLEcy1k3SzBydo07VpxSa+XPulFf2u
	aQ3qbcWfpmRlGsrWe9aakMgEvhNiD/BIJu/pPzJjSSYI3koCIssVpQ4vOQe4gSIiqvuJss5N10uVa
	9gaeYJ4bt24PhdZOnST/HSZZ1Z8/nhVKhMcJ9yJzehbpGbxxH77l7TIEuavs+u+WZMh+OAOx+ohQL
	LH0erN8wJj3RVg/LxLugrK+r6pUWr9t8h8hb3FKobt8ZAmej9ISWxqL8I/gUN4QNoSqxpUBEVO/v/
	9PB4PZhF5BF1vpYSiUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9C33-009Hij-0H;
	Tue, 13 Jun 2023 21:59:33 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9C2w-009Hhn-2s
	for ath10k@lists.infradead.org;
	Tue, 13 Jun 2023 21:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686693566; x=1718229566;
  h=date:from:to:cc:subject:message-id;
  bh=j8eySdgqkioI+OVsP2udwo2BhrYv7bkSCdIOX2BYH+8=;
  b=ER1lU1Oxx4BnJO1f7BNi/9H8lLfR3vQ75zASlBACqVZ57KQZsLZ4cn9c
   2leUQWEFWIwykDJ4YiGoQ2h5tL7CvImqZNV1GcdwdjWtxmPryofnXLXA6
   FT5WGAGX1sY+DlAYk4qfBv1de8zCu8jWxkViYEitt4NbvfEEiEASRgQfb
   Ysv88y0RMgoKCGzOZyA9usi2txQBwxTWgIoYWsr3IppHVMZFxQi2d+qNK
   RAab0vZp+GkuHFmzXp05wrQCJPn415tAKve4r8yBJdNqgxjPugy4/CzYv
   kQtOJLDyMwN85z9l5xP1oDtp4MYCTVtzqJZ/CHUNA760pT+L7zXyDKtOM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338815102"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="338815102"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 14:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958558789"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="958558789"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2023 14:59:25 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9C2u-0001pG-1H;
	Tue, 13 Jun 2023 21:59:24 +0000
Date: Wed, 14 Jun 2023 05:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 1941c05d142084341caeec83c210fd71489cdcb8
Message-ID: <202306140540.B8f5QvGg-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_145926_943885_E25CE151 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 1941c05d142084341caeec83c210fd71489cdcb8  wifi: ath11k: add support DT ieee80211-freq-limit

elapsed time: 724m

configs tested: 101
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230612   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230612   gcc  
alpha                randconfig-r022-20230612   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230612   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230612   clang
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230612   gcc  
arm                  randconfig-r046-20230612   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230612   clang
arm64                randconfig-r036-20230613   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230612   gcc  
hexagon      buildonly-randconfig-r006-20230612   clang
hexagon              randconfig-r041-20230612   clang
hexagon              randconfig-r045-20230612   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230612   clang
i386                 randconfig-i002-20230612   clang
i386                 randconfig-i003-20230612   clang
i386                 randconfig-i004-20230612   clang
i386                 randconfig-i005-20230612   clang
i386                 randconfig-i006-20230612   clang
i386                 randconfig-i011-20230612   gcc  
i386                 randconfig-i012-20230612   gcc  
i386                 randconfig-i013-20230612   gcc  
i386                 randconfig-i014-20230612   gcc  
i386                 randconfig-i015-20230612   gcc  
i386                 randconfig-i016-20230612   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r012-20230612   gcc  
microblaze           randconfig-r014-20230612   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230612   clang
nios2        buildonly-randconfig-r003-20230612   gcc  
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r004-20230612   gcc  
openrisc             randconfig-r001-20230612   gcc  
openrisc             randconfig-r006-20230612   gcc  
openrisc             randconfig-r011-20230612   gcc  
openrisc             randconfig-r024-20230612   gcc  
openrisc             randconfig-r035-20230613   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r034-20230613   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230612   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r025-20230612   gcc  
s390                 randconfig-r044-20230612   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r016-20230612   gcc  
sh                   randconfig-r033-20230613   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r004-20230612   gcc  
sparc64              randconfig-r032-20230613   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r002-20230612   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230612   clang
x86_64               randconfig-a002-20230612   clang
x86_64               randconfig-a003-20230612   clang
x86_64               randconfig-a004-20230612   clang
x86_64               randconfig-a005-20230612   clang
x86_64               randconfig-a006-20230612   clang
x86_64               randconfig-a011-20230612   gcc  
x86_64               randconfig-a012-20230612   gcc  
x86_64               randconfig-a013-20230612   gcc  
x86_64               randconfig-a014-20230612   gcc  
x86_64               randconfig-a015-20230612   gcc  
x86_64               randconfig-a016-20230612   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
