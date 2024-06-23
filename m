Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B1FC2BBCA
	for <ath10k@archiver.kernel.org>; Sun, 23 Jun 2024 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ioWMrCmz4FoXpeb6YYE10mmGRpDamN5P6bMmxiDHSO0=; b=us8NN4yoatF3UGtl+13IrSBvyC
	RZVoTKpBRjE/1pu/a6Xd779NGXh5FZojBgAjmZrQF9tE+pXZbSQdhw0TyYoRgYc3AV9aww6qkzBMV
	HIGc6a8R3Bvt2QT2xSF+0wBs+Rzxyd8vtg3EY6iYj6xH6o5K8zUngRyPORFfWS84hE8dqB56jleYm
	WwbSH9UAR2tFrgBIg16XSdpwWzzDinA+Gu7aFzUS9qjkAxIbG37+IOBqLLj0pYznI4L2Sep9SU6dB
	ElTXMQJApUwqejc+RzuvN7woHE304K1Ib7qC8NsstM1Xy8x70z48Q5+S20J7awFYnbc9sI2Fwq7RP
	PaEzTT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLON1-0000000ECjj-26BX;
	Sun, 23 Jun 2024 14:39:07 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLOMy-0000000ECjD-3FAN
	for ath10k@lists.infradead.org;
	Sun, 23 Jun 2024 14:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719153545; x=1750689545;
  h=date:from:to:cc:subject:message-id;
  bh=yiDPgol3A4Jpz0hHL10KvowfnXBoTjs3zMsunegMzl8=;
  b=YHjORcuNSoi5jBQmEAA/uR/Q7aFs3O8xQRIecfFvdXqd0vbD/DFUP/W4
   enbDRkl+3JhCui68LELTGxORjfKVJKgFXbPRtCjog6M1iZStxCwWhdTH/
   Kn6390yGQUEd4OsuSmaICIdJ14k0gi7DSlxoJQf7g/p5jkPHt+ZpWJQtM
   J0zyebwTPJYqp6a3fmLJEFmpHAJXd00LXNBEtn0FdtYUn7YZ7GcR+ZR7i
   o4c/+sDlNMbIIgGcP2XPi1yQvCkeseU3ZH+PObohmhg525wsUs4rse3Gq
   42/1cs5M0/kLNMsd4MOLpJvW0KgpjuyoTzlJuZjST565RBuFfcolUgCaf
   Q==;
X-CSE-ConnectionGUID: FljyjpoETjGiD4sqPO+pwA==
X-CSE-MsgGUID: +dEgVlw0Q+eKXICnk9VHXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16360480"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="16360480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 07:38:58 -0700
X-CSE-ConnectionGUID: MV4PQa9SS7qRIx1vVskqbw==
X-CSE-MsgGUID: gFlaoB2XSJW2sVZzeX9Jvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="47585923"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jun 2024 07:38:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLOMo-000AYo-3D;
	Sun, 23 Jun 2024 14:38:55 +0000
Date: Sun, 23 Jun 2024 22:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 3509dcb314bb35b2f3343a2e7d20d6872827dead
Message-ID: <202406232205.2qH01UgK-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_073905_018934_29423DB1 
X-CRM114-Status: UNSURE (   3.51  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 3509dcb314bb35b2f3343a2e7d20d6872827dead  Merge branch 'pending' into master-pending

elapsed time: 4324m

configs tested: 105
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240621   gcc-13.2.0
arc                   randconfig-002-20240621   gcc-13.2.0
arm                         bcm2835_defconfig   clang-19
arm                       multi_v4t_defconfig   clang-19
arm                   randconfig-001-20240621   gcc-13.2.0
arm                   randconfig-002-20240621   gcc-13.2.0
arm                   randconfig-003-20240621   clang-19
arm                   randconfig-004-20240621   gcc-13.2.0
arm64                 randconfig-001-20240621   clang-15
arm64                 randconfig-002-20240621   clang-19
arm64                 randconfig-003-20240621   gcc-13.2.0
arm64                 randconfig-004-20240621   clang-19
csky                  randconfig-001-20240621   gcc-13.2.0
csky                  randconfig-002-20240621   gcc-13.2.0
hexagon               randconfig-001-20240621   clang-17
hexagon               randconfig-002-20240621   clang-16
i386         buildonly-randconfig-001-20240621   clang-18
i386         buildonly-randconfig-002-20240621   gcc-7
i386         buildonly-randconfig-003-20240621   clang-18
i386         buildonly-randconfig-004-20240621   clang-18
i386         buildonly-randconfig-005-20240621   clang-18
i386         buildonly-randconfig-006-20240621   clang-18
i386                  randconfig-001-20240621   clang-18
i386                  randconfig-002-20240621   gcc-13
i386                  randconfig-003-20240621   gcc-9
i386                  randconfig-004-20240621   gcc-13
i386                  randconfig-005-20240621   clang-18
i386                  randconfig-006-20240621   clang-18
i386                  randconfig-011-20240621   gcc-13
i386                  randconfig-012-20240621   gcc-13
i386                  randconfig-013-20240621   gcc-13
i386                  randconfig-014-20240621   clang-18
i386                  randconfig-015-20240621   gcc-13
i386                  randconfig-016-20240621   gcc-12
loongarch             randconfig-001-20240621   gcc-13.2.0
loongarch             randconfig-002-20240621   gcc-13.2.0
nios2                 randconfig-001-20240621   gcc-13.2.0
nios2                 randconfig-002-20240621   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240621   gcc-13.2.0
parisc                randconfig-002-20240621   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240621   clang-15
powerpc               randconfig-002-20240621   clang-19
powerpc               randconfig-003-20240621   clang-19
powerpc64             randconfig-001-20240621   clang-19
powerpc64             randconfig-002-20240621   clang-19
powerpc64             randconfig-003-20240621   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240621   gcc-13.2.0
riscv                 randconfig-002-20240621   clang-19
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240621   gcc-13.2.0
s390                  randconfig-002-20240621   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240621   gcc-13.2.0
sh                    randconfig-002-20240621   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240621   gcc-13.2.0
sparc64               randconfig-002-20240621   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240621   gcc-13
um                    randconfig-002-20240621   gcc-9
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240621   clang-18
x86_64       buildonly-randconfig-002-20240621   gcc-11
x86_64       buildonly-randconfig-003-20240621   gcc-11
x86_64       buildonly-randconfig-004-20240621   clang-18
x86_64       buildonly-randconfig-005-20240621   gcc-11
x86_64       buildonly-randconfig-006-20240621   clang-18
x86_64                randconfig-001-20240621   gcc-12
x86_64                randconfig-002-20240621   gcc-13
x86_64                randconfig-003-20240621   clang-18
x86_64                randconfig-004-20240621   gcc-13
x86_64                randconfig-005-20240621   gcc-13
x86_64                randconfig-006-20240621   clang-18
x86_64                randconfig-011-20240621   clang-18
x86_64                randconfig-012-20240621   gcc-13
x86_64                randconfig-013-20240621   clang-18
x86_64                randconfig-014-20240621   gcc-13
x86_64                randconfig-015-20240621   gcc-11
x86_64                randconfig-016-20240621   clang-18
x86_64                randconfig-071-20240621   gcc-13
x86_64                randconfig-072-20240621   gcc-13
x86_64                randconfig-073-20240621   clang-18
x86_64                randconfig-074-20240621   clang-18
x86_64                randconfig-075-20240621   clang-18
x86_64                randconfig-076-20240621   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240621   gcc-13.2.0
xtensa                randconfig-002-20240621   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

