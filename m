Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6D4C433F5
	for <ath10k@archiver.kernel.org>; Sun, 19 Dec 2021 02:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uazdbZyOa0PaS3ltGfs+59LM+Yp2S1ELbSCze3yO+9Q=; b=oUcsvc+80qoyO1
	UkGOGviqz8nDmcucG41ayYRpQv9wStRJpNcJSflWw0LMbs1cNKEfUD0tnSfa16x5zqvg2TRxq2HHr
	JMrYb5pPiBNgqjhMzrd4i3ej6GCWKmqVd3GxVnmB7iSXC0cMWLgL8677gFFBlphVdILZxiRR/cZmP
	/zOmvKpDPMsaMIky/ydMeKdHM2HPXULnmPrGRRoSOVv8sNgBMUBSN8iqNCHkkH9rVm316vEqFUt9W
	MZ+iuhYdD7a8NiYGGE/zXmZ6+c438PahaPYqCmgkkGjwQgXxE2vqlCGIJh50HAb1+DHwnHmEPj3D9
	tkujF7z31GrLXgATbrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myljJ-00F8qW-L3; Sun, 19 Dec 2021 02:15:17 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myljG-00F8qB-OW
 for ath10k@lists.infradead.org; Sun, 19 Dec 2021 02:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639880114; x=1671416114;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NJOp1q0n6/b4T3N+oqhNrPJIX+hdqqhv2aEP3I7rK1g=;
 b=DCZ19AvzicTxQ0HH6cU9eehT+nHlw90Tbo7VNCyYxh/XBoQkQEcXugOF
 BectXMCxVzg1sLVH49wKNF6AeBjmYXer7pN5DAezhZq7asz5flo456bMp
 72JuZyezBv0oY/VlYrbSU1f3gLI4nViNxQW4TvUgWVL+WQBCrU2ASCG4O
 tq12CWD8+oJ/PpK4aB2BuhapYXtFXRiufZ6jBfY+5f/h5ecr2pjb5N2Pt
 ocmuJRJ+R5GNzy6kjKTpnDaNXk0to8emtCnsOQqzb5sld6chQxq7B1b1L
 ur7chh5zXq2gbz16F3B7KzNT6wpcCG7AwjJHfLHe6NPbp1XvM8K4aujol w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="219981733"
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; d="scan'208";a="219981733"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2021 18:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; d="scan'208";a="466953740"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 18 Dec 2021 18:15:10 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1myljC-0006cr-4x; Sun, 19 Dec 2021 02:15:10 +0000
Date: Sun, 19 Dec 2021 10:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 e06da5eb2b8859f6878505d308217195467dceae
Message-ID: <61be958a.0YXPRJddUoBTIh7e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_181514_898706_6A6CF1AD 
X-CRM114-Status: UNSURE (   4.34  )
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
branch HEAD: e06da5eb2b8859f6878505d308217195467dceae  Merge branch 'pending' into master-pending

elapsed time: 1639m

