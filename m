Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5EFC27C4F
	for <ath10k@archiver.kernel.org>; Sun, 30 Jun 2024 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GXWUAuizR1/gk/nPIP5m1/j9K7A0iCPgCHiL3djIGhk=; b=uc7VNJt57TpoFfDOuR/tvfCLsv
	h5wZqTlUQxdbqoqfcRbxZj/Gnu57CQb83sA2/QQWokKCaqOWIVqfw0tM8Pnxb8edfhaVqQx8RWSbu
	BWDZL9TgFfUx0WL3ryxPRmw+EYGUEGEHJc37oVXHSMr1vrwyWjR+2SVmPivYYuJG3UHNLU9svmUZJ
	FwoKSO7vaLNH8gamDdlNidf8jrgeTp7JXaqwEXprxyeiRX+3sNSTmUXWX4PzxQHwYke8dqbDQHsxg
	xGTpM4LIbyAN9kesy0rSZdWTufEV0h5hHirT9Evf2JKdFI7nLz1U58lPnpWwo/fdnpQkDbjCB7/K3
	5UBkCsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNuGN-00000000PvQ-3Whl;
	Sun, 30 Jun 2024 13:06:39 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNuGK-00000000Put-1Hcx
	for ath10k@lists.infradead.org;
	Sun, 30 Jun 2024 13:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719752796; x=1751288796;
  h=date:from:to:cc:subject:message-id;
  bh=nGZc82Au2W5YmBvL+Jp5ZZM7B1Q0nN61c0Xo+vOVvlU=;
  b=ciTbKqHEMZ2Z/clM8J//1EjF+tn7QRElPN8TRewlU8TC/PTL5Gjlnf1p
   QaRllgwf0Uo54l7xDfu+ejAxcmCcICl08nDcN1brwD1+GsS7jVeTXbBAb
   UvYtLg2/RzSK3zkiAdp1gK1hYPEvSmHV6fCdv1meoEfqBEFBCrmQH55iN
   YIiXTMGjW0iaFkPylcEE/1xnAsXu0lgpMbVHuQSUU98QFcQXZ8Abh+sde
   dqfpojc/1ikuisMtp2ah9OE3H/8mzLcCKCFZPFbIk4xz80suHTrfmV/Al
   i6apxq56DzSEWK8TfaQDrYXey71DZQKKYhtqafPRahEI20wAVM8gqi+sc
   w==;
X-CSE-ConnectionGUID: HpuoM5qSSnW0SCPxxPNXog==
X-CSE-MsgGUID: 433C5d+HRKKsas01jJk1kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="39390470"
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="39390470"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 06:06:35 -0700
X-CSE-ConnectionGUID: hHFb+LgwR6qriZTGcGxexw==
X-CSE-MsgGUID: EqdFCI0OSUWWO7oKCw6iLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,174,1716274800"; 
   d="scan'208";a="49701783"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jun 2024 06:06:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNuGG-000Ldm-0p;
	Sun, 30 Jun 2024 13:06:32 +0000
Date: Sun, 30 Jun 2024 21:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 a2faca6591c2865712b68d76fd65ce017b815070
Message-ID: <202406302108.9K6ixKT2-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_060636_419123_52BE5459 
X-CRM114-Status: UNSURE (   3.68  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: a2faca6591c2865712b68d76fd65ce017b815070  Add localversion-wireless-testing-ath

elapsed time: 4055m

configs tested: 91
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240630   gcc-13.2.0
arc                   randconfig-002-20240630   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-13.2.0
arm                   randconfig-001-20240630   gcc-13.2.0
arm                   randconfig-002-20240630   gcc-13.2.0
arm                   randconfig-003-20240630   gcc-13.2.0
arm                   randconfig-004-20240630   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240630   gcc-13.2.0
arm64                 randconfig-002-20240630   gcc-13.2.0
arm64                 randconfig-003-20240630   gcc-13.2.0
arm64                 randconfig-004-20240630   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240630   gcc-13.2.0
csky                  randconfig-002-20240630   gcc-13.2.0
i386         buildonly-randconfig-001-20240628   gcc-10
i386         buildonly-randconfig-001-20240630   clang-18
i386         buildonly-randconfig-002-20240628   gcc-10
i386         buildonly-randconfig-002-20240630   clang-18
i386         buildonly-randconfig-003-20240628   gcc-10
i386         buildonly-randconfig-003-20240630   clang-18
i386         buildonly-randconfig-004-20240628   gcc-10
i386         buildonly-randconfig-004-20240630   gcc-7
i386         buildonly-randconfig-005-20240628   gcc-10
i386         buildonly-randconfig-005-20240630   clang-18
i386         buildonly-randconfig-006-20240628   gcc-10
i386         buildonly-randconfig-006-20240630   gcc-13
i386                  randconfig-001-20240628   gcc-10
i386                  randconfig-001-20240630   gcc-13
i386                  randconfig-002-20240628   gcc-10
i386                  randconfig-002-20240630   gcc-13
i386                  randconfig-003-20240628   gcc-10
i386                  randconfig-003-20240630   clang-18
i386                  randconfig-004-20240628   gcc-10
i386                  randconfig-004-20240630   gcc-13
i386                  randconfig-005-20240628   gcc-10
i386                  randconfig-005-20240630   clang-18
i386                  randconfig-006-20240628   gcc-10
i386                  randconfig-006-20240630   clang-18
i386                  randconfig-011-20240628   gcc-10
i386                  randconfig-011-20240630   gcc-13
i386                  randconfig-012-20240628   gcc-10
i386                  randconfig-012-20240630   clang-18
i386                  randconfig-013-20240628   gcc-10
i386                  randconfig-013-20240630   gcc-8
i386                  randconfig-014-20240628   gcc-10
i386                  randconfig-014-20240630   gcc-8
i386                  randconfig-015-20240628   gcc-10
i386                  randconfig-015-20240630   gcc-10
i386                  randconfig-016-20240628   gcc-10
i386                  randconfig-016-20240630   gcc-13
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240630   gcc-13.2.0
loongarch             randconfig-002-20240630   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240630   gcc-13.2.0
nios2                 randconfig-002-20240630   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240630   gcc-13.2.0
parisc                randconfig-002-20240630   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240630   gcc-13.2.0
powerpc               randconfig-002-20240630   gcc-13.2.0
powerpc               randconfig-003-20240630   gcc-13.2.0
powerpc64             randconfig-001-20240630   gcc-13.2.0
powerpc64             randconfig-002-20240630   gcc-13.2.0
powerpc64             randconfig-003-20240630   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240630   gcc-13.2.0
riscv                 randconfig-002-20240630   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240630   gcc-13.2.0
s390                  randconfig-002-20240630   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240630   gcc-13.2.0
sh                    randconfig-002-20240630   gcc-13.2.0
sparc64               randconfig-001-20240630   gcc-13.2.0
sparc64               randconfig-002-20240630   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                    randconfig-001-20240630   gcc-13.2.0
um                    randconfig-002-20240630   gcc-13.2.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240630   gcc-13.2.0
xtensa                randconfig-002-20240630   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

