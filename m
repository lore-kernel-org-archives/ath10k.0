Return-Path: <SRS0=uksI=HU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07992C433E9
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 05:47:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D1564D99
	for <ath10k@archiver.kernel.org>; Thu, 18 Feb 2021 05:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D1564D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7wP/+sh7qtrNTfAnWq1RS0301rbQiWgdtzsGhLW5Mik=; b=3hWO3PPHmyCgX5dZFVu6XfkOxl
	mOwssXctc2o9DLu3p8DpcvyX6LJ9mF/c0h5t5QSDW5vQZB1bvaV3+4R5nxtHjR6V2arcgOsT0Ju6V
	G36FbFK01yFz7DrYLY4NuRPJMKK3PQF90SM1p967SE5//Ka3KK3o1gZ7MeUusbHRmn6B0db2QmjCc
	EMwUcPSOyiuWzho26fnYk1NDkuSTnQRJD6UXeNn3i7QkgcxgWCpwhzNugh5/3p62bD9W4n2UJcqcU
	OYzbnDilq1p3SkFcNEt1tu85U9em3Jyx6z3Lo0BeEFBsInPtpZDG/X+O3dLoZaMUfwv75A3K3Qe6r
	JgHXbx4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCc8p-0003hd-KM; Thu, 18 Feb 2021 05:46:19 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCc8l-0003fx-Hs
 for ath10k@lists.infradead.org; Thu, 18 Feb 2021 05:46:16 +0000
IronPort-SDR: pUe6ZjRJctT9Z+cMu5SvVaXBA80wESK5cLq/AMGG+c/95Ye3U31q8Dqa2fg8YnkXN93IqKCVgt
 323dZ+UobrVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="247477806"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="247477806"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 21:46:10 -0800
IronPort-SDR: UN+RbKjhhTkdY80XihycuqYdJB75tVNk3f6jr2L7KVtYOH8ZLSzX12Gma6n37hGlsF955fBiBm
 QS+n5DgQ4w0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="427860135"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2021 21:46:09 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lCc8e-0009UB-KZ; Thu, 18 Feb 2021 05:46:08 +0000
Date: Thu, 18 Feb 2021 13:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 5716b903d2218b96a22425e778d6de849190bc2c
Message-ID: <602dff09.ztgxGPKgE9vtpk84%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_004615_803308_CA694246 
X-CRM114-Status: UNSURE (   7.38  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 5716b903d2218b96a22425e778d6de849190bc2c  Merge branch 'ath-next' into ath-qca

elapsed time: 722m

configs tested: 117
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                  maltasmvp_eva_defconfig
arm                          prima2_defconfig
mips                           xway_defconfig
mips                           ip28_defconfig
arm                         axm55xx_defconfig
arm                            lart_defconfig
mips                       capcella_defconfig
arm                      footbridge_defconfig
powerpc                     mpc83xx_defconfig
arc                         haps_hs_defconfig
x86_64                           alldefconfig
arc                        nsim_700_defconfig
sh                        apsh4ad0a_defconfig
powerpc                         wii_defconfig
powerpc                     mpc512x_defconfig
h8300                       h8s-sim_defconfig
arm                       cns3420vb_defconfig
sh                           se7343_defconfig
riscv                             allnoconfig
arm                            dove_defconfig
arm                          pxa168_defconfig
arm                       imx_v4_v5_defconfig
arm                     eseries_pxa_defconfig
parisc                generic-64bit_defconfig
arm                           omap1_defconfig
powerpc                     sbc8548_defconfig
xtensa                    xip_kc705_defconfig
m68k                        m5307c3_defconfig
m68k                        m5407c3_defconfig
arm                             rpc_defconfig
sh                           sh2007_defconfig
nios2                               defconfig
sh                         microdev_defconfig
arm                        cerfcube_defconfig
arm                          exynos_defconfig
ia64                      gensparse_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
