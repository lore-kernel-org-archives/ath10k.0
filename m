Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF15C433F5
	for <ath10k@archiver.kernel.org>; Tue, 14 Dec 2021 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AE9KBBnLaE6iU9fAzm9RULnH1QD/YRdXJLnnufW6B/w=; b=fxCiN2AzDKfaTj
	kYSVfk6dD0eDASLiDyftW3vPr0FBioirY2BAFMxY/FkirnDz2qBpGRF2m0nKyB5CFbHTdgX9dKEOE
	9rVr74TxxUnJPBbkW7EfU3l2C6oIDnka9y8Or68mpkerbKkAT9puYGzkLjqQcoG/Cpm7+FWM9i48x
	DkBPHfgwBOMOsmMH93Nq6iMEV9yN4GXhO2F8bOZ/Wmt323OJgGIRXxlg1J2OQDUarKqT1t+teTXCg
	nKD40zRqiXe28y2HI7B7BjPMFPTQMg/n7AtTBi4oRBxVJXLA/05rQ7gpSCwQ/6gcU0vsXg3NNjVK+
	8jCw+SyMU7wPPl6reFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx7rm-00EAPj-67; Tue, 14 Dec 2021 13:29:14 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx7rj-00EAP5-Kn
 for ath10k@lists.infradead.org; Tue, 14 Dec 2021 13:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639488551; x=1671024551;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=PvNpQzMhsgL9uOZPmoynQ5zvMVdR7Borez8ybo8AQUc=;
 b=aptiLpLlOMvsvxWIHy5T38/ja7leU5iYwFAF7UuhSYAEfcRicvcfrhoB
 /0PyiZxUoDLB9Q0xfprKc6Qp5rFyTylJCid9szQywdKOsRTx/miCHfsiQ
 4/xkqJGRaPqmoy0KygPBYwnT48O5GRZPSjIDH+GtZXsZBlhd+vWZA7zpj
 dNVUOqL44UCRE8RiOxLZZi71uQhnLFCT5ufQnQ6q3TiuPiQO3zW+vGUFC
 eDmH0b3C5LY5WJBSuhzM6fi1FaQlHAfyY0rMuoNqrzrRcNshl8/y7WSrJ
 KvPQEfYQ6ck34LX5aKYRrj3NrIx+37T5qLwrZlFEckaCJCbPjVqASrTS8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325251481"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="325251481"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 05:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="505357819"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 14 Dec 2021 05:29:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mx7rg-0000MI-SB; Tue, 14 Dec 2021 13:29:08 +0000
Date: Tue, 14 Dec 2021 21:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 9faf34b7ef32204bc2df58415acf2fec6d9bce95
Message-ID: <61b89bf6.JJ3vte4B94l6lJIR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_052911_783624_3BC437AA 
X-CRM114-Status: UNSURE (   4.20  )
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
branch HEAD: 9faf34b7ef32204bc2df58415acf2fec6d9bce95  Merge branch 'pending' into master-pending

elapsed time: 1534m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211213
i386                 randconfig-c001-20211214
powerpc                     tqm5200_defconfig
powerpc                      walnut_defconfig
sh                ecovec24-romimage_defconfig
mips                           xway_defconfig
arm                        keystone_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                         assabet_defconfig
h8300                               defconfig
arm                        shmobile_defconfig
xtensa                    smp_lx200_defconfig
arm                         at91_dt_defconfig
mips                        omega2p_defconfig
powerpc                     mpc512x_defconfig
microblaze                          defconfig
arm                          imote2_defconfig
sh                 kfr2r09-romimage_defconfig
x86_64                           allyesconfig
arm                         vf610m4_defconfig
powerpc                   currituck_defconfig
m68k                        mvme16x_defconfig
sh                   sh7770_generic_defconfig
arm                        oxnas_v6_defconfig
arm                          gemini_defconfig
powerpc                    klondike_defconfig
sh                         microdev_defconfig
powerpc                      bamboo_defconfig
arm                           omap1_defconfig
sh                           se7712_defconfig
arm                  randconfig-c002-20211213
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
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
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211214
x86_64               randconfig-a002-20211214
x86_64               randconfig-a003-20211214
x86_64               randconfig-a004-20211214
x86_64               randconfig-a005-20211214
x86_64               randconfig-a006-20211214
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a015-20211213
x86_64               randconfig-a016-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
i386                 randconfig-a016-20211213
arc                  randconfig-r043-20211213
riscv                randconfig-r042-20211213
s390                 randconfig-r044-20211213
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
i386                 randconfig-a001-20211213
i386                 randconfig-a002-20211213
i386                 randconfig-a005-20211213
i386                 randconfig-a003-20211213
i386                 randconfig-a006-20211213
i386                 randconfig-a004-20211213
hexagon              randconfig-r045-20211213
hexagon              randconfig-r041-20211213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
