Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AA4C54791
	for <ath10k@archiver.kernel.org>; Wed, 13 Mar 2024 04:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DZmOvwW2eYYFWCXdPoVQN1CwnO7gDudmxOnX9neVyTs=; b=kie68xFnWi0NCMNejLT2pxse2W
	nXNTyc+eTfpBkgdLss4iGwNfGFHIYRWawcn7jsWBe0yEKnUT5PF82OVMuMZYIbblBhoa4xdWarNmf
	jLsq9JyxRT/v7vbzADD45gTq4QvUx1Y/ZJAIAShrXC09Y+FQThhDqdQAKsYcSMSbF09JDjZYgCUnf
	+vQmcfIczyEEe0VkFqIXgg30GLry2DlZEQPVeHZyqP8sWfclkG6qVP9J9CnZqavJ2v+dSiXT5etNY
	b20IlpEfF1w9Vw5YDgwTDSP94F0qiFyBn0rWUg+l/duAa2aCeW99EkmXJLf+1SFiHj9hft4/gsZVL
	8KT2wg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkFxt-00000008kkY-0Jey;
	Wed, 13 Mar 2024 04:11:41 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkFxo-00000008kfT-0xOo
	for ath10k@lists.infradead.org;
	Wed, 13 Mar 2024 04:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710303096; x=1741839096;
  h=date:from:to:cc:subject:message-id;
  bh=d5j+H9K8/yCxUNjlbEZrx+tRBW6hGkPnsTDpusTyQqw=;
  b=GyXxxnm14Whp5aZ3XLGUqIRrqNFnfOuwxZbYUdflicoE4RfkPKXdZu8u
   Bijv3nYJZHuSc4IwtI2Qy50iIU8oiN2/xi9Xzp8fpG5QdfBJuemOqyply
   PYQVs/j9zg8/8mJIIqqk3mXXmCTJKjU0z7/GhBEaGvYbMv18Sp/iphqHv
   NEa4ZxMXd3Gq0EdvbYv+cvhDkdDOR8FhtIdakxHJTA19HHJAk4k+oZ6Lt
   si1cQmZKfQI8brYf0JrL3zOpwuNxUMVf7HlFkEjbbAGva8wnIwvDIOMs+
   cQodIjxfRvFj5eAhOotf/9PVq8XofMUZzUeBR06jGgR4o1xgQunDkKMy2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5179798"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5179798"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 21:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="49210276"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Mar 2024 21:11:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkFxi-000BzL-1x;
	Wed, 13 Mar 2024 04:11:30 +0000
Date: Wed, 13 Mar 2024 12:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 01296b39d3515f20a1db64d3c421c592b1e264a0
Message-ID: <202403131200.XLiD0aGT-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_211136_344303_D6F7854E 
X-CRM114-Status: UNSURE (   4.22  )
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
branch HEAD: 01296b39d3515f20a1db64d3c421c592b1e264a0  wifi: ath11k: don't force enable power save on non-running vdevs

elapsed time: 725m

configs tested: 146
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
arc                   randconfig-001-20240313   gcc  
arc                   randconfig-002-20240313   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240313   gcc  
arm                   randconfig-002-20240313   clang
arm                   randconfig-003-20240313   gcc  
arm                   randconfig-004-20240313   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240313   clang
arm64                 randconfig-002-20240313   clang
arm64                 randconfig-003-20240313   clang
arm64                 randconfig-004-20240313   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240313   gcc  
csky                  randconfig-002-20240313   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240313   clang
hexagon               randconfig-002-20240313   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240313   gcc  
i386         buildonly-randconfig-002-20240313   gcc  
i386         buildonly-randconfig-003-20240313   clang
i386         buildonly-randconfig-004-20240313   clang
i386         buildonly-randconfig-005-20240313   clang
i386         buildonly-randconfig-006-20240313   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240313   clang
i386                  randconfig-002-20240313   clang
i386                  randconfig-003-20240313   clang
i386                  randconfig-004-20240313   gcc  
i386                  randconfig-005-20240313   gcc  
i386                  randconfig-006-20240313   clang
i386                  randconfig-011-20240313   gcc  
i386                  randconfig-012-20240313   clang
i386                  randconfig-013-20240313   gcc  
i386                  randconfig-014-20240313   gcc  
i386                  randconfig-015-20240313   clang
i386                  randconfig-016-20240313   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240313   gcc  
loongarch             randconfig-002-20240313   gcc  
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
nios2                 randconfig-001-20240313   gcc  
nios2                 randconfig-002-20240313   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240313   gcc  
parisc                randconfig-002-20240313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240313   gcc  
powerpc               randconfig-002-20240313   gcc  
powerpc               randconfig-003-20240313   clang
powerpc64             randconfig-001-20240313   clang
powerpc64             randconfig-002-20240313   gcc  
powerpc64             randconfig-003-20240313   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240313   clang
riscv                 randconfig-002-20240313   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240313   gcc  
s390                  randconfig-002-20240313   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240313   gcc  
sh                    randconfig-002-20240313   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240313   gcc  
sparc64               randconfig-002-20240313   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240313   gcc  
um                    randconfig-002-20240313   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240313   clang
x86_64       buildonly-randconfig-002-20240313   gcc  
x86_64       buildonly-randconfig-003-20240313   clang
x86_64       buildonly-randconfig-004-20240313   clang
x86_64       buildonly-randconfig-005-20240313   gcc  
x86_64       buildonly-randconfig-006-20240313   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240313   clang
x86_64                randconfig-002-20240313   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240313   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

