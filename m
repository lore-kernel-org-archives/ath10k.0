Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7E3C48260
	for <ath10k@archiver.kernel.org>; Thu, 25 Jan 2024 14:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SBcS1wG025Fn74Wq04ih6TA9VCGZB0MtAuaHF9ywiE0=; b=oZYXOct1RjqMhXcYc83fqtaPmH
	KcgnxIwUle5uuDnVpGd9nUla1LgM+uBEyPLNMwdeu1duzEBmbWDqtpl3EsIs4lGGMdYPxF0Ndjqdn
	qqoN2YnHd8RdJGintT0nSR4A3oXs74acMYXRNiBElqVRKna5kJGS/B2WN+eX09nC/atETfnRvSg2v
	3OQ7v1N6ksi4kdtZJqewUjmUkBtb88EtQ1P32nvBjKyxpJlqNCqhq1NCa7PdX7YtW9Ogykhg0cUlk
	i1rW2ArZvnjkMIYRQk4wgdYPfueqdgkNW67X2e82mI753lZkOBgBL9OBStKmQ0Ml4QgL9BHRAY45m
	vYRkp0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0bk-00000000LUJ-252Z;
	Thu, 25 Jan 2024 14:21:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0bi-00000000LTU-2vCE
	for ath10k@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=SBcS1wG025Fn74Wq04ih6TA9VCGZB0MtAuaHF9ywiE0=; b=QSQL7ItA4lQsrKyV8p1pHkv6X8
	itx/f2giqMn7hH8G+182XsQJ88bCHQS2jlpio2rlP8xgS6pmtv77PjM0kYLLXna9qgtwEO/tOeL2H
	eh0uYg6YC6NBcZLpG4XEXEbowpOyxkj6+6RpqmnT0VgzgY6nwAkPBicqUb17BjK1bPzVtz+DdZVOA
	or7uT+Eo/WZUAELjJGpZrG2HSFy40yKc02cmMDAUfAZpCLtUm+Jzg7ij2J2vNqrKnXh7fg5blDM3b
	PIndOd0Tr9JzCqNWri06BVUqwJmBDaCA8Fn+aG9NW1dULGQSNCxbFzGLYBclY54rqCafq90kaBDVG
	JOZD62mQ==;
Received: from mgamail.intel.com ([134.134.136.31])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSxoh-00000005BB6-3Am0
	for ath10k@lists.infradead.org;
	Thu, 25 Jan 2024 11:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706181763; x=1737717763;
  h=date:from:to:cc:subject:message-id;
  bh=YGoQYqpiKwV/AW7/nGxFh/7M/P9dfuBUycdFZGq5wSU=;
  b=WYFDMeBnAHPpMetpWGTKVnLiO5AetDy6G+EoPpbIX+5PxJ7OjU/ZsWEd
   swUSv2s1wN4uRU9tewZpjQdET7KgMBT+b95PJWyprkHOveoFkGvpPv14O
   4FpYTU/PaaP8C6veBYL74hpXb9KB8uXfm1MlLT6inorwVOV1dizjNPcT6
   qUq7snCgCttaLopheeSsUESEf884F7p86SD3GFEhpXUK3IZ+jvdKTR0Kn
   fFegFb0+28A5T6HjHox0zh8CmZHHf0PZaq/fx+FeMIQRrF+uui1WY4XKp
   fm08R5yZ4sLwrtZjnF9WPP+IQlF9jcDShwuPdhjqZpTWS30pjfeHCrHur
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="466414416"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="466414416"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 03:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905935320"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="905935320"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jan 2024 03:21:33 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSxnX-0008w9-0d;
	Thu, 25 Jan 2024 11:21:31 +0000
Date: Thu, 25 Jan 2024 19:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 63e6be5f7dc74ed8a882d55b292ee832bfedade8
Message-ID: <202401251904.xBS6593i-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_112245_280169_64F56A15 
X-CRM114-Status: UNSURE (   5.70  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 63e6be5f7dc74ed8a882d55b292ee832bfedade8  wifi: ath11k: fix connection failure due to unexpected peer delete

elapsed time: 1467m

configs tested: 121
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240125   gcc  
arc                   randconfig-002-20240125   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240125   gcc  
arm                   randconfig-002-20240125   gcc  
arm                   randconfig-003-20240125   gcc  
arm                   randconfig-004-20240125   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240125   gcc  
arm64                 randconfig-002-20240125   gcc  
arm64                 randconfig-003-20240125   gcc  
arm64                 randconfig-004-20240125   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240125   gcc  
csky                  randconfig-002-20240125   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240125   clang
hexagon               randconfig-002-20240125   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240124   clang
i386         buildonly-randconfig-002-20240124   clang
i386         buildonly-randconfig-003-20240124   clang
i386         buildonly-randconfig-004-20240124   clang
i386         buildonly-randconfig-005-20240124   clang
i386         buildonly-randconfig-006-20240124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240124   clang
i386                  randconfig-002-20240124   clang
i386                  randconfig-003-20240124   clang
i386                  randconfig-004-20240124   clang
i386                  randconfig-005-20240124   clang
i386                  randconfig-006-20240124   clang
i386                  randconfig-011-20240124   gcc  
i386                  randconfig-012-20240124   gcc  
i386                  randconfig-013-20240124   gcc  
i386                  randconfig-014-20240124   gcc  
i386                  randconfig-015-20240124   gcc  
i386                  randconfig-016-20240124   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240125   gcc  
loongarch             randconfig-002-20240125   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240125   gcc  
nios2                 randconfig-002-20240125   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240125   gcc  
parisc                randconfig-002-20240125   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240125   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240125   gcc  
x86_64       buildonly-randconfig-002-20240125   gcc  
x86_64       buildonly-randconfig-003-20240125   gcc  
x86_64       buildonly-randconfig-004-20240125   gcc  
x86_64       buildonly-randconfig-005-20240125   gcc  
x86_64       buildonly-randconfig-006-20240125   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240125   clang
x86_64                randconfig-002-20240125   clang
x86_64                randconfig-003-20240125   clang
x86_64                randconfig-004-20240125   clang
x86_64                randconfig-005-20240125   clang
x86_64                randconfig-006-20240125   clang
x86_64                randconfig-011-20240125   gcc  
x86_64                randconfig-012-20240125   gcc  
x86_64                randconfig-013-20240125   gcc  
x86_64                randconfig-014-20240125   gcc  
x86_64                randconfig-015-20240125   gcc  
x86_64                randconfig-016-20240125   gcc  
x86_64                randconfig-071-20240125   gcc  
x86_64                randconfig-072-20240125   gcc  
x86_64                randconfig-073-20240125   gcc  
x86_64                randconfig-074-20240125   gcc  
x86_64                randconfig-075-20240125   gcc  
x86_64                randconfig-076-20240125   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

