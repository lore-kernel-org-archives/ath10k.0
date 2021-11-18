Return-Path: <SRS0=kJ3c=QF=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AB3C433EF
	for <ath10k@archiver.kernel.org>; Thu, 18 Nov 2021 12:34:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 401D161A03
	for <ath10k@archiver.kernel.org>; Thu, 18 Nov 2021 12:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 401D161A03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ye7c45Tqmx9QB4GRcfD0CIHWYsdFlnfpBjyVzV5glF0=; b=tQmNJmFzeSer1p
	w2nr0GzMUAcdxbDd/ofD89vLA2UvWIBbk1MVU6pZduRx9LvR2FYIgwUqTifKAFj7gayrL7cxfiOZK
	pnoV7+pjFCIwKkuti9Wy+JOumiCQd5/Pq45YcKtlmycnqfetoOtSLWYChm8I6H3q4oKB24GAxleT1
	b5WIKrfrM6Kya4F9Y+2c+PirmtKEVqvJHYyfKuaexOy7i/A7BLo5dZ2CwBHz06DQh0il9PDeuRR0O
	0SyY45vagVIzTDjyZg5mGyQ59GxlkxGErsnOMPRha4UsFvFRoBvhEwNVU8qWFkoq+XCiDven0+HQi
	QWAJYfxmVa2j8rgu1yPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mngc4-007lEM-QG; Thu, 18 Nov 2021 12:34:00 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mngc1-007lD0-Iu
 for ath10k@lists.infradead.org; Thu, 18 Nov 2021 12:33:59 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221389019"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="221389019"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 04:33:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; d="scan'208";a="455312861"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 18 Nov 2021 04:33:54 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mngbx-00034P-Pw; Thu, 18 Nov 2021 12:33:53 +0000
Date: Thu, 18 Nov 2021 20:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 f5b489bae486044409ac93c9fb3e71d04b493185
Message-ID: <61964829.OmN9UE1boOTbM4uc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_043357_713553_DB2126A5 
X-CRM114-Status: UNSURE (   6.25  )
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
branch HEAD: f5b489bae486044409ac93c9fb3e71d04b493185  ath9k: fix intr_txqs setting

elapsed time: 1080m

configs tested: 171
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211118
powerpc                     redwood_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                ecovec24-romimage_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     kilauea_defconfig
mips                           ip27_defconfig
powerpc                    klondike_defconfig
arm                       versatile_defconfig
ia64                            zx1_defconfig
microblaze                      mmu_defconfig
arm                           sama7_defconfig
arm                        mvebu_v7_defconfig
powerpc                     stx_gp3_defconfig
sh                        sh7785lcr_defconfig
arm                      jornada720_defconfig
s390                       zfcpdump_defconfig
powerpc                     akebono_defconfig
arm                  colibri_pxa300_defconfig
xtensa                    xip_kc705_defconfig
xtensa                              defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     rainier_defconfig
mips                          ath25_defconfig
sh                             shx3_defconfig
sh                     sh7710voipgw_defconfig
arc                     haps_hs_smp_defconfig
arm                         at91_dt_defconfig
arc                        nsimosci_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                       mainstone_defconfig
mips                      fuloong2e_defconfig
sh                        edosk7760_defconfig
mips                           mtx1_defconfig
openrisc                 simple_smp_defconfig
arm                           corgi_defconfig
m68k                       m5208evb_defconfig
mips                     cu1000-neo_defconfig
arm                           tegra_defconfig
sh                            migor_defconfig
powerpc                     mpc5200_defconfig
arc                              allyesconfig
m68k                            q40_defconfig
arm                          ixp4xx_defconfig
openrisc                    or1ksim_defconfig
arc                          axs103_defconfig
mips                           gcw0_defconfig
sh                          polaris_defconfig
sh                         microdev_defconfig
sh                           se7206_defconfig
arm                         shannon_defconfig
arm                          gemini_defconfig
sh                          rsk7264_defconfig
powerpc                    socrates_defconfig
arm                     eseries_pxa_defconfig
sh                             espt_defconfig
arc                           tb10x_defconfig
mips                  cavium_octeon_defconfig
arm                       netwinder_defconfig
arm                  colibri_pxa270_defconfig
sh                             sh03_defconfig
mips                     loongson1c_defconfig
powerpc                   currituck_defconfig
powerpc                     ksi8560_defconfig
xtensa                  nommu_kc705_defconfig
arm                  randconfig-c002-20211118
arm                  randconfig-c002-20211117
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
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
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211117
x86_64               randconfig-a003-20211117
x86_64               randconfig-a002-20211117
x86_64               randconfig-a001-20211117
x86_64               randconfig-a006-20211117
x86_64               randconfig-a004-20211117
i386                 randconfig-a003-20211117
i386                 randconfig-a001-20211117
i386                 randconfig-a004-20211117
i386                 randconfig-a002-20211117
i386                 randconfig-a006-20211117
i386                 randconfig-a005-20211117
x86_64               randconfig-a015-20211118
x86_64               randconfig-a012-20211118
x86_64               randconfig-a011-20211118
x86_64               randconfig-a013-20211118
x86_64               randconfig-a016-20211118
x86_64               randconfig-a014-20211118
i386                 randconfig-a016-20211118
i386                 randconfig-a014-20211118
i386                 randconfig-a012-20211118
i386                 randconfig-a011-20211118
i386                 randconfig-a013-20211118
i386                 randconfig-a015-20211118
arc                  randconfig-r043-20211117
arc                  randconfig-r043-20211118
riscv                randconfig-r042-20211118
s390                 randconfig-r044-20211118
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
x86_64               randconfig-a015-20211117
x86_64               randconfig-a013-20211117
x86_64               randconfig-a011-20211117
x86_64               randconfig-a012-20211117
x86_64               randconfig-a016-20211117
x86_64               randconfig-a014-20211117
i386                 randconfig-a014-20211117
i386                 randconfig-a016-20211117
i386                 randconfig-a012-20211117
i386                 randconfig-a013-20211117
i386                 randconfig-a011-20211117
i386                 randconfig-a015-20211117
x86_64               randconfig-a005-20211118
x86_64               randconfig-a003-20211118
x86_64               randconfig-a001-20211118
x86_64               randconfig-a002-20211118
x86_64               randconfig-a006-20211118
x86_64               randconfig-a004-20211118
hexagon              randconfig-r045-20211117
hexagon              randconfig-r041-20211117
s390                 randconfig-r044-20211117
riscv                randconfig-r042-20211117
hexagon              randconfig-r045-20211118
hexagon              randconfig-r041-20211118

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
