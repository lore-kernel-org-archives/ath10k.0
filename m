Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509BEC433FE
	for <ath10k@archiver.kernel.org>; Wed, 12 Jan 2022 20:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2cnegBqlvlM4nUeGVBLWtpNiDHp1GjlFfkTSHeajSjA=; b=BuG9ffDoCGWo8+
	TFZT1nieTRDpotsPToc+sYxQWhcjJqrIQ7VB8GSwewIfmehJOBcHy0t1dGm9+UjvwAyY8DPWemgtI
	N0D1h9Gm9p836H/qyDQ9fjZ93S9VXj010QoUy8Ck0i8zItz3cv+OOtt9/tulxOJotxV8Psr/8Q9xL
	4GpNzfM3pn3D9yAso329c6wvTJRNAR15ucz4m/IhiGYK/haDLsU/7ApTpjPAdai1hZlyLb0gi42zg
	QkkaCbkMEXOIAzeGvOcp8mrFuWqgXjIVAiLEMTgiaJP0/6PG3vqXEBy4Pgj+qdLxzuI5QmSGCjE7X
	iTSx2/Zo/ws53yfhU6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7kZY-003ll8-QR; Wed, 12 Jan 2022 20:50:20 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7kZU-003lic-Bw
 for ath10k@lists.infradead.org; Wed, 12 Jan 2022 20:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642020616; x=1673556616;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=ga2y4BWr7jcwI5gywDxGwRS3a3QX9IKW1QCTDq06AP0=;
 b=E3dPTSHSRLfsjV5dDvWzur5Kb7c4P9T+/jx4IZ6FW2Q1Y89IStG4RwyZ
 rbyB1DfgcZ/sfYFQizIO8Q0CBjP+Hgk58B2Ws0ZVGmEVnVbYPnOX3Z8Ag
 PIQiIYrF7qET5lbMfnCVSPfY6svOkyv2a0YjIqthEKRnGGTpZTwUOqnfb
 Fl/xBMcr+lP1bKgdDK6papZw+h80KmLeHfNQ00ytXeAfjcetxovwjniH8
 IplY2onfUazJFhkiqgBgdSoEYbGCT+4YkpdD5n04lC3T//PhiDR3OZKlX
 frZvLgu5t8QZo1fWdUewQqEIsushyH9ZVwqYCrlT8k4QPPt4dADlBR5MP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="224542456"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="224542456"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 12:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="620357812"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jan 2022 12:50:14 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7kZR-0006Oa-H2; Wed, 12 Jan 2022 20:50:13 +0000
Date: Thu, 13 Jan 2022 04:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD REGRESSION
 061c4062835233faef6961a898155015fc5e0631
Message-ID: <61df3ee3.OTjElkAWKL6+yrlW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_125016_481423_0D05ACDF 
X-CRM114-Status: UNSURE (   5.45  )
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
branch HEAD: 061c4062835233faef6961a898155015fc5e0631  ath10k: abstract htt_rx_desc structure

Error/Warning reports:

https://lore.kernel.org/lkml/202201130245.W7Ps705H-lkp@intel.com

Error/Warning in current branch:

drivers/net/wireless/ath/ath11k/wmi.c:7833:39: error: 'struct ath11k' has no member named 'debug'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- xtensa-randconfig-r024-20220112
    `-- drivers-net-wireless-ath-ath11k-wmi.c:error:struct-ath11k-has-no-member-named-debug

elapsed time: 727m

configs tested: 156
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220112
arm                         cm_x300_defconfig
csky                             alldefconfig
powerpc                      ppc6xx_defconfig
powerpc                         wii_defconfig
arm                           u8500_defconfig
nds32                               defconfig
sh                           se7722_defconfig
mips                            ar7_defconfig
parisc                           allyesconfig
mips                        vocore2_defconfig
sh                          lboxre2_defconfig
sh                          rsk7269_defconfig
sh                          r7780mp_defconfig
arm                         vf610m4_defconfig
powerpc                      mgcoge_defconfig
powerpc                    klondike_defconfig
arm                           stm32_defconfig
powerpc                      bamboo_defconfig
x86_64                              defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       bvme6000_defconfig
sh                        apsh4ad0a_defconfig
sh                              ul2_defconfig
arm                        realview_defconfig
powerpc                       holly_defconfig
powerpc                  storcenter_defconfig
arm                         assabet_defconfig
arm                      footbridge_defconfig
arm                       multi_v4t_defconfig
ia64                             alldefconfig
mips                     decstation_defconfig
powerpc                        warp_defconfig
arm                       omap2plus_defconfig
sparc64                             defconfig
mips                          rb532_defconfig
powerpc                    adder875_defconfig
ia64                                defconfig
sh                     sh7710voipgw_defconfig
arm                      integrator_defconfig
powerpc                  iss476-smp_defconfig
mips                      fuloong2e_defconfig
mips                           jazz_defconfig
arm64                            alldefconfig
m68k                        m5272c3_defconfig
powerpc                 mpc834x_mds_defconfig
microblaze                      mmu_defconfig
sh                           se7721_defconfig
sh                          polaris_defconfig
arm                        mini2440_defconfig
powerpc                     taishan_defconfig
arm                          simpad_defconfig
xtensa                generic_kc705_defconfig
nios2                            allyesconfig
mips                           ip32_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7705_defconfig
xtensa                  nommu_kc705_defconfig
h8300                            alldefconfig
sh                           se7751_defconfig
sh                           se7724_defconfig
mips                     loongson1b_defconfig
powerpc                      cm5200_defconfig
arm                  randconfig-c002-20220112
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
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
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220112
x86_64                        randconfig-c007
riscv                randconfig-c006-20220112
powerpc              randconfig-c003-20220112
i386                          randconfig-c001
mips                 randconfig-c004-20220112
powerpc                     akebono_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                          collie_defconfig
arm                          pcm027_defconfig
arm                     am200epdkit_defconfig
arm                         palmz72_defconfig
arm                          imote2_defconfig
arm                             mxs_defconfig
arm                          pxa168_defconfig
powerpc                  mpc866_ads_defconfig
mips                      pic32mzda_defconfig
mips                        bcm63xx_defconfig
mips                          rm200_defconfig
arm                          ixp4xx_defconfig
hexagon                             defconfig
arm                        spear3xx_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220112
riscv                randconfig-r042-20220112
hexagon              randconfig-r041-20220112

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
