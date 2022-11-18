Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05F3C433FE
	for <ath10k@archiver.kernel.org>; Fri, 18 Nov 2022 02:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eHHy+E/tSfHfIGGuati056uXljobMskHGbjdYGrmTsk=; b=WjzqCXCm7/mhfm
	5wZ9CHcYeWPy74AZhQZEyN+PNILfvsrIloyDOCE/eOo8PtZf0vz1qF34tZdDtWvNjs93YmuyGrGgg
	XtjnezGyrB6b33eUbYSDzj03xTrYJcikf7duBje50IXklFuTeYrf/fo1KkEJIqmmjlMkGn/Q+j5La
	Or4uHf5K8fq4ypu6YmQPn8GLaFxEMSdYLUwilsSVbplQNsmg+3XGHpRZ8t3cex1QWLwWQXU77joiM
	VALbKnc8OuVkieZG3Z+aSm6TdK9xB+q403GpjddnQBuPSTAgIQNTBJvDmcT8mj/n/LDlqzd7mypgD
	U63oR3uq/2gzGk/TbBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovqnz-001ONV-Nt; Fri, 18 Nov 2022 02:08:35 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovqnv-001OM6-6j
	for ath10k@lists.infradead.org; Fri, 18 Nov 2022 02:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668737311; x=1700273311;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uJIMRJyb5uaOAClI71uXVC7++iFPat4ZglytCzOTtW4=;
  b=DJsgbOUZt5NDQrtLmRJHkSQOOnBEaHY3uyFUQtovnortC3VcS89tv7vK
   WScsgW7RPULdnPNQGB5LAgUOXTd1LdwLTXeq96+SQdmF5aKbxYdLPDOdZ
   yeo0WPbTbSM24HtAKwM+dSbCVcIG4ZS7aFyec6idlUYHGjFRbficHoCl2
   LtdwYpcG+vh/ur686UWcE1HUAIR1+O0Cv46DU/xGRSQMY+EIngd1hQN+L
   Fd8qZg4Z38TzVKa4uXPyEbYFFHsMhErsJrFid7VpyuqGiVWxC9zJySelK
   /xwxIGEYWRDuXFCDRXJmnswmXzj6S4qp4J1q73hK5HCg241IKDy88pF9U
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296394067"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="296394067"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 18:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="969109787"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="969109787"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Nov 2022 18:08:26 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovqnq-0000vH-0k;
	Fri, 18 Nov 2022 02:08:26 +0000
Date: Fri, 18 Nov 2022 10:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 3250115fc51ddffc9e41c4257444d42325bb362f
Message-ID: <6376e900.WDCIZwxOcg25M46e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_180831_332437_72299A1D 
X-CRM114-Status: UNSURE (   5.56  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 3250115fc51ddffc9e41c4257444d42325bb362f  Add localversion-wireless-testing-ath

elapsed time: 12643m

configs tested: 229
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                        vdk_hs38_defconfig
arm                          pxa910_defconfig
mips                        vocore2_defconfig
powerpc                       maple_defconfig
openrisc                            defconfig
sh                        sh7785lcr_defconfig
x86_64                            allnoconfig
arm                        mini2440_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7724_defconfig
arm                        trizeps4_defconfig
arm                          pxa3xx_defconfig
i386                          randconfig-c001
sparc64                             defconfig
powerpc                       ppc64_defconfig
m68k                             allyesconfig
arc                              allyesconfig
arc                                 defconfig
arc                     nsimosci_hs_defconfig
sh                      rts7751r2d1_defconfig
mips                 decstation_r4k_defconfig
alpha                               defconfig
mips                         rt305x_defconfig
sh                        sh7763rdp_defconfig
sh                          r7780mp_defconfig
arm                         lubbock_defconfig
sh                         apsh4a3a_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
alpha                            allyesconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
ia64                             allmodconfig
sh                   secureedge5410_defconfig
parisc                generic-64bit_defconfig
xtensa                    xip_kc705_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_mds_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
i386                                defconfig
arc                        nsimosci_defconfig
xtensa                           alldefconfig
parisc                generic-32bit_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
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
m68k                           sun3_defconfig
sparc64                          alldefconfig
microblaze                          defconfig
arc                         haps_hs_defconfig
arm64                            alldefconfig
powerpc                     pq2fads_defconfig
openrisc                    or1ksim_defconfig
sh                           se7619_defconfig
arc                        nsim_700_defconfig
arm                          simpad_defconfig
ia64                        generic_defconfig
mips                           ci20_defconfig
ia64                          tiger_defconfig
powerpc                     sequoia_defconfig
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
arm                          sp7021_defconfig
mips                      maltaaprp_defconfig
mips                     loongson2k_defconfig
arm                          pcm027_defconfig
arm                        vexpress_defconfig
mips                           rs90_defconfig
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
