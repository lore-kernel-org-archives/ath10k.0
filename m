Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C66FC433FE
	for <ath10k@archiver.kernel.org>; Tue, 14 Dec 2021 05:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xNoClqIaMxqkQKKL1Qll5WZaxmrpgQh6fjYsdqNw/Uk=; b=sLb+pMYGAHoqiA
	tXfK8QEyZ2iX1pNPdbXdN5cUQn9ayoKA6i19Wv/S8A6PJqX6em4lOdwWUySY9l/ZnNnuaetNKzr3z
	4G20pgGrGDWRao9OkLBaJAR1pZy/t/4xO0yo3pH0A1mRb0rwTqzz6cApxf/foGMS/pYDPwE3jumik
	IBx1LBSrcapHZOuggty0KnUbaYepzBj+jwEJjiYKTiwXa7DDrEXW6/w1U68zabvt8tf/f1C0y4RXb
	wVjVT0TKfnIpwE7vOXf3UpqsVVCWIVOXiVE78dcpk+jSCijyqtfpoaHTwfsg/0ZK4u3sDF+9AQ98Z
	44iVP8KxZw8YdRUCJa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx0RD-00CcQO-G7; Tue, 14 Dec 2021 05:33:19 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx0RA-00CcOJ-Bn
 for ath10k@lists.infradead.org; Tue, 14 Dec 2021 05:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639459996; x=1670995996;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NMrfoTjrSJARouBaIbjDCjohM8gNOFAFZjswyOuBkfE=;
 b=PBR6RDqa/qP8n51xB3M+cNgQ05NXYjpkXKi2IXERIBARqGJE2AiAFKGK
 t94poC0yOehM6n4AtPldp9W1ev0+tPjrJAZfM0BPQD9RlWNMZnVKZm1Xp
 o7Ko/X5NTdoRUGlIAlK9AHUHoU1H8DrnmJir2aqABYTrT4V9rjxTEq/RI
 tr3pGtY5Zu/leCC0prrq6s4KKHN09FG30bsOOadw6t6TVnjb0zNMiHbhD
 ByBxxCpDAot6TvfJoc0QJqv0RLp3F/ot5n94wm+vfWsrq2gADH8qbH4l5
 np+ZFMjGzMm5x3vEUt4Sl8O9WEDqiFvxnGtJW6sHsqHbJGW7myscaQF1P g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238712365"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="238712365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 21:33:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="464935052"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 21:33:09 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mx0R2-0007Sf-St; Tue, 14 Dec 2021 05:33:08 +0000
Date: Tue, 14 Dec 2021 13:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 0abfb34f907411efa6535b6438be6b2971f1e5a2
Message-ID: <61b82c8e.1HmnOM+Nn4esAJse%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_213316_491030_16688A7F 
X-CRM114-Status: UNSURE (   4.87  )
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
branch HEAD: 0abfb34f907411efa6535b6438be6b2971f1e5a2  Revert "bus: mhi: Early MHI resume failure in non M3 state"

elapsed time: 1140m

configs tested: 102
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211213
arm                          pcm027_defconfig
arm                        mvebu_v7_defconfig
mips                           ci20_defconfig
sh                          urquell_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                        fsp2_defconfig
arm                        vexpress_defconfig
arm                           viper_defconfig
sh                             sh03_defconfig
arc                          axs101_defconfig
m68k                          atari_defconfig
mips                     loongson1c_defconfig
openrisc                 simple_smp_defconfig
powerpc                      obs600_defconfig
mips                        vocore2_defconfig
powerpc                     pq2fads_defconfig
mips                         mpc30x_defconfig
arm                  randconfig-c002-20211213
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
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
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a016-20211213
x86_64               randconfig-a015-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a016-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
arc                  randconfig-r043-20211213
riscv                randconfig-r042-20211213
s390                 randconfig-r044-20211213
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
i386                 randconfig-a001-20211213
i386                 randconfig-a002-20211213
i386                 randconfig-a005-20211213
i386                 randconfig-a003-20211213
i386                 randconfig-a006-20211213
i386                 randconfig-a004-20211213
x86_64               randconfig-a001-20211213
x86_64               randconfig-a002-20211213
x86_64               randconfig-a003-20211213
x86_64               randconfig-a005-20211213
x86_64               randconfig-a004-20211213
x86_64               randconfig-a006-20211213
hexagon              randconfig-r045-20211213
hexagon              randconfig-r041-20211213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
