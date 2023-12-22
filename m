Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C56C46CD3
	for <ath10k@archiver.kernel.org>; Fri, 22 Dec 2023 00:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I8SoxRlTW0nS3lb52GsQXZFlEfE/U76t8Pd5YYczupM=; b=lAL+aSMPKTlfsg02Mt8EO4hCni
	m9HVNLNvbDQW1L4rVS+HQn64v3WjPD1cyqjszuJesXrgVOUgmr5DH759rRSeHTt7oWiUKNDcn5F3h
	iQNQoaPrBglC+Fex0uDapFeSx77z1FsDjVlxiXJbIOoj0wu9mXUr3wYL7H8TjfHBSB0oUIlgReGxX
	50stbpIa2F2WKm76+fQ5ldXNxPzaTkXLyqj9AO3qlWH5XrVwhz79hLlHo22gdNawH1g2WARjRkwbe
	bqNn/fbIqTjnHMdyzKqDDUgCrn13F/vizbLcaql6IC/c0RPYxhyhdJDo6hos+WW5R9G18i9AKOizf
	5E/nkJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGTI4-004VUz-22;
	Fri, 22 Dec 2023 00:21:24 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGTI1-004VUe-0r
	for ath10k@lists.infradead.org;
	Fri, 22 Dec 2023 00:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703204481; x=1734740481;
  h=date:from:to:cc:subject:message-id;
  bh=noxHH5WHhYnsYwAUjHhsHukdzsK1DelHbM48fm+JNMc=;
  b=hhK/Nu4jd4X861ap6dKm2OrZIZIKKoSFsm82/zn5t77vUvzibSpEj1V5
   7f9Mu/UhAIfgg8Eim6y5/b4/AvqoqTfUGjloJzbvQkOp3g672z8bPrCHc
   7ejXemuAVwu+B49e/N3ZvXDLIOpfvZE9FXKFfDQzRmfKLTupleqokh3Dn
   Mgbqgxa1mTnWrtfGkbDj9ZNL0zwQuFJ6gLbNk1srl7eHx12x8Axga5CXI
   JJD0dUm0Dy5X2Kgu+3nPUwGlI0wT4A3ihqpcKzoOdOUkDuHw2uiUhJoSu
   VlsGp0SrKQhA1ahy2OU5raoIjOeWAtmoJY9ZsrOpDF6GJ8W6m7ed9jqfj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="381040431"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="381040431"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2023 16:21:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="950094544"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="950094544"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Dec 2023 16:21:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGTHj-0008uQ-1D;
	Fri, 22 Dec 2023 00:21:07 +0000
Date: Fri, 22 Dec 2023 08:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 eceb0dd553946a0b13ab918e63b946f794e5a2c4
Message-ID: <202312220824.MoGBeDoX-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_162121_397123_33492174 
X-CRM114-Status: UNSURE (   4.52  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: eceb0dd553946a0b13ab918e63b946f794e5a2c4  Merge branch 'pending' into master-pending

elapsed time: 1764m

configs tested: 91
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
arc                              allmodconfig   gcc  
arc                              allyesconfig   gcc  
arc                   randconfig-001-20231221   gcc  
arc                   randconfig-002-20231221   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                   randconfig-001-20231221   clang
arm                   randconfig-002-20231221   clang
arm                   randconfig-003-20231221   clang
arm                   randconfig-004-20231221   clang
arm64                            allmodconfig   clang
arm64                 randconfig-001-20231221   clang
arm64                 randconfig-002-20231221   clang
arm64                 randconfig-003-20231221   clang
arm64                 randconfig-004-20231221   clang
csky                             allmodconfig   gcc  
csky                             allyesconfig   gcc  
csky                  randconfig-001-20231221   gcc  
csky                  randconfig-002-20231221   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
hexagon               randconfig-001-20231221   clang
hexagon               randconfig-002-20231221   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231221   clang
i386         buildonly-randconfig-002-20231221   clang
i386         buildonly-randconfig-003-20231221   clang
i386         buildonly-randconfig-004-20231221   clang
i386         buildonly-randconfig-005-20231221   clang
i386         buildonly-randconfig-006-20231221   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231221   clang
i386                  randconfig-002-20231221   clang
i386                  randconfig-003-20231221   clang
i386                  randconfig-004-20231221   clang
i386                  randconfig-005-20231221   clang
i386                  randconfig-006-20231221   clang
i386                  randconfig-011-20231221   gcc  
i386                  randconfig-012-20231221   gcc  
i386                  randconfig-013-20231221   gcc  
i386                  randconfig-014-20231221   gcc  
i386                  randconfig-015-20231221   gcc  
i386                  randconfig-016-20231221   gcc  
loongarch             randconfig-001-20231221   gcc  
loongarch             randconfig-002-20231221   gcc  
nios2                 randconfig-001-20231221   gcc  
nios2                 randconfig-002-20231221   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20231221   gcc  
parisc                randconfig-002-20231221   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20231221   clang
powerpc               randconfig-002-20231221   clang
powerpc               randconfig-003-20231221   clang
powerpc64             randconfig-001-20231221   clang
powerpc64             randconfig-002-20231221   clang
powerpc64             randconfig-003-20231221   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20231221   clang
riscv                 randconfig-002-20231221   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20231221   gcc  
s390                  randconfig-002-20231221   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20231221   gcc  
sh                    randconfig-002-20231221   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20231221   gcc  
sparc64               randconfig-002-20231221   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20231221   clang
um                    randconfig-002-20231221   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20231221   gcc  
xtensa                randconfig-002-20231221   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

