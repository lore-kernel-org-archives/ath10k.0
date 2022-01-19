Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D91C433EF
	for <ath10k@archiver.kernel.org>; Wed, 19 Jan 2022 21:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Z97i+hyygqv1LtKZilVHNk0jralsnA9drYWl+QZPnw=; b=z8huNdZEEyui8P
	DAoUExXei1Ui3Yh0XzrgC+zFsgqk7HCrikY9L0ZpnKpcEIfHTU53ycHTw90AvVHQor5Lh8GuwnyJn
	ZyO6CeBxC/Rx0Biz2MGr/CNGkqcVTpIl+cp2oqkvB+oIwY83tpKWR3JFLw39anhupBLBPCVoRZTfX
	btcgSiXYwispIZG0Q3vQmo5KM8AnnUmCvxlgpWSZp089M62aPh7F8w3BI9/E4JEvDof9RARUNvIbs
	BvXlmOJbWBnUi+swSlxVhKHnaEfnvc2hsmVexdGKtIvV77inF6KUDq3R27aU39UCbw+oSw7jDfbvw
	UIoU4xiouq8Bh813ywOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAIfM-007X09-Q7; Wed, 19 Jan 2022 21:38:52 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAIfG-007Wy2-Ux
 for ath10k@lists.infradead.org; Wed, 19 Jan 2022 21:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642628326; x=1674164326;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Asla11ohpuRc17eaNVR2QnnEr0NQcGVlVp8kGTkgNFU=;
 b=Rncuqe5GTGG8tz860RN5dEAAAo8rVHUyb5jSsFACjTqPz9tp+4zpbDW7
 2dC56YuS6WEH/3MMs+FewwSUwo0qBHzuKzXIzun3EZYvn36LV6cWzkFYa
 yOpXwY0IuQvrGh1CJ+LbCM4AOnUQnpq5SAjdwHY7oXAhmWNjzioWO5fgJ
 E/EEQmgYb51zU+5VjgZ886ZnqN0q9AHjLPyF+/eMC/e4ZAAgYkL6vglhJ
 ifCt5Ej4c67k6gwzJNRBxFLbbjBSokzERV7HQiWxX/7+TekJIkacWLxlr
 DTHrUTDY2drC7JSB8hqYeKNMwkuW3PRXHfB8oF2eTOaAYeCBY345skJ7p g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="232562503"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="232562503"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="626050291"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 19 Jan 2022 13:38:41 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nAIfB-000Dlo-9j; Wed, 19 Jan 2022 21:38:41 +0000
Date: Thu, 20 Jan 2022 05:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 2cf3ca75d2b9266555571eeff7ac6a33efb325fd
Message-ID: <61e884d6.evta1l0S/Ec1OzmX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_133847_097255_44486665 
X-CRM114-Status: UNSURE (   6.83  )
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
branch HEAD: 2cf3ca75d2b9266555571eeff7ac6a33efb325fd  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 135
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
h8300                       h8s-sim_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
csky                                defconfig
powerpc                  iss476-smp_defconfig
sh                          sdk7786_defconfig
sh                            shmin_defconfig
mips                           ip32_defconfig
arm                            qcom_defconfig
arm                            hisi_defconfig
mips                       bmips_be_defconfig
sh                     magicpanelr2_defconfig
sh                          r7780mp_defconfig
mips                      maltasmvp_defconfig
xtensa                    smp_lx200_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
arm                  randconfig-c002-20220119
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
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
riscv                randconfig-r042-20220117
arc                  randconfig-r043-20220116
arc                  randconfig-r043-20220117
s390                 randconfig-r044-20220119
s390                 randconfig-r044-20220117
arc                  randconfig-r043-20220118
arc                  randconfig-r043-20220119
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
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
arm                  randconfig-c002-20220118
riscv                randconfig-c006-20220118
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
powerpc              randconfig-c003-20220118
i386                          randconfig-c001
mips                 randconfig-c004-20220116
arm                                 defconfig
riscv                            alldefconfig
arm                            mmp2_defconfig
arm                  colibri_pxa300_defconfig
mips                           ip22_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                   sb1250_swarm_defconfig
arm                          ixp4xx_defconfig
i386                             allyesconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                  mpc866_ads_defconfig
arm                          ep93xx_defconfig
hexagon                             defconfig
mips                      maltaaprp_defconfig
arm                          collie_defconfig
x86_64               randconfig-a001-20220117
x86_64               randconfig-a006-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
x86_64               randconfig-a005-20220117
x86_64               randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a005-20220117
i386                 randconfig-a006-20220117
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
