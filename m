Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FED3C433F5
	for <ath10k@archiver.kernel.org>; Tue, 18 Jan 2022 03:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4t97A0/6UmtmafGIRXS3nCnPAbR0IecPiU5pUUh2GXI=; b=yFbKaafFmdZuTV
	N+/BwaJw7638j1EnSnK8xiefz5k5w9U0Sm9MxzCl2CG04dm0a+YLzvgeHbNSho1labxaCgLVoCxFE
	Fs7Jp5fM09FGoeCEpXFP7+vvV7cUBrcuBVwsSHBLuVsU6NR8+b0pISuD0m9nv+hxrmzoxox770G3c
	3z8Ic39ta+APLirChG8zngv0ZtujGKj7ddNTQj6fLqDBb2g+3xPPU6zfb2CQXufhG0k+DZspNEueL
	ttomFdzo71I7pZDJBAmAz4Oa1oiyjFGirVnDB75JDKxDA7T4z5SP0RcrlqCzH3XgmiskG9Qo3CnNM
	zIAvNUCejm4uf9OwfALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9fYQ-00023n-K0; Tue, 18 Jan 2022 03:53:06 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9f6I-00HQfK-2s
 for ath10k@lists.infradead.org; Tue, 18 Jan 2022 03:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642476242; x=1674012242;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=PpVjUQtp6P8e1j7XJBlDU3bFZE/LbCT/6Z1Hrw/mdEI=;
 b=QoDTEFxfc2ilkBWQ576yMH7HZgRJ22Pp/Kgk877VQyIuVhrDqAJ+kKfL
 UuSaFCDauDv6xhNpAvtyJ1fzh2rMszcBnOrHZLcHg27M4SKYCCS2+0qhB
 EpyoqfL/P7/Az0SR5McPylUtF52PIDPflijjXWywglJRtHZ9028UI+Q27
 httZudl1GmYpZ1SnDa1JHUVBSVMZ/c3rBeJ4zfd4868tIA/PMg2BZJjQy
 c4M4JXhT/D3JG3CP+Md6+drV2U03Oy94ua7FSdl085wGM2GRPlEnedwSa
 y+NMZTVvB4xgHL1Ipj+u9iUhA/aJbh/QeHfKifOYUNi6VCSUCGWXGP/If Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="269108179"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="269108179"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 19:24:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="578263371"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jan 2022 19:23:59 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n9f6F-000C6p-C3; Tue, 18 Jan 2022 03:23:59 +0000
Date: Tue, 18 Jan 2022 11:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 d96880feb0e31376da7ae7207e2548f40069385c
Message-ID: <61e632b5.VqTk/3/ABeke9s7w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_192402_231193_6FF3EC14 
X-CRM114-Status: UNSURE (   6.39  )
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
branch HEAD: d96880feb0e31376da7ae7207e2548f40069385c  Merge branch 'ath-next' into ath-qca

elapsed time: 726m

configs tested: 146
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220117
powerpc              randconfig-c003-20220117
powerpc                     redwood_defconfig
arm64                            alldefconfig
arm                      integrator_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                             alldefconfig
arm                        shmobile_defconfig
sh                   sh7770_generic_defconfig
ia64                            zx1_defconfig
arm                            mps2_defconfig
mips                         db1xxx_defconfig
arm                            hisi_defconfig
xtensa                  audio_kc705_defconfig
sh                            migor_defconfig
powerpc                       ppc64_defconfig
mips                         tb0226_defconfig
mips                           ip32_defconfig
ia64                             alldefconfig
sh                           se7721_defconfig
s390                          debug_defconfig
sh                          polaris_defconfig
sh                         ap325rxa_defconfig
sh                             shx3_defconfig
xtensa                         virt_defconfig
arm                      footbridge_defconfig
m68k                       m5275evb_defconfig
arm                             ezx_defconfig
alpha                               defconfig
arc                     haps_hs_smp_defconfig
arm                         s3c6400_defconfig
m68k                        mvme16x_defconfig
sh                          r7785rp_defconfig
powerpc                      makalu_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a016-20220117
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a015-20220117
i386                 randconfig-a012-20220117
i386                 randconfig-a016-20220117
i386                 randconfig-a014-20220117
i386                 randconfig-a015-20220117
i386                 randconfig-a011-20220117
i386                 randconfig-a013-20220117
riscv                randconfig-r042-20220117
arc                  randconfig-r043-20220116
arc                  randconfig-r043-20220117
s390                 randconfig-r044-20220117
arc                  randconfig-r043-20220118
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
arm                  randconfig-c002-20220116
x86_64                        randconfig-c007
arm                  randconfig-c002-20220118
riscv                randconfig-c006-20220118
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
powerpc              randconfig-c003-20220118
i386                          randconfig-c001
s390                 randconfig-c005-20220118
mips                 randconfig-c004-20220118
mips                 randconfig-c004-20220116
s390                 randconfig-c005-20220116
mips                      bmips_stb_defconfig
powerpc                     skiroot_defconfig
powerpc                    socrates_defconfig
mips                     cu1830-neo_defconfig
powerpc                  mpc866_ads_defconfig
arm                       mainstone_defconfig
powerpc                       ebony_defconfig
x86_64               randconfig-a005-20220117
x86_64               randconfig-a004-20220117
x86_64               randconfig-a001-20220117
x86_64               randconfig-a006-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
i386                 randconfig-a005-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a004-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
riscv                randconfig-r042-20220118
hexagon              randconfig-r045-20220116
hexagon              randconfig-r045-20220117
hexagon              randconfig-r045-20220118
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220118
hexagon              randconfig-r041-20220116
hexagon              randconfig-r041-20220117
s390                 randconfig-r044-20220116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
