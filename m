Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0346FC433FE
	for <ath10k@archiver.kernel.org>; Fri, 18 Nov 2022 02:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dy9MBREc0RD+tXUgfd/oSBoiGwicHySt/PzsJTJZCrI=; b=jr0x9p2AmWwLMv
	XT2GePm0XMprKeL9pEwUc0Xm08giQLEZsGOFqLB9Zqj+20Te+YpN5qEzx8teN37NQVYLEAPemzBhw
	vNxP8Chx64gZDms+IHDcO3vjw0YOzvtaAabGjoNTxyN5ynRe2d79w3tql3dRTzWAqik0TNh5yJe5x
	3FOaUMY9qAuxo7tJVrt9NxVQ8gl+jWA95aIGPCNkRP05EyCNebh4iTnmuixPtbZ//w3QabxAS9RIO
	89+y7aUjXJTE9LokkGYTxYANOxirR0/R/pNpT1XocUy2x2s3NCjl1XH2NKdn5UUqNANZYBTJas9FF
	MhhMqnGJVdZ116P5rQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovqmy-001OCr-Sg; Fri, 18 Nov 2022 02:07:32 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovqmv-001OCU-PN
	for ath10k@lists.infradead.org; Fri, 18 Nov 2022 02:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668737249; x=1700273249;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qm0BIkd8/0u3kzrKaj+ssW77ykeIQkos3z5kI4+eQbM=;
  b=iJ/GlqAA6z0aeV8vKpA4/L+3MWQIGJ9MAuh+l6zpt7g3kU08tCQ90DaM
   eQ99JFRRPV37n/nyvQC3cJVk3FwTLVzovW0t8HWQGwjP1OuwVOvvHmUPS
   G/04i3FIoFfv+6lJE552vOBZ5aXRB4yIuiGn3QO8U7206+9tzhz/rG0ml
   sZoiHkEk7kel7o84IV/+jUKVOD3c6F+83qKhofRqLlgfTTtlWMr40EEbt
   t2T2ruZl148xdCEpi0X+tUBvSo715p6kUoqWWkjSdOdEWOWb9AnW1G7Ew
   bARYloBW38JOOpP0KdObyEXvvxDezqszyyVlRWG2qB0kO3hPUDDazPodp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="339864888"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="339864888"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 18:07:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="708861762"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="708861762"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Nov 2022 18:07:26 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovqms-0000vC-0h;
	Fri, 18 Nov 2022 02:07:26 +0000
Date: Fri, 18 Nov 2022 10:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 a60c0401729851bfe637c2c8af5f759ea985336f
Message-ID: <6376e8be.o/bXIR0LGmxo0NJf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_180729_902275_03C04719 
X-CRM114-Status: UNSURE (   6.96  )
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
branch HEAD: a60c0401729851bfe637c2c8af5f759ea985336f  wifi: ath10k: Use IEEE80211_SEQ_TO_SN() for seq_ctrl conversion

elapsed time: 12643m

