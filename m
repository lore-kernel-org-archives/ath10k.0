Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6505C3DA6E
	for <ath10k@archiver.kernel.org>; Fri, 23 Dec 2022 05:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2wliG1kfJqqeaeV6PDy9P7Mu6Jv60DxKGMIKQCyWGeI=; b=P0+YwOHbBvLMkT
	LtKc7jes686xh/2qY9bgAIf3jMTV3mDNIcVpyy7+I+tc4Blzfm5hM/U8WWm9AANo3J5EY8rjui7Jx
	jXa3DRN9UsR2BAOMPwnR62cYpUkRflIFuiDI/6xn41dISY+/1Tdf1r61AM6XZrahqBjB81+6Sb9kx
	Snv65FdO01cN0HpyHkNAjL/W4iefZW2RSNRwnylUoYUudTc+p42kV6azzifeAKALn3Fbp4w+sRz8M
	m3nIIbueMXHPKcpzo4n6j73cJusJg3Bk697AJPX0pnLUsyh4oiOjvQcLEqsyDcZ8qlWDy6m5p1P08
	7tMFWnWOXIjF6iMVcfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aj7-003xPd-M0; Fri, 23 Dec 2022 05:36:13 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aj2-003xLe-89
	for ath10k@lists.infradead.org; Fri, 23 Dec 2022 05:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671773768; x=1703309768;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HLB/lHLlJsS97UvNlcVeWCOuS964J0IQcW1FbOFcAu8=;
  b=HC/3KDG80VeBAXxs0hhwk9q6P6k8Gaq/xpAjNSs0hfqsq5xKMaKv4m1w
   V3kZgh9aznAwqzz1FHTj966eu5mGuWkMbrYyXnt+oVo2Ry+wQhz49+uF1
   E0ahU/tb97ji+0okHEcepRJaNIy7u5uvc3yYKPH5vUaOv6WqYvoJGapYx
   ir773cgKKwdhac+LjROG1yR01eQEPewkiM+eoxIf/i45jOvQseO0b8w1C
   NAv8liRajf5VY91fMH+dawknwUK+ntrTK9hSusd09+Cu4FXVP4dvtJdns
   Bw5ruKBO6niqG+IlCONrLR9AHqmjrAFB0k06RZ1CBptfSGJE2dsOHf0A3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="382536963"
X-IronPort-AV: E=Sophos;i="5.96,267,1665471600"; 
   d="scan'208";a="382536963"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 21:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="720533747"
X-IronPort-AV: E=Sophos;i="5.96,267,1665471600"; 
   d="scan'208";a="720533747"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Dec 2022 21:36:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8aiv-000CRz-2u;
	Fri, 23 Dec 2022 05:36:01 +0000
Date: Fri, 23 Dec 2022 13:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 5834aa7099b0f7c16cfc24af0aca4e065c568347
Message-ID: <63a53e0c.H288GupHxLhhmZ7i%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_213608_429326_31AFDD00 
X-CRM114-Status: UNSURE (   4.83  )
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
branch HEAD: 5834aa7099b0f7c16cfc24af0aca4e065c568347  Add localversion-wireless-testing-ath

elapsed time: 728m

configs tested: 93
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64               randconfig-a002-20221219
m68k                             allyesconfig
x86_64               randconfig-a003-20221219
x86_64               randconfig-a001-20221219
m68k                             allmodconfig
x86_64               randconfig-a004-20221219
arc                              allyesconfig
s390                                defconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
s390                             allmodconfig
x86_64               randconfig-a005-20221219
ia64                             allmodconfig
x86_64               randconfig-a006-20221219
powerpc                           allnoconfig
x86_64                           allyesconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allmodconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64                            allnoconfig
i386                 randconfig-a004-20221219
i386                 randconfig-a001-20221219
i386                 randconfig-a003-20221219
i386                 randconfig-a002-20221219
xtensa                  cadence_csp_defconfig
openrisc                         alldefconfig
sh                        sh7785lcr_defconfig
i386                 randconfig-a005-20221219
x86_64                           rhel-8.3-syz
i386                 randconfig-a006-20221219
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
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
