Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AABC433F5
	for <ath10k@archiver.kernel.org>; Sat,  8 Oct 2022 01:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OWJKMAnv7udGBzKDdvXVwf4RF1sXpVgC189KbssL4kA=; b=pXmKd0xWCBL8cY
	VKkVtSJcZRHVDuVO25Mcj2OuI/rdAxb9yWXWiiXeBFxDZuCpEu0zm3OOwmw7HdBLDLAKd02Qw6/li
	HLzRt+hBM/aUGNc9VHo6YxoycGA7htMxA1h5sVD3XWlfrgkSzvjjJ+0rILQVI5yo0PdszEbE6/W+m
	mBbSh/jyhHDeFkd7hz2OT2Lakdyc72z/zmjn34KaElidZxZFxNEQDe66OwpNtjo/WpCZKJOu1rYpX
	vVMF15neAK2VGCN8FnMmk/NBc55tgED9TGKxUzf0r0/S9ShDqxa7ZQcS2fX/j3UiUiCFvq1yTSBY6
	XLa93spvXebzhNpsoOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogymL-00BITH-M9; Sat, 08 Oct 2022 01:37:25 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogymJ-00BISX-Lw
	for ath10k@lists.infradead.org; Sat, 08 Oct 2022 01:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665193043; x=1696729043;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EtoE70/v/TUIwPY62J0rXeLsDenYMqkKCwpWVVt7PKM=;
  b=UMBqbT/GcwjOPCGvd8fdwngPFK7e1CdUkOCMdIwbE+jrd53zaCU+4LKF
   IP0cW1Bsh/nQUgpcmTd/oC/WvW0IOYg1St2OqEUIJd3hsReqDBxNScbSR
   RxrNAxXG3cLJqkryk+34tK1HGJuP1VWh+9qgWA+lwfugqJy0eA3URN8r6
   nySln1pLh1vzswM1SETM1llr85+5VKMpc5qY9lTX/3ZmnmOc8LRozgnvf
   vrBYUxkQMWfWS2e8wYZBVoH4YoLS6XNbh/EgAfbBpdobgQDsMgxKuW/Sa
   L7RCGAv2LsHnzgNwxgZ2HAEtTZsNvA1Z7vgh0L1eLS6UzEsdOCqgSQrM2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="305463379"
X-IronPort-AV: E=Sophos;i="5.95,168,1661842800"; 
   d="scan'208";a="305463379"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2022 18:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="693994432"
X-IronPort-AV: E=Sophos;i="5.95,168,1661842800"; 
   d="scan'208";a="693994432"
Received: from lkp-server01.sh.intel.com (HELO 3c15167049b7) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2022 18:37:18 -0700
Received: from kbuild by 3c15167049b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ogymD-0001jA-2Q;
	Sat, 08 Oct 2022 01:37:17 +0000
Date: Sat, 08 Oct 2022 09:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 e24d09c71778025bc3096ca7bffc7e2a7da6dd34
Message-ID: <6340d445.ey1sdAOkRNlR/9OI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_183723_794080_2E4CD6DA 
X-CRM114-Status: UNSURE (   5.61  )
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
branch HEAD: e24d09c71778025bc3096ca7bffc7e2a7da6dd34  wifi: ath9k: Make arrays prof_prio and channelmap static const

elapsed time: 726m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
x86_64                          rhel-8.3-func
s390                                defconfig
s390                             allmodconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
arc                              allyesconfig
powerpc                           allnoconfig
alpha                            allyesconfig
powerpc                          allmodconfig
i386                                defconfig
mips                             allyesconfig
sh                               allmodconfig
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm                        clps711x_defconfig
arm                      integrator_defconfig
powerpc                     sequoia_defconfig
m68k                             allmodconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a016-20221003
i386                 randconfig-a012-20221003
i386                 randconfig-a014-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a013-20221003
ia64                             allmodconfig
riscv                randconfig-r042-20221007
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
arc                  randconfig-r043-20221002
arc                  randconfig-r043-20221007
s390                 randconfig-r044-20221003
s390                 randconfig-r044-20221007
x86_64               randconfig-a011-20221003
x86_64               randconfig-a016-20221003
x86_64               randconfig-a014-20221003
x86_64               randconfig-a013-20221003
x86_64               randconfig-a012-20221003
x86_64               randconfig-a015-20221003
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
powerpc                     ep8248e_defconfig
sh                  sh7785lcr_32bit_defconfig
sparc64                          alldefconfig
sh                        dreamcast_defconfig
s390                          debug_defconfig
powerpc                     asp8347_defconfig
nios2                            alldefconfig
um                               alldefconfig
sh                          kfr2r09_defconfig
sh                           se7751_defconfig
mips                         db1xxx_defconfig
powerpc                    klondike_defconfig
arm                        oxnas_v6_defconfig
arm                       imx_v6_v7_defconfig
powerpc                         wii_defconfig
powerpc                     taishan_defconfig
sh                          landisk_defconfig
powerpc                        warp_defconfig
arm                           viper_defconfig
arm                  randconfig-c002-20221002
x86_64                        randconfig-c001
arm                        realview_defconfig
sh                          polaris_defconfig
sh                     magicpanelr2_defconfig
powerpc                       maple_defconfig
arm                           sunxi_defconfig
sparc                       sparc64_defconfig
parisc                generic-64bit_defconfig
arm                             ezx_defconfig
m68k                          multi_defconfig
riscv                randconfig-r042-20221005
arc                  randconfig-r043-20221005
s390                 randconfig-r044-20221005
arc                        nsim_700_defconfig
powerpc                    sam440ep_defconfig
sh                          rsk7269_defconfig
parisc                           alldefconfig
sh                        sh7757lcr_defconfig
arm                           imxrt_defconfig
arm                            zeus_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                 randconfig-c004-20221002
arm                             pxa_defconfig
arc                        vdk_hs38_defconfig
powerpc                     redwood_defconfig
nios2                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
x86_64               randconfig-a003-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a006-20221003
powerpc                        fsp2_defconfig
powerpc                     tqm8560_defconfig
arm                          pxa168_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221003
hexagon              randconfig-r041-20221002
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221007
hexagon              randconfig-r041-20221007
hexagon              randconfig-r045-20221003
powerpc                 mpc832x_mds_defconfig
riscv                randconfig-r042-20221002
s390                 randconfig-r044-20221002
i386                 randconfig-a001-20221003
i386                 randconfig-a006-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a004-20221003
mips                          ath25_defconfig
arm                        mvebu_v5_defconfig
s390                             alldefconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
