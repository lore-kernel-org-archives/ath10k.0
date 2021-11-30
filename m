Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66EEC433F5
	for <ath10k@archiver.kernel.org>; Tue, 30 Nov 2021 05:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JcLDbr84OC+1mw+Sskag6DpG4zOgIcwX4gjyEm3294s=; b=IIjrQy/wkp1Kk9
	GMIFlh09WjZF1h6I2gZXqSPSYMExibKeIPvvJrtN5RHok9k9dyewk5L5vvytRze3lhyf4K6xaM+yQ
	SZMTrHP7ysyVExGHq2v2VYr0YhW9fF0xTt0lpTR+p7wskUyf0Jt9Q0LzejdA8vB4r8DiZK9yErAZb
	l9IPBorpgp72oIaY/3PLeMFTA1aDDxL8Pb4U+peOp8AhWdl8/sfw6yLjw0XHxwOccCDsRqMGBum74
	CsOBU1wQlUH8FWv2jNROpGVZRJI7xMmNjMaN9N16FND9OvtPjsTvfnSh5iUbQp7UzqBmKED8FcX3n
	p4F0UipWfvhegKScvkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrvHw-003c1b-7j; Tue, 30 Nov 2021 05:02:44 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrvHt-003c1A-9w
 for ath10k@lists.infradead.org; Tue, 30 Nov 2021 05:02:43 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="236374394"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="236374394"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 21:02:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; d="scan'208";a="559346720"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2021 21:02:30 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mrvHh-000Cld-Js; Tue, 30 Nov 2021 05:02:29 +0000
Date: Tue, 30 Nov 2021 13:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 d918fefb598f2703cb3581a56b9117d37ad7bef1
Message-ID: <61a5b030.Zx66X9pR4dLvOKph%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_210241_400507_E5D2DFCC 
X-CRM114-Status: UNSURE (   5.23  )
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
branch HEAD: d918fefb598f2703cb3581a56b9117d37ad7bef1  Revert "bus: mhi: Early MHI resume failure in non M3 state"

elapsed time: 721m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      pasemi_defconfig
powerpc                 mpc832x_mds_defconfig
xtensa                    smp_lx200_defconfig
arm                          iop32x_defconfig
mips                        vocore2_defconfig
arm                            xcep_defconfig
mips                      loongson3_defconfig
arm                      integrator_defconfig
arm                        multi_v7_defconfig
arm                        realview_defconfig
powerpc                     taishan_defconfig
arm                         palmz72_defconfig
powerpc                         wii_defconfig
mips                       rbtx49xx_defconfig
sh                          rsk7201_defconfig
arm                        mvebu_v7_defconfig
arm                       versatile_defconfig
microblaze                      mmu_defconfig
arm                         orion5x_defconfig
mips                           ip22_defconfig
mips                           gcw0_defconfig
arm                       imx_v6_v7_defconfig
mips                        omega2p_defconfig
mips                           rs90_defconfig
arm                           h5000_defconfig
arm                            qcom_defconfig
arm                  randconfig-c002-20211130
arm                  randconfig-c002-20211128
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
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
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
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
i386                 randconfig-a001-20211129
i386                 randconfig-a002-20211129
i386                 randconfig-a006-20211129
i386                 randconfig-a005-20211129
i386                 randconfig-a004-20211129
i386                 randconfig-a003-20211129
x86_64               randconfig-a011-20211128
x86_64               randconfig-a014-20211128
x86_64               randconfig-a012-20211128
x86_64               randconfig-a016-20211128
x86_64               randconfig-a013-20211128
x86_64               randconfig-a015-20211128
i386                 randconfig-a015-20211128
i386                 randconfig-a013-20211128
i386                 randconfig-a012-20211128
i386                 randconfig-a014-20211128
i386                 randconfig-a011-20211128
i386                 randconfig-a016-20211128
arc                  randconfig-r043-20211128
s390                 randconfig-r044-20211128
riscv                randconfig-r042-20211128
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a001-20211128
x86_64               randconfig-a006-20211128
x86_64               randconfig-a003-20211128
x86_64               randconfig-a005-20211128
x86_64               randconfig-a004-20211128
x86_64               randconfig-a002-20211128
i386                 randconfig-a015-20211129
i386                 randconfig-a016-20211129
i386                 randconfig-a013-20211129
i386                 randconfig-a012-20211129
i386                 randconfig-a014-20211129
i386                 randconfig-a011-20211129
hexagon              randconfig-r045-20211129
hexagon              randconfig-r041-20211129
s390                 randconfig-r044-20211129
riscv                randconfig-r042-20211129
hexagon              randconfig-r041-20211128
hexagon              randconfig-r045-20211128

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
