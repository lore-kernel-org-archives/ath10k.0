Return-Path: <SRS0=aH4t=LN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5031C48BE5
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 22:47:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C0E1611C1
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 22:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C0E1611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Isoz59bVFbJjwoiGijq8U1udNkOKqNfeaTmiQter0YU=; b=IBLER8Vb/90bo6
	nduF546hTMegsqLxGj4S0lBQ7PFkH47Oqo4YbR6U+xxkTwLnwryVaYK4lvBo/vSgs9Dpb8dRqaLcc
	Am6xbV0RQGUZUj+D2+2BoPoUmxArg1rbNjr3jwzHk2tA+Mlm0xIU1a+yPMCzJCgCNaUa6fCx9VkpS
	QjP/buBVjbn+yywEAJSheM5xstBuRu447WsRbJFfalp8Qz6IWy79gUycIc3XsxzqNrolilG9I9Afa
	O9SIGGZinhvsIyO3qEhGjnM8QzRkss3knF6tPHrTkOHYXXTuzzb92lmDZHrfTG8rilzZrMoSCFC3x
	UebDIorsayn5LPWk1wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lujka-0008d5-GZ; Sat, 19 Jun 2021 22:47:40 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lujkW-0008cD-2U
 for ath10k@lists.infradead.org; Sat, 19 Jun 2021 22:47:39 +0000
IronPort-SDR: ueANR4R6iInPFt5eWrXEihehRZaBHLslHjfVOuwCR3zEmlZfiaFI68FmDSKdGOmauTFtfqJBJQ
 RKwhNdXqh8sw==
X-IronPort-AV: E=McAfee;i="6200,9189,10020"; a="203670766"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="203670766"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 15:47:30 -0700
IronPort-SDR: O5pI+03I3YDoof8j5+xJiErDSQDQaq3E3UvilqKvHdFfBYm7rvyEnIr79sVBoB4VMwLzUh+kLP
 925iomh88vZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="422564185"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 19 Jun 2021 15:47:28 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lujkO-0003oC-2M; Sat, 19 Jun 2021 22:47:28 +0000
Date: Sun, 20 Jun 2021 06:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:ath-next] BUILD SUCCESS
 49f5b114e36ebc69318ab95f98b57df7458b0f42
Message-ID: <60ce73fb.tzB8MWSzKDKmCtPP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_154736_182847_2B9BE69F 
X-CRM114-Status: UNSURE (   6.53  )
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
branch HEAD: 49f5b114e36ebc69318ab95f98b57df7458b0f42  ath11k: Enable QCN9074 device

elapsed time: 722m

configs tested: 131
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7269_defconfig
powerpc                     asp8347_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     skiroot_defconfig
sh                   sh7724_generic_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
arm                         palmz72_defconfig
sh                            hp6xx_defconfig
powerpc                    sam440ep_defconfig
powerpc                       ebony_defconfig
mips                           mtx1_defconfig
mips                        jmr3927_defconfig
powerpc                    gamecube_defconfig
mips                   sb1250_swarm_defconfig
nios2                         3c120_defconfig
powerpc                 mpc832x_mds_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      ppc6xx_defconfig
arm                       versatile_defconfig
mips                     loongson2k_defconfig
mips                malta_qemu_32r6_defconfig
sh                   secureedge5410_defconfig
csky                                defconfig
powerpc                        cell_defconfig
arm                          pxa3xx_defconfig
powerpc                     tqm5200_defconfig
x86_64                            allnoconfig
arm                           sunxi_defconfig
powerpc                           allnoconfig
sh                          urquell_defconfig
x86_64                           allyesconfig
arm                       imx_v6_v7_defconfig
arm                          pxa168_defconfig
mips                 decstation_r4k_defconfig
arm                       imx_v4_v5_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
arm                        keystone_defconfig
sh                           se7722_defconfig
arm                         s3c2410_defconfig
h8300                               defconfig
arm                          lpd270_defconfig
xtensa                           allyesconfig
arm                         shannon_defconfig
arc                                 defconfig
powerpc                     tqm8548_defconfig
arm                          imote2_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         db1xxx_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
mips                        nlm_xlr_defconfig
arm                        clps711x_defconfig
sh                             espt_defconfig
arm                     am200epdkit_defconfig
mips                  decstation_64_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
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
i386                 randconfig-a002-20210618
i386                 randconfig-a006-20210618
i386                 randconfig-a004-20210618
i386                 randconfig-a001-20210618
i386                 randconfig-a005-20210618
i386                 randconfig-a003-20210618
x86_64               randconfig-a015-20210618
x86_64               randconfig-a011-20210618
x86_64               randconfig-a012-20210618
x86_64               randconfig-a014-20210618
x86_64               randconfig-a016-20210618
x86_64               randconfig-a013-20210618
i386                 randconfig-a015-20210618
i386                 randconfig-a016-20210618
i386                 randconfig-a013-20210618
i386                 randconfig-a014-20210618
i386                 randconfig-a012-20210618
i386                 randconfig-a011-20210618
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
um                            kunit_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210620
x86_64               randconfig-b001-20210618
x86_64               randconfig-a002-20210618
x86_64               randconfig-a001-20210618
x86_64               randconfig-a004-20210618
x86_64               randconfig-a003-20210618
x86_64               randconfig-a006-20210618
x86_64               randconfig-a005-20210618

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
