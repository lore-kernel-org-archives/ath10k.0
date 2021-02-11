Return-Path: <SRS0=C/UJ=HN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4552C433E9
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 21:03:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6961664E3C
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 21:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6961664E3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SY3KLBQCui4NPz/KFif58mwKFh85AURBBE9kiwJ8r2o=; b=AHchToBvYbvU2bQM1nkRtwMbqg
	w3Z0MQcXTeesxlpRno2Z4sUo6GKMV2WFXOSpYEBRBHqkdNFXCyii0k5iuAxvFrT2LzLwBhZm4ZbCs
	CmWqc5OEYK/iJpuHYNm4tMuc8/Cu0W6/FHXIdVmyALH2m2Ot8MSO/9WlDp2Nf780PgRTYCEcI0y6p
	7RqBK9uiS2AhDScoAVAQzyjL0ASmsVO4ReNSEYSNBKLdCI+OKmum50XdKz1oLhczKUfZR0IARaYwu
	NDwgotCgBbZ3mCAyLaAAkICZKpCll3HpvZmVBulWdgro6XgB8g11ddAJYM0MfU9Of5BK3W2od6/D8
	3wpgffxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAJ7a-0003Oe-CW; Thu, 11 Feb 2021 21:03:30 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAJ7Y-0003Nh-FW
 for ath10k@lists.infradead.org; Thu, 11 Feb 2021 21:03:29 +0000
IronPort-SDR: UjzzwC7yIHI5f1KY4zN7uEm+C3jhH+n80r1Qm6kPhUDhooOH64+zxYmNEmkJh6MiR1Se8AQlmm
 rpJd7Xc92Ltg==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="267160355"
X-IronPort-AV: E=Sophos;i="5.81,171,1610438400"; d="scan'208";a="267160355"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2021 13:03:22 -0800
IronPort-SDR: 6vQ34LYjDd7yPFKKFYy2KTH8l66HUfWfV1IZ/uSU/CEOXPMRw9Zz1SzN+puMFBjKi+Ar9YPHk+
 ZCnHxG7e/oWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,171,1610438400"; d="scan'208";a="415581684"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 11 Feb 2021 13:03:17 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lAJ7K-000464-NW; Thu, 11 Feb 2021 21:03:14 +0000
Date: Fri, 12 Feb 2021 05:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 83bae26532ca7318c1308fd80434e1e420bcf407
Message-ID: <60259b89.Nk4o6HIY0RVbYle/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_160328_738688_A7E42C51 
X-CRM114-Status: UNSURE (   7.89  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 83bae26532ca7318c1308fd80434e1e420bcf407  ath10k: change ath10k_offchan_tx_work() peer present msg to a warn

elapsed time: 721m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
sh                          rsk7203_defconfig
sparc                               defconfig
mips                      bmips_stb_defconfig
arm                              alldefconfig
powerpc                    sam440ep_defconfig
m68k                          amiga_defconfig
sh                        apsh4ad0a_defconfig
arm                           tegra_defconfig
mips                 decstation_r4k_defconfig
openrisc                  or1klitex_defconfig
powerpc                      obs600_defconfig
m68k                       m5249evb_defconfig
powerpc                mpc7448_hpc2_defconfig
arc                        nsimosci_defconfig
powerpc                      pasemi_defconfig
sh                         apsh4a3a_defconfig
sh                          rsk7201_defconfig
xtensa                         virt_defconfig
arm                        magician_defconfig
mips                           ip32_defconfig
powerpc                     tqm8540_defconfig
sh                          kfr2r09_defconfig
nios2                         10m50_defconfig
powerpc                    klondike_defconfig
mips                malta_kvm_guest_defconfig
powerpc                          g5_defconfig
m68k                             allmodconfig
powerpc                 canyonlands_defconfig
mips                           ci20_defconfig
arc                     nsimosci_hs_defconfig
sh                                  defconfig
sh                         microdev_defconfig
mips                        bcm47xx_defconfig
ia64                         bigsur_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                          allyesconfig
m68k                        m5407c3_defconfig
powerpc                     ep8248e_defconfig
mips                        omega2p_defconfig
riscv                            alldefconfig
arm                        vexpress_defconfig
m68k                            mac_defconfig
sh                  sh7785lcr_32bit_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
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
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
