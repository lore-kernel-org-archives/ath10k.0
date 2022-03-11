Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E887C433EF
	for <ath10k@archiver.kernel.org>; Fri, 11 Mar 2022 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=02n9NpNmLcrLqzsGOjfNz9P5j7NJij3CRZvEDy32Lj0=; b=kXUoj/e1yABsY4
	P6yL8Lq23FlXLmhZ8WTGCT8KiYl/zSwJO8BIGxQ5EdG5wISsUy8viYFWe1FnGI7eXwury7vAZbzGu
	e77dMPYYpqZayEhJMA8KuSqcCZFo9jmn4/51tb8mqSu3HnMQUXECUcyfumIFRtJ3Jm+ZzgmUAvP1C
	7L/lUHKObqoaC472PFiHnb12+0aspEBvfwJXwurKa8gpOW4E3UI6HUECsFMouG8UeWKQn5hDepGl4
	UheHP92s5Z7WBOIqYttfANSX+ojCg4RuYJcMEw/vften1uCK92HwUkELNTgJmakxPfRICV39c1F40
	ZmqJzFZucuu6pyly/W8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSaS4-00FV1p-1R; Fri, 11 Mar 2022 08:16:44 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSaS0-00FV0g-3a
 for ath10k@lists.infradead.org; Fri, 11 Mar 2022 08:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646986600; x=1678522600;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=4AU33uKnAXLSho5/Il2O5lptLrLQyVYnC8BOeIF45AI=;
 b=jHXBOmu5yN4RmZ+ao5SiTN9lWQQ5mBzQgdV11+TRIwPObnn7ebQh+sFX
 Eent+yQUIrnaAek7re1XmMbbT+Z/2gy46GDCXlf01qAh4Qm2SjGxmmcKY
 dZcv6nRSav55NsL3oH5wssE/MSoGdbQ/oQ4VDhzPx0wU0LorK406gam34
 m1TvuTBCTzhU/KZAkBrTUDY6DZrRZ66nm91g0TXnaxsbLx/yrAV+piNH6
 gESI9GEjiPgm0+BJcaJoUDvDRVLs4++xVDj+RVB/RkriSh+pJKxSXS/xV
 0/TpD0rAfApYEL+o1QHKkvvnDI+e40FXZg7nsfPPWDgadA9gfxS4KKqfS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="316247721"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="316247721"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 00:16:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="633340627"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Mar 2022 00:16:37 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSaRw-000663-QI; Fri, 11 Mar 2022 08:16:36 +0000
Date: Fri, 11 Mar 2022 16:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 1198cbe26aa57ebef7a5c4315260d2e93a93e9a6
Message-ID: <622b0549.Xhhi7o+C7ggFf440%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_001640_259374_B250BD96 
X-CRM114-Status: UNSURE (   5.15  )
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
branch HEAD: 1198cbe26aa57ebef7a5c4315260d2e93a93e9a6  Merge branch 'ath-next' into ath-qca

elapsed time: 785m

configs tested: 114
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
nios2                         3c120_defconfig
sparc                            allyesconfig
arm                            lart_defconfig
sh                            titan_defconfig
sh                            shmin_defconfig
m68k                          multi_defconfig
m68k                       m5208evb_defconfig
sh                          rsk7203_defconfig
xtensa                         virt_defconfig
arm                          badge4_defconfig
sh                           se7721_defconfig
openrisc                  or1klitex_defconfig
sh                          sdk7780_defconfig
arm                             rpc_defconfig
arm                      jornada720_defconfig
arm                        realview_defconfig
mips                         db1xxx_defconfig
arm                          pxa3xx_defconfig
openrisc                         alldefconfig
powerpc                       holly_defconfig
powerpc                 mpc837x_mds_defconfig
arm                  randconfig-c002-20220310
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
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
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
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
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220310
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
arm                   milbeaut_m10v_defconfig
powerpc                       ebony_defconfig
arm                    vt8500_v6_v7_defconfig
hexagon                          alldefconfig
mips                         tb0219_defconfig
powerpc                   microwatt_defconfig
mips                  cavium_octeon_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220310
s390                 randconfig-r044-20220310
riscv                randconfig-r042-20220310
hexagon              randconfig-r041-20220310

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
