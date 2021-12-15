Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B734CC433EF
	for <ath10k@archiver.kernel.org>; Wed, 15 Dec 2021 05:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S8qU/9qchwYBPm/L3ZNAibHKeamh+L45zROriWZNyMY=; b=bkbJslumg86Z66
	SPHE9A+NiV9Ny/y3oWq6SW3QEXHDQe1VDFb9TVe+hS7g00n/RS+U+m73AZpEyHDNaOkmicNADcvYa
	AqhQNqWgo/EOe45dzyyfrxSgKeDPpFN5zZFWhWX/hQhXaUdOs98xCMp4ucs+fnDzdkKIsTIrckUmy
	6tQbrFHxtjRE0ZHg3Jwtr1GJag3J+ofgW/q/7dpoBubVJr6P7FHneoWvpbMHenPQW2aT7L8MD8PgE
	IhQMVOtTIw1xj5aeec8kr8XOK9PRha/Ci+kKoKCivbpaXdfF2pPTBNvqMW0imGtUlACMyxz7Zxc0U
	+HNcWiNica+aTec+YGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxMW5-00GhB9-Jr; Wed, 15 Dec 2021 05:07:49 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxMW3-00GhAJ-4P
 for ath10k@lists.infradead.org; Wed, 15 Dec 2021 05:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639544867; x=1671080867;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=yeZVKBJzgMihpGeKMVNF48dvqlWbrYz3gh7AsZjMCVU=;
 b=QmXWFAhZdq0wSy6deZITtqjnN1IsJSe/KFUCerjkY6BSx1ofhjJLCpwn
 LgN1IyQSYCe8IPj7ahbr6tt1lqTW0/MRKdn6KJ2gXN9aRwbODdODVLrYC
 PakMVcPxjOx87S7KVYzhD9OSASJy/9ME3EmGIuqH5sxPVeP7i22Z270Ub
 S/JdFFIZaKrAAQkhq4hv2/2O8lDJDXo5KxC7Tt3nswwFtyqmYn86yPZ9m
 TtJTw5NygJp0rR5zN03+OY57OrsVMURps5znaaexQKlBL1fO/GkD6Mpqq
 XQMAwhSpeFxgh69YEqoWR5lzuIm6lk0IqRdOSp4YrVYRglpozr1vu30xV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="239370049"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="239370049"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 21:07:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="604744074"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2021 21:07:45 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxMW0-0001IJ-M5; Wed, 15 Dec 2021 05:07:44 +0000
Date: Wed, 15 Dec 2021 13:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 54d1cb80c2c34235b89eaef96d9460cf3da0a51b
Message-ID: <61b97801.Dfh3udha1w0IoSRv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_210747_239924_18AC3847 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: 54d1cb80c2c34235b89eaef96d9460cf3da0a51b  ath11k: update debugfs support for mupltiple radios in PCI bus

elapsed time: 726m

configs tested: 168
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211214
mips                 randconfig-c004-20211214
i386                 randconfig-c001-20211215
sh                 kfr2r09-romimage_defconfig
powerpc                    klondike_defconfig
xtensa                    xip_kc705_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc834x_itx_defconfig
sh                               alldefconfig
arm                             mxs_defconfig
mips                           ip27_defconfig
powerpc                      ep88xc_defconfig
arm                           stm32_defconfig
xtensa                       common_defconfig
sh                         ecovec24_defconfig
powerpc                      pasemi_defconfig
powerpc                    gamecube_defconfig
powerpc64                        alldefconfig
mips                  cavium_octeon_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
arm                          pxa168_defconfig
riscv                            allmodconfig
powerpc                   lite5200b_defconfig
powerpc                      acadia_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc85xx_cds_defconfig
um                             i386_defconfig
powerpc                        fsp2_defconfig
mips                         mpc30x_defconfig
arm                            dove_defconfig
arm                        oxnas_v6_defconfig
arm                         hackkit_defconfig
mips                      malta_kvm_defconfig
mips                           ci20_defconfig
csky                             alldefconfig
arm                   milbeaut_m10v_defconfig
arm                  colibri_pxa270_defconfig
powerpc                      makalu_defconfig
arm                      jornada720_defconfig
arm                       imx_v4_v5_defconfig
mips                      fuloong2e_defconfig
arm                         assabet_defconfig
arm                      integrator_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          lpd270_defconfig
powerpc                     ppa8548_defconfig
mips                      maltaaprp_defconfig
arm                          imote2_defconfig
parisc                           alldefconfig
m68k                        m5307c3_defconfig
xtensa                          iss_defconfig
sh                            shmin_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                        stmark2_defconfig
i386                             alldefconfig
mips                      bmips_stb_defconfig
mips                           rs90_defconfig
mips                    maltaup_xpa_defconfig
sparc                       sparc32_defconfig
h8300                               defconfig
sh                      rts7751r2d1_defconfig
openrisc                            defconfig
powerpc                       ppc64_defconfig
powerpc                      pmac32_defconfig
m68k                             alldefconfig
arm                            qcom_defconfig
sh                           se7724_defconfig
sparc64                             defconfig
h8300                    h8300h-sim_defconfig
arm                         socfpga_defconfig
powerpc                      bamboo_defconfig
ia64                         bigsur_defconfig
arm                        multi_v5_defconfig
arm                        shmobile_defconfig
arm                        magician_defconfig
sh                                  defconfig
powerpc                    mvme5100_defconfig
sh                        apsh4ad0a_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                          r7780mp_defconfig
powerpc                          g5_defconfig
arm                           sama7_defconfig
arm                  randconfig-c002-20211214
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211214
x86_64               randconfig-a005-20211214
x86_64               randconfig-a001-20211214
x86_64               randconfig-a002-20211214
x86_64               randconfig-a003-20211214
x86_64               randconfig-a004-20211214
i386                 randconfig-a001-20211214
i386                 randconfig-a002-20211214
i386                 randconfig-a005-20211214
i386                 randconfig-a003-20211214
i386                 randconfig-a006-20211214
i386                 randconfig-a004-20211214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211214
x86_64               randconfig-c007-20211214
riscv                randconfig-c006-20211214
mips                 randconfig-c004-20211214
i386                 randconfig-c001-20211214
s390                 randconfig-c005-20211214
powerpc              randconfig-c003-20211214
x86_64               randconfig-a011-20211214
x86_64               randconfig-a014-20211214
x86_64               randconfig-a012-20211214
x86_64               randconfig-a013-20211214
x86_64               randconfig-a016-20211214
x86_64               randconfig-a015-20211214
i386                 randconfig-a013-20211214
i386                 randconfig-a011-20211214
i386                 randconfig-a016-20211214
i386                 randconfig-a014-20211214
i386                 randconfig-a015-20211214
i386                 randconfig-a012-20211214
hexagon              randconfig-r045-20211214
s390                 randconfig-r044-20211214
riscv                randconfig-r042-20211214
hexagon              randconfig-r041-20211214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
