Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E39C43334
	for <ath10k@archiver.kernel.org>; Thu,  7 Jul 2022 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uo+kBWEyF2/UbuOAF9PZQ0biE2QMCD296Bgs234XPv8=; b=GhtMR12E5sE5ET
	Th0n3uOMz+5aqT8goSPMnezGG/YJtZ9ZRStky7ZkecOZ47zMkRpZ/Xy1r1Q9OyRy2wbaOgYyHMpVU
	3TmyyoY6/jg8lTOpGyvJhaCSg4V1SeHUgdflqWVdO0cu0ocBauLtcR+1JDQAJgUIBP5YXBXPXZ7Js
	lPWpbKlqKfIcmdGC80WDbFh/XyqqnZw2pDLlk1KIzOed/VEJRAW8SCzIsW03i3Q3ZG51G1/flk2VZ
	TMEpI2c/OEYiRDpx+nWgKGAy8d8eeC70BfCTq7AQTkCMb5cQyHIj0bu6AHuW28vllBEIsyAN/uXZ1
	Lgt621TUp3SjnfzNl/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Q1x-00Ftum-4R; Thu, 07 Jul 2022 11:50:49 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Q1u-00Ftsz-9k
	for ath10k@lists.infradead.org; Thu, 07 Jul 2022 11:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657194646; x=1688730646;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8+rDExxUtv0JOiV12uf4ntD3k3OOD3HTQfVaV0rc+M4=;
  b=JDRRTalvNTqsJXwfy/fu39byNaPcmR8EkkvElGCi9oCza20iMX2DKSdz
   ivt6hyNL+T0ncHm+6SGNXC9fPO4L6hinXyxGKrwAmTwirJfoI4G9wNPEt
   TzkFpQXrjjYUU0gp5EDC9RKYzbm8a0enzF0p0BVIVdyXPXz31JOdi5DXs
   WkP2Wtb6KE6VcwhCTI7B6VvOLQgCKiS5tVZEO+jcTYukwOuY25bR3c9Lf
   ljHwkyGdipq6ydWMFO2Te2zWw22Kt1BCQlMv+mLBmowtGCoPD1dc+UjCY
   l+D8exJ/qf0VELluaT+FdDgTfUvWxp/1s5BiLIE6hm6qzGKLa9Hxxbjwr
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="264420097"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="264420097"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 04:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="661357402"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2022 04:50:41 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9Q1p-000Lxy-0d;
	Thu, 07 Jul 2022 11:50:41 +0000
Date: Thu, 07 Jul 2022 19:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS WITH WARNING
 3a5232728e3f1751da5d1dcff5aac947bde2955e
Message-ID: <62c6c878.0X/ov9NXKWhRZlvW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_045046_425995_C01F00B3 
X-CRM114-Status: UNSURE (   5.06  )
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
branch HEAD: 3a5232728e3f1751da5d1dcff5aac947bde2955e  ath12k: remove unused ath12k_dp_tx_htt_h2t_vdev_stats_ol_req()

Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath12k/dp_rx.c:2699:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_tx.c:569:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/hal_rx.c:406:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|-- i386-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
`-- mips-allyesconfig
    |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
    |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
    `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size

elapsed time: 1716m

configs tested: 167
configs skipped: 3

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220706
sh                          rsk7269_defconfig
arm                          iop32x_defconfig
sh                         ecovec24_defconfig
m68k                        mvme147_defconfig
m68k                             alldefconfig
xtensa                       common_defconfig
powerpc                         wii_defconfig
m68k                       m5249evb_defconfig
sh                        apsh4ad0a_defconfig
arm                          lpd270_defconfig
arm                           viper_defconfig
arc                     nsimosci_hs_defconfig
sh                                  defconfig
alpha                            alldefconfig
openrisc                            defconfig
arm                          badge4_defconfig
xtensa                         virt_defconfig
sh                           se7750_defconfig
arm                           stm32_defconfig
arm                          gemini_defconfig
openrisc                 simple_smp_defconfig
powerpc                    amigaone_defconfig
openrisc                  or1klitex_defconfig
mips                         mpc30x_defconfig
arc                        nsimosci_defconfig
arm                          exynos_defconfig
powerpc                      cm5200_defconfig
s390                          debug_defconfig
arm                          simpad_defconfig
xtensa                           allyesconfig
sh                           se7721_defconfig
mips                           ip32_defconfig
sh                          lboxre2_defconfig
sh                           se7722_defconfig
um                             i386_defconfig
riscv                            allyesconfig
xtensa                  audio_kc705_defconfig
sh                            titan_defconfig
mips                  decstation_64_defconfig
powerpc                     mpc83xx_defconfig
m68k                        m5407c3_defconfig
arm                        spear6xx_defconfig
powerpc                      ppc40x_defconfig
arm                        cerfcube_defconfig
powerpc                      chrp32_defconfig
xtensa                              defconfig
mips                            gpr_defconfig
powerpc                    adder875_defconfig
xtensa                generic_kc705_defconfig
powerpc                       ppc64_defconfig
riscv                               defconfig
sh                          kfr2r09_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc834x_itx_defconfig
sh                         microdev_defconfig
sh                          sdk7786_defconfig
arm                       aspeed_g5_defconfig
m68k                        m5307c3_defconfig
powerpc                       eiger_defconfig
powerpc                   currituck_defconfig
riscv                    nommu_k210_defconfig
sh                          urquell_defconfig
nios2                         3c120_defconfig
powerpc                      pasemi_defconfig
arm                      jornada720_defconfig
arm                        mini2440_defconfig
arm                             rpc_defconfig
sh                           se7705_defconfig
sparc64                             defconfig
um                               alldefconfig
mips                       capcella_defconfig
sparc                               defconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220706
arm                  randconfig-c002-20220707
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220706
arc                  randconfig-r043-20220703
riscv                randconfig-r042-20220703
s390                 randconfig-r044-20220703
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                      maltaaprp_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                        icon_defconfig
powerpc                      walnut_defconfig
arm                            dove_defconfig
mips                         tb0287_defconfig
riscv                          rv32_defconfig
arm                   milbeaut_m10v_defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8540_defconfig
arm                      tct_hammer_defconfig
mips                        qi_lb60_defconfig
mips                malta_qemu_32r6_defconfig
arm                       spear13xx_defconfig
mips                           ip27_defconfig
powerpc                     mpc5200_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220703
hexagon              randconfig-r045-20220703
riscv                randconfig-r042-20220706
hexagon              randconfig-r045-20220706
hexagon              randconfig-r041-20220706
s390                 randconfig-r044-20220706

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
