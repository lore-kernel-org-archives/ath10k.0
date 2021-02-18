Return-Path: <SRS0=uksI=HU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB77EC433DB
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 22:10:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A4064EB2
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 22:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A4064EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d7xqMfRDtfgvwQwMwrtcZjIjH5j0AmzqMsGeyaMSh+A=; b=RAd2lqptl+YCIc+sU2xFAmMckn
	4g+YZa7ld9/v2IBBCqqsvZhWmvWYQdZ+aJCRcRtjWhWA/+QRHxmBwDc1uwhfrnPHswwyPgH4CY03f
	1pdKQTzp4aWzs+ElHKr+NzZsv65DlaGODkgeXP/T8jKCk3N8MPn8OGul3lD+TYcyMN2Tw+7r/FzL1
	6IPKQquGdsZpEnq3ZqJT0WX7ThI4r+HpOLu8wkPlYxZxtx5mG+x4eAn4105MqXzey9EgOak3mRdRw
	dTpgdaq68zNDCLt8wjOEZPVikK7UXkQ5siNN36ttldvIKXS/krn/zDMHEeY8FfCql65bu33jxS5Z9
	hICNLuoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCrV3-00021X-8C; Thu, 18 Feb 2021 22:10:17 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCrUx-0001zj-1u
 for ath10k@lists.infradead.org; Thu, 18 Feb 2021 22:10:13 +0000
IronPort-SDR: LtUzK/eLXB09zyhXSFNmmD8FwLat47VUERO+jC6LjVdI9HlWdVQFQ9xfE1HQ7Rys3rGqG2P4Aq
 vQKQOKSmo1eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="245115377"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="245115377"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:10:09 -0800
IronPort-SDR: vny7kmQDOSdivNYnYyVNqnLe7xHui/0Tcle8rBVNNml61FTnjWA4/MA9sjVLj/MC+4/wMT6DL3
 fP1JrzbUgJEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="590381931"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 18 Feb 2021 14:10:07 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lCrUt-0009vT-7P; Thu, 18 Feb 2021 22:10:07 +0000
Date: Fri, 19 Feb 2021 06:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master] BUILD SUCCESS 65845bc28635ea5628bb94c7c3b09502cb05ddcc
Message-ID: <602ee5a0.QqT28svtAYZaw120%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_171011_365905_8484E200 
X-CRM114-Status: UNSURE (   6.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 65845bc28635ea5628bb94c7c3b09502cb05ddcc  Add localversion-wireless-testing-ath

elapsed time: 723m

configs tested: 134
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     mpc5200_defconfig
arm                       aspeed_g4_defconfig
m68k                          amiga_defconfig
powerpc                    mvme5100_defconfig
arm                        cerfcube_defconfig
arm                          simpad_defconfig
arm                         cm_x300_defconfig
c6x                                 defconfig
sh                ecovec24-romimage_defconfig
arm                         lubbock_defconfig
powerpc64                           defconfig
arm                       netwinder_defconfig
sparc                       sparc64_defconfig
xtensa                  cadence_csp_defconfig
powerpc                      pasemi_defconfig
m68k                        m5407c3_defconfig
mips                          rm200_defconfig
arm                            dove_defconfig
arm                        spear3xx_defconfig
sh                          lboxre2_defconfig
arm                       imx_v4_v5_defconfig
arm                     eseries_pxa_defconfig
mips                           xway_defconfig
parisc                generic-64bit_defconfig
arm                           omap1_defconfig
powerpc                     sbc8548_defconfig
arm                          pxa3xx_defconfig
m68k                       m5208evb_defconfig
mips                      pic32mzda_defconfig
powerpc                      katmai_defconfig
powerpc                      acadia_defconfig
xtensa                    xip_kc705_defconfig
m68k                        m5307c3_defconfig
arm                             rpc_defconfig
sh                           sh2007_defconfig
nios2                               defconfig
sh                         microdev_defconfig
mips                       capcella_defconfig
arm                          exynos_defconfig
ia64                      gensparse_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210218
x86_64               randconfig-a001-20210218
x86_64               randconfig-a004-20210218
x86_64               randconfig-a002-20210218
x86_64               randconfig-a005-20210218
x86_64               randconfig-a006-20210218
i386                 randconfig-a005-20210218
i386                 randconfig-a003-20210218
i386                 randconfig-a002-20210218
i386                 randconfig-a004-20210218
i386                 randconfig-a001-20210218
i386                 randconfig-a006-20210218
x86_64               randconfig-a013-20210217
x86_64               randconfig-a016-20210217
x86_64               randconfig-a012-20210217
x86_64               randconfig-a015-20210217
x86_64               randconfig-a014-20210217
x86_64               randconfig-a011-20210217
i386                 randconfig-a016-20210218
i386                 randconfig-a012-20210218
i386                 randconfig-a014-20210218
i386                 randconfig-a013-20210218
i386                 randconfig-a011-20210218
i386                 randconfig-a015-20210218
i386                 randconfig-a016-20210216
i386                 randconfig-a014-20210216
i386                 randconfig-a012-20210216
i386                 randconfig-a013-20210216
i386                 randconfig-a011-20210216
i386                 randconfig-a015-20210216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210216
x86_64               randconfig-a016-20210216
x86_64               randconfig-a012-20210216
x86_64               randconfig-a015-20210216
x86_64               randconfig-a014-20210216
x86_64               randconfig-a011-20210216
x86_64               randconfig-a012-20210218
x86_64               randconfig-a016-20210218
x86_64               randconfig-a013-20210218
x86_64               randconfig-a015-20210218
x86_64               randconfig-a011-20210218
x86_64               randconfig-a014-20210218

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
