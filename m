Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E89C433EF
	for <ath10k@archiver.kernel.org>; Wed, 16 Feb 2022 03:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KpLKFsSzgZ6mgxaIpSzUKuS8+wt5PAs6k+Xdnnn4zkk=; b=Ol6Hy3QnpBWqfj
	8Rj2+Am58uuuJSA5VDfIE1voPjHRI49KFS2+zbbpQK+MdnLN454m8F6pASZuNNzA0MPMB0eqq6Vj/
	gmF/L+K7cn1wcFXWmG9SdDIMY2VnpzXsB0dJLlzOjdTiFF/G/W7hq7xUwDQItepbeqAJK1S+/mwV/
	dbx7A1TMhoj19SNzFuCQVG1aMAkas0WbnWf3nXonpSYW+uogwVJ2LMOIj7h/IEzmTRkrAX9zv6Vke
	+iBZatOioiTW/vL4awBO5fqxIY8peoyouS19ntvu5ps5OnMbit0nO9yCK3Bh3vomacApSagV+w0W0
	52teR3I9UlW5mmEMMiQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKAi5-005NJ6-Ho; Wed, 16 Feb 2022 03:10:29 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKAi2-005NIo-C4
 for ath10k@lists.infradead.org; Wed, 16 Feb 2022 03:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644981026; x=1676517026;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=VHXcJOJ1AoLhTx6cbjkJF9Xi2BdRBYNrkeW8V790V9Q=;
 b=HY8s2xZXpSCykSJfztWsLpWO6Sl+1bU7fLGPZ2Ggw7u7hPAR2ltFIuJe
 0k8Q9DETAHRWs2VzqgIMLGeImusSn4hr0GLHnBmMtIm4DTuHB9tX8ZIGu
 rHIGIT7494CqXc8lEdR2orNJq99JLEtoGVfeJljWtOEa9XDBTuvhAOVzv
 4XytEzTDnE577qOZtPa5WCRxIMhF0h3SzeQAApsNl1PPQYAqJdvQZPSGq
 LPtdxAg9NKfSpU67d8pDcIZDLSwDPTT71bIX+8aX0krXKQvyzTfJnzgRB
 /mFdAyEYMmQ4vseebkr6rZfttrJJ1KQx7AyABLvMxPhtIjcdsppoRX9MC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250712611"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="250712611"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 19:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="486622689"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 15 Feb 2022 19:10:22 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKAhx-000AL8-Id; Wed, 16 Feb 2022 03:10:21 +0000
Date: Wed, 16 Feb 2022 11:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD REGRESSION
 444199a9f89e574f35972a5e9da21faf65c4ca3a
