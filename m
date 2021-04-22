Return-Path: <SRS0=Pgi6=JT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C41C43460
	for <ath10k@archiver.kernel.org>; Thu, 22 Apr 2021 08:07:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346866145D
	for <ath10k@archiver.kernel.org>; Thu, 22 Apr 2021 08:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346866145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7cLFPqyRtSqBLcu4AtHqj7E/NGigEhMUlLZqcPNItdM=; b=TLEiBDA5XttwnYs6DVcKE/V/x8
	u97SDU8Pkzxdt1h28Cwr18scR2UDgMF0yS7n8V15YfiYZo1/JFbCbHg1iDGRYxY9APz513W56AoaF
	CmZGEoYih+CDRDk/qlgCqe6GJ3Mts7D12tKwCDJOOiQzp30IlYAWPzxV/aJR+z5M+Nqt3LuQgbLLj
	l43Nd+VSCAl0Ga68DllXs9fz7RanJZd2qYjIvr/V9PYBM/LpDJrpwRHiZ8/rLh5zqs6XiC38Vvq8s
	qQh1VBpIjwwPOFcqUTGMs4lqXGq90tKPVqZu7cKKYG3j4pNzKQLhRLON7ULxxji5MppigvUa0yB9R
	dbJF+uZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZUMB-00GCcA-Fn; Thu, 22 Apr 2021 08:06:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUM6-00GCbT-NY
 for ath10k@desiato.infradead.org; Thu, 22 Apr 2021 08:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=veYqygrv8t2QjV8IFvfM9no1SM/i6aDENHHcQI3NMlA=; b=fm/sDyqEI3HSwpj1FWyfGnAt3K
 STd1WTkWsP8If35hAkEDX/Ig4KVxiB1rogDY030z8LYYeIJ3RCNG/2qs4/7dAUAyJcoqvcgHkneim
 CgbJGyrjH4rdRljYdM4pJPaeW0jyQ+NlMgPs707dih1SKFW2avliEHaPExigS5HAg3Q4Ya5KPRE1Z
 vJV1ZRc2IeyvL5n20y/Mi9YQkESAf/A/bKmF0XGe31lNpIgpVg99e9sjSVSSvyBT98jfZApoFCleX
 XfAwroGV08PLnoBURt87sRJ+PvmG61rN+KVRi+28MrDvTPTcYaEb5/NNddTLKO+4Y1HdKiF3CVx9C
 suodaCag==;
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUM3-00DTZl-Bf
 for ath10k@lists.infradead.org; Thu, 22 Apr 2021 08:06:32 +0000
IronPort-SDR: rn+BFkfQT4Qj8m+6NlJDxLg8P4BRn/XjiDzo8/wErFYLv+mZd3tvro5jD2cCVYr58CIfp7JVky
 nYWc5KLgUoxg==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="175959875"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="175959875"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 01:06:30 -0700
IronPort-SDR: CKd1WATyUI/CWFoBMzIhDOowsKzXf8PbdDehp2lZ0qSrSXU/q1ou8kkO+a+znEtHQWA/fdHYGO
 qraW24i7ugug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="453191385"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2021 01:06:28 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lZUM0-00043Q-9H; Thu, 22 Apr 2021 08:06:28 +0000
Date: Thu, 22 Apr 2021 16:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:pending] BUILD SUCCESS
 17a073700dae09314100240bd837a3161787dae2
Message-ID: <60812e7d.NwmDf7p8xfChtWej%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_010631_450903_887CBFA2 
X-CRM114-Status: UNSURE (   4.90  )
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
branch HEAD: 17a073700dae09314100240bd837a3161787dae2  ath11k: fix warning in ath11k_mhi_config

elapsed time: 726m

configs tested: 137
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
sh                             shx3_defconfig
um                                  defconfig
powerpc                      ppc44x_defconfig
powerpc                      pcm030_defconfig
arm                         s3c6400_defconfig
xtensa                          iss_defconfig
mips                      loongson3_defconfig
powerpc                  iss476-smp_defconfig
arm                              alldefconfig
arm                       omap2plus_defconfig
arm                      tct_hammer_defconfig
mips                           rs90_defconfig
arm                      integrator_defconfig
arm                      footbridge_defconfig
alpha                               defconfig
h8300                    h8300h-sim_defconfig
xtensa                              defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                      mgcoge_defconfig
powerpc                         wii_defconfig
arm                  colibri_pxa270_defconfig
openrisc                    or1ksim_defconfig
powerpc                     asp8347_defconfig
ia64                          tiger_defconfig
mips                        nlm_xlr_defconfig
mips                  decstation_64_defconfig
m68k                          hp300_defconfig
sparc                               defconfig
mips                           xway_defconfig
powerpc                  storcenter_defconfig
mips                           ci20_defconfig
arm                         lpc18xx_defconfig
mips                      bmips_stb_defconfig
arm                        mvebu_v7_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      walnut_defconfig
mips                           mtx1_defconfig
sparc64                             defconfig
ia64                            zx1_defconfig
arm                         lpc32xx_defconfig
arm                           h5000_defconfig
powerpc                     tqm8548_defconfig
sh                     magicpanelr2_defconfig
arm                         cm_x300_defconfig
arc                        vdk_hs38_defconfig
arc                        nsim_700_defconfig
mips                        maltaup_defconfig
mips                        bcm47xx_defconfig
powerpc                 canyonlands_defconfig
i386                             alldefconfig
arc                      axs103_smp_defconfig
m68k                         apollo_defconfig
sh                           sh2007_defconfig
sh                           se7722_defconfig
openrisc                         alldefconfig
powerpc                      acadia_defconfig
mips                            e55_defconfig
sh                            migor_defconfig
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
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
