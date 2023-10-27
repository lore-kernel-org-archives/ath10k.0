Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C764DC25B47
	for <ath10k@archiver.kernel.org>; Fri, 27 Oct 2023 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vAqQYwFOOpmHLi4OGykIxEmBTztAHzMk4b5TqK2dIyQ=; b=BC7utPXlrcngHR
	VPlT/fF3i+cTc3rCS992gNXdnQYYZTvd20lj+6bk7MGQ2NsrQZEGE3qayJI24lXIrtmSoxVU67D1d
	vIouhRRi/7K5T9ujO32LwgWt6qXnOoxlzAK0r6511yYifxz9B50KFF5xpQ/9qU79rKfY3HAo9231c
	kUpbsOHWYVono4sB3b059nhl7WdnNb5al5lGAUILwc9sOX9oatw4kzqE5vrlDqVKbZdEUopJMWKEW
	ttuL9Fv2rWmza5lzVFyJ+EokLB0U219SFR8D8q6nSwPYHtt2yKjeD0Hymo+qM4AMo69DawLcMk5if
	CxWUC1K3bYkN4TQoYzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwROR-00GvlY-2n;
	Fri, 27 Oct 2023 18:17:11 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwROM-00GvjF-1y
	for ath10k@lists.infradead.org;
	Fri, 27 Oct 2023 18:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698430627; x=1729966627;
  h=date:from:to:cc:subject:message-id;
  bh=JqxBBhNc649csPQz+iqFM8CjtwT3o45+VyIfe9KNyV8=;
  b=Vqo+I0psQGoNnBxFs3aogPmnEUd/QLN9juJd6aZ9YkXtfZ8Q8RRT7ChB
   CplQsAYZXZxgW5UAqu5KmRpoT7wMsotkZLvvhygmcSRWbB4GBqOfFOfSU
   zXo2hNRYsAEUnVaQZbNIZZgeiL295IjTVxMgqkHzIrsyZoHvohg5E1gio
   lJywt5KK8ZUI3maG0HeRWTJBFIJUZlN3rPtU0FCaow+UowMlpBrpg6n+U
   QfAB2GHhSkz5q8O2s0NxvPidE5CYkxBkixodGbO0c5JFTFJ2LqjI6hmUV
   VWZZyOrBp2R5Mlpw6MN5B8dInO0b18uta1vBWGT6X1Xg5WNoHk+FddtKy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="654311"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="654311"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 11:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763303991"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="763303991"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Oct 2023 11:16:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwRO7-000B6t-1w;
	Fri, 27 Oct 2023 18:16:51 +0000
Date: Sat, 28 Oct 2023 02:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 3ca28692ed8a911f6fcd8151ca706ac5d38077d4
Message-ID: <202310280256.FNtEtkuN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_111706_721051_0993FF9A 
X-CRM114-Status: UNSURE (   4.01  )
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
branch HEAD: 3ca28692ed8a911f6fcd8151ca706ac5d38077d4  wifi: ath10k: replace deprecated strncpy with memcpy

elapsed time: 2890m

configs tested: 128
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
arc                   randconfig-001-20231026   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231026   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                              allnoconfig   gcc  
i386         buildonly-randconfig-001-20231026   gcc  
i386         buildonly-randconfig-002-20231026   gcc  
i386         buildonly-randconfig-003-20231026   gcc  
i386         buildonly-randconfig-004-20231026   gcc  
i386         buildonly-randconfig-005-20231026   gcc  
i386         buildonly-randconfig-006-20231026   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231026   gcc  
i386                  randconfig-002-20231026   gcc  
i386                  randconfig-003-20231026   gcc  
i386                  randconfig-004-20231026   gcc  
i386                  randconfig-005-20231026   gcc  
i386                  randconfig-006-20231026   gcc  
i386                  randconfig-011-20231026   gcc  
i386                  randconfig-012-20231026   gcc  
i386                  randconfig-013-20231026   gcc  
i386                  randconfig-014-20231026   gcc  
i386                  randconfig-015-20231026   gcc  
i386                  randconfig-016-20231026   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231026   gcc  
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
riscv                 randconfig-001-20231026   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231026   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231026   gcc  
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
x86_64       buildonly-randconfig-001-20231026   gcc  
x86_64       buildonly-randconfig-002-20231026   gcc  
x86_64       buildonly-randconfig-003-20231026   gcc  
x86_64       buildonly-randconfig-004-20231026   gcc  
x86_64       buildonly-randconfig-005-20231026   gcc  
x86_64       buildonly-randconfig-006-20231026   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231026   gcc  
x86_64                randconfig-002-20231026   gcc  
x86_64                randconfig-003-20231026   gcc  
x86_64                randconfig-004-20231026   gcc  
x86_64                randconfig-005-20231026   gcc  
x86_64                randconfig-006-20231026   gcc  
x86_64                randconfig-011-20231026   gcc  
x86_64                randconfig-012-20231026   gcc  
x86_64                randconfig-013-20231026   gcc  
x86_64                randconfig-014-20231026   gcc  
x86_64                randconfig-015-20231026   gcc  
x86_64                randconfig-016-20231026   gcc  
x86_64                randconfig-071-20231026   gcc  
x86_64                randconfig-072-20231026   gcc  
x86_64                randconfig-073-20231026   gcc  
x86_64                randconfig-074-20231026   gcc  
x86_64                randconfig-075-20231026   gcc  
x86_64                randconfig-076-20231026   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
