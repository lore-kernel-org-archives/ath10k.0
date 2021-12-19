Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8A5C433EF
	for <ath10k@archiver.kernel.org>; Sun, 19 Dec 2021 02:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x8+Bm8fQvNZgKgKNviYab1UtFMLp15jGfjVoP9VShgE=; b=goGORjF22Ea60i
	3NSUsr5tOhC05LchEYufi2rs1Wn0884rn+qAYpkejReRXRtRn1FGFsLY6Efzbkdx9Sv0xi/G4iSTU
	s6K8DwTBATuNFIONAZs46HCbn+huP0Lg3eZN2jHt+KGn2p5JNv43HH/JSF3/yHt4GF02fcC9l/ET9
	EHYBQg40Vxp9bq1hRP1xRUM8neM6Ruoz9kiS+RfCLMWVrHAdWR0he+VIwH47p+rrYPkcrk9gtm0cw
	A0tCMsJhXy1M5aVsahzrAkCv/nXQ62MlWW5HBZONiNI968gcDfmIN0XWB3ZCLXqzRe/Sg+LsB51LH
	JhUCgP4unVPliaYYtFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mylr8-00F9HY-0t; Sun, 19 Dec 2021 02:23:22 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mylr4-00F9Gl-Rz
 for ath10k@lists.infradead.org; Sun, 19 Dec 2021 02:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639880598; x=1671416598;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vqqiW7ri/b3F2YmWLoELEN74fhauoStGDoWY2vDHioo=;
 b=KV5FV3uZTQZGg71vMG5rq0Yo6NlYrzQrOzST6Ir8T/BpLk76ZWZ4zqmj
 1VLmx3hCrrQ6eJGLJ3kCh0mJrKny5bWRL3nhY/TO6C0tdO3wFakIyeNM4
 dS/8VuhQCAP2kxqJftWKm9ptyzYM06h81u5x0+tRLMeSDnf3FJhHlx45G
 jhVDnHG6X79j3FnjKVDHP0CtrvXtPEy+WLEHUXUUaTWBWn//GRf0lMEay
 dZEDJRvneHxE0vJNyLBmM+AnJ+u2YkrU8vJN58Pjh/BBZjF6h/BETqKNN
 kJQzFUcN2hZHh7iC6LjlGxP4FW+gY6AWbgb5CPsdVJ8amK31ABvjPjw1k w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="227259124"
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; d="scan'208";a="227259124"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2021 18:23:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; d="scan'208";a="683827716"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 18 Dec 2021 18:23:11 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mylqw-0006d5-92; Sun, 19 Dec 2021 02:23:10 +0000
Date: Sun, 19 Dec 2021 10:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 ce74cb75e08a2fad39bebe14114ed0b33d22d206
Message-ID: <61be9784.n8jdhGg/iLorjAOT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_182319_007418_BAC85465 
X-CRM114-Status: UNSURE (   6.02  )
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
branch HEAD: ce74cb75e08a2fad39bebe14114ed0b33d22d206  ath9k: Fix out-of-bound memcpy in ath9k_hif_usb_rx_stream

elapsed time: 1647m

configs tested: 228
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
mips                            ar7_defconfig
m68k                       bvme6000_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                              alldefconfig
powerpc                 mpc8560_ads_defconfig
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
arm                         shannon_defconfig
arm                        clps711x_defconfig
sh                           se7724_defconfig
m68k                       m5249evb_defconfig
arm                            dove_defconfig
powerpc                     powernv_defconfig
mips                        jmr3927_defconfig
powerpc                     stx_gp3_defconfig
sh                  sh7785lcr_32bit_defconfig
um                           x86_64_defconfig
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
arm                          iop32x_defconfig
arm                         vf610m4_defconfig
arm                         assabet_defconfig
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
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
h8300                            allyesconfig
sh                               allmodconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a002-20211216
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
x86_64               randconfig-a016-20211217
x86_64               randconfig-a015-20211217
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
i386                 randconfig-a016-20211219
i386                 randconfig-a014-20211219
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
x86_64               randconfig-a014-20211216
x86_64               randconfig-a015-20211216
x86_64               randconfig-a016-20211216
i386                 randconfig-a013-20211218
i386                 randconfig-a011-20211218
i386                 randconfig-a016-20211218
i386                 randconfig-a015-20211218
i386                 randconfig-a014-20211218
i386                 randconfig-a012-20211218
hexagon              randconfig-r045-20211216
s390                 randconfig-r044-20211216
hexagon              randconfig-r041-20211216
riscv                randconfig-r042-20211216
hexagon              randconfig-r045-20211219
hexagon              randconfig-r041-20211219

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
