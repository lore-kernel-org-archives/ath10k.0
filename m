Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09E8C7EE23
	for <ath10k@archiver.kernel.org>; Tue, 28 Feb 2023 01:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sUphtjAqRLpf5aErzMhzrE8qWGUJ8EJza3Lf/UI7eAU=; b=Fywu7XggMcm+UK
	b+WFePJbhIr4AsuvIHD0Ej354A3TozgwwF8cpucuWBbVhUIMh3c82SYXuqEhJn9kVnyI/X7Gz3/RA
	uBDVflC/PxkuiunKGYjrYIbEOOa6T5zF7QYdfBHh8zhnI1OrFE0I7LTGiMnYcALwilO7g48I1klz+
	+cZacYD4nqo2sEODIA1h/CT8YrjwNKYMjuuuSIlw53A/VbV2SIFoJFbQucmk9LUrmchV8Boird/s3
	hRyD9k7jt3qrtMIXl8tkuyNzdMCSPVUUb6qvXKxiGuyCxk46d2oZyis8aienrd/JR/VlXXf2HBVfb
	v71s0X3dCWR82Wb1hnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoj3-00Bjhi-OK; Tue, 28 Feb 2023 01:24:17 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoj0-00Bjgu-MO
	for ath10k@lists.infradead.org; Tue, 28 Feb 2023 01:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677547454; x=1709083454;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5UUB4fP+9+Mrq7H90GGc4Cm1/1g+SByuHxiz1zIg/zw=;
  b=njd80ATmeOSo8mlDX2yN1Nx1dgt4vLzLel3pmIGH0a8iwkNXn+xtm7QQ
   4Szs10mUSB/lEfqk74gDZMoZGw+Ay9QlaC3Yr9KN1Y733muMg+DRRIaif
   QgsMVqNBIYc3rtbqYjEAWtCOw6xy3NCzC1ePcDvaKNiWP34UEYcuMMrLQ
   prsBanrVBDOTfZx+s8MRHURLxTUTKG9BOKSAwbyKkZfvFO82b+PfZo0YK
   +ELkeG6Z4njGqscWAJzh7JrlYG+YCmgn1JN3txVdC6b1L7G+LP5v7hDAW
   Y5T7iwv4rqXDXaVtDVFk0FkQmksuuDvF03vp3B2BE90QkQd+7F2nshpkr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="317819456"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="317819456"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 17:24:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="848073204"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="848073204"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Feb 2023 17:24:11 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWoiw-0004xn-38;
	Tue, 28 Feb 2023 01:24:10 +0000
Date: Tue, 28 Feb 2023 09:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 b90ad21312f3894c83b86bfa0640a84d0459c4d5
Message-ID: <63fd57a2.nUO9koqrkr1aS3KT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_172414_807093_1DFE4208 
X-CRM114-Status: UNSURE (   5.99  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: b90ad21312f3894c83b86bfa0640a84d0459c4d5  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 133
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230226   gcc  
alpha                randconfig-r011-20230227   gcc  
alpha                randconfig-r026-20230226   gcc  
alpha                randconfig-r026-20230227   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230227   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r021-20230227   gcc  
arc                  randconfig-r043-20230226   gcc  
arc                  randconfig-r043-20230227   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230226   gcc  
arm                  randconfig-r046-20230227   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r006-20230227   clang
arm64                               defconfig   gcc  
arm64                randconfig-r015-20230226   clang
arm64                randconfig-r022-20230227   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230226   gcc  
csky                 randconfig-r025-20230226   gcc  
csky                 randconfig-r032-20230226   gcc  
hexagon              randconfig-r015-20230227   clang
hexagon              randconfig-r024-20230227   clang
hexagon              randconfig-r041-20230226   clang
hexagon              randconfig-r041-20230227   clang
hexagon              randconfig-r045-20230226   clang
hexagon              randconfig-r045-20230227   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230227   clang
i386                 randconfig-a002-20230227   clang
i386                 randconfig-a003-20230227   clang
i386                 randconfig-a004-20230227   clang
i386                 randconfig-a005-20230227   clang
i386                 randconfig-a006-20230227   clang
i386                 randconfig-a011-20230227   gcc  
i386                 randconfig-a012-20230227   gcc  
i386                 randconfig-a013-20230227   gcc  
i386                 randconfig-a014-20230227   gcc  
i386                 randconfig-a015-20230227   gcc  
i386                 randconfig-a016-20230227   gcc  
i386                 randconfig-r002-20230227   clang
i386                 randconfig-r035-20230227   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230226   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230227   gcc  
ia64                 randconfig-r032-20230227   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230226   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230226   gcc  
loongarch            randconfig-r022-20230226   gcc  
loongarch            randconfig-r031-20230226   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230226   gcc  
m68k         buildonly-randconfig-r005-20230227   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230226   gcc  
microblaze           randconfig-r033-20230226   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r002-20230226   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230226   gcc  
openrisc             randconfig-r002-20230226   gcc  
openrisc             randconfig-r012-20230227   gcc  
openrisc             randconfig-r016-20230226   gcc  
parisc       buildonly-randconfig-r001-20230227   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230227   gcc  
parisc               randconfig-r013-20230226   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230226   clang
powerpc              randconfig-r033-20230227   clang
powerpc              randconfig-r035-20230226   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230227   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230226   gcc  
riscv                randconfig-r014-20230227   gcc  
riscv                randconfig-r042-20230226   clang
riscv                randconfig-r042-20230227   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r023-20230226   clang
s390                 randconfig-r034-20230226   gcc  
s390                 randconfig-r036-20230226   gcc  
s390                 randconfig-r044-20230226   clang
s390                 randconfig-r044-20230227   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230226   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230227   gcc  
sparc                randconfig-r016-20230227   gcc  
sparc                randconfig-r031-20230227   gcc  
sparc                randconfig-r036-20230227   gcc  
sparc64      buildonly-randconfig-r003-20230227   gcc  
sparc64              randconfig-r034-20230227   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230227   clang
x86_64               randconfig-a002-20230227   clang
x86_64               randconfig-a003-20230227   clang
x86_64               randconfig-a004-20230227   clang
x86_64               randconfig-a005-20230227   clang
x86_64               randconfig-a006-20230227   clang
x86_64               randconfig-a011-20230227   gcc  
x86_64               randconfig-a012-20230227   gcc  
x86_64               randconfig-a013-20230227   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64               randconfig-a015-20230227   gcc  
x86_64               randconfig-a016-20230227   gcc  
x86_64               randconfig-r004-20230227   clang
x86_64               randconfig-r025-20230227   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r021-20230226   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
