Return-Path: <SRS0=M+pE=NT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775FFC432BE
	for <ath10k@archiver.kernel.org>; Sat, 28 Aug 2021 02:49:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A51660F45
	for <ath10k@archiver.kernel.org>; Sat, 28 Aug 2021 02:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A51660F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d5S7ypaJrh0E7LDQgLjsO0DZkLqG7Ne08qft1eF1eHw=; b=ccsoh01aV+qoLI
	Yum/TXTPI+/365sVUeDtutDLBkXhcJQfJZRcx9e59g3wKvAclwH6vjV3X0B11hHXPzp/JhEMXPO5a
	PfSmvcf4Xm0+o3hGx3jXExGsdQRMuMUpy0CLgwXBq2jcjg3kuDCFKBM4c8ul3ipU+tIYuoe+P+ZUw
	tRZbAUNsry5Yl7Qk7idj1uywkNsH62ZW04Cd14yGceDatWXewh+ifORoHAbG/fMecymMGHgjsZxrx
	+7a50/jHTdVErYqTNJ8UdmC+6X1SNpM0G/ILVhwVoREtvjydaFFpQnf8mMk1UlE6/mZbKKslKF3C1
	WjsPqB/I9eZwVlmK41Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJoOM-00Dde3-2Z; Sat, 28 Aug 2021 02:48:22 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJoOF-00Dddk-LQ
 for ath10k@lists.infradead.org; Sat, 28 Aug 2021 02:48:19 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="217777871"
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="217777871"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 19:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="685792374"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 27 Aug 2021 19:48:11 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mJoOA-00035T-OG; Sat, 28 Aug 2021 02:48:10 +0000
Date: Sat, 28 Aug 2021 10:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:pending] BUILD SUCCESS
 f82fd38aaec373235b6174b90fbec2c73e46e98d
Message-ID: <6129a3ca.v0pbydIFiowEtLzM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_194815_776755_819906F0 
X-CRM114-Status: UNSURE (   4.46  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: f82fd38aaec373235b6174b90fbec2c73e46e98d  ath6kl: wmi: fix an error code in ath6kl_wmi_sync_point()

elapsed time: 754m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                            hsdk_defconfig
arm                         lpc32xx_defconfig
sh                           sh2007_defconfig
powerpc                      tqm8xx_defconfig
arm                         at91_dt_defconfig
mips                     loongson1b_defconfig
arm                         s5pv210_defconfig
xtensa                           alldefconfig
sh                        edosk7705_defconfig
arm                        spear6xx_defconfig
mips                         db1xxx_defconfig
arm                         vf610m4_defconfig
m68k                        m5272c3_defconfig
xtensa                              defconfig
um                                  defconfig
arm                         lpc18xx_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        vexpress_defconfig
powerpc                      ppc44x_defconfig
arm                         bcm2835_defconfig
powerpc                      ppc6xx_defconfig
sh                           se7343_defconfig
arm                         nhk8815_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
x86_64                            allnoconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a014-20210827
x86_64               randconfig-a015-20210827
x86_64               randconfig-a016-20210827
x86_64               randconfig-a013-20210827
x86_64               randconfig-a012-20210827
x86_64               randconfig-a011-20210827
i386                 randconfig-a011-20210827
i386                 randconfig-a016-20210827
i386                 randconfig-a012-20210827
i386                 randconfig-a014-20210827
i386                 randconfig-a013-20210827
i386                 randconfig-a015-20210827
arc                  randconfig-r043-20210827
riscv                randconfig-r042-20210827
s390                 randconfig-r044-20210827
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20210827
x86_64               randconfig-a001-20210827
x86_64               randconfig-a006-20210827
x86_64               randconfig-a003-20210827
x86_64               randconfig-a004-20210827
x86_64               randconfig-a002-20210827
i386                 randconfig-a006-20210827
i386                 randconfig-a001-20210827
i386                 randconfig-a002-20210827
i386                 randconfig-a005-20210827
i386                 randconfig-a004-20210827
i386                 randconfig-a003-20210827

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
