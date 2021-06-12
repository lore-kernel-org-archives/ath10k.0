Return-Path: <SRS0=NYaa=LG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1081C48BCF
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 23:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FCA5610C9
	for <ath10k@archiver.kernel.org>; Sat, 12 Jun 2021 23:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FCA5610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tzKEwFz2GsgSJyZz9ISrn+00zSRmkWNFgMKkNBBZ8FA=; b=kr/zoBtBbLyfK5
	trFwHNk7aXYmNeUYqKlVHyaa+d35xXqh3ucB12xZNf5YkfNn8RWMp6dX3cjS/3DwEthUfqueO623V
	XYD/RwN0yq4LyAnH+w23rZm+Qc46eKBZNZgKUsYuntXhI0Hk8Dk6iFeF8Gh18I3ZssmsuXnju1Lad
	4xYQdsK+ACVk/MzhKidGXMIYEnoG+mT3tHw2/XN0b46cDsK81gc5B9ZktJ5LGlqnABPpFS1NhjAd+
	+Yh4N5VpfTkF/nCYabCuNcWVf5YPuF9wXgcTh6D+Zxj9YpR76QnjIMCgmYflAmQ5VbxGHH6yzQwxN
	oLJOyAfkdMxcH0tfGuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsCzT-009IQ3-8X; Sat, 12 Jun 2021 23:24:35 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsCzN-009IOd-TS
 for ath10k@lists.infradead.org; Sat, 12 Jun 2021 23:24:31 +0000
IronPort-SDR: O/qgJaBlQKQlhkPxVc86j5KG+9V4vIr5q0NloNIjkp9gtZvF+zA33SkxM4jxBw7kofV1x68dPo
 X9EL/nH9pk+Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10013"; a="205713305"
X-IronPort-AV: E=Sophos;i="5.83,270,1616482800"; d="scan'208";a="205713305"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2021 16:24:27 -0700
IronPort-SDR: OWwiDskuLVwal7RvrJhBnmxFq13cbde+l0IIlh4N00yNW+QuOJ6FhiZh1NVaDdtslnejdnjB6L
 4oFv7/v8K3mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,270,1616482800"; d="scan'208";a="451169501"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 12 Jun 2021 16:24:26 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lsCzK-00016v-Pp; Sat, 12 Jun 2021 23:24:26 +0000
Date: Sun, 13 Jun 2021 07:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master-pending] BUILD SUCCESS
 c9dab53e32d1a1c643bb5bd91c61b78774cfb805
Message-ID: <60c5420f.Qq+veQif1qMkcqZV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_162430_024565_BDCECC01 
X-CRM114-Status: UNSURE (   3.93  )
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
branch HEAD: c9dab53e32d1a1c643bb5bd91c61b78774cfb805  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                        m5307c3_defconfig
nios2                            allyesconfig
m68k                       bvme6000_defconfig
sh                            shmin_defconfig
sh                      rts7751r2d1_defconfig
powerpc64                           defconfig
arm                            hisi_defconfig
ia64                      gensparse_defconfig
sh                           se7721_defconfig
xtensa                generic_kc705_defconfig
arm                        shmobile_defconfig
arm                       imx_v6_v7_defconfig
ia64                          tiger_defconfig
mips                         tb0226_defconfig
arm                           sunxi_defconfig
sh                                  defconfig
sh                          rsk7203_defconfig
mips                      fuloong2e_defconfig
sh                        edosk7760_defconfig
sh                   rts7751r2dplus_defconfig
xtensa                  nommu_kc705_defconfig
arm                  colibri_pxa300_defconfig
m68k                       m5249evb_defconfig
powerpc                          g5_defconfig
mips                           rs90_defconfig
arm                            mps2_defconfig
x86_64                            allnoconfig
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
i386                 randconfig-a002-20210612
i386                 randconfig-a006-20210612
i386                 randconfig-a001-20210612
i386                 randconfig-a004-20210612
i386                 randconfig-a005-20210612
i386                 randconfig-a003-20210612
x86_64               randconfig-a015-20210612
x86_64               randconfig-a011-20210612
x86_64               randconfig-a014-20210612
x86_64               randconfig-a012-20210612
x86_64               randconfig-a013-20210612
x86_64               randconfig-a016-20210612
i386                 randconfig-a015-20210612
i386                 randconfig-a013-20210612
i386                 randconfig-a016-20210612
i386                 randconfig-a014-20210612
i386                 randconfig-a012-20210612
i386                 randconfig-a011-20210612
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210612
x86_64               randconfig-a004-20210612
x86_64               randconfig-a001-20210612
x86_64               randconfig-a003-20210612
x86_64               randconfig-a006-20210612
x86_64               randconfig-a005-20210612

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
