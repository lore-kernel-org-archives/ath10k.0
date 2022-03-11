Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BD7C433F5
	for <ath10k@archiver.kernel.org>; Fri, 11 Mar 2022 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZfiRVnk50rvK7UAIQ9WFaHQJfT+wRRp8CEo7oot+VLA=; b=yoRpPlbMBwbnjv
	IK9642IeC7WiN0vZ4FucHp0WuIC3Fpkyg/WbIDXfiqCxlMsGqn/9a4+3gcJmypuZ7f6H9mmhvciaj
	gCYqRday/euQ5JUL233KdV8V1cd8X9QHoK3A/8D7IafPAoqCvZmbEDWHHrOmwuDFyIeIcazKxoPQz
	tTS2aqzU6b1SYiTju3Z6vijUlNa8QYjJY/KEVCxZSN7P4a2bO1PqbWMhpxpYO9eTFAIxw3AiLVCW8
	2Orda6XqwdvwER5Rgngnc/iINGKx41vAD4Us+vndS1u883E6mI/AoFLvUuc72y7qE5tOjmDQUFZYC
	vk/sETkEK++hkecIcGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSbNB-00FmEr-JA; Fri, 11 Mar 2022 09:15:45 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSbN8-00FmE2-NV
 for ath10k@lists.infradead.org; Fri, 11 Mar 2022 09:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646990142; x=1678526142;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=bgwIYcuDEiTCbARh5N2EozXbnoQ/1CudJXaZdZ5WsTQ=;
 b=TaI08iiz9dYLAlKbNjKuPREd4HiedVvdYgThnP7FdVZBsMnWp9dt3zwz
 tmq2nhd3j6p0p74/6eovfvfCWPUzl4vYxEugJK7UKPQYYQZ87bOcBgPS6
 9E7bcpRk1MX/y3d0iv+FXmMYdLOmvLr3UWbpSoFboQeKS5oHiROtWlS3a
 MaDrCgGW4eY3SqwPM3KzjlqR78x66xVJvTvbpWCe3h1DJfux70Xl3slHV
 OmkrQFesmjyb1VIOcwM6PSqnnDZ6xNAq+AMuxgylYJd1iCkqLUmK1VoQ4
 8pDBEsKfAr7azkuzUzcPHYWccTGGSgkqQ9usd1yjOYuflq2LRywgpunmj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="242983836"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="242983836"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 01:15:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; d="scan'208";a="644874782"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 11 Mar 2022 01:15:40 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSbN6-00069a-1d; Fri, 11 Mar 2022 09:15:40 +0000
Date: Fri, 11 Mar 2022 17:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 d845cf007bdf8b2bf41522e1ecd0eb804e553d57
Message-ID: <622b1334.Y/KmVwiV+9g42p80%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_011542_850641_B61C45A1 
X-CRM114-Status: UNSURE (   6.10  )
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
branch HEAD: d845cf007bdf8b2bf41522e1ecd0eb804e553d57  Add localversion-wireless-testing-ath

elapsed time: 844m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
nios2                         3c120_defconfig
sparc                            allyesconfig
arm                            lart_defconfig
sh                            titan_defconfig
sh                            shmin_defconfig
m68k                          multi_defconfig
ia64                         bigsur_defconfig
sh                          r7785rp_defconfig
arm                          badge4_defconfig
sh                           se7721_defconfig
openrisc                  or1klitex_defconfig
sh                          sdk7780_defconfig
arm                             rpc_defconfig
arm                      jornada720_defconfig
h8300                     edosk2674_defconfig
sparc                       sparc64_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7722_defconfig
nds32                             allnoconfig
arm                        realview_defconfig
mips                  maltasmvp_eva_defconfig
alpha                            alldefconfig
mips                            gpr_defconfig
arm                        spear6xx_defconfig
powerpc                     redwood_defconfig
arm                  randconfig-c002-20220310
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220310
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                     tqm8540_defconfig
mips                       lemote2f_defconfig
s390                             alldefconfig
powerpc                       ebony_defconfig
powerpc                      acadia_defconfig
arm                       spear13xx_defconfig
mips                     loongson2k_defconfig
powerpc                     mpc512x_defconfig
arm                         orion5x_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc836x_mds_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220310
hexagon              randconfig-r045-20220310
riscv                randconfig-r042-20220310
s390                 randconfig-r044-20220310

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
