Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C83C4332F
	for <ath10k@archiver.kernel.org>; Sat,  4 Nov 2023 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O7EITIbEgOxNb5M9sZilUG5xznwuxB1DRgq4h+GdbpA=; b=q0PgOJ9Z3zcjnS
	DKwAnVL95AdQ8iOW7YDP6kbCElOaTxhvsd6Nt1scVyYKlTYZ2sNxIJH5HKbKxAB53Hx27WmRgihd2
	WJ2SpPUu0irXS/uFV34HBey0WwsQa1EHJraznLcYlv8cx5QOZhV9nugRm9J8nP/D6WWby5W0dLMkm
	stPxXm/9FqAMwpm+dJPAaVTDMxOHKQpC3t4D8IigidHynomRiM+DHfUGmPTHIMayzF13+IZxFZtwC
	O4/d1O4E84MmeL2DLWGbFEzNJZqbQDLg7Wn+Ri/Qt6g1iqJ7/mLjtjXIMqYQ8rV3a6NtjRGDpERWm
	hlPIKdVQb3oOqHccENlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzF7u-00DN49-0E;
	Sat, 04 Nov 2023 11:47:42 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzF7q-00DN3N-0O
	for ath10k@lists.infradead.org;
	Sat, 04 Nov 2023 11:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699098458; x=1730634458;
  h=date:from:to:cc:subject:message-id;
  bh=0FlajTZkKtBohAAHXiY5ax0dxJ22qWB1gbG3OEnzI98=;
  b=kT/M4jo92k1JmC4pAFtmnH2o0xO7mpWsTkga6pv5PlCcGSUDoaBsUNkn
   vvTdUuG5Qsxko1l/o/u9JkuaHZI0eDveFtrNVabMwyzCP1Mi5LzYZ+k9h
   fXed3irq2s6Lfddd93ad5tw9TX3CX3XGWAKLQynSwAuAxBV3Fg+z6qMBI
   3hmSmSWMhR7XL7oGqzIrMHTyzjroJW5vaNMDyjwpz4mXdQFIh7rqpmpXJ
   Uxp6smdVyMXPRjA9+nhtlYB/ZV2orCIUc861C7uGejH4P85nP3UmaMwtT
   2s6ef7XH/pewED14I4c267yTBxeYXxUGRUz0gafHHtoRTFVFGMAJ5Fojo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453381027"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="453381027"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852524938"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="852524938"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2023 04:47:35 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzF7l-0004HT-32;
	Sat, 04 Nov 2023 11:47:33 +0000
