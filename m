Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3223DC4345F
	for <ath10k@archiver.kernel.org>; Thu, 25 Apr 2024 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CKFSPaGH0++YX5Kw73iL+phwjBXDJOH6z9GXk8fnrGI=; b=OaWfhQtls5qaFJ9dP/K6ZdzjCo
	rRK4gUbrNNYC2UlJoC4J+GDDUB+1Ctdyfx7p8ldQDjKbC/MG78tJBVYBovK58JNVsF55cx7iAbY0y
	RVZLLfA0XMCr30JeRccWeEHBlqvv1hiTLElJBCa0uQWWdtkdx7goprLi1vD8xc1pcxEHVUy526JD+
	MZCFFQpnY3y9kM/bUgUkMVWYQl+wKCO0x7U6iTZe+4VHjVOugXLa7fJ5o3udKRkqRvg4aSlRPcZEm
	o8choThtvevi4xWUnCQt672kWcc2UQrcWxisl9tPxWX6kiJ2RD44GvZHG4IGcUShW7qL68PBb8n0C
	d19/jv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03PM-00000009eRZ-3sge;
	Thu, 25 Apr 2024 18:01:20 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s03PJ-00000009eQk-3Cgb
	for ath10k@lists.infradead.org;
	Thu, 25 Apr 2024 18:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714068077; x=1745604077;
  h=date:from:to:cc:subject:message-id;
  bh=O399h2Hn4ZV4D9qBiDOsElUdS3Z+CDUhXiFFN2sv9vw=;
  b=MhbewN5nSpbejPjBr24P5Bv/uBpAsrlQ05fJKsOl0hPM8Iu8IrbIQwhJ
   5q910uDtGV0THyU902n0nDpT1tHd3/B9xKp2FmhpzSdHbGC8Y4Rkrdt/u
   OALsiMU1q+cqhY3/foBpTgqYys3b660xMQaomtqFIlDo+q+ASKEHseZmj
   Be8GSRi9l2hBbFMWERb8TBh0lxFgumrcuzqODnPFU4AiBXvkoV9y21HIE
   gi9xJlcrf1B27RR+UgKvWbYEThxZ7o0XNEmgnpaO0fXKRyjl7hjq391KC
   bZ/uQq+Zr6+wE0SJ9191YroTxkFGoRewSZ1le+zWzbjzmnel5RFZ2n2EZ
   g==;
X-CSE-ConnectionGUID: 9IxnfhxyR4G2qcD2VegJ4g==
X-CSE-MsgGUID: gNkxdAtESzmxq8LnaPneYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20927002"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="20927002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 11:01:11 -0700
X-CSE-ConnectionGUID: 6EHcBYBwQ3a5IAIFRav8FA==
X-CSE-MsgGUID: 2n84gQ09TfOHLPG4ZUtTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="56095823"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Apr 2024 11:01:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s03PA-0002hO-1Z;
	Thu, 25 Apr 2024 18:01:08 +0000
Date: Fri, 26 Apr 2024 02:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 be56e136228b8c286ca81c3391f4d091a7af6722
Message-ID: <202404260226.d55ydKEJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_110117_879050_034AA2BB 
X-CRM114-Status: UNSURE (   3.77  )
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
branch HEAD: be56e136228b8c286ca81c3391f4d091a7af6722  Merge branch 'pending' into master-pending

elapsed time: 1531m

configs tested: 103
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240426   gcc  
arc                   randconfig-002-20240426   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240426   clang
arm                   randconfig-002-20240426   gcc  
arm                   randconfig-003-20240426   gcc  
arm                   randconfig-004-20240426   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240426   gcc  
arm64                 randconfig-002-20240426   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240426   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20240425   gcc  
i386         buildonly-randconfig-002-20240425   clang
i386         buildonly-randconfig-003-20240425   gcc  
i386         buildonly-randconfig-004-20240425   clang
i386         buildonly-randconfig-005-20240425   clang
i386         buildonly-randconfig-006-20240425   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240425   clang
i386                  randconfig-002-20240425   clang
i386                  randconfig-003-20240425   clang
i386                  randconfig-004-20240425   gcc  
i386                  randconfig-005-20240425   clang
i386                  randconfig-006-20240425   clang
i386                  randconfig-011-20240425   clang
i386                  randconfig-012-20240425   clang
i386                  randconfig-013-20240425   gcc  
i386                  randconfig-014-20240425   gcc  
i386                  randconfig-015-20240425   gcc  
i386                  randconfig-016-20240425   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240425   clang
x86_64       buildonly-randconfig-002-20240425   gcc  
x86_64       buildonly-randconfig-003-20240425   clang
x86_64       buildonly-randconfig-004-20240425   clang
x86_64       buildonly-randconfig-005-20240425   clang
x86_64       buildonly-randconfig-006-20240425   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240425   clang
x86_64                randconfig-002-20240425   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

