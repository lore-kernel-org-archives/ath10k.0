Return-Path: <SRS0=591D=LR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B57FC48BC2
	for <ath10k@archiver.kernel.org>; Wed, 23 Jun 2021 03:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F1B36135A
	for <ath10k@archiver.kernel.org>; Wed, 23 Jun 2021 03:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F1B36135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s5tqdrRaH4dlE5VWbIhEqHWrZYHQaFVpa6t/6UaEcj0=; b=jXerzypYozel/h
	T7Be1WjVhKdMQuw/Q+WtrhF2nq5Zj3UdAuWUJ7Zs4LxX1ZBHQCA1EBCmSnZZDEn8xmf7BUnSbaITC
	u9LxpkG5y7gNVywcAJp/daDP930rhwh96oIaRKI2tnxTpnPIwsWLmxLqYNYuLh2xgCLGVF2PY5H2O
	aYYnUEanprRlkkDe69YyGu6AJMmmTEDdIxczEKYCQOOMDg7dpqhIxegeV8fxUEshcybIjZlIvhUs5
	E5aCES4+5vxBMAS8PJmNd9TR5XtBYpNtwNFsbQBNmCmeYob6VaDq5eouUfO75a416xvLHn1kMNUr3
	Gz90+1DUPgialVTLHF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvtrm-009CBy-Vu; Wed, 23 Jun 2021 03:47:55 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvtrk-009CB8-HU
 for ath10k@lists.infradead.org; Wed, 23 Jun 2021 03:47:54 +0000
IronPort-SDR: PQkQTiFt1GuMw45S/MO+FV9xLsoiiQGD/qqrvRiiiZly4ISSvxMsFYZ1iGuw09F3N4RqqauJGW
 zYGNlQSo7QdQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="205359687"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="205359687"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 20:47:42 -0700
IronPort-SDR: jPpo+Xs/RJJSC7U38EN+hAos1uqJwjjuFvCdY3WVuEzl3RuxPr6wjhouh710quETIlkSeBvXap
 1VebYXqTwaow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="473998536"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2021 20:47:40 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lvtrX-0005hS-E6; Wed, 23 Jun 2021 03:47:39 +0000
Date: Wed, 23 Jun 2021 11:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master-pending] BUILD SUCCESS
 7cf3c1c028df2eb5c9f2450c1391af5261f5fe62
Message-ID: <60d2aec8.n9dDyUi6ZtF7w3wW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_204752_648843_1ABD7B19 
X-CRM114-Status: UNSURE (   5.36  )
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
branch HEAD: 7cf3c1c028df2eb5c9f2450c1391af5261f5fe62  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 114
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                   motionpro_defconfig
arc                        vdk_hs38_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     tqm5200_defconfig
powerpc                    gamecube_defconfig
powerpc                    sam440ep_defconfig
sh                           se7705_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                          malta_defconfig
xtensa                           alldefconfig
powerpc                      makalu_defconfig
h8300                     edosk2674_defconfig
sh                           se7724_defconfig
arc                           tb10x_defconfig
mips                           ip28_defconfig
arm                     eseries_pxa_defconfig
powerpc                     ep8248e_defconfig
sh                   rts7751r2dplus_defconfig
arm                       imx_v4_v5_defconfig
arm                      tct_hammer_defconfig
sh                           se7712_defconfig
arm                             ezx_defconfig
sh                                  defconfig
arm                        mvebu_v5_defconfig
sh                   sh7770_generic_defconfig
powerpc                     kmeter1_defconfig
microblaze                          defconfig
arm                         orion5x_defconfig
mips                         bigsur_defconfig
powerpc                      katmai_defconfig
mips                        nlm_xlr_defconfig
powerpc                     ppa8548_defconfig
arm                             rpc_defconfig
powerpc                     sequoia_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210622
i386                 randconfig-a002-20210622
i386                 randconfig-a003-20210622
i386                 randconfig-a006-20210622
i386                 randconfig-a005-20210622
i386                 randconfig-a004-20210622
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
i386                 randconfig-a011-20210622
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
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
