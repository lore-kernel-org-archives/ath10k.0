Return-Path: <SRS0=JkH/=GR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F04C433DB
	for <ath10k@archiver.kernel.org>; Thu, 14 Jan 2021 20:22:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5737923A53
	for <ath10k@archiver.kernel.org>; Thu, 14 Jan 2021 20:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5737923A53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZvOh7c9uOrlHcySpNj+9fLvxZb/nx95PAa4v19FS8x8=; b=c8GMKSQ0NZtTNtKqGVcsypkmUG
	MZneRi0BS44xf5oEYZgwmsjKQJ/2y9OetDj/9OF5FZDg5Of8rXVqbvM34X2nSKJ4Mqx5cSFqLGn14
	M/UYwpkNPqg+VjbcGGP0egDnlZ8NhQMt2j7V1FgQ05VxrpzmZ50WiR35b1w+vdMb/59Cxxk5aC4Ao
	B+i888rjOJQeQo8kvLJGK5YdSoU2YHnx2XqnFNouCjGHBnGlKBCq8OM0vmZSeclG1n12dzCLjdvIE
	r7U8V0uhy/3u85LLKrym/3cBtBTAgr1dLXR8IMVkhf36rYT1FWyDs1xJNi5eaGeYpx33m0/VIMl2X
	AqIKywGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l097I-0005On-1w; Thu, 14 Jan 2021 20:21:12 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l097E-0005NN-RV
 for ath10k@lists.infradead.org; Thu, 14 Jan 2021 20:21:10 +0000
IronPort-SDR: WwOQXhgCLFKxS0td1f+p7xYGZqgQEtNa7WxvU2RyRfxsXNGG1clJSJD3V+c+Ah/0z3XlXIGKu1
 GEQs3SP4t8kQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="165524085"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="165524085"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 12:21:06 -0800
IronPort-SDR: DrY0eB8nylwFd6GzMCPD6QKC7xEioUMPKMOuQah0nDDU0S/3dediTNph0WWKRkqDPaIyo4cM0X
 ii/PyU8bXn1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="425057847"
Received: from lkp-server01.sh.intel.com (HELO d5d1a9a2c6bb) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 14 Jan 2021 12:21:05 -0800
Received: from kbuild by d5d1a9a2c6bb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l097A-000187-I9; Thu, 14 Jan 2021 20:21:04 +0000
Date: Fri, 15 Jan 2021 04:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:pending] BUILD SUCCESS WITH WARNING
 8cb5471ba971dcb8f75bdd39ad21200378ce0e35
Message-ID: <6000a7a8.WfOemesa7p1KTHJ0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_152109_142623_7649BDA5 
X-CRM114-Status: UNSURE (   8.56  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  pending
branch HEAD: 8cb5471ba971dcb8f75bdd39ad21200378ce0e35  ath10k: pass the ssid info to get the correct bss entity

Warning in current branch:

drivers/net/wireless/ath/ath10k/mac.c:84:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- arc-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- arm-allmodconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- arm-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- arm64-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- arm64-defconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- c6x-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- h8300-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- i386-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- i386-randconfig-a004-20210114
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- ia64-allmodconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- ia64-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- m68k-allmodconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- m68k-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- microblaze-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- mips-allmodconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- mips-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- nds32-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- nios2-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- parisc-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- powerpc-allmodconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- powerpc-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- riscv-allmodconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- riscv-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- sparc-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
|-- x86_64-allyesconfig
|   `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration
`-- xtensa-allyesconfig
    `-- drivers-net-wireless-ath-ath10k-mac.c:warning:static-is-not-at-beginning-of-declaration

elapsed time: 723m

configs tested: 135
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        mvebu_v7_defconfig
mips                        bcm47xx_defconfig
riscv                               defconfig
sh                          rsk7201_defconfig
mips                  maltasmvp_eva_defconfig
arm                         s3c6400_defconfig
arm                          pcm027_defconfig
powerpc                      katmai_defconfig
m68k                         amcore_defconfig
sh                        apsh4ad0a_defconfig
mips                    maltaup_xpa_defconfig
ia64                         bigsur_defconfig
powerpc                      ppc44x_defconfig
mips                  cavium_octeon_defconfig
alpha                            alldefconfig
sh                          r7780mp_defconfig
sparc64                             defconfig
m68k                        stmark2_defconfig
arc                        nsimosci_defconfig
mips                           ip28_defconfig
m68k                       m5475evb_defconfig
powerpc                 linkstation_defconfig
mips                     loongson1c_defconfig
arm                             ezx_defconfig
sh                            shmin_defconfig
arm                           corgi_defconfig
arm                       aspeed_g5_defconfig
arm                        mvebu_v5_defconfig
arm                         assabet_defconfig
arm                        multi_v7_defconfig
powerpc                      pcm030_defconfig
sh                           se7751_defconfig
sparc                            allyesconfig
powerpc                      cm5200_defconfig
arm                             mxs_defconfig
riscv                    nommu_virt_defconfig
mips                  decstation_64_defconfig
arm64                            alldefconfig
powerpc                     pseries_defconfig
mips                        nlm_xlp_defconfig
powerpc                           allnoconfig
nios2                               defconfig
arm                         cm_x300_defconfig
sh                           se7750_defconfig
sh                           se7206_defconfig
powerpc                     tqm8555_defconfig
arm                         lpc32xx_defconfig
sh                           se7722_defconfig
mips                        maltaup_defconfig
csky                             alldefconfig
arm                          iop32x_defconfig
nds32                             allnoconfig
powerpc                     tqm8541_defconfig
sh                         ap325rxa_defconfig
arm                         palmz72_defconfig
s390                             alldefconfig
h8300                    h8300h-sim_defconfig
powerpc                     tqm8540_defconfig
c6x                         dsk6455_defconfig
powerpc                     mpc512x_defconfig
openrisc                 simple_smp_defconfig
x86_64                           alldefconfig
arm                       spear13xx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a002-20210114
i386                 randconfig-a005-20210114
i386                 randconfig-a006-20210114
i386                 randconfig-a001-20210114
i386                 randconfig-a003-20210114
i386                 randconfig-a004-20210114
x86_64               randconfig-a015-20210114
x86_64               randconfig-a012-20210114
x86_64               randconfig-a013-20210114
x86_64               randconfig-a016-20210114
x86_64               randconfig-a014-20210114
x86_64               randconfig-a011-20210114
i386                 randconfig-a012-20210114
i386                 randconfig-a011-20210114
i386                 randconfig-a016-20210114
i386                 randconfig-a015-20210114
i386                 randconfig-a013-20210114
i386                 randconfig-a014-20210114
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
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
x86_64               randconfig-a004-20210114
x86_64               randconfig-a006-20210114
x86_64               randconfig-a001-20210114
x86_64               randconfig-a003-20210114
x86_64               randconfig-a005-20210114
x86_64               randconfig-a002-20210114

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
