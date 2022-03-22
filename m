Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0872C433EF
	for <ath10k@archiver.kernel.org>; Tue, 22 Mar 2022 03:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JQi0UCxDNEo8N9dGUaUfXlofveVqmNb5X13ECg6Gzgw=; b=R+RMo5Z6f4AMVu
	0+LSt/VMv5wXOySQR/kWltzYvKhI5orPAJvfBbwAWkQsbuVMptWlKPfr6mHa/15Ft3Tb3r3KCfu+4
	St3hmOzPrPfPGwYrJvMHXgbOG1BbevTMg5JKiDxq8B80HYYlaxOis9QH1gvHz9t6K0L1+Vb0s8VDz
	vvqDRjnGm3v+Wd/uOlZoU8NXJDFRNKVHfLjFGGnSk1mkJU/+N8ouGO1Uq1J8petmPOYKVmt7KrBY9
	SwE+kYlSmPmHzPVM11y8F/OFK8rfWk+V9usBjRLSo6cflZRM09pGD5rlwzMs9gAil0YVtBprnyR4p
	35Ltdpo70z0MTGHNa0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWVLL-009tWa-UU; Tue, 22 Mar 2022 03:37:59 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWVLH-009tVw-ST
 for ath10k@lists.infradead.org; Tue, 22 Mar 2022 03:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647920275; x=1679456275;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=tkmlmoPRAadCq0AtabCjYtiWIy1Vp88GIkbu4wdcsoA=;
 b=NiM9qiQbiD5Ay+V71D6YPF8ub+s9XT0sZiSSRA+J9zL3+4rFh6OPm0Qb
 N3M3IUbOAQUYfyAFR4Donrwy/8WqqSGqJB2MF0YtnVyd+b4OqSuCaC3zg
 lG5vn77W9Fu+2fUvhW89/ANurDF8znzanWBKRMY9Jzju35EgIyUZdP5yN
 YBqUj7KQzhskNGx06FnFakx/Dvx9UV2em2iVaPfQ5OHMJWRjpUYWAF6b3
 DtXxXTi4TyNPA32q/gzJ/VWxW6xB69zIFG2S9oU/Pm5bgrrygjM5JDnJ2
 SVxDC/7WGbwSLwv18RtKCvlI+hFrO/6AGUi8pxbONyTo8dx4B6O1rXSQV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="256533900"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="256533900"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 20:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="716756481"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2022 20:37:44 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWVL5-000IR4-Bg; Tue, 22 Mar 2022 03:37:43 +0000
Date: Tue, 22 Mar 2022 11:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 33a4b4abdb2afad52a5d3ae3c3631b21887307df
Message-ID: <62394471.RRTdtYcETqva0HZU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_203755_997583_FB5746B9 
X-CRM114-Status: UNSURE (   4.78  )
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
branch HEAD: 33a4b4abdb2afad52a5d3ae3c3631b21887307df  Merge branch 'ath-next' into ath-qca

elapsed time: 762m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20220321
ia64                            zx1_defconfig
arm                        trizeps4_defconfig
arc                     nsimosci_hs_defconfig
sh                             sh03_defconfig
ia64                        generic_defconfig
sh                          urquell_defconfig
xtensa                           alldefconfig
mips                         rt305x_defconfig
openrisc                  or1klitex_defconfig
powerpc                 mpc837x_mds_defconfig
arm                        mini2440_defconfig
powerpc                     ep8248e_defconfig
xtensa                          iss_defconfig
arm                  randconfig-c002-20220320
arm                  randconfig-c002-20220321
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
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
x86_64               randconfig-a012-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a013-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a016-20220321
x86_64               randconfig-a015-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a014-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a015-20220321
arc                  randconfig-r043-20220320
riscv                randconfig-r042-20220321
s390                 randconfig-r044-20220321
arc                  randconfig-r043-20220321
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220320
powerpc              randconfig-c003-20220320
i386                          randconfig-c001
s390                 randconfig-c005-20220320
arm                  randconfig-c002-20220320
riscv                randconfig-c006-20220320
powerpc                     tqm8540_defconfig
mips                malta_qemu_32r6_defconfig
mips                     loongson1c_defconfig
powerpc                        fsp2_defconfig
i386                 randconfig-a003-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a002-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a006-20220321
x86_64               randconfig-a002-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a006-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a001-20220321
hexagon              randconfig-r041-20220321
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220320
s390                 randconfig-r044-20220320
riscv                randconfig-r042-20220320

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
