Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B1BC433FE
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 23:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zMI7yqH80xYIdBKRcTqEk8PcBEG2sGWnKOPMIBD6Y44=; b=W01WEAkOowPQl9
	c2Zgq1bDPoE0lCQSjRTNIDJIndPWspU7kf7ETCzblFZPoOWN3KmWnTquPCFDKW9b7b5bpmF3Ya59a
	JuVbu0pUNrTTpYLSWLihz6L+GBOF6hrHAjHIep0B6Os7XFYgSUD+W+h/R2oD5IwYsEoD83GIFgdXW
	h6hBYhJA82A7kVCXq5FRXSeqxWV95y+nPGGUbuWJSDHE90F2lvLxeVhV1W3ce+vzAf/DrcJIP0LQM
	hkJAWHhvNoCcWGLFkPKN9tjbWB7CGl2d1d71Zq/Pc0UGkT/6zfl/Ik7GloIMD0HIvNhCkcZ58nGYk
	PX/fmPmgJpVP26frh4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNNUW-002hFG-1V; Thu, 24 Feb 2022 23:25:44 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNNUR-002hD9-1q
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 23:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645745139; x=1677281139;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=QkZDfPcLSqHdK9grquoPDcwSYcWHpyUEnGZiigtGBcw=;
 b=dkG6KVDZ5oKvVSmKwNbpJD3bDwEH28mRlGftA/M7YQZ2Cd2Egr2+EQXo
 GLI0jwuknhOFeOxWeWX4tvAW6XPRHxPn/xIhPbBj9VRVxoxUoKv83a6Ks
 6EXs8162iqLE76l7yXLE2yP5wOisCD3zgMk2vA+RGuItPjLMp5uq5M1Dg
 KtduXldQpHQzWeoHH8bi43b5qyLzPzSBR2NJRx2rEclOoI0ahcj0meFKQ
 XxYHMsz0ZaP1swxZu6SFkNiPqsU5eC7soe34jcQZH1R3+VIgDNZZM2o4N
 hxZklVyY1M0Ie+6Rvp0HKK0h6HTyQY7KwlA/YkHSQ6tMsAOnMYc0ciAnF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="235882599"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="235882599"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 15:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="548988271"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 24 Feb 2022 15:25:36 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nNNUO-0003ZD-6I; Thu, 24 Feb 2022 23:25:36 +0000
Date: Fri, 25 Feb 2022 07:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 a0d8f5420188c29a9debd819a87bbc565a78ce40
Message-ID: <621813be.cSWob6WdcDOD8xBZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_152539_196533_46E1C160 
X-CRM114-Status: UNSURE (   5.80  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: a0d8f5420188c29a9debd819a87bbc565a78ce40  Merge branch 'ath-next' into ath-qca

elapsed time: 735m

configs tested: 132
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
arm                            zeus_defconfig
powerpc                       maple_defconfig
m68k                           sun3_defconfig
mips                          rb532_defconfig
mips                        bcm47xx_defconfig
arm                             ezx_defconfig
sh                           se7721_defconfig
mips                           jazz_defconfig
sh                          rsk7269_defconfig
powerpc                      makalu_defconfig
sh                               alldefconfig
mips                  decstation_64_defconfig
ia64                            zx1_defconfig
powerpc                      pcm030_defconfig
powerpc                     redwood_defconfig
arc                         haps_hs_defconfig
arm                          gemini_defconfig
arc                     nsimosci_hs_defconfig
arm                         s3c6400_defconfig
powerpc                     stx_gp3_defconfig
arm                  randconfig-c002-20220223
arm                  randconfig-c002-20220224
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
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
sparc                            allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220223
s390                 randconfig-r044-20220224
arc                  randconfig-r043-20220224
riscv                randconfig-r042-20220224
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                        randconfig-c007
arm                  randconfig-c002-20220224
powerpc              randconfig-c003-20220224
i386                          randconfig-c001
mips                 randconfig-c004-20220224
s390                 randconfig-c005-20220224
riscv                randconfig-c006-20220224
mips                          rm200_defconfig
arm                       mainstone_defconfig
mips                      pic32mzda_defconfig
powerpc                     powernv_defconfig
powerpc                      katmai_defconfig
arm                          pcm027_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc836x_mds_defconfig
arm                                 defconfig
arm                         hackkit_defconfig
powerpc                    mvme5100_defconfig
powerpc                     tqm8560_defconfig
riscv                    nommu_virt_defconfig
powerpc                     mpc5200_defconfig
arm                        neponset_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                       aspeed_g4_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220223
hexagon              randconfig-r041-20220223
riscv                randconfig-r042-20220223
hexagon              randconfig-r045-20220224
s390                 randconfig-r044-20220223
hexagon              randconfig-r041-20220224

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
