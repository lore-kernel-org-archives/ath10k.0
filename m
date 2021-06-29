Return-Path: <SRS0=4IAx=LX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBF0C11F66
	for <ath10k@archiver.kernel.org>; Tue, 29 Jun 2021 06:04:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DA2761D72
	for <ath10k@archiver.kernel.org>; Tue, 29 Jun 2021 06:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DA2761D72
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=utHoIkaqM4GPEhQmi4FExdPdPp+9505d+F5pfd4zjC4=; b=u9BXTTTE9oNJvC
	b7S7GxWaM61Uwa5DzKXiYq9LRWD2xTX9GGysot2HO6okjipXbnvqWt19+60ylQChIlM7vAO7GLB7f
	Jx4WsRssvO0d3SJ/HN5RidudIarG7InxoFldhmz31PYN7SbUxUWXZDdi+Ro5o58EP6oxVzG/6+zSf
	rT4epmVVNobRBW5NqgaPsVJnfwc5BpLegI613J2Mb/Qfcz8guKabNwN5M32m21cHJp85tk6yIwTrV
	FJGMOuvx2/8FukNvm9bYCnYxWPKtfC2vlVuqnUO7+q6J05moEP0OPiRnnjM/LRcE2ztNc4HAM/frv
	g4zWHcxdBxnb+1BD8eYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly6qm-009rTJ-BI; Tue, 29 Jun 2021 06:04:00 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly6qg-009rRs-19
 for ath10k@lists.infradead.org; Tue, 29 Jun 2021 06:03:56 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="271945561"
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="271945561"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 23:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="643598476"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2021 23:03:44 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ly6qW-0008wQ-0w; Tue, 29 Jun 2021 06:03:44 +0000
Date: Tue, 29 Jun 2021 14:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:pending] BUILD SUCCESS
 f2a4cbb7168bedd973eaae0bf72c15309da2b849
Message-ID: <60dab798.exO8ldEti/8h7C2R%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_230354_170944_22C03B90 
X-CRM114-Status: UNSURE (   4.69  )
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
branch HEAD: f2a4cbb7168bedd973eaae0bf72c15309da2b849  ath11k: avoid unnecessary lock contention in tx_completion path

elapsed time: 725m

configs tested: 119
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     mpc5200_defconfig
h8300                       h8s-sim_defconfig
powerpc                      ep88xc_defconfig
mips                            ar7_defconfig
powerpc                       ppc64_defconfig
arc                          axs101_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                    gamecube_defconfig
arm                           sunxi_defconfig
arm                     davinci_all_defconfig
sh                      rts7751r2d1_defconfig
openrisc                  or1klitex_defconfig
alpha                            alldefconfig
arm                         cm_x300_defconfig
powerpc                      obs600_defconfig
powerpc                        fsp2_defconfig
arm                         vf610m4_defconfig
powerpc                     stx_gp3_defconfig
powerpc64                           defconfig
mips                         db1xxx_defconfig
powerpc                      bamboo_defconfig
sh                           se7619_defconfig
sh                         ecovec24_defconfig
mips                           ip28_defconfig
nios2                         3c120_defconfig
arm                          moxart_defconfig
arm                        keystone_defconfig
x86_64                            allnoconfig
h8300                    h8300h-sim_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                      mgcoge_defconfig
sh                            hp6xx_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
powerpc                      ppc64e_defconfig
powerpc                       holly_defconfig
arm                          ep93xx_defconfig
arm                         palmz72_defconfig
arm                         assabet_defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210628
i386                 randconfig-a002-20210628
i386                 randconfig-a003-20210628
i386                 randconfig-a006-20210628
i386                 randconfig-a005-20210628
i386                 randconfig-a004-20210628
x86_64               randconfig-a012-20210628
x86_64               randconfig-a016-20210628
x86_64               randconfig-a015-20210628
x86_64               randconfig-a013-20210628
x86_64               randconfig-a014-20210628
x86_64               randconfig-a011-20210628
i386                 randconfig-a011-20210628
i386                 randconfig-a014-20210628
i386                 randconfig-a013-20210628
i386                 randconfig-a015-20210628
i386                 randconfig-a016-20210628
i386                 randconfig-a012-20210628
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210628
x86_64               randconfig-a002-20210628
x86_64               randconfig-a005-20210628
x86_64               randconfig-a001-20210628
x86_64               randconfig-a003-20210628
x86_64               randconfig-a004-20210628
x86_64               randconfig-a006-20210628

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