Message-ID: <620c6b18.6biYrZ+l41MNqnZT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_191026_520271_F301EECE 
X-CRM114-Status: UNSURE (   5.87  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: 444199a9f89e574f35972a5e9da21faf65c4ca3a  ath12k: Fix msdu sg handling in raw mode

Error/Warning in current branch:

drivers/net/wireless/ath/ath12k/dp_mon.c:1902:32: warning: implicit conversion from 'enum hal_rx_mon_status' to 'enum hal_tx_tlv_status' [-Wenum-conversion]
drivers/net/wireless/ath/ath12k/dp_rx.c:2739:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_tx.c:605:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/hal_rx.c:406:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

possible Error/Warning in current branch (please contact us if interested):

drivers/net/wireless/ath/ath12k/debugfs.c:250:15: error: implicit declaration of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath12k/debugfs.c:275:9: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/ath12k/pci.c:667:14: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-debugfs.c:error:implicit-declaration-of-function-vfree
|   `-- drivers-net-wireless-ath-ath12k-debugfs.c:error:implicit-declaration-of-function-vmalloc
|-- arc-allyesconfig
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- powerpc-allmodconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
`-- powerpc-allyesconfig
    |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
    |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
    |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
    `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size

elapsed time: 726m

configs tested: 155
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220214
mips                 randconfig-c004-20220214
mips                      fuloong2e_defconfig
sh                        sh7763rdp_defconfig
arm                        realview_defconfig
arm                          iop32x_defconfig
arm                          simpad_defconfig
csky                                defconfig
mips                         rt305x_defconfig
sh                           se7206_defconfig
arm                         axm55xx_defconfig
powerpc                     pq2fads_defconfig
mips                         mpc30x_defconfig
nios2                               defconfig
arm                        spear6xx_defconfig
powerpc                     mpc83xx_defconfig
sh                   sh7724_generic_defconfig
mips                  maltasmvp_eva_defconfig
arm                         s3c6400_defconfig
h8300                    h8300h-sim_defconfig
mips                        vocore2_defconfig
powerpc                 mpc8540_ads_defconfig
arm                       imx_v6_v7_defconfig
sh                            shmin_defconfig
arm                          gemini_defconfig
m68k                             allmodconfig
powerpc                         wii_defconfig
mips                       bmips_be_defconfig
powerpc                      arches_defconfig
arm                          pxa910_defconfig
arm                            pleb_defconfig
mips                           xway_defconfig
mips                          rb532_defconfig
sh                           se7721_defconfig
ia64                             allmodconfig
xtensa                    xip_kc705_defconfig
mips                         db1xxx_defconfig
sh                            titan_defconfig
sparc                               defconfig
arm64                            alldefconfig
arm                        mvebu_v7_defconfig
sh                          kfr2r09_defconfig
arm                            xcep_defconfig
m68k                        stmark2_defconfig
s390                                defconfig
sh                        edosk7705_defconfig
nds32                               defconfig
arm                        shmobile_defconfig
openrisc                 simple_smp_defconfig
m68k                          atari_defconfig
sh                        sh7757lcr_defconfig
sparc                            allyesconfig
sh                             espt_defconfig
mips                       capcella_defconfig
arm                        cerfcube_defconfig
mips                      loongson3_defconfig
sh                          rsk7269_defconfig
powerpc                      ppc6xx_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20220214
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20220214
x86_64               randconfig-a014-20220214
x86_64               randconfig-a012-20220214
x86_64               randconfig-a015-20220214
x86_64               randconfig-a011-20220214
x86_64               randconfig-a016-20220214
i386                 randconfig-a013-20220214
i386                 randconfig-a016-20220214
i386                 randconfig-a012-20220214
i386                 randconfig-a015-20220214
i386                 randconfig-a011-20220214
i386                 randconfig-a014-20220214
riscv                randconfig-r042-20220214
arc                  randconfig-r043-20220214
s390                 randconfig-r044-20220214
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
riscv                randconfig-c006-20220214
i386                 randconfig-c001-20220214
x86_64               randconfig-c007-20220214
powerpc              randconfig-c003-20220214
arm                  randconfig-c002-20220214
mips                 randconfig-c004-20220214
arm                        neponset_defconfig
powerpc                      ppc44x_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 mpc832x_mds_defconfig
riscv                             allnoconfig
powerpc               mpc834x_itxgp_defconfig
mips                          rm200_defconfig
arm                         palmz72_defconfig
arm                         mv78xx0_defconfig
powerpc                     kmeter1_defconfig
powerpc                     tqm8560_defconfig
arm                          ep93xx_defconfig
arm                        spear3xx_defconfig
arm                         lpc32xx_defconfig
mips                     cu1830-neo_defconfig
x86_64               randconfig-a002-20220214
x86_64               randconfig-a006-20220214
x86_64               randconfig-a005-20220214
x86_64               randconfig-a004-20220214
x86_64               randconfig-a003-20220214
x86_64               randconfig-a001-20220214
i386                 randconfig-a004-20220214
i386                 randconfig-a005-20220214
i386                 randconfig-a006-20220214
i386                 randconfig-a002-20220214
i386                 randconfig-a003-20220214
i386                 randconfig-a001-20220214
hexagon              randconfig-r045-20220214
hexagon              randconfig-r041-20220214
hexagon              randconfig-r045-20220216
hexagon              randconfig-r041-20220216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
