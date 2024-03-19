Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F6CC54E60
	for <ath10k@archiver.kernel.org>; Tue, 19 Mar 2024 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PfnlJ1rqvQQnhOjS9++O3B8RXTWEeU94QT4khC0jGC8=; b=40vpWJZaRUckUTiDl9WNgo/NDs
	ux07ULjFkfz75QM++IKi0fSekt4tcqKmYg2RNxHIwBDTDurv8UCuWnjxk0ct4JFQqKMK2V2g2VvQc
	Sk4AwrAtZljzHz1oFdkhsYdRtwmdx3f9kjyh9fpnLfkfwvXrKsDBPw5nZr8efQn0yfSAGQHPMswdG
	Hp9Orm1Rw3U9h8WlBKbjREOaBqiJqs3+WjY7mMBnfzbBPOaI3X5fvS8AmDrPycr3TePxRDvQ9hJrV
	4ANqyp1zfo8Lo/wUR2ulGBrALs12ofLQdCoxtTiFGqP4rCvPS3h2lMfTTt9KduXFaQ+SvPUpwy9cT
	XdNLfvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXBy-0000000COwG-3KDU;
	Tue, 19 Mar 2024 10:59:38 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXBv-0000000COvW-31xZ
	for ath10k@lists.infradead.org;
	Tue, 19 Mar 2024 10:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710845975; x=1742381975;
  h=date:from:to:cc:subject:message-id;
  bh=fRug8na6XhJbh+0ELMfyqTiBYbOfxByvWkSafSaxnrI=;
  b=mlv0MilkRxM3uRDq+NZiJaO9QFYPJD1L92bsZU00a/yLjtH2FDFRUh0H
   w/IgTkHF8Lj8bJimanag3oBYtQU2EqPrNByZHGW0SYVY6XWSEcP849E2D
   P2aIgkzSmPt9THjPPmiNsH1w38trt6WKyEuQrswDjC22rq7FmJuld5OKv
   VH2IA6o8km1GhbC3STyAveczZ4bb8lDM42y8vdveP+kbe1KKRX++5VP2F
   42lfwdxd2EDriCzNYGYf3nATiCAMlL8ite7Btd89i8woicQjTwUKuwYlu
   Cj30PSPu+gQRT5xAVH457uJRN8MdkeVfGmT7yALbXad8KE71x1StunnD0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5572105"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="5572105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 03:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="14156261"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Mar 2024 03:59:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmXBp-000Hhx-1A;
	Tue, 19 Mar 2024 10:59:29 +0000
Date: Tue, 19 Mar 2024 18:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 c4ade6bdf3d1a2d9d05606a85431f154559d5a80
Message-ID: <202403191828.u4UogFe7-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_035935_848643_AB170F7D 
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: c4ade6bdf3d1a2d9d05606a85431f154559d5a80  wifi: ath12k: use correct flag field for 320 MHz channels

elapsed time: 956m

configs tested: 175
configs skipped: 5

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
arc                   randconfig-001-20240319   gcc  
arc                   randconfig-002-20240319   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                       multi_v4t_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240319   clang
arm                   randconfig-002-20240319   gcc  
arm                   randconfig-003-20240319   clang
arm                   randconfig-004-20240319   clang
arm                        realview_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240319   gcc  
arm64                 randconfig-002-20240319   clang
arm64                 randconfig-003-20240319   clang
arm64                 randconfig-004-20240319   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240319   gcc  
csky                  randconfig-002-20240319   gcc  
hexagon                          alldefconfig   clang
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240319   clang
hexagon               randconfig-002-20240319   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240319   clang
i386         buildonly-randconfig-002-20240319   clang
i386         buildonly-randconfig-003-20240319   clang
i386         buildonly-randconfig-004-20240319   clang
i386         buildonly-randconfig-005-20240319   gcc  
i386         buildonly-randconfig-006-20240319   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240319   clang
i386                  randconfig-002-20240319   clang
i386                  randconfig-003-20240319   clang
i386                  randconfig-004-20240319   clang
i386                  randconfig-005-20240319   clang
i386                  randconfig-006-20240319   gcc  
i386                  randconfig-011-20240319   gcc  
i386                  randconfig-012-20240319   clang
i386                  randconfig-013-20240319   gcc  
i386                  randconfig-016-20240319   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240319   gcc  
loongarch             randconfig-002-20240319   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                  decstation_64_defconfig   gcc  
mips                            gpr_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240319   gcc  
nios2                 randconfig-002-20240319   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240319   gcc  
parisc                randconfig-002-20240319   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240319   gcc  
powerpc               randconfig-002-20240319   clang
powerpc               randconfig-003-20240319   clang
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240319   gcc  
powerpc64             randconfig-002-20240319   clang
powerpc64             randconfig-003-20240319   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240319   gcc  
riscv                 randconfig-002-20240319   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240319   gcc  
s390                  randconfig-002-20240319   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240319   gcc  
sh                    randconfig-002-20240319   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240319   gcc  
sparc64               randconfig-002-20240319   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240319   gcc  
um                    randconfig-002-20240319   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240319   clang
x86_64       buildonly-randconfig-002-20240319   clang
x86_64       buildonly-randconfig-003-20240319   clang
x86_64       buildonly-randconfig-004-20240319   clang
x86_64       buildonly-randconfig-005-20240319   clang
x86_64       buildonly-randconfig-006-20240319   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240319   clang
x86_64                randconfig-002-20240319   clang
x86_64                randconfig-003-20240319   clang
x86_64                randconfig-004-20240319   gcc  
x86_64                randconfig-005-20240319   gcc  
x86_64                randconfig-006-20240319   gcc  
x86_64                randconfig-011-20240319   clang
x86_64                randconfig-012-20240319   clang
x86_64                randconfig-013-20240319   gcc  
x86_64                randconfig-014-20240319   gcc  
x86_64                randconfig-015-20240319   clang
x86_64                randconfig-016-20240319   clang
x86_64                randconfig-071-20240319   gcc  
x86_64                randconfig-072-20240319   clang
x86_64                randconfig-073-20240319   gcc  
x86_64                randconfig-074-20240319   clang
x86_64                randconfig-075-20240319   clang
x86_64                randconfig-076-20240319   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240319   gcc  
xtensa                randconfig-002-20240319   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

