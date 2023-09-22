Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4916BE7D0B9
	for <ath10k@archiver.kernel.org>; Fri, 22 Sep 2023 06:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bDqYAa5sdpRSzSIKdmJl6zmkYyYhyHir0uHdenxMt6M=; b=pTFG5DV4X9Qsoa
	Z2x9xxmX+amf8Y4Jn4arhR0IahJWFCRxIVktcBKCjYh7NEDs4VKqyYyKG5UWVZ3CsQ6w7qIrjNUMv
	1sTPdg18ZnnZJousmtEKhv0phWJXsgPtLDlkun5a8/qG/TzLunrp8lrS57kBoZqkeLhBsW6WXnJWh
	3/LFnotZj5gp6biCq0ZUHPRO+JS0nShkdILREwIO06zo1jM+rapxKU5+Ybu5EPopH5v6EorwIhwkp
	uS6gNykCV0w4lY07aD2LXYc9UyZd+eiuG/6kG54QBCUqUkfIX3AOaEzJa3Fd9zi1q3L/iZHA8+XJM
	tjhkqCtFXP+9POxao/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZgZ-00838S-2Y;
	Fri, 22 Sep 2023 06:30:43 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZgW-00837b-14
	for ath10k@lists.infradead.org;
	Fri, 22 Sep 2023 06:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695364240; x=1726900240;
  h=date:from:to:cc:subject:message-id;
  bh=SbtIkmf75ihgb3sGcIdE1IbDEDDjWoE+HpHTbLnTsP0=;
  b=Ezeu3JqW+R3OBSdvFtfNzM/8wpfvF/aCh7DyQE5uZpy6Uw3h1Sdbubd9
   hBnoaImjfyvCAtNE1THYONBc8UqGIuY830Pg+R76pxMiiCuiMKO6EKOcF
   CZmcFmFnlnMDZxUHITGo9O67lB3nWXNtSprENUvtfjP+2VDKvL5F7ffpZ
   YHfsGnP4jCwOLQN7Q69KkMiaNdqMN6xAi5+TUHyfoVFv1Qy9Dc3PhEvvS
   5cqithDFqb33hA38S2y/i53CiCGQxPI0yk30Bp4lGXDcQzo7BCWKgzJWW
   CDGHqB/lXp20qjQSPi0gIsMhWRY6YR94tBU4inQUYxyrDx2xb4oMoOd3O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="371077157"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="371077157"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 23:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817665833"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="817665833"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2023 23:30:35 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjZfD-0000DB-1A;
	Fri, 22 Sep 2023 06:29:47 +0000
Date: Fri, 22 Sep 2023 14:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 030d640c8b9b10b2e27531f77b892d50d44a004d
Message-ID: <202309221402.v4ZAUDAD-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_233040_415509_9190AD31 
X-CRM114-Status: UNSURE (   6.71  )
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
branch HEAD: 030d640c8b9b10b2e27531f77b892d50d44a004d  Merge branch 'ath-next' into ath-qca

elapsed time: 1315m

configs tested: 177
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230921   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230921   gcc  
arm                   randconfig-001-20230922   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230921   gcc  
i386         buildonly-randconfig-001-20230922   gcc  
i386         buildonly-randconfig-002-20230921   gcc  
i386         buildonly-randconfig-002-20230922   gcc  
i386         buildonly-randconfig-003-20230921   gcc  
i386         buildonly-randconfig-003-20230922   gcc  
i386         buildonly-randconfig-004-20230921   gcc  
i386         buildonly-randconfig-004-20230922   gcc  
i386         buildonly-randconfig-005-20230921   gcc  
i386         buildonly-randconfig-005-20230922   gcc  
i386         buildonly-randconfig-006-20230921   gcc  
i386         buildonly-randconfig-006-20230922   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230921   gcc  
i386                  randconfig-001-20230922   gcc  
i386                  randconfig-002-20230921   gcc  
i386                  randconfig-002-20230922   gcc  
i386                  randconfig-003-20230921   gcc  
i386                  randconfig-003-20230922   gcc  
i386                  randconfig-004-20230921   gcc  
i386                  randconfig-004-20230922   gcc  
i386                  randconfig-005-20230921   gcc  
i386                  randconfig-005-20230922   gcc  
i386                  randconfig-006-20230921   gcc  
i386                  randconfig-006-20230922   gcc  
i386                  randconfig-011-20230921   gcc  
i386                  randconfig-011-20230922   gcc  
i386                  randconfig-012-20230921   gcc  
i386                  randconfig-012-20230922   gcc  
i386                  randconfig-013-20230921   gcc  
i386                  randconfig-013-20230922   gcc  
i386                  randconfig-014-20230921   gcc  
i386                  randconfig-014-20230922   gcc  
i386                  randconfig-015-20230921   gcc  
i386                  randconfig-015-20230922   gcc  
i386                  randconfig-016-20230921   gcc  
i386                  randconfig-016-20230922   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230921   gcc  
loongarch             randconfig-001-20230922   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230921   gcc  
riscv                 randconfig-001-20230922   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230921   gcc  
s390                  randconfig-001-20230922   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230921   gcc  
sparc                 randconfig-001-20230922   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230921   gcc  
x86_64       buildonly-randconfig-001-20230922   gcc  
x86_64       buildonly-randconfig-002-20230921   gcc  
x86_64       buildonly-randconfig-002-20230922   gcc  
x86_64       buildonly-randconfig-003-20230921   gcc  
x86_64       buildonly-randconfig-003-20230922   gcc  
x86_64       buildonly-randconfig-004-20230921   gcc  
x86_64       buildonly-randconfig-004-20230922   gcc  
x86_64       buildonly-randconfig-005-20230921   gcc  
x86_64       buildonly-randconfig-005-20230922   gcc  
x86_64       buildonly-randconfig-006-20230921   gcc  
x86_64       buildonly-randconfig-006-20230922   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230921   gcc  
x86_64                randconfig-001-20230922   gcc  
x86_64                randconfig-002-20230921   gcc  
x86_64                randconfig-002-20230922   gcc  
x86_64                randconfig-003-20230921   gcc  
x86_64                randconfig-003-20230922   gcc  
x86_64                randconfig-004-20230921   gcc  
x86_64                randconfig-004-20230922   gcc  
x86_64                randconfig-005-20230921   gcc  
x86_64                randconfig-005-20230922   gcc  
x86_64                randconfig-006-20230921   gcc  
x86_64                randconfig-006-20230922   gcc  
x86_64                randconfig-011-20230921   gcc  
x86_64                randconfig-011-20230922   gcc  
x86_64                randconfig-012-20230921   gcc  
x86_64                randconfig-012-20230922   gcc  
x86_64                randconfig-013-20230921   gcc  
x86_64                randconfig-013-20230922   gcc  
x86_64                randconfig-014-20230921   gcc  
x86_64                randconfig-014-20230922   gcc  
x86_64                randconfig-015-20230921   gcc  
x86_64                randconfig-015-20230922   gcc  
x86_64                randconfig-016-20230921   gcc  
x86_64                randconfig-016-20230922   gcc  
x86_64                randconfig-071-20230921   gcc  
x86_64                randconfig-072-20230921   gcc  
x86_64                randconfig-073-20230921   gcc  
x86_64                randconfig-074-20230921   gcc  
x86_64                randconfig-075-20230921   gcc  
x86_64                randconfig-076-20230921   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
