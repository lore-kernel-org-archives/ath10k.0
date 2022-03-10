Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B67DC433F5
	for <ath10k@archiver.kernel.org>; Thu, 10 Mar 2022 09:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5D8OzMT1DuWjoPnIzxpgUZQcWDeZB8uDxfFqH25OWPY=; b=wa1gblJDKERGkv
	pJHEnd3S5eKQORrH/tEb7ud4Z+xwi4IIQUuRT94ldP0t2gW5dejuzbkfspFn0OqhiGzUL6YFqiDl3
	Ry2BoIOs3V+yaNNQUkNKxpy5KlVQ335Erw3BiRn3h7nMfbr5kUqUhiZex+6sxgvugCgaOf576NWXX
	8UQ5L2Wk1wc9SFiu7tuh7f+N0oooWQ71yZs+sYQvLmRyFsDCjyCPfnCkcZf0zuma2W3jsNTJi4Lt2
	UuyJo0PwHRR2PXInGYatDOpawwaG6pEzceDWkgtdC31otZc2LDf5SexCeoEobRquoQ24vxkxF11QU
	A2boH+IHm5p3p2yQlICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSEze-00C6cp-GK; Thu, 10 Mar 2022 09:21:58 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSEzW-00C6bR-KZ
 for ath10k@lists.infradead.org; Thu, 10 Mar 2022 09:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646904110; x=1678440110;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=PKS71eJUGQHeGnsW8VQ7/JOiS58CW2YbBQYYrU8bexo=;
 b=KreiRc5L50WGzvSd8dhr3q30XRU0nLzfmIkxoSVvU//kvnVx22hVKapM
 WmQrzsWcI4k7UF7i3GVpb2C+WnC2rEq1/CB33xT9ercA/MiIUpvOOcOA7
 HePwibf6SH5fHKk9PTd35f5aiXlZ9CVW3b6gngnSVkeFkyXT6teHrtUIH
 AWxcar45vLRcQox00k8mB6gY713xV1ENdQdiJ87pgDJ/ggaVU7mVS/1f8
 nLCEAqF47azc3KOmIY3hK2VRHMKlGIKADDBg8fINYX+afE5Ds5YzAopje
 TyEZK04uqS01rE4oNIi1Vo5WXNX8X6pHdTgezWb2eyHxt1vp/ulKfbPU1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235809301"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="235809301"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 01:21:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="538377852"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 10 Mar 2022 01:21:48 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSEzT-0004ir-AK; Thu, 10 Mar 2022 09:21:47 +0000
Date: Thu, 10 Mar 2022 17:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 71c13c2f5d48f92098e1e6acb0242d5175230bbc
Message-ID: <6229c321.vtJ4F5fVm7afkgAg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_012150_746016_EAD81736 
X-CRM114-Status: UNSURE (   4.58  )
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
branch HEAD: 71c13c2f5d48f92098e1e6acb0242d5175230bbc  ath11k: support GTK rekey offload

elapsed time: 1010m

configs tested: 125
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
sh                          landisk_defconfig
mips                           ip32_defconfig
h8300                    h8300h-sim_defconfig
m68k                        m5407c3_defconfig
powerpc                      ppc40x_defconfig
arm                            mps2_defconfig
arm                           sunxi_defconfig
h8300                     edosk2674_defconfig
mips                         db1xxx_defconfig
arm                            pleb_defconfig
arm                             ezx_defconfig
sh                          kfr2r09_defconfig
h8300                       h8s-sim_defconfig
mips                            gpr_defconfig
mips                 decstation_r4k_defconfig
arm                      integrator_defconfig
mips                         bigsur_defconfig
sh                        dreamcast_defconfig
xtensa                    xip_kc705_defconfig
sh                     magicpanelr2_defconfig
powerpc                    klondike_defconfig
powerpc                       eiger_defconfig
arm                         nhk8815_defconfig
powerpc64                        alldefconfig
sh                        edosk7760_defconfig
arm                         lubbock_defconfig
sh                            migor_defconfig
arm                  randconfig-c002-20220309
arm                  randconfig-c002-20220310
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
arc                              allyesconfig
nios2                               defconfig
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
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220309
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                 mpc836x_rdk_defconfig
mips                     loongson2k_defconfig
powerpc                    gamecube_defconfig
mips                           mtx1_defconfig
arm                        neponset_defconfig
arm                       versatile_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                          rm200_defconfig
riscv                    nommu_virt_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220309
hexagon              randconfig-r045-20220309
s390                 randconfig-r044-20220309
riscv                randconfig-r042-20220309
hexagon              randconfig-r045-20220310
hexagon              randconfig-r041-20220310
riscv                randconfig-r042-20220310

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
