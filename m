Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF93C4345F
	for <ath10k@archiver.kernel.org>; Wed, 24 Apr 2024 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4b4qFls4XW+Y7cEa2GjastyaMHUMl3irxxDDi2F/jFc=; b=SIWKT6jQx3yndlFVjaRxeMyPvK
	M+p/jmsc3Yc4Epp5hQBvX0hFRs/JhZKKTn1fTBFFyrFBYw6/L+9qBhp0IU+j+dM5jSvypk8F63uEw
	6Mo41mBTv1u831dWavDkMSKJMcGjixtII1OuuWj5opFwi8dcgcuUhanI75KPHWtoleX1FfmxjWVBU
	Fq4P4WIadr185bQV0OFCDAez5g9R0/2U7HD7jpQj5gxdO/lKBqrZ+loHYEclK3QpGeo6zuIghTe40
	FwzaKC78yszxEPUrPaFyaxH4iZKgGalPoBdsYKpdJ1IJpa+L8JpvLtGzyJgmMfqRXtAyRfUc65wO+
	ZHyG79TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzacm-00000003syN-0i8j;
	Wed, 24 Apr 2024 11:17:16 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzacj-00000003sxa-2V69
	for ath10k@lists.infradead.org;
	Wed, 24 Apr 2024 11:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713957434; x=1745493434;
  h=date:from:to:cc:subject:message-id;
  bh=N+ZRBFVCxQVmDgkVc5LRPVZWb3la5qu6KI3pDuhdTc0=;
  b=momXfu/2qZ/j2L9qmll8EGDxzs3LsTYSjFhhwHJg50TVcodxht7fcAT8
   O1bG5XOmttvzdHuOjqxuHxybO+d0ZzhikP5MVZEYLatJ++1sIT/YsvCqj
   yePK+zg6kPfgKRLeCpZjRJGxXKTYF2rFu7OSFsCrhlBiA0dCLK64+EDkS
   Dx09N59vmBZl+Kj5+BvJb+2pZ/0jn7RJQWNRIjiQv718US5vNS93xXEMC
   dBdi95aDroQZ6npwkMLatKYzKPmD+6Yc7asDUrk8QNqfkGx4KgP/i/ko2
   Gdn394j888qqfCwVCB7/vRJhTkCmKtstezH3k/u52AgjEUcaUSTD/EL/Y
   w==;
X-CSE-ConnectionGUID: ESaxz4+7QcK0mxEmDCS+Eg==
X-CSE-MsgGUID: WB15fpiZSm6MQF2ErM9sFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20197321"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="20197321"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 04:17:11 -0700
X-CSE-ConnectionGUID: 0dFV3epySN2f6eMYZwsVZA==
X-CSE-MsgGUID: CJuX4ptXTmeRxNi+BTzWjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="47939869"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Apr 2024 04:17:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzacd-0001AS-2s;
	Wed, 24 Apr 2024 11:17:07 +0000
Date: Wed, 24 Apr 2024 19:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 5f59d2c5398fa60b8864e8569e3c3207462a37c3
Message-ID: <202404241921.ujPz0GIy-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_041713_681927_B1C6F200 
X-CRM114-Status: UNSURE (   3.87  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 5f59d2c5398fa60b8864e8569e3c3207462a37c3  wifi: ath10k: Fix an error code problem in ath10k_dbg_sta_write_peer_debug_trigger()

elapsed time: 1370m

configs tested: 179
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240424   gcc  
arc                   randconfig-002-20240424   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           imxrt_defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                   randconfig-001-20240424   gcc  
arm                   randconfig-002-20240424   gcc  
arm                   randconfig-003-20240424   gcc  
arm                   randconfig-004-20240424   clang
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240424   clang
arm64                 randconfig-002-20240424   gcc  
arm64                 randconfig-003-20240424   gcc  
arm64                 randconfig-004-20240424   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240424   gcc  
csky                  randconfig-002-20240424   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240424   clang
hexagon               randconfig-002-20240424   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240424   gcc  
i386         buildonly-randconfig-002-20240424   gcc  
i386         buildonly-randconfig-003-20240424   gcc  
i386         buildonly-randconfig-004-20240424   gcc  
i386         buildonly-randconfig-005-20240424   gcc  
i386         buildonly-randconfig-006-20240424   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240424   gcc  
i386                  randconfig-002-20240424   gcc  
i386                  randconfig-003-20240424   gcc  
i386                  randconfig-004-20240424   clang
i386                  randconfig-005-20240424   gcc  
i386                  randconfig-006-20240424   gcc  
i386                  randconfig-011-20240424   clang
i386                  randconfig-012-20240424   gcc  
i386                  randconfig-013-20240424   clang
i386                  randconfig-014-20240424   clang
i386                  randconfig-015-20240424   clang
i386                  randconfig-016-20240424   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240424   gcc  
loongarch             randconfig-002-20240424   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                          malta_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240424   gcc  
nios2                 randconfig-002-20240424   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240424   gcc  
parisc                randconfig-002-20240424   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   bluestone_defconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-001-20240424   clang
powerpc               randconfig-002-20240424   gcc  
powerpc               randconfig-003-20240424   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240424   gcc  
powerpc64             randconfig-002-20240424   gcc  
powerpc64             randconfig-003-20240424   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240424   gcc  
riscv                 randconfig-002-20240424   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240424   gcc  
s390                  randconfig-002-20240424   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240424   gcc  
sh                    randconfig-002-20240424   gcc  
sh                           se7705_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240424   gcc  
sparc64               randconfig-002-20240424   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240424   gcc  
um                    randconfig-002-20240424   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240424   clang
x86_64       buildonly-randconfig-002-20240424   clang
x86_64       buildonly-randconfig-003-20240424   gcc  
x86_64       buildonly-randconfig-004-20240424   gcc  
x86_64       buildonly-randconfig-005-20240424   gcc  
x86_64       buildonly-randconfig-006-20240424   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240424   clang
x86_64                randconfig-002-20240424   clang
x86_64                randconfig-003-20240424   gcc  
x86_64                randconfig-004-20240424   gcc  
x86_64                randconfig-005-20240424   clang
x86_64                randconfig-006-20240424   clang
x86_64                randconfig-011-20240424   clang
x86_64                randconfig-012-20240424   gcc  
x86_64                randconfig-013-20240424   gcc  
x86_64                randconfig-014-20240424   gcc  
x86_64                randconfig-015-20240424   clang
x86_64                randconfig-016-20240424   gcc  
x86_64                randconfig-071-20240424   clang
x86_64                randconfig-072-20240424   clang
x86_64                randconfig-073-20240424   gcc  
x86_64                randconfig-074-20240424   clang
x86_64                randconfig-075-20240424   gcc  
x86_64                randconfig-076-20240424   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240424   gcc  
xtensa                randconfig-002-20240424   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

