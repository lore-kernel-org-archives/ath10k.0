Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FC8C433EF
	for <ath10k@archiver.kernel.org>; Thu,  3 Feb 2022 23:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BWQUmLbWKauU6/UY94j/tgAEh7DaYkCchBznFzESr6U=; b=r4/ZVVlry2Ef8Y
	cwQ+OJiv7I7jn96t3MmMjJkiUGYnhBWOgVgVzSMnlU9E6gPts4PzmV3H5nfmWXs/IiZWgfDfcHvxe
	b2Dnkpg2NBwJW0G4O0vYAqf+JZes1idsFIcs10BJLzHdc11RwgR99MTZiOy1YSTfsZ6mNJsy18DuU
	QlieKCqyuzwHXDMMKCxwwROkvxSBB40SRekTZG95X1W1JnVxFP9U7pVI2noW6if8KQ0IcfPgn9aPv
	1dzRGOpF4aiyp1/NyZj4ZovSC+oHC/FXtgkooii+IZGDa8S1sBBFCh3V7G26/4ANUqq7s90+Sysrx
	UEIoOfgyMo+OSJhZp3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFlUx-00351r-Kw; Thu, 03 Feb 2022 23:26:43 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFlUu-00350L-P5
 for ath10k@lists.infradead.org; Thu, 03 Feb 2022 23:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643930800; x=1675466800;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=LMDeOkIaA1smuAnnRXRmrWyaEpWsOPVkNqeK7JKdnlM=;
 b=Yh9H9fGxbywGmr15K7N13y+2a2ci0rGshhe/DWTpL5iiMypu7ykn6uLI
 90IjP0JlBWE/pZev2WG8A49zTfKnL7zA5s90e9jM0AN4nNCiZu5AXRbO9
 4pzAh84w57FdX02HD5I+DwDmcK6bLR6X4eVWVNmFvCDAsNj93gUZzkHIT
 Nab8z5o3GIE531miRUfYMnTbcCBySXnMheFym7oljFwaBpiyn8zksPvIX
 uSC6KVGXzGDEubNkKnT/zuIx+mhy89HibwKxWVlmcLCR7okOD3eThV6qS
 pO0UGqUrRgxwa7YW8s5duhir0IGUY3bYb0vpbHDh9dNOSeEQGQ7N4wcUz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248225700"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="248225700"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 15:26:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="566581762"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 03 Feb 2022 15:26:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFlUs-000WlZ-9U; Thu, 03 Feb 2022 23:26:38 +0000
Date: Fri, 04 Feb 2022 07:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 6ed569155081342d81c847558d22305dd72af08c
Message-ID: <61fc646f.DErNF+b5XoF2uLkU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_152640_914024_7C02AC1C 
X-CRM114-Status: UNSURE (   5.76  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 6ed569155081342d81c847558d22305dd72af08c  Merge branch 'pending' into master-pending

elapsed time: 737m

configs tested: 172
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
i386                          randconfig-c001
m68k                          hp300_defconfig
sh                   sh7724_generic_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        clps711x_defconfig
powerpc                 linkstation_defconfig
mips                            ar7_defconfig
powerpc                     rainier_defconfig
arm                           h5000_defconfig
arm                           corgi_defconfig
powerpc                     sequoia_defconfig
sh                   secureedge5410_defconfig
arc                        nsim_700_defconfig
mips                           ci20_defconfig
parisc                generic-32bit_defconfig
arc                           tb10x_defconfig
powerpc                      ppc40x_defconfig
powerpc                mpc7448_hpc2_defconfig
arc                        nsimosci_defconfig
sh                               alldefconfig
arc                          axs101_defconfig
arm                            mps2_defconfig
arm                           sunxi_defconfig
sparc                            allyesconfig
powerpc                     mpc83xx_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      ep88xc_defconfig
arm                         lubbock_defconfig
mips                          rb532_defconfig
parisc                           allyesconfig
sh                   rts7751r2dplus_defconfig
microblaze                          defconfig
s390                          debug_defconfig
sh                           se7206_defconfig
arm                            qcom_defconfig
powerpc                     pq2fads_defconfig
m68k                            q40_defconfig
sh                              ul2_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                ecovec24-romimage_defconfig
m68k                       m5249evb_defconfig
arm                             rpc_defconfig
arm                             pxa_defconfig
sh                             espt_defconfig
mips                           ip32_defconfig
microblaze                      mmu_defconfig
xtensa                           allyesconfig
mips                    maltaup_xpa_defconfig
openrisc                 simple_smp_defconfig
nios2                         10m50_defconfig
arm                          pxa910_defconfig
powerpc                    amigaone_defconfig
h8300                     edosk2674_defconfig
arm                           viper_defconfig
arm                          simpad_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220202
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
arc                  randconfig-r043-20220131
s390                 randconfig-r044-20220130
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
riscv                randconfig-c006-20220201
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220201
mips                 randconfig-c004-20220201
i386                          randconfig-c001
arm                  randconfig-c002-20220201
arm                       imx_v4_v5_defconfig
powerpc                     ppa8548_defconfig
arm                  colibri_pxa300_defconfig
i386                             allyesconfig
riscv                             allnoconfig
x86_64                           allyesconfig
mips                          rm200_defconfig
arm                             mxs_defconfig
powerpc                   lite5200b_defconfig
mips                          ath79_defconfig
mips                  cavium_octeon_defconfig
arm                      pxa255-idp_defconfig
arm                         socfpga_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          pcm027_defconfig
arm                           spitz_defconfig
powerpc                       ebony_defconfig
mips                malta_qemu_32r6_defconfig
mips                      bmips_stb_defconfig
arm                         lpc32xx_defconfig
arm                          pxa168_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220130
hexagon              randconfig-r041-20220131
s390                 randconfig-r044-20220131
hexagon              randconfig-r045-20220203
hexagon              randconfig-r041-20220203

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
