Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CEFC4345F
	for <ath10k@archiver.kernel.org>; Wed,  1 May 2024 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=55WFjDT9x7ufkjpVsO0nNdu396tdHWmPZRK8jsqRCBs=; b=3ZKXzzWfjf9DYmO72wDBwpXaFx
	tI381mK78LcjNx8xqV81QmJZ0spAX+vWvz4OhgCeS1y9qXv5YPty8Z0Q4p8QL3Zhqyp17T0UzyMlU
	F/GY/+5LMZgFB94G7BWJo699rrQ+YSvj2H/Cvr/6SJnwvok1iRKmhrAkv/33Dh5Oa4El5MuiqJODH
	4EcG+AeMXSXdm3m467RN/cqK5dUTEwrjtzC5oO1nZg6ngkmEc1dcuDurr37zkTgDaUSH+8Mjmelvn
	ECXnp5JbRqWEaf+qzNX7jEGU31BUyV1LLCs2Rc6SbrS4rNhz5K7Y2kRmjgcoNWKqo4Kaooua2Soj9
	YT2zWnPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DKM-0000000AFLD-20zd;
	Wed, 01 May 2024 17:01:06 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2DKI-0000000AFJh-15D2
	for ath10k@lists.infradead.org;
	Wed, 01 May 2024 17:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714582862; x=1746118862;
  h=date:from:to:cc:subject:message-id;
  bh=fLRTZRMtZ0MbuYbxKM1cCNdPqQnxj028/GKZfqcBf7k=;
  b=Fp7ND3vGTLM0HfbWmm3zbArQPGIqq8655JOEkqwRyJrXL4Bgx5XkTzon
   XCg7Cv6b3Jh+vRtCAcu9rvKDlOozbOeEB+r3GdJ5PiIN0tjyB+glw3cCx
   7hk77EmJHj+rJ6lIw4+nDyQUFHXJ9/Wfq8PHGIqnGrLs0RU5kRXYPYJ0y
   9Ob++4bQHpXhrtJribPS78sCtbUrovCplGmi/yA0OYZXr+CVVg/gB7wTm
   if8NmDHDwJZR9SNOi2aZKSC4aEGgfVMcukDi+sNJPvUm8f5zCpJUqIufb
   4xoi9H4Dn9G1OjSRHQQjqSsNSP4YaWKzpaayBLUO61FxZongkGZrMo9oA
   w==;
X-CSE-ConnectionGUID: FKYI3B37SmiZlFVs02Ov0g==
X-CSE-MsgGUID: TERWVKNtTDCYWvLMuPH0FA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="20937222"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="20937222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 10:00:53 -0700
X-CSE-ConnectionGUID: gBiQyhl0Rrec+e4H1ZTmsw==
X-CSE-MsgGUID: sXbnuEMJRzSQkeq2xA8lpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="31650622"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 May 2024 10:00:52 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2DK6-0009lp-0O;
	Wed, 01 May 2024 17:00:50 +0000
Date: Thu, 02 May 2024 01:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 e120b6388d7d88635d67dcae6483f39c37111850
Message-ID: <202405020124.PKtj5vc8-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_100103_767759_2B73026C 
X-CRM114-Status: UNSURE (   4.31  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: e120b6388d7d88635d67dcae6483f39c37111850  wifi: ar5523: enable proper endpoint verification

elapsed time: 1633m

configs tested: 125
configs skipped: 3

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
arc                   randconfig-001-20240501   gcc  
arc                   randconfig-002-20240501   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240501   gcc  
arm                   randconfig-002-20240501   gcc  
arm                   randconfig-003-20240501   clang
arm                   randconfig-004-20240501   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240501   gcc  
arm64                 randconfig-002-20240501   gcc  
arm64                 randconfig-003-20240501   clang
arm64                 randconfig-004-20240501   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240501   gcc  
csky                  randconfig-002-20240501   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240501   clang
i386         buildonly-randconfig-002-20240501   gcc  
i386         buildonly-randconfig-003-20240501   clang
i386         buildonly-randconfig-004-20240501   gcc  
i386         buildonly-randconfig-005-20240501   gcc  
i386         buildonly-randconfig-006-20240501   clang
i386                                defconfig   clang
i386                  randconfig-001-20240501   gcc  
i386                  randconfig-002-20240501   clang
i386                  randconfig-003-20240501   gcc  
i386                  randconfig-004-20240501   gcc  
i386                  randconfig-005-20240501   clang
i386                  randconfig-006-20240501   clang
i386                  randconfig-011-20240501   gcc  
i386                  randconfig-012-20240501   gcc  
i386                  randconfig-013-20240501   gcc  
i386                  randconfig-014-20240501   gcc  
i386                  randconfig-015-20240501   gcc  
i386                  randconfig-016-20240501   gcc  
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
x86_64       buildonly-randconfig-001-20240501   gcc  
x86_64       buildonly-randconfig-002-20240501   clang
x86_64       buildonly-randconfig-003-20240501   gcc  
x86_64       buildonly-randconfig-004-20240501   gcc  
x86_64       buildonly-randconfig-005-20240501   clang
x86_64       buildonly-randconfig-006-20240501   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240501   gcc  
x86_64                randconfig-002-20240501   gcc  
x86_64                randconfig-003-20240501   gcc  
x86_64                randconfig-004-20240501   clang
x86_64                randconfig-005-20240501   clang
x86_64                randconfig-006-20240501   gcc  
x86_64                randconfig-011-20240501   gcc  
x86_64                randconfig-012-20240501   clang
x86_64                randconfig-013-20240501   gcc  
x86_64                randconfig-014-20240501   clang
x86_64                randconfig-015-20240501   clang
x86_64                randconfig-016-20240501   clang
x86_64                randconfig-071-20240501   clang
x86_64                randconfig-072-20240501   clang
x86_64                randconfig-073-20240501   clang
x86_64                randconfig-074-20240501   gcc  
x86_64                randconfig-075-20240501   gcc  
x86_64                randconfig-076-20240501   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

