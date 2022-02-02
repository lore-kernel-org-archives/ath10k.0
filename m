Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE109C433F5
	for <ath10k@archiver.kernel.org>; Wed,  2 Feb 2022 02:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3oa3fS9vt/FlvXkBQMG/zLyps6Gb3kTjwquS+UXonEg=; b=ZFmaWIc0iFiLuP
	B8j/4NLeMNZNdIHj9bXgioXLwh43dto0rcnYhVVO1z6zgAOM2WBbsIiVX/stVcCLmJHMxnz/LzrAE
	AQLNEPB/5iaJ8Pgq4laHV6YjyBWajZvfWFl3N+cMu0rm+WsrQ+vUkLQv4GPl4HQctaebmHPovIpW9
	LfihY60u5GgiBgNNiE2B/1936+nKDef8IuvRsSNZkWPO2FujPsK1NmE5FxbsoEyek5iMTYnKfDtWR
	24t/1EFWydDhsZvijBhuZLCtqpL1lBZ9kWs2LHgRC85WRg9DJYaiKjePoJ4rEx9XsDv2kQgP+Y/02
	1BSO0S0ebNqYod5kndCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF5n0-00E28n-DW; Wed, 02 Feb 2022 02:54:34 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF5mu-00E26l-CV
 for ath10k@lists.infradead.org; Wed, 02 Feb 2022 02:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643770468; x=1675306468;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=71UfmTQSUe+Mt/TrqagMOeId/SAd/M9xuY+m+/KzZ4U=;
 b=OytMKHt/0KZuJhS2Ban1azTkx3isdJGLHWn88LR41yI5Y37G4i6uzmM1
 xDlBLwS4KYmmM8vkfgV3sm45wDOCcCW5zjxZqcOuMlWuOqV68kpAG94hy
 KuY4oAKNK+LGsD1eoPBSqASRtgvz7ItNlhJbunzqzmK8MFxuri+8/w7Dv
 0KtnWOqf3F8bnpdp4mfTTgX2jC5x1ywKNiHmmCNrHVWBaVtYgpQm4ylbX
 dbIt/0/jBNWqhORvs+wOK2kJyFbnUk2cBK3m05scPLfN7m9oczDzjbD4s
 chwD6WAaD4xof15JK546qrJEbjHOs8Ix1p8NHHACB5099UPk2Al19vcpc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="248060623"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="248060623"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 18:54:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="497597945"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 01 Feb 2022 18:54:26 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nF5mr-000U22-D1; Wed, 02 Feb 2022 02:54:25 +0000
Date: Wed, 02 Feb 2022 10:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 208c1619a68da011b7e2aba487a64358024fb499
Message-ID: <61f9f247.NDe9Gg1DxW4+Jp3w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_185428_485010_88E5C197 
X-CRM114-Status: UNSURE (   6.44  )
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
branch HEAD: 208c1619a68da011b7e2aba487a64358024fb499  Add localversion-wireless-testing-ath

elapsed time: 729m

configs tested: 160
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
i386                          randconfig-c001
arc                        nsim_700_defconfig
powerpc                     tqm8555_defconfig
sh                           se7206_defconfig
powerpc                    amigaone_defconfig
powerpc                      ppc6xx_defconfig
arc                     nsimosci_hs_defconfig
arm                        trizeps4_defconfig
arm                        mvebu_v7_defconfig
sh                        apsh4ad0a_defconfig
sh                        dreamcast_defconfig
arm                      jornada720_defconfig
arm                           h3600_defconfig
openrisc                 simple_smp_defconfig
sh                           se7705_defconfig
sh                                  defconfig
mips                        vocore2_defconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
arm                        multi_v7_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                      gensparse_defconfig
riscv                    nommu_k210_defconfig
arm                           corgi_defconfig
arm                         s3c6400_defconfig
sparc64                             defconfig
mips                         db1xxx_defconfig
mips                         mpc30x_defconfig
m68k                           sun3_defconfig
powerpc                  iss476-smp_defconfig
sh                          rsk7203_defconfig
sh                        edosk7760_defconfig
sh                           se7721_defconfig
powerpc                     stx_gp3_defconfig
sh                         ecovec24_defconfig
mips                         rt305x_defconfig
powerpc                      pasemi_defconfig
powerpc                     taishan_defconfig
xtensa                              defconfig
h8300                     edosk2674_defconfig
arm                         axm55xx_defconfig
sh                             espt_defconfig
s390                       zfcpdump_defconfig
m68k                       m5475evb_defconfig
sh                          sdk7786_defconfig
arm                        oxnas_v6_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
arc                  randconfig-r043-20220131
s390                 randconfig-r044-20220130
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                          collie_defconfig
arm                     davinci_all_defconfig
arm                       mainstone_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                   microwatt_defconfig
arm                     am200epdkit_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                          allmodconfig
mips                          ath79_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220130
hexagon              randconfig-r041-20220131
s390                 randconfig-r044-20220131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
