Return-Path: <SRS0=t6ZP=HY=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E21C433DB
	for <ath10k@archiver.kernel.org>; Mon, 22 Feb 2021 20:16:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E1264DFD
	for <ath10k@archiver.kernel.org>; Mon, 22 Feb 2021 20:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E1264DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y7j2UFtn5hc7bX2fnatxsm9NIkxJd06nO9RYejKwndY=; b=Oxa2QzjAeSILvuYhvH4xXoMAYY
	/s9nwcBPxvZtpLzl+ZS6Sm9M52CuvAXp8wZrmiFe/3SIsLAyG79J/wga4bX2mq+DAdMTh9x/49qV6
	b5sMl5x76jM3EcjvZInkvP+EWyNGHrdl1aLScKhk9wKjH9TR2gmkejt6gDva0WbrcSri7VhhkEIjk
	dWAz0vpmWGlDPrsYgb3np9LRBImxV7rUmd33d6H3Ah9g5Ouuyfq3MYtvz4MyHc6+TOt380Q/K3qcq
	tHpyU12u/+CKTu7X/OzX6905Ft8BMdlyCCQjYVI88xEXtyuqx9rW2PhvSoVm8Fxghgiu9o/tcHzMy
	XjBqSaFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEHc8-0006Wi-R0; Mon, 22 Feb 2021 20:15:28 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEHc3-0006Vv-Pe
 for ath10k@lists.infradead.org; Mon, 22 Feb 2021 20:15:26 +0000
IronPort-SDR: e5khjm1d5g6cV4NP4aL8e3S6Fb1Px/9VABO73PwuE5BVQ0pnfOWNPYKEGB2dfApqAIf6evQcm6
 gaGT1sLMEGqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="269519196"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="269519196"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 12:15:16 -0800
IronPort-SDR: eFB0p5vlcOUXTHbMUpaWkdHvgZeAGmS4a8fCfsID2dZTDzvvo2BfKM1DwV85gQCIN0lZgN18dl
 txYrY4+0kKpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="582926958"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 22 Feb 2021 12:15:15 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lEHbu-0000e2-Dv; Mon, 22 Feb 2021 20:15:14 +0000
Date: Tue, 23 Feb 2021 04:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master] BUILD SUCCESS f5242d42da02730c67d517a7402015c13f59deee
Message-ID: <603410c5.zGj3NZ+6o4Lo/sKK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_151523_988962_B8F6BF93 
X-CRM114-Status: UNSURE (   5.78  )
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
branch HEAD: f5242d42da02730c67d517a7402015c13f59deee  Add localversion-wireless-testing-ath

elapsed time: 723m

configs tested: 145
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      chrp32_defconfig
arm                            qcom_defconfig
powerpc                     mpc83xx_defconfig
sh                  sh7785lcr_32bit_defconfig
ia64                             alldefconfig
h8300                       h8s-sim_defconfig
riscv                    nommu_k210_defconfig
sh                          sdk7780_defconfig
mips                             allyesconfig
arm                            xcep_defconfig
powerpc                      tqm8xx_defconfig
sh                          r7785rp_defconfig
mips                             allmodconfig
arm                        keystone_defconfig
m68k                          multi_defconfig
arm                         nhk8815_defconfig
arm                         lpc18xx_defconfig
mips                     cu1000-neo_defconfig
powerpc                       eiger_defconfig
mips                         tb0226_defconfig
mips                          ath25_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                        m5407c3_defconfig
powerpc                      arches_defconfig
mips                        jmr3927_defconfig
powerpc                     tqm8548_defconfig
arm                           corgi_defconfig
nios2                         10m50_defconfig
sh                             sh03_defconfig
sh                              ul2_defconfig
sh                           se7343_defconfig
ia64                            zx1_defconfig
arm                         shannon_defconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
sh                         ecovec24_defconfig
alpha                            allyesconfig
sh                          polaris_defconfig
powerpc                          g5_defconfig
mips                          malta_defconfig
arc                        nsim_700_defconfig
mips                           mtx1_defconfig
arm                       netwinder_defconfig
arm                           spitz_defconfig
m68k                           sun3_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          landisk_defconfig
sh                            titan_defconfig
powerpc                     rainier_defconfig
mips                        vocore2_defconfig
arm                          lpd270_defconfig
powerpc                     akebono_defconfig
mips                            ar7_defconfig
sparc                       sparc32_defconfig
ia64                      gensparse_defconfig
powerpc                     ppa8548_defconfig
powerpc                     mpc5200_defconfig
arm                     davinci_all_defconfig
mips                         tb0219_defconfig
powerpc                      makalu_defconfig
sparc                               defconfig
arm                        realview_defconfig
powerpc                     taishan_defconfig
arm                          pxa168_defconfig
arm                          simpad_defconfig
mips                           ci20_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                   lite5200b_defconfig
powerpc                      ppc6xx_defconfig
arm                            mps2_defconfig
i386                             allyesconfig
powerpc                mpc7448_hpc2_defconfig
arm                  colibri_pxa270_defconfig
arc                        nsimosci_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
i386                               tinyconfig
i386                                defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210222
x86_64               randconfig-a002-20210222
x86_64               randconfig-a003-20210222
x86_64               randconfig-a005-20210222
x86_64               randconfig-a006-20210222
x86_64               randconfig-a004-20210222
i386                 randconfig-a005-20210222
i386                 randconfig-a006-20210222
i386                 randconfig-a004-20210222
i386                 randconfig-a003-20210222
i386                 randconfig-a001-20210222
i386                 randconfig-a002-20210222
i386                 randconfig-a013-20210222
i386                 randconfig-a012-20210222
i386                 randconfig-a011-20210222
i386                 randconfig-a014-20210222
i386                 randconfig-a016-20210222
i386                 randconfig-a015-20210222
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210222
x86_64               randconfig-a011-20210222
x86_64               randconfig-a012-20210222
x86_64               randconfig-a016-20210222
x86_64               randconfig-a014-20210222
x86_64               randconfig-a013-20210222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
