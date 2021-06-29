Return-Path: <SRS0=4IAx=LX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D891C11F66
	for <ath10k@archiver.kernel.org>; Tue, 29 Jun 2021 08:42:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC1E61DC8
	for <ath10k@archiver.kernel.org>; Tue, 29 Jun 2021 08:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC1E61DC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C0okrKoJ5fj1pBgCUJRVe1cKpdo/LT/HtPStcPdPZu4=; b=0O9W7ya6ivUid+
	WxvHB1IMYNM6gCygD2XD3vArsXqADsM5tbBVypLmzgLYgM/pxkAn9ezcznB6RzciVfgV5zEHD7+fO
	bcPMFCBsX3/ckLPwNYumJQn+dQ1F1SNo7i/E2zdjCNntbrs/45BctGjgxAu+SNMYdsJ9pdj9ZKamM
	PDYqL4epo5RzLmFW83JuEndpFM3U2Z4x871FCQU6IC4qmZJYiPqDpJXqG4LjOMEydFtIivd667jMu
	rB45dotQrMQGKPRsK+2NbcbOvNEAaSihU3zUny9j/TC5+Cq3hBAD3HkD3GttgrU5/+3UWJEsitqP+
	VwvY3RBIWFbatwjW1rsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly9Ho-00AFaI-3a; Tue, 29 Jun 2021 08:40:04 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly9Ey-00AEIw-Di
 for ath10k@lists.infradead.org; Tue, 29 Jun 2021 08:37:10 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="195259574"
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="195259574"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 01:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="419486836"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 29 Jun 2021 01:37:04 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ly9Et-00092C-Sl; Tue, 29 Jun 2021 08:37:03 +0000
Date: Tue, 29 Jun 2021 16:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master] BUILD SUCCESS cbd34f596f439546f60d721f9b5b00af83b9751f
Message-ID: <60dadb9b.fuEnVqE8PNh/3u2K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_013708_598922_B16E14D2 
X-CRM114-Status: UNSURE (   6.24  )
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
branch HEAD: cbd34f596f439546f60d721f9b5b00af83b9751f  Revert "bus: mhi: Early MHI resume failure in non M3 state"

elapsed time: 879m

configs tested: 137
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
arm                          gemini_defconfig
sh                           se7343_defconfig
arm                       spear13xx_defconfig
m68k                          multi_defconfig
sh                          rsk7201_defconfig
powerpc                      pasemi_defconfig
sh                          r7780mp_defconfig
m68k                            mac_defconfig
mips                           ci20_defconfig
arm                           sunxi_defconfig
arc                          axs101_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                    gamecube_defconfig
powerpc                     tqm5200_defconfig
powerpc                       ebony_defconfig
arm                       cns3420vb_defconfig
arm                           omap1_defconfig
powerpc64                        alldefconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      bamboo_defconfig
x86_64                           alldefconfig
arc                     nsimosci_hs_defconfig
arm                         nhk8815_defconfig
arm                     davinci_all_defconfig
sh                      rts7751r2d1_defconfig
openrisc                  or1klitex_defconfig
alpha                            alldefconfig
powerpc64                           defconfig
mips                         db1xxx_defconfig
sh                           se7619_defconfig
sh                         ecovec24_defconfig
mips                           ip28_defconfig
nios2                         3c120_defconfig
arm                          moxart_defconfig
arm                        keystone_defconfig
x86_64                            allnoconfig
h8300                    h8300h-sim_defconfig
sh                           se7750_defconfig
um                           x86_64_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     sequoia_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
sh                         microdev_defconfig
powerpc                      ppc6xx_defconfig
mips                         mpc30x_defconfig
m68k                        mvme147_defconfig
mips                      loongson3_defconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
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
