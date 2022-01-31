Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FCFC433EF
	for <ath10k@archiver.kernel.org>; Mon, 31 Jan 2022 21:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jFcLWOlmmWCxMsIMXCIUqyh9qN6HCgAuBQgJqxzixYI=; b=I004IV29Dmz7fn
	CLx5rz8wNAX4sm7RLwIyVrvP3Y8ahbRZ7eDagaEwFe7F415XASCO3K8hsk/8oOc3mKi61GEzP+aUI
	BFHwKkHTDML1E5bR+ny6BRVUFXW4ygUFj4p7jaF5JUV7LNaIpupQfiocZkQGAxWXATcksWWCGBtfT
	IIictzdHVZ7VvjdsjTF+Ptz9zg1LfW6i5S3F77EoMSAXN0O5+h71ldBS1JLnht7h5tK5/W9sSzfbA
	AOuN7q8vyaGe/tB4HTTRxAMSiS4xcnClcZDs5xVtOlQI8yWcAJpM6jZ0HP2d25BL41XQmcq0d371H
	jgDkGCJbyzh2YOeYZk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEeO1-00AgCT-Sd; Mon, 31 Jan 2022 21:38:57 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEeNx-00AgBK-U9
 for ath10k@lists.infradead.org; Mon, 31 Jan 2022 21:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643665133; x=1675201133;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=/P6y21Iq735NTJvtpO+JO18nipyhxZHAjvTHExLPV/M=;
 b=ITk2Tf249xFWASO50AEw8FB/Vb2WjJlwD2YZ2pQOH5L0l1Gg5BjS4hj4
 ZHfcNS+rmFWaAznsnlW/X90yLv7aPxwoMIfw7wvR2dsZMb0k7akQGckuG
 CutyY7vsMxfucvMa5XProVjBD/rw0mFB8YKZRaPsORV9Xe3lU//vqAidm
 FLwoRYSBpVATgRcVlDDIG/MTXzDzw2mjfrlCwRLLuC2rn/qVbLZ7ErOGV
 b2bDJeBJrn3XDtRDRL4qQjv0qfjue7JxCENAtnUyirnzY8CmQRYUIYDep
 en767B+32te3sMgOgH5+ff82anFcqmNRCiOUTHoT1p/evrJ98/orh2FZc Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="310864653"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="310864653"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 13:38:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="768724891"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2022 13:38:49 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nEeNt-000SM4-65; Mon, 31 Jan 2022 21:38:49 +0000
Date: Tue, 01 Feb 2022 05:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 26438bd5e36d6c4f7f6cd1641b4c40ff2dcd369a
Message-ID: <61f856b2.jmX0Mu2cc5FGRu+D%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_133854_054232_8C3B497F 
X-CRM114-Status: UNSURE (   4.70  )
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
branch HEAD: 26438bd5e36d6c4f7f6cd1641b4c40ff2dcd369a  ath11k: add register read debugfs interface for WCN6855

elapsed time: 729m

configs tested: 170
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
i386                          randconfig-c001
arc                                 defconfig
arm                           u8500_defconfig
ia64                         bigsur_defconfig
arm                          simpad_defconfig
sh                          rsk7203_defconfig
mips                           xway_defconfig
um                               alldefconfig
powerpc                 mpc834x_mds_defconfig
sh                          urquell_defconfig
arm                       imx_v6_v7_defconfig
arc                            hsdk_defconfig
powerpc                     taishan_defconfig
mips                             allmodconfig
arm                           stm32_defconfig
h8300                               defconfig
sh                        edosk7705_defconfig
sh                 kfr2r09-romimage_defconfig
arm                        spear6xx_defconfig
mips                       capcella_defconfig
sh                          polaris_defconfig
arm                     eseries_pxa_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                       m5208evb_defconfig
powerpc                  storcenter_defconfig
arm                          pxa3xx_defconfig
nds32                               defconfig
powerpc                      mgcoge_defconfig
m68k                        m5272c3_defconfig
powerpc64                        alldefconfig
arc                      axs103_smp_defconfig
arm                           sama5_defconfig
arm                            xcep_defconfig
powerpc                 linkstation_defconfig
m68k                        mvme147_defconfig
xtensa                         virt_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                         cobalt_defconfig
m68k                       m5475evb_defconfig
parisc                           alldefconfig
mips                         bigsur_defconfig
mips                            gpr_defconfig
mips                        vocore2_defconfig
powerpc                     redwood_defconfig
sh                            hp6xx_defconfig
sh                          kfr2r09_defconfig
sh                           se7724_defconfig
ia64                        generic_defconfig
sh                           se7343_defconfig
sh                             shx3_defconfig
sh                           se7722_defconfig
powerpc                        warp_defconfig
sh                          lboxre2_defconfig
powerpc                       ppc64_defconfig
sparc                       sparc32_defconfig
sh                            migor_defconfig
sh                        sh7757lcr_defconfig
xtensa                           allyesconfig
sh                        edosk7760_defconfig
x86_64                           alldefconfig
xtensa                  nommu_kc705_defconfig
powerpc                       maple_defconfig
powerpc                     pq2fads_defconfig
powerpc                      bamboo_defconfig
powerpc                 mpc837x_mds_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
h8300                            allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220131
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
s390                 randconfig-c005-20220130
i386                          randconfig-c001
riscv                randconfig-c006-20220130
mips                     loongson2k_defconfig
powerpc               mpc834x_itxgp_defconfig
riscv                             allnoconfig
arm                         palmz72_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                          allyesconfig
arm                             mxs_defconfig
arm                        spear3xx_defconfig
x86_64                           allyesconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                   bluestone_defconfig
powerpc                      ppc44x_defconfig
powerpc                    ge_imp3a_defconfig
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220130
hexagon              randconfig-r041-20220131
s390                 randconfig-r044-20220131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
