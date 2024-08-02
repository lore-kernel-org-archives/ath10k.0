Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04229C3DA4A
	for <ath10k@archiver.kernel.org>; Fri,  2 Aug 2024 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r2YQMYe5LuBFg5BQ78O2RI2HoxdhDFzKxhpbGvWITmc=; b=dz6mmeT3Vc4zBvjeYO4NWlx8m7
	RfYotCvDpvfzBvql3sSbOOeGEz4uN7v4OnVU71rUjKExdZQIAdwGWtxolngoZqTvVFZp4Ibo3ZuGT
	/9LYHwNoDhcyMJfEAGLpJGvGHGKLAbw/72dPQI1SNTFdAUqDRnLdi+RjSEemfPUuZSDCiyAK4Xv5W
	550skkMvmd/9Jw5KJR0kyLGhY6hi+nfeWlBBlup6umqiRPLIjLobYDKjHSbbgbrwSAaP/An/BuHnN
	q/Ld5O+/22L/cWj4lhwaV6Sn09euXlC3LmfGIyUT8E8/vSvyjkUwUVp7pieRwt4YK1ZKZibUmb7GA
	7b+KlUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZuqC-00000009PMu-1mdJ;
	Fri, 02 Aug 2024 16:09:16 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZuqA-00000009PML-05JO
	for ath10k@lists.infradead.org;
	Fri, 02 Aug 2024 16:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722614954; x=1754150954;
  h=date:from:to:cc:subject:message-id;
  bh=/XPxR80tIT3HpdiHZr5F4QAIWC7o10wZLMOfLDwTOT4=;
  b=YUdZ5oB8kaRjoQfW+u3IaSa2900OlB6+1G8WtcIB6Y8BUwgtXzNIb/5p
   0y3vUlOPjF+O5fuLOaZCZxV+Oce38zb6hS1nvBQuQGJubZX0DW/N78i2r
   /GWHZeR2kzDP1xnPDkVjtmty1vxqlL+d3dlgpvY1CPsMs0skx6832jznf
   OWPqn+lD+1jTQWasbBpZW2SEkPZfFHbUKTT9KSFd0HL8hk7Og/0eiPQ+c
   d6ZKDmNDGL59YABtrNswhHHISMjtm9FALKnCOzA93d/8zVXhOvURAjqmo
   bbYgePce3TVim2/PLuY6PT/cJn5reYCzXD5Vrf+w6+3OvTnqrdnA7zLxo
   A==;
X-CSE-ConnectionGUID: fk1EMsESR++qx0WfiCuL7A==
X-CSE-MsgGUID: ivUgEJFcQUCUAak5K/6New==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20221631"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="20221631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 09:09:13 -0700
X-CSE-ConnectionGUID: YETy99xiSHmD/prV/SZ1nQ==
X-CSE-MsgGUID: /VOkVr1IQRua1mk/9Jl+mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="60289735"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 09:09:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZuq5-000x3D-1G;
	Fri, 02 Aug 2024 16:09:09 +0000
Date: Sat, 03 Aug 2024 00:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 aefacd7c75edfaf6690819c1990b851f4c7b50cf
Message-ID: <202408030015.AtdtMDVQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_090914_142441_2CB22297 
X-CRM114-Status: UNSURE (   3.84  )
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
branch HEAD: aefacd7c75edfaf6690819c1990b851f4c7b50cf  Add localversion-wireless-testing-ath

elapsed time: 1446m

