Return-Path: <SRS0=QvBg=FX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F9BC4361B
	for <ath10k@archiver.kernel.org>; Sat, 19 Dec 2020 00:56:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4115323BA7
	for <ath10k@archiver.kernel.org>; Sat, 19 Dec 2020 00:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4115323BA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PhGRMpFqNMn8PV8h+tirWAfWduVhRWaMudlJzmPjOMc=; b=2yI4ylag2exnM7znvsXolZbe/X
	0DYbNvcFqR8zLMXe/eSKVYzFx4lrjqvc3F3Lzx65IGPc7nvmqYGyHSMd1QBp475PqVRlk1In0H/MY
	rIA4GZl093kZ6CO+mKtbuae2NorrH14CnzAGrugMnQtfwKSIO4L2D8KICdDWb/HtNiM2rLHKZg61Q
	hxGaXcX1+4CKbxsQyWztqZc31MIgjSaac8fTg09FI2zh2XjVLVUBTXW8F2pXPtLOeYuBH8iTWu8pT
	J2H1BE6Hcq8vj5wcOzVVkP0HHD62CqCojmSBK6hDHPKyXtxEirrAWtR4InJDYuOgPwe8Z+d8Tq9KE
	1Mjqc3Bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqQWx-0005QP-Ji; Sat, 19 Dec 2020 00:55:31 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqQWs-0005Pj-K0
 for ath10k@lists.infradead.org; Sat, 19 Dec 2020 00:55:29 +0000
IronPort-SDR: fx5b63b5Dg81trni2FVZfJgcv6ET3e5LDbH1yCSmZagJImqeiDwhIZWmFYsGVHu4npkVrLcHJ7
 RE91IelSiZCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9839"; a="172966172"
X-IronPort-AV: E=Sophos;i="5.78,432,1599548400"; d="scan'208";a="172966172"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2020 16:55:25 -0800
IronPort-SDR: dVudP+MblL+wH33lSWX2HKCBWstgaNkKXJsYsGYIayL+WhzNzRm9cqXlVA3VMAV9l/FSYKSXEz
 uk5GnV41Jjtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,432,1599548400"; d="scan'208";a="354316480"
Received: from lkp-server02.sh.intel.com (HELO c4fb2a2464e8) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 18 Dec 2020 16:55:23 -0800
Received: from kbuild by c4fb2a2464e8 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kqQWo-0000Yh-R9; Sat, 19 Dec 2020 00:55:22 +0000
Date: Sat, 19 Dec 2020 08:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 e59bec9a660ad2a4a1cc7f12c905470ae87ae307
Message-ID: <5fdd4f6d.n0P+sKm4fWe3Yai8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_195526_884908_DB260F1F 
X-CRM114-Status: UNSURE (   8.06  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath-qca
branch HEAD: e59bec9a660ad2a4a1cc7f12c905470ae87ae307  Merge branch 'ath-next' into ath-qca

elapsed time: 726m

configs tested: 142
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     tqm8541_defconfig
m68k                         apollo_defconfig
arm                        mini2440_defconfig
powerpc                 canyonlands_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                  mpc885_ads_defconfig
m68k                          hp300_defconfig
sh                          landisk_defconfig
arm                        shmobile_defconfig
m68k                          sun3x_defconfig
powerpc                   motionpro_defconfig
powerpc                      ep88xc_defconfig
parisc                           alldefconfig
arm                           omap1_defconfig
mips                            e55_defconfig
xtensa                    xip_kc705_defconfig
powerpc                      ppc40x_defconfig
sh                         ap325rxa_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                     taishan_defconfig
arm                         assabet_defconfig
c6x                              alldefconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     tqm8540_defconfig
mips                           ci20_defconfig
sh                        sh7757lcr_defconfig
arm                          imote2_defconfig
arm                            zeus_defconfig
sh                            titan_defconfig
arm                          pxa3xx_defconfig
arm                         at91_dt_defconfig
mips                     cu1000-neo_defconfig
powerpc                     sequoia_defconfig
s390                                defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     sbc8548_defconfig
mips                    maltaup_xpa_defconfig
arm                        spear3xx_defconfig
sh                           se7750_defconfig
arm                         hackkit_defconfig
arm64                            alldefconfig
mips                        jmr3927_defconfig
powerpc                     tqm8548_defconfig
um                            kunit_defconfig
arm                         shannon_defconfig
sh                         apsh4a3a_defconfig
arm                          tango4_defconfig
mips                  decstation_64_defconfig
i386                             alldefconfig
mips                      fuloong2e_defconfig
riscv                               defconfig
arm                            mps2_defconfig
arm                       cns3420vb_defconfig
powerpc                     kilauea_defconfig
sh                          rsk7201_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201217
x86_64               randconfig-a006-20201217
x86_64               randconfig-a002-20201217
x86_64               randconfig-a005-20201217
x86_64               randconfig-a004-20201217
x86_64               randconfig-a001-20201217
i386                 randconfig-a001-20201217
i386                 randconfig-a004-20201217
i386                 randconfig-a003-20201217
i386                 randconfig-a002-20201217
i386                 randconfig-a006-20201217
i386                 randconfig-a005-20201217
x86_64               randconfig-a016-20201218
x86_64               randconfig-a013-20201218
x86_64               randconfig-a012-20201218
x86_64               randconfig-a015-20201218
x86_64               randconfig-a014-20201218
x86_64               randconfig-a011-20201218
i386                 randconfig-a014-20201217
i386                 randconfig-a013-20201217
i386                 randconfig-a012-20201217
i386                 randconfig-a011-20201217
i386                 randconfig-a015-20201217
i386                 randconfig-a016-20201217
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64               randconfig-a016-20201217
x86_64               randconfig-a012-20201217
x86_64               randconfig-a013-20201217
x86_64               randconfig-a015-20201217
x86_64               randconfig-a014-20201217
x86_64               randconfig-a011-20201217
x86_64               randconfig-a003-20201218
x86_64               randconfig-a006-20201218
x86_64               randconfig-a002-20201218
x86_64               randconfig-a005-20201218
x86_64               randconfig-a001-20201218
x86_64               randconfig-a004-20201218

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
