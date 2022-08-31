Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E14FECAAD1
	for <ath10k@archiver.kernel.org>; Wed, 31 Aug 2022 20:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T954wdgIkGlaHny/KcZFSr2ORuqk+QG7g1VJBPUBCW8=; b=H+UGASX9+ZAdo/
	I+tSc9zLNeyy1YehugotkeiH+9Om6U58HoE/SgfUKp0vNDF8GDqDAdEz9fe8yJZbQ0z0ksx19S+nd
	nBsW1ya66OvXjmVlSEG5OmO92Mh2nIB2IUe5rrFd2uKAeYSrdS7bHp3kKxHPUOfUb7kAu35cAj1oR
	107rBDhzkME6NeEurt46LExYwH6Q1PJpS4f5VNcejMt1912RpJ6ohMXDb7N36aTMoVxZsfTpUJAL1
	ZN1xXhqNYmGA1weQMenewi7IDx52j6pGxKSQBCIvEXYdhIZKQLPYilPYBf9xpp3abyGIS7EoLmOwK
	nfNi1by9kZFKfYS7NBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTU6c-0086zY-Er; Wed, 31 Aug 2022 20:14:34 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTU6Y-0086yJ-1D
	for ath10k@lists.infradead.org; Wed, 31 Aug 2022 20:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661976870; x=1693512870;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kD/JLoiya87SBVEQF3Uxg0wRZpMu+f/BP3SL0yNcX0U=;
  b=ZWje9VTfPMwCGVYTAq1W/djZReBy/HB8QiMV2IopnBtT4NzpJs5aOSYf
   YiYCLGhde6y4K/GBiiKf0jyMoK6gmRnT6o20oqedfePX5vq5HDaTe0WxA
   Ncf9Rb0k5IlNqCoyF0sEtboMNNU0EskDIpAZDDBC+OY0G/ji5ZD6sUjvs
   uwIguG6eaBlAjVdrWT2H9odaYCtynIdncJ0ER4BXs7f1P4XN8THUblf2s
   FwyVxqp5Iea75P/VkqC4f+SYuSXQwb/3HEpA2MHF5L8o8CWhgvPj+Z/Er
   eziAXPv1+ILKUv9FMvlwq8iaiGIhwTOA3BMKF+hNpEDwmqmNtahB6JbE6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275284060"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="275284060"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 13:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; 
   d="scan'208";a="680555663"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2022 13:14:26 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTU6T-0000fc-1m;
	Wed, 31 Aug 2022 20:14:25 +0000
Date: Thu, 01 Sep 2022 04:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 6e84b93f9c478aba000a03b3b384ef13ef1cf127
Message-ID: <630fc112.nQtUWSSKsE2ZiKi8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_131430_109361_0C77E681 
X-CRM114-Status: UNSURE (   5.63  )
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
branch HEAD: 6e84b93f9c478aba000a03b3b384ef13ef1cf127  wifi: ath10k: Delay the unmapping of the buffer

elapsed time: 722m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220830
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a002
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                              defconfig
m68k                             allmodconfig
i386                                defconfig
x86_64                           allyesconfig
arm64                            allyesconfig
arc                              allyesconfig
x86_64                               rhel-8.3
arm                              allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a003
x86_64                        randconfig-a015
i386                          randconfig-a016
i386                          randconfig-a001
ia64                             allmodconfig
i386                          randconfig-a005

clang tested configs:
hexagon              randconfig-r045-20220830
riscv                randconfig-r042-20220830
hexagon              randconfig-r041-20220830
s390                 randconfig-r044-20220830
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a015
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
