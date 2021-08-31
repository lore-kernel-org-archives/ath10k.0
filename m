Return-Path: <SRS0=prmI=NW=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D253DC432BE
	for <ath10k@archiver.kernel.org>; Tue, 31 Aug 2021 10:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D09460F12
	for <ath10k@archiver.kernel.org>; Tue, 31 Aug 2021 10:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D09460F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UoWFCcHtA+oYzIcMAbFuXYn+lVMIfmKkwmiiJc9L4yI=; b=QEUUT2Su9obs81
	w2vCku5BsYmZP+B0LMTl+SYRChIyKbPxkNEGqs/P4CVxi4E+8BkP4SzM/tNvh3hgmGh5Y4WQdAdjf
	L34NDiPFQmPl8w5jWiMKICjHr/1kNzzTpzJJRt7ZUEXZRWdRVLoAKc/5DCI/U1unUhs7kq5WDMrJc
	hEbobWv544/kWtKNlYifxnlgFjbpPYlyvExHyvAIz4dtwN7ujATUkt9Y/4iirFggbU2+VVPKg6qKX
	kzaEBWsLLw2xSSvJxAkB+Fxm0N3gRm+1IG359k8fgQrn+FTw4nQzmpNCabuWAWfXWd3xfV+wkmT/S
	eNEcwEGYrdK8WJvTGt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL1H0-00252i-Qz; Tue, 31 Aug 2021 10:45:46 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL1Gj-0024zr-2J
 for ath10k@lists.infradead.org; Tue, 31 Aug 2021 10:45:33 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="218166212"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="218166212"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 03:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="687662119"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2021 03:45:26 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mL1Gf-0006PK-S0; Tue, 31 Aug 2021 10:45:25 +0000
Date: Tue, 31 Aug 2021 18:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:ath-next] BUILD SUCCESS
 fd6729ec534cffbbeb3917761e6d1fe6a412d3fe
Message-ID: <612e0842.2XerTzbX8VvS1cd4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_034529_217401_51360BD8 
X-CRM114-Status: UNSURE (   5.39  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: fd6729ec534cffbbeb3917761e6d1fe6a412d3fe  ath6kl: wmi: fix an error code in ath6kl_wmi_sync_point()

elapsed time: 3066m

configs tested: 191
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          atari_defconfig
arm                         s3c2410_defconfig
sh                          rsk7201_defconfig
arm                          gemini_defconfig
powerpc64                           defconfig
powerpc                      arches_defconfig
arm                         vf610m4_defconfig
mips                           ci20_defconfig
powerpc                 mpc836x_mds_defconfig
arm                            pleb_defconfig
sh                            titan_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     tqm8548_defconfig
m68k                          hp300_defconfig
sh                          kfr2r09_defconfig
arm                       versatile_defconfig
m68k                                defconfig
xtensa                  nommu_kc705_defconfig
arm                            xcep_defconfig
powerpc                      katmai_defconfig
arm                         s5pv210_defconfig
sh                      rts7751r2d1_defconfig
powerpc                     pq2fads_defconfig
arm                         s3c6400_defconfig
sh                        apsh4ad0a_defconfig
arm                         hackkit_defconfig
nios2                         3c120_defconfig
arm                            dove_defconfig
m68k                             alldefconfig
mips                     loongson2k_defconfig
mips                      fuloong2e_defconfig
powerpc                      bamboo_defconfig
arm                           sunxi_defconfig
mips                     cu1830-neo_defconfig
alpha                            alldefconfig
mips                       bmips_be_defconfig
sh                           se7722_defconfig
arc                         haps_hs_defconfig
sh                             espt_defconfig
sh                        edosk7705_defconfig
arm                          imote2_defconfig
powerpc                     mpc5200_defconfig
arm                         bcm2835_defconfig
arm                       netwinder_defconfig
powerpc                     tqm8555_defconfig
mips                  cavium_octeon_defconfig
sh                          rsk7203_defconfig
mips                        qi_lb60_defconfig
arm                         orion5x_defconfig
openrisc                    or1ksim_defconfig
sh                          urquell_defconfig
powerpc                    adder875_defconfig
m68k                          sun3x_defconfig
powerpc                        icon_defconfig
powerpc                      tqm8xx_defconfig
arm                          exynos_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
i386                 randconfig-a005-20210831
i386                 randconfig-a002-20210831
i386                 randconfig-a003-20210831
i386                 randconfig-a006-20210831
i386                 randconfig-a004-20210831
i386                 randconfig-a001-20210831
x86_64               randconfig-a014-20210829
x86_64               randconfig-a016-20210829
x86_64               randconfig-a015-20210829
x86_64               randconfig-a012-20210829
x86_64               randconfig-a013-20210829
x86_64               randconfig-a011-20210829
x86_64               randconfig-a014-20210830
x86_64               randconfig-a015-20210830
x86_64               randconfig-a013-20210830
x86_64               randconfig-a016-20210830
x86_64               randconfig-a012-20210830
x86_64               randconfig-a011-20210830
x86_64               randconfig-a005-20210831
x86_64               randconfig-a001-20210831
x86_64               randconfig-a003-20210831
x86_64               randconfig-a002-20210831
x86_64               randconfig-a004-20210831
x86_64               randconfig-a006-20210831
i386                 randconfig-a011-20210829
i386                 randconfig-a016-20210829
i386                 randconfig-a012-20210829
i386                 randconfig-a014-20210829
i386                 randconfig-a013-20210829
i386                 randconfig-a015-20210829
i386                 randconfig-a016-20210830
i386                 randconfig-a011-20210830
i386                 randconfig-a015-20210830
i386                 randconfig-a014-20210830
i386                 randconfig-a012-20210830
i386                 randconfig-a013-20210830
s390                 randconfig-r044-20210830
arc                  randconfig-r043-20210830
riscv                randconfig-r042-20210830
arc                  randconfig-r043-20210829
riscv                randconfig-r042-20210829
s390                 randconfig-r044-20210829
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
i386                 randconfig-c001-20210830
s390                 randconfig-c005-20210830
riscv                randconfig-c006-20210830
powerpc              randconfig-c003-20210830
mips                 randconfig-c004-20210830
arm                  randconfig-c002-20210830
x86_64               randconfig-c007-20210830
x86_64               randconfig-a001-20210829
x86_64               randconfig-a006-20210829
x86_64               randconfig-a005-20210829
x86_64               randconfig-a003-20210829
x86_64               randconfig-a004-20210829
x86_64               randconfig-a002-20210829
i386                 randconfig-a005-20210830
i386                 randconfig-a002-20210830
i386                 randconfig-a003-20210830
i386                 randconfig-a006-20210830
i386                 randconfig-a004-20210830
i386                 randconfig-a001-20210830
x86_64               randconfig-a014-20210831
x86_64               randconfig-a015-20210831
x86_64               randconfig-a013-20210831
x86_64               randconfig-a016-20210831
x86_64               randconfig-a012-20210831
x86_64               randconfig-a011-20210831
i386                 randconfig-a016-20210831
i386                 randconfig-a011-20210831
i386                 randconfig-a015-20210831
i386                 randconfig-a014-20210831
i386                 randconfig-a012-20210831
i386                 randconfig-a013-20210831
s390                 randconfig-r044-20210831
hexagon              randconfig-r041-20210831
hexagon              randconfig-r045-20210831
riscv                randconfig-r042-20210831
x86_64               randconfig-a005-20210830
x86_64               randconfig-a001-20210830
x86_64               randconfig-a003-20210830
x86_64               randconfig-a002-20210830
x86_64               randconfig-a004-20210830
x86_64               randconfig-a006-20210830

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
