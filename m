Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D08C25B75
	for <ath10k@archiver.kernel.org>; Thu, 16 May 2024 01:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zahoDnUXOX/zY3y++BaCkXmTwOKfwTzaNN3aGeD707Y=; b=C+0JdhXqtV2yxYyJlFD7JhXoxv
	VsVXZv+hqt1HR8czLBAkCIzc/Z1Qbv/QsLRKp1MMMFgH3hTt9ehfE+YDf3xLxmyrbg0qxgSJSWRDg
	E+R4uqIDLReE+SIguv66UvUp79odw5dckiKdRVVdMS5hLTeIoqwovNlQVx2kZUvg6UApyoP1mQfOE
	XPLfRqKG9V0pJVCJutXOsR3SqZ9V7v72wEA9AWuD/APTmF7UeZBNYbYU9w5V8irxFeMB6Oh4mA7l9
	8SB63Y6QLkCP0K8rannF7rF3pDgt2mUQp4q60fB0o/QChijvkm8VDTunq6WR2rchCBUn9vdMqljuY
	VavKUM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Pu5-00000003N0R-0rG7;
	Thu, 16 May 2024 01:27:29 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Pu2-00000003MzB-28Jw
	for ath10k@lists.infradead.org;
	Thu, 16 May 2024 01:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715822846; x=1747358846;
  h=date:from:to:cc:subject:message-id;
  bh=RLiL4hhXGSGoSEnQx5aqbYsEVGQrZv/IpF2g6KihqT0=;
  b=K+ifYCtSK3xEJzPthhy+WuOzqA8BUbyLoarFlN2yCrL8jVvDNwyelE6K
   HQSkNgXsw89DMZtgNwlisbVlLcb7sgjhdDhRsg9vJsxUnQ4wi4m5CiN34
   Sol1pljedOYi91sUSaWPgbAIa1mgZ73/I7hHQZSfpjYkStnG0907TFMDO
   CO916IsIrSTlfoWCdXC9MMM4eXOWsl/D/wgjOnjxMfvownVWp15+ta+qH
   8/iIrQayuXRyvbEmKFL6+yJPJIW1LOrbNJknlBSS53R7sYwMuKsQfQrSt
   xsoDGJQaYY2olUOgbvnUv5+9AKhMf0w+/f6/cXst7mzUiwcLGXqpr+KOn
   w==;
X-CSE-ConnectionGUID: jvtvztffSE2u8edDN/reWw==
X-CSE-MsgGUID: HuQN6Xd5T9OvQ3WWpW8MVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11547071"
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="11547071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 18:27:19 -0700
X-CSE-ConnectionGUID: C6VEb8v8T5SGHeGeytXuZQ==
X-CSE-MsgGUID: iPjQG3baSm6nXgci0LVRXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,163,1712646000"; 
   d="scan'208";a="35701305"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2024 18:27:18 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7Ptr-000DRr-2O;
	Thu, 16 May 2024 01:27:15 +0000
Date: Thu, 16 May 2024 09:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 9f985d1a9549cb8eb19fd2178798dd6f3590802d
Message-ID: <202405160953.QQwLFspR-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_182726_622855_9AAFD375 
X-CRM114-Status: UNSURE (   3.76  )
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
branch HEAD: 9f985d1a9549cb8eb19fd2178798dd6f3590802d  Merge branch 'pending' into master-pending

elapsed time: 738m

configs tested: 139
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
arc                   randconfig-001-20240516   gcc  
arc                   randconfig-002-20240516   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240516   gcc  
arm                   randconfig-002-20240516   clang
arm                   randconfig-003-20240516   gcc  
arm                   randconfig-004-20240516   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240516   gcc  
arm64                 randconfig-002-20240516   clang
arm64                 randconfig-003-20240516   clang
arm64                 randconfig-004-20240516   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240516   gcc  
csky                  randconfig-002-20240516   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240516   clang
hexagon               randconfig-002-20240516   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240516   clang
i386         buildonly-randconfig-002-20240516   clang
i386         buildonly-randconfig-003-20240516   clang
i386         buildonly-randconfig-004-20240516   gcc  
i386         buildonly-randconfig-005-20240516   gcc  
i386         buildonly-randconfig-006-20240516   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240516   gcc  
i386                  randconfig-002-20240516   gcc  
i386                  randconfig-003-20240516   clang
i386                  randconfig-004-20240516   clang
i386                  randconfig-005-20240516   clang
i386                  randconfig-006-20240516   clang
i386                  randconfig-011-20240516   gcc  
i386                  randconfig-012-20240516   gcc  
i386                  randconfig-013-20240516   clang
i386                  randconfig-014-20240516   gcc  
i386                  randconfig-015-20240516   gcc  
i386                  randconfig-016-20240516   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240516   gcc  
loongarch             randconfig-002-20240516   gcc  
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
nios2                 randconfig-001-20240516   gcc  
nios2                 randconfig-002-20240516   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240516   gcc  
parisc                randconfig-002-20240516   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240516   gcc  
powerpc               randconfig-002-20240516   clang
powerpc               randconfig-003-20240516   clang
powerpc64             randconfig-001-20240516   gcc  
powerpc64             randconfig-002-20240516   clang
powerpc64             randconfig-003-20240516   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240516   gcc  
riscv                 randconfig-002-20240516   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240516   gcc  
s390                  randconfig-002-20240516   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240516   gcc  
sh                    randconfig-002-20240516   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240516   gcc  
sparc64               randconfig-002-20240516   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240516   clang
um                    randconfig-002-20240516   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240516   gcc  
xtensa                randconfig-002-20240516   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

