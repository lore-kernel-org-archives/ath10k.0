Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B71C433EF
	for <ath10k@archiver.kernel.org>; Tue, 18 Jan 2022 03:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KYgIbonvEx20QMDgKlimqQPePHBKkBy5RRamG1glk/w=; b=xrezzKIJ3L3Haz
	E+yhKGXeYnohaz94pL/qrrbW4NitVkfN+iKYOZSNJnzU8QZWUtBd/pHWBSMJg2OAzCLVrbT2Tr6Vx
	XDSoiujVuvkO5BmTZKWZv92Cw41peX1DFp6fobAnFs+ePIGQUW8YgcZw/TsN8fZPv24bzAs8b4pl0
	R7PQagHFRLpvMpvyO3kqFCgRXRbJNnTDXMIUwxWs1l/HCREO5qLBAOdDxXxqZWEkCO74Ykdtw23EX
	eZgQtXQuB3bOZ3d5KoDjEUZ0YXThx72ySXYo9zoFlQRQJi020xiMysvTgAWx4IuPJQuHUPrWCsfJh
	HGVCYQJ9UFWA60ZnOV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9fYt-0002Fq-PD; Tue, 18 Jan 2022 03:53:36 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9f6K-00HQiw-Kq
 for ath10k@lists.infradead.org; Tue, 18 Jan 2022 03:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642476244; x=1674012244;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=M4R7PkElCNAXVK/s2R7QoUm3KFgJvYF2OfLCUx4W0ic=;
 b=iFwGkW/AP1kFfI0WRdGQm9U2WQVF2+sInBBZcaTZ5yPgP6tW66ZLj1UR
 pBKXg2ocf5VPL668mKf6qpRAzBvq56LC0JfN+wKcgA1u2HCfmSQ/AG8Fs
 3OeAA37Q5eni2MqKe3rIPi4DPtI8QwCa87OBE3amw5cYSoY4/kpam+9El
 0oW8UIx0h7HgYZYZVtE7HgicaWAgwKOk5Z9Z+WCb9HK9DtQbfwMJuAI6U
 W4BpCWqEyDd5LlORbqhLiIPGGe1c3v8ydHvwoJCxCwUbKPmhQ17Lfzbl/
 luyldWV2dAiulOlFK+VapteDYw3psdehfC32+AToxXHEuzsEuGR64P/Gz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="269108180"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="269108180"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 19:24:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="474623700"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 17 Jan 2022 19:24:00 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n9f6F-000C6g-9S; Tue, 18 Jan 2022 03:23:59 +0000
Date: Tue, 18 Jan 2022 11:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 7ed59172e3753f2a4d7a39515f1c937ea9edb968
Message-ID: <61e632b2.YMz+enzLHU2UOTqZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_192404_791018_9CFBCDE4 
X-CRM114-Status: UNSURE (   7.26  )
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
branch HEAD: 7ed59172e3753f2a4d7a39515f1c937ea9edb968  Add localversion-wireless-testing-ath

elapsed time: 725m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220118
i386                 randconfig-c001-20220117
powerpc              randconfig-c003-20220117
powerpc                     redwood_defconfig
arm64                            alldefconfig
arm                      integrator_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm8548_defconfig
arm                        oxnas_v6_defconfig
arm                         lubbock_defconfig
powerpc                 mpc837x_mds_defconfig
mips                 decstation_r4k_defconfig
powerpc                      makalu_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                         db1xxx_defconfig
arm                            hisi_defconfig
xtensa                  audio_kc705_defconfig
sh                            migor_defconfig
sh                           se7722_defconfig
sh                          sdk7786_defconfig
arm                           tegra_defconfig
arm                        mini2440_defconfig
arc                        nsimosci_defconfig
powerpc                  iss476-smp_defconfig
arm                      jornada720_defconfig
s390                          debug_defconfig
sh                          polaris_defconfig
sh                         ap325rxa_defconfig
sh                             shx3_defconfig
xtensa                         virt_defconfig
arm                      footbridge_defconfig
m68k                       m5275evb_defconfig
arm                             ezx_defconfig
mips                             allmodconfig
powerpc                mpc7448_hpc2_defconfig
arm                             pxa_defconfig
m68k                       m5208evb_defconfig
arm                        spear6xx_defconfig
arc                     haps_hs_smp_defconfig
arm                         s3c6400_defconfig
m68k                        mvme16x_defconfig
sh                          r7785rp_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
sparc                            allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
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
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
i386                          randconfig-c001
mips                 randconfig-c004-20220116
s390                 randconfig-c005-20220116
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
