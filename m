Return-Path: <SRS0=Mu6E=H2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D0DC433E0
	for <ath10k@archiver.kernel.org>; Wed, 24 Feb 2021 19:12:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E462164E85
	for <ath10k@archiver.kernel.org>; Wed, 24 Feb 2021 19:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E462164E85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KzKvx3KHmbPIBm8HSYAGOVs3AQNAXVvtymitI2L8w5k=; b=QS5RlOlTTPAujsy8U1FMpWFLhe
	BlnjuPGmwQcDrNRTquxiAlhX8XkdoeisMMLrasB+9MSeraT1kB/vaRa3n03CFAQeVNi6tXIdNGEnz
	AFt0iy1p+O36rvnAE2xyyGRd6u2wNds/+bp5iA/UeEj9mBybMlSB7mNeeO5CweaaAgCJ5dmDW2thT
	N0cd0+nHQScnwUrM8c6Q5MfS5IU2K2Qnc0Tph/0hN9WEwLgXD1b2PJ0jHMMjgEfMBCjVD7W4rJhKL
	U0aFISWbhy6m2k5iPXt6NCDh6WH3OnjMU2Rzn17POvrybr1O0Fhim8isR7ZDUU+Dbs3KQ20OsgC26
	mvS1QjLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEzZk-0006sg-MR; Wed, 24 Feb 2021 19:11:56 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEzZf-0006qE-OG
 for ath10k@lists.infradead.org; Wed, 24 Feb 2021 19:11:53 +0000
IronPort-SDR: bofhcb5WyWrcbwcIEV0F8BEY8nDlXTTMO78odpUtbx79GrL30w4woYtJW/b71W6FAcTSKlvegP
 lVc+i2rddSxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="165144831"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="165144831"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 11:11:48 -0800
IronPort-SDR: 3Q+fcxVl0ntNiKuhbbqEH+9HYRzDu51f+bSC+T7Ofnbw9t6uBdPsb1mLenIto4pD9xMBmYgp4B
 xU2PGj8ppWYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="365048296"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 24 Feb 2021 11:11:47 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lEzZa-0002Gb-Rp; Wed, 24 Feb 2021 19:11:46 +0000
Date: Thu, 25 Feb 2021 03:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 c204b47f0d19031866779b62bf43ff96b5886056
Message-ID: <6036a4ef.NLSCy3CW72ASrrC+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_141152_014427_E2C6E6A6 
X-CRM114-Status: UNSURE (   6.43  )
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
branch HEAD: c204b47f0d19031866779b62bf43ff96b5886056  Merge branch 'pending' into master-pending

elapsed time: 724m

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
mips                             allyesconfig
arm                   milbeaut_m10v_defconfig
arm                        vexpress_defconfig
sh                           sh2007_defconfig
powerpc                     kmeter1_defconfig
arm                          collie_defconfig
nios2                               defconfig
mips                           ip27_defconfig
powerpc                       ebony_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      chrp32_defconfig
arm                           sama5_defconfig
xtensa                         virt_defconfig
mips                     cu1000-neo_defconfig
arm                            pleb_defconfig
sh                        apsh4ad0a_defconfig
mips                           ci20_defconfig
mips                        nlm_xlp_defconfig
xtensa                generic_kc705_defconfig
arm                           omap1_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     tqm8560_defconfig
powerpc                     tqm5200_defconfig
mips                     loongson1c_defconfig
ia64                        generic_defconfig
m68k                       m5275evb_defconfig
sh                             shx3_defconfig
arm64                            alldefconfig
mips                    maltaup_xpa_defconfig
arm                            hisi_defconfig
sh                           se7619_defconfig
powerpc                   bluestone_defconfig
sh                               alldefconfig
mips                      malta_kvm_defconfig
powerpc                     taishan_defconfig
mips                      pistachio_defconfig
sh                            migor_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8541_defconfig
powerpc                     redwood_defconfig
sh                            titan_defconfig
sh                          lboxre2_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                          r7780mp_defconfig
powerpc                     ep8248e_defconfig
arm                       imx_v6_v7_defconfig
arm                        mvebu_v5_defconfig
arm                         assabet_defconfig
c6x                              alldefconfig
m68k                          hp300_defconfig
mips                     cu1830-neo_defconfig
powerpc                      arches_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
powerpc                   lite5200b_defconfig
powerpc                     pseries_defconfig
mips                           rs90_defconfig
mips                         mpc30x_defconfig
openrisc                    or1ksim_defconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210223
i386                 randconfig-a006-20210223
i386                 randconfig-a004-20210223
i386                 randconfig-a003-20210223
i386                 randconfig-a001-20210223
i386                 randconfig-a002-20210223
x86_64               randconfig-a015-20210223
x86_64               randconfig-a011-20210223
x86_64               randconfig-a012-20210223
x86_64               randconfig-a016-20210223
x86_64               randconfig-a014-20210223
x86_64               randconfig-a013-20210223
i386                 randconfig-a013-20210223
i386                 randconfig-a012-20210223
i386                 randconfig-a011-20210223
i386                 randconfig-a014-20210223
i386                 randconfig-a016-20210223
i386                 randconfig-a015-20210223
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a001-20210223
x86_64               randconfig-a002-20210223
x86_64               randconfig-a003-20210223
x86_64               randconfig-a005-20210223
x86_64               randconfig-a006-20210223
x86_64               randconfig-a004-20210223

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