configs tested: 233
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211216
mips                 randconfig-c004-20211218
powerpc                       maple_defconfig
nds32                               defconfig
arm                          simpad_defconfig
mips                        bcm63xx_defconfig
sh                          rsk7203_defconfig
powerpc                    amigaone_defconfig
arm                            lart_defconfig
arc                         haps_hs_defconfig
sh                            titan_defconfig
powerpc                   motionpro_defconfig
powerpc                    socrates_defconfig
powerpc                      arches_defconfig
powerpc                          g5_defconfig
powerpc                 canyonlands_defconfig
arm                        trizeps4_defconfig
powerpc                      chrp32_defconfig
nios2                         10m50_defconfig
parisc                              defconfig
arm                          lpd270_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                   sb1250_swarm_defconfig
powerpc                       ppc64_defconfig
microblaze                      mmu_defconfig
arc                        nsimosci_defconfig
xtensa                         virt_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    sam440ep_defconfig
nios2                            alldefconfig
powerpc                       ebony_defconfig
mips                      malta_kvm_defconfig
arm                           sama5_defconfig
riscv                          rv32_defconfig
mips                malta_qemu_32r6_defconfig
mips                             allmodconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                    ge_imp3a_defconfig
alpha                            alldefconfig
arc                        nsim_700_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                      pxa255-idp_defconfig
h8300                            alldefconfig
arm                       spear13xx_defconfig
mips                         cobalt_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                 nsimosci_hs_smp_defconfig
xtensa                       common_defconfig
nds32                            alldefconfig
m68k                       m5208evb_defconfig
m68k                        m5407c3_defconfig
arm                            hisi_defconfig
sh                   rts7751r2dplus_defconfig
arm                        clps711x_defconfig
arm                            dove_defconfig
m68k                       m5249evb_defconfig
arm                         shannon_defconfig
sh                           se7724_defconfig
powerpc                     powernv_defconfig
um                           x86_64_defconfig
mips                        jmr3927_defconfig
powerpc                     stx_gp3_defconfig
sh                  sh7785lcr_32bit_defconfig
m68k                         apollo_defconfig
m68k                         amcore_defconfig
mips                        bcm47xx_defconfig
h8300                    h8300h-sim_defconfig
sh                   sh7770_generic_defconfig
arm                         mv78xx0_defconfig
powerpc                     tqm8560_defconfig
mips                  cavium_octeon_defconfig
mips                    maltaup_xpa_defconfig
m68k                        stmark2_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc832x_mds_defconfig
mips                            ar7_defconfig
sh                        sh7785lcr_defconfig
arc                        vdk_hs38_defconfig
arm                           stm32_defconfig
arm                        neponset_defconfig
h8300                       h8s-sim_defconfig
mips                     cu1830-neo_defconfig
i386                             alldefconfig
arm                           u8500_defconfig
m68k                        mvme147_defconfig
ia64                         bigsur_defconfig
arm                       aspeed_g4_defconfig
sh                             espt_defconfig
parisc                           allyesconfig
powerpc                      walnut_defconfig
mips                        omega2p_defconfig
arm                         lubbock_defconfig
arm                        magician_defconfig
sh                           se7721_defconfig
arc                     haps_hs_smp_defconfig
mips                          rb532_defconfig
powerpc                 linkstation_defconfig
powerpc                        cell_defconfig
m68k                            mac_defconfig
arc                     nsimosci_hs_defconfig
arm                         s3c6400_defconfig
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
arm                          iop32x_defconfig
arm                         vf610m4_defconfig
arm                         assabet_defconfig
h8300                     edosk2674_defconfig
powerpc                        warp_defconfig
arm                          ixp4xx_defconfig
powerpc                     tqm8540_defconfig
powerpc64                           defconfig
arm                  randconfig-c002-20211219
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a002-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a004-20211216
i386                 randconfig-a002-20211218
i386                 randconfig-a005-20211218
i386                 randconfig-a003-20211218
i386                 randconfig-a006-20211218
i386                 randconfig-a004-20211218
x86_64               randconfig-a006-20211218
x86_64               randconfig-a005-20211218
x86_64               randconfig-a001-20211218
x86_64               randconfig-a002-20211218
x86_64               randconfig-a004-20211218
x86_64               randconfig-a011-20211217
x86_64               randconfig-a014-20211217
x86_64               randconfig-a012-20211217
x86_64               randconfig-a013-20211217
x86_64               randconfig-a015-20211217
x86_64               randconfig-a016-20211217
x86_64               randconfig-a011-20211219
x86_64               randconfig-a013-20211219
x86_64               randconfig-a012-20211219
x86_64               randconfig-a014-20211219
x86_64               randconfig-a015-20211219
x86_64               randconfig-a016-20211219
i386                 randconfig-a011-20211219
i386                 randconfig-a015-20211219
i386                 randconfig-a012-20211219
i386                 randconfig-a013-20211219
i386                 randconfig-a014-20211219
i386                 randconfig-a016-20211219
arc                  randconfig-r043-20211216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
i386                 randconfig-a002-20211219
i386                 randconfig-a001-20211219
i386                 randconfig-a005-20211219
i386                 randconfig-a003-20211219
i386                 randconfig-a006-20211219
i386                 randconfig-a004-20211219
x86_64               randconfig-a006-20211219
x86_64               randconfig-a005-20211219
x86_64               randconfig-a001-20211219
x86_64               randconfig-a003-20211219
x86_64               randconfig-a002-20211219
x86_64               randconfig-a004-20211219
x86_64               randconfig-a011-20211218
x86_64               randconfig-a015-20211218
x86_64               randconfig-a016-20211218
x86_64               randconfig-a011-20211216
x86_64               randconfig-a012-20211216
x86_64               randconfig-a013-20211216
x86_64               randconfig-a016-20211216
x86_64               randconfig-a015-20211216
i386                 randconfig-a013-20211218
i386                 randconfig-a011-20211218
i386                 randconfig-a016-20211218
i386                 randconfig-a015-20211218
i386                 randconfig-a014-20211218
i386                 randconfig-a012-20211218
hexagon              randconfig-r045-20211216
s390                 randconfig-r044-20211216
riscv                randconfig-r042-20211216
hexagon              randconfig-r041-20211216
hexagon              randconfig-r045-20211219
hexagon              randconfig-r041-20211219

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
