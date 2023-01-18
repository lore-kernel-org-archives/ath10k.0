Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1437AC38159
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 19:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M1YKvW6d8UJzv1HWVU7xUUlK82sn8OMN6pSHz+ulOeM=; b=2rLWAbjeeDcc6x
	LaujoQgTwchFeIK9wUwBifx3lwY4PmA3Gv9ol4+HqZbqy0J9/bnx/NHTo96Xh4mmmoU4a6vUCl6Ae
	k1P1hFG51Goo3c3hy/LIm5SYrHaFSx6+Jtfi5NlccDQpL3kBhzGyL+2MPz8ZCcGy0eBZg+JfngzA9
	UoG1d2bW1OuCewcBNGlBLTCcWyeENZq+hWPB/XzgB6IHC3cOIluPaUn74c4MakTp66CMlGwMzjGGb
	v+aZ5pmUeg+CRX8/a3y5bYO1g5AVwkL0NYDeeKBzBx136M/7PquOI04JZJXLD+7EjhNjbeVqDqEFK
	Ia6EvnIgpIWIHZGgbhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDfY-002O4S-M6; Wed, 18 Jan 2023 19:00:20 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDfV-002O2h-8K
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 19:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674068417; x=1705604417;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cPmREvdtIvsDtZpaFGx948yMx/u/aHjP2QC/YVN7THY=;
  b=iDszlxHobbnFijt8WWJhUcSFGkc2ASLi6JtJXCMd6OTIzdHeN7j+E15O
   sXXidF6O1wXWT/2OM+Hd7HAE0v7QdOlLoo6DsYoVeaKpXIYSCNoWIkAhU
   DAR94F1zDufqvHktaktU6Y8SgiCJGlFEzUdQ9lungWoF/auPak3A5iWI9
   sHH97YsjXYn6DbSY2y/hcdZqReXtvFl3vo60yBE79RSRFvbDV/6frw2C4
   +9J4SnmYUxcE2EBIFp5ImMU+cWDsKg7agLPi9SNPJbAdMBeC8h+AoGZbj
   +Ah5fm5OxZYp7mdRWk/GNuebg0Gm1MtL6lUUa21hDqhhjDS4zP5Z+uFkv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411309904"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="411309904"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 11:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="653064310"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="653064310"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Jan 2023 11:00:10 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIDfO-0000de-0M;
	Wed, 18 Jan 2023 19:00:10 +0000
Date: Thu, 19 Jan 2023 02:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 ddd8e84e007263f3aa8993f32a3dd4dc8ec0876a
Message-ID: <63c8419d.KWdoHNrCpSSt+MFL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_110017_368928_D3D29231 
X-CRM114-Status: UNSURE (   4.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: ddd8e84e007263f3aa8993f32a3dd4dc8ec0876a  genirq/msi: Free the fwnode created by msi_create_device_irq_domain()

elapsed time: 729m

configs tested: 131
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                                 defconfig
x86_64                            allnoconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                               rhel-8.3
i386                                defconfig
s390                                defconfig
sh                               allmodconfig
x86_64               randconfig-a011-20230116
s390                             allyesconfig
x86_64               randconfig-a013-20230116
i386                 randconfig-a014-20230116
x86_64                           allyesconfig
mips                             allyesconfig
x86_64               randconfig-a012-20230116
i386                 randconfig-a013-20230116
x86_64               randconfig-a015-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a015-20230116
arm                                 defconfig
i386                 randconfig-a011-20230116
x86_64               randconfig-a014-20230116
i386                 randconfig-a016-20230116
x86_64               randconfig-a016-20230116
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                    rhel-8.3-kselftests
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20230118
m68k                            q40_defconfig
powerpc                     taishan_defconfig
sh                            titan_defconfig
powerpc                 mpc837x_mds_defconfig
mips                      maltasmvp_defconfig
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
powerpc                       eiger_defconfig
arc                     nsimosci_hs_defconfig
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                       m5208evb_defconfig
arm                         s3c6400_defconfig
sh                        dreamcast_defconfig
xtensa                              defconfig
mips                       bmips_be_defconfig
arm64                            alldefconfig
sh                 kfr2r09-romimage_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20230116
x86_64               randconfig-a006-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64                          rhel-8.3-rust
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a005-20230116
i386                 randconfig-a006-20230116
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
arm                        mvebu_v5_defconfig
mips                      malta_kvm_defconfig
hexagon              randconfig-r045-20230118
arm                      tct_hammer_defconfig
arm                       spear13xx_defconfig
mips                     loongson2k_defconfig
mips                  cavium_octeon_defconfig
hexagon              randconfig-r041-20230118
arm                  randconfig-r046-20230118
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
mips                          ath25_defconfig
powerpc                     ppa8548_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
powerpc                          allyesconfig
powerpc                      ppc64e_defconfig
powerpc                    socrates_defconfig
riscv                             allnoconfig
arm                         orion5x_defconfig
arm                         hackkit_defconfig
mips                           ip22_defconfig
mips                        omega2p_defconfig
arm                          collie_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                              alldefconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
