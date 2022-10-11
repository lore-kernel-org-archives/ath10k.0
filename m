Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88EEC433F5
	for <ath10k@archiver.kernel.org>; Tue, 11 Oct 2022 17:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q85dE80QWPQBpGl6QDGeIsJJeT0VPXG1x9RZF+sDBz4=; b=Dp5QGuduRw/Jqu
	rbjpJMEzV/gvevxCgR3LqidXdi39nJzhfF08WWipbygGBW830of0MAq4ArJMQLyhyB2EmBYOodhTx
	6P2D3DxtGhB3uw9jcUFaBorHhJ4AEbXvaoE5h0C6mFKIuJ41L3JHRwJ/gup6vYTOglbrGsiC7algH
	xM0zG5aaFLf2OuhXfuYxJrEg7D2tnrxbik//nnGGgklpz0KSrXmWET1e1d5D2LIckn4TiIRF5eJqh
	0DpC308EBHamfBUKhqNfsmzUbQ9ww47YT2GujbL7sdPQGQaTEoeqjavyGWQRifYVAOVVbJAb4bnJm
	Gq4OqSXTahot5r6mBEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiIwP-005KqC-Uh; Tue, 11 Oct 2022 17:21:17 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiIwN-005Kpi-E6
	for ath10k@lists.infradead.org; Tue, 11 Oct 2022 17:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665508875; x=1697044875;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aBG9KtjbKiZ1U3Jgl+5a5C8FxzHtKKhIie84NLw8aDs=;
  b=Qe5G+fPd+B0R7mRH5q03dOuSjZ6czeaqIg3tTcrQTT6XhS3Wf6CXbcNo
   Xf0OzWx5G2PtNmcgOUMNAyrxXpCFl2EPvgh0s8Xym11i7OGlTlZL5vQ9R
   EQcvn4Qn4ihksndLIMVFn3Y16ScjdHiw7BpfkvldWZ/8pnEr6Eof8creV
   Xxc97izhp3GeGJS9AwBbX+ETzFaiJFReXoyMqYSySddu1zXsk/R73EClA
   LFAOSF2Fx1qVvXJoZwaq8hbtbRNu+Gif+gXPKRyk7UniSXwOSYMIKzoyL
   mXoNcmbMzb4zsio0OJJH6OBrZw+W69j74jvK5bVEc83QiMx4UYa4AjBJO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="366570498"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="366570498"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 10:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="604229065"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="604229065"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Oct 2022 10:18:30 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oiIth-00032V-2f;
	Tue, 11 Oct 2022 17:18:29 +0000
Date: Wed, 12 Oct 2022 01:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 45bfea4e94eea687c28862b72271465f14faf0f9
Message-ID: <6345a54b.9apIFw9sl5JhJ449%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_102115_573967_CDA827CC 
X-CRM114-Status: UNSURE (   4.08  )
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
branch HEAD: 45bfea4e94eea687c28862b72271465f14faf0f9  Add localversion-wireless-testing-ath

elapsed time: 723m

configs tested: 131
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
arc                                 defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
alpha                               defconfig
arc                              allyesconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
i386                 randconfig-a012-20221010
alpha                            allyesconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a011-20221010
arc                  randconfig-r043-20221010
i386                 randconfig-a013-20221010
i386                 randconfig-a015-20221010
i386                 randconfig-a016-20221010
i386                 randconfig-a014-20221010
x86_64                           rhel-8.3-syz
s390                 randconfig-r044-20221010
riscv                randconfig-r042-20221010
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm                                 defconfig
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
i386                                defconfig
arm                              allyesconfig
x86_64               randconfig-a014-20221010
x86_64               randconfig-a015-20221010
x86_64               randconfig-a012-20221010
x86_64               randconfig-a011-20221010
x86_64               randconfig-a013-20221010
x86_64               randconfig-a016-20221010
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                             allyesconfig
powerpc                           allnoconfig
i386                 randconfig-c001-20221010
mips                             allyesconfig
arm                      integrator_defconfig
sh                           se7750_defconfig
sh                             shx3_defconfig
mips                      maltasmvp_defconfig
powerpc                          allmodconfig
arm                         s3c6400_defconfig
arm                         lubbock_defconfig
m68k                        m5272c3_defconfig
sh                               allmodconfig
ia64                          tiger_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     asp8347_defconfig
m68k                        stmark2_defconfig
sh                           se7206_defconfig
sh                        edosk7760_defconfig
arm                        trizeps4_defconfig
arm                           stm32_defconfig
arm                            pleb_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                            lart_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      fuloong2e_defconfig
x86_64               randconfig-k001-20221010
mips                           jazz_defconfig
powerpc                      pcm030_defconfig
mips                         rt305x_defconfig
openrisc                    or1ksim_defconfig
arm                           h5000_defconfig
powerpc                    sam440ep_defconfig
mips                          rb532_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                        m5407c3_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     pq2fads_defconfig
powerpc                   currituck_defconfig
arc                           tb10x_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                             alldefconfig
arc                      axs103_smp_defconfig
powerpc                     taishan_defconfig
arm                         lpc18xx_defconfig
parisc                generic-64bit_defconfig
arc                         haps_hs_defconfig
xtensa                           alldefconfig
arm                            zeus_defconfig
arm                           sama5_defconfig
openrisc                       virt_defconfig
powerpc                      ep88xc_defconfig
um                               alldefconfig
sh                           se7780_defconfig

clang tested configs:
hexagon              randconfig-r045-20221010
hexagon              randconfig-r041-20221010
i386                 randconfig-a003-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a002-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a005-20221010
i386                 randconfig-a004-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a005-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a006-20221010
arm                       imx_v4_v5_defconfig
mips                     cu1000-neo_defconfig
arm                          ixp4xx_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                      walnut_defconfig
powerpc                 mpc836x_rdk_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
