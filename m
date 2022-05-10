Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97916C433EF
	for <ath10k@archiver.kernel.org>; Tue, 10 May 2022 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nOTsjULSRMpNQt9Je5/do8Fjw0VH9mzbam+LgPX2vjs=; b=RUkgzEy+CUpOXM
	8PvtDcaKzSPluIy+a5VNWzBrpN1JOPFkgFe04/w/8jWMaCEzvcOetrumsWVvXzLfXxLI5+thwDJdt
	CKJBYT68/oCP3+w7Tes3vKSwQSF4/GHpVtcpZb1IRYhJYczVO6Nkw9PMS1qJ/k43osV6ERwE4aoLZ
	jierXWNLJ9j/Ox+9JKVyVC82zTQH6lQ7LphW7VF0JHOts+CLdeN0L0JD3AIORLrN6uT/3QxI93wnR
	aOJl+iA2cvsV/ZeqrrLIeq9sQBC/t7UZpwDGPd/SB27LD6S91JObzVbIdao6p5ZwW9oN0Jd/sGKiX
	TZKcOx0Ps2sswNk0dwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noKoI-000UaX-8r; Tue, 10 May 2022 08:01:34 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noKo7-000UVZ-4z
 for ath10k@lists.infradead.org; Tue, 10 May 2022 08:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652169683; x=1683705683;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=UKWVL4j1N4Qm7KuNBoZdUjrbo8mhLYesqF12pOJn/FM=;
 b=bWdBwxp4fO8blKBsPtuLN4MIkagz55cnM6mKkiuJw3GLzeJ4nYmA7eRD
 TnfHnqw9xB5gSwg1CuFB1CMq6AkNvsAPpTAFPBvGcF5mbszPo9tvI02ht
 9OmGR8MexfV1ffl1QWem5nd89ZmkJBM4xdyVdxFimUYyNW0NfoYMlD2L5
 Z6T1KwJmWlVzR7GduDwlE9MWoQbkJzLS5BUXpiHQhfjLsGoth/r7OOz4i
 ORHLloKU9CLJDUarUaJtYVdW0y6afc+lGVxwZlOiquPcn6/u816WCr0ca
 39iCrXQlfUnjwPrU30mX56eQQOjA58u94IQ4WZifPs7qQ4pCjCaltZGZ1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="256837205"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="256837205"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 01:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="635815719"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 10 May 2022 01:01:17 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1noKo1-000HXq-BK;
 Tue, 10 May 2022 08:01:17 +0000
Date: Tue, 10 May 2022 16:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 0371040f5ee5e7a7c115b50147f579e3d633da96
Message-ID: <627a1b96.Lq/nGb2hEWzAaRzT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_010123_303124_C3D248E1 
X-CRM114-Status: UNSURE (   7.16  )
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
branch HEAD: 0371040f5ee5e7a7c115b50147f579e3d633da96  ath10k: improve BDF search fallback strategy

elapsed time: 1047m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20220509
parisc                           alldefconfig
sh                          urquell_defconfig
arm                         lubbock_defconfig
sh                          sdk7780_defconfig
sh                           se7712_defconfig
arm                        clps711x_defconfig
arc                              alldefconfig
sh                          landisk_defconfig
arm                       omap2plus_defconfig
arm                         axm55xx_defconfig
mips                    maltaup_xpa_defconfig
mips                             allmodconfig
powerpc                    klondike_defconfig
arm                        realview_defconfig
arc                          axs103_defconfig
sh                             sh03_defconfig
sh                           sh2007_defconfig
arm                      integrator_defconfig
xtensa                           allyesconfig
arm                          badge4_defconfig
powerpc                     taishan_defconfig
arm                      jornada720_defconfig
sh                           se7724_defconfig
m68k                        m5272c3_defconfig
sh                           se7780_defconfig
mips                         cobalt_defconfig
sh                        edosk7705_defconfig
powerpc                      ppc40x_defconfig
arm                            qcom_defconfig
mips                        vocore2_defconfig
arc                     nsimosci_hs_defconfig
sh                         apsh4a3a_defconfig
arm                           corgi_defconfig
mips                 decstation_r4k_defconfig
s390                       zfcpdump_defconfig
arm                            hisi_defconfig
powerpc                      makalu_defconfig
sh                             espt_defconfig
um                                  defconfig
arm                       aspeed_g5_defconfig
sh                         ecovec24_defconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
parisc                              defconfig
parisc64                            defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20220509
x86_64               randconfig-a012-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
x86_64               randconfig-a014-20220509
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a012-20220509
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20220509
i386                 randconfig-c001-20220509
powerpc              randconfig-c003-20220509
riscv                randconfig-c006-20220509
arm                  randconfig-c002-20220509
mips                 randconfig-c004-20220509
mips                          ath79_defconfig
powerpc                      ppc64e_defconfig
mips                        workpad_defconfig
arm                          pcm027_defconfig
arm                          collie_defconfig
mips                     loongson1c_defconfig
mips                     cu1830-neo_defconfig
x86_64               randconfig-a006-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a003-20220509
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
