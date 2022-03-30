Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD6BC433EF
	for <ath10k@archiver.kernel.org>; Wed, 30 Mar 2022 21:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1iIV4mxE65nz/ClwlJN3mzyyl4m0uVv8Cee/i9Mu5nc=; b=b91XPRxHozy4Fe
	kxZ/S0zl6AomsR9VlJUNqDg1TrZ+h1X5HuESCVLO4U3R9jzxWBq7Yh3XNMj/dfEMKzrmUNKD+yEuF
	DgPqg+4aSedJi6CYOyoZ9RTGckv+Nter2zS2SRlFseKkrZNMZ8nCSXMwtZ+YEE/9OCEAdc5l/8pk2
	dU5yHKZdrZm/fSiVBafS5Z2YJc4GtNooAN2hVESxrtPqerkWMoIohJrIrFFebSB4vRzxOiI4WpDK7
	pqjeKBYoh6a8ZSRLWNCGc3PdgbmEDiYOwo0GF55aOIQKz7EEgd93CyZOEtPU/7jFyzV8rnLcuhmq7
	mevSc1hE/NiWlMIxBumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZg8p-00HXeY-It; Wed, 30 Mar 2022 21:46:11 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZg8l-00HXe2-UM
 for ath10k@lists.infradead.org; Wed, 30 Mar 2022 21:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648676767; x=1680212767;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=QF/bIyAMswXOFXeiHYDRLRd4yEpNmQPNYdcyVI2v1K0=;
 b=lcys6ltWzOWIJeWKsxy0ZUyP8E5gVZOSQN3jDcIMXGGbt6T7oyvlYdsc
 GT0jjFHCX5+gI4WsMK3Xm9VK8fnBiCDZwkHZ3ryTXjMDVVg7CXYI8JTMw
 o3G9+u/Ij21TcGAg5+bOIx05Jfj4eQi05bbSaO6JEV+78Hy3JygbIny1u
 YWFviZJcF/baTveUg2qW5+F0OC0yDoTVZExjSO0P89+3O0GmS/ZIWIHKy
 uajRMqnCqTP+dg3NkDyO35lFyC0wSX7KhU6DPi1mdC5wPw64apsmhWnAY
 0uRfCUsmOXY7iY42rI6lrTyNq8EHI79zy1UmO48mxnQXzEnuGWm18D7XY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="241806348"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="241806348"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 14:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="605667135"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 30 Mar 2022 14:45:53 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZg8W-0000X7-SD;
 Wed, 30 Mar 2022 21:45:52 +0000
Date: Thu, 31 Mar 2022 05:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 1f682dc9fb3790aa7ec27d3d122ff32b1eda1365
Message-ID: <6244cf55.HEjOIl8OknjJK8V5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_144608_068904_0C33B75C 
X-CRM114-Status: UNSURE (   5.91  )
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
branch HEAD: 1f682dc9fb3790aa7ec27d3d122ff32b1eda1365  ath11k: reduce the wait time of 11d scan and hw scan while add interface

elapsed time: 739m

configs tested: 179
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220330
powerpc              randconfig-c003-20220330
sh                          landisk_defconfig
sh                        edosk7760_defconfig
powerpc                     rainier_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
um                             i386_defconfig
powerpc                    adder875_defconfig
m68k                             allmodconfig
powerpc                     pq2fads_defconfig
arc                     haps_hs_smp_defconfig
riscv             nommu_k210_sdcard_defconfig
um                               alldefconfig
mips                            gpr_defconfig
sh                          rsk7264_defconfig
nios2                         3c120_defconfig
sh                               alldefconfig
arm                       aspeed_g5_defconfig
parisc64                            defconfig
sh                        sh7757lcr_defconfig
powerpc                    klondike_defconfig
sparc                       sparc64_defconfig
sh                          rsk7201_defconfig
mips                            ar7_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
m68k                       m5208evb_defconfig
arc                 nsimosci_hs_smp_defconfig
xtensa                          iss_defconfig
arm                           tegra_defconfig
arm                            lart_defconfig
arm                        trizeps4_defconfig
alpha                            alldefconfig
arm                        cerfcube_defconfig
powerpc                 mpc837x_mds_defconfig
arc                     nsimosci_hs_defconfig
s390                                defconfig
powerpc                 mpc85xx_cds_defconfig
mips                  maltasmvp_eva_defconfig
ia64                        generic_defconfig
sh                           se7619_defconfig
powerpc64                        alldefconfig
mips                           gcw0_defconfig
arm                           sama5_defconfig
parisc                generic-64bit_defconfig
arm                      integrator_defconfig
powerpc                      pcm030_defconfig
sh                          sdk7780_defconfig
m68k                           sun3_defconfig
powerpc                      arches_defconfig
ia64                            zx1_defconfig
m68k                        stmark2_defconfig
powerpc                  iss476-smp_defconfig
arm                         cm_x300_defconfig
sh                             espt_defconfig
powerpc                  storcenter_defconfig
sh                        apsh4ad0a_defconfig
mips                        bcm47xx_defconfig
powerpc                 mpc834x_itx_defconfig
sh                         ap325rxa_defconfig
mips                     decstation_defconfig
sh                           se7705_defconfig
arm                         s3c6400_defconfig
m68k                         amcore_defconfig
ia64                                defconfig
riscv                               defconfig
powerpc                       eiger_defconfig
um                                  defconfig
openrisc                    or1ksim_defconfig
arm                          gemini_defconfig
powerpc                     sequoia_defconfig
arm                        shmobile_defconfig
powerpc                      ppc6xx_defconfig
sh                          urquell_defconfig
sh                          kfr2r09_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
ia64                      gensparse_defconfig
riscv                            allmodconfig
nios2                               defconfig
m68k                            q40_defconfig
mips                           jazz_defconfig
m68k                          hp300_defconfig
arm                         axm55xx_defconfig
sh                ecovec24-romimage_defconfig
arm                     eseries_pxa_defconfig
powerpc                       holly_defconfig
mips                         cobalt_defconfig
arm                         nhk8815_defconfig
sh                   sh7724_generic_defconfig
parisc                              defconfig
mips                         bigsur_defconfig
m68k                          amiga_defconfig
sh                           se7712_defconfig
csky                             alldefconfig
arm                  randconfig-c002-20220330
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
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
riscv                randconfig-r042-20220330
s390                 randconfig-r044-20220330
arc                  randconfig-r043-20220330
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220330
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220330
riscv                randconfig-c006-20220330
i386                          randconfig-c001
arm                  randconfig-c002-20220330
mips                        omega2p_defconfig
powerpc                          allmodconfig
mips                          ath79_defconfig
powerpc                      obs600_defconfig
hexagon                          alldefconfig
arm                         s5pv210_defconfig
arm                     am200epdkit_defconfig
mips                        workpad_defconfig
powerpc                     mpc5200_defconfig
mips                   sb1250_swarm_defconfig
powerpc                     powernv_defconfig
arm                         lpc32xx_defconfig
arm                             mxs_defconfig
mips                         tb0287_defconfig
mips                          malta_defconfig
arm                          ep93xx_defconfig
powerpc                       ebony_defconfig
arm                         s3c2410_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220330
hexagon              randconfig-r041-20220330

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
