Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7C1C433EF
	for <ath10k@archiver.kernel.org>; Wed, 19 Jan 2022 21:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0PrGJoO4qgLi0zPDY4mLQKqaZ9nayp5NxMjg4FkEfFM=; b=nXefrsyRwZG2FI
	uDQK4a+wQQRkiFQjx6+w6fI2vyFRGE8WgiaxOowbpbh5pZNXFIXtHDL6PROXD7LzdVsuqGsDB38q8
	kyT2kedR2uaF//CWUBwenZOBSu/pd1W2//6gisicMLMIScG5MMyeUV8scdRQhhMWJ26BX7dWVYbcz
	AQbuDNHSZCleW3+qLBRmVZaxZN76zU+NJ/Fawsk1wPSC0jGFPnE2u/kLrPDbRsEUXGWW+rYrf7PUG
	V5HJkWFZLngRQP75yDNbnyX2fYJZAXQrulqXGq+JfhUYa5hWlduRIsRP0rjeOo5tkecC9qNmBGOMf
	a1CyJchDVP8Dv/F+2gRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAIfQ-007X1I-VK; Wed, 19 Jan 2022 21:38:57 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAIfJ-007WzI-GR
 for ath10k@lists.infradead.org; Wed, 19 Jan 2022 21:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642628329; x=1674164329;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Bt/PMb1Mi6jDdL594RxR9L7VagN0ZLBejPqcIqct7x8=;
 b=ivV+BZAFVvguOosg/qJv08xocQ9T7G6MLt0vm8UctnXf2yo/bMhFE7pb
 RFj3auBDunc855fDoxkLqKXhmWE2ODkkbFt3rwGG9opjI4rivTg1It+N5
 5kmxzi9Zq6iUPmGuQzslaSQDJwnBJ2hrnX6ZEP/LX3LFMwI8C+6wx4Jlc
 mZPVw2UikoQ+pKsCEtUU+WRZTxMKe+lg3qLl0adf/X0eoEbUt5unHHXMu
 1v4+FzAilJaBvzv8hNDjz8NbpxHW9ovYZG506af+hOFR2uzMiHhGmJ82n
 lOjS/GlHeJlrN0MVRSxW+jOTvxbqXa3yrg05f5QmNryeF69SzMpn23XKy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="232562504"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="232562504"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="626050290"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 19 Jan 2022 13:38:41 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nAIfB-000Dlj-7u; Wed, 19 Jan 2022 21:38:41 +0000
Date: Thu, 20 Jan 2022 05:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 003b8dc1b218c919acd11dafbebec8a2b37e38ec
Message-ID: <61e884d4.5CbLMFugzEb3KRpN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_133849_631914_DF41B5DF 
X-CRM114-Status: UNSURE (   7.03  )
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
branch HEAD: 003b8dc1b218c919acd11dafbebec8a2b37e38ec  dt: bindings: net: add bindings of WCN6750 for ath11k

elapsed time: 722m

configs tested: 181
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220117
mips                 randconfig-c004-20220117
powerpc              randconfig-c003-20220118
i386                          randconfig-c001
arc                          axs101_defconfig
sh                            migor_defconfig
arm                        shmobile_defconfig
s390                             allyesconfig
sh                           se7712_defconfig
ia64                        generic_defconfig
nios2                            alldefconfig
sh                         ap325rxa_defconfig
sh                          urquell_defconfig
arc                           tb10x_defconfig
mips                         mpc30x_defconfig
sh                         ecovec24_defconfig
m68k                          atari_defconfig
mips                  decstation_64_defconfig
sh                            shmin_defconfig
sh                          sdk7786_defconfig
arm                      footbridge_defconfig
powerpc                  iss476-smp_defconfig
mips                        bcm47xx_defconfig
h8300                    h8300h-sim_defconfig
sh                          rsk7201_defconfig
powerpc                 linkstation_defconfig
powerpc                     tqm8548_defconfig
um                               alldefconfig
mips                           ip32_defconfig
m68k                        m5407c3_defconfig
powerpc                     taishan_defconfig
arm                            qcom_defconfig
arm                            hisi_defconfig
mips                       bmips_be_defconfig
sh                     magicpanelr2_defconfig
arc                        vdk_hs38_defconfig
powerpc                    klondike_defconfig
um                             i386_defconfig
csky                             alldefconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
m68k                          hp300_defconfig
powerpc                      chrp32_defconfig
xtensa                         virt_defconfig
powerpc                        cell_defconfig
sh                          r7780mp_defconfig
mips                      maltasmvp_defconfig
m68k                         apollo_defconfig
arm                         s3c6400_defconfig
arm                       multi_v4t_defconfig
xtensa                    smp_lx200_defconfig
csky                                defconfig
powerpc                      ep88xc_defconfig
nios2                         10m50_defconfig
powerpc                        warp_defconfig
powerpc                       eiger_defconfig
arm                          gemini_defconfig
arc                     haps_hs_smp_defconfig
sh                   sh7770_generic_defconfig
arm                      integrator_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
arm                  randconfig-c002-20220119
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a016-20220117
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a015-20220117
i386                 randconfig-a012-20220117
i386                 randconfig-a016-20220117
i386                 randconfig-a014-20220117
i386                 randconfig-a015-20220117
i386                 randconfig-a011-20220117
i386                 randconfig-a013-20220117
riscv                randconfig-r042-20220119
s390                 randconfig-r044-20220119
arc                  randconfig-r043-20220119
riscv                randconfig-r042-20220117
arc                  randconfig-r043-20220116
arc                  randconfig-r043-20220117
s390                 randconfig-r044-20220117
arc                  randconfig-r043-20220118
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
arm                  randconfig-c002-20220118
arm                  randconfig-c002-20220119
riscv                randconfig-c006-20220119
riscv                randconfig-c006-20220118
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
powerpc              randconfig-c003-20220119
powerpc              randconfig-c003-20220118
i386                          randconfig-c001
s390                 randconfig-c005-20220119
mips                 randconfig-c004-20220119
mips                 randconfig-c004-20220116
arm                                 defconfig
riscv                            alldefconfig
arm                            mmp2_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      pmac32_defconfig
arm                  colibri_pxa300_defconfig
mips                           ip22_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                   sb1250_swarm_defconfig
i386                             allyesconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                   bluestone_defconfig
arm                        spear3xx_defconfig
powerpc                  mpc866_ads_defconfig
arm                          ep93xx_defconfig
hexagon                             defconfig
mips                      maltaaprp_defconfig
arm                          collie_defconfig
x86_64               randconfig-a004-20220117
x86_64               randconfig-a001-20220117
x86_64               randconfig-a006-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
x86_64               randconfig-a005-20220117
i386                 randconfig-a005-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
