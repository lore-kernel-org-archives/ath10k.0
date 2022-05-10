Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D54C433EF
	for <ath10k@archiver.kernel.org>; Tue, 10 May 2022 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=poScSSnpR47kg5tC1Ro2xhi4hU7zcd0UhFYsMrJSk5E=; b=JiPOMIeDl+H0t+
	AReeDGKUTU+5HgUc5UpWknU+qkenooE9yzy2BDA8+TqfBAtGpsRLxnHqAMoDo0OvdtrlYWTHBusXK
	5OdwXC5yjYOjfs2RFrt7hCqsz3gAIdvbmgWEPIuxywhnsZwjtbxyPfbIOcCBJo4bxF79RbWgpvoEl
	1kJ/W0ZT4b8hIRkCXYmGTa6KxneRoUqGD4s0wURXI9uszkv2ygwzIVWaINE7JmTtt52N97J4FmGlN
	wAZ7a+6OXDOnp9yGaNtE+ERRMzDBPSJMay4NUSGAXUhBSsCqFDiIWWrsxDxDuZaawTljGB+C/imxL
	bRNUprncMI7cwDOVsloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noKlD-000TYc-Uu; Tue, 10 May 2022 07:58:23 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noKlB-000TXl-9Z
 for ath10k@lists.infradead.org; Tue, 10 May 2022 07:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652169501; x=1683705501;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Gf3e0SIV+DDe/vdQ3AWppz+RtXXYVbeY5s2VWhfwQPc=;
 b=erlA9N7nT9nwhgW5L4U5Q5X5tCAhk5rNGjqNss2jeRuqJQ73I53dVoqC
 ylBjoK0jSI75F4UkmX4cVENrOR6kDtdTG4WOGdfG0bU907WS226bLyyRi
 jepInIdPPsrJAt/dYeOBk5j31IQHsCCN4mfE2myzPPgIg0jgAAbDFQxSm
 ijVkww99RDbHsVDJ1kOJp+xRyQ1DTdaqup51zH4uvR4k9GU2l/Os/OpFc
 Svxh/Y4SZ9h4nK2heJ3CHBh3FRGHxTeTsP84dEG+F22bSan21NMwgh2bu
 y0buqJFYeBSsUOiatBQt6oms/5V4xgi6yPMkgp0NujZ/r9GvSofQ+tHXs A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="332333631"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="332333631"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 00:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="623351926"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 10 May 2022 00:58:17 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1noKl6-000HWs-UW;
 Tue, 10 May 2022 07:58:16 +0000
Date: Tue, 10 May 2022 15:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 9497b7880ffd71fcbd469970f6ef45bb55877bfd
Message-ID: <627a1afc.LdBbUm8g4jd60/Uv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_005821_425002_BA551E5E 
X-CRM114-Status: UNSURE (   4.51  )
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
branch HEAD: 9497b7880ffd71fcbd469970f6ef45bb55877bfd  ath11k: reset 11d state in process of recovery

elapsed time: 1047m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                 randconfig-c001-20220509
parisc                           alldefconfig
sh                          urquell_defconfig
arm                         lubbock_defconfig
sh                          sdk7780_defconfig
sh                           se7712_defconfig
arm                        clps711x_defconfig
arc                              alldefconfig
sh                          landisk_defconfig
arm                       omap2plus_defconfig
arm                         axm55xx_defconfig
mips                    maltaup_xpa_defconfig
mips                             allmodconfig
powerpc                    klondike_defconfig
arm                        realview_defconfig
arc                          axs103_defconfig
sh                             sh03_defconfig
sh                           sh2007_defconfig
arm                      integrator_defconfig
xtensa                           allyesconfig
arm                          badge4_defconfig
powerpc                     taishan_defconfig
arm                      jornada720_defconfig
sh                           se7724_defconfig
m68k                        m5272c3_defconfig
sh                           se7780_defconfig
mips                         cobalt_defconfig
sh                        edosk7705_defconfig
powerpc                      ppc40x_defconfig
arm                            qcom_defconfig
mips                        vocore2_defconfig
arc                     nsimosci_hs_defconfig
sh                         apsh4a3a_defconfig
arm                           corgi_defconfig
mips                 decstation_r4k_defconfig
s390                       zfcpdump_defconfig
arm                            hisi_defconfig
powerpc                      makalu_defconfig
sh                             espt_defconfig
um                                  defconfig
arm                       aspeed_g5_defconfig
sh                         ecovec24_defconfig
x86_64               randconfig-c001-20220509
arm                  randconfig-c002-20220509
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
parisc                              defconfig
parisc64                            defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20220509
x86_64               randconfig-a012-20220509
x86_64               randconfig-a016-20220509
x86_64               randconfig-a013-20220509
x86_64               randconfig-a011-20220509
x86_64               randconfig-a014-20220509
i386                 randconfig-a011-20220509
i386                 randconfig-a013-20220509
i386                 randconfig-a016-20220509
i386                 randconfig-a015-20220509
i386                 randconfig-a014-20220509
i386                 randconfig-a012-20220509
arc                  randconfig-r043-20220509
s390                 randconfig-r044-20220509
riscv                randconfig-r042-20220509
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20220509
i386                 randconfig-c001-20220509
powerpc              randconfig-c003-20220509
riscv                randconfig-c006-20220509
arm                  randconfig-c002-20220509
mips                 randconfig-c004-20220509
mips                          ath79_defconfig
powerpc                      ppc64e_defconfig
mips                        workpad_defconfig
arm                          pcm027_defconfig
arm                          collie_defconfig
mips                     loongson1c_defconfig
mips                     cu1830-neo_defconfig
x86_64               randconfig-a006-20220509
x86_64               randconfig-a002-20220509
x86_64               randconfig-a001-20220509
x86_64               randconfig-a004-20220509
x86_64               randconfig-a005-20220509
x86_64               randconfig-a003-20220509
i386                 randconfig-a004-20220509
i386                 randconfig-a006-20220509
i386                 randconfig-a002-20220509
i386                 randconfig-a003-20220509
i386                 randconfig-a001-20220509
i386                 randconfig-a005-20220509

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
