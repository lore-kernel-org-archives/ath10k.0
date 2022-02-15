Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAC2C433EF
	for <ath10k@archiver.kernel.org>; Tue, 15 Feb 2022 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QbQFuUoQexkzJn4VrDEo1Ikoh79tWc9JrvUkUN//yUg=; b=1rZqga+hzWm1QM
	wCMOxXyeqdgn4j/s9I5sEOzyl/iLl0LFd4AqC7/atoMydYn8wSxI3XW7zDzmKmU8vIYtwCBPS/aP+
	CtNqabcpoANpRj8IIpa8wHl2VX6N68/e64slWlRAy14Cuy8LGwz0m136tbmHuQPEGmc0gdXF0+lyD
	v31I4F87zqOhJasjVYWnJEMsgpC3MJPbZ+ItZip84XwgsbWq3vXvJpKW/Gkih8s7i7uoZzxSjPMxc
	3OxBesTMkq/XGN41ELJI1t2MFQ2/oo5eNefvOnqXwHlBHjNLYA0UtWxLFd1m4sxXriUCDgvDb3JHc
	ZwnjWEURPVeG3V2Za9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJsDZ-001Amx-EJ; Tue, 15 Feb 2022 07:25:45 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJsDU-001AjM-SH
 for ath10k@lists.infradead.org; Tue, 15 Feb 2022 07:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644909940; x=1676445940;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=hfWie0Efg4nzJ6izLJrUQWJF180Gf9pKRNxWQPcB3Vk=;
 b=MUiL4sdsJ/fGXG+aGKxZv1z38W90mbvB2lhvlC6tu94dN/GEmwEdZlls
 6hj4BZX/+AkSJDMVULbYuYkryWb3cPSH28F7nIu71jA4jznAMMzuWGaxh
 aNKGAXm4TH1ifiYysiw+hcsfA5LYu3auM2GHwc394rkWVEA8s97ylxUV2
 kbT6TjiU5glOi+phRt9SCti70GsYtf2uThyEF5rabNwil10diZThhCFKa
 4gWiTN90cUte9w7oUReHuLnJK0jyDRR4UlvplIRWxIcPUXOBQC7w8kkmY
 lB3UGgKzPsaxxJ9dtOL3d8519f/BbK8Fq1FL4VBd/8Ja6KmLG2pF67HKR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="233815649"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="233815649"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 23:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="680881273"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2022 23:25:39 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nJsDS-0009Nz-CP; Tue, 15 Feb 2022 07:25:38 +0000
Date: Tue, 15 Feb 2022 15:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 67364332a43309e572ce67578d320ed5c7519adc
Message-ID: <620b553f.FZ7qdocM3z3985wQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_232541_009577_6CA7283D 
X-CRM114-Status: UNSURE (   7.10  )
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
branch HEAD: 67364332a43309e572ce67578d320ed5c7519adc  Add localversion-wireless-testing-ath

elapsed time: 736m

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
