Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDCBC433F5
	for <ath10k@archiver.kernel.org>; Wed,  2 Feb 2022 02:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/dfvHDZi/NEIDZvo3WBRwKvh50/s0RUUO566cTU33CA=; b=bIrRutFE67w2gt
	idFMBl4wAjV1CYyZ01nHldX+T978qB5dMWv/FjKfUYF94W2V2peMnzqtUWeQJeQY1loQS9WG1RDbE
	ykJup9+VE2SH/YUPmWEB56jDfYI3oWSP2p2VSwXwifqxJdyOeKBfCd0p50rOsf9pugGkulYEYKx2M
	6bZ9sYsvLaa5BQI9XJSH7aGcvQK8QfFGfunR8QQQVQiXbWI2EoGvL2TS/RZIit88FbV9sPKZ79q5p
	wHuRQakofnjJVDEFNqH084l6TnWEqaguoafJZ8EebRxoRZQ2Rm5QfSGrlZEGTikiSbFa/emAN8dk8
	OhWbi/SWBkC1WQ7TWNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF5n2-00E29B-7W; Wed, 02 Feb 2022 02:54:36 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF5mu-00E26i-93
 for ath10k@lists.infradead.org; Wed, 02 Feb 2022 02:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643770468; x=1675306468;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=K8rfRaE1jjRhs6X7K+sbZPF3hnf8GP+csZg1toKI/S8=;
 b=fH/uFNOjvVAe1cfmnH0SGbAM74PeVE3TsiHo37ZqaWBN75OxVb9MUSYb
 VD0T6U/rSUlrRELQZTQmqLdKtNTjlW6kdebQwV59d/y/9ewX7LtR1sCcF
 d6YTyYaOmXFt4B9d1Qi8deWDdGjM9j3t94At3Kzltsb+AgY1g4uMI4t35
 UhYIk1FhIBUXIQUKKx/mVgJNVprs0tyKGcwErDYEbyCv2Zr58QWEBz+/q
 X5EilXHLJkH2P+zAxNGpPHqv0ruO38oUY6fW06OsV2KFr5jhLPGjt9NDp
 9r80WNtki5mQbN+D+BQ7cI3bSGOl01EsMPNYoyaOv+n84bvFGsupRommu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="235236592"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="235236592"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 18:54:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="771315736"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2022 18:54:26 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nF5mr-000U2D-GD; Wed, 02 Feb 2022 02:54:25 +0000
Date: Wed, 02 Feb 2022 10:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 bb47a1059f44ffa1068302b531619903d87236bf
Message-ID: <61f9f24b.fnL1megV+S/qQsYL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_185428_405965_BD69D8C6 
X-CRM114-Status: UNSURE (   6.45  )
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
branch HEAD: bb47a1059f44ffa1068302b531619903d87236bf  Merge branch 'ath-next' into ath-qca

elapsed time: 729m

configs tested: 159
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
h8300                            alldefconfig
powerpc                     redwood_defconfig
s390                       zfcpdump_defconfig
sh                           se7206_defconfig
powerpc                    amigaone_defconfig
powerpc                      ppc6xx_defconfig
arc                     nsimosci_hs_defconfig
arm                        trizeps4_defconfig
arm                        mvebu_v7_defconfig
parisc                           alldefconfig
m68k                       m5208evb_defconfig
sh                        apsh4ad0a_defconfig
sh                        dreamcast_defconfig
arm                      jornada720_defconfig
arm                           h3600_defconfig
openrisc                 simple_smp_defconfig
sh                           se7705_defconfig
sh                                  defconfig
mips                        vocore2_defconfig
arm                           stm32_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                      gensparse_defconfig
riscv                    nommu_k210_defconfig
arm                           corgi_defconfig
arm                         s3c6400_defconfig
sparc64                             defconfig
mips                         db1xxx_defconfig
mips                         mpc30x_defconfig
m68k                           sun3_defconfig
powerpc                  iss476-smp_defconfig
sh                          rsk7203_defconfig
sh                        edosk7760_defconfig
sh                           se7721_defconfig
powerpc                     stx_gp3_defconfig
sh                         ecovec24_defconfig
arc                                 defconfig
sh                               alldefconfig
m68k                          sun3x_defconfig
mips                      maltasmvp_defconfig
mips                         rt305x_defconfig
powerpc                      pasemi_defconfig
powerpc                     taishan_defconfig
xtensa                              defconfig
h8300                     edosk2674_defconfig
arm                         axm55xx_defconfig
sh                             espt_defconfig
m68k                       m5475evb_defconfig
sh                          sdk7786_defconfig
arm                        oxnas_v6_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
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
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
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
arc                  randconfig-r043-20220130
arc                  randconfig-r043-20220131
s390                 randconfig-r044-20220130
riscv                randconfig-r042-20220130
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
i386                          randconfig-c001
riscv                randconfig-c006-20220130
s390                 randconfig-c005-20220130
mips                           ip28_defconfig
arm                          collie_defconfig
arm                     davinci_all_defconfig
arm                       mainstone_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                   microwatt_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        vexpress_defconfig
mips                       lemote2f_defconfig
arm                       imx_v4_v5_defconfig
powerpc                 xes_mpc85xx_defconfig
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
i386                 randconfig-a011-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220130
hexagon              randconfig-r041-20220131
s390                 randconfig-r044-20220131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
