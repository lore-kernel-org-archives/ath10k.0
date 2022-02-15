Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DB7C433F5
	for <ath10k@archiver.kernel.org>; Tue, 15 Feb 2022 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oe5vFs8uNhcAAZCG4bXSL0LnvheJod3BSWkbo3A66Ok=; b=AmdnT6V2baWRrP
	5PF4CnhWz3j4UZrLuCRlnDg6mV97gFs3Fghza+4PUu/M3efHmoJsKKmVVHQcp9N+wInQJoiv7QGTQ
	n9IdpPfVkq5uwlj4StBfGayOjrqSR7RQYmHRYpbiR5H3UKCUL72zYwFzlm4TTL7dl268lSOrviuYE
	E0gWIG4mjc0CPxLnSPMUd0VlWe71P/MNkMbxRi76ik0EqynWCZ+TdVMX9XDXuws7jmJKGJ607c0Ci
	jVeJBXL8Julu0HpS39dJvZsl18fcJh3Ln92IAOouxn8Eqa8+ysFwXaipyMhdigdXyJmsKI+2x890y
	s7PetM4KzBA1kfE8/tLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJubl-002AJ9-0T; Tue, 15 Feb 2022 09:58:53 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJubc-002AH7-Tf
 for ath10k@lists.infradead.org; Tue, 15 Feb 2022 09:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644919124; x=1676455124;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=qTu78OCc/CQ44gGDPugO6Z5s3IMwFzoIM40OM6EARZU=;
 b=StYYmqBiuZAS24hTyR9eCRVrcZev5HpBmAQ10fxaQAkSj1PMy/8LBaex
 GD1gdixvhntei5ur0rwPAlEI4UvEowJcjzLnLe5xla3U2PpcAaW+YSddL
 I5Cxu9FzLllkPxU5iOrKulh4GYSyrFRFYyC70luMoiJx5Wc92o/Dbit3d
 wgGGnilLoRRyyQ6L2z6C7o0ba8W40ZeF+6ICDydAZOnfJ+O1amQnKpmW6
 5/K/oCghNrkN6ec+mpYLlZ4g+aFc39fB1jXzmJTWzldnzfcrC/zoL9Owe
 e28oaENhcRh9v+r8C60ZdhVgroByWXG13+c3oekOR8Nb9wzC2JY3lTfcO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="249148294"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="249148294"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 01:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="703555898"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 15 Feb 2022 01:58:42 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nJuba-0009Wp-7H; Tue, 15 Feb 2022 09:58:42 +0000
Date: Tue, 15 Feb 2022 17:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 33608e2dbe116e10b21377a55780d07e771373c6
Message-ID: <620b791f.4NOklnJaawZqfP/p%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_015845_029001_F7D22038 
X-CRM114-Status: UNSURE (   4.84  )
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
branch HEAD: 33608e2dbe116e10b21377a55780d07e771373c6  Merge branch 'ath-next' into ath-qca

elapsed time: 890m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220214
sh                     magicpanelr2_defconfig
powerpc                       ppc64_defconfig
powerpc                       maple_defconfig
powerpc64                           defconfig
sparc                               defconfig
arm64                            alldefconfig
arm                        mvebu_v7_defconfig
nios2                         10m50_defconfig
ia64                          tiger_defconfig
sparc                       sparc32_defconfig
arm                  randconfig-c002-20220214
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
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
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
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20220214
x86_64               randconfig-a014-20220214
x86_64               randconfig-a012-20220214
x86_64               randconfig-a015-20220214
x86_64               randconfig-a011-20220214
x86_64               randconfig-a016-20220214
i386                 randconfig-a013-20220214
i386                 randconfig-a012-20220214
i386                 randconfig-a015-20220214
i386                 randconfig-a011-20220214
i386                 randconfig-a014-20220214
i386                 randconfig-a016-20220214
riscv                randconfig-r042-20220214
arc                  randconfig-r043-20220214
s390                 randconfig-r044-20220214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc                      obs600_defconfig
powerpc                      katmai_defconfig
arm                           omap1_defconfig
powerpc                     mpc5200_defconfig
arm                  colibri_pxa300_defconfig
arm                         bcm2835_defconfig
arm                       aspeed_g4_defconfig
arm                          pcm027_defconfig
arm                         socfpga_defconfig
arm                          collie_defconfig
x86_64               randconfig-a002-20220214
x86_64               randconfig-a006-20220214
x86_64               randconfig-a005-20220214
x86_64               randconfig-a004-20220214
x86_64               randconfig-a003-20220214
x86_64               randconfig-a001-20220214
i386                 randconfig-a004-20220214
i386                 randconfig-a005-20220214
i386                 randconfig-a006-20220214
i386                 randconfig-a003-20220214
i386                 randconfig-a001-20220214
i386                 randconfig-a002-20220214
hexagon              randconfig-r045-20220214
hexagon              randconfig-r041-20220214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
