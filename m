Return-Path: <SRS0=h0BU=HZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6535BC433DB
	for <ath10k@archiver.kernel.org>; Tue, 23 Feb 2021 20:37:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD77C64EC3
	for <ath10k@archiver.kernel.org>; Tue, 23 Feb 2021 20:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD77C64EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qfEgnf31P211JIKWwNLvmeU4gHTqKzeLAYaC4jd3vC4=; b=WSUtDXSlLPvM1+c7qEBGgih0i/
	YTcX2Y4xlsZAnpwOz4yUsQt7tD5aFSFny4ZLl2bkwgA/tl9EH6DKpNz1tHV6UonVIaO9A8RrvT8eH
	mnY8qfXiSZWk0V6KaJXVGYIbTKXgk9XtBDTXO121xza+9qsuhrUTkyYFCSLCInzgRRLLMR5Hv0Nq/
	A9cC2qv4CUFJ+6j6a0YulxLIIGwIImgm1/fLkFJVZUA1Vb89OBKSqOfqYNn0SJrda+talMDa74oTT
	lF0JU94B5QRw54wDZmPzceCmhGpD9LZzedx36Sh9CeEwNsDjGg1fiKWRGe5MD1nM/S1ybqSc+fEoo
	8oxCXtSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEeQi-0003pn-S5; Tue, 23 Feb 2021 20:37:12 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEeQf-0003ov-T4
 for ath10k@lists.infradead.org; Tue, 23 Feb 2021 20:37:10 +0000
IronPort-SDR: 1eW+twSHAsHTKKBPuXCFPlbvaDzocbOQQGaqJ9aPkCE2USSy+/bbReZgRUErl0Ii5qE1sO42ny
 2POxSKObcrPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="164161750"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="164161750"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 12:37:02 -0800
IronPort-SDR: wyuFV9bscCaqLRXJ0ozFP+PSWdUSKQvf93HJ3EBe5paBLZt5AmBGSCmuIl7gS/CEPfNBOeK132
 U33dIspUam6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="593374048"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2021 12:37:01 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lEeQW-0001Xc-FL; Tue, 23 Feb 2021 20:37:00 +0000
Date: Wed, 24 Feb 2021 04:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:pending] BUILD SUCCESS
 d8ca9bba80fc82315abfebaa0fd2f863cf1e7e1a
Message-ID: <6035673a.IHOuX86wl4beB6vA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_153710_131295_301DC6B2 
X-CRM114-Status: UNSURE (   5.94  )
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
branch HEAD: d8ca9bba80fc82315abfebaa0fd2f863cf1e7e1a  ath11k: add debugfs for TWT debug calls

elapsed time: 721m

configs tested: 141
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         axm55xx_defconfig
m68k                         amcore_defconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
ia64                         bigsur_defconfig
powerpc                     tqm8560_defconfig
arc                          axs101_defconfig
arm                         s3c6400_defconfig
mips                           jazz_defconfig
arm                            pleb_defconfig
xtensa                           alldefconfig
powerpc                       ebony_defconfig
s390                             alldefconfig
powerpc                     tqm8540_defconfig
sh                            migor_defconfig
powerpc                      ppc44x_defconfig
arm                        spear3xx_defconfig
arm                          moxart_defconfig
sh                          r7785rp_defconfig
mips                           xway_defconfig
mips                        qi_lb60_defconfig
arm                          pxa910_defconfig
arc                          axs103_defconfig
powerpc                    ge_imp3a_defconfig
m68k                       m5475evb_defconfig
arm                       netwinder_defconfig
sh                          rsk7203_defconfig
powerpc                    amigaone_defconfig
mips                      fuloong2e_defconfig
arm                        spear6xx_defconfig
mips                        vocore2_defconfig
arm                            qcom_defconfig
arm                            hisi_defconfig
mips                            gpr_defconfig
c6x                              alldefconfig
nios2                         3c120_defconfig
powerpc                      arches_defconfig
parisc                generic-64bit_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        oxnas_v6_defconfig
openrisc                         alldefconfig
m68k                        m5307c3_defconfig
sh                             espt_defconfig
powerpc                         wii_defconfig
m68k                                defconfig
arm                            zeus_defconfig
nds32                             allnoconfig
sh                               allmodconfig
parisc                generic-32bit_defconfig
openrisc                    or1ksim_defconfig
sh                     magicpanelr2_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        mvebu_v5_defconfig
microblaze                      mmu_defconfig
xtensa                generic_kc705_defconfig
arm                         lpc18xx_defconfig
arc                      axs103_smp_defconfig
x86_64                           alldefconfig
ia64                      gensparse_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      walnut_defconfig
mips                           ip32_defconfig
sh                        edosk7705_defconfig
arm                      footbridge_defconfig
powerpc                     sequoia_defconfig
arm                        multi_v5_defconfig
mips                          ath79_defconfig
mips                      maltaaprp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
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
i386                 randconfig-a005-20210223
i386                 randconfig-a006-20210223
i386                 randconfig-a004-20210223
i386                 randconfig-a003-20210223
i386                 randconfig-a001-20210223
i386                 randconfig-a002-20210223
x86_64               randconfig-a015-20210223
x86_64               randconfig-a011-20210223
x86_64               randconfig-a012-20210223
x86_64               randconfig-a016-20210223
x86_64               randconfig-a014-20210223
x86_64               randconfig-a013-20210223
i386                 randconfig-a013-20210223
i386                 randconfig-a012-20210223
i386                 randconfig-a011-20210223
i386                 randconfig-a014-20210223
i386                 randconfig-a016-20210223
i386                 randconfig-a015-20210223
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
x86_64               randconfig-a001-20210223
x86_64               randconfig-a002-20210223
x86_64               randconfig-a003-20210223
x86_64               randconfig-a005-20210223
x86_64               randconfig-a006-20210223
x86_64               randconfig-a004-20210223

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
