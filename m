Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE8DCDB465
	for <ath10k@archiver.kernel.org>; Thu, 19 Oct 2023 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Oksw2FUATa2U3w9efoZDccLXUxsB/PoJYYB1HLizszc=; b=dBJobekkgvPmVi
	qw4Bn+UzuwbAMChG4Nlx1I3lWPUrlrfWAs7pEUV89eDd5DEYD8Dxi2Atla6740swDs/tNYe0y9Uk3
	rcl0BTZRMy64exh2pFkOAwOtPiaPJWSHJTIsQJBCDSVBjpkFh3Yu5rxShtHYawkZnJEp5YBQWviIh
	uhC95/VAK0cPRkL1cPo+gWgLRPDJK6xlJcB2mnENsJ7B9N48497KBtK80BMz/FpNqG21REjU+ZUnE
	XJmkrx6fqTfGg+CgXR3D2yQMPo1tEXBgZMzhZ6a6L75b8riWeKKW709ZS0zL5ChLQVuLCSIQlOhfB
	QYDeGD+qK/L2lbyvZp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtOO0-00GiFb-2a;
	Thu, 19 Oct 2023 08:28:08 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtONx-00GiEt-2M
	for ath10k@lists.infradead.org;
	Thu, 19 Oct 2023 08:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697704085; x=1729240085;
  h=date:from:to:cc:subject:message-id;
  bh=FXUnv8v1bIVKyIT/UrzrGY1BqmIQFH9pGhz3ZMDyaQA=;
  b=Y5AbKPpqsc5jL+ZbYKiBuNwnWg+CcPuqVsielhg5GVHjzO180RoavUwC
   9L2V//oxv+4Wqhi21fLIZzcfhDzvajElr1gXVDZmbe4rGGFZdnU/o2AtO
   /xHXdZ7JnMKe16f9/jOghHFAFS/Nl9vSVBcnq7cZ4q/IKil5/yG393eoM
   nAEJ4JScjlqH33QLTE89Nk2/eRuMcM5kTyJEktVrUMRYJJ7LAY9ynUJHK
   SANNLWgj2Cf3c5leZ0fGZb30ip/GZLnsaOa9rhfkewgOfkaVdXaGpwMF1
   HafYcFvgpHqefW4d5PfUkhQNRosmF4xROrn/lItkij8cbo1j/FConhEgU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="4795959"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4795959"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="756929777"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="756929777"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Oct 2023 01:28:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtONq-0001rb-1y;
	Thu, 19 Oct 2023 08:27:58 +0000
Date: Thu, 19 Oct 2023 16:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 91bc2f15a1b8c38ddbc1ea400dcd4bbd3639d22b
Message-ID: <202310191603.ywmVXNu1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_012805_806694_19F4B91F 
X-CRM114-Status: UNSURE (   5.62  )
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
branch HEAD: 91bc2f15a1b8c38ddbc1ea400dcd4bbd3639d22b  Merge branch 'ath-next' into ath-qca

elapsed time: 1429m

configs tested: 135
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
arc                   randconfig-001-20231018   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231018   gcc  
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
i386         buildonly-randconfig-001-20231019   gcc  
i386         buildonly-randconfig-002-20231019   gcc  
i386         buildonly-randconfig-003-20231019   gcc  
i386         buildonly-randconfig-004-20231019   gcc  
i386         buildonly-randconfig-005-20231019   gcc  
i386         buildonly-randconfig-006-20231019   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231018   gcc  
i386                  randconfig-002-20231018   gcc  
i386                  randconfig-003-20231018   gcc  
i386                  randconfig-004-20231018   gcc  
i386                  randconfig-005-20231018   gcc  
i386                  randconfig-006-20231018   gcc  
i386                  randconfig-011-20231019   gcc  
i386                  randconfig-012-20231019   gcc  
i386                  randconfig-013-20231019   gcc  
i386                  randconfig-014-20231019   gcc  
i386                  randconfig-015-20231019   gcc  
i386                  randconfig-016-20231019   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231018   gcc  
loongarch             randconfig-001-20231019   gcc  
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
riscv                 randconfig-001-20231018   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231018   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231018   gcc  
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
x86_64       buildonly-randconfig-001-20231018   gcc  
x86_64       buildonly-randconfig-002-20231018   gcc  
x86_64       buildonly-randconfig-003-20231018   gcc  
x86_64       buildonly-randconfig-004-20231018   gcc  
x86_64       buildonly-randconfig-005-20231018   gcc  
x86_64       buildonly-randconfig-006-20231018   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231018   gcc  
x86_64                randconfig-002-20231018   gcc  
x86_64                randconfig-003-20231018   gcc  
x86_64                randconfig-004-20231018   gcc  
x86_64                randconfig-005-20231018   gcc  
x86_64                randconfig-006-20231018   gcc  
x86_64                randconfig-011-20231019   gcc  
x86_64                randconfig-012-20231019   gcc  
x86_64                randconfig-013-20231019   gcc  
x86_64                randconfig-014-20231019   gcc  
x86_64                randconfig-015-20231019   gcc  
x86_64                randconfig-016-20231019   gcc  
x86_64                randconfig-071-20231019   gcc  
x86_64                randconfig-072-20231019   gcc  
x86_64                randconfig-073-20231019   gcc  
x86_64                randconfig-074-20231019   gcc  
x86_64                randconfig-075-20231019   gcc  
x86_64                randconfig-076-20231019   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
