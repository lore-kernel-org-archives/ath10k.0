Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB34C4828F
	for <ath10k@archiver.kernel.org>; Thu,  8 Feb 2024 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6BuP0DxdYlg3Db7BpwEfEX5YUCCjruqZadykqUt4PcM=; b=YTH8VCpY8LOYhRkoe0GFk/zQKu
	4C/6EBKY4DxMksfRREKuNK0rE9bEtCn48MrAi/dFkubki+upeOErZub24NHUnPNrD6F6Lh5VaCqzJ
	joLWeresIDYbB2oyFSXRBNimklWcDav3qUJB+s88o8w9IBUV9sWoH3QaiC3k2Mj7/INqjrkrQOzAE
	xVO8aAuHsMa1Ku9vjqsYFPYVlwfOMTEnXvF5EuL61xvrB2I0oYbwFNJePYz4l93XfsUnClDxeOupr
	lp1BGYxICFyw5EIaeg47PeriJOxhNMCARXcFF2LdiAcoXxUv3mZKs9XzlZ2XB8P4aQknVfE/uepzW
	TLACpepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY6d4-0000000ED0k-1tTh;
	Thu, 08 Feb 2024 15:47:58 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY6d1-0000000ED0Q-1YPU
	for ath10k@lists.infradead.org;
	Thu, 08 Feb 2024 15:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707407275; x=1738943275;
  h=date:from:to:cc:subject:message-id;
  bh=RZ5UJD3hn2fSRRlbiNjcLUR/l56QfePEMGUGsoLu9cE=;
  b=X9v8Ut1P3OjamzqKWO85+0pp8lX6vSod+i5Aw17eIPFXKDrM6vwUnA1n
   x7GAuZdnvqTi6a5j40Yh2pyQPLJvs4j66tniqE2KonO0JewFBwRlmNZlY
   QM5WM7oP9sWULGKpY2gaaCIbkoISUnu5p/7ROdrBkc0+cQTP/FXR8fOpl
   xCNy3HmhxW7DLOlurZorv3f/L7l1yrf1yzo5qy4/4HsGOpBttfq6iyN11
   foQ90oegYcyMghNMjJ0QVfidF2xAG/iisO8bw0w2QMEMDKhv3ygXAP+Dx
   TFwpAAbznleiw+vk3WYoe+aNxEzG/KMoVfZ5JrcWZdDJjXXTbwYpijXgD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1134381"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1134381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 07:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1991337"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2024 07:47:45 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY6co-0003s2-2f;
	Thu, 08 Feb 2024 15:47:42 +0000
Date: Thu, 08 Feb 2024 23:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 55d00089a9273fd859b411055aba7409353a75ea
Message-ID: <202402082333.m1gHZQX5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_074755_446270_548C1A72 
X-CRM114-Status: UNSURE (   3.95  )
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
branch HEAD: 55d00089a9273fd859b411055aba7409353a75ea  Add localversion-wireless-testing-ath

elapsed time: 1454m

configs tested: 162
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
arc                   randconfig-001-20240208   gcc  
arc                   randconfig-002-20240208   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240208   gcc  
arm                   randconfig-002-20240208   gcc  
arm                   randconfig-003-20240208   gcc  
arm                   randconfig-004-20240208   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240208   clang
arm64                 randconfig-002-20240208   clang
arm64                 randconfig-003-20240208   clang
arm64                 randconfig-004-20240208   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240208   gcc  
csky                  randconfig-002-20240208   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240208   clang
hexagon               randconfig-002-20240208   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240208   gcc  
i386         buildonly-randconfig-002-20240208   clang
i386         buildonly-randconfig-003-20240208   gcc  
i386         buildonly-randconfig-004-20240208   gcc  
i386         buildonly-randconfig-005-20240208   gcc  
i386         buildonly-randconfig-006-20240208   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240208   gcc  
i386                  randconfig-002-20240208   gcc  
i386                  randconfig-003-20240208   gcc  
i386                  randconfig-004-20240208   clang
i386                  randconfig-005-20240208   gcc  
i386                  randconfig-006-20240208   gcc  
i386                  randconfig-011-20240208   clang
i386                  randconfig-012-20240208   clang
i386                  randconfig-013-20240208   clang
i386                  randconfig-014-20240208   clang
i386                  randconfig-015-20240208   clang
i386                  randconfig-016-20240208   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240208   gcc  
loongarch             randconfig-002-20240208   gcc  
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
nios2                 randconfig-001-20240208   gcc  
nios2                 randconfig-002-20240208   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240208   gcc  
parisc                randconfig-002-20240208   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240208   clang
powerpc               randconfig-002-20240208   gcc  
powerpc               randconfig-003-20240208   gcc  
powerpc64             randconfig-001-20240208   gcc  
powerpc64             randconfig-002-20240208   gcc  
powerpc64             randconfig-003-20240208   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240208   gcc  
riscv                 randconfig-002-20240208   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240208   clang
s390                  randconfig-002-20240208   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240208   gcc  
sh                    randconfig-002-20240208   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240208   gcc  
sparc64               randconfig-002-20240208   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240208   clang
um                    randconfig-002-20240208   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240208   clang
x86_64       buildonly-randconfig-002-20240208   clang
x86_64       buildonly-randconfig-003-20240208   gcc  
x86_64       buildonly-randconfig-004-20240208   clang
x86_64       buildonly-randconfig-005-20240208   clang
x86_64       buildonly-randconfig-006-20240208   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240208   gcc  
x86_64                randconfig-002-20240208   gcc  
x86_64                randconfig-003-20240208   gcc  
x86_64                randconfig-004-20240208   clang
x86_64                randconfig-005-20240208   gcc  
x86_64                randconfig-006-20240208   gcc  
x86_64                randconfig-011-20240208   gcc  
x86_64                randconfig-012-20240208   gcc  
x86_64                randconfig-013-20240208   clang
x86_64                randconfig-014-20240208   clang
x86_64                randconfig-015-20240208   clang
x86_64                randconfig-016-20240208   clang
x86_64                randconfig-071-20240208   clang
x86_64                randconfig-072-20240208   clang
x86_64                randconfig-073-20240208   gcc  
x86_64                randconfig-074-20240208   clang
x86_64                randconfig-075-20240208   gcc  
x86_64                randconfig-076-20240208   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240208   gcc  
xtensa                randconfig-002-20240208   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

