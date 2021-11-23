Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCACBC433F5
	for <ath10k@archiver.kernel.org>; Tue, 23 Nov 2021 03:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ZtVhXS1TAAIBHwzzYUZ0frvDx1nF5oy1ELWrrCYIAU=; b=2gKlf/QDoLCq3t
	oUABA5ufL9rjr1Hjo6jQo6d5QIQ3rgIMoTFES32AsxF9FVFeEY2cWtgfrymYmapRpXVirlp3KyRkN
	gnqSvI8+9whP5VKRtMUeqH9lKt05FACNg4EOz0+XGnUFAeUS1BaJSuudHbxj/b3HFcLTaKOl2xtWq
	BrG+ALD5w15MaxrFsnefdDSgoAjSVZ1qmsdtNZQXKpP3L1NlX+ief95D5dn6NwXxoKFLZ+1ENQE2O
	3p85mD8EEj+2f26yyDYa20aKJZqT7iUfDXQYQArIjxaiD4kjf7btkCAeWiUrMgB1r+pwDimSBAMlx
	ZREScpxwD3DvGOUwJa7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMID-000hxN-CQ; Tue, 23 Nov 2021 03:16:25 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMI6-000huv-Ut
 for ath10k@lists.infradead.org; Tue, 23 Nov 2021 03:16:21 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="222161906"
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="222161906"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 19:16:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="508813474"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 22 Nov 2021 19:16:16 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mpMI3-00015J-Sm; Tue, 23 Nov 2021 03:16:15 +0000
Date: Tue, 23 Nov 2021 11:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 09f16f7390f302937409738d6cb6ce99b265f455
Message-ID: <619c5ce3.qzjL0wSTM/u0bedU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_191619_092161_31E1B8D2 
X-CRM114-Status: UNSURE (   6.06  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 09f16f7390f302937409738d6cb6ce99b265f455  ath11k: Fix mon status ring rx tlv processing

elapsed time: 723m

configs tested: 141
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
mips                 randconfig-c004-20211122
nios2                         3c120_defconfig
sh                         microdev_defconfig
xtensa                    smp_lx200_defconfig
mips                       capcella_defconfig
h8300                            alldefconfig
m68k                            q40_defconfig
sh                          sdk7780_defconfig
m68k                          amiga_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                       common_defconfig
mips                          ath79_defconfig
sh                           se7206_defconfig
powerpc                    mvme5100_defconfig
arm                        oxnas_v6_defconfig
sh                        sh7757lcr_defconfig
s390                             alldefconfig
powerpc                 canyonlands_defconfig
ia64                      gensparse_defconfig
sh                         ecovec24_defconfig
arm                         hackkit_defconfig
openrisc                            defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
sh                           se7343_defconfig
arm                    vt8500_v6_v7_defconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                             allyesconfig
arm                           stm32_defconfig
h8300                    h8300h-sim_defconfig
arm                            dove_defconfig
xtensa                generic_kc705_defconfig
openrisc                  or1klitex_defconfig
m68k                       m5208evb_defconfig
arm                          pcm027_defconfig
arm                      footbridge_defconfig
arm                         at91_dt_defconfig
mips                      pic32mzda_defconfig
mips                           jazz_defconfig
sparc                       sparc64_defconfig
arc                              alldefconfig
sparc64                             defconfig
powerpc                      ppc6xx_defconfig
mips                        bcm63xx_defconfig
m68k                             alldefconfig
powerpc                 mpc8560_ads_defconfig
arm                        trizeps4_defconfig
powerpc                   bluestone_defconfig
m68k                        m5407c3_defconfig
mips                     loongson1c_defconfig
mips                        qi_lb60_defconfig
arm                           corgi_defconfig
m68k                       m5475evb_defconfig
ia64                         bigsur_defconfig
mips                   sb1250_swarm_defconfig
arm                  randconfig-c002-20211122
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
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
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
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20211122
i386                 randconfig-c001-20211122
powerpc              randconfig-c003-20211122
riscv                randconfig-c006-20211122
arm                  randconfig-c002-20211122
x86_64               randconfig-c007-20211122
mips                 randconfig-c004-20211122
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
