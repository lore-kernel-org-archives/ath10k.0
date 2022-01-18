Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BC9C433F5
	for <ath10k@archiver.kernel.org>; Tue, 18 Jan 2022 04:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mNfWgJRhIagE8Sv+FXy8mq5Z+Lwmozzn3nbLhTZVqNQ=; b=HoZ1NO14DucuzG
	zYM1vMDK6ZLYmkxadsxBVBQO0DyyNyNe9nIuMMzpT2V1xhVVNLT5XG6WrLoEJhnvzUji1g6fUN6HE
	QEIX7QWfxDHuZPPX+nqFovlyvnIGP+FSOOv+B1y2ZKXmRdsGq9hsVlUDX8gSqCmRcAMn3nLV7jPiK
	NussHedjercaWLfSqlCk+XG3kbaZ+dkWtfDszNuhgaa1BH/b/4kwRxen9CcFJg+xIP/U79WnZ8I71
	Tkw5ioyYDUT1Ovgl5VK1VMoCiSVyM3M58Dka3MBt8dutaY5G539D7tdcdUCw5MEm3JfoSIYdUEt/3
	Ri5axrBBMnUPm+TO+fmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9gD5-000CqA-JJ; Tue, 18 Jan 2022 04:35:07 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9gD2-000Cps-7q
 for ath10k@lists.infradead.org; Tue, 18 Jan 2022 04:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642480504; x=1674016504;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=cibpk40MCYbJRdAtjSndjkEhdxX32g7Sj1HUR+i2dlU=;
 b=OFNLTRcpRoI8ywARSnjAxrZs9Peia9BFwHzMv+VoPBUYIXvFwyd+Ds1W
 yvS4FLeI6f6dNuCz7oqOHZcAEly5wzTtlybIEiBluIKKrxywd/p3iUMRP
 7HhlXKof2/AH5rDtsikjM60G5ksXjMQusWwmTmr1ui4vdWzS+q1gFyRr8
 9Taua0viUtRKrdsBD8xvJ1MGzIkuoecKSQ1criUtp5T9EvcCSyPMXcdpm
 INrz7jmcz4UCLKMY1/An8hORlO2kZEuTff7HRMYCPCMO3wvlXcbP0Z3Uy
 GgBkJoED1VYYNSAw4HCDzU5Q0ElS/rpIXVeXDclvXX4xhZY6ejC6euxBs g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="225415976"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="225415976"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 20:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="476842493"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 17 Jan 2022 20:35:01 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n9gCy-000C9x-L8; Tue, 18 Jan 2022 04:35:00 +0000
Date: Tue, 18 Jan 2022 12:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 6bae9de622d3ef4805aba40e763eb4b0975c4f6d
Message-ID: <61e6434c.cuLvJizpY9meCIDg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_203504_342620_34320D61 
X-CRM114-Status: UNSURE (   4.83  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 6bae9de622d3ef4805aba40e763eb4b0975c4f6d  ath10k: abstract htt_rx_desc structure

elapsed time: 799m

configs tested: 146
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220118
i386                 randconfig-c001-20220117
powerpc                     redwood_defconfig
arm64                            alldefconfig
arm                      integrator_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm8548_defconfig
arm                        oxnas_v6_defconfig
arm                         lubbock_defconfig
powerpc                 mpc837x_mds_defconfig
mips                 decstation_r4k_defconfig
powerpc                      makalu_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7722_defconfig
sh                          sdk7786_defconfig
arm                           tegra_defconfig
arm                        mini2440_defconfig
arc                        nsimosci_defconfig
powerpc                  iss476-smp_defconfig
arm                      jornada720_defconfig
sh                          urquell_defconfig
powerpc                  storcenter_defconfig
sparc                       sparc32_defconfig
arm                          pxa910_defconfig
arm                          simpad_defconfig
sh                          rsk7201_defconfig
s390                          debug_defconfig
sh                          polaris_defconfig
sh                         ap325rxa_defconfig
sh                             shx3_defconfig
xtensa                         virt_defconfig
arm                      footbridge_defconfig
m68k                       m5275evb_defconfig
arm                             ezx_defconfig
mips                             allmodconfig
powerpc                mpc7448_hpc2_defconfig
arm                             pxa_defconfig
m68k                       m5208evb_defconfig
arm                        spear6xx_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
um                             i386_defconfig
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
riscv                randconfig-c006-20220118
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
powerpc              randconfig-c003-20220118
i386                          randconfig-c001
mips                 randconfig-c004-20220116
s390                 randconfig-c005-20220116
mips                     cu1830-neo_defconfig
powerpc                  mpc866_ads_defconfig
arm                       mainstone_defconfig
powerpc                       ebony_defconfig
x86_64               randconfig-a005-20220117
x86_64               randconfig-a004-20220117
x86_64               randconfig-a001-20220117
x86_64               randconfig-a006-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
i386                 randconfig-a005-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
riscv                randconfig-r042-20220118
hexagon              randconfig-r045-20220116
hexagon              randconfig-r045-20220117
hexagon              randconfig-r045-20220118
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220118
hexagon              randconfig-r041-20220116
hexagon              randconfig-r041-20220117
s390                 randconfig-r044-20220118
s390                 randconfig-r044-20220116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
