Return-Path: <SRS0=VQBF=K6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C78EC07E94
	for <ath10k@archiver.kernel.org>; Fri,  4 Jun 2021 07:21:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 111D3601FA
	for <ath10k@archiver.kernel.org>; Fri,  4 Jun 2021 07:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 111D3601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XS+ffAUZgG50gV53d6AG2Hq9rpMmt6Bj2zBdfKiNDJY=; b=KQJJbhH4hR25q7
	ek3YFHG0zhErpDEGl10NX7kXZBBNez8HGF66RSjf8l9q+/6asYyS5shVAXQURx5XFCzlf+KRYQ+0f
	priJCpOAKUzeFyriztoVFxSOfn6Qt805Ut3Sw8a3R0tDIQ30pCT/S/ZFLJAhB6CblFwKFZfqkhT+j
	fwWuVJIIKgBJaC6aoSpTL7F6vjHY85jF0U5dflwdq7PVEnScTPODabM1dWlcfNKcBvBcyJdJUeI3j
	oeM5fKwhPGNPrmpf+pMXX7tzTxn5LyoftyExw8r/A1PS67kdH6C1uoQK9bdsX/93rFDGXxLtP0azj
	u4Rn6GT0UcS887BDxXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp48q-00C1uV-2z; Fri, 04 Jun 2021 07:21:16 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp48l-00C1rL-8r
 for ath10k@lists.infradead.org; Fri, 04 Jun 2021 07:21:12 +0000
IronPort-SDR: mAWe/D5n0K50oCejpHh6dsn4T6h33TioEyvgw09wzZ/Q470j3yCv4MDtdJ4PbEi+7ct6oEbkxw
 pHij+ssOYrCg==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204052487"
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; d="scan'208";a="204052487"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 00:21:09 -0700
IronPort-SDR: oHA0xN2VtrYPLFxL+rmadDWaskJyeYnsfk5KJMlRd9ftI0Cujtg89YEzMCI8oLa0j5q1PoypFc
 X14EPFXoOmMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,247,1616482800"; d="scan'208";a="551063586"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2021 00:21:08 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lp48i-0006m2-6u; Fri, 04 Jun 2021 07:21:08 +0000
Date: Fri, 04 Jun 2021 15:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master-pending] BUILD SUCCESS
 9c8fe244d32e0aad062fc92de356625a6bd59a11
Message-ID: <60b9d454.8Ig0coe869sdCQzX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_002111_389544_E48262F9 
X-CRM114-Status: UNSURE (   5.38  )
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
branch HEAD: 9c8fe244d32e0aad062fc92de356625a6bd59a11  Merge branch 'pending' into master-pending

elapsed time: 5189m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                      tct_hammer_defconfig
sh                          sdk7780_defconfig
riscv                    nommu_virt_defconfig
arm                           tegra_defconfig
powerpc                     ppa8548_defconfig
nds32                            alldefconfig
mips                           ip27_defconfig
arc                      axs103_smp_defconfig
sparc                       sparc64_defconfig
arm                         assabet_defconfig
powerpc                        cell_defconfig
m68k                            q40_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                          atari_defconfig
powerpc                   currituck_defconfig
arm                          collie_defconfig
sh                        sh7763rdp_defconfig
sh                   secureedge5410_defconfig
arm                             ezx_defconfig
arm                          exynos_defconfig
sh                            hp6xx_defconfig
arc                     haps_hs_smp_defconfig
powerpc                 linkstation_defconfig
mips                           ip32_defconfig
sh                     sh7710voipgw_defconfig
mips                        vocore2_defconfig
sh                           se7780_defconfig
m68k                        m5307c3_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     ep8248e_defconfig
mips                     loongson1c_defconfig
parisc                generic-32bit_defconfig
sh                          rsk7201_defconfig
sh                     magicpanelr2_defconfig
arm                        spear3xx_defconfig
openrisc                            defconfig
sh                           se7619_defconfig
mips                        nlm_xlp_defconfig
arm                          imote2_defconfig
ia64                                defconfig
arm                          pcm027_defconfig
arm                         s5pv210_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         cm_x300_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          r7780mp_defconfig
arm                         nhk8815_defconfig
arm                            zeus_defconfig
xtensa                    xip_kc705_defconfig
arm                        mini2440_defconfig
mips                      maltasmvp_defconfig
arm                  colibri_pxa300_defconfig
m68k                          hp300_defconfig
arm                            lart_defconfig
mips                      bmips_stb_defconfig
sh                            titan_defconfig
arm                           u8500_defconfig
arc                        vdk_hs38_defconfig
arm                          moxart_defconfig
um                           x86_64_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                       capcella_defconfig
nios2                               defconfig
s390                          debug_defconfig
sh                          rsk7269_defconfig
powerpc                       ppc64_defconfig
powerpc                      walnut_defconfig
arm                        spear6xx_defconfig
powerpc                     tqm8555_defconfig
mips                         mpc30x_defconfig
powerpc                 mpc836x_mds_defconfig
xtensa                         virt_defconfig
mips                     loongson2k_defconfig
powerpc                          g5_defconfig
i386                                defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210531
x86_64               randconfig-a003-20210531
x86_64               randconfig-a005-20210531
x86_64               randconfig-a004-20210531
x86_64               randconfig-a002-20210531
x86_64               randconfig-a001-20210531
i386                 randconfig-a002-20210531
i386                 randconfig-a001-20210531
i386                 randconfig-a005-20210531
i386                 randconfig-a006-20210531
i386                 randconfig-a004-20210531
i386                 randconfig-a003-20210531
i386                 randconfig-a016-20210531
i386                 randconfig-a015-20210531
i386                 randconfig-a013-20210531
i386                 randconfig-a012-20210531
i386                 randconfig-a014-20210531
i386                 randconfig-a011-20210531
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210531
x86_64               randconfig-a014-20210531
x86_64               randconfig-a012-20210531
x86_64               randconfig-a013-20210531
x86_64               randconfig-a016-20210531
x86_64               randconfig-a015-20210531
x86_64               randconfig-a011-20210531

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
