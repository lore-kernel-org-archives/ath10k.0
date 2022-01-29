Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C0EC433F5
	for <ath10k@archiver.kernel.org>; Sat, 29 Jan 2022 04:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JXr3Z6kAU2U9cE2mj6YbwmgksasgeDWjbhm5RMIU2Qg=; b=L0c5fpI3u27Kl9
	EPjmcLfcultkuDDeJ5kE0V4ervV8iPx1B3/EnToN1UuxTpVmX8CnfjEwzOeOF4nQSs6pE9DevxEkU
	qcfPm8yuKobilWi2c73bRdiGGpoeNMid7LRda9mgMdXx3nogHeWMcjmqqcPefnYGCyuW+DZcmmXgL
	KYdzQgy07WI4L7abVWkjZ1Z5EutXaQRu/+lIPb1u52kuiwn7/iC4rdciaTAy8nBq2h+mJEn/yRYX/
	B04yO0aesWUjqZeWk7rFNE6FckWXIgQPz4K+eBIBrLT191aOB3iC5tLyPSFtJ2VGFn0crj47zkRLh
	4t0eDGkSEFF4rCqH70SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDfkF-00410k-Gc; Sat, 29 Jan 2022 04:53:51 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDfk9-0040zq-IV
 for ath10k@lists.infradead.org; Sat, 29 Jan 2022 04:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643432025; x=1674968025;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HkOFE8EOoYkecVmg6lRXplTc4NTzrfdst0gUPWNqQyE=;
 b=YKEgkOKh3+R3lLrd1pvFxIphqtmj3UtV6aEg6j55X0SQvn1mCWlpXmpb
 iOv2hrriivjPVth/NRrpKI0sST6hz80LxfVPgs7NcyP/RbDBBDubCySw1
 xrfK66is6Gblm+0Rthge3mJdGc8sfDYZYf7CHjgwde0pHsIuo9HgLYchC
 JmgzPG8aTQlVYODYuPpYqlLSChpxbxqylTXrNAf0EACB5rdycsvEqGixs
 RsV9NmbO8hGc8IcsltVSloNuFDvhm5Rg0lhfKPa5WUrybTefInRusAxiq
 fe+PQ+CDrPAwTLTaGbtE06Vk6ICXdqU74BSFOqXMNcU5uaBaCJY7m22vS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="227219600"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="227219600"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 20:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="697311253"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 28 Jan 2022 20:53:40 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDfk4-000Omh-4R; Sat, 29 Jan 2022 04:53:40 +0000
Date: Sat, 29 Jan 2022 12:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 edc672237e78ea510809e36207a883b668f01232
Message-ID: <61f4c840.K3cHADEzzpm0E28g%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_205345_721909_C704F77F 
X-CRM114-Status: UNSURE (   4.42  )
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
branch HEAD: edc672237e78ea510809e36207a883b668f01232  carl9170: fix missing bit-wise or operator for tx_params

elapsed time: 729m

configs tested: 186
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
ia64                        generic_defconfig
arm64                            alldefconfig
mips                        jmr3927_defconfig
sh                           se7780_defconfig
sh                        edosk7760_defconfig
sh                             espt_defconfig
um                                  defconfig
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
mips                         rt305x_defconfig
arm                            pleb_defconfig
powerpc                       ppc64_defconfig
arm                          pxa910_defconfig
powerpc                 mpc837x_rdb_defconfig
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
openrisc                 simple_smp_defconfig
powerpc                     pq2fads_defconfig
sh                        edosk7705_defconfig
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
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
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
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
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
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc                 xes_mpc85xx_defconfig
arm                        vexpress_defconfig
arm                         orion5x_defconfig
powerpc                      ppc44x_defconfig
arm                        mvebu_v5_defconfig
powerpc                     mpc5200_defconfig
arm                         s3c2410_defconfig
powerpc                     ksi8560_defconfig
powerpc                      katmai_defconfig
mips                        bcm63xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
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
