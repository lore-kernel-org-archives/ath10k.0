Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C542DC4345F
	for <ath10k@archiver.kernel.org>; Wed, 17 Apr 2024 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sxzzm0f50FKkaMpyb72ey0BGGpREO5iD4G/OnzSNR00=; b=0dYYV4OKo9uSRI6TsOCGBNSDfh
	hWlQnIhWk+QtbO1ryD9886+I0iP6tpIJ+lkulNcW9qcr7nUqtG33uzM+l3GAOL52SxQtnOJabj5xk
	fPKKlwaI0WvvVWHRXqq1Te68UpssT/0kj+Ztb9VcEuEibo9RU1NrXtOc145QI2de8CFIbZGWeRlYj
	NO+Stnq2Va6k3nFHi2KK8W57zPv+9wRXwlh09lZCtc0/6sPdbrIN/QdFpHdlWZMWdrtDMPj55wvYm
	EjC8YBhc/GZ7wxhQ6HW3dzuGR5v1kcGI1XpQsVl1MPK2LkaraZFyRHZK5x9LCgXoz4W2JFoylUKqW
	uWr+73rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx4A2-0000000Ftlo-0ff1;
	Wed, 17 Apr 2024 12:13:10 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx49z-0000000FtkB-0x45
	for ath10k@lists.infradead.org;
	Wed, 17 Apr 2024 12:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713355987; x=1744891987;
  h=date:from:to:cc:subject:message-id;
  bh=54qpwQ2DTDG5FRba61kZVj+L65PHEiy6sLWibdPz2Ac=;
  b=kqSWJrFg8KqeprfoAmAy+juxTGR/QEShvW9U7W5xEBTS25lHyxWsX3ni
   jsHpOpkhPUYbMYAmGvs6sv3Fsc1ZCXb2ja1pwSHPKT4Ud6w7VHfP58L1k
   2TOCFwVBoVXB1+vwYKn0HK+LckSSSIxR7F3YlGQeHmndTeIYWtKKYviXA
   oPAii+OS45WUMw4y06dIw/0KBENsTzF21xr+FULMffrqasDpldsO7X5HU
   5TixqShI+uoyF6OyrVX3D2rKozuUArVZDAd7nlJuKglpyOe/xsBHCuSdy
   9O7UHm9PVNAgWN7ZYWgH3oktIC33A/p0xoPVkN7/yXiB6+zxZ82OHXxIM
   A==;
X-CSE-ConnectionGUID: bSTwU9GFRJGqHz9V16Youg==
X-CSE-MsgGUID: zXb+oJX4TlmSseTul8ygvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19549744"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="19549744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 05:13:06 -0700
X-CSE-ConnectionGUID: CRmVQk1aQ+WQGig1dBJt4Q==
X-CSE-MsgGUID: ThF84OVIRiWhb/RvvxW87Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="45901570"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 17 Apr 2024 05:13:05 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx49u-0006Yd-0N;
	Wed, 17 Apr 2024 12:13:02 +0000
Date: Wed, 17 Apr 2024 20:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 604b4d32bdc11cf276f2a3580beb326c008b2a3e
Message-ID: <202404172034.rxeBvre6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_051307_371483_49AFA0E0 
X-CRM114-Status: UNSURE (   3.44  )
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
branch HEAD: 604b4d32bdc11cf276f2a3580beb326c008b2a3e  wifi: ath12k: Fix Tx Completion Ring(WBM2SW) Setup Failure

elapsed time: 1123m

configs tested: 101
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
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240417   clang
i386         buildonly-randconfig-002-20240417   gcc  
i386         buildonly-randconfig-003-20240417   clang
i386         buildonly-randconfig-004-20240417   gcc  
i386         buildonly-randconfig-005-20240417   gcc  
i386         buildonly-randconfig-006-20240417   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240417   clang
i386                  randconfig-002-20240417   gcc  
i386                  randconfig-003-20240417   gcc  
i386                  randconfig-004-20240417   clang
i386                  randconfig-005-20240417   clang
i386                  randconfig-006-20240417   clang
i386                  randconfig-011-20240417   gcc  
i386                  randconfig-012-20240417   gcc  
i386                  randconfig-013-20240417   clang
i386                  randconfig-014-20240417   gcc  
i386                  randconfig-015-20240417   gcc  
i386                  randconfig-016-20240417   clang
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
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
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
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

