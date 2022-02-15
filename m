Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85B2C433EF
	for <ath10k@archiver.kernel.org>; Tue, 15 Feb 2022 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rLVBQcvsLcMoovDftRVeYznH0h8b5fjcVEWLizY/zKg=; b=Qcuf6K9zEg9QYt
	3WSzGMHHwfjmf0KK2NhS5hvD8woyDjPHYboKxQ/DZ9KzpxLV3ckVoOIaNR3V7ssh/64mFDobyUNyN
	dv7yGpnbzPHqcp7VrmiktmOMZJiJw4g/n8+t1fcDw3fnESLzO0DfeLtCZT3Uz/L6RO8BEJl6NPuFY
	tR4NdCjQo8l0w/ouYgWrB5zRUoIyit0n1jdEbgAzgV8mBBswlbK46nOpq0G08NElmSmqL0hlvtSla
	B/MV5+d11Xwlp36qKmPzZMYAmMpi7BLVTOuF7Fmz4sLHzQFpFdXe7j2uZV7AJZh9DJsZBBYkYVan1
	BI1aAYBsmOtqrd25Zwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK6VX-004o3f-Oa; Tue, 15 Feb 2022 22:41:15 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK6VU-004o3C-Ff
 for ath10k@lists.infradead.org; Tue, 15 Feb 2022 22:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644964872; x=1676500872;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=le8OVihsaKVVaswXTslhfZ+/jS5f5rpJF1SSK23377s=;
 b=nKtmKms0jcvjDJV54jXJK35swGRAux0v27Hx0N750nHXnW/yMnQVGuSt
 OpHSHTQNNp09755jAOXbCgurYOZ55SUU5IRBDJULkm7Mj4A4mTIGloZS7
 hrhIoZ40reJrJO6Tqv0AKn7uYxgpZe3JfYermkMTZXqouHoMM+uJPnhxY
 tV7+nrH+mJ0OP7dGTqphujZdBDu3cxXzCQWnmPihObrZh8deTMCHCgaZu
 0Pez3NRQvscJuNMxslRjXSN4dRM3fHkRzfnOwUHxI/oVJEbO7QF6Ne/wR
 RH26BDgMdRIW/h/tdMoMxbZc5vHVIiNqIWrFVk8uSNwPL40auv1BJDLYN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249301657"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="249301657"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 14:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="571026499"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 15 Feb 2022 14:41:10 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nK6VR-000A7F-D4; Tue, 15 Feb 2022 22:41:09 +0000
Date: Wed, 16 Feb 2022 06:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 c0066d8ed305f435cec4db9131782f264b125528
Message-ID: <620c2bd0.3noP96hCdohqasIB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_144112_606670_5A9B4021 
X-CRM114-Status: UNSURE (   6.19  )
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
branch HEAD: c0066d8ed305f435cec4db9131782f264b125528  Merge branch 'pending' into master-pending

elapsed time: 729m

configs tested: 159
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220214
mips                 randconfig-c004-20220214
powerpc                     tqm8541_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     mpc83xx_defconfig
arm                        trizeps4_defconfig
mips                      fuloong2e_defconfig
sh                        sh7763rdp_defconfig
arm                        realview_defconfig
arm                          iop32x_defconfig
arm                          simpad_defconfig
mips                         rt305x_defconfig
sh                           se7206_defconfig
arm                         axm55xx_defconfig
powerpc                     pq2fads_defconfig
mips                         mpc30x_defconfig
xtensa                         virt_defconfig
arc                     haps_hs_smp_defconfig
xtensa                              defconfig
arm                          lpd270_defconfig
nios2                               defconfig
arm                        spear6xx_defconfig
powerpc                       ppc64_defconfig
sh                     magicpanelr2_defconfig
arm                        oxnas_v6_defconfig
arm                       imx_v6_v7_defconfig
sh                            shmin_defconfig
mips                          rb532_defconfig
powerpc                      arches_defconfig
arm                          pxa910_defconfig
arm                            pleb_defconfig
mips                           xway_defconfig
sh                           se7721_defconfig
powerpc                       maple_defconfig
parisc                           alldefconfig
microblaze                          defconfig
ia64                             allmodconfig
xtensa                    xip_kc705_defconfig
mips                         db1xxx_defconfig
sh                            titan_defconfig
arm64                            alldefconfig
arm                        mvebu_v7_defconfig
sparc                               defconfig
sh                          kfr2r09_defconfig
arm                            xcep_defconfig
m68k                        stmark2_defconfig
s390                                defconfig
sh                        edosk7705_defconfig
m68k                          atari_defconfig
sh                        sh7757lcr_defconfig
arm                         at91_dt_defconfig
powerpc                    klondike_defconfig
h8300                               defconfig
arm                         lpc18xx_defconfig
powerpc                      bamboo_defconfig
arc                        nsimosci_defconfig
sh                          rsk7269_defconfig
powerpc                      ppc6xx_defconfig
csky                                defconfig
arm                  randconfig-c002-20220214
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
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
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
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
arm                                 defconfig
arm                         mv78xx0_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                          rm200_defconfig
arm                         palmz72_defconfig
powerpc                     kmeter1_defconfig
powerpc                     tqm8560_defconfig
powerpc                    gamecube_defconfig
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
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r045-20220214
hexagon              randconfig-r041-20220214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
