Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FCBC433F5
	for <ath10k@archiver.kernel.org>; Sat, 19 Mar 2022 04:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hMemVY2h6bidBnbbsf3mN5SPSCu+jeRWG3K7pOfqeDM=; b=GnUsI2G0WRiiAB
	meu1BQ3YoDQvuKx/QTU/Bd/VR2zUXPZAEpC3GZvxPu9t63j5jEXzkhn7AxVdbRXY8H750Mhv2mN+0
	uKL+Fn+HYaiw4wMX7ed2nkLU+p37MhpIXhVNvzfMwFMjwyKMl7AGXcQoev2wGjEu3v0qWkBZIHL1b
	uBq30w5uIv87/Q9mTBgxazyxwCcX57qSYCDX13OWHgAA/wgbrYaJ2L5566K6P6artiST9WiWImZj3
	aIgNcprfKkA65nMXO31GAxwE4VGXU8fDjqXNpiJD/sxKv/cqMaKHlMxSmk+dpRwWhqNBkg+0cdpFX
	wCnwRA3DtPTQV9JzXMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVQYU-003E7g-Bq; Sat, 19 Mar 2022 04:19:06 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVQYQ-003E76-SB
 for ath10k@lists.infradead.org; Sat, 19 Mar 2022 04:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647663542; x=1679199542;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=BzWcO+2rAWyS6iDLycwuRjq26g29mZbNC0mp6QsIFzg=;
 b=R6WxbFfyrNigb155hz2X1O2qHOwMInrIruvKNz5sDX1tPRwAgK+acPrg
 A/YA6zRly7VYyARzsCz+evQKUpF7POvCzNthX9NPm5akw51iUveTza33A
 +IcX4utFokenFKsUMulTxZ/L2huZh+f9JwaMAu2fbOz6ZTWKXv492uO1d
 61MKgf7Oec4FQCCJehv0iwxJucxhLuoi8/0E/+BVl8gveBCqVzuMIr9jq
 fIPVB7o8v0hW6wtvI44YERzuYcx+QTcQ8lJ6N56FF0Rn29+db7HQ2XHSD
 g4m7vyhmNHk/MpKU26HKUQbAYk4UNgJKrpvPV4E1RkPe025DUW1zpLq/2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="343708685"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="343708685"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 21:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558815171"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 18 Mar 2022 21:19:00 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nVQYN-000FZl-Hp; Sat, 19 Mar 2022 04:18:59 +0000
Date: Sat, 19 Mar 2022 12:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 da7f41d2da232109251868446b95a5ebd8bebcfe
Message-ID: <62355990.+B2ENwBauw/gBwuf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_211903_008298_DF36A02F 
X-CRM114-Status: UNSURE (   4.50  )
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
branch HEAD: da7f41d2da232109251868446b95a5ebd8bebcfe  Merge branch 'ath-next' into ath-qca

elapsed time: 748m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
powerpc                      tqm8xx_defconfig
sh                         microdev_defconfig
mips                            ar7_defconfig
sh                          polaris_defconfig
arm                          lpd270_defconfig
sh                              ul2_defconfig
arm                      footbridge_defconfig
mips                     decstation_defconfig
m68k                             allyesconfig
alpha                            alldefconfig
m68k                        m5307c3_defconfig
arm                             rpc_defconfig
mips                       capcella_defconfig
sh                          r7780mp_defconfig
arm                        keystone_defconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc8540_ads_defconfig
arm                             pxa_defconfig
arm                        realview_defconfig
arc                          axs101_defconfig
sh                            hp6xx_defconfig
m68k                            mac_defconfig
mips                  maltasmvp_eva_defconfig
arm                  randconfig-c002-20220318
arm                  randconfig-c002-20220317
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
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
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
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
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220317
arc                  randconfig-r043-20220318
riscv                randconfig-r042-20220317
arc                  randconfig-r043-20220317
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                   milbeaut_m10v_defconfig
mips                     loongson1c_defconfig
mips                           rs90_defconfig
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
hexagon              randconfig-r045-20220318
hexagon              randconfig-r045-20220317
hexagon              randconfig-r041-20220318
riscv                randconfig-r042-20220318
hexagon              randconfig-r041-20220317
s390                 randconfig-r044-20220318

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
