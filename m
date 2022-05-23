Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8CFC433F5
	for <ath10k@archiver.kernel.org>; Mon, 23 May 2022 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m2Ftedno1gwcpibS2HhFyPlDKDW0EhMy7HR4d+3EgK4=; b=gfBmnbCiiKIBmZ
	MARCYPrZ6mB7MZrGaJfdlTy9LiGiw7qzpfd/dT8iKnezF7vSAmy3oru28y1beFBpCtfPuGgV6l6Sf
	lBa4jZK57ZeihlOR0nZlUy4QGeODehapDMgZPNPyWUzCe6UWwxm7CLJea2y/1RsopeQmrBaXxPPq5
	cJh4Nms3PIigAk3SQF6Zvsjx+mvAztaLzEL+gRdnt6HXCUh4qk09DkB/WJ9LReJH/BMnNjLRVStR4
	dxJssWHvlnMfJx02W4GlH2TwmGDdvqTOPh9TTM5ca9bKM4iz+5450s0Kx8tbltCuOJR3unh5tBiPR
	eKQibR3gAEO5hfpi0ejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3Ix-002O2s-BN; Mon, 23 May 2022 08:20:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2t6-002CKb-IH
 for ath10k@bombadil.infradead.org; Mon, 23 May 2022 07:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=mPWWy+1avozclcvuLLKMqE8lNMgOfim6jrgZFOPSo/4=; b=mCbLoMRJRePNXwa9u9xy0RvDru
 6lIgvpuWn6O3wxUD0MHj9/SqSCywcPE7YI2hgOd7VYgZpQdk91YtU1KQzzwcPEJ9LjE05jm5C+YDz
 a4a3x7PBqXzUsJFCKaSfroD05jd7vYlENbi11dz17EIj/i3K2Mg2btvESmA2HN8GvhSjWop11kjiN
 FxYD11dcuvc61ddv+hBEH4VyMPb+7eE6bJRBTKGhZi4OXegUHpN2L2sUNs5ntCf2468AL+EKh/SFI
 i+qmwE/Yb56jKrYdh212nVIXfky2QndNePJVgILiFSbRQYAEO5j7ztyZp3ks9XqWyZa/QAOXppfAg
 yxPcaYrQ==;
Received: from mga09.intel.com ([134.134.136.24])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsxU1-000kou-MB
 for ath10k@lists.infradead.org; Mon, 23 May 2022 02:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653271665; x=1684807665;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Oix5HaukbakIJyegeSsO7aEYnLWIlrIlChW+34vYPjM=;
 b=IQarBsGb/8ygn/U5zNTcarNxTJe9xRba4xxb5BdzS2PqpxvaqpsQxMyK
 kSZKQLe0bXFOadYz0dAKRpeAtD1k6h7v3jolYrqNMkhaGf2pnVy74Nk2j
 xB6D6HXZ+F338qoyXusamk4rpEU5DTqkvMcHAYx2Xwyp1MeDcIvGj4hI0
 Nxm7g58jlb7asob8USUc2Vkca6b9etyGZPV5mWCpBsrr8tJ+rUPDcCr16
 WEnqmXE//2ErVXZFDUozIM0AvurcKydqcWGDPai1yLqp7EFRhgYOkpu+d
 gS6GHQkXLxsfvPa+uNeQNbCNJdMIxjeoYpVU7Khcd8s4A0T5EvPJtbAUY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="272794227"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="272794227"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="819544294"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 22 May 2022 19:06:30 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nsxSo-0000oV-0K;
 Mon, 23 May 2022 02:06:30 +0000
Date: Mon, 23 May 2022 10:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 3d81b8d1b9707e4932244c121ad393679a2194ae
Message-ID: <628aec19.myCxcGxZ7C4iygNB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_030747_085992_11F4F83F 
X-CRM114-Status: UNSURE (   4.96  )
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
branch HEAD: 3d81b8d1b9707e4932244c121ad393679a2194ae  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm                         lpc18xx_defconfig
xtensa                           allyesconfig
m68k                        mvme16x_defconfig
mips                        bcm47xx_defconfig
powerpc                     asp8347_defconfig
m68k                         apollo_defconfig
arm                        trizeps4_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
arm                        clps711x_defconfig
arm                          pxa3xx_defconfig
arm                          pxa910_defconfig
openrisc                         alldefconfig
mips                           jazz_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
mips                     decstation_defconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
m68k                             allyesconfig
m68k                                defconfig
m68k                          hp300_defconfig
m68k                             alldefconfig
sh                           sh2007_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                           ip27_defconfig
arm                      pxa255-idp_defconfig
arm                           omap1_defconfig
s390                             alldefconfig
arm                            mmp2_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        magician_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
