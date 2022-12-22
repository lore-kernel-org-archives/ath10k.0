Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EE5C4332F
	for <ath10k@archiver.kernel.org>; Thu, 22 Dec 2022 01:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hyRizoleFRBXxXBd4qHGN0U2Cw9oNavuHCipBMwVmUc=; b=xJ6T9roJ5+m5/R
	gX68EBOrN5VGlwBrCk9fWIiQ9NLltXpYjfuy87rAsA4IVFrp6RrOlAMbOTNapIVbaKnIcss0/5Xsj
	OwTJTnTWYdONaGCMk1w5+yEsH8ARPuDBj/n68oKkYe6hn85NwUa6PUycH8BEK9GDt/aaJ4HZbqlbz
	f5xKKdCs4HIlUmG9pNvY6WhTkKxiAMGvJHJ8IjNYdDrXhVvZbCfIjoAn2Fp+TqmtbzeCW0N3Hrxxp
	6whbE65RznFCLoHcqOIXto/XSipnkfBRALM8+fgj9ZOXrkxt/ob9k5Qlc2O2+bpkgaQD/ewUvvImG
	QsaOM4P5zeRuUYI7mWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ARf-005B4X-2e; Thu, 22 Dec 2022 01:32:27 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ARY-005AzU-6d
	for ath10k@lists.infradead.org; Thu, 22 Dec 2022 01:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671672740; x=1703208740;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8QMvV4V+D/bU/TGiaeQJVO+0dxLQyTMB3QZVeiOXZUw=;
  b=cZOT/uucS+n48OuMxbZ4JSLb452auCo6s7WrrekAOYx9VRAapZROJAwq
   VprMQX/XiAcKv9e97X2JBdM8cM1iErxApZ7weZbD1R3g3EUgF54fJ5KvB
   KPNWv7resLeLyVXCXL5Mefqtkj6QfkoZEoOnijEv4DRyw2AM9Wmu2Ko1o
   koltNVJLHB7HCHeN2KeHVpS7Bl4f6xyi44sh+p2Mj3Pi9aqmPrP2j3Kfm
   B0Qu/yUaSTV2FMj5fp9oRucj4kbfMTwzrtjW0qOb/5hNPLu6zHbYpeLM7
   t/aMFQ8ns/7MYuHcoAcHTwVbwGkiYVfhS7jm2qhJtgGAOjazJ6hRstnFF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="384364276"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="384364276"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 17:31:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="645024809"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; 
   d="scan'208";a="645024809"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Dec 2022 17:31:58 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8ARB-000B5I-2c;
	Thu, 22 Dec 2022 01:31:57 +0000
Date: Thu, 22 Dec 2022 09:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 f1e36321f3d07b50926918f088dbdcd5bcd79e9f
Message-ID: <63a3b352.PVhG/IgpNGVS0Ozv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_173220_378048_B334CF39 
X-CRM114-Status: UNSURE (   3.96  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: f1e36321f3d07b50926918f088dbdcd5bcd79e9f  wifi: ath10k: Implement duplicate detection for non-offloaded PCIe

elapsed time: 722m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
x86_64               randconfig-a003-20221219
x86_64               randconfig-a001-20221219
x86_64               randconfig-a004-20221219
x86_64               randconfig-a002-20221219
x86_64               randconfig-a005-20221219
x86_64               randconfig-a006-20221219
alpha                            allyesconfig
m68k                             allyesconfig
i386                 randconfig-a004-20221219
i386                 randconfig-a001-20221219
m68k                             allmodconfig
i386                 randconfig-a003-20221219
arc                              allyesconfig
i386                 randconfig-a002-20221219
arm                                 defconfig
riscv                randconfig-r042-20221218
sh                               allmodconfig
x86_64                           rhel-8.3-bpf
i386                 randconfig-a006-20221219
ia64                             allmodconfig
i386                 randconfig-a005-20221219
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                                defconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20221219
mips                             allyesconfig
arm                  randconfig-r046-20221219
arc                  randconfig-r043-20221218
arm                              allyesconfig
s390                 randconfig-r044-20221218
i386                             allyesconfig
arm64                            allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
powerpc                      mgcoge_defconfig
mips                            ar7_defconfig
arm                            lart_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                           viper_defconfig
powerpc                  iss476-smp_defconfig
sh                           sh2007_defconfig
powerpc                 linkstation_defconfig
m68k                        m5307c3_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                       eiger_defconfig
xtensa                              defconfig
m68k                                defconfig
m68k                            mac_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                          randconfig-c001
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig

clang tested configs:
arm                  randconfig-r046-20221218
hexagon              randconfig-r041-20221218
hexagon              randconfig-r045-20221219
s390                 randconfig-r044-20221219
hexagon              randconfig-r041-20221219
hexagon              randconfig-r045-20221218
i386                 randconfig-a014-20221219
i386                 randconfig-a012-20221219
i386                 randconfig-a013-20221219
x86_64               randconfig-a011-20221219
x86_64               randconfig-a012-20221219
riscv                randconfig-r042-20221219
x86_64               randconfig-a014-20221219
i386                 randconfig-a015-20221219
x86_64               randconfig-a013-20221219
x86_64               randconfig-a016-20221219
i386                 randconfig-a016-20221219
x86_64               randconfig-a015-20221219
i386                 randconfig-a011-20221219
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                          rhel-8.3-rust
s390                 randconfig-r044-20221221
riscv                randconfig-r042-20221221
hexagon              randconfig-r045-20221221

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
