Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEFAC433EF
	for <ath10k@archiver.kernel.org>; Sat, 29 Jan 2022 04:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GZw2ihCq6j3Ra3H2XOqs0QOE6JT7mYe2tQh0OZGQC1Y=; b=K+WRSlsoY1upc4
	fdkQRcHCx64f39aWvFjmUsLD3BfjWH/8zhhx8SsnIb+osJb4qdT1aKcXnAccWII8YKwrj9YIxSAI0
	cX2sAkdzP/rhZ2hznC5nixNZbcFguq1+VE+7FqdWK1Qlni/iJIuVX7gIfdHjkJ6xOiohtP3yZSKKn
	MsUx2YWEwCuIKUhlsNZaMy9xoRruIXh1fXA5XDPTYn/NrE+npPBChdbtd2jILrIrt+P2gKHVMI9gZ
	gyywLrBMYTLhzTlmSCG4RNnepcT6n9vhmwj8q/v6hEZPAbkyxyZ3sJvE9P14zjfgtth1fnW0GvJCA
	pK1W+rFeFCSYixWMm8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDfkH-00410r-9d; Sat, 29 Jan 2022 04:53:53 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDfk9-0040zS-G0
 for ath10k@lists.infradead.org; Sat, 29 Jan 2022 04:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643432025; x=1674968025;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=V33Mkfo8QxUt+UkntORB45iUXO+7mYktVSkg92PPJqM=;
 b=aFHXlqTkc+BAxABc6IucjnkEfZJoEKrFS2GgtKyjYVuQ8LbbITNrIGjK
 N0MGre7uJ/14syJGcoKY1FiIk0r2NyqKe2Rumds0k99uDEaCtYTxnp2Eu
 2YbXBQW12OBvrsvAigBrfF2dU9A1qQVOy52a7DPmOxrhQTZcsxObdZ03K
 aj0jhndAs86Wryhh69OK45Idsod4hVdNIneBvs3dH0xFTXLkTw7699lpX
 veyQMgwgRQzXmhpnY/YVoVfAt3J4RgqzwL1lf8KrcER715Y8nK7HF/9vo
 nmYf/2U3cgFlIx6J6biKmlKpxO+LRyKLqEiXYeTikJMqejOTUpalxTNOV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="227219598"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="227219598"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 20:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="768087990"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2022 20:53:40 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDfk3-000OmR-Vd; Sat, 29 Jan 2022 04:53:39 +0000
Date: Sat, 29 Jan 2022 12:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 f0e6c22fbfaa3d1e1d359f268c11a8abc24c6dd9
Message-ID: <61f4c844.HXMNpwsi9tPW0UNN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_205345_619253_3B5B64FF 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: f0e6c22fbfaa3d1e1d359f268c11a8abc24c6dd9  Merge branch 'pending' into master-pending

elapsed time: 730m

configs tested: 187
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
sh                             espt_defconfig
um                                  defconfig
sh                        edosk7760_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
xtensa                           alldefconfig
sparc                               defconfig
arm                       aspeed_g5_defconfig
arm                         vf610m4_defconfig
arm                           tegra_defconfig
h8300                               defconfig
arm                         cm_x300_defconfig
sh                           se7751_defconfig
powerpc                      ppc6xx_defconfig
arc                           tb10x_defconfig
powerpc                      ep88xc_defconfig
powerpc                     ep8248e_defconfig
m68k                        stmark2_defconfig
h8300                     edosk2674_defconfig
sh                   secureedge5410_defconfig
sparc64                          alldefconfig
powerpc                 mpc834x_itx_defconfig
arm                        shmobile_defconfig
mips                     decstation_defconfig
arm                         lubbock_defconfig
arm                          iop32x_defconfig
arm                           corgi_defconfig
mips                           xway_defconfig
arm                            hisi_defconfig
sh                             shx3_defconfig
openrisc                         alldefconfig
powerpc                     sequoia_defconfig
m68k                           sun3_defconfig
powerpc                 mpc834x_mds_defconfig
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
sh                        sh7763rdp_defconfig
microblaze                      mmu_defconfig
arm                        multi_v7_defconfig
arm                  randconfig-c002-20220127
arm                  randconfig-c002-20220124
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                 randconfig-c005-20220124
x86_64               randconfig-c007-20220124
riscv                randconfig-c006-20220124
arm                        vexpress_defconfig
arm                         orion5x_defconfig
powerpc                      ppc44x_defconfig
powerpc                      obs600_defconfig
arm                        mvebu_v5_defconfig
powerpc                     mpc5200_defconfig
arm                         s3c2410_defconfig
powerpc                     ksi8560_defconfig
powerpc                    gamecube_defconfig
arm                         bcm2835_defconfig
powerpc                     kmeter1_defconfig
powerpc                      katmai_defconfig
mips                        bcm63xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
x86_64               randconfig-a016-20220124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
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