configs tested: 226
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                            allnoconfig
ia64                             allmodconfig
sh                   secureedge5410_defconfig
parisc                generic-64bit_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                    xip_kc705_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_mds_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
arc                        nsimosci_defconfig
xtensa                           alldefconfig
parisc                generic-32bit_defconfig
i386                          randconfig-c001
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
powerpc                       ppc64_defconfig
arm                          pxa910_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20221111
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arc                           tb10x_defconfig
sh                         apsh4a3a_defconfig
powerpc                    amigaone_defconfig
riscv                randconfig-r042-20221111
arc                  randconfig-r043-20221111
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                          allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arm                         axm55xx_defconfig
parisc                           alldefconfig
parisc64                            defconfig
openrisc                            defconfig
openrisc                  or1klitex_defconfig
arm                      footbridge_defconfig
sh                        apsh4ad0a_defconfig
sh                   rts7751r2dplus_defconfig
sh                        sh7757lcr_defconfig
mips                      fuloong2e_defconfig
mips                            gpr_defconfig
m68k                       m5208evb_defconfig
mips                           jazz_defconfig
mips                      loongson3_defconfig
powerpc                      cm5200_defconfig
mips                 randconfig-c004-20221111
m68k                          hp300_defconfig
arm                         at91_dt_defconfig
m68k                       m5275evb_defconfig
powerpc                 linkstation_defconfig
arm                       imx_v6_v7_defconfig
mips                 decstation_r4k_defconfig
arm                        oxnas_v6_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                      ppc6xx_defconfig
powerpc                    sam440ep_defconfig
loongarch                 loongson3_defconfig
powerpc                    adder875_defconfig
powerpc                  storcenter_defconfig
mips                           ip32_defconfig
ia64                             alldefconfig
m68k                         apollo_defconfig
m68k                        m5407c3_defconfig
arm                          iop32x_defconfig
arm                             pxa_defconfig
sh                          sdk7786_defconfig
arc                    vdk_hs38_smp_defconfig
sh                   sh7724_generic_defconfig
mips                         rt305x_defconfig
m68k                           virt_defconfig
m68k                       m5249evb_defconfig
m68k                        mvme147_defconfig
sh                   sh7770_generic_defconfig
mips                     loongson1b_defconfig
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
arc                 nsimosci_hs_smp_defconfig
mips                  decstation_64_defconfig
arm                        multi_v7_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      pcm030_defconfig
arc                     nsimosci_hs_defconfig
m68k                           sun3_defconfig
sparc64                          alldefconfig
arm                          pxa3xx_defconfig
microblaze                          defconfig
arc                         haps_hs_defconfig
sh                           se7619_defconfig
arm64                            alldefconfig
powerpc                     pq2fads_defconfig
openrisc                    or1ksim_defconfig
arc                        nsim_700_defconfig
arm                          simpad_defconfig
arm                        mini2440_defconfig
sh                            migor_defconfig
sh                         microdev_defconfig
sh                         ecovec24_defconfig
arm                           tegra_defconfig
arm                           viper_defconfig
ia64                        generic_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     redwood_defconfig
xtensa                         virt_defconfig
powerpc                        warp_defconfig
powerpc                     sequoia_defconfig
m68k                          amiga_defconfig
mips                           ci20_defconfig
ia64                          tiger_defconfig
sh                          rsk7201_defconfig
arc                  randconfig-r043-20221114
x86_64               randconfig-a003-20221114
x86_64               randconfig-a005-20221114
x86_64               randconfig-a001-20221114
i386                 randconfig-a002-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a001-20221114
x86_64                        randconfig-c001
arm                  randconfig-c002-20221115

clang tested configs:
hexagon              randconfig-r041-20221111
hexagon              randconfig-r045-20221111
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
s390                 randconfig-r044-20221110
riscv                randconfig-r042-20221110
hexagon              randconfig-r041-20221110
hexagon              randconfig-r045-20221110
mips                malta_qemu_32r6_defconfig
arm                       aspeed_g4_defconfig
mips                      pic32mzda_defconfig
arm                         lpc32xx_defconfig
powerpc                      obs600_defconfig
x86_64                        randconfig-k001
riscv                randconfig-c006-20221111
mips                 randconfig-c004-20221111
powerpc              randconfig-c003-20221111
s390                 randconfig-c005-20221111
mips                        qi_lb60_defconfig
mips                  cavium_octeon_defconfig
powerpc                     skiroot_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                          g5_defconfig
powerpc                      ppc44x_defconfig
powerpc                    gamecube_defconfig
powerpc                 xes_mpc85xx_defconfig
hexagon                             defconfig
mips                          malta_defconfig
riscv                             allnoconfig
i386                              allnoconfig
i386                             allyesconfig
powerpc                      ppc64e_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                     cu1830-neo_defconfig
i386                 randconfig-a015-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a016-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a014-20221114
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
powerpc                     akebono_defconfig
powerpc                    mvme5100_defconfig
arm                         orion5x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
