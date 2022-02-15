Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC362C433F5
	for <ath10k@archiver.kernel.org>; Tue, 15 Feb 2022 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FhMetLBx2NgvFFU9zscWH7LLzOal51oQUa1fspJ5fyA=; b=i4ibtb6VqBRh+9
	vYJaYiAWUEm5DCH0VI/yeCFk1RNL3Flthb+DXrn6eH+fiQLe7tV0Oz+n4Biqvfo4N0FCor0MWz6Gz
	KoOC/uj28fd1M6ISWCNBUDhJH95NyUePcMQqLQPMjOh9n382b2kf7dWKPclYgXe//c1GbCVVyj4oL
	4YsK/g4SSVZupO/1UGvS9M1b6sYu4Yxrn3hkXrAPEX7WvO8FMH5csiMhc2O6pTyBDswpViETscFI+
	p0jlYEJZIrEN7HxMqj2VIbOTBaT5q7djRdA2mvnoQS81H3DrWbyyidX3tvdqpp1zYMg4szPfcG3V5
	o+Ayq9X8JM77RiL9RLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK6Va-004o3t-F0; Tue, 15 Feb 2022 22:41:18 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK6VW-004o3O-8z
 for ath10k@lists.infradead.org; Tue, 15 Feb 2022 22:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644964874; x=1676500874;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=kIF2zgKaidq2x0K5cQiAMFMq9SeTLmvQ+Hi47JYRoAc=;
 b=bGi4amktbG2fTSwydk0EBEg7D+IZ8f6c73js5kXGDVwjvdg11TZ6PFHD
 3z8aXC6muYJybvL46ZVOEmLkKunsIPOViUBSwS5fjnktgt+i7OjFL0q9s
 LPyuwcbM8tjaqmkHVPcUjqNauFFJtahEaemVryj3SMgXKIX7giFwsuEZU
 Ic7mH6rYxLTkPPneo4RDXd5EzPTGbyzpwwONucSD+LLaa/ojo5rujnEUL
 UMHFRKRMb+LGIphlYujGyHq2XJVuQzouD3FxTZ1+tWB1M7+++T7lrZmp5
 aM5+x5O6Jbkp1cPwpjyg3CrJmsRiRqrVkaoUZLS0cscxOJE2yP8dTmnHR Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="336901610"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="336901610"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 14:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="636171148"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 15 Feb 2022 14:41:10 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nK6VR-000A7A-C5; Tue, 15 Feb 2022 22:41:09 +0000
Date: Wed, 16 Feb 2022 06:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 cbea0a144188a94bccf33f98dace67e20b5c6a74
Message-ID: <620c2bc9.dBb5qSnSrPa4Xgnc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_144114_381809_1F232433 
X-CRM114-Status: UNSURE (   4.69  )
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
branch HEAD: cbea0a144188a94bccf33f98dace67e20b5c6a74  ath9k: use swap() to make code cleaner

elapsed time: 728m

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
