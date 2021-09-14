Return-Path: <SRS0=ou23=OE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA66EC433F5
	for <ath10k@archiver.kernel.org>; Tue, 14 Sep 2021 02:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C61F60F92
	for <ath10k@archiver.kernel.org>; Tue, 14 Sep 2021 02:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C61F60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vYVw0fTuX8HXkKyvhmxbfk2Tipc6KQtKNgkmT0eYljY=; b=tJ+gtgi/1hmhew
	zotyfwz8vFXp3Ys3y6hIn/ogXVDZc/G+9Zo+RmTt7nQk70gV/QqvUVKlV2ym1T3Q00obbFzX4PgxY
	N4mjrd0IpqhqExoC9MENsjEg1Iuyusy0XCp96s88sg5FUMWAWQ+pIRxa6eEKr5z3mYPDvl0RcPVFG
	3yh/RAjggzJPWWcX74gUmAhmIGSI+IarK3zdWPjZu6IFMU2OpKd1OCmB9Ub+hBa/MNYN2/w+8NErP
	HI3/WK54JhFIk7FCxS/5D/cFnLav24LjtH6oPF1mXW1no9SexSipO8s96sR7KLf44jEfv74p/vC3k
	S6Qd/eFyzs4F3SwJUpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPyY7-00405X-Gp; Tue, 14 Sep 2021 02:51:55 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPyY3-00405E-Mh
 for ath10k@lists.infradead.org; Tue, 14 Sep 2021 02:51:53 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="282857563"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="282857563"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 19:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="650589987"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 13 Sep 2021 19:51:49 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mPyY0-00086Z-H5; Tue, 14 Sep 2021 02:51:48 +0000
Date: Tue, 14 Sep 2021 10:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master] BUILD SUCCESS 698a8e8a27e19a7fac9e9f354159c54c9d2e904b
Message-ID: <61400e0e.ZJe+TcV40cYF9LO8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_195151_847776_20BD26DB 
X-CRM114-Status: UNSURE (   4.62  )
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
branch HEAD: 698a8e8a27e19a7fac9e9f354159c54c9d2e904b  Revert "bus: mhi: Early MHI resume failure in non M3 state"

elapsed time: 726m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210913
powerpc                   motionpro_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        m5307c3_defconfig
powerpc                      ppc6xx_defconfig
arm                       aspeed_g4_defconfig
m68k                            q40_defconfig
arm                        keystone_defconfig
powerpc                 canyonlands_defconfig
mips                            e55_defconfig
mips                     loongson1b_defconfig
powerpc                     taishan_defconfig
arm                         s3c2410_defconfig
arm                            mps2_defconfig
xtensa                  cadence_csp_defconfig
arm                     davinci_all_defconfig
powerpc                     redwood_defconfig
arm                       netwinder_defconfig
powerpc                        cell_defconfig
mips                      maltasmvp_defconfig
xtensa                         virt_defconfig
sparc64                          alldefconfig
xtensa                          iss_defconfig
openrisc                    or1ksim_defconfig
sh                          kfr2r09_defconfig
powerpc                 linkstation_defconfig
mips                         bigsur_defconfig
mips                        maltaup_defconfig
arc                        nsim_700_defconfig
arm                             mxs_defconfig
powerpc                  iss476-smp_defconfig
arm                         bcm2835_defconfig
m68k                          atari_defconfig
sh                   secureedge5410_defconfig
sh                           se7721_defconfig
arm                       aspeed_g5_defconfig
riscv                    nommu_virt_defconfig
xtensa                  audio_kc705_defconfig
alpha                               defconfig
s390                             alldefconfig
h8300                            allyesconfig
arm                        neponset_defconfig
powerpc                     stx_gp3_defconfig
arm                           viper_defconfig
mips                         cobalt_defconfig
sh                        edosk7705_defconfig
x86_64               randconfig-c001-20210913
arm                  randconfig-c002-20210913
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
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20210913
x86_64               randconfig-a003-20210913
x86_64               randconfig-a006-20210913
x86_64               randconfig-a004-20210913
x86_64               randconfig-a005-20210913
x86_64               randconfig-a001-20210913
i386                 randconfig-a004-20210913
i386                 randconfig-a005-20210913
i386                 randconfig-a002-20210913
i386                 randconfig-a006-20210913
i386                 randconfig-a003-20210913
i386                 randconfig-a001-20210913
arc                  randconfig-r043-20210913
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20210913
x86_64               randconfig-c007-20210913
mips                 randconfig-c004-20210913
powerpc              randconfig-c003-20210913
i386                 randconfig-c001-20210913
arm                  randconfig-c002-20210913
s390                 randconfig-c005-20210913
x86_64               randconfig-a016-20210913
x86_64               randconfig-a013-20210913
x86_64               randconfig-a012-20210913
x86_64               randconfig-a011-20210913
x86_64               randconfig-a014-20210913
x86_64               randconfig-a015-20210913
i386                 randconfig-a016-20210913
i386                 randconfig-a011-20210913
i386                 randconfig-a015-20210913
i386                 randconfig-a012-20210913
i386                 randconfig-a013-20210913
i386                 randconfig-a014-20210913
riscv                randconfig-r042-20210913
hexagon              randconfig-r045-20210913
s390                 randconfig-r044-20210913
hexagon              randconfig-r041-20210913

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
