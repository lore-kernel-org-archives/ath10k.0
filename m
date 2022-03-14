Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DE6C433F5
	for <ath10k@archiver.kernel.org>; Mon, 14 Mar 2022 18:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ue8c97efcKofK0jHEH1D2veyh3HuZbxduvjlDEVfVo8=; b=KD8D8Z6qwvds7q
	3SRLBKSqYkcVUJWgqy3fgcBzxYG89h3dG3H58HpHow8toLd50/rkKT+rtsC164kqe9HmpZ7IZiMWz
	6twC0LiUg3FgvYky7o5xmZ3X1VAiJ2xklrwl9UroW3pXwKCJvEszdG+tCIHnUqmVbFFuTgShlcnk4
	UNGoEILRCZpzAjc7tiVxySzepDH+w9fGca57ZQ1GnHtMqw+t2/x3GB/+6hmo+21Mv1/qaVVkF5Kko
	MxnO/tfnnWcTQOR5g7QHJI8+s5bJd+iT/cmeshMmOTNkXUsPm9jn+PKOxm5tLbzEQAD5QYF2/+vve
	cJNFG0f02uen3vPCTofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTp7h-006Sxf-DH; Mon, 14 Mar 2022 18:08:49 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTp7e-006Swt-Kt
 for ath10k@lists.infradead.org; Mon, 14 Mar 2022 18:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647281326; x=1678817326;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=UCICxafCzDWJGKX2LO2V3OR0wPBQBXH4XDYC4EqSBv4=;
 b=D6NW8G0yMV3FMg2s/dQhAUckxx6NrltLS0qpJVHpRpR3mpS/inNQXvqj
 OVJzh3xxII2W91RFD32L6mLwvmshDnqcdrt28jIVnpoBT0rPJglfyH4ct
 sooQ1iGL63C+CRGygsIB1DTKa9LLC3uketlr2CtPBlwoZ39hU6C1bqrvp
 Fdspp1P5l8jEtvreYOl51ivxg49VDpg0OniwCIV70aMZhP6snQuIfNDkF
 UYYArAkODOMdbdYjE0ClQhL02IFMNM/Vm+3m1gCax/aNP3m9mTIsPTxcx
 l4aAJEcbMUD629Vuv9iKwozdvBPjkJHLvQrL2HX65GnOcrf0XHoNRcLAJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="236711149"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="236711149"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 11:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="556540196"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 14 Mar 2022 11:08:12 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nTp76-000A70-3W; Mon, 14 Mar 2022 18:08:12 +0000
Date: Tue, 15 Mar 2022 02:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 451837c0788abda8deb4df8850b510f414b7fc33
Message-ID: <622f8457.Wk9w18c2180fMBWQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_110846_770901_E9F642D8 
X-CRM114-Status: UNSURE (   4.50  )
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
branch HEAD: 451837c0788abda8deb4df8850b510f414b7fc33  ath11k: support GTK rekey offload

Warning reports:

https://lore.kernel.org/lkml/202203141819.R8xopRXM-lkp@intel.com

Unverified Warning (likely false positive, please contact us if interested):

drivers/net/wireless/ath/ath11k/hal_rx.c:1246:3: warning: Value stored to 'he_stbc' is never read [clang-analyzer-deadcode.DeadStores]
drivers/net/wireless/ath/ath11k/hal_rx.c:1415:3: warning: Value stored to 'he_dcm' is never read [clang-analyzer-deadcode.DeadStores]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- riscv-randconfig-m031-20220313
    `-- drivers-net-ethernet-intel-ice-ice_switch.c-ice_find_dummy_packet()-warn:inconsistent-indenting

clang_recent_errors
`-- x86_64-randconfig-c007
    |-- drivers-net-wireless-ath-ath11k-hal_rx.c:warning:Value-stored-to-he_dcm-is-never-read-clang-analyzer-deadcode.DeadStores
    `-- drivers-net-wireless-ath-ath11k-hal_rx.c:warning:Value-stored-to-he_stbc-is-never-read-clang-analyzer-deadcode.DeadStores

elapsed time: 726m

configs tested: 149
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
powerpc              randconfig-c003-20220313
arm                            zeus_defconfig
sh                                  defconfig
mips                           xway_defconfig
arm                          pxa910_defconfig
m68k                          multi_defconfig
arm                           u8500_defconfig
arm                            xcep_defconfig
mips                        jmr3927_defconfig
sh                           se7343_defconfig
powerpc                         ps3_defconfig
sh                   sh7724_generic_defconfig
sh                          rsk7269_defconfig
powerpc                      mgcoge_defconfig
um                           x86_64_defconfig
alpha                            allyesconfig
ia64                         bigsur_defconfig
arm                         lpc18xx_defconfig
sh                          kfr2r09_defconfig
mips                      fuloong2e_defconfig
sparc                            alldefconfig
sh                   sh7770_generic_defconfig
s390                                defconfig
powerpc                      makalu_defconfig
arc                           tb10x_defconfig
powerpc                       maple_defconfig
powerpc                   motionpro_defconfig
sh                            titan_defconfig
xtensa                  audio_kc705_defconfig
mips                         db1xxx_defconfig
i386                             alldefconfig
nds32                               defconfig
arc                         haps_hs_defconfig
x86_64                              defconfig
sh                        sh7785lcr_defconfig
arm                            hisi_defconfig
ia64                            zx1_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a001-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a006-20220314
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
arc                  randconfig-r043-20220313
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
arc                  randconfig-r043-20220314
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
s390                 randconfig-c005-20220313
mips                 randconfig-c004-20220313
riscv                randconfig-c006-20220313
arm                  randconfig-c002-20220313
i386                          randconfig-c001
powerpc              randconfig-c003-20220313
hexagon                             defconfig
powerpc                    socrates_defconfig
mips                        workpad_defconfig
mips                     cu1000-neo_defconfig
arm                        multi_v5_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc44x_defconfig
powerpc                     mpc512x_defconfig
powerpc                     kilauea_defconfig
arm                         socfpga_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314
hexagon              randconfig-r045-20220313
hexagon              randconfig-r045-20220314
s390                 randconfig-r044-20220314
riscv                randconfig-r042-20220314
hexagon              randconfig-r041-20220313
hexagon              randconfig-r041-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
