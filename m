Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FA0C433EF
	for <ath10k@archiver.kernel.org>; Thu, 17 Mar 2022 06:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OyGEb91zft+1xQI3WPwZQUNahG6Jt8iSq4SRuX2wltQ=; b=3Oot/medmQCvWv
	L2CDYbRm1eom1jrBUXpVU3mk037Kd/FjO9N/RvIWKbtbUGEJt3Bf3OQeCzUaYsAC23U0ZN4MjY6rQ
	5IOMs+eyBsphX+/QhLuGTyaKkclQ9PD7WtRSFeXpP8FQxXgQgHvnDavfPbT/JreKM+0Ud81dKl0OS
	xuht5zpM/Sfeq3oOe3Nh7Uj+dmLM+IKk9EyKS6M4HYYsMhLv/d9As1Bplu5m7d5OcNPR99pmlpSyL
	trFsEtI6NQHmwaSPvjVWhwlQDV2p9HRQ9R1c6xZ30M0n+gp5RqoUIP9ICOPfZsIMEC1JEYwE0gwMV
	WiKN8V4v75RDWflYXqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUjbT-00F4TD-RS; Thu, 17 Mar 2022 06:27:19 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUjbR-00F4Ss-4i
 for ath10k@lists.infradead.org; Thu, 17 Mar 2022 06:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647498437; x=1679034437;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=4qZ2iUVCD6KxBaiNE35EqaogYLSSbKSpVVFW/hlUAto=;
 b=VpYzrhNJZx/s8B7y6poPNdtdAP/vPRxtehXE40NPDP86kxvxgDLPMqTY
 LIuYS7bhNv4dgbGU5Nu8KZOTGIRzQ2oc6jeMPeACn3xtw7l6nSgXyF5dZ
 9BWz18OCtJMOXIHiO7coGDto6IQnXcjUfjKTqo9CG8eSmuXuICSNuI5hY
 QeDgueLAYyJQD49vGlM0U9QavIQc1InUnImeECl/TKm6URiv4/1hJeWzY
 6ZZhPfLbWzdpObaL9hP/lbbZJYjKbtTITun3l3ge8KqFBOZJnE62l6sy1
 y43Ks31UAXF/Nu8kCLmQnphQinHxIjFbz/a3MlW69diYdtdNQKMowMlAS w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="254351670"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254351670"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 23:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="557798984"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 16 Mar 2022 23:27:14 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUjbN-000DNQ-Fl; Thu, 17 Mar 2022 06:27:13 +0000
Date: Thu, 17 Mar 2022 14:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 da8b7f02ca1cf1d7d90bb03b487398989b1dbde6
Message-ID: <6232d4a0.HjiPRq8TwHwDIGwQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_232717_242614_C317C11A 
X-CRM114-Status: UNSURE (   5.20  )
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
branch HEAD: da8b7f02ca1cf1d7d90bb03b487398989b1dbde6  Add localversion-wireless-testing-ath

elapsed time: 789m

configs tested: 169
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
arm                         at91_dt_defconfig
arc                      axs103_smp_defconfig
arm                      footbridge_defconfig
arm                        oxnas_v6_defconfig
mips                       bmips_be_defconfig
mips                           ci20_defconfig
sh                         ecovec24_defconfig
powerpc                  storcenter_defconfig
sh                           sh2007_defconfig
h8300                       h8s-sim_defconfig
sh                               alldefconfig
powerpc                      arches_defconfig
sh                           se7343_defconfig
powerpc                     stx_gp3_defconfig
sh                         ap325rxa_defconfig
arm                           h3600_defconfig
arm                            lart_defconfig
powerpc                         wii_defconfig
h8300                            alldefconfig
arm                         nhk8815_defconfig
alpha                               defconfig
xtensa                           alldefconfig
powerpc                     ep8248e_defconfig
sh                              ul2_defconfig
parisc                generic-64bit_defconfig
powerpc                     tqm8541_defconfig
powerpc                     tqm8555_defconfig
h8300                               defconfig
sh                          urquell_defconfig
sh                          sdk7780_defconfig
powerpc                      ppc40x_defconfig
arm                         lubbock_defconfig
sh                             shx3_defconfig
sh                   secureedge5410_defconfig
arm                            xcep_defconfig
mips                           ip32_defconfig
sh                        edosk7705_defconfig
nds32                             allnoconfig
alpha                            alldefconfig
arm                           stm32_defconfig
arm                        cerfcube_defconfig
sh                        dreamcast_defconfig
arm                      jornada720_defconfig
arm                        mvebu_v7_defconfig
xtensa                    smp_lx200_defconfig
powerpc                     asp8347_defconfig
arc                                 defconfig
powerpc                     taishan_defconfig
sh                        sh7757lcr_defconfig
arm                  randconfig-c002-20220317
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a006-20220314
x86_64               randconfig-a001-20220314
arc                  randconfig-r043-20220313
arc                  randconfig-r043-20220314
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
arc                  randconfig-r043-20220317
riscv                randconfig-r042-20220317
s390                 randconfig-r044-20220317
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                    mvme5100_defconfig
mips                            e55_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                     pseries_defconfig
powerpc                     kilauea_defconfig
powerpc                      pmac32_defconfig
mips                        maltaup_defconfig
mips                           mtx1_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220313
hexagon              randconfig-r041-20220313
hexagon              randconfig-r045-20220314
riscv                randconfig-r042-20220314
hexagon              randconfig-r041-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
