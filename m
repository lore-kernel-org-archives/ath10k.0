Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269B0C433F5
	for <ath10k@archiver.kernel.org>; Sat,  2 Apr 2022 06:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=st7flqrfmYKpAlKQ8c1VRory15m8QGO9Fnz6EIzzEmI=; b=uy1KZdeaOeg1DC
	cBK+PNBHmBZ6aP1RZaegxcsdQK52k64klemI4+7uB+8cOsbtfLTsI+ZikilPPU/vCd7svLqsnz1V6
	DVaYlZWXrqDIOUb9VuHEwkSkouYNPZXWuONCVsUpGafoAzw6GS8A/PnqnWuqRL4v/jzjncQY2FvT9
	TGNejds5z/MkERkCPxu8Q3ndRfdbqyGkDg3SIaVRSjnlaRoxeJ/q/gWBOOMzYlf6pLpoVsYoRUvwu
	d9wJjY1u32IbJ/HFnDrnhwJ9aw2YNLtScERyMzQ5O3WuyT5TnEC/u7xVL6NbMaABdPztpnPCvlKmK
	7MHHBScFTswspvmNzKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naWoV-0088Uj-TL; Sat, 02 Apr 2022 06:00:43 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naWoS-0088UF-Gl
 for ath10k@lists.infradead.org; Sat, 02 Apr 2022 06:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648879240; x=1680415240;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=FGXYOIBGyxkOJVGHtecPC7zEFJfNNydIgVWk3byuX3U=;
 b=aRLU+qeN6DKKqm6/E7nE+RlXp6sZWIuO3ve4e3OpW2KXjD4M5wAtLS3h
 vpdFycsqWi8loEEDcdGV9nJ+A83H4FqdH+WJMHZEXY7i/RvHYHN2zEJNP
 AcMKY+7Qsxn/53IT3m+NdZ0qtJWDLPqERQhYCyJmNmcCZO7TFellDUTKw
 cKuidrtrUmSYH4HIUGpsORJDw5xrtEIk2wCz5AEwm3UKFOqieCjXYpAvo
 267kqe3aM51GRRnJR3Leie+IYN9L3+/0i1gnRNJw2jBDsv4NEN6dgOAkj
 /HPDO7DXjjnb5twaEsWOb4Nm28/X+Z4v0k117xjCs36otxUhuhygNa8kp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="260267103"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="260267103"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 23:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="504399114"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 01 Apr 2022 23:00:36 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1naWoO-0001mM-24;
 Sat, 02 Apr 2022 06:00:36 +0000
Date: Sat, 02 Apr 2022 14:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 254a25dd444d6ea3932e2121da1307c4c2842fa4
Message-ID: <6247e663.uxQpDMsw9Fmeg9rg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_230040_683667_505462D7 
X-CRM114-Status: UNSURE (   5.06  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 254a25dd444d6ea3932e2121da1307c4c2842fa4  Merge branch 'pending' into master-pending

elapsed time: 953m

configs tested: 108
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
sh                        edosk7760_defconfig
m68k                            mac_defconfig
sh                          r7780mp_defconfig
arm                          simpad_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        cerfcube_defconfig
arc                          axs101_defconfig
powerpc                        cell_defconfig
mips                         bigsur_defconfig
sh                            shmin_defconfig
riscv                            allmodconfig
mips                 decstation_r4k_defconfig
arm                        shmobile_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220331
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
arc                              allyesconfig
nios2                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
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
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220331
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220402
mips                 randconfig-c004-20220402
arm                  randconfig-c002-20220402
s390                 randconfig-c005-20220402
riscv                randconfig-c006-20220402
arm                         mv78xx0_defconfig
arm                           omap1_defconfig
powerpc                   microwatt_defconfig
powerpc                      walnut_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220331
riscv                randconfig-r042-20220331
s390                 randconfig-r044-20220331
hexagon              randconfig-r041-20220331

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
