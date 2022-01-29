Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B081FC433EF
	for <ath10k@archiver.kernel.org>; Sat, 29 Jan 2022 04:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tGa5zVA728PwbCPly22kU9LsiVoLzkq9IWpNXWs+0pM=; b=lnsTr9l2fc+yph
	z1Xa3p1s9eq6jjKZ4dtKMwEsmzqZ9LJTc4QqehJwIoePkDwqBALm5u6XUCbJ5SB7ho5BYiVUYDJfl
	yo6oFZB0vx4a4gA2vn0jBFKZwth1YbmaHh/AEGrrb5zOPlj1oNqTqi/IBrv2BIbrRBCL+aEgaFCZ1
	C7tV/kbagF3RwS7IbVdwQIzRr7zQ8vRHKbxm6jlBC4tZE9AYXlQUzXykzSiPKlVvbYlNGKdCaCSBq
	MERZniK6ZIV32GuQ6A4H4Bln+bxrF/AGAsPY5udjtKGPP7kQ9ecLPt+91BbeC+tzCPetIkPexNoBZ
	bGgmKdoWfY8yVmsDEXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDfkB-00410M-AA; Sat, 29 Jan 2022 04:53:47 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDfk7-0040zS-N0
 for ath10k@lists.infradead.org; Sat, 29 Jan 2022 04:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643432023; x=1674968023;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=qbySwqTbGSeuJ7nVA0fCLm6QK9NCjIqAu1aNsds8ALQ=;
 b=l+348aWUExgtcVpLJNoh3OXJsCOddW/ie0VJEQwphKzvD8kjXCX41Fpe
 NPJJJtMr3BCOAjImUEeZzYDnsD3Y0OvxDTAcVZ4hl+xPuXUmgi3Z8/vdE
 9LR6GGk02NUz0IDXkXILNfywfVhx5GteDjHHFlTA+q6HRtePRg2TtDtpY
 DntZHQk7Jo8aL4JR56/S/b6dSgwTpMDlc+UbxpipDhSKcG+bLSifRuZ7Y
 uzaI0B7lCMaM+A/BYrLqo+AgcSPd8gmbyLpS7s9WuKRZenY8le03F3mwe
 BAM9xg/2EqRiPWYy8o1vCQbHRQ7M0H7rNyCv5uhap9vN/qLbz2+Ww5Nus g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="227219597"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="227219597"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 20:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="582067817"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2022 20:53:40 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDfk3-000OmG-S8; Sat, 29 Jan 2022 04:53:39 +0000
Date: Sat, 29 Jan 2022 12:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 0b96d6e2e9ec73dab802ddc0b5d7f4fe011a901b
Message-ID: <61f4c838.B4AdXxVWeUV+b+Ya%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_205343_842262_85489192 
X-CRM114-Status: UNSURE (   4.43  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 0b96d6e2e9ec73dab802ddc0b5d7f4fe011a901b  Merge branch 'ath-next' into ath-qca

elapsed time: 731m

configs tested: 195
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
i386                          randconfig-c001
powerpc              randconfig-c003-20220124
sh                             sh03_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                          rb532_defconfig
ia64                            zx1_defconfig
powerpc64                        alldefconfig
arm64                            alldefconfig
mips                        jmr3927_defconfig
sh                           se7780_defconfig
sh                        edosk7760_defconfig
sh                             espt_defconfig
um                                  defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
sparc                               defconfig
xtensa                           alldefconfig
arm                       aspeed_g5_defconfig
arm                         vf610m4_defconfig
arm                           tegra_defconfig
h8300                               defconfig
arm                         cm_x300_defconfig
sh                           se7751_defconfig
powerpc                      ppc6xx_defconfig
arc                           tb10x_defconfig
mips                           xway_defconfig
mips                 decstation_r4k_defconfig
m68k                          multi_defconfig
m68k                        stmark2_defconfig
powerpc                      ep88xc_defconfig
powerpc                     ep8248e_defconfig
h8300                     edosk2674_defconfig
sh                   secureedge5410_defconfig
sparc64                          alldefconfig
powerpc                 mpc834x_itx_defconfig
arm                        shmobile_defconfig
mips                     decstation_defconfig
arm                         lubbock_defconfig
arm                          iop32x_defconfig
openrisc                         alldefconfig
powerpc                     sequoia_defconfig
m68k                           sun3_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      pasemi_defconfig
parisc                           alldefconfig
powerpc                  storcenter_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     rainier_defconfig
arm                          badge4_defconfig
sh                           se7705_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
sh                           se7343_defconfig
mips                        bcm47xx_defconfig
arm                          lpd270_defconfig
mips                            ar7_defconfig
powerpc                     mpc83xx_defconfig
ia64                             allmodconfig
powerpc                     pq2fads_defconfig
openrisc                 simple_smp_defconfig
sh                        edosk7705_defconfig
h8300                       h8s-sim_defconfig
mips                         cobalt_defconfig
m68k                        m5272c3_defconfig
powerpc                      makalu_defconfig
powerpc                     asp8347_defconfig
mips                           ip32_defconfig
microblaze                      mmu_defconfig
arm                        multi_v7_defconfig
sh                        sh7763rdp_defconfig
arm                  randconfig-c002-20220124
arm                  randconfig-c002-20220127
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
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
x86_64               randconfig-a001-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220127
arc                  randconfig-r043-20220127
arc                  randconfig-r043-20220124
s390                 randconfig-r044-20220127
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
s390                 randconfig-c005-20220124
riscv                randconfig-c006-20220124
arm                      tct_hammer_defconfig
arm                        vexpress_defconfig
arm                         orion5x_defconfig
powerpc                      ppc44x_defconfig
mips                        omega2p_defconfig
arm                        mvebu_v5_defconfig
powerpc                     mpc5200_defconfig
arm                         s3c2410_defconfig
powerpc                     ksi8560_defconfig
powerpc                      katmai_defconfig
mips                        bcm63xx_defconfig
mips                          ath25_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220126
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r045-20220126
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220126
hexagon              randconfig-r045-20220125
hexagon              randconfig-r045-20220127
hexagon              randconfig-r041-20220125
hexagon              randconfig-r041-20220127
s390                 randconfig-r044-20220124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
