Return-Path: <SRS0=aH4t=LN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E01CC2B9F4
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 22:48:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A04610C7
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 22:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00A04610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yoAFHCTVPDWzy4Na/pMLqK/pqnsmphgBif+4Jm2c0fQ=; b=or9c4/GJ7YY0Dy
	/GKmdzTzmhUEZSprfQBIUCvc6tAACDA/5JmHyNv5bOdT9C6fPxjXRrG6Rm0NP77E59PB+k5N8farz
	4owCaLO9A5gz7UaHcAC35NSHHff5FtTpBlIbhcw8SMqWdVnhWZYKNjjrmDk9PIa81mP1UkwYKLMD9
	JTXdDmWifQUlYnjDBtX6WEAvE2rmTAOY52CqPxbE0siugOCjEyj8VKf1YaDIfp/u0WjuQ1t1RYqI9
	v5b/iQGiudneTKPsAsesyo9XLkLZD1VYFSoLCCUAPuXUzbJ42ot1dIH4Mr9oaNdpfs5Nips5cTmI/
	JUz1RIyjF19R5gRQRMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lujlS-0008qD-2z; Sat, 19 Jun 2021 22:48:34 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lujlP-0008oZ-1g
 for ath10k@lists.infradead.org; Sat, 19 Jun 2021 22:48:32 +0000
IronPort-SDR: L5P0xbNXC8eh2kMCBXqR47ivrWF8FqujbkXdjOOFKxaXt2qc56sKRcylJy4US8EbDxIjZW8W/4
 vu490MwPUTyg==
X-IronPort-AV: E=McAfee;i="6200,9189,10020"; a="194005339"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="194005339"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 15:48:30 -0700
IronPort-SDR: QOdDWwHMvWKcx/WnCh9rzcOOrphaLPJDUhb5L4DiwfF1/OoSxS4JHgAQwd+wwwkrVzFZqK9HwQ
 uSB9lANikFAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="405285238"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 19 Jun 2021 15:48:29 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lujlM-0003oM-FX; Sat, 19 Jun 2021 22:48:28 +0000
Date: Sun, 20 Jun 2021 06:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:pending] BUILD SUCCESS
 411554acd87007db017be8b9cd366c585781f436
Message-ID: <60ce7402.OBiEP+4dZyJ5TXXE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_154831_173403_FBBA3BB4 
X-CRM114-Status: UNSURE (   5.29  )
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
branch HEAD: 411554acd87007db017be8b9cd366c585781f436  wcn36xx: Avoid memset() beyond end of struct field

elapsed time: 720m

configs tested: 128
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nios2                         3c120_defconfig
nds32                             allnoconfig
powerpc64                           defconfig
arm                      pxa255-idp_defconfig
sh                   sh7724_generic_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
arm                         palmz72_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc832x_mds_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      ppc6xx_defconfig
arm                       versatile_defconfig
sh                           se7722_defconfig
mips                  maltasmvp_eva_defconfig
m68k                       m5249evb_defconfig
arm                          pxa168_defconfig
mips                         cobalt_defconfig
m68k                        stmark2_defconfig
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
mips                 decstation_r4k_defconfig
xtensa                           allyesconfig
arm                         shannon_defconfig
arc                                 defconfig
powerpc                     tqm8548_defconfig
arm                          imote2_defconfig
powerpc                    socrates_defconfig
arm                       cns3420vb_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         db1xxx_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
mips                        nlm_xlr_defconfig
arm                        clps711x_defconfig
sh                             espt_defconfig
arm                     am200epdkit_defconfig
mips                  decstation_64_defconfig
arm                       mainstone_defconfig
m68k                       m5475evb_defconfig
powerpc                         wii_defconfig
xtensa                              defconfig
sh                            migor_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
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
