Return-Path: <SRS0=Mu6E=H2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B701C433DB
	for <ath10k@archiver.kernel.org>; Wed, 24 Feb 2021 19:12:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD9E64E85
	for <ath10k@archiver.kernel.org>; Wed, 24 Feb 2021 19:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD9E64E85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gEt3fMS+aeZ5JoWCSXvKd2SM4EaufnQEpSSz0WZntSw=; b=zNurit74PLyXcsfozpJx+Z1IBP
	YYA/aMdCe14ln8LLOsVBYSFlmN4mHeNwHS0YAylN79UwKFJ1UZE8Ic6j/bUxNcspBeO643b+b0SoP
	wO24/GVuls8wKxRvojytB1FZEvEoQSAb6Hw9UDsQfu8EwgmK92Jqd05rDHCrvrUvWtxMoajcWw7WK
	Zcdd/90FabhX6/5z3J3Pc+YtJOaP7mNCijXEW70Lvi0afmqTngyIEeIm0Pky9kqNzhw56Hw1wwdYG
	oBZ9KuIRkNkOxejspA7EIyiWQhJLMgRbqc6Cjlec6eP00W9R7AFoNsy+3zQ8quS2DbG+wSWmo0a8w
	MA91RR/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEzZn-0006tS-0j; Wed, 24 Feb 2021 19:12:00 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEzZg-0006qd-4L
 for ath10k@lists.infradead.org; Wed, 24 Feb 2021 19:11:55 +0000
IronPort-SDR: yFgMKvUO9mJi9U+ODVMuRkx/FKZ03b0fnJL1UdozTEt9Lj1dGXPcx7skUqVAiv2Cx5Nl2FWGLh
 PSUpZ5BCVokQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9905"; a="184581871"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="184581871"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2021 11:11:50 -0800
IronPort-SDR: 4CPQMmM+d4ZM+AX/WnJk1+d4cC6tgRP8Gr+FKnrnrAgRiS/EB5s3ustt1af0ntO9G2JGtKHwwL
 10qp63CLuWQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; d="scan'208";a="593762859"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 24 Feb 2021 11:11:48 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lEzZa-0002Gj-UU; Wed, 24 Feb 2021 19:11:46 +0000
Date: Thu, 25 Feb 2021 03:11:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 e3de5bb7ac1a4cb262f8768924fd3ef6182b10bb
Message-ID: <6036a4e9.r/zLdu2hTXck9cTz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_141152_445000_1045C69F 
X-CRM114-Status: UNSURE (   6.72  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: e3de5bb7ac1a4cb262f8768924fd3ef6182b10bb  ath11k: fix thermal temperature read

elapsed time: 725m

configs tested: 145
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                             allyesconfig
arm                   milbeaut_m10v_defconfig
arm                        vexpress_defconfig
sh                           sh2007_defconfig
powerpc                     kmeter1_defconfig
arm                          collie_defconfig
nios2                               defconfig
mips                           ip27_defconfig
powerpc                       ebony_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     stx_gp3_defconfig
nds32                            alldefconfig
powerpc                      chrp32_defconfig
sh                          landisk_defconfig
arc                                 defconfig
arm                      tct_hammer_defconfig
arm                          pcm027_defconfig
arm                           sama5_defconfig
xtensa                         virt_defconfig
mips                     cu1000-neo_defconfig
arm                            pleb_defconfig
sh                        apsh4ad0a_defconfig
mips                           ci20_defconfig
mips                        nlm_xlp_defconfig
xtensa                generic_kc705_defconfig
arm                           omap1_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     tqm8560_defconfig
powerpc                     tqm5200_defconfig
mips                     loongson1c_defconfig
ia64                        generic_defconfig
m68k                       m5275evb_defconfig
sh                             shx3_defconfig
powerpc                      pasemi_defconfig
sh                           se7751_defconfig
mips                           xway_defconfig
csky                             alldefconfig
powerpc                   currituck_defconfig
mips                         tb0226_defconfig
arm64                            alldefconfig
mips                    maltaup_xpa_defconfig
arm                            hisi_defconfig
sh                           se7619_defconfig
nios2                         3c120_defconfig
powerpc                      arches_defconfig
parisc                generic-64bit_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        oxnas_v6_defconfig
powerpc                   bluestone_defconfig
sh                               alldefconfig
mips                      malta_kvm_defconfig
powerpc                     taishan_defconfig
mips                      pistachio_defconfig
sh                            migor_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8541_defconfig
powerpc                     redwood_defconfig
sh                            titan_defconfig
sh                          lboxre2_defconfig
arm                       imx_v6_v7_defconfig
arm                        mvebu_v5_defconfig
arm                         assabet_defconfig
c6x                              alldefconfig
m68k                          hp300_defconfig
mips                     cu1830-neo_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
powerpc                   lite5200b_defconfig
powerpc                     pseries_defconfig
mips                           rs90_defconfig
mips                         mpc30x_defconfig
openrisc                    or1ksim_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
sh                               allmodconfig
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
