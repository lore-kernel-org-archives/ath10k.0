Return-Path: <SRS0=uksI=HU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52530C433DB
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 05:46:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E45FD64D99
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 05:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E45FD64D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QOdwyvUjR39t8pVyUf4y57+ON0H7IOjm8JkyO8nt828=; b=TtNw5c/ryPgeJmvzRKNeV5lzX+
	T0pSWeFpr8wOX7xkXz6k7id3oCzhty7x7Qw6pJpt5s2Il7o2fAvWyGy6wmM5q22KdvvfXGWhwha0Z
	ZyqWm8ySEVsTCVpEMyx/y+Dz3zZcWQqPhO1HKuP5OG6WLTpG/PqazVrlDhdWVYXutK3BI+LfUo06C
	8HQ+2J5RKn7rqRfs0iy5OBFmWz14/KjieMjLE/PSNroN69dCzahkrKkmBpGyf+bak74JYzV7RQ6tN
	BLvKI0t4Ui8i/6V+/fIOhfZs9R5DZi2L8Ixjf9DWVChXVQBWCKqAMbuhJalTrIyl83IgaejGAeBHn
	kaCUHgqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCc8n-0003h5-US; Thu, 18 Feb 2021 05:46:17 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCc8j-0003ex-Cp
 for ath10k@lists.infradead.org; Thu, 18 Feb 2021 05:46:14 +0000
IronPort-SDR: WR9ktD8KQ3F8XTmZvZRMWwjnqHRDznr8OuoEX80lTLpFOy+50NKlAs3kmKTtpRQ9Y7nnK/JPw/
 Ke0j16M3NEow==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="244867369"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="244867369"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:46:10 -0800
IronPort-SDR: x/bx7LCiS6QbZDxuK+01TTihe1txqAdL4Ht9YyVsQKnjSNVhcMACZ8U4ieaCGyRwkk5b7xAKrt
 q8MKbCLVFW9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="385737018"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2021 21:46:08 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lCc8d-0009U5-M3; Thu, 18 Feb 2021 05:46:07 +0000
Date: Thu, 18 Feb 2021 13:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master] BUILD SUCCESS 54b094b72009a0f478dcb99f75d241e65f8d66ac
Message-ID: <602dff03.MwUYWBEbccJEaBAQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_004613_632997_9232FE5D 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 54b094b72009a0f478dcb99f75d241e65f8d66ac  Add localversion-wireless-testing-ath

elapsed time: 722m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm                        multi_v5_defconfig
arm                            u300_defconfig
powerpc                        icon_defconfig
mips                  maltasmvp_eva_defconfig
arm                          prima2_defconfig
mips                           xway_defconfig
mips                           ip28_defconfig
arm                         axm55xx_defconfig
arm                            lart_defconfig
mips                       capcella_defconfig
arm                      footbridge_defconfig
powerpc                     mpc83xx_defconfig
sh                           se7206_defconfig
sh                         ap325rxa_defconfig
powerpc                    amigaone_defconfig
arm                          badge4_defconfig
arc                         haps_hs_defconfig
x86_64                           alldefconfig
arc                        nsim_700_defconfig
sh                        apsh4ad0a_defconfig
powerpc                         wii_defconfig
powerpc                     mpc512x_defconfig
arc                        vdk_hs38_defconfig
xtensa                  nommu_kc705_defconfig
arm                       imx_v4_v5_defconfig
arm                     eseries_pxa_defconfig
parisc                generic-64bit_defconfig
arm                           omap1_defconfig
powerpc                     sbc8548_defconfig
nios2                               defconfig
sh                         microdev_defconfig
arm                        cerfcube_defconfig
arm                          exynos_defconfig
ia64                      gensparse_defconfig
mips                           ip27_defconfig
powerpc                 xes_mpc85xx_defconfig
xtensa                           alldefconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc8315_rdb_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210217
i386                 randconfig-a005-20210217
i386                 randconfig-a002-20210217
i386                 randconfig-a006-20210217
i386                 randconfig-a001-20210217
i386                 randconfig-a004-20210217
x86_64               randconfig-a013-20210217
x86_64               randconfig-a016-20210217
x86_64               randconfig-a012-20210217
x86_64               randconfig-a015-20210217
x86_64               randconfig-a014-20210217
x86_64               randconfig-a011-20210217
i386                 randconfig-a016-20210217
i386                 randconfig-a014-20210217
i386                 randconfig-a012-20210217
i386                 randconfig-a013-20210217
i386                 randconfig-a011-20210217
i386                 randconfig-a015-20210217
i386                 randconfig-a016-20210216
i386                 randconfig-a014-20210216
i386                 randconfig-a012-20210216
i386                 randconfig-a013-20210216
i386                 randconfig-a011-20210216
i386                 randconfig-a015-20210216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210215
x86_64               randconfig-a002-20210215
x86_64               randconfig-a001-20210215
x86_64               randconfig-a004-20210215
x86_64               randconfig-a005-20210215
x86_64               randconfig-a006-20210215
x86_64               randconfig-a003-20210217
x86_64               randconfig-a002-20210217
x86_64               randconfig-a004-20210217
x86_64               randconfig-a001-20210217
x86_64               randconfig-a005-20210217
x86_64               randconfig-a006-20210217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
