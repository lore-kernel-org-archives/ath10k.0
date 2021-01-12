Return-Path: <SRS0=zfzF=GP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71164C433DB
	for <ath10k@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37EB9230FD
	for <ath10k@archiver.kernel.org>; Tue, 12 Jan 2021 09:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37EB9230FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vQeU3y13Euuj29vkLBUn6QSNGZUERzVPAOIfPzbAZSU=; b=ErYZlJUU4Hx0N0kPrnkFBuPD0h
	yZjox9NbkNfscerTSgyTPMatO/YnKNzVfb7Ig6PBE/fI1WqFOHs0avT3ypPrOx4mVP/Ig3YVIgCy+
	8nNi0erT2jm0Ya6zL/MdgSjiGfXFuFZrpSJCrg+vWUm6Z3kGlDRGPiEn7ZHQGkngOx9Zwutj3eg6u
	m1Yd6tlWHGNFnEaiT0fKEgUj+ZVr4Gvj75/IDSp+vby7UqittrJ1zJH+Eolo4KfNstkmiJyOewxlS
	CETAlQ7QuXJLi/6RGlVlKybkieN20HGImqoJfmIKtQufJickON9F+O5eiBTfvbcqX5h363I67PWAq
	v89qN5TA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzGJr-0005pg-Jz; Tue, 12 Jan 2021 09:50:31 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzGJ2-0005Rn-VC
 for ath10k@lists.infradead.org; Tue, 12 Jan 2021 09:49:44 +0000
IronPort-SDR: zXg2ScCEpl2L5kOvevarczbkUixR1zg2qX0gBCW4VmvTmocXyHGgpzPLBWbKAIej8tF/goOPQT
 lf2HWKS9QstA==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="165692948"
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="165692948"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 01:49:38 -0800
IronPort-SDR: 2eHxf2of4+ctjVIKsQZo4dY2haGpx0myvjzyI2vefMF3xCZcwfIjtuD4g+nS8pKXkAT+ZC0WwK
 XmFRdPuR95NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,341,1602572400"; d="scan'208";a="567457438"
Received: from lkp-server01.sh.intel.com (HELO b73930e00c65) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 12 Jan 2021 01:49:36 -0800
Received: from kbuild by b73930e00c65 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kzGIy-00004L-9Q; Tue, 12 Jan 2021 09:49:36 +0000
Date: Tue, 12 Jan 2021 17:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 8413cb5e330b4babe7d734aba4f5c22e3430bd70
Message-ID: <5ffd708c.6cfOVfpz/RsjDOXT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_044941_420624_B8191DA1 
X-CRM114-Status: UNSURE (   6.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  master-pending
branch HEAD: 8413cb5e330b4babe7d734aba4f5c22e3430bd70  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 163
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                          hp300_defconfig
arm                         bcm2835_defconfig
openrisc                            defconfig
mips                           rs90_defconfig
csky                                defconfig
arm                          iop32x_defconfig
powerpc                       maple_defconfig
powerpc                      bamboo_defconfig
powerpc                     sbc8548_defconfig
mips                  cavium_octeon_defconfig
sh                           se7206_defconfig
powerpc                  storcenter_defconfig
arm                          ep93xx_defconfig
mips                        bcm63xx_defconfig
powerpc                  iss476-smp_defconfig
arm                        realview_defconfig
powerpc                       ppc64_defconfig
powerpc                        cell_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      walnut_defconfig
powerpc                      arches_defconfig
powerpc                      ppc6xx_defconfig
mips                           mtx1_defconfig
arm                      tct_hammer_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                          atari_defconfig
arm                         lpc32xx_defconfig
sh                           sh2007_defconfig
h8300                     edosk2674_defconfig
arm                           h5000_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm5200_defconfig
c6x                                 defconfig
arm                     am200epdkit_defconfig
c6x                              alldefconfig
openrisc                 simple_smp_defconfig
nios2                               defconfig
arm                             pxa_defconfig
sh                           se7750_defconfig
powerpc                      ep88xc_defconfig
powerpc                     tqm8548_defconfig
mips                         tb0287_defconfig
m68k                       m5249evb_defconfig
powerpc                     rainier_defconfig
sh                   secureedge5410_defconfig
arm                        vexpress_defconfig
mips                malta_kvm_guest_defconfig
mips                         rt305x_defconfig
powerpc                      ppc64e_defconfig
arm                         vf610m4_defconfig
m68k                           sun3_defconfig
sh                               allmodconfig
arm                         axm55xx_defconfig
arm                            pleb_defconfig
sh                        sh7785lcr_defconfig
arm                        multi_v7_defconfig
openrisc                  or1klitex_defconfig
powerpc                      katmai_defconfig
powerpc                 canyonlands_defconfig
powerpc                      mgcoge_defconfig
m68k                       m5275evb_defconfig
mips                       rbtx49xx_defconfig
powerpc                      makalu_defconfig
arm                       cns3420vb_defconfig
parisc                generic-32bit_defconfig
mips                           ip27_defconfig
nios2                            alldefconfig
mips                  maltasmvp_eva_defconfig
arm                         palmz72_defconfig
arm                           efm32_defconfig
arm                        mvebu_v7_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210111
x86_64               randconfig-a006-20210111
x86_64               randconfig-a001-20210111
x86_64               randconfig-a003-20210111
x86_64               randconfig-a005-20210111
x86_64               randconfig-a002-20210111
i386                 randconfig-a002-20210111
i386                 randconfig-a005-20210111
i386                 randconfig-a006-20210111
i386                 randconfig-a001-20210111
i386                 randconfig-a003-20210111
i386                 randconfig-a004-20210111
i386                 randconfig-a002-20210112
i386                 randconfig-a005-20210112
i386                 randconfig-a006-20210112
i386                 randconfig-a003-20210112
i386                 randconfig-a001-20210112
i386                 randconfig-a004-20210112
x86_64               randconfig-a015-20210112
x86_64               randconfig-a012-20210112
x86_64               randconfig-a013-20210112
x86_64               randconfig-a016-20210112
x86_64               randconfig-a014-20210112
x86_64               randconfig-a011-20210112
x86_64               randconfig-a015-20210110
x86_64               randconfig-a012-20210110
x86_64               randconfig-a013-20210110
x86_64               randconfig-a016-20210110
x86_64               randconfig-a014-20210110
x86_64               randconfig-a011-20210110
i386                 randconfig-a012-20210111
i386                 randconfig-a011-20210111
i386                 randconfig-a015-20210111
i386                 randconfig-a013-20210111
i386                 randconfig-a016-20210111
i386                 randconfig-a014-20210111
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210111
x86_64               randconfig-a012-20210111
x86_64               randconfig-a013-20210111
x86_64               randconfig-a016-20210111
x86_64               randconfig-a014-20210111
x86_64               randconfig-a011-20210111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
