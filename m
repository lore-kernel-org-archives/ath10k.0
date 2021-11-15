Return-Path: <SRS0=6yVM=QC=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF33DC433EF
	for <ath10k@archiver.kernel.org>; Mon, 15 Nov 2021 21:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7736E61B2C
	for <ath10k@archiver.kernel.org>; Mon, 15 Nov 2021 21:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7736E61B2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J8apGwV6n5V1qCdDcSTCbIKqwzHbQ40DiwAbOuQlLs0=; b=n7Ga4JCHYt1lLr
	a1f+55pZ5C8n1lnLiLfQfdonDUd9Rt4B29Z6HPn2wrAD3Y9KTN0jY0t3/cQ7U2RiJEvvajOV96PLO
	zUX7rICCSbAz3tRuWHnGYdOG4IT1JePbuU6YfzzOJrcoe6YCLh63wKSnYDOu9HQ09PC6nQQJTcUzr
	L7vRXTIXCsIrkRtx710+3goDazPrZUiQ8ylnjHr69a0X8yHd1CDbprzpPuwmAnbHI7av2Mg7NQWBl
	z+Yky9JF+UF6umwWaWH2/8Fq806PYYMRJbhb9kFBnWm/kC/Fda612AJpk9DE5Du5DUuX/2rnEG9Hi
	O29kXQ/HMh/zqk4F0mRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmjrS-00H8Qj-QM; Mon, 15 Nov 2021 21:49:58 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmjrP-00H8Pt-Qv
 for ath10k@lists.infradead.org; Mon, 15 Nov 2021 21:49:57 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="232261892"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="232261892"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 13:49:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="454182643"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 15 Nov 2021 13:49:51 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mmjrK-000N3C-Is; Mon, 15 Nov 2021 21:49:50 +0000
Date: Tue, 16 Nov 2021 05:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 c0b0d2e87d91ce283c8766b4b3c2ec9ac90ebf96
Message-ID: <6192d5f3.gl7G8jdo4PZCrZMh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_134955_931187_E0ABCF67 
X-CRM114-Status: UNSURE (   5.15  )
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
branch HEAD: c0b0d2e87d91ce283c8766b4b3c2ec9ac90ebf96  ath11k: Increment pending_mgmt_tx count before tx send invoke

elapsed time: 722m

configs tested: 169
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211115
arc                                 defconfig
sh                           se7751_defconfig
arm                        mini2440_defconfig
mips                        bcm63xx_defconfig
sh                           se7721_defconfig
s390                          debug_defconfig
arm64                            alldefconfig
arc                            hsdk_defconfig
arm                         lpc32xx_defconfig
arm                       omap2plus_defconfig
arm                       cns3420vb_defconfig
sh                            shmin_defconfig
powerpc                    ge_imp3a_defconfig
xtensa                  audio_kc705_defconfig
arm                          ixp4xx_defconfig
m68k                          multi_defconfig
arm                      jornada720_defconfig
powerpc                   bluestone_defconfig
mips                     loongson2k_defconfig
mips                          rb532_defconfig
mips                          ath79_defconfig
arc                        nsimosci_defconfig
sh                          r7780mp_defconfig
arm                            xcep_defconfig
sh                        apsh4ad0a_defconfig
openrisc                 simple_smp_defconfig
m68k                        m5307c3_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         cm_x300_defconfig
m68k                          atari_defconfig
sh                             espt_defconfig
arm                        vexpress_defconfig
h8300                    h8300h-sim_defconfig
openrisc                  or1klitex_defconfig
mips                     loongson1c_defconfig
powerpc                        warp_defconfig
powerpc                        icon_defconfig
m68k                       m5475evb_defconfig
mips                          ath25_defconfig
arm                        spear3xx_defconfig
sh                          rsk7203_defconfig
arm                            qcom_defconfig
arm                        multi_v5_defconfig
microblaze                      mmu_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme16x_defconfig
sh                        sh7757lcr_defconfig
powerpc                     redwood_defconfig
arc                         haps_hs_defconfig
powerpc                       holly_defconfig
powerpc                       ppc64_defconfig
powerpc                  iss476-smp_defconfig
arm                     eseries_pxa_defconfig
powerpc                 xes_mpc85xx_defconfig
x86_64                           allyesconfig
powerpc                     taishan_defconfig
arm                         at91_dt_defconfig
m68k                         amcore_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
arm                          pxa3xx_defconfig
mips                      malta_kvm_defconfig
mips                           rs90_defconfig
arm                      pxa255-idp_defconfig
powerpc                     pq2fads_defconfig
arm                         palmz72_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 linkstation_defconfig
parisc                generic-32bit_defconfig
arm                     am200epdkit_defconfig
arm                           tegra_defconfig
h8300                               defconfig
mips                      maltaaprp_defconfig
xtensa                    xip_kc705_defconfig
sh                          sdk7786_defconfig
mips                  decstation_64_defconfig
um                                  defconfig
sh                         apsh4a3a_defconfig
arm                             mxs_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                     pseries_defconfig
arm                  randconfig-c002-20211115
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211115
x86_64               randconfig-a003-20211115
x86_64               randconfig-a002-20211115
x86_64               randconfig-a001-20211115
x86_64               randconfig-a006-20211115
x86_64               randconfig-a004-20211115
i386                 randconfig-a006-20211115
i386                 randconfig-a003-20211115
i386                 randconfig-a005-20211115
i386                 randconfig-a001-20211115
i386                 randconfig-a004-20211115
i386                 randconfig-a002-20211115
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211115
i386                 randconfig-c001-20211115
arm                  randconfig-c002-20211115
riscv                randconfig-c006-20211115
powerpc              randconfig-c003-20211115
s390                 randconfig-c005-20211115
mips                 randconfig-c004-20211115
x86_64               randconfig-a015-20211115
x86_64               randconfig-a013-20211115
x86_64               randconfig-a011-20211115
x86_64               randconfig-a012-20211115
x86_64               randconfig-a014-20211115
x86_64               randconfig-a016-20211115
i386                 randconfig-a014-20211115
i386                 randconfig-a016-20211115
i386                 randconfig-a012-20211115
i386                 randconfig-a013-20211115
i386                 randconfig-a011-20211115
i386                 randconfig-a015-20211115
hexagon              randconfig-r045-20211115
hexagon              randconfig-r041-20211115
s390                 randconfig-r044-20211115
riscv                randconfig-r042-20211115

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
