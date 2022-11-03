Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00207C4332F
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 05:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nB6Cda6LQIJYga3EX+GwV0eYgaA8q5RRrXs/a8tA6tU=; b=mzJoHrrjqQmIEa
	LCh1Z/ejkFBrh2n5CN4Z6Msazy6/wLt/r423ydSnSxREGqEX1Ck3RcGTlCg14nUXQbiYt7tImIwTw
	Off0XB99M5/NqlzogOLpt9EuqRSsEa09jRNZsHzm6kW4oPXA6SOPqXvRd0XD6L+Gi92Lxg95riutu
	TTPq68P6swsko/8UsHFiYCTSntBUom+MaJxPTGD64xTCQZscqqG+SgzaDmVhhBgcKQAxkFqyJVa6z
	7vF3eUnB9BF3J3eEF1AUgMJFVGGz09U08P0zoDJ2tEQsF+jahKB1gK/1MzdingldK+e35fa7pBfAL
	pqbhRufLmWJIkdlIV0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqT5Z-00GCo3-Ev; Thu, 03 Nov 2022 05:48:29 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqT5V-00GCmS-6E
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 05:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667454505; x=1698990505;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=boJRgRthQSyXJo08cP1H7kyufAZlMfcpTU86nCgBD6A=;
  b=e9/XU/TWifUw8kbBY1QGvZ9lal/wHFFQF7HdrrDPNuDijsamZFRIMsEh
   Fq7qMs1IHRwMxyXaA72QQfEMpkSK25Yi2FEulEEbKzQDsoI4AnuNL6/xw
   ULAvJmLA77vzIu0yEl9mXby6MnKX0ZdEYX1jnVrcMYZM+pPbeFktx1zla
   NvV+RwOH8F0wV4/xOzwGWf/m3pEcOKyQkRa5ZBz2PuyFfO5X8ps6Ip7eQ
   bwGUR6MIbHx7fY4KHccbw1+BuHdJhNfRq3SUCZk2nQmg4nw/W7dp5lOy2
   zyKibH59V8rlvXUYM7V3/QcxDmhS6bdRkOid7xA69p0VQeXcGDqtvuyE4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="289305548"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="289305548"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 22:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="585664097"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="585664097"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2022 22:48:19 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqT5P-000FYA-04;
	Thu, 03 Nov 2022 05:48:19 +0000
Date: Thu, 03 Nov 2022 13:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 bd13a1d98839392147b79202d09134adc1e28e11
Message-ID: <6363560a.oHXDQvMdgzx6BmIe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_224825_284978_733C390B 
X-CRM114-Status: UNSURE (   4.64  )
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
branch HEAD: bd13a1d98839392147b79202d09134adc1e28e11  Add localversion-wireless-testing-ath

elapsed time: 725m

configs tested: 82
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
ia64                             allmodconfig
alpha                            allyesconfig
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
sh                               allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
arc                  randconfig-r043-20221102
i386                          randconfig-a003
s390                 randconfig-r044-20221102
i386                          randconfig-a005
x86_64                              defconfig
riscv                randconfig-r042-20221102
i386                                defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a014
x86_64                           allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                             allyesconfig
x86_64                        randconfig-a015
m68k                         apollo_defconfig
mips                     decstation_defconfig
sparc                       sparc32_defconfig
m68k                          multi_defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                        multi_v7_defconfig
arm                         s3c6400_defconfig
sh                        apsh4ad0a_defconfig
arm                           tegra_defconfig
sh                          rsk7203_defconfig
i386                          randconfig-c001
sh                                  defconfig
arc                            hsdk_defconfig
sh                 kfr2r09-romimage_defconfig
parisc                           allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r041-20221102
i386                          randconfig-a002
i386                          randconfig-a006
hexagon              randconfig-r045-20221102
i386                          randconfig-a004
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                        randconfig-a012
riscv                randconfig-r042-20221103
hexagon              randconfig-r041-20221103
hexagon              randconfig-r045-20221103
s390                 randconfig-r044-20221103
x86_64                        randconfig-a014
x86_64                        randconfig-a016
mips                     loongson1c_defconfig
mips                           mtx1_defconfig
powerpc               mpc834x_itxgp_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
