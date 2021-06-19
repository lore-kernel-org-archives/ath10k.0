Return-Path: <SRS0=aH4t=LN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C727C2B9F4
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 22:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B736610C7
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 22:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B736610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/jR0iy3Dl8lzyPrYd4ZHyYbKmubqoyvpmELs+8GNA0Y=; b=EPPShTBQz+Z5Wh
	BraaNuxZH09WTCfo7JInLxw/DghrONAkVfcMSuXd5IQqsQf0xjOPbCnAAwdZjgLb38Cc6H8r9bQzc
	1RMVAX3WY9RKKOchpejKmJsNQzmBL/98BuMHUoVZiYBKzhzJFXDUvlyMfVlqri//HhT637GvmtWS2
	wNTleMEwatNwxhxHI+pLi2niVP/XSLvDyYKBDJz7sWvUU3bqtav7bOmz2XTGxAJVoYunoUOJBYSOG
	yoDMDBGo4QSqx6jdNu8olOrQBFURgfk4xQDcFeSAjGxDxr+2Jwjalx4zoPfMcsXCg7gkjGeVvLCEJ
	X6OvZ9M6QBq9hcZwmavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lujkc-0008dJ-3D; Sat, 19 Jun 2021 22:47:42 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lujkV-0008cA-Tm
 for ath10k@lists.infradead.org; Sat, 19 Jun 2021 22:47:39 +0000
IronPort-SDR: R0G/g4l/sPscrfZraTkYmdm2GehwR/HhIajewyNeUQjeUm5WQ/TMGVf5Tjsc3yZhe7Kw+uNcn7
 yFfaK6oSL0+w==
X-IronPort-AV: E=McAfee;i="6200,9189,10020"; a="228231014"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="228231014"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 15:47:29 -0700
IronPort-SDR: jegxjZdRQ0JILT18cEOlEbwCTzarZ/zyq0EgCtXjZJq+D0wOFN8FImEEwbCz8Sx35KZywIj8jk
 uM/Fib1uYXzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="486064393"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 19 Jun 2021 15:47:28 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lujkO-0003oA-18; Sat, 19 Jun 2021 22:47:28 +0000
Date: Sun, 20 Jun 2021 06:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master] BUILD SUCCESS 748ef459767dd7ac1a764c79445dd631b43797b9
Message-ID: <60ce73f9.0Dq58N53F9BDFrmP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_154736_042279_8E26E27C 
X-CRM114-Status: UNSURE (   6.74  )
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
branch HEAD: 748ef459767dd7ac1a764c79445dd631b43797b9  Add localversion-wireless-testing-ath

elapsed time: 720m

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
sh                          rsk7269_defconfig
powerpc                     asp8347_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     skiroot_defconfig
sh                   sh7724_generic_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
arm                         palmz72_defconfig
sh                            hp6xx_defconfig
mips                     loongson2k_defconfig
mips                malta_qemu_32r6_defconfig
sh                   secureedge5410_defconfig
powerpc                        cell_defconfig
csky                                defconfig
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
xtensa                           allyesconfig
arm                         shannon_defconfig
arc                                 defconfig
powerpc                     tqm8548_defconfig
arm                          imote2_defconfig
powerpc                    socrates_defconfig
m68k                       m5249evb_defconfig
arm                       cns3420vb_defconfig
mips                  decstation_64_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         db1xxx_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
mips                        nlm_xlr_defconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
