Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA9C433FE
	for <ath10k@archiver.kernel.org>; Tue, 18 Jan 2022 03:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HZvUcIqQ5H/nlrZNH215kFnagPSZL4iHDQGM/1oqGsg=; b=cFn1yWrKK9Sdhj
	xEiGjABKvrYKLxrTXR/UW1G9+yGfeBE9itCGZxkwOKv5gIIu24LPyoSBMjwV+j4J7iiUE2H3KPStC
	m68SwXlUigiHCcLNQSYUBNYQxcRGOEcGKCRkEU6IlF1QBbXGbIi+7Yr6CwS708wSx9l7BRQ7ROWfS
	znylj1Z0uOEdnDqKwlpwf5qfFmOgXRxUepoHeB1eL3Nc7N6rJ4vGsqFC8MRXYE5HcrTUf0xjqekQz
	jH2q+zao8OrxmlxkvBIYw7aY7CgZC21/C4yoVzjE9UUCjhg2qSdhrHhQn/BmYMCEwyqfthAAqbMby
	HXEVW5iibKbUOv7j4i5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9fYI-00020Y-NU; Tue, 18 Jan 2022 03:52:58 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9f6I-00HQfZ-3x
 for ath10k@lists.infradead.org; Tue, 18 Jan 2022 03:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642476242; x=1674012242;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=ft65mgL3asdHzdpYFo7e+H7h2N9uDxZAlqufDUJ4uJM=;
 b=fhwM5WdA8UmBxe6kWSvSPKcK5ZXkoXJBWoCxtTHQktiJtgG8gJ5LxQ5K
 YQWPFMXD/Q6MgFBMIqQ7+b15rIjCxhq6h4MqCqD+ZPzmpR2+FSdNNXfB5
 MGUyIbYM8oJJTNyD8RaOakjF4FSJcyxw4tcPY7QYFtB5XCQ1PjpJj0cwR
 D0MQyuBTo0AYbFIc4UYVcqkO6YgGtbnP6o5EeIOCwpYSRpfaDdzRDPJS3
 BbHevOfOYNAACbFwGhtFhDtN8OBhEeHQ1zWDxOuBurpDIFXAl2gsBzUfE
 PO31KYJZWcDrrqYKBgFmCRRwN6siNnyYSRCYMLrC44WzYaDdU+risenoj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="305462705"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="305462705"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 19:24:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="625372640"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 17 Jan 2022 19:24:00 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n9f6F-000C6j-AR; Tue, 18 Jan 2022 03:23:59 +0000
Date: Tue, 18 Jan 2022 11:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS WITH WARNING
 8415824bf3ea5c313f15b902497cd2834c01e78e
Message-ID: <61e632b9.4mYZXQLOzRJ5rFK5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_192402_288308_74E9F2FD 
X-CRM114-Status: UNSURE (   4.37  )
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
branch HEAD: 8415824bf3ea5c313f15b902497cd2834c01e78e  dt: bindings: net: add bindings of WCN6750 for ath11k

Warning reports:

https://lore.kernel.org/llvm/202201180419.pxOIAhwJ-lkp@intel.com

Warning in current branch:

drivers/net/wireless/ath/ath11k/pci_cmn.c:185:10: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
drivers/net/wireless/ath/ath11k/pci_cmn.c:194:14: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]

Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm64-allmodconfig
|   `-- drivers-net-wireless-ath-ath11k-pci_cmn.c:warning:variable-val-is-used-uninitialized-whenever-if-condition-is-false
|-- arm64-randconfig-r011-20220116
|   `-- drivers-net-wireless-ath-ath11k-pci_cmn.c:warning:variable-val-is-used-uninitialized-whenever-if-condition-is-false
`-- arm64-randconfig-r012-20220116
    `-- drivers-net-wireless-ath-ath11k-pci_cmn.c:warning:variable-val-is-used-uninitialized-whenever-if-condition-is-false

elapsed time: 723m

configs tested: 138
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220118
i386                 randconfig-c001-20220117
powerpc                     redwood_defconfig
arm64                            alldefconfig
arm                      integrator_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm8548_defconfig
arm                        oxnas_v6_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                        mini2440_defconfig
arc                        nsimosci_defconfig
powerpc                  iss476-smp_defconfig
arm                      jornada720_defconfig
xtensa                         virt_defconfig
arm                      footbridge_defconfig
m68k                       m5275evb_defconfig
arm                             ezx_defconfig
mips                             allmodconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                      mgcoge_defconfig
powerpc                 canyonlands_defconfig
mips                  decstation_64_defconfig
arm                             pxa_defconfig
m68k                       m5208evb_defconfig
arm                        spear6xx_defconfig
m68k                          amiga_defconfig
mips                          rb532_defconfig
mips                           ip32_defconfig
openrisc                 simple_smp_defconfig
m68k                        stmark2_defconfig
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220118
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
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
arm                  randconfig-c002-20220118
riscv                randconfig-c006-20220118
riscv                randconfig-c006-20220116
powerpc              randconfig-c003-20220116
powerpc              randconfig-c003-20220118
i386                          randconfig-c001
s390                 randconfig-c005-20220118
mips                 randconfig-c004-20220118
mips                 randconfig-c004-20220116
s390                 randconfig-c005-20220116
mips                     cu1830-neo_defconfig
arm                       mainstone_defconfig
powerpc                       ebony_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      ppc44x_defconfig
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