Date: Sat, 04 Nov 2023 19:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 1dc1ef6e5d66d2c690950c0335073d2941de7488
Message-ID: <202311041912.4PwdFHMc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_044738_293764_C04F4709 
X-CRM114-Status: UNSURE (   4.65  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 1dc1ef6e5d66d2c690950c0335073d2941de7488  Merge branch 'pending' into master-pending

elapsed time: 5967m

configs tested: 251
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
arc                   randconfig-001-20231031   gcc  
arc                   randconfig-002-20231031   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                   randconfig-001-20231031   gcc  
arm                   randconfig-001-20231101   gcc  
arm                   randconfig-002-20231031   gcc  
arm                   randconfig-002-20231101   gcc  
arm                   randconfig-003-20231031   gcc  
arm                   randconfig-003-20231101   gcc  
arm                   randconfig-004-20231031   gcc  
arm                   randconfig-004-20231101   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231031   gcc  
arm64                 randconfig-001-20231101   gcc  
arm64                 randconfig-002-20231031   gcc  
arm64                 randconfig-002-20231101   gcc  
arm64                 randconfig-003-20231031   gcc  
arm64                 randconfig-003-20231101   gcc  
arm64                 randconfig-004-20231031   gcc  
arm64                 randconfig-004-20231101   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231031   gcc  
csky                  randconfig-002-20231031   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231031   gcc  
i386         buildonly-randconfig-001-20231101   gcc  
i386         buildonly-randconfig-002-20231031   gcc  
i386         buildonly-randconfig-002-20231101   gcc  
i386         buildonly-randconfig-003-20231031   gcc  
i386         buildonly-randconfig-003-20231101   gcc  
i386         buildonly-randconfig-004-20231031   gcc  
i386         buildonly-randconfig-004-20231101   gcc  
i386         buildonly-randconfig-005-20231031   gcc  
i386         buildonly-randconfig-005-20231101   gcc  
i386         buildonly-randconfig-006-20231031   gcc  
i386         buildonly-randconfig-006-20231101   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231031   gcc  
i386                  randconfig-001-20231101   gcc  
i386                  randconfig-002-20231031   gcc  
i386                  randconfig-002-20231101   gcc  
i386                  randconfig-003-20231031   gcc  
i386                  randconfig-003-20231101   gcc  
i386                  randconfig-004-20231031   gcc  
i386                  randconfig-004-20231101   gcc  
i386                  randconfig-005-20231031   gcc  
i386                  randconfig-005-20231101   gcc  
i386                  randconfig-006-20231031   gcc  
i386                  randconfig-006-20231101   gcc  
i386                  randconfig-011-20231031   gcc  
i386                  randconfig-011-20231101   gcc  
i386                  randconfig-012-20231031   gcc  
i386                  randconfig-012-20231101   gcc  
i386                  randconfig-013-20231031   gcc  
i386                  randconfig-013-20231101   gcc  
i386                  randconfig-014-20231031   gcc  
i386                  randconfig-014-20231101   gcc  
i386                  randconfig-015-20231031   gcc  
i386                  randconfig-015-20231101   gcc  
i386                  randconfig-016-20231031   gcc  
i386                  randconfig-016-20231101   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231031   gcc  
loongarch             randconfig-002-20231031   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231031   gcc  
nios2                 randconfig-001-20231101   gcc  
nios2                 randconfig-002-20231031   gcc  
nios2                 randconfig-002-20231101   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231031   gcc  
parisc                randconfig-001-20231101   gcc  
parisc                randconfig-002-20231031   gcc  
parisc                randconfig-002-20231101   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc               randconfig-001-20231031   gcc  
powerpc               randconfig-001-20231101   gcc  
powerpc               randconfig-002-20231031   gcc  
powerpc               randconfig-002-20231101   gcc  
powerpc               randconfig-003-20231031   gcc  
powerpc               randconfig-003-20231101   gcc  
powerpc64             randconfig-001-20231031   gcc  
powerpc64             randconfig-001-20231101   gcc  
powerpc64             randconfig-002-20231031   gcc  
powerpc64             randconfig-002-20231101   gcc  
powerpc64             randconfig-003-20231031   gcc  
powerpc64             randconfig-003-20231101   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231031   gcc  
riscv                 randconfig-001-20231101   gcc  
riscv                 randconfig-002-20231031   gcc  
riscv                 randconfig-002-20231101   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231031   gcc  
s390                  randconfig-001-20231101   gcc  
s390                  randconfig-002-20231031   gcc  
s390                  randconfig-002-20231101   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20231101   gcc  
sh                    randconfig-002-20231101   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231101   gcc  
sparc                 randconfig-002-20231101   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231101   gcc  
sparc64               randconfig-002-20231101   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231101   gcc  
um                    randconfig-002-20231101   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231031   gcc  
x86_64       buildonly-randconfig-001-20231101   gcc  
x86_64       buildonly-randconfig-002-20231031   gcc  
x86_64       buildonly-randconfig-002-20231101   gcc  
x86_64       buildonly-randconfig-003-20231031   gcc  
x86_64       buildonly-randconfig-003-20231101   gcc  
x86_64       buildonly-randconfig-004-20231031   gcc  
x86_64       buildonly-randconfig-004-20231101   gcc  
x86_64       buildonly-randconfig-005-20231031   gcc  
x86_64       buildonly-randconfig-005-20231101   gcc  
x86_64       buildonly-randconfig-006-20231031   gcc  
x86_64       buildonly-randconfig-006-20231101   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231031   gcc  
x86_64                randconfig-001-20231101   gcc  
x86_64                randconfig-002-20231031   gcc  
x86_64                randconfig-002-20231101   gcc  
x86_64                randconfig-003-20231031   gcc  
x86_64                randconfig-003-20231101   gcc  
x86_64                randconfig-004-20231031   gcc  
x86_64                randconfig-004-20231101   gcc  
x86_64                randconfig-005-20231031   gcc  
x86_64                randconfig-005-20231101   gcc  
x86_64                randconfig-006-20231031   gcc  
x86_64                randconfig-006-20231101   gcc  
x86_64                randconfig-011-20231031   gcc  
x86_64                randconfig-011-20231101   gcc  
x86_64                randconfig-012-20231031   gcc  
x86_64                randconfig-012-20231101   gcc  
x86_64                randconfig-013-20231031   gcc  
x86_64                randconfig-013-20231101   gcc  
x86_64                randconfig-014-20231031   gcc  
x86_64                randconfig-014-20231101   gcc  
x86_64                randconfig-015-20231031   gcc  
x86_64                randconfig-015-20231101   gcc  
x86_64                randconfig-016-20231031   gcc  
x86_64                randconfig-016-20231101   gcc  
x86_64                randconfig-071-20231031   gcc  
x86_64                randconfig-071-20231101   gcc  
x86_64                randconfig-072-20231031   gcc  
x86_64                randconfig-072-20231101   gcc  
x86_64                randconfig-073-20231031   gcc  
x86_64                randconfig-073-20231101   gcc  
x86_64                randconfig-074-20231031   gcc  
x86_64                randconfig-074-20231101   gcc  
x86_64                randconfig-075-20231031   gcc  
x86_64                randconfig-075-20231101   gcc  
x86_64                randconfig-076-20231031   gcc  
x86_64                randconfig-076-20231101   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231101   gcc  
xtensa                randconfig-002-20231101   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
