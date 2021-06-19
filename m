Return-Path: <SRS0=aH4t=LN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B18C48BE5
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 22:48:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2EAC610C7
	for <ath10k@archiver.kernel.org>; Sat, 19 Jun 2021 22:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2EAC610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QkgPen6ZKdreATJ+ZYobTbJSIt/wh7F0ZxJLTy6PAW8=; b=dJ4D5askI4yFFl
	9sIPCLceEZOE2Ake70n9hjPQXsu9/5jB3BL15zMRSJjTRcEMFBOB+iTnkByg7F0l7TRdSP6JLohIC
	u7cPvjLk/19q/6eOpOQ7i9RXbfhYNr0/ZYbwlWT1aYhfBnVbn7Acp7FlLn4O3A9QiHX3ixCiw7T4w
	GDInhRySdZBmbS3YQfm8BM6xLUTpvqGh+yYc9OiVwdr0JWFynL/3iNe7TKvq0LZ+bsOFIMTiQOXD5
	QeAVvdTZrcd4ndydKHJ0MCwQ/h9JPC2w9qSV1BkTLHBvsBeCi9JuYu81X6tauiNdly5BKserpOJIO
	jocFeKkqpUznUCCx23mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lujlU-0008qz-65; Sat, 19 Jun 2021 22:48:36 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lujlQ-0008pH-0c
 for ath10k@lists.infradead.org; Sat, 19 Jun 2021 22:48:33 +0000
IronPort-SDR: RAhdT7QcDQTlHgOs+aT17hf0MV7hBp5h5JLa3cSJcub2ncGJfhwQOtliBl7spXeuyQnPShYwG/
 /ZsFkNTWcDFQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10020"; a="267834582"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="267834582"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 15:48:31 -0700
IronPort-SDR: PWEs7rCH9NZIvLg6jWO+3db6OU+YAhxpAaNVGH7hQFQH0/MKi1sauelnrP5iUwY2dW5ugYn5WS
 AMGdM47JyAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="622717825"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 19 Jun 2021 15:48:28 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lujlM-0003oJ-8P; Sat, 19 Jun 2021 22:48:28 +0000
Date: Sun, 20 Jun 2021 06:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master-pending] BUILD SUCCESS
 ca49b8bd8569032b206f601e6f149939f882a800
Message-ID: <60ce7400.2y2RBoj/fE559GzA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_154832_141439_C103336B 
X-CRM114-Status: UNSURE (   3.82  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: ca49b8bd8569032b206f601e6f149939f882a800  Merge branch 'pending' into master-pending

elapsed time: 720m

configs tested: 121
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
nios2                            allyesconfig
arm                           sama5_defconfig
arm                       imx_v6_v7_defconfig
mips                     loongson1c_defconfig
m68k                            mac_defconfig
sh                   sh7724_generic_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
arm                         palmz72_defconfig
sh                            hp6xx_defconfig
mips                     loongson2k_defconfig
mips                malta_qemu_32r6_defconfig
sh                   secureedge5410_defconfig
csky                                defconfig
powerpc                        cell_defconfig
powerpc                        fsp2_defconfig
arm                          badge4_defconfig
sh                           se7619_defconfig
powerpc                      pmac32_defconfig
arm                          pxa3xx_defconfig
powerpc                     tqm5200_defconfig
x86_64                            allnoconfig
arm                           sunxi_defconfig
powerpc                           allnoconfig
sh                          urquell_defconfig
x86_64                           allyesconfig
arm                          pxa168_defconfig
mips                 decstation_r4k_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      obs600_defconfig
arm                           spitz_defconfig
powerpc                     mpc83xx_defconfig
ia64                            zx1_defconfig
xtensa                           allyesconfig
arm                         shannon_defconfig
arc                                 defconfig
powerpc                     tqm8548_defconfig
arm                          imote2_defconfig
powerpc                   bluestone_defconfig
powerpc                        warp_defconfig
arm                         assabet_defconfig
mips                      loongson3_defconfig
powerpc                 mpc834x_itx_defconfig
mips                         db1xxx_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
mips                        nlm_xlr_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
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
nds32                             allnoconfig
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
