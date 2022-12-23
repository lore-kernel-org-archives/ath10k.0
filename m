Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE439C4332F
	for <ath10k@archiver.kernel.org>; Fri, 23 Dec 2022 05:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8+hgriRk1ifNCLlUTWBQOz3yS3ioGV+gr3Uhn57XYds=; b=eAwNkqX5KZKfc1
	2T4c2ddRidBa1lkjTEC8AjiIQDHqoUmKjzyCAVWOT3or4bqVdjxz7tzDcs990wQH0Cg2f03e5ENKt
	+HHftUQ85AdkPmxvhaT42B0RdIOBsnjQh+F0/VlFJSf17WWn9LDHSGLJ9qUpW0bPpemU7kkehhqio
	QQ2diGnD0C1hYldnhI+tN3JXajt7BN3e3QSx0bg3GHVMgvzfliqZh50sLkgScFheLZB43XgJ/QY0h
	b5uAX3Fi5Ih6H9+pwuOoF3as+IWik8HXjvlDydwNKf08BXBJCn/8riPJsGK26QvhJ3l51wXhfLcCz
	74yGBvSGpSY8qrqO5tQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ajA-003xQK-Nr; Fri, 23 Dec 2022 05:36:16 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aj1-003xLf-So
	for ath10k@lists.infradead.org; Fri, 23 Dec 2022 05:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671773767; x=1703309767;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Fbc/quFoBAZZez6JE4DeYU8xEnMHAF5TrZ0aZKW7vn8=;
  b=B/DcMgHC+PbctNPhqnVUqljtLyaJH/PvWx1Qc9JeeEEH6G2XywwAwdqm
   FWIpYLtnvbZX9ekZLopocBeJ26J+K3yrUO3z9PgjYI5k9HBDOArVXIXqU
   f+QI3jr1b+od8UBF0UnoTLZMK0s8sKyAAFvWm0t8po+xTxKOX8cjXVkof
   iss/q/y32ib6VtJUxycuy6Zf3TX3Bu2V11CQoQVT5uHSA/vFCxwR0Wk3v
   HuXMH5Kbh7G8ctHaMlNijJG3nEouNqNZyGekR8i4lROWNlEoOIwB/laWX
   mckiFEN+fXh4ZMn0VQtqFwim9i6ERyRFqEbOVEaE97gRyOyXUGQpuj6X2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="384665098"
X-IronPort-AV: E=Sophos;i="5.96,267,1665471600"; 
   d="scan'208";a="384665098"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 21:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="826210594"
X-IronPort-AV: E=Sophos;i="5.96,267,1665471600"; 
   d="scan'208";a="826210594"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Dec 2022 21:36:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8aiw-000CSD-03;
	Fri, 23 Dec 2022 05:36:02 +0000
Date: Fri, 23 Dec 2022 13:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 b3a663f0037d20e77bbafd9271a3d9dd0351059d
Message-ID: <63a53e06.zwgvxCFmPDqNTrEs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_213608_076108_4EADCD53 
X-CRM114-Status: UNSURE (   3.63  )
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
branch HEAD: b3a663f0037d20e77bbafd9271a3d9dd0351059d  wifi: ath9k: remove most hidden macro dependencies on ah

elapsed time: 729m

configs tested: 93
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
s390                             allmodconfig
um                           x86_64_defconfig
s390                                defconfig
x86_64                              defconfig
powerpc                           allnoconfig
x86_64                               rhel-8.3
s390                             allyesconfig
x86_64               randconfig-a002-20221219
x86_64               randconfig-a003-20221219
x86_64               randconfig-a001-20221219
x86_64                           allyesconfig
x86_64               randconfig-a004-20221219
m68k                             allyesconfig
x86_64               randconfig-a005-20221219
m68k                             allmodconfig
x86_64               randconfig-a006-20221219
arc                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
i386                                defconfig
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                            allnoconfig
i386                             allyesconfig
xtensa                  cadence_csp_defconfig
openrisc                         alldefconfig
sh                        sh7785lcr_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                 randconfig-a001-20221219
i386                 randconfig-a003-20221219
i386                 randconfig-a002-20221219
i386                 randconfig-a004-20221219
i386                 randconfig-a005-20221219
i386                 randconfig-a006-20221219
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
s390                 randconfig-r044-20221218
arm                  randconfig-r046-20221219
arc                  randconfig-r043-20221218
arc                  randconfig-r043-20221219
riscv                randconfig-r042-20221218
powerpc                    amigaone_defconfig
m68k                         amcore_defconfig
m68k                        m5272c3_defconfig
arc                        nsimosci_defconfig
mips                         bigsur_defconfig
m68k                          atari_defconfig
sh                        apsh4ad0a_defconfig
m68k                             alldefconfig
xtensa                  nommu_kc705_defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
m68k                        mvme147_defconfig
sh                             espt_defconfig
xtensa                    xip_kc705_defconfig
arm                      jornada720_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
arm                        trizeps4_defconfig
sh                            shmin_defconfig
um                               alldefconfig
powerpc                      makalu_defconfig
s390                 randconfig-r044-20221222
arc                  randconfig-r043-20221222
riscv                randconfig-r042-20221222
sh                           se7724_defconfig
sh                          rsk7203_defconfig
arm                            xcep_defconfig
mips                           xway_defconfig

clang tested configs:
i386                 randconfig-a014-20221219
i386                 randconfig-a012-20221219
i386                 randconfig-a013-20221219
i386                 randconfig-a011-20221219
x86_64                          rhel-8.3-rust
i386                 randconfig-a015-20221219
i386                 randconfig-a016-20221219
x86_64                        randconfig-k001
x86_64               randconfig-a015-20221219
x86_64               randconfig-a013-20221219
x86_64               randconfig-a012-20221219
x86_64               randconfig-a016-20221219
x86_64               randconfig-a014-20221219
x86_64               randconfig-a011-20221219

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
