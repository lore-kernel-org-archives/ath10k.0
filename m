Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CB1C433F5
	for <ath10k@archiver.kernel.org>; Sat, 26 Feb 2022 01:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nX6T/H/qPnXrx7Edtk90LdOj7yvlEeH+BjgiOK1l1lI=; b=xur0M5AJHvvElP
	iHWUowkCgnIwsDybF8D/nxY4ZTQmRHZpSfT+Ck8VuT2zhznIHFhY8caBqRVgFnQLSyE1R/I3/wfzL
	7p5tVr1nRLfYYsiKCquBBFZ11ARz/hF3LyTtpV0Bd7eK0dT2NvIDTzeHsx5i3JGa7TjBMMfWVcw36
	pNr8AXV4F1M/3ZUJ0RRfCcDxEHI+/16TzfDlpQlaKH5CRcZVXLxhNceEtknzoS2mmp2wknGyz3ol/
	n4nfZBHzLJ6QUU82PyL198NIp7hC12ox8KigkqIWBGnUM9tGs5L5tlTjksGz54ftZvYIQ2LYI1lda
	LYVpI0OaQ6evsJ2ZYcKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNmK9-007Lj8-13; Sat, 26 Feb 2022 01:56:41 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNmK4-007LiP-2l
 for ath10k@lists.infradead.org; Sat, 26 Feb 2022 01:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645840596; x=1677376596;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Uw8IhmpPAGu2VesdCqA8GiLETxXSPAMITILD3DLP7Ck=;
 b=dkWesNqGC18dCMznWok4CiAwhlZEZi2IAAC+IFBOmWJfjbIqmvuvprR2
 MwX61No9pucQkEHvqRTvt27RM9kzZuz7zZCsj/3jHGtXbqtYsvLLuJuJu
 /AajubDvn/62ssQ05l4buFHtkyZaVCv6w58VzB4Lj3LCSEnTyJrIEzLzX
 kw6ftiAXEaWbhyRioMFGMMpxd7avfI4kmaP8QScHXYzApjpaf89ZFr5mV
 Tx3Cjg1MWdKorBEzY1IUvy3R8bGkChWpVU/bfuSIGkUbKb66F0sGTm/6m
 fLYKAbDRev23HO5PP1+Jup5MwGV1CubMk8PFbqMeEirib1jHjCJjJN0H5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="339057099"
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="339057099"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 17:56:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,138,1643702400"; d="scan'208";a="629032664"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2022 17:56:32 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nNmJz-0004ve-NQ; Sat, 26 Feb 2022 01:56:31 +0000
Date: Sat, 26 Feb 2022 09:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 dade6cc912d94d00aa359b38fb2efad4bc570ea5
Message-ID: <621988a9.KIq/Llm8CWhYeMeh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_175636_193872_0A950555 
X-CRM114-Status: UNSURE (   5.39  )
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
branch HEAD: dade6cc912d94d00aa359b38fb2efad4bc570ea5  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 153
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20220225
s390                          debug_defconfig
arm                        shmobile_defconfig
sh                         microdev_defconfig
xtensa                           allyesconfig
sh                          sdk7780_defconfig
powerpc                     asp8347_defconfig
arm                          exynos_defconfig
m68k                         apollo_defconfig
arm                          lpd270_defconfig
powerpc                 linkstation_defconfig
nios2                         3c120_defconfig
sh                        edosk7705_defconfig
arm                           h5000_defconfig
arc                      axs103_smp_defconfig
mips                         tb0226_defconfig
arm                       imx_v6_v7_defconfig
arm                         assabet_defconfig
mips                  decstation_64_defconfig
sh                        dreamcast_defconfig
powerpc                     pq2fads_defconfig
sh                          kfr2r09_defconfig
csky                                defconfig
nios2                         10m50_defconfig
h8300                               defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                       m5475evb_defconfig
powerpc                     tqm8548_defconfig
mips                           gcw0_defconfig
sh                         apsh4a3a_defconfig
sh                        apsh4ad0a_defconfig
s390                       zfcpdump_defconfig
powerpc                      tqm8xx_defconfig
mips                        vocore2_defconfig
arm                        trizeps4_defconfig
i386                             alldefconfig
powerpc                         wii_defconfig
arm                          pxa910_defconfig
arm                           sunxi_defconfig
powerpc                       maple_defconfig
powerpc                     ep8248e_defconfig
sh                          lboxre2_defconfig
arm                           tegra_defconfig
m68k                          hp300_defconfig
parisc                generic-32bit_defconfig
powerpc                      ppc40x_defconfig
arm                            zeus_defconfig
arc                            hsdk_defconfig
arm                        keystone_defconfig
sh                           se7750_defconfig
h8300                       h8s-sim_defconfig
mips                          rb532_defconfig
sh                        sh7757lcr_defconfig
powerpc                     tqm8555_defconfig
arc                          axs103_defconfig
mips                     decstation_defconfig
um                               alldefconfig
arm                      integrator_defconfig
arm                  randconfig-c002-20220225
arm                  randconfig-c002-20220226
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-a012
arc                  randconfig-r043-20220225
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220225
arm                  randconfig-c002-20220225
powerpc                      ppc44x_defconfig
powerpc                     pseries_defconfig
powerpc                  mpc885_ads_defconfig
arm                         socfpga_defconfig
powerpc                     ppa8548_defconfig
arm                           sama7_defconfig
mips                      malta_kvm_defconfig
arm                     am200epdkit_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220225
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225
s390                 randconfig-r044-20220225
hexagon              randconfig-r045-20220226
hexagon              randconfig-r041-20220226

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
