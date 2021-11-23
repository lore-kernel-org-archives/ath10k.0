Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35BCC433EF
	for <ath10k@archiver.kernel.org>; Tue, 23 Nov 2021 03:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1/m6kRAGcwsQtiGp7BMpychSbNuhXAoUVO1meBMnyR0=; b=2kwsVgEaS2vY6M
	V5bD4Yca7D4A9tJ7lVmP9teYKW/ewW3wc2DcyB0UkcAieE5rI4k3Ria5/LHY4Dmd84VK6mArRRctI
	ThsS1l3zGnY7qc4TTKZlzvNJ8ZrnxkDWsa4E40zdoZw61i/syD/FhjJJhdOQu1eMvIgiIDRTWnr4q
	AqHYkAdAOVjIUnmUhmOh38ovou1a1P+Vh/smvZl8wkD9c58Agi7B+s//8Pt8/kLckknPIXz7jI1l3
	n947ShAtRKZajaEDxkUlM72bwHEyFnT1A83grKX9615fjxZhQnY0aC3EvHyi123IdxCyXQA8GZnVH
	6Z4m88bRjgxO6eOZwTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMI9-000hwO-MS; Tue, 23 Nov 2021 03:16:21 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMI6-000hut-P1
 for ath10k@lists.infradead.org; Tue, 23 Nov 2021 03:16:20 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="321171464"
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="321171464"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 19:16:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="739615415"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 22 Nov 2021 19:16:16 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mpMI3-00015G-Rc; Tue, 23 Nov 2021 03:16:15 +0000
Date: Tue, 23 Nov 2021 11:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 737d0e0b801537183d947f9acad689a1b9e82c5d
Message-ID: <619c5cef.4RqrUZa0XPJ/au5L%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_191618_873501_4207052A 
X-CRM114-Status: UNSURE (   4.48  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 737d0e0b801537183d947f9acad689a1b9e82c5d  ath11k: Use memset_startat() for clearing queue descriptors

elapsed time: 720m

configs tested: 141
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211122
mips                 randconfig-c004-20211122
nios2                         3c120_defconfig
sh                         microdev_defconfig
xtensa                    smp_lx200_defconfig
mips                       capcella_defconfig
h8300                            alldefconfig
m68k                            q40_defconfig
sh                          sdk7780_defconfig
m68k                          amiga_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                       common_defconfig
mips                          ath79_defconfig
sh                           se7206_defconfig
powerpc                    mvme5100_defconfig
arm                        oxnas_v6_defconfig
sh                        sh7757lcr_defconfig
s390                             alldefconfig
powerpc                 canyonlands_defconfig
ia64                      gensparse_defconfig
sh                         ecovec24_defconfig
arm                         hackkit_defconfig
openrisc                            defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
sh                           se7343_defconfig
arm                    vt8500_v6_v7_defconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                             allyesconfig
arm                           stm32_defconfig
h8300                    h8300h-sim_defconfig
arm                            dove_defconfig
xtensa                generic_kc705_defconfig
openrisc                  or1klitex_defconfig
m68k                       m5208evb_defconfig
arm                          pcm027_defconfig
arm                      footbridge_defconfig
arm                         at91_dt_defconfig
mips                      pic32mzda_defconfig
mips                           jazz_defconfig
sparc                       sparc64_defconfig
arc                              alldefconfig
sparc64                             defconfig
powerpc                      ppc6xx_defconfig
mips                        bcm63xx_defconfig
m68k                             alldefconfig
powerpc                 mpc8560_ads_defconfig
arm                        trizeps4_defconfig
powerpc                   bluestone_defconfig
m68k                        m5407c3_defconfig
mips                     loongson1c_defconfig
mips                        qi_lb60_defconfig
arm                           corgi_defconfig
m68k                       m5475evb_defconfig
ia64                         bigsur_defconfig
mips                   sb1250_swarm_defconfig
arm                  randconfig-c002-20211122
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20211122
x86_64               randconfig-a011-20211122
x86_64               randconfig-a012-20211122
x86_64               randconfig-a016-20211122
x86_64               randconfig-a013-20211122
x86_64               randconfig-a015-20211122
i386                 randconfig-a016-20211122
i386                 randconfig-a015-20211122
i386                 randconfig-a012-20211122
i386                 randconfig-a013-20211122
i386                 randconfig-a014-20211122
i386                 randconfig-a011-20211122
arc                  randconfig-r043-20211122
s390                 randconfig-r044-20211122
riscv                randconfig-r042-20211122
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211122
i386                 randconfig-c001-20211122
powerpc              randconfig-c003-20211122
riscv                randconfig-c006-20211122
arm                  randconfig-c002-20211122
x86_64               randconfig-c007-20211122
mips                 randconfig-c004-20211122
x86_64               randconfig-a001-20211122
x86_64               randconfig-a003-20211122
x86_64               randconfig-a006-20211122
x86_64               randconfig-a004-20211122
x86_64               randconfig-a005-20211122
x86_64               randconfig-a002-20211122
i386                 randconfig-a001-20211122
i386                 randconfig-a002-20211122
i386                 randconfig-a005-20211122
i386                 randconfig-a006-20211122
i386                 randconfig-a004-20211122
i386                 randconfig-a003-20211122

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
