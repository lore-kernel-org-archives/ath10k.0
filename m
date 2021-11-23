Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1AFC433F5
	for <ath10k@archiver.kernel.org>; Tue, 23 Nov 2021 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WMx8ozz8YSF8dXVCl9H1MgVp0lEwPsCJuklwQTtHMd0=; b=vdZrbc257lo1By
	e0emo6jIZh+kZ+qOL4sB5FwrOPIkiprr1zfkEXdaOl0WVC8NeBp9PgsR9dpTXenmKNEpficPQ8+QW
	GfGhT7kF/DxhXQuU6agKiJR5BqvhTtEaeYNN7rMm5TkVdRHAdxsPNFrTC21F12mp/GAWXtmlN/5F7
	TtBWwqIXu1cNcCXESLhwppup4cXExLJKiwU3cW9HvwA1UwD588NhSS9Vtmbw1E8eUShZHZKCpsWZl
	gTiceDXaWewG7Z5mG056sEc2jw/CGwKe/gSD4FnUSqyQ8/TO9dmsEOW+knEgg5VWu6j2+ip2w38CY
	LiEVR5T05Px/KXGKTSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpVgu-002Ket-7m; Tue, 23 Nov 2021 13:18:32 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpVOe-002Enx-TX
 for ath10k@lists.infradead.org; Tue, 23 Nov 2021 12:59:42 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="234963615"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="234963615"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 04:59:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="497276914"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 23 Nov 2021 04:59:38 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mpVOb-0001qj-Gq; Tue, 23 Nov 2021 12:59:37 +0000
Date: Tue, 23 Nov 2021 20:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 593172ab9902dfa8c849912077f617d3a097c534
Message-ID: <619ce582.JkFgZos4gZzlIK0t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_045941_066466_9A4AFBE5 
X-CRM114-Status: UNSURE (   4.31  )
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
branch HEAD: 593172ab9902dfa8c849912077f617d3a097c534  Merge branch 'pending' into master-pending

elapsed time: 1304m

configs tested: 159
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211122
arm                       omap2plus_defconfig
arm                         axm55xx_defconfig
arc                         haps_hs_defconfig
arm                       aspeed_g5_defconfig
powerpc                    amigaone_defconfig
powerpc64                           defconfig
ia64                        generic_defconfig
arm                        magician_defconfig
sh                         ecovec24_defconfig
nios2                         3c120_defconfig
sh                         microdev_defconfig
mips                       capcella_defconfig
h8300                            alldefconfig
xtensa                    smp_lx200_defconfig
m68k                       m5475evb_defconfig
arc                      axs103_smp_defconfig
arm                      pxa255-idp_defconfig
arm                          collie_defconfig
sh                           se7206_defconfig
powerpc                    mvme5100_defconfig
arm                        oxnas_v6_defconfig
sh                        sh7757lcr_defconfig
s390                             alldefconfig
powerpc                 canyonlands_defconfig
ia64                      gensparse_defconfig
arm                         hackkit_defconfig
openrisc                            defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
sh                           se7343_defconfig
mips                         db1xxx_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                      cm5200_defconfig
arm                           sama7_defconfig
arm                       spear13xx_defconfig
mips                        vocore2_defconfig
arm                    vt8500_v6_v7_defconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                            zeus_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     ep8248e_defconfig
sh                          sdk7786_defconfig
powerpc                      acadia_defconfig
arm                             ezx_defconfig
arm                            hisi_defconfig
m68k                        m5272c3_defconfig
powerpc                     mpc512x_defconfig
sh                           se7722_defconfig
arm                           corgi_defconfig
ia64                         bigsur_defconfig
mips                   sb1250_swarm_defconfig
arm                  randconfig-c002-20211122
arm                  randconfig-c002-20211123
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
i386                                defconfig
i386                              debian-10.3
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211123
x86_64               randconfig-a003-20211123
x86_64               randconfig-a006-20211123
x86_64               randconfig-a004-20211123
x86_64               randconfig-a005-20211123
x86_64               randconfig-a002-20211123
i386                 randconfig-a001-20211123
i386                 randconfig-a002-20211123
i386                 randconfig-a005-20211123
i386                 randconfig-a006-20211123
i386                 randconfig-a004-20211123
i386                 randconfig-a003-20211123
x86_64               randconfig-a014-20211122
x86_64               randconfig-a011-20211122
x86_64               randconfig-a012-20211122
x86_64               randconfig-a016-20211122
x86_64               randconfig-a013-20211122
x86_64               randconfig-a015-20211122
i386                 randconfig-a016-20211122
i386                 randconfig-a015-20211122
i386                 randconfig-a012-20211122
i386                 randconfig-a013-20211122
i386                 randconfig-a014-20211122
i386                 randconfig-a011-20211122
arc                  randconfig-r043-20211122
s390                 randconfig-r044-20211122
riscv                randconfig-r042-20211122
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func

clang tested configs:
x86_64               randconfig-a001-20211122
x86_64               randconfig-a003-20211122
x86_64               randconfig-a006-20211122
x86_64               randconfig-a004-20211122
x86_64               randconfig-a005-20211122
x86_64               randconfig-a002-20211122
i386                 randconfig-a001-20211122
i386                 randconfig-a002-20211122
i386                 randconfig-a005-20211122
i386                 randconfig-a006-20211122
i386                 randconfig-a004-20211122
i386                 randconfig-a003-20211122
i386                 randconfig-a016-20211123
i386                 randconfig-a015-20211123
i386                 randconfig-a012-20211123
i386                 randconfig-a013-20211123
i386                 randconfig-a014-20211123
i386                 randconfig-a011-20211123
hexagon              randconfig-r041-20211122
hexagon              randconfig-r045-20211122
hexagon              randconfig-r045-20211123
s390                 randconfig-r044-20211123
hexagon              randconfig-r041-20211123
riscv                randconfig-r042-20211123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
