Return-Path: <SRS0=rz21=H5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6528EC433DB
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 08:09:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D583164EB7
	for <ath10k@archiver.kernel.org>; Sat, 27 Feb 2021 08:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D583164EB7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NtCwVGKfYauleqQ2LtykMl+CpPW2PjqUeB+8KomVMAU=; b=w+uBJ9D+C0wWGeskUkk68WWJYN
	5JmmsDdBrvHv97wCZtnts2tVOmz39yVoO0itwRcA2W1Nm3TxYoiVq2INbyT1mBep92L8y3koLQ4Mn
	5zASZOCF2hMXptGMKqez9B0+kL7oQZVi04jLGJV7O4ty+pfauZWspDRGIMfdIxG23tYvtI3s1k+qJ
	Pn49zB/H83ZCh8Zw5AZf1qrnubzb1qWxaloIWD5AjgXBbw4Y65WOwRdQw2QTBsGkLy85jRi4aNgU1
	FAhrp5fZgVxKRCYbAxxrQ1W3UFFesJaNpUaOzsNFCDUaPPIcGkJgQcZBpMjtL+FGhJrVPlxoTS14U
	z4wAlQjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFuep-0008Dd-QY; Sat, 27 Feb 2021 08:08:59 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFuem-0008D3-8b
 for ath10k@lists.infradead.org; Sat, 27 Feb 2021 08:08:57 +0000
IronPort-SDR: yHhOG8quiLM4iTDJpc5R3LIGPhAeBn3/q8f2ICjFbnrwQLoud5wZfH95SOysTolFy5j622e12G
 CglU/OY8CDwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="165943661"
X-IronPort-AV: E=Sophos;i="5.81,210,1610438400"; d="scan'208";a="165943661"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2021 00:08:51 -0800
IronPort-SDR: Ao3G9P3Dp/wgpeI+quqaO8/rSy5QsKsHyBTJnJYMwHXjOm4m52xcp9mFv4gzLj0zYuGECcmZ+N
 p4/1z+3QgL5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,210,1610438400"; d="scan'208";a="516784076"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 27 Feb 2021 00:08:50 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lFuef-0003d7-IH; Sat, 27 Feb 2021 08:08:49 +0000
Date: Sat, 27 Feb 2021 16:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:pending] BUILD SUCCESS
 eadf03349865789647680fb7f580b77aea8ed9a5
Message-ID: <6039fde0.Bp67wC9lTP0xxsM6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_030856_486054_ECB38CE8 
X-CRM114-Status: UNSURE (   6.48  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: eadf03349865789647680fb7f580b77aea8ed9a5  ath11k: Add support for STA to handle beacon miss

elapsed time: 726m

configs tested: 100
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5208evb_defconfig
mips                      malta_kvm_defconfig
sh                   secureedge5410_defconfig
powerpc                     sequoia_defconfig
sh                           sh2007_defconfig
arm                          moxart_defconfig
arm                       imx_v6_v7_defconfig
sh                        dreamcast_defconfig
arm                          lpd270_defconfig
arm                              alldefconfig
powerpc                      tqm8xx_defconfig
arm                       aspeed_g4_defconfig
sparc                            allyesconfig
openrisc                            defconfig
sh                            hp6xx_defconfig
sh                     sh7710voipgw_defconfig
mips                  cavium_octeon_defconfig
powerpc                      pcm030_defconfig
arc                         haps_hs_defconfig
arm                           tegra_defconfig
powerpc                      ppc44x_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     skiroot_defconfig
arc                     nsimosci_hs_defconfig
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
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210226
x86_64               randconfig-a002-20210226
x86_64               randconfig-a003-20210226
x86_64               randconfig-a005-20210226
x86_64               randconfig-a004-20210226
x86_64               randconfig-a006-20210226
i386                 randconfig-a005-20210226
i386                 randconfig-a006-20210226
i386                 randconfig-a004-20210226
i386                 randconfig-a001-20210226
i386                 randconfig-a003-20210226
i386                 randconfig-a002-20210226
i386                 randconfig-a013-20210226
i386                 randconfig-a012-20210226
i386                 randconfig-a011-20210226
i386                 randconfig-a014-20210226
i386                 randconfig-a016-20210226
i386                 randconfig-a015-20210226
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210226
x86_64               randconfig-a011-20210226
x86_64               randconfig-a012-20210226
x86_64               randconfig-a016-20210226
x86_64               randconfig-a013-20210226
x86_64               randconfig-a014-20210226

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
