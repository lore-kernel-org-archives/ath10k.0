Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3832C07CA9
	for <ath10k@archiver.kernel.org>; Thu, 30 Nov 2023 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rx0xnJ8VTUqSoXOMvNR7kKTrm3WF1qH2lWIsanIEWD0=; b=zQCZO92owzF+KM9DU706+xJECF
	dWq5VygAwY1iaUI/1y9Dbwcy042krPfff5ukmvchulISDcZ3DzTpoe5U78A4mFOpZrX5Xhyzmrdb9
	GzX1n2oLQcr7lg8BBhhnzoiiACMyUI4lqkOro7PHpQ6ZIYzJ0fo4zQnW5cEvNbe89OWBZQBUhdXXn
	QymhwxbC+x+8FGasJ0uGNOSqip0x7hWRWD5TD3P+EzZzL57+UwlcWWteiL8wQ6ZD4uKNT76JN81LY
	/n9UT2EoUvbQ8ofAbHvWxxqMTBcDKpQJRg2ge9ThECPMEo0aBQSVReEj8QuFuFjG4eelNGtTBr5g5
	PgNuskzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gGE-00AsAs-1P;
	Thu, 30 Nov 2023 12:35:18 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8gGA-00As95-2w
	for ath10k@lists.infradead.org;
	Thu, 30 Nov 2023 12:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701347715; x=1732883715;
  h=date:from:to:cc:subject:message-id;
  bh=3PAmqHMpsDGL7SinuGDrGQbkJriJpehMnhNXgz9WwhM=;
  b=UO5/hSG7Y0D+0bJ2o7aLyHy0okRySmavMggdF4GEK0Q/YyiW78dc57OA
   TfV59C07SyYK5wCpE/DSY4+6q2qeB8kdZX1iYTuFR+GLUs8eH+8zT3cdc
   5ZXTAgdQpE6Cj4hjjcTi83HNS2oH2fnlV89v7NJYGGXlt65gVv/uy4ql1
   5AqWzp7u46RuNGyVgN7/UgU6AUHOof5TasiVWPv86v4XI3LzMAB51Dtzb
   1FUsXydBaFmHuorSVSUmYH+/UN48mvc+lCp44hSphvkMrcqSurPx10M5p
   rMjy7w12nf5l+GGRXjhs0sy2vfQD+YfzZ6YEA5aYyoeEplxFIqe7tOfrK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="14867147"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="14867147"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:35:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="798270263"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="798270263"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Nov 2023 04:35:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8gG3-0001v6-1m;
	Thu, 30 Nov 2023 12:35:07 +0000
Date: Thu, 30 Nov 2023 20:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 612679e4e9fe3f6ba9f89f35ea2fe9ac58df02e4
Message-ID: <202311302055.6wuQZ0J5-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_043514_963168_6329F1F4 
X-CRM114-Status: UNSURE (   4.67  )
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
branch HEAD: 612679e4e9fe3f6ba9f89f35ea2fe9ac58df02e4  Merge branch 'pending' into master-pending

elapsed time: 1472m

