Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41229C433EF
	for <ath10k@archiver.kernel.org>; Tue, 21 Jun 2022 21:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=imSPRhudHyxO2vMSPf66BGCaUH4a99O9foteDOR6aW8=; b=llDBt+Eyhk+wNK
	IcjpjOKjQT5mMukCS393LgsF0eqcq3G90MQYq3LdpEaJ5iGmxFriK6ep0uH9R2u6+v09OSSKw/HRU
	76juSts9Zz573vb2UXIoy4Sz2LkXYOgptXumaBwqkWSQm2TWzfxDuVPy4Gs6nd+bXyAjczz2jlQ8x
	6iHqPn1MfpEMxF6EtHkIXRSLoKpt9Zk6dwGD6ZYb1H6ZSO+k/cKR6aPiFIUClqyzCdFlPdRinm07F
	L6bpeb2xFIoxz0p9qOzdof46fLneEg08th075VcZsMML7C57UXHASPVbXSbVsTszLeuuuA/2OtPC+
	c1SSZlM68g5UpI/xLP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3l63-007EsR-JQ; Tue, 21 Jun 2022 21:07:39 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3l1r-007Cfz-63
	for ath10k@lists.infradead.org; Tue, 21 Jun 2022 21:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655845399; x=1687381399;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VRd77KWH1PJLTTqAsZN6tmayQpHmAZUCuKtNJs8zt3I=;
  b=ljhlbBPAGfkrzXs0yP/yMq+H5iLsnuiuINVdGwTd+o4KeMWyHrPViHcq
   F10Vtf9fThJ4JOQBtwioW80MWSoBDhL8xAJtzY2sNe/2EJ7ZMx3waCDsN
   8gBS5cPwjAv4h7DQ8g6T4uxyoKA+JQB4QZWwK97y1ABLbwe3KyQCUMuyV
   YW9Bq/LSvPP/FsAd0o3WMpmzTCKl9gCcXSv7S9ridcPPTyFZUCvmKSOHb
   sKTptO79XMSCMoxHxVhSC9I/mb/8AH4bsIAAIG3eiRPFfpsSm4xEHcILg
   gKrpdGV90jptQUeJK3mHT4tXCOkwz56W+Za0/CGUnpVt7FIP7DnQqKfhk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="305684685"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="305684685"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 14:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="538193786"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Jun 2022 14:03:14 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3l1m-0000Qt-9j;
	Tue, 21 Jun 2022 21:03:14 +0000
Date: Wed, 22 Jun 2022 05:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 c35538ce3b892dd4b41e24e887a434f296792959
Message-ID: <62b23205.+JIdfm2RFGkE9X6r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_140319_356504_FFD9A586 
X-CRM114-Status: UNSURE (   6.85  )
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
branch HEAD: c35538ce3b892dd4b41e24e887a434f296792959  Add localversion-wireless-testing-ath

elapsed time: 978m

configs tested: 97
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc64                            defconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                 randconfig-a003-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a004-20220620
i386                 randconfig-a002-20220620
i386                 randconfig-a005-20220620
i386                 randconfig-a006-20220620
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220619
riscv                randconfig-r042-20220619
arc                  randconfig-r043-20220620
s390                 randconfig-r044-20220619
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a013-20220620
x86_64               randconfig-a012-20220620
x86_64               randconfig-a015-20220620
x86_64               randconfig-a016-20220620
x86_64               randconfig-a011-20220620
x86_64               randconfig-a014-20220620
i386                 randconfig-a012-20220620
i386                 randconfig-a016-20220620
i386                 randconfig-a014-20220620
i386                 randconfig-a015-20220620
i386                 randconfig-a013-20220620
i386                 randconfig-a011-20220620
hexagon              randconfig-r041-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622
s390                 randconfig-r044-20220620
hexagon              randconfig-r045-20220619
hexagon              randconfig-r045-20220620
riscv                randconfig-r042-20220620
hexagon              randconfig-r041-20220619
hexagon              randconfig-r041-20220620

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
