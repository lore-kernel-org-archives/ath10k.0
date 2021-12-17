Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944D6C433F5
	for <ath10k@archiver.kernel.org>; Fri, 17 Dec 2021 10:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IUJrvDYQyYBN4qhS+beBRBlD8Qque1QBGEnsFEC7aJQ=; b=oPKEYfWM2C18Y5
	r6hBx4VgVbBw/p0Ue+PH1G70rT0kboikcVoRHC9u46FD6DV9RPD3js+GL1+A8vEHdJxK24wkgJ0uA
	es1n36PjS8m0Lq0VNhymO9zNxE17J/529Ks9PoS++hdga3DT1UIAJvFZZVXKlFepgcqNsfylczxuL
	I88eVFs3k2cqc+2Hjspi297yhjqrlCGQtK7nTSY7+POtxUuLQvnYQyM/O5D4hyXb3Ss5QpjsQTuBR
	kwpVxL9jlUmv1OuIdFVOJme0ORA80EzkewirLv8ydCjnSOV6taYTZxOJQAAPpe4vR6q4IBZTPqTMK
	bxtgKSmCH7lyAGh1yV0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAf8-009YiJ-2X; Fri, 17 Dec 2021 10:40:30 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAY4-009WYF-1w
 for ath10k@lists.infradead.org; Fri, 17 Dec 2021 10:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639737192; x=1671273192;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HiA51I+9VgHqmwfX2YfVtGLV4ZX5UTSogSh9fTRyQjw=;
 b=ltC61O2/+v7+mdmlFlI1FV+NAIbRL3MPshR9522094dFFMjahEIlex/2
 Gq10IoBI71+ILmsNC7Gkvf64OpIWbeFVQwxiBZo/0ytbeKm/iO213L8gc
 Z6K2AGQJ3A9GatLBmwxqWXKg4JEQHrAEvJB38E1ha9adegUQUFY8wu/IA
 vFzS3vXEjajqLAI4FYvoMcvxxnBD7qmUY9REAjPIWbFYip4HHndUgkThz
 seoyz4sguGjc0JidzUegeEf7SlPzKXALPkFmaGrk6j0i7cY47EdqjnmE4
 IJGXY0FwuJXuZv5jpRnLqtA04Yk+QeL8T8AVQ6PFphT/5/rB2TWLNRQ6G w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="227014916"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="227014916"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 02:33:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="683338684"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 17 Dec 2021 02:33:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1myAY1-0004at-2O; Fri, 17 Dec 2021 10:33:09 +0000
Date: Fri, 17 Dec 2021 18:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 668168ab6fa3a7a8ce2bb3f91bdd01be2bb79deb
Message-ID: <61bc674a.6LsmcIcEULLUla3k%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_023312_206652_5E96EEDD 
X-CRM114-Status: UNSURE (   5.71  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: 668168ab6fa3a7a8ce2bb3f91bdd01be2bb79deb  ath10k: abstract htt_rx_desc structure

elapsed time: 1000m

configs tested: 138
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211216
m68k                       m5475evb_defconfig
sh                           se7712_defconfig
arm                         lubbock_defconfig
arm                        magician_defconfig
arm                         s3c2410_defconfig
ia64                            zx1_defconfig
sh                           se7724_defconfig
m68k                       m5208evb_defconfig
sparc                               defconfig
mips                        vocore2_defconfig
sh                   rts7751r2dplus_defconfig
i386                             allyesconfig
powerpc                 xes_mpc85xx_defconfig
arm                            pleb_defconfig
mips                         mpc30x_defconfig
powerpc                   currituck_defconfig
nds32                             allnoconfig
mips                     loongson1b_defconfig
m68k                          atari_defconfig
h8300                    h8300h-sim_defconfig
sh                        dreamcast_defconfig
arm                           sunxi_defconfig
powerpc                      walnut_defconfig
powerpc                     rainier_defconfig
sh                            hp6xx_defconfig
powerpc                      pmac32_defconfig
sh                           se7722_defconfig
mips                           mtx1_defconfig
arm                        mvebu_v7_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                            q40_defconfig
sh                         microdev_defconfig
arm                       omap2plus_defconfig
arm                           u8500_defconfig
m68k                         amcore_defconfig
arm                      integrator_defconfig
m68k                             alldefconfig
mips                         bigsur_defconfig
arc                    vdk_hs38_smp_defconfig
mips                          ath25_defconfig
arm                          lpd270_defconfig
h8300                     edosk2674_defconfig
arm                       mainstone_defconfig
arm                          ixp4xx_defconfig
mips                           ip22_defconfig
arm                        trizeps4_defconfig
sh                          lboxre2_defconfig
h8300                            allyesconfig
powerpc                    adder875_defconfig
parisc                generic-32bit_defconfig
arm                  randconfig-c002-20211216
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a002-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a004-20211216
i386                 randconfig-a013-20211217
i386                 randconfig-a011-20211217
i386                 randconfig-a016-20211217
i386                 randconfig-a014-20211217
i386                 randconfig-a015-20211217
i386                 randconfig-a012-20211217
arc                  randconfig-r043-20211216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
i386                 randconfig-a002-20211217
i386                 randconfig-a005-20211217
i386                 randconfig-a003-20211217
i386                 randconfig-a006-20211217
i386                 randconfig-a004-20211217
i386                 randconfig-a001-20211217
x86_64               randconfig-a011-20211216
x86_64               randconfig-a014-20211216
x86_64               randconfig-a012-20211216
x86_64               randconfig-a013-20211216
x86_64               randconfig-a016-20211216
x86_64               randconfig-a015-20211216
hexagon              randconfig-r045-20211216
s390                 randconfig-r044-20211216
riscv                randconfig-r042-20211216
hexagon              randconfig-r041-20211216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
