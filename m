Return-Path: <SRS0=Pgi6=JT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFC1C433B4
	for <ath10k@archiver.kernel.org>; Thu, 22 Apr 2021 08:07:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 341446144A
	for <ath10k@archiver.kernel.org>; Thu, 22 Apr 2021 08:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 341446144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4gxU+AsFBdr5uPHgXk4Mc2DJ9riaDnXNJrPItYrOnoo=; b=RNeDa1wQRKuEoWbCsem1KYWAS1
	g0l64gMZi2T6pXGhsMgO498B87BtO+sa2E9a26WJtI4zqR2IzCFZhu7QswAxwM9QWBxUCOKXJsRSc
	GRN8pYPtyESytxAhOhdjMcN/vHZndPCnhdIS/zubhmdzdg2s023YA4DMmN+wS0vQRgMgfd1SjcRqK
	6Vu2W6MY6icrAbXj5mBNOANjGBTA3uuoF2wSTEidBwuY3ozfa270cRq3utuosIsjdEfVW38P7CpPK
	2sfBAXdoQdXTQeY3s9KChljAGafKFDD+6QDVgwCByhhCvw00M69VI/9Lnpy4lejLYFoCnOxkLYhiy
	wOQozbog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZUMH-00GCcc-Ay; Thu, 22 Apr 2021 08:06:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUM7-00GCbg-In
 for ath10k@desiato.infradead.org; Thu, 22 Apr 2021 08:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=dfFoZKZ7oubQx3/2S8HMKfTiHuyHvdUSFOwqKUuKRwY=; b=hvJpFRdfNi4q0Hglkzp87q5QsU
 dmLJ/SVoIHr/sMTLAKyBES+sq3dilLyV4q9K5T/G6ZGp2XFWzYzmNkP4y2XQYERi78xqH6SnPq93t
 P0TMX6IBA2Vk7xeZhqwJtw8xp48JgSsp0vVa69+vtA5HzhKKarbm4mAqlAvXKtZ4siEQ0xDbmA/JW
 vPniy3ttoXyh++KoKkCX2xOUHUqnPyoH7NLVWqJYNmCM66suMZcVXSAsk2mmAeaWv1ifGmBXuArfm
 25Trn5FdCRc6bePM/0q0M8hDkWcYrpB4a/t5c/pC+8ZqtgCJf3+ofpVePNULpS/bY5UKXOwKEZb4O
 xq6bjipw==;
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUM4-00DTa5-Cl
 for ath10k@lists.infradead.org; Thu, 22 Apr 2021 08:06:34 +0000
IronPort-SDR: LjvNfZz0la7oX0RxoRQ4KEGoCPQ2CAx4kz4qF49DOO/DeWPsyLY8SkbhLD7eaWg48j8+GngZLH
 OD/eJbdM8SjA==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="183331952"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="183331952"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 01:06:31 -0700
IronPort-SDR: R+z9GIUFmGg+MOpMtheiNBNLuQOYRpMGC1fBz2pAUu7JTHuT2zidsstC6owueisyNIzAHSSXOg
 EsvemdVOAv7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="401754600"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 22 Apr 2021 01:06:28 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lZUM0-00043N-8W; Thu, 22 Apr 2021 08:06:28 +0000
Date: Thu, 22 Apr 2021 16:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master-pending] BUILD SUCCESS
 a891e236e8483da63fd707402fbd0f58921a46ce
Message-ID: <60812e7b.UW+A6xouSgAs8Fcz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_010632_512319_939C6D9B 
X-CRM114-Status: UNSURE (   6.65  )
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
branch HEAD: a891e236e8483da63fd707402fbd0f58921a46ce  Merge branch 'pending' into master-pending

elapsed time: 726m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
sh                             shx3_defconfig
um                                  defconfig
powerpc                      ppc44x_defconfig
powerpc                      pcm030_defconfig
arm                         s3c6400_defconfig
xtensa                          iss_defconfig
mips                      loongson3_defconfig
powerpc                  iss476-smp_defconfig
arm                              alldefconfig
arm                       omap2plus_defconfig
arm                      tct_hammer_defconfig
mips                           rs90_defconfig
arm                      integrator_defconfig
arm                      footbridge_defconfig
alpha                               defconfig
h8300                    h8300h-sim_defconfig
xtensa                              defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                      mgcoge_defconfig
powerpc                         wii_defconfig
arm                  colibri_pxa270_defconfig
openrisc                    or1ksim_defconfig
powerpc                     asp8347_defconfig
ia64                          tiger_defconfig
mips                        nlm_xlr_defconfig
mips                  decstation_64_defconfig
m68k                          hp300_defconfig
sparc                               defconfig
mips                           xway_defconfig
powerpc                  storcenter_defconfig
mips                           ci20_defconfig
arm                         lpc18xx_defconfig
mips                      bmips_stb_defconfig
arm                        mvebu_v7_defconfig
xtensa                  nommu_kc705_defconfig
arm                         lpc32xx_defconfig
arm                           h5000_defconfig
powerpc                     tqm8548_defconfig
sh                     magicpanelr2_defconfig
arm                         cm_x300_defconfig
arc                        vdk_hs38_defconfig
arc                        nsim_700_defconfig
mips                        maltaup_defconfig
mips                        bcm47xx_defconfig
powerpc                 canyonlands_defconfig
i386                             alldefconfig
powerpc                 xes_mpc85xx_defconfig
arc                      axs103_smp_defconfig
m68k                         apollo_defconfig
sh                           sh2007_defconfig
sh                           se7722_defconfig
openrisc                         alldefconfig
powerpc                      acadia_defconfig
mips                            e55_defconfig
sh                            migor_defconfig
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
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
