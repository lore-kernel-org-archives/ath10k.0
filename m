Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C07FC433EF
	for <ath10k@archiver.kernel.org>; Sat, 11 Jun 2022 02:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kPXveWmPMzn9Pci6fKAjHj38tGGn/jsQYYn4zdoLels=; b=zK0k9vale8TXfM
	MfekM9dc4g/vAFnr8TSVNNEDItUTVfNlPLexFtLwlqnOmzS8wO9kt+Hk9cxMgm/FOek9CbOW8jYpG
	uZ6UV4hunon+Y+eqAxKN2z0u5n0usc9zViLNX5G5LKP3uSmK1Noj0/p1UK3nsjd/+AUsACgnGSwuS
	KwMawMH/HGUn8ADbRUHj2UZ3edfAmN/yyETNhNdALXplZItUse7tYCMw624MpKY3gXx0tVnIj9T4e
	OiO/lUOXzY2nAvCQTd1aOWir7thxtKF5lg61OKI32m+xIP68+GrP1hcC852M1Jb+d/0FkP3BuDe+G
	WlzKdOJQakCLoxnacZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqv1-00B1KN-Uc; Sat, 11 Jun 2022 02:32:07 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzquy-00B1Iu-Vb
	for ath10k@lists.infradead.org; Sat, 11 Jun 2022 02:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654914724; x=1686450724;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mwZyeYKh6j8kHQ7koKAgpFWlMtZUHPhYzS0xVQYDiKY=;
  b=HwW0AaJowERZAkDzNa5KIf0TgjJr6Vqn/24ox7vl/AzgdV14V2/mwLeB
   p9WTYrZuLka3aaBuxE4imbTphmKA397WGPUM80K84lw1erPwVwBFce896
   1LZL7Kj0ZuS5+QmYH9ZZeL6MQxmcO0UlDBxeRWC3CboOuhAUzG86aYton
   ElTlLwTaTXo2l7NU+tHwvJ048K/nl9c+noJILwAeekTwmrEkzfCeGFXVo
   UvNX9mLoPjYkkgqj5kfskqhgnDQ7G4CWouwk073LmWLsdW2tszzL5q5Zb
   FS0nBzjz+ddK5yMmoXlBK+CxY/RiFF4E9BTtD63oH9B0pjMqDfgU+HsUg
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="258240539"
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="258240539"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 19:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; 
   d="scan'208";a="586536524"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jun 2022 19:31:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzqut-000ITV-0v;
	Sat, 11 Jun 2022 02:31:59 +0000
Date: Sat, 11 Jun 2022 10:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 cc2609eda6981d65b3b1c81e2807910d718b2b98
Message-ID: <62a3fe80.9hBO0DUeBWy95jaA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_193205_121058_F5E6BD96 
X-CRM114-Status: UNSURE (   3.73  )
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
branch HEAD: cc2609eda6981d65b3b1c81e2807910d718b2b98  ath10k: fix recently introduced checkpatch warning

elapsed time: 3963m

configs tested: 160
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                         ap325rxa_defconfig
arc                     haps_hs_smp_defconfig
m68k                       m5475evb_defconfig
nios2                               defconfig
arc                         haps_hs_defconfig
mips                          rb532_defconfig
riscv                               defconfig
ia64                         bigsur_defconfig
m68k                        m5272c3_defconfig
sh                            titan_defconfig
powerpc                 mpc837x_mds_defconfig
mips                         tb0226_defconfig
m68k                            q40_defconfig
microblaze                      mmu_defconfig
powerpc                      chrp32_defconfig
powerpc                 mpc834x_itx_defconfig
sh                           se7750_defconfig
powerpc                 linkstation_defconfig
powerpc64                           defconfig
sh                          rsk7201_defconfig
powerpc                 canyonlands_defconfig
sh                          lboxre2_defconfig
m68k                          sun3x_defconfig
powerpc                 mpc8540_ads_defconfig
arc                      axs103_smp_defconfig
mips                           ci20_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     pq2fads_defconfig
mips                      fuloong2e_defconfig
arm                       aspeed_g5_defconfig
powerpc                   currituck_defconfig
parisc64                         alldefconfig
arm                        clps711x_defconfig
arm                          simpad_defconfig
m68k                        mvme147_defconfig
arm                       imx_v6_v7_defconfig
arm                         s3c6400_defconfig
arm                             ezx_defconfig
arm                        multi_v7_defconfig
powerpc                       ppc64_defconfig
sh                      rts7751r2d1_defconfig
powerpc                        cell_defconfig
powerpc                      pasemi_defconfig
sh                   secureedge5410_defconfig
powerpc                     tqm8541_defconfig
powerpc                   motionpro_defconfig
arm                          pxa3xx_defconfig
sh                              ul2_defconfig
xtensa                  cadence_csp_defconfig
sh                               alldefconfig
powerpc                      ep88xc_defconfig
sh                   sh7770_generic_defconfig
arc                    vdk_hs38_smp_defconfig
um                           x86_64_defconfig
powerpc                      ppc40x_defconfig
powerpc                      pcm030_defconfig
sh                          rsk7203_defconfig
alpha                            alldefconfig
sh                           se7619_defconfig
ia64                             alldefconfig
arc                              allyesconfig
sh                            migor_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220609
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220608
s390                 randconfig-r044-20220608
riscv                randconfig-r042-20220608
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                   bluestone_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                           rs90_defconfig
powerpc                    socrates_defconfig
powerpc                     ppa8548_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                             mxs_defconfig
arm                  colibri_pxa300_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc832x_mds_defconfig
mips                        workpad_defconfig
powerpc                     kmeter1_defconfig
arm                         shannon_defconfig
powerpc                 mpc8560_ads_defconfig
i386                             allyesconfig
mips                        omega2p_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220609
s390                 randconfig-r044-20220609
riscv                randconfig-r042-20220609
hexagon              randconfig-r041-20220609
hexagon              randconfig-r045-20220608
hexagon              randconfig-r041-20220608

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
