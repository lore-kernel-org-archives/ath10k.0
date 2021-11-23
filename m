Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8112CC433EF
	for <ath10k@archiver.kernel.org>; Tue, 23 Nov 2021 03:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lo/16QI9psouO4Bp3Hf1IABJeoNbUFARNcSwu/Au8/s=; b=wIU/Ld9Nwh+JA1
	QULaaBlNQBM7vWyXaPVQ/JQl7vzFIwqZRlR+lfYPyEpJ345biKazOjVaF70/mfyFI1f7LcOdKhKjs
	1TJu5Tue4WNnVi84VhVdSx+mGUgz0Tn4lz8tCJgzBFuZlpan0Xdg8T3ZNfA718rmhCnDIjPBqZHD5
	JeEQkevk4qVq+zFI0QLL3SWFbltEfXeRRe6nRmvQel5xzUb9TiuIoSQvEu/tJa8szcCQ6n/Nb3PST
	2etfUNnximIQTef0rvZ7V3gY00GcaZpDyiDF2Z7iBtLUuFJlE/op+RB0rrge6uZKYgsYJwEr8sRxl
	JyQcmYuukMjtpc49OmxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpMIB-000hww-Ep; Tue, 23 Nov 2021 03:16:23 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpMI6-000hus-P7
 for ath10k@lists.infradead.org; Tue, 23 Nov 2021 03:16:20 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="214967668"
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="214967668"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 19:16:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="590161315"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2021 19:16:16 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mpMI3-00015D-Pf; Tue, 23 Nov 2021 03:16:15 +0000
Date: Tue, 23 Nov 2021 11:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 f60c9500ebe9639ca5b4c092b79710ada21101e2
Message-ID: <619c5ce7.nnBrWp8+9QtL9Fhx%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_191618_878909_D6ADAD47 
X-CRM114-Status: UNSURE (   5.29  )
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
branch HEAD: f60c9500ebe9639ca5b4c092b79710ada21101e2  Merge branch 'ath-next' into ath-qca

elapsed time: 721m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211122
m68k                            q40_defconfig
sh                          sdk7780_defconfig
m68k                          amiga_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                       common_defconfig
mips                          ath79_defconfig
sh                           se7206_defconfig
powerpc                    mvme5100_defconfig
arm                        oxnas_v6_defconfig
sh                        sh7757lcr_defconfig
powerpc                 canyonlands_defconfig
ia64                      gensparse_defconfig
sh                         ecovec24_defconfig
s390                             alldefconfig
arm                         hackkit_defconfig
openrisc                            defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
sh                           se7343_defconfig
arm                    vt8500_v6_v7_defconfig
mips                       rbtx49xx_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                          gemini_defconfig
sh                        edosk7760_defconfig
m68k                       m5249evb_defconfig
sh                   secureedge5410_defconfig
m68k                         amcore_defconfig
powerpc                      ppc64e_defconfig
arm                           corgi_defconfig
m68k                       m5475evb_defconfig
ia64                         bigsur_defconfig
mips                   sb1250_swarm_defconfig
arm                  randconfig-c002-20211122
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211122
x86_64               randconfig-a012-20211122
x86_64               randconfig-a013-20211122
x86_64               randconfig-a014-20211122
x86_64               randconfig-a015-20211122
x86_64               randconfig-a016-20211122
i386                 randconfig-a016-20211122
i386                 randconfig-a015-20211122
i386                 randconfig-a012-20211122
i386                 randconfig-a013-20211122
i386                 randconfig-a014-20211122
i386                 randconfig-a011-20211122
arc                  randconfig-r043-20211122
s390                 randconfig-r044-20211122
riscv                randconfig-r042-20211122
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
x86_64               randconfig-a001-20211122
x86_64               randconfig-a003-20211122
x86_64               randconfig-a006-20211122
x86_64               randconfig-a004-20211122
x86_64               randconfig-a005-20211122
x86_64               randconfig-a002-20211122
i386                 randconfig-a001-20211122
i386                 randconfig-a002-20211122
i386                 randconfig-a004-20211122
i386                 randconfig-a003-20211122
i386                 randconfig-a005-20211122
i386                 randconfig-a006-20211122
hexagon              randconfig-r041-20211122
hexagon              randconfig-r045-20211122

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
