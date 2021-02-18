Return-Path: <SRS0=uksI=HU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3FFC433E0
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 05:47:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E80C64D99
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 05:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E80C64D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q61ApIqSib9kyLIPQPmUhT8OtLZS2Qsr3CSNHGNPziU=; b=G4+25vQ9U+M/PCtkdth6tjCE+U
	2yUb0g9LG+Eeb3KFcIRVAVyes9htHWuOkSAGlBrZUTl6vD5i/2+KGJ7gPRrbq9fU5zTn4cl4Pwh9Q
	aOFl5rnwVQJH9PQq4zfrwBKyttBjAH1lBjbDmtQgV7ouCGChpJB4bdSrMbV3C8SoqffJUijKlZrsO
	/hiq0furbEYn5+ucs2RmBMpbqlz1c2wDhyX3aOulab+CY6JpzyRHmTU5duxFLa6b/6It0O0xxqE7D
	tWmM+sbPFqb2UnG2wvo2cxRP4zEr1Y23qAGS5UaidyrIiwMedNoYplX5YbeyA7FXfSBaYP9ooX5fs
	13LqfjQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCc8o-0003hO-Qb; Thu, 18 Feb 2021 05:46:18 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCc8j-0003f6-Hu
 for ath10k@lists.infradead.org; Thu, 18 Feb 2021 05:46:15 +0000
IronPort-SDR: iIT6mjzQ8YG235sR4jc/e7Ly47SlnQYUqPd3MWMsP2UsGwK2JIVY0r5I6veUOdTGCGWdre0FGX
 dKW0S7RN0T5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="179894759"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="179894759"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:46:11 -0800
IronPort-SDR: +yX6AKpH2xMHinGrdsh1jptGf78tNRvkfu9cHiAFeAyirC6vHUaK2htnuw0qTU9hxKITUa6uNJ
 2SQ4AMsGy7Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="364703240"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 17 Feb 2021 21:46:09 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lCc8d-0009Tz-Cl; Thu, 18 Feb 2021 05:46:07 +0000
Date: Thu, 18 Feb 2021 13:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 3fcf149c651326852bfb6df4f8325a44a446e6a0
Message-ID: <602dff0e.zydDWJTL8GKrRF5L%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_004613_939927_BC868593 
X-CRM114-Status: UNSURE (   7.90  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 3fcf149c651326852bfb6df4f8325a44a446e6a0  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 133
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                        multi_v5_defconfig
arm                            u300_defconfig
powerpc                        icon_defconfig
mips                  maltasmvp_eva_defconfig
arm                          prima2_defconfig
mips                           xway_defconfig
mips                           ip28_defconfig
arm                         axm55xx_defconfig
arm                            lart_defconfig
mips                       capcella_defconfig
arm                      footbridge_defconfig
powerpc                     mpc83xx_defconfig
sh                           se7206_defconfig
sh                         ap325rxa_defconfig
powerpc                    amigaone_defconfig
arm                          badge4_defconfig
arc                         haps_hs_defconfig
x86_64                           alldefconfig
arc                        nsim_700_defconfig
sh                        apsh4ad0a_defconfig
powerpc                         wii_defconfig
powerpc                     mpc512x_defconfig
arc                        vdk_hs38_defconfig
xtensa                  nommu_kc705_defconfig
arm                       imx_v4_v5_defconfig
arm                     eseries_pxa_defconfig
parisc                generic-64bit_defconfig
arm                           omap1_defconfig
powerpc                     sbc8548_defconfig
arm                          pxa3xx_defconfig
m68k                       m5208evb_defconfig
mips                      pic32mzda_defconfig
sparc                       sparc64_defconfig
powerpc                      katmai_defconfig
powerpc                      acadia_defconfig
nios2                               defconfig
sh                         microdev_defconfig
arm                        cerfcube_defconfig
arm                          exynos_defconfig
ia64                      gensparse_defconfig
mips                           ip27_defconfig
powerpc                 xes_mpc85xx_defconfig
xtensa                           alldefconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc8315_rdb_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                 randconfig-a003-20210217
i386                 randconfig-a005-20210217
i386                 randconfig-a002-20210217
i386                 randconfig-a006-20210217
i386                 randconfig-a001-20210217
i386                 randconfig-a004-20210217
x86_64               randconfig-a013-20210217
x86_64               randconfig-a016-20210217
x86_64               randconfig-a012-20210217
x86_64               randconfig-a015-20210217
x86_64               randconfig-a014-20210217
x86_64               randconfig-a011-20210217
i386                 randconfig-a016-20210217
i386                 randconfig-a014-20210217
i386                 randconfig-a012-20210217
i386                 randconfig-a013-20210217
i386                 randconfig-a011-20210217
i386                 randconfig-a015-20210217
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
x86_64               randconfig-a003-20210215
x86_64               randconfig-a002-20210215
x86_64               randconfig-a001-20210215
x86_64               randconfig-a004-20210215
x86_64               randconfig-a005-20210215
x86_64               randconfig-a006-20210215
x86_64               randconfig-a003-20210217
x86_64               randconfig-a002-20210217
x86_64               randconfig-a004-20210217
x86_64               randconfig-a001-20210217
x86_64               randconfig-a005-20210217
x86_64               randconfig-a006-20210217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
