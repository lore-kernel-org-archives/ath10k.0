Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CE7C433F5
	for <ath10k@archiver.kernel.org>; Mon,  2 May 2022 04:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LCqxuM/pT6Pf0eOejSmvA6KSBB7We1wckxMRWrKyZpk=; b=j7Dz6o/S/txDBt
	c8ohqJovP9ykZnIoFuhGQ7CpkGmX1YrkTVQFi5xYLr0ELrlZN/RntioF3nKbFz1UQqnV78w4bNReE
	XefqbxIc4MjS4Df84b83ySFj05cX+69U4WY0o/BlPDauMVaBhqFpbkvXprMCx9VZiHn9R+qDzIStN
	BUGB+fJE6A3ri0EZkgHmySCNHmE6r1rMabnE/CH3HSbQFtaSruMG8rl5Znb4ZSQKpLaw/O1whjlFs
	eT4tKPmtzkGZ6qpt9qWucbOggH78ZhxuaSkBNqYPizlqTjPxtNzrfMQG5a/hmhFBjXK6QaJBKHzNW
	m5Wn1HJlb3IJHIZvpRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlNt7-00HW60-N4; Mon, 02 May 2022 04:42:21 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlNt4-00HW5i-2G
 for ath10k@lists.infradead.org; Mon, 02 May 2022 04:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651466538; x=1683002538;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=0ZJMJRgRUhi+cb2AZYmf3CYXz305JNHl0CTQ1SFHK6o=;
 b=mZbsRZwmv3oHm17ImhQC7krLlWbd030bGFr8HVoYu1TpCs9BM0mQ6Nur
 5SMOXltdQ9KsOKoOM+4SA8Tyq8kv0rcgKX2GmoR7oSZod83UxJyrCOv2C
 9eybaj8SZrSjavS27YxwkiBj4wxrEMHpeeSZ3PbYODescyTYI2moOwG6P
 JLrr3BZSiaHKaE2+GpGe3QL0Y50g80xhWY6/eEuXO4pelwj1fo7I1GqlA
 9OxtZUVG/OmRomyU8bzc4OwpE4inCX3+TK6Ktycrh2dyRRETqoyB9FpcL
 /zvC9vGKh40Q+ZQWBAd4NwFWxLagS3OyGHMHww1E/hQpFascjhK1lPzbq w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="353546565"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="353546565"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 21:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="598448526"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 01 May 2022 21:42:11 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nlNsx-0009Hn-1G;
 Mon, 02 May 2022 04:42:11 +0000
Date: Mon, 02 May 2022 12:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 d68b1443b639986ce04ebc4866666fa50de14d71
Message-ID: <626f6102.zJ+eUb0xn2gFEMr+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_214218_215797_FB9013AF 
X-CRM114-Status: UNSURE (   5.69  )
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
branch HEAD: d68b1443b639986ce04ebc4866666fa50de14d71  Merge branch 'ath-next' into ath-qca

elapsed time: 3711m

configs tested: 199
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                             espt_defconfig
i386                                defconfig
powerpc                     tqm8555_defconfig
arm                        mini2440_defconfig
sh                          landisk_defconfig
arm                         lubbock_defconfig
m68k                                defconfig
sh                          sdk7780_defconfig
m68k                          sun3x_defconfig
arc                              alldefconfig
parisc                generic-32bit_defconfig
mips                       bmips_be_defconfig
arm                         nhk8815_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                         cm_x300_defconfig
powerpc                 mpc834x_itx_defconfig
arm                          lpd270_defconfig
sh                        sh7763rdp_defconfig
h8300                    h8300h-sim_defconfig
arm                        oxnas_v6_defconfig
h8300                            alldefconfig
powerpc                       eiger_defconfig
sh                          kfr2r09_defconfig
powerpc                   currituck_defconfig
mips                            gpr_defconfig
csky                                defconfig
powerpc                     redwood_defconfig
powerpc                    amigaone_defconfig
microblaze                      mmu_defconfig
sh                          polaris_defconfig
xtensa                    smp_lx200_defconfig
arm                          gemini_defconfig
xtensa                  nommu_kc705_defconfig
arm                         at91_dt_defconfig
arm                            mps2_defconfig
mips                      maltasmvp_defconfig
arm                            lart_defconfig
powerpc                         ps3_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                           sun3_defconfig
mips                             allmodconfig
sh                           se7206_defconfig
arm                        cerfcube_defconfig
arm                       imx_v6_v7_defconfig
powerpc                    adder875_defconfig
mips                            ar7_defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
arm                      integrator_defconfig
um                               alldefconfig
sh                          rsk7201_defconfig
m68k                          multi_defconfig
mips                     loongson1b_defconfig
sh                         ecovec24_defconfig
powerpc64                        alldefconfig
arm                           sama5_defconfig
m68k                        m5307c3_defconfig
sparc                               defconfig
sparc64                             defconfig
m68k                          atari_defconfig
arm                            zeus_defconfig
mips                           jazz_defconfig
mips                    maltaup_xpa_defconfig
mips                  maltasmvp_eva_defconfig
sh                           se7721_defconfig
powerpc                      cm5200_defconfig
powerpc                           allnoconfig
powerpc                      makalu_defconfig
powerpc                      chrp32_defconfig
sh                ecovec24-romimage_defconfig
openrisc                    or1ksim_defconfig
m68k                         amcore_defconfig
m68k                       m5475evb_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220428
arm                  randconfig-c002-20220429
arm                  randconfig-c002-20220501
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220428
arc                  randconfig-r043-20220501
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
arc                  randconfig-r043-20220429
s390                 randconfig-r044-20220429
riscv                randconfig-r042-20220429
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
powerpc              randconfig-c003-20220501
riscv                randconfig-c006-20220501
mips                 randconfig-c004-20220501
arm                  randconfig-c002-20220501
arm                       mainstone_defconfig
arm                         bcm2835_defconfig
arm                          collie_defconfig
mips                   sb1250_swarm_defconfig
arm                        magician_defconfig
riscv                             allnoconfig
powerpc                 mpc836x_rdk_defconfig
arm                        mvebu_v5_defconfig
arm                       spear13xx_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                           sama7_defconfig
powerpc                    mvme5100_defconfig
powerpc                      ppc44x_defconfig
arm                                 defconfig
powerpc                     pseries_defconfig
arm                    vt8500_v6_v7_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                 mpc8560_ads_defconfig
mips                          rm200_defconfig
powerpc                     kilauea_defconfig
powerpc                      obs600_defconfig
riscv                          rv32_defconfig
arm                          moxart_defconfig
arm                       versatile_defconfig
powerpc                   bluestone_defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a015-20220502
x86_64               randconfig-a012-20220502
x86_64               randconfig-a016-20220502
x86_64               randconfig-a014-20220502
x86_64               randconfig-a013-20220502
x86_64               randconfig-a011-20220502
i386                 randconfig-a011-20220502
i386                 randconfig-a013-20220502
i386                 randconfig-a016-20220502
i386                 randconfig-a015-20220502
i386                 randconfig-a014-20220502
i386                 randconfig-a012-20220502
hexagon              randconfig-r041-20220428
riscv                randconfig-r042-20220428
hexagon              randconfig-r045-20220428
hexagon              randconfig-r045-20220430
hexagon              randconfig-r041-20220430

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