configs tested: 192
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-13.2.0
arc                   randconfig-001-20240802   gcc-13.2.0
arc                   randconfig-002-20240802   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                        clps711x_defconfig   gcc-13.2.0
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                          exynos_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   clang-20
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                   randconfig-001-20240802   gcc-13.2.0
arm                   randconfig-002-20240802   gcc-13.2.0
arm                   randconfig-003-20240802   gcc-13.2.0
arm                   randconfig-004-20240802   gcc-13.2.0
arm                             rpc_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                           sunxi_defconfig   gcc-13.2.0
arm                    vt8500_v6_v7_defconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240802   gcc-13.2.0
arm64                 randconfig-002-20240802   gcc-13.2.0
arm64                 randconfig-003-20240802   gcc-13.2.0
arm64                 randconfig-004-20240802   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240802   gcc-13.2.0
csky                  randconfig-002-20240802   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240802   gcc-13
i386         buildonly-randconfig-002-20240802   gcc-13
i386         buildonly-randconfig-003-20240802   gcc-13
i386         buildonly-randconfig-004-20240802   gcc-13
i386         buildonly-randconfig-005-20240802   gcc-13
i386         buildonly-randconfig-006-20240802   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240802   gcc-13
i386                  randconfig-002-20240802   gcc-13
i386                  randconfig-003-20240802   gcc-13
i386                  randconfig-004-20240802   gcc-13
i386                  randconfig-005-20240802   gcc-13
i386                  randconfig-006-20240802   gcc-13
i386                  randconfig-011-20240802   gcc-13
i386                  randconfig-012-20240802   gcc-13
i386                  randconfig-013-20240802   gcc-13
i386                  randconfig-014-20240802   gcc-13
i386                  randconfig-015-20240802   gcc-13
i386                  randconfig-016-20240802   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240802   gcc-13.2.0
loongarch             randconfig-002-20240802   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                        bcm63xx_defconfig   gcc-13.2.0
mips                           ip30_defconfig   gcc-13.2.0
mips                malta_qemu_32r6_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
mips                  maltasmvp_eva_defconfig   clang-20
mips                          rb532_defconfig   clang-20
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240802   gcc-13.2.0
nios2                 randconfig-002-20240802   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240802   gcc-13.2.0
parisc                randconfig-002-20240802   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   clang-20
powerpc                  iss476-smp_defconfig   clang-20
powerpc                 linkstation_defconfig   clang-20
powerpc                   lite5200b_defconfig   clang-20
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   clang-20
powerpc                   microwatt_defconfig   gcc-13.2.0
powerpc                    mvme5100_defconfig   clang-20
powerpc                     rainier_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240802   gcc-13.2.0
powerpc               randconfig-003-20240802   gcc-13.2.0
powerpc                     sequoia_defconfig   gcc-13.2.0
powerpc                         wii_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240802   gcc-13.2.0
powerpc64             randconfig-002-20240802   gcc-13.2.0
powerpc64             randconfig-003-20240802   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240802   gcc-13.2.0
riscv                 randconfig-002-20240802   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240802   gcc-13.2.0
s390                  randconfig-002-20240802   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7760_defconfig   gcc-13.2.0
sh                    randconfig-001-20240802   gcc-13.2.0
sh                    randconfig-002-20240802   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                          sdk7786_defconfig   gcc-13.2.0
sh                             sh03_defconfig   gcc-13.2.0
sh                   sh7770_generic_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240802   gcc-13.2.0
sparc64               randconfig-002-20240802   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240802   gcc-13.2.0
um                    randconfig-002-20240802   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240802   gcc-8
x86_64       buildonly-randconfig-002-20240802   gcc-8
x86_64       buildonly-randconfig-003-20240802   gcc-8
x86_64       buildonly-randconfig-004-20240802   gcc-8
x86_64       buildonly-randconfig-005-20240802   gcc-8
x86_64       buildonly-randconfig-006-20240802   gcc-8
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240802   gcc-8
x86_64                randconfig-002-20240802   gcc-8
x86_64                randconfig-003-20240802   gcc-8
x86_64                randconfig-004-20240802   gcc-8
x86_64                randconfig-005-20240802   gcc-8
x86_64                randconfig-006-20240802   gcc-8
x86_64                randconfig-011-20240802   gcc-8
x86_64                randconfig-012-20240802   gcc-8
x86_64                randconfig-013-20240802   gcc-8
x86_64                randconfig-014-20240802   gcc-8
x86_64                randconfig-015-20240802   gcc-8
x86_64                randconfig-016-20240802   gcc-8
x86_64                randconfig-071-20240802   gcc-8
x86_64                randconfig-072-20240802   gcc-8
x86_64                randconfig-073-20240802   gcc-8
x86_64                randconfig-074-20240802   gcc-8
x86_64                randconfig-075-20240802   gcc-8
x86_64                randconfig-076-20240802   gcc-8
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240802   gcc-13.2.0
xtensa                randconfig-002-20240802   gcc-13.2.0
xtensa                         virt_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

