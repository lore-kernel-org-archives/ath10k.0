Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A642CC433FE
	for <ath10k@archiver.kernel.org>; Fri, 26 Nov 2021 23:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M40wWQxD8aAktksP3GgiOyLYaVvaS19IN6JgueA+Cb8=; b=2xfxc5umm4NDX1
	BGzr7U0GCnk8tw+e4naprdJMLPsKVX7VWUd4rLXgv8cOYC1xz8dW8FZqFaFht5vCULmduh1lyM6Z7
	7pKRachSaVwX5ApFo7dNs2XQl1ugqNZ+qtiOuluYcxWvF4ileR7i2QqFE7P3buuaitflYxkZTX9sf
	dg6NIIP+y23fw6/fHnTI4TXH1Ct5w/KI5fIyd5r3kErArqmU5HabLKatNcMew35dIzmGrT65+adPh
	z7QuPFprB4d1lLoa4L0VPWFOFEy1XDoeRU8pGPlCOgx1NguFJ0mVMjx/x5T9TKZSpQIzansOa4jqk
	pbLJCHKO+3ENw1kgwe5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqkPI-00ByNY-Ob; Fri, 26 Nov 2021 23:13:28 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqkPD-00ByMd-Gs
 for ath10k@lists.infradead.org; Fri, 26 Nov 2021 23:13:25 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="216432757"
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; d="scan'208";a="216432757"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 15:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; d="scan'208";a="608004331"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 26 Nov 2021 15:13:20 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqkP9-0008jz-Pt; Fri, 26 Nov 2021 23:13:19 +0000
Date: Sat, 27 Nov 2021 07:12:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 23cddeb5a7705daf305f02bd01ff73598ebd6461
Message-ID: <61a169e0.wcgZs3dkSgqUWnXh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_151323_606440_38EB278D 
X-CRM114-Status: UNSURE (   4.64  )
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
branch HEAD: 23cddeb5a7705daf305f02bd01ff73598ebd6461  wcn36xx: Use correct SSN for ADD BA request

elapsed time: 724m

configs tested: 149
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211126
powerpc              randconfig-c003-20211126
mips                 randconfig-c004-20211126
i386                 randconfig-c001-20211125
sh                          rsk7269_defconfig
powerpc                    adder875_defconfig
sh                               j2_defconfig
powerpc                     akebono_defconfig
arm                         axm55xx_defconfig
arm                           omap1_defconfig
parisc                generic-32bit_defconfig
csky                                defconfig
sh                   secureedge5410_defconfig
powerpc                      ppc64e_defconfig
powerpc                     tqm8560_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          collie_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      chrp32_defconfig
arm                         hackkit_defconfig
arm                        clps711x_defconfig
sh                          rsk7203_defconfig
riscv                            alldefconfig
sparc                       sparc64_defconfig
powerpc                        warp_defconfig
arm                        mvebu_v7_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     tqm8540_defconfig
arm                       imx_v4_v5_defconfig
sh                         ap325rxa_defconfig
powerpc                      obs600_defconfig
arc                        nsim_700_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                       m5208evb_defconfig
riscv                               defconfig
arm                       aspeed_g4_defconfig
sh                          kfr2r09_defconfig
ia64                          tiger_defconfig
ia64                         bigsur_defconfig
powerpc                     ksi8560_defconfig
nds32                             allnoconfig
powerpc                      bamboo_defconfig
powerpc                     tqm8555_defconfig
microblaze                          defconfig
arm64                            alldefconfig
powerpc                     rainier_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     mpc5200_defconfig
sh                           se7722_defconfig
sh                          sdk7780_defconfig
arm                          pcm027_defconfig
powerpc                    gamecube_defconfig
powerpc                   motionpro_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     stx_gp3_defconfig
arm                              alldefconfig
m68k                         apollo_defconfig
m68k                        m5407c3_defconfig
arm                            pleb_defconfig
sh                            titan_defconfig
xtensa                    smp_lx200_defconfig
arm                         s3c6400_defconfig
sh                         microdev_defconfig
arm                  colibri_pxa270_defconfig
arm                  randconfig-c002-20211126
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a014-20211126
x86_64               randconfig-a011-20211126
x86_64               randconfig-a012-20211126
x86_64               randconfig-a016-20211126
x86_64               randconfig-a013-20211126
x86_64               randconfig-a015-20211126
i386                 randconfig-a016-20211126
i386                 randconfig-a015-20211126
i386                 randconfig-a012-20211126
i386                 randconfig-a013-20211126
i386                 randconfig-a014-20211126
i386                 randconfig-a011-20211126
arc                  randconfig-r043-20211126
s390                 randconfig-r044-20211126
riscv                randconfig-r042-20211126
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
s390                 randconfig-c005-20211126
i386                 randconfig-c001-20211126
powerpc              randconfig-c003-20211126
riscv                randconfig-c006-20211126
arm                  randconfig-c002-20211126
x86_64               randconfig-c007-20211126
mips                 randconfig-c004-20211126
x86_64               randconfig-a001-20211126
x86_64               randconfig-a003-20211126
x86_64               randconfig-a006-20211126
x86_64               randconfig-a004-20211126
x86_64               randconfig-a005-20211126
x86_64               randconfig-a002-20211126
i386                 randconfig-a002-20211126
i386                 randconfig-a001-20211126
i386                 randconfig-a005-20211126
i386                 randconfig-a006-20211126
i386                 randconfig-a004-20211126
i386                 randconfig-a003-20211126
hexagon              randconfig-r045-20211126
hexagon              randconfig-r041-20211126

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
