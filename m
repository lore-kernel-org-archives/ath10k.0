Return-Path: <SRS0=uksI=HU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEA0C433E0
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 22:11:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B3264E77
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 22:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5B3264E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JKQ79T4nplKbrynjIZyQmyQIIMwJ1PRXh0ZFjisW8dI=; b=goBGj+16x7V4tOVSlNcbLVjolq
	rrkIX+0PcqyPVdJmKJAUd0KdQ6Y0anB/oZ/j10PwnCEND71r7NE6btn5Vj8uYs5Y2EoNPshUgPtUK
	JbWsD5rEyFpzxlC67CXS7yY/LTo2ZmzloB0IwKrUPvnsJxKPINM0m4SHeJgaoAP5gWC/n5+iap578
	Y2iio4H9TU36wksewZ9UoSelmzbwH6iUiplwX6WtMfbqQYGEs2J4hz8Y7ctsVZHq/5v6XqI8kUofV
	XZGP9ZnLVrF2JrXTFmvDV6jCx+IKpKG/JUpk9Jw8DULUsAF5lNdtVzAJXyqYXASoB5xXLX7PaCPe8
	AZsDyOqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCrV1-00021L-L6; Thu, 18 Feb 2021 22:10:15 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCrUx-0001zi-0l
 for ath10k@lists.infradead.org; Thu, 18 Feb 2021 22:10:12 +0000
IronPort-SDR: i5HVOWuYftNtQIXHg1UJXHw+drGpqIx/e5H93gqpyZwpZuecTZS9d00yJqT1m3r/QC6adNr0+X
 2afjE5CLRTrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="171340366"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="171340366"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:10:09 -0800
IronPort-SDR: 5VlQD5A9cpvY/zg+oO8RbI1T4UhznOuvkSrHLPKPegWZtfyudJ7nYSDO3hDyUHBAcEze9yOcVI
 29fHnpNQFWzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364987313"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 18 Feb 2021 14:10:07 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lCrUt-0009vQ-6U; Thu, 18 Feb 2021 22:10:07 +0000
Date: Fri, 19 Feb 2021 06:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 160e4e3f5cf220ca4566d3c2d236c91b00917eda
Message-ID: <602ee5a9.KCSxplpaZtfFjkIv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_171011_342464_F58C9256 
X-CRM114-Status: UNSURE (   6.04  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 160e4e3f5cf220ca4566d3c2d236c91b00917eda  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 144
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     asp8347_defconfig
arm                        keystone_defconfig
mips                         mpc30x_defconfig
mips                        bcm47xx_defconfig
arm                        trizeps4_defconfig
powerpc                  iss476-smp_defconfig
arc                          axs101_defconfig
mips                             allyesconfig
sh                             espt_defconfig
arm                        realview_defconfig
powerpc                     tqm8548_defconfig
mips                            e55_defconfig
arm                         cm_x300_defconfig
c6x                                 defconfig
sh                ecovec24-romimage_defconfig
arm                         lubbock_defconfig
powerpc                      pasemi_defconfig
m68k                        m5407c3_defconfig
mips                          rm200_defconfig
arm                            dove_defconfig
arm                        spear3xx_defconfig
sh                          lboxre2_defconfig
sh                          polaris_defconfig
arm                            lart_defconfig
powerpc                     rainier_defconfig
arm                        cerfcube_defconfig
arm                         lpc32xx_defconfig
arm                         s3c2410_defconfig
arm                       imx_v4_v5_defconfig
arm                     eseries_pxa_defconfig
mips                           xway_defconfig
parisc                generic-64bit_defconfig
arm                           omap1_defconfig
powerpc                     sbc8548_defconfig
arm                          pxa3xx_defconfig
m68k                       m5208evb_defconfig
mips                      pic32mzda_defconfig
sparc                       sparc64_defconfig
powerpc                      katmai_defconfig
powerpc                      acadia_defconfig
xtensa                    xip_kc705_defconfig
m68k                        m5307c3_defconfig
arm                             rpc_defconfig
sh                           sh2007_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210218
x86_64               randconfig-a001-20210218
x86_64               randconfig-a004-20210218
x86_64               randconfig-a002-20210218
x86_64               randconfig-a005-20210218
x86_64               randconfig-a006-20210218
i386                 randconfig-a003-20210217
i386                 randconfig-a005-20210217
i386                 randconfig-a002-20210217
i386                 randconfig-a006-20210217
i386                 randconfig-a001-20210217
i386                 randconfig-a004-20210217
i386                 randconfig-a005-20210218
i386                 randconfig-a003-20210218
i386                 randconfig-a002-20210218
i386                 randconfig-a004-20210218
i386                 randconfig-a001-20210218
i386                 randconfig-a006-20210218
x86_64               randconfig-a013-20210217
x86_64               randconfig-a016-20210217
x86_64               randconfig-a012-20210217
x86_64               randconfig-a015-20210217
x86_64               randconfig-a014-20210217
x86_64               randconfig-a011-20210217
i386                 randconfig-a016-20210218
i386                 randconfig-a012-20210218
i386                 randconfig-a014-20210218
i386                 randconfig-a013-20210218
i386                 randconfig-a011-20210218
i386                 randconfig-a015-20210218
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
x86_64               randconfig-a013-20210216
x86_64               randconfig-a016-20210216
x86_64               randconfig-a012-20210216
x86_64               randconfig-a015-20210216
x86_64               randconfig-a014-20210216
x86_64               randconfig-a011-20210216
x86_64               randconfig-a012-20210218
x86_64               randconfig-a016-20210218
x86_64               randconfig-a013-20210218
x86_64               randconfig-a015-20210218
x86_64               randconfig-a011-20210218
x86_64               randconfig-a014-20210218

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
