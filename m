Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101B4C4332F
	for <ath10k@archiver.kernel.org>; Wed, 12 Oct 2022 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZOzAwWY4ckk4G8KcRvznSYTcsTOgL8p8dYsI16Mw2D0=; b=E1wAaVpPoIRRHs
	XY8qw3g3FZlHLHbqZE8WQaTRVjEywwE0ify2wm0VZBUJoUgOeRqNQtgOZaB828RM/m3DHM3xzLmaR
	NfBgNTW8M5MqugLumLBPSWGUx+fHNsYO7LqkU5d6BoCoY0dybEyouP8mrf68YjfkqHR8gqiPe6LzG
	ygnEv/PhDFiu7BKWqA4/MtW5DrVGmIiJ4R2hbKbHgwrGSbG8s8rx0LVE/M4qhnviLuJcoJ3GSlnS5
	XkhT3qgRLLwucgwPiwLQGeBfKbBHvQmSC9mGD2h1X2ajZp9N8xUsDiAQtF4JpCxN2qPso+INaiaug
	Oq/GnYyE/eA7LTl9AggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oihuP-009Dqo-PW; Wed, 12 Oct 2022 20:00:53 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oihuM-009Dq0-Rs
	for ath10k@lists.infradead.org; Wed, 12 Oct 2022 20:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665604850; x=1697140850;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bNRmPDJ69/f40v5m+zs/o/IzI1oIkTpgFSTAiKuL2Aw=;
  b=Y9Qr8GY2i2IZIF+K5MRJ4//EnB+xO9ZJi/OREb6QzTUZeIoqN5A+i9eJ
   bX+O097pt8+gvhIW1XKzN18y8hmQuFR3dnWR7j2zA6PbmIqovWztruDRy
   vnVxcWmGE9p9M+vFRec6G6LLGUyvAtje8MTGo2HjNEomfiyALZcb+L1P/
   4qTrrGSHtqhAuPz2sPEBP+NlFy/mdh0HdUsHnLmf3rex7GAdLHF9qwvxU
   mzziLTGPvhqks53reOPhN1poVXm3TzAeqC2c818d1aCOd0zpFHRAj+q98
   TmriAYSYlxdLA0wLbdA07Cs9VwB4Twimdw6o/sU1oamox0w91e7XgcdSf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="284622339"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="284622339"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 13:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="604684829"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; 
   d="scan'208";a="604684829"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Oct 2022 13:00:46 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oihuH-00048N-0z;
	Wed, 12 Oct 2022 20:00:45 +0000
Date: Thu, 13 Oct 2022 03:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 620b992fbdb39cff62ac991b31047209830e7edf
Message-ID: <63471cba.TVrBXc+wRjONeUu0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_130050_942492_1EEB6F11 
X-CRM114-Status: UNSURE (   4.30  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: 620b992fbdb39cff62ac991b31047209830e7edf  wifi: ath12k: avoid unnecessary initialization of local variable

elapsed time: 721m

configs tested: 92
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
riscv                randconfig-r042-20221012
arc                  randconfig-r043-20221012
s390                 randconfig-r044-20221012
powerpc                           allnoconfig
mips                             allyesconfig
arc                                 defconfig
powerpc                          allmodconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
sh                               allmodconfig
m68k                             allyesconfig
i386                          randconfig-a001
arm                                 defconfig
m68k                             allmodconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a003
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
s390                                defconfig
x86_64                        randconfig-a004
s390                             allmodconfig
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                          randconfig-a005
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                        randconfig-a006
s390                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
xtensa                           allyesconfig
sh                           se7750_defconfig
powerpc                     rainier_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                        keystone_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc834x_mds_defconfig
mips                       bmips_be_defconfig
sh                          landisk_defconfig
sh                         ecovec24_defconfig
mips                         bigsur_defconfig
sh                           se7780_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                        mini2440_defconfig
powerpc                     stx_gp3_defconfig
arm                         lpc18xx_defconfig
powerpc                  storcenter_defconfig
powerpc                 linkstation_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig

clang tested configs:
hexagon              randconfig-r041-20221012
hexagon              randconfig-r045-20221012
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a005
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
powerpc                 mpc8560_ads_defconfig
powerpc                      obs600_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
mips                           mtx1_defconfig
powerpc                      katmai_defconfig
mips                     cu1830-neo_defconfig
mips                      maltaaprp_defconfig
x86_64                        randconfig-k001
powerpc                        icon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