configs tested: 280
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
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231129   gcc  
arc                   randconfig-001-20231130   gcc  
arc                   randconfig-002-20231129   gcc  
arc                   randconfig-002-20231130   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                   randconfig-001-20231129   gcc  
arm                   randconfig-001-20231130   gcc  
arm                   randconfig-002-20231129   gcc  
arm                   randconfig-002-20231130   gcc  
arm                   randconfig-003-20231129   gcc  
arm                   randconfig-003-20231130   gcc  
arm                   randconfig-004-20231129   gcc  
arm                   randconfig-004-20231130   gcc  
arm                        realview_defconfig   gcc  
arm                       spear13xx_defconfig   clang
arm                           stm32_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231129   gcc  
arm64                 randconfig-001-20231130   gcc  
arm64                 randconfig-002-20231129   gcc  
arm64                 randconfig-002-20231130   gcc  
arm64                 randconfig-003-20231129   gcc  
arm64                 randconfig-003-20231130   gcc  
arm64                 randconfig-004-20231129   gcc  
arm64                 randconfig-004-20231130   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231129   gcc  
csky                  randconfig-001-20231130   gcc  
csky                  randconfig-002-20231129   gcc  
csky                  randconfig-002-20231130   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20231129   clang
i386                  randconfig-011-20231130   clang
i386                  randconfig-012-20231129   clang
i386                  randconfig-012-20231130   clang
i386                  randconfig-013-20231129   clang
i386                  randconfig-013-20231130   clang
i386                  randconfig-014-20231129   clang
i386                  randconfig-014-20231130   clang
i386                  randconfig-015-20231129   clang
i386                  randconfig-015-20231130   clang
i386                  randconfig-016-20231129   clang
i386                  randconfig-016-20231130   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231129   gcc  
loongarch             randconfig-001-20231130   gcc  
loongarch             randconfig-002-20231129   gcc  
loongarch             randconfig-002-20231130   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                     loongson1c_defconfig   clang
mips                      loongson3_defconfig   gcc  
mips                          rb532_defconfig   gcc  
mips                           rs90_defconfig   clang
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231129   gcc  
nios2                 randconfig-001-20231130   gcc  
nios2                 randconfig-002-20231129   gcc  
nios2                 randconfig-002-20231130   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231129   gcc  
parisc                randconfig-001-20231130   gcc  
parisc                randconfig-002-20231129   gcc  
parisc                randconfig-002-20231130   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                      bamboo_defconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                       maple_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
powerpc                   motionpro_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                     powernv_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20231129   gcc  
powerpc               randconfig-001-20231130   gcc  
powerpc               randconfig-002-20231129   gcc  
powerpc               randconfig-002-20231130   gcc  
powerpc               randconfig-003-20231129   gcc  
powerpc               randconfig-003-20231130   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20231129   gcc  
powerpc64             randconfig-001-20231130   gcc  
powerpc64             randconfig-002-20231129   gcc  
powerpc64             randconfig-002-20231130   gcc  
powerpc64             randconfig-003-20231129   gcc  
powerpc64             randconfig-003-20231130   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                 randconfig-001-20231129   gcc  
riscv                 randconfig-001-20231130   gcc  
riscv                 randconfig-002-20231129   gcc  
riscv                 randconfig-002-20231130   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20231129   gcc  
sh                    randconfig-001-20231130   gcc  
sh                    randconfig-002-20231129   gcc  
sh                    randconfig-002-20231130   gcc  
sh                          rsk7269_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231129   gcc  
sparc64               randconfig-001-20231130   gcc  
sparc64               randconfig-002-20231129   gcc  
sparc64               randconfig-002-20231130   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231129   gcc  
um                    randconfig-001-20231130   gcc  
um                    randconfig-002-20231129   gcc  
um                    randconfig-002-20231130   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231129   gcc  
x86_64       buildonly-randconfig-001-20231130   gcc  
x86_64       buildonly-randconfig-002-20231129   gcc  
x86_64       buildonly-randconfig-002-20231130   gcc  
x86_64       buildonly-randconfig-003-20231129   gcc  
x86_64       buildonly-randconfig-003-20231130   gcc  
x86_64       buildonly-randconfig-004-20231129   gcc  
x86_64       buildonly-randconfig-004-20231130   gcc  
x86_64       buildonly-randconfig-005-20231129   gcc  
x86_64       buildonly-randconfig-005-20231130   gcc  
x86_64       buildonly-randconfig-006-20231129   gcc  
x86_64       buildonly-randconfig-006-20231130   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231129   gcc  
x86_64                randconfig-011-20231130   gcc  
x86_64                randconfig-012-20231129   gcc  
x86_64                randconfig-012-20231130   gcc  
x86_64                randconfig-013-20231129   gcc  
x86_64                randconfig-013-20231130   gcc  
x86_64                randconfig-014-20231129   gcc  
x86_64                randconfig-014-20231130   gcc  
x86_64                randconfig-015-20231129   gcc  
x86_64                randconfig-015-20231130   gcc  
x86_64                randconfig-016-20231129   gcc  
x86_64                randconfig-016-20231130   gcc  
x86_64                randconfig-071-20231129   gcc  
x86_64                randconfig-071-20231130   gcc  
x86_64                randconfig-072-20231129   gcc  
x86_64                randconfig-072-20231130   gcc  
x86_64                randconfig-073-20231129   gcc  
x86_64                randconfig-073-20231130   gcc  
x86_64                randconfig-074-20231129   gcc  
x86_64                randconfig-074-20231130   gcc  
x86_64                randconfig-075-20231129   gcc  
x86_64                randconfig-075-20231130   gcc  
x86_64                randconfig-076-20231129   gcc  
x86_64                randconfig-076-20231130   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20231129   gcc  
xtensa                randconfig-001-20231130   gcc  
xtensa                randconfig-002-20231129   gcc  
xtensa                randconfig-002-20231130   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

