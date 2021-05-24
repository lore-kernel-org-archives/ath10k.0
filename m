Return-Path: <SRS0=/di5=KU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFBFC2B9F8
	for <ath10k@archiver.kernel.org>; Tue, 25 May 2021 00:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB936135F
	for <ath10k@archiver.kernel.org>; Tue, 25 May 2021 00:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAB936135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZPGMZUjEjFWdCSPMPsU3Vf8Ir01FmgfU3lyWGJ1pKyc=; b=vOr1eiya7/Ptg+
	l0VPuZdn8aRfHKYixY5GIz3m+nKjPLo3koMWdOxIWN/yZMSSQqIDdCjAd5x8iG96IfV89nQ54P3lI
	SKLpz+zuezbc+VQvf+iiDdlKqXXwLXKYvlu6hlWcsryWb1UiT0+TJOzTyFAUXWAxOhkT1VZ4AByi3
	6QxbHWE7iB1NThpkcyRbhlj3jve3sga8ay/MvE5ByAj2dL9baFDljzXwIFFm6UIUuAku0xUQPRMUC
	UEhqMzJ6VhRAtMLcr8RaltaEejeVJle/aAC3rbCXTPoxrtDSC94kcbH4TjCKFNN2goLGXYfHb8KQ9
	QK1UtXZGQoROBDl3Iaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llLMJ-002exa-3T; Tue, 25 May 2021 00:55:47 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llFkj-001Z7K-R2
 for ath10k@lists.infradead.org; Mon, 24 May 2021 18:56:39 +0000
IronPort-SDR: r+75cpJOBY9R3fPhZ+HxYSF5EcHk+lSAFcUAzG/loGdoRZhIDZpkxhO3FtE6hB5xFtPcyTUfWg
 Bxa7phqoM1IQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="189387745"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="189387745"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:56:29 -0700
IronPort-SDR: qg+5xaDoGv4XhBW3KpeOXHxje+pIeojWgZ0kK9R4FIV22smdpkvB6WdslUis1gaK66XbzY/0xR
 5lh1Z5svPgAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="632734638"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 24 May 2021 11:56:28 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1llFka-0001K4-0C; Mon, 24 May 2021 18:56:28 +0000
Date: Tue, 25 May 2021 02:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 2896a2f1caa6892e4136ddb7523961429cf11442
Message-ID: <60abf6a9.0kBCcbzOgrzntdvM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_115637_985423_87811C51 
X-CRM114-Status: UNSURE (   5.29  )
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
branch HEAD: 2896a2f1caa6892e4136ddb7523961429cf11442  Merge branch 'ath-next' into ath-qca

elapsed time: 729m

configs tested: 162
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
arm                       mainstone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      mgcoge_defconfig
arm                          imote2_defconfig
powerpc                      pcm030_defconfig
mips                           ip27_defconfig
mips                           mtx1_defconfig
arm                             mxs_defconfig
mips                        bcm47xx_defconfig
sh                          rsk7264_defconfig
m68k                          amiga_defconfig
arm                          ep93xx_defconfig
powerpc                     stx_gp3_defconfig
sh                        sh7757lcr_defconfig
arm                         axm55xx_defconfig
arm                          pcm027_defconfig
powerpc                   currituck_defconfig
xtensa                              defconfig
arm                       aspeed_g4_defconfig
arc                          axs101_defconfig
powerpc                      bamboo_defconfig
m68k                        m5407c3_defconfig
mips                      pic32mzda_defconfig
powerpc                     mpc83xx_defconfig
ia64                             alldefconfig
sh                           se7724_defconfig
sparc                            allyesconfig
mips                     cu1000-neo_defconfig
sh                         microdev_defconfig
arm                       spear13xx_defconfig
riscv                          rv32_defconfig
powerpc                       maple_defconfig
arm                            qcom_defconfig
sh                   sh7724_generic_defconfig
arm                      integrator_defconfig
arm                        oxnas_v6_defconfig
riscv                    nommu_k210_defconfig
sh                           se7722_defconfig
arm                          badge4_defconfig
s390                                defconfig
nds32                               defconfig
arm                       imx_v4_v5_defconfig
sh                          rsk7203_defconfig
arm64                            alldefconfig
mips                           xway_defconfig
mips                     loongson1c_defconfig
arm                           h3600_defconfig
mips                        omega2p_defconfig
sh                        sh7785lcr_defconfig
parisc                generic-32bit_defconfig
powerpc                       eiger_defconfig
parisc                           allyesconfig
sh                          rsk7201_defconfig
powerpc                     powernv_defconfig
powerpc                 linkstation_defconfig
mips                      bmips_stb_defconfig
sh                            titan_defconfig
m68k                         amcore_defconfig
mips                        workpad_defconfig
mips                     loongson2k_defconfig
mips                           jazz_defconfig
riscv                            alldefconfig
powerpc                     akebono_defconfig
parisc                           alldefconfig
arm                            lart_defconfig
openrisc                  or1klitex_defconfig
m68k                       m5249evb_defconfig
arm                         lpc18xx_defconfig
powerpc                     tqm5200_defconfig
arm                       cns3420vb_defconfig
sparc                            alldefconfig
powerpc                     pseries_defconfig
arm                         palmz72_defconfig
mips                           gcw0_defconfig
sh                          rsk7269_defconfig
m68k                        m5307c3_defconfig
sh                          r7780mp_defconfig
m68k                            mac_defconfig
m68k                            q40_defconfig
sh                          r7785rp_defconfig
powerpc                      ppc64e_defconfig
um                            kunit_defconfig
i386                             allyesconfig
nds32                            alldefconfig
powerpc                        fsp2_defconfig
arm                       netwinder_defconfig
mips                         tb0226_defconfig
powerpc                        cell_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210524
x86_64               randconfig-a001-20210524
x86_64               randconfig-a003-20210524
x86_64               randconfig-a004-20210524
x86_64               randconfig-a002-20210524
x86_64               randconfig-a006-20210524
i386                 randconfig-a001-20210524
i386                 randconfig-a002-20210524
i386                 randconfig-a005-20210524
i386                 randconfig-a006-20210524
i386                 randconfig-a004-20210524
i386                 randconfig-a003-20210524
i386                 randconfig-a011-20210524
i386                 randconfig-a016-20210524
i386                 randconfig-a015-20210524
i386                 randconfig-a012-20210524
i386                 randconfig-a014-20210524
i386                 randconfig-a013-20210524
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-b001-20210524
x86_64               randconfig-a013-20210524
x86_64               randconfig-a012-20210524
x86_64               randconfig-a014-20210524
x86_64               randconfig-a016-20210524
x86_64               randconfig-a015-20210524
x86_64               randconfig-a011-20210524

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
