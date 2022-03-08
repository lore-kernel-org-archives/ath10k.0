Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E53DC433F5
	for <ath10k@archiver.kernel.org>; Tue,  8 Mar 2022 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HjgzAYz8ZPRQMDuEVna9/JEBSte6VojBsUdhmRJNTO0=; b=L0MAfwpIRDz/Hd
	8tOFm/eTkSX3U3D+UODF4+Q7lLMKvBrNg1tlPvXGuf5qJ6OPx/HyODSZjGILhKbVSBPWyP/k0dfK5
	cvHV6UzrUDITWwpoORVt7jqFncLvIqqJQfKPRWgnSJODGqN8+rsZ9ZQi0xVPcYoe+dZ1JLlLiQaV/
	Tsnms1ke4KiZVXDO6NU0zjrsmM+57Y6QlwzTlgZriOt45xsUDgDx8ITj9K2N7vXUK0HpmqQnvC4fT
	raR+oGaWLWGK/9psxOmC1Uy/qQLLfR//zrGCtR3L9OBCi2Z9TaDD1TZ66LKYva1BGCX8Qrw++QlIr
	Qes+meW+9J0LyIdtaN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRatB-004mnI-9Q; Tue, 08 Mar 2022 14:32:37 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRat7-004mly-IA
 for ath10k@lists.infradead.org; Tue, 08 Mar 2022 14:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646749953; x=1678285953;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=1cqa/5QdGguhYZPZXe+PC/UjkOsDzmhs+HNPGrpY9Jo=;
 b=LHCLlIPhPOTRY2P5I135oIcyP6qM3Bh2BY/Z3rDmlmC+bgQMUSBpaUJu
 /nkRvTY4Px5lYMbyKfbQaoh07aiQeH0nml/+jPkXs4a131BHV8da8lC/a
 M59x4jwFhg8QtzgBZeEllmB5pqqAXSdi+szoSJ5e+JcLgKjbojpXUoYEo
 7cYKcWLauqrHpP+vPeI3O2FA7bOCykjUPd5Bw4uZzlUHxZRh96ix+b/At
 jhSUHDebZ5cX95wftx2VbuUQ9sf4UNEnIBdAnGknznZgFK4IWV48NKUdX
 LKZCqHfSAnZYXHf3AW54hlaISu130jKQymxyBqx1cMoWjzGO/yEpacTdB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254885050"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="254885050"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:31:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="595898410"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2022 06:31:26 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRas1-0001XQ-QE; Tue, 08 Mar 2022 14:31:25 +0000
Date: Tue, 08 Mar 2022 22:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 2bed7ea34786f7668c97fbed647e6663bdaf420f
Message-ID: <622768ba.O+y+V4FGNZCE92e5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_063233_670976_08E0A3A3 
X-CRM114-Status: UNSURE (   4.79  )
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
branch HEAD: 2bed7ea34786f7668c97fbed647e6663bdaf420f  Merge branch 'ath-next' into ath-qca

elapsed time: 1049m

configs tested: 152
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220307
alpha                            alldefconfig
arm                      footbridge_defconfig
m68k                           sun3_defconfig
arm                        realview_defconfig
sh                           se7780_defconfig
powerpc                     asp8347_defconfig
sh                          landisk_defconfig
sh                          urquell_defconfig
mips                           ip32_defconfig
mips                       bmips_be_defconfig
m68k                          sun3x_defconfig
arm                          exynos_defconfig
arm                       omap2plus_defconfig
mips                      fuloong2e_defconfig
m68k                          atari_defconfig
mips                    maltaup_xpa_defconfig
openrisc                 simple_smp_defconfig
sh                        edosk7705_defconfig
arm                            qcom_defconfig
powerpc                     mpc83xx_defconfig
arm                         nhk8815_defconfig
arm                            xcep_defconfig
arm                         s3c6400_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       m5249evb_defconfig
arm                            hisi_defconfig
riscv                               defconfig
um                           x86_64_defconfig
arm                  randconfig-c002-20220308
arm                  randconfig-c002-20220307
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a003-20220307
i386                 randconfig-a006-20220307
i386                 randconfig-a002-20220307
i386                 randconfig-a001-20220307
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
riscv                randconfig-r042-20220308
arc                  randconfig-r043-20220307
arc                  randconfig-r043-20220308
s390                 randconfig-r044-20220308
x86_64               randconfig-a003-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a002-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a006-20220307
x86_64               randconfig-a005-20220307
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220308
riscv                randconfig-c006-20220308
s390                 randconfig-c005-20220308
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
powerpc                     kilauea_defconfig
arm                           sama7_defconfig
arm                          ep93xx_defconfig
arm                         s3c2410_defconfig
arm                        spear3xx_defconfig
mips                           mtx1_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                  mpc885_ads_defconfig
mips                     cu1830-neo_defconfig
mips                           ip22_defconfig
mips                        workpad_defconfig
arm                       cns3420vb_defconfig
powerpc                     skiroot_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a013-20220307
i386                 randconfig-a012-20220307
i386                 randconfig-a011-20220307
i386                 randconfig-a014-20220307
i386                 randconfig-a015-20220307
i386                 randconfig-a016-20220307
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220307
riscv                randconfig-r042-20220307
s390                 randconfig-r044-20220307
hexagon              randconfig-r045-20220308
hexagon              randconfig-r041-20220308
hexagon              randconfig-r045-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
