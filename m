Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A84CC433EF
	for <ath10k@archiver.kernel.org>; Wed, 23 Feb 2022 04:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LVkEU5/DABBwRo6iR/amlP+ee0+VJChWAlthJa1+D3M=; b=TTZxIZ9eJKsBmd
	kIEtRsRw98UhZujodz8nQZpgy9GlbOE9+YW+n25rGVEnr7w+GsF8KuJfAreWUL8tXNgKfpPAzaj+b
	nX1nC9PqF/EgBCpPwtn34Uwjmgsgs6PfGSJRxCeLArnXURnNHeIG1bLSWJsvlYmAZxLN6wVp/shr+
	473ieJnXEEszpY6GvXE3xrIOrCfBNe49gQDcnI0gtUXUL5/jyoXB/AJbOr6IT8YSKpTSauBkFFo4x
	bZeWYveH6PUZaBoNFAf7Bp3wWGId4QdjfUYT9BoJO3ZBJXgykZT4PVCmlM/2h30h+eouoJNgzBZd4
	pv1wHBkfRck6+8HyymWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMizp-00ClBB-VO; Wed, 23 Feb 2022 04:11:22 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMizl-00Cl8T-Ip
 for ath10k@lists.infradead.org; Wed, 23 Feb 2022 04:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645589477; x=1677125477;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=DukG06Noht+7hiWudWv2al/cCxd32E5TGb/r9VV5nvg=;
 b=PZPle6C8B5ky6DX8XJXs6+TDcz4Od5RrDGYOXYfbsGJAwR7QmrEGs2pW
 3FUYkVqXK/CI64qEkWyLrt7CaIpFfXT6pxGjnv1k5EbXIKcs9GAmgE6w/
 Z6ioVhpQozRCa0EYNeqYjQGedsLeeWjCvAFBNH4qji1Y3fuW77gJ1ViJF
 evFgoz9fgpntfO32qhnSuB01aCqfYV2BSbvU/ASjudQPYSLs3tYeHW/kC
 a9Rc2iqoWgvXWkuhIpusqiYud0cwNU+UK1g90G6GvukQ0IWHYcogRwkM3
 0KDWocaILAe3YPKQyzSVVHW/1FLzVl9EFClfgEiZrU9497bM3i8LyIjFi w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="239268673"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="239268673"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 20:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="573683753"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 22 Feb 2022 20:11:14 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMizh-0000xK-Th; Wed, 23 Feb 2022 04:11:13 +0000
Date: Wed, 23 Feb 2022 12:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD REGRESSION
 4136ddcfda28450e2d01173e37300b95c8687d9b
Message-ID: <6215b3a1.SUfrIxfsa1oxHsZa%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_201117_731527_748B053F 
X-CRM114-Status: UNSURE (   7.37  )
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
branch HEAD: 4136ddcfda28450e2d01173e37300b95c8687d9b  ath11k: support GTK rekey offload

Error/Warning reports:

https://lore.kernel.org/lkml/202202230812.uOGgSw5k-lkp@intel.com

Error/Warning in current branch:

drivers/net/wireless/ath/ath11k/wow.c:467:5: error: redefinition of 'ath11k_wow_init'
drivers/net/wireless/ath/ath11k/wow.c:482:22: error: 'struct wiphy' has no member named 'wowlan'
drivers/net/wireless/ath/ath11k/wow.c:810:5: error: redefinition of 'ath11k_wow_init'
drivers/net/wireless/ath/ath11k/wow.c:830:22: error: 'struct wiphy' has no member named 'wowlan'

possible Error/Warning in current branch (please contact us if interested):

drivers/net/wireless/ath/ath11k/hal_rx.c:1246:3: warning: Value stored to 'he_stbc' is never read [clang-analyzer-deadcode.DeadStores]
drivers/net/wireless/ath/ath11k/hal_rx.c:1415:3: warning: Value stored to 'he_dcm' is never read [clang-analyzer-deadcode.DeadStores]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-wow.c:error:redefinition-of-ath11k_wow_init
|   `-- drivers-net-wireless-ath-ath11k-wow.c:error:struct-wiphy-has-no-member-named-wowlan
|-- alpha-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-wow.c:error:redefinition-of-ath11k_wow_init
|   `-- drivers-net-wireless-ath-ath11k-wow.c:error:struct-wiphy-has-no-member-named-wowlan
|-- m68k-allmodconfig
|   |-- drivers-net-wireless-ath-ath11k-wow.c:error:redefinition-of-ath11k_wow_init
|   `-- drivers-net-wireless-ath-ath11k-wow.c:error:struct-wiphy-has-no-member-named-wowlan
|-- m68k-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-wow.c:error:redefinition-of-ath11k_wow_init
|   `-- drivers-net-wireless-ath-ath11k-wow.c:error:struct-wiphy-has-no-member-named-wowlan
|-- nios2-allyesconfig
|   |-- drivers-net-wireless-ath-ath11k-wow.c:error:redefinition-of-ath11k_wow_init
|   `-- drivers-net-wireless-ath-ath11k-wow.c:error:struct-wiphy-has-no-member-named-wowlan
`-- parisc-allyesconfig
    |-- drivers-net-wireless-ath-ath11k-wow.c:error:redefinition-of-ath11k_wow_init
    `-- drivers-net-wireless-ath-ath11k-wow.c:error:struct-wiphy-has-no-member-named-wowlan

clang_recent_errors
`-- x86_64-randconfig-c007
    |-- drivers-net-wireless-ath-ath11k-hal_rx.c:warning:Value-stored-to-he_dcm-is-never-read-clang-analyzer-deadcode.DeadStores
    `-- drivers-net-wireless-ath-ath11k-hal_rx.c:warning:Value-stored-to-he_stbc-is-never-read-clang-analyzer-deadcode.DeadStores

elapsed time: 805m

configs tested: 126
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
powerpc                       maple_defconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                            q40_defconfig
powerpc                     pq2fads_defconfig
ia64                         bigsur_defconfig
h8300                    h8300h-sim_defconfig
powerpc                         ps3_defconfig
m68k                        m5307c3_defconfig
mips                         db1xxx_defconfig
sparc                               defconfig
arm                          pxa910_defconfig
arm                          gemini_defconfig
arm                       imx_v6_v7_defconfig
powerpc                       ppc64_defconfig
ia64                            zx1_defconfig
arm                        multi_v7_defconfig
alpha                            alldefconfig
parisc                              defconfig
sh                            shmin_defconfig
mips                            gpr_defconfig
arc                     haps_hs_smp_defconfig
arm                           stm32_defconfig
um                                  defconfig
arm                           sunxi_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          rsk7203_defconfig
mips                         bigsur_defconfig
arm                          badge4_defconfig
arm                       multi_v4t_defconfig
m68k                       bvme6000_defconfig
powerpc                   currituck_defconfig
mips                           ci20_defconfig
microblaze                      mmu_defconfig
powerpc                    amigaone_defconfig
arm                  randconfig-c002-20220221
arm                  randconfig-c002-20220222
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
s390                                defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
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
x86_64               randconfig-a003-20220221
x86_64               randconfig-a002-20220221
x86_64               randconfig-a005-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a004-20220221
i386                 randconfig-a002-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a006-20220221
i386                 randconfig-a004-20220221
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
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
mips                       lemote2f_defconfig
mips                          ath79_defconfig
powerpc                     tqm8540_defconfig
arm64                            allyesconfig
x86_64               randconfig-a011-20220221
x86_64               randconfig-a015-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
