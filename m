Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E4EC3DA4A
	for <ath10k@archiver.kernel.org>; Fri,  2 Aug 2024 16:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MDPS6Z/l2vfgmpMvRBbrvO0orrQoymTU4OevldpIzkg=; b=d1LHsORG7msPovYstH4NltgEOE
	nZeSY2AzLDL8z30z65pmf8UlXDdKZCeooLY9nP2Ili/DnWekoJE9nWi6OaIxg8nv+RHSYQGnTnNLl
	HGHVwtiZJuZqqpC+mF0E0Witl+fV/CLDTeRzB3q0+V8hy/KaEWCQSiid11L5aM3mwa3hu0j3FuY+P
	/Wvz1zsTCZU94XH95CR0h+ILTLllKdZ582ZAKeROmL3WsrqBljuK7DbqZHAWtMMG5sBHho0IJoSw4
	Pj34phmUSKhd+5vCMwVQR7Y8BPztNmQ4FiDqdMV9/qne/sTVrc34OF1vN06lVjMIhPKYT2XTZevC4
	ZHSkZ4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZuox-00000009PDj-2biH;
	Fri, 02 Aug 2024 16:07:59 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZuou-00000009PDA-3Lqp
	for ath10k@lists.infradead.org;
	Fri, 02 Aug 2024 16:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722614877; x=1754150877;
  h=date:from:to:cc:subject:message-id;
  bh=tjwyVT7RBC27YCpvhZpSs7SSKL8Qzap5Qyc4dHHwSvM=;
  b=iu3XJ7MPxbtQmGXIs9ydbdtuaXlKQGC9wH7mNkckK1tG0+N0FRqUxgkt
   e1HCLtIOEN1GSvtPKZS0jpJrCRvUcuDjP2Nt491KjFgiLiGasIi3eKmQi
   PBAI+G2fKowT3uPwyNMm1yGLce0QMZ2EYBFoeXtJPEOBlcLonvHyIdkYS
   /oQvfGcgYQHZvJEBwiSd13rL/S8YmFaAQtsRM670EjK8IhCIYD32Ds4tX
   s3iPHEBcwGcVAzX29MbZXHTcjsWaYA0ZxBVziU+y1HGpFcCe7aMXLX4CS
   mP/LO7xsqGJPicjjeP9hvq6lv3Ad1W4UDJt5+PriqQHvT3QwNZNO1/Ov4
   w==;
X-CSE-ConnectionGUID: JbCcia4sR32XrvURGt6CfQ==
X-CSE-MsgGUID: T2s9H1/fTEalto/wwqlEeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20759717"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="20759717"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 09:07:56 -0700
X-CSE-ConnectionGUID: Hx4VZiWZQxmGh8qOgfkZtA==
X-CSE-MsgGUID: tgZ8JXaqTbKxTcKPyCdT1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="55533613"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Aug 2024 09:07:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZuoq-000x32-11;
	Fri, 02 Aug 2024 16:07:52 +0000
Date: Sat, 03 Aug 2024 00:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 3f66f26703093886db81f0610b97a6794511917c
Message-ID: <202408030012.eHR5oPnn-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_090756_910027_EC9B2F0D 
X-CRM114-Status: UNSURE (   3.93  )
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
branch HEAD: 3f66f26703093886db81f0610b97a6794511917c  wifi: ath9k: fix possible integer overflow in ath9k_get_et_stats()

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

