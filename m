Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C37C433EF
	for <ath10k@archiver.kernel.org>; Tue, 15 Feb 2022 07:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pu4R4iqE0Pq6zD/UsuoQrzGDHif6aJvG/JECUwm5bsw=; b=JWclfrYAN5uIvf
	+78uMVuKf7/kwkhiymI4Bnli5L96NvV0X9/fLrtWtD4Cw5p4/m4VJgxnF6FIIVosG26nwER/1snJU
	btlkvkVomrLXwekXgDlSs0Or1qWsv0IjoCvqL+SM1Yp4/AAZuXgywfccyNyXk16tdzV28x2j6MSbt
	zTpmIoD75EdTkTDLC+k+jJrPeh0D2+Q4Fu4ssf+sZBidxKhmRjviqJ6r1oGBtWgRyWEl0G0M2TtET
	46Cyg5jEjluYVPkZatLAqNYI2p+5yYwr88HfIHCN/U8KqlJjR1cj/LCu6aDU72+LBsDXMybaaXRwB
	4ufqe+aHv66VpKxsLJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJsDf-001AsB-Gy; Tue, 15 Feb 2022 07:25:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJsDd-001Apz-RM
 for ath10k@bombadil.infradead.org; Tue, 15 Feb 2022 07:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Y69CToTjVD/UB9N2wZNN4ZQqRtQtk6YA53Zqj9Abjjo=; b=Wu79frTS5tjj268wz8gbInqEsX
 1kUn1c50A27iH/3Tsg2RGB3MBoMzbU5dfLOOiE4zNRWGXOgpCawWPDbdstaQINiESW5jg+mrTWzQp
 CsBYl4jMwZwEF3R1wpqvQxYt79MWcDGKjxZFFCk9SgMl8Lg+X5Z5YxY0ubt3/g2sz8tvpvUeZh3gi
 Z4rmzv97culbrEsgVIF91WdKuFoUpqzR9E6KAf8L12aVfiWhgzeayI/0XhDfihN7o6GsKM+ZC7YdL
 kakFBXzddAF6/9EhSgQbd+1fOdrzb5wGinKGhe2GqpRM9iHpmNVtsP09uiNZO0JhYn3u9+s81sWr6
 8EhJ8WPg==;
Received: from mga12.intel.com ([192.55.52.136])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJsDZ-00A56U-Ng
 for ath10k@lists.infradead.org; Tue, 15 Feb 2022 07:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644909945; x=1676445945;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=03obatjgk5fyNw3FH/KzYQqxcxiQ86M/vfy4a1Wmh7w=;
 b=GsfzZsi9qCVElFV8fKeULfRVyhXV/ZpFQArWasZXfWxaPDE+zMUfegE/
 WXzpblOnoIzmc0z4sQww/CvtxxSw2L1XeHGb7GhAr7cnEn2EH9tuEfDOX
 uDegjwO+mxooEs4daAj1+Es++9t0AqAuTJwa1rreDdBzbLnZPHUs7BoEp
 bsdKWUZZ+ZDVkfmYnyA/6dSkjmVxWK7xmGTn7FaPnb507Uj9OeM6LjsXg
 uyW3e2Qxs8VBEneDJgE7yeUjO3fj1SgAT/EPy1nN/79kXvcendbm91KsH
 4P1v5Rg696q59HmHLYJZQvM80GUp8hYPJ93rtrKPnf2lws1+jDzcOLy06 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="230231995"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="230231995"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 23:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="703483558"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 14 Feb 2022 23:25:39 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nJsDS-0009Nw-BH; Tue, 15 Feb 2022 07:25:38 +0000
Date: Tue, 15 Feb 2022 15:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 5be92eab9f0bcfcef2dff05b56659bf153a25620
Message-ID: <620b555a.E4ruFZY/zZFGSxFg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_072546_163262_C8A3840A 
X-CRM114-Status: UNSURE (   4.37  )
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
branch HEAD: 5be92eab9f0bcfcef2dff05b56659bf153a25620  ath11k: Reset PCIE_GPIO_CFG_REG register when power on

elapsed time: 735m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220214
mips                 randconfig-c004-20220214
nios2                            alldefconfig
sh                          r7780mp_defconfig
sh                            titan_defconfig
ia64                         bigsur_defconfig
powerpc                   motionpro_defconfig
powerpc                     asp8347_defconfig
arm                          lpd270_defconfig
xtensa                         virt_defconfig
arc                     haps_hs_smp_defconfig
xtensa                              defconfig
arm                        oxnas_v6_defconfig
sh                     magicpanelr2_defconfig
mips                          rb532_defconfig
parisc                              defconfig
sh                           se7751_defconfig
powerpc                       maple_defconfig
parisc                           alldefconfig
microblaze                          defconfig
sparc                               defconfig
arm64                            alldefconfig
arm                        mvebu_v7_defconfig
m68k                          hp300_defconfig
arm                     eseries_pxa_defconfig
arm                            pleb_defconfig
sh                           se7721_defconfig
powerpc                           allnoconfig
arm                         lpc18xx_defconfig
powerpc                      bamboo_defconfig
arc                        nsimosci_defconfig
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
x86_64               randconfig-a013-20220214
x86_64               randconfig-a014-20220214
x86_64               randconfig-a012-20220214
x86_64               randconfig-a015-20220214
x86_64               randconfig-a011-20220214
x86_64               randconfig-a016-20220214
i386                 randconfig-a013-20220214
i386                 randconfig-a016-20220214
i386                 randconfig-a012-20220214
i386                 randconfig-a015-20220214
i386                 randconfig-a011-20220214
i386                 randconfig-a014-20220214
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
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220214
i386                 randconfig-c001-20220214
powerpc              randconfig-c003-20220214
arm                  randconfig-c002-20220214
mips                 randconfig-c004-20220214
x86_64               randconfig-c007-20220214
arm                         lpc32xx_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                        workpad_defconfig
arm                         s3c2410_defconfig
powerpc                     ppa8548_defconfig
mips                          ath25_defconfig
powerpc                     mpc5200_defconfig
arm                  colibri_pxa300_defconfig
arm                         bcm2835_defconfig
mips                     cu1830-neo_defconfig
arm                       spear13xx_defconfig
arm                       aspeed_g4_defconfig
arm                          pcm027_defconfig
mips                         tb0287_defconfig
arm                          moxart_defconfig
powerpc                    gamecube_defconfig
mips                     loongson2k_defconfig
arm                       netwinder_defconfig
arm                       versatile_defconfig
powerpc                      ppc44x_defconfig
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
