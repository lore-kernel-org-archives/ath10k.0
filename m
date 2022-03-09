Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B4DC433EF
	for <ath10k@archiver.kernel.org>; Wed,  9 Mar 2022 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dj7qCrJRSloUkIhUJcsleFwIYHWprwo0nrYth97dpQM=; b=WKwIB0200qHwMV
	vgwBb2/9i284wnaHobwkDbSAitscrk36/j+aKP1wSbk08vgbP1hBZfkbTvj05x47L2Ginu2pHDZHu
	byAdbIb0Vlnaa7G56hfjQoDutvApGw9aqsyHLM2bJ2Ybx1vuntIfsw516J91KSnTiWZd72vQlzvcI
	ZYT4gJtOskauEclEHQrZKQkoG4op+WS6lsWWT0RVHqPEnrBxJ79xU6g4AHMuU2FhIvcIFMKBtd5xc
	EAM7Q+jboTuP7fkB5MXrJyXjeSECdAgdPYWrYR5GoTNueQGXXKkHVcgXeZNGd2mIoAFLpENaYL4vH
	Mkxe2dhJRMuVpCVtkjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRqlo-007c05-DD; Wed, 09 Mar 2022 07:30:04 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRqll-007bzS-0n
 for ath10k@lists.infradead.org; Wed, 09 Mar 2022 07:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646811000; x=1678347000;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=+s6c/hXSmtg3NjDgYz+Kzo3WMeKrgrJZI/qoulYDTWo=;
 b=lGQnK53eil2IojNYeQM4OBMPk2aengvItD1rqarDajuySJvSyxrmD//8
 qXuqC8fDOlx8opx8CxzZ3QA3tLuZFqupn822cztU4SO7O1h8SQGcklvII
 j6wJCWViNpZJ1fymHiZ+gVtcxQ4AMZBxvgGluzZ0OxiPFWsZaRo29xs23
 vM6laT7jzhopWwUfo/PT3ciOYF2lVlh4K31rVadu+tatoEK2UH0OChTc+
 ZIUBMfPaDLKrqg+unjHi0zxjwK1CTfIr5W04H23J0E+w9EoyCgDou4+ai
 y/dp8vuKkzEEuDY0Rp8kpIvejq2Zv4fosYWiXj2px23AwzFrFaRkETVxO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="341339512"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="341339512"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 23:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="643949030"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 08 Mar 2022 23:29:57 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRqlh-0002qJ-1J; Wed, 09 Mar 2022 07:29:57 +0000
Date: Wed, 09 Mar 2022 15:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 1ec7ed5163c70a0d040150d2279f932c7e7c143f
Message-ID: <62285765.tq+SYY8mPwyGHSvf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_233001_121795_6AC15444 
X-CRM114-Status: UNSURE (   4.72  )
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
branch HEAD: 1ec7ed5163c70a0d040150d2279f932c7e7c143f  Revert "ath: add support for special 0x0 regulatory domain"

elapsed time: 2070m

configs tested: 177
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220307
alpha                            alldefconfig
arm                      footbridge_defconfig
m68k                           sun3_defconfig
powerpc                    klondike_defconfig
sh                   secureedge5410_defconfig
openrisc                 simple_smp_defconfig
m68k                          multi_defconfig
sh                          rsk7269_defconfig
mips                             allyesconfig
powerpc                       ppc64_defconfig
sh                              ul2_defconfig
m68k                          sun3x_defconfig
csky                                defconfig
mips                       bmips_be_defconfig
arc                          axs101_defconfig
mips                        bcm47xx_defconfig
m68k                        stmark2_defconfig
sh                        edosk7705_defconfig
nios2                         3c120_defconfig
sh                          r7785rp_defconfig
parisc                generic-64bit_defconfig
powerpc                     rainier_defconfig
powerpc                      ppc40x_defconfig
arm                        shmobile_defconfig
sh                     magicpanelr2_defconfig
arm                          pxa3xx_defconfig
arm                           sama5_defconfig
arc                            hsdk_defconfig
sh                ecovec24-romimage_defconfig
ia64                             allmodconfig
powerpc                     asp8347_defconfig
ia64                          tiger_defconfig
xtensa                       common_defconfig
mips                            gpr_defconfig
sh                           se7619_defconfig
sh                          kfr2r09_defconfig
sh                               alldefconfig
powerpc                 mpc834x_itx_defconfig
arm                            hisi_defconfig
m68k                       m5249evb_defconfig
riscv                               defconfig
um                           x86_64_defconfig
sh                           se7206_defconfig
xtensa                          iss_defconfig
powerpc                     sequoia_defconfig
arm                        mvebu_v7_defconfig
arm                             ezx_defconfig
parisc64                            defconfig
parisc                           allyesconfig
sh                           se7751_defconfig
sparc                            allyesconfig
mips                      maltasmvp_defconfig
arm                           h3600_defconfig
x86_64                           alldefconfig
arm                           viper_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                  randconfig-c002-20220308
arm                  randconfig-c002-20220307
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
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a002-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a006-20220307
x86_64               randconfig-a005-20220307
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a005-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a003-20220307
i386                 randconfig-a006-20220307
i386                 randconfig-a002-20220307
i386                 randconfig-a001-20220307
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220308
riscv                randconfig-r042-20220308
s390                 randconfig-r044-20220308
arc                  randconfig-r043-20220307
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
riscv                randconfig-c006-20220308
powerpc              randconfig-c003-20220308
i386                          randconfig-c001
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
s390                 randconfig-c005-20220308
powerpc                    ge_imp3a_defconfig
mips                         tb0219_defconfig
arm                           spitz_defconfig
mips                           mtx1_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                       ebony_defconfig
x86_64                           allyesconfig
powerpc                 xes_mpc85xx_defconfig
arm                       cns3420vb_defconfig
arm                          imote2_defconfig
powerpc                     kilauea_defconfig
arm                        spear3xx_defconfig
arm                  colibri_pxa300_defconfig
powerpc                 mpc8272_ads_defconfig
mips                          ath25_defconfig
mips                            e55_defconfig
hexagon                             defconfig
powerpc                     skiroot_defconfig
mips                        workpad_defconfig
powerpc                      walnut_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a013-20220307
i386                 randconfig-a014-20220307
i386                 randconfig-a012-20220307
i386                 randconfig-a011-20220307
i386                 randconfig-a015-20220307
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220308
hexagon              randconfig-r041-20220308
hexagon              randconfig-r041-20220307
riscv                randconfig-r042-20220307
s390                 randconfig-r044-20220307
hexagon              randconfig-r045-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
