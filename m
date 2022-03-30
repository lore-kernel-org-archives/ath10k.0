Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C456C433F5
	for <ath10k@archiver.kernel.org>; Wed, 30 Mar 2022 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t/WP2eEwA1zEoasVKg3v4eBSX7+uletpO8ELVIA/3LI=; b=oYqfeOknUryyUM
	feV0ttDcUGoMH7Psyrj7sygHly7SjnwNBuFe0TsUZB8c/ERzhgeaw/QdesQlhH3rSgjadYX91rCmo
	k96sPgFQrY652KBKBOb0lmRill1urAPVHra0ffT+E4vNIpFC0c9jlkPp+GRZeoH1AgK6Mbbc5k7jO
	KjKbfWgoKJRF3UiDsPhqY7M4g5VUTpZkuSUu2NHc8ZTX/7eikYttxpD/yZWoO3N/zOhuWnwDENwOi
	2VseyWG+WTHaoCG5JVchwWs6IlOJfbzOSeay4y9jGVObGGYr8cw+VSrNGsLkua4C4AX3rWY+U+QC/
	xIEI4Nhh2y3rlWS3Gv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTSB-00Eip4-KQ; Wed, 30 Mar 2022 08:13:19 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTS8-00Eini-1U
 for ath10k@lists.infradead.org; Wed, 30 Mar 2022 08:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648627996; x=1680163996;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=VB+ATe7qlCpNS0RFj7+iPFfl/v3P+hKav4UvzcHAiVM=;
 b=aDzdPSMAUnoco6izJQicnCELXycBx0WYW8HrN2KCGJHNpz3jbrgf8QuC
 e0ZnnCxtuPKIkOB/i+lwrlI3Nhjrr98V1R13vngv7hlJVyWh6uuLOVGMc
 yl9p+9EpYKW7bZMl+V7VUgOoBFe7hWSZJ0XRSi7E7QII9/oJpg3IFcjpt
 uCE9yvqRxBp8wAOTTl42IjABdqJShypPrDBWH13gE5TsnzpXB0gQYxOG9
 1ubBPe+UsmqNlCTAdYudgvh+9Aps4yyyMLF59Cm4/WlIT3p9lFtbPgHf8
 a8oXAzmn74UuIbj92e9ngRfXiBZYhQX2TNT6tA8yofIwx3brKjgroJGRE w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="241637804"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="241637804"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 01:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="719893459"
Received: from lkp-server02.sh.intel.com (HELO 7a008980c4ea) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 30 Mar 2022 01:13:14 -0700
Received: from kbuild by 7a008980c4ea with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nZTS5-00004w-BJ; Wed, 30 Mar 2022 08:13:13 +0000
Date: Wed, 30 Mar 2022 16:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 27d727d5dfe53288c416e6a59f4e73d84ee18e78
Message-ID: <62441100.pXrD8H+WxfNKJV0h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_011316_185083_023EEC0A 
X-CRM114-Status: UNSURE (   5.81  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: 27d727d5dfe53288c416e6a59f4e73d84ee18e78  ath11k: add support to search regdb data in board-2.bin for WCN6855

elapsed time: 9971m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
i386                          randconfig-c001
arm                        clps711x_defconfig
sh                          urquell_defconfig
sh                           se7724_defconfig
arc                         haps_hs_defconfig
mips                         mpc30x_defconfig
arc                           tb10x_defconfig
powerpc                     taishan_defconfig
powerpc                     pq2fads_defconfig
m68k                          hp300_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     tqm8555_defconfig
arc                          axs101_defconfig
m68k                        stmark2_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                    klondike_defconfig
arm                  randconfig-c002-20220323
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
sparc                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220323
s390                 randconfig-r044-20220323
riscv                randconfig-r042-20220323
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                          g5_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     kilauea_defconfig
powerpc                   bluestone_defconfig
arm                      tct_hammer_defconfig
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220323
hexagon              randconfig-r045-20220323

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
