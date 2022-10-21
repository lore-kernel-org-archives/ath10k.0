Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDBBC433FE
	for <ath10k@archiver.kernel.org>; Fri, 21 Oct 2022 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wfGoKm0r5GchhASroG9HcLg4HLhH/b7/hKXi8JT6ZzM=; b=WF49lNBi5MJvLu
	UxEidL0TnKoDQwZA5COjdTpehYOiGbQV1JVNQLfHZQjts6FPQb+XpeeN4uzJsFOU2bGUd7tn4f3XO
	QABYfq9HBH9Oh/A1ZG/MgcNqh5QvZ6grN9U7zj/PFr5wC0uWKmxGQOeqZV7mpOF1Eun8Zn6OA5MTI
	040Uw7RI2V5dqKiXel4JwG3UZfOTTWG9tgS0MM5R2SGa7YB+GT84/ilGYL1e2WNiwiacPxtYD5hHJ
	RIrranXWeS/iuoRp/IwkZ7VxT22/hIr7h2mIUKO20P+k9cUSqEdER5P58zmtBRpnQih7U8FCoqXT3
	GllJzciTZni3fsg81Cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om1WI-00APlS-GR; Fri, 21 Oct 2022 23:33:42 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om1WF-00APl8-B1
	for ath10k@lists.infradead.org; Fri, 21 Oct 2022 23:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666395219; x=1697931219;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=c1qSmRTXjaU6dN11DCg1ot9kjfwYrRsKzqtkAqk+Uzg=;
  b=EA+AZ5mxGVp0Ku0dj/nYGq1E6Cl6NsJD+EjEW3DasiwotoE+ALjsfD33
   1W4G7fRr/xzFcHpf/04ghMjiQfvV+N9vU0JpblD0BJNZ+MhzLo3p9XrnG
   5Rwx9vnRQ4iJ2WWtHOMJZw+EgRYWGaIPYLKu3TGyG0/OMH+YCEd5v/HGR
   lSMpJggw2jajNWHabzEe8NsUejt7g1Lgxbyf9iEZQ8KmDwpN4gBFlcoEf
   y7923hY3rMOAsx6Eqyl7RBxSdu3JHwaxpyl6LKlgHbzNpodMRuG3F0KC8
   QwmAd8uin2P2iDpatMWaQxTqGGtwZ7ff5Cfy3B32hv9IHvNPKo+Kt6bgC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="371350566"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="371350566"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 16:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="661793560"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; 
   d="scan'208";a="661793560"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Oct 2022 16:30:17 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1om1Sy-00032l-0n;
	Fri, 21 Oct 2022 23:30:16 +0000
Date: Sat, 22 Oct 2022 07:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 a7acf32c70f478de657b30befc7eaffd378e8659
Message-ID: <63532b7c.NF6G/bkKcD9G4Kx2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_163339_489456_A4BF8F12 
X-CRM114-Status: UNSURE (   4.50  )
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
branch HEAD: a7acf32c70f478de657b30befc7eaffd378e8659  wifi: ath12k: do empty initializer instead of memset

elapsed time: 720m

configs tested: 138
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                                 defconfig
alpha                               defconfig
i386                                defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
um                             i386_defconfig
mips                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                           allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a004
m68k                             allmodconfig
x86_64                        randconfig-a002
arc                              allyesconfig
x86_64                        randconfig-a006
alpha                            allyesconfig
x86_64                        randconfig-a013
s390                                defconfig
s390                             allmodconfig
i386                             allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm                                 defconfig
s390                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
arm64                            allyesconfig
i386                          randconfig-a012
arm                        oxnas_v6_defconfig
openrisc                         alldefconfig
powerpc                       holly_defconfig
arm                              allyesconfig
i386                          randconfig-a016
i386                          randconfig-a005
arc                  randconfig-r043-20221019
arc                  randconfig-r043-20221020
riscv                randconfig-r042-20221020
s390                 randconfig-r044-20221020
arm                        multi_v7_defconfig
sh                           se7721_defconfig
powerpc                         ps3_defconfig
m68k                           virt_defconfig
i386                          randconfig-c001
ia64                          tiger_defconfig
arm                        mvebu_v7_defconfig
mips                    maltaup_xpa_defconfig
sparc                       sparc32_defconfig
sh                          sdk7786_defconfig
parisc                           alldefconfig
mips                      fuloong2e_defconfig
arc                           tb10x_defconfig
sh                            titan_defconfig
powerpc                     pq2fads_defconfig
arm                         nhk8815_defconfig
arm                       omap2plus_defconfig
arm                        clps711x_defconfig
powerpc                 linkstation_defconfig
arc                            hsdk_defconfig
openrisc                 simple_smp_defconfig
arc                              alldefconfig
m68k                          atari_defconfig
powerpc                     tqm8548_defconfig
arm                          lpd270_defconfig
arc                  randconfig-r043-20221018
s390                 randconfig-r044-20221018
riscv                randconfig-r042-20221018
arm                          exynos_defconfig
alpha                             allnoconfig
arc                               allnoconfig
arm                           u8500_defconfig
csky                                defconfig
parisc                generic-64bit_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                           se7722_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20221019
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
powerpc                    gamecube_defconfig
hexagon              randconfig-r045-20221018
hexagon              randconfig-r041-20221018
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017
riscv                randconfig-r042-20221019
hexagon              randconfig-r041-20221020
x86_64                        randconfig-k001
hexagon              randconfig-r045-20221020
arm                        magician_defconfig
hexagon              randconfig-r045-20221019
hexagon              randconfig-r041-20221019
s390                 randconfig-r044-20221019
arm                       netwinder_defconfig
mips                        maltaup_defconfig
powerpc                 mpc8560_ads_defconfig
arm                      pxa255-idp_defconfig
mips                          ath79_defconfig
powerpc                      acadia_defconfig
arm                             mxs_defconfig
arm                        vexpress_defconfig
mips                       rbtx49xx_defconfig
arm                           spitz_defconfig
powerpc                   microwatt_defconfig
arm                         orion5x_defconfig
powerpc                      obs600_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
