Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7296C47258
	for <ath10k@archiver.kernel.org>; Sat, 20 Jan 2024 22:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWjnBSt2EhCHK/0OsMkzNNmdJPMYhgXnEqF3M+ueFEQ=; b=Dm0ULbXAs4VglCQFNgZJuPPmlY
	qdrZd7L8heV0tmIu+nj45L3yVm1m0OIDS8WbSxcDyfrzNhLV+wvWmTA66HqP5QVOKuVrIQzn02sy0
	Y/l7eRbIcDEK5skX9lRuGKNSZnV9w+d0JvfpTp/aZmB3bV5Trd1s0MMOvdwQW6XlAT2PvF6cRtd+j
	aK0uKHD89VZndqBmMfYHF85J/nKJMn/sUTpaTndK283MmWmIjX17IojB2O57qLPhWJ4iC+jZ/nhD5
	spa+3vfGFx0vhc5WRY6UX0Cy3lreymsH+9C4kaK6LOUmv/dPYogwmorCAk/0KpTMiuYuPhGwyaUMf
	fErVN/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJxe-008XLA-1G;
	Sat, 20 Jan 2024 22:37:10 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJxZ-008XKY-2F
	for ath10k@lists.infradead.org;
	Sat, 20 Jan 2024 22:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705790225; x=1737326225;
  h=date:from:to:cc:subject:message-id;
  bh=K2Cg07Vka7nfWudYNo/vW7oxifFoy1hcnKoRhpLMWVY=;
  b=QiQooLWUs4/mjfzNyq5iRSh63IzLSqnDPTmccK/lggBBG6DUQ0to7xMp
   FMSz7F17y7NaecN2NbJCFM/fOVkCLfsTZzK4Vuq33w1JrFEDOrRZG3T8L
   U00CZJPSYpF3n1PFPMog9TvYG9g8nof0QmTleujUKJaZv9veDvGU7s+je
   pn3cO1BNk5XPYY0wq/Xe73ga9+tkh96O7oGj7voV09ggKudrXx0DZshoO
   LUCtjQisLHqDR0WZCzHGGsyW2vmi6255teY9QkCLZXD8x/IQ82tuy8SAk
   aoIi8QX9zvW+1e5BT+UkAaEfrvjkvCeToTQJ7ZYlWqzF6DwQCb60PzRRW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="7735356"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="7735356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 14:36:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="734829142"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="734829142"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2024 14:36:56 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRJxN-0005Uc-1Z;
	Sat, 20 Jan 2024 22:36:53 +0000
Date: Sun, 21 Jan 2024 06:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 8ff464a183f92836d7fd99edceef50a89d8ea797
Message-ID: <202401210627.09Om6ylQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_143705_795588_26E7E213 
X-CRM114-Status: UNSURE (   4.82  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 8ff464a183f92836d7fd99edceef50a89d8ea797  Add localversion-wireless-testing-ath

elapsed time: 1720m

configs tested: 89
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240120   gcc  
arc                   randconfig-002-20240120   gcc  
arm                   randconfig-001-20240120   clang
arm                   randconfig-002-20240120   clang
arm                   randconfig-003-20240120   clang
arm                   randconfig-004-20240120   clang
arm64                 randconfig-001-20240120   clang
arm64                 randconfig-002-20240120   clang
arm64                 randconfig-003-20240120   clang
arm64                 randconfig-004-20240120   clang
csky                  randconfig-001-20240120   gcc  
csky                  randconfig-002-20240120   gcc  
hexagon               randconfig-001-20240120   clang
hexagon               randconfig-002-20240120   clang
i386         buildonly-randconfig-001-20240120   clang
i386         buildonly-randconfig-002-20240120   clang
i386         buildonly-randconfig-003-20240120   clang
i386         buildonly-randconfig-004-20240120   clang
i386         buildonly-randconfig-005-20240120   clang
i386         buildonly-randconfig-006-20240120   clang
i386                  randconfig-001-20240120   clang
i386                  randconfig-002-20240120   clang
i386                  randconfig-003-20240120   clang
i386                  randconfig-004-20240120   clang
i386                  randconfig-005-20240120   clang
i386                  randconfig-006-20240120   clang
i386                  randconfig-011-20240120   gcc  
i386                  randconfig-012-20240120   gcc  
i386                  randconfig-013-20240120   gcc  
i386                  randconfig-014-20240120   gcc  
i386                  randconfig-015-20240120   gcc  
i386                  randconfig-016-20240120   gcc  
loongarch             randconfig-001-20240120   gcc  
loongarch             randconfig-002-20240120   gcc  
nios2                 randconfig-001-20240120   gcc  
nios2                 randconfig-002-20240120   gcc  
parisc                randconfig-001-20240120   gcc  
parisc                randconfig-002-20240120   gcc  
powerpc               randconfig-001-20240120   clang
powerpc               randconfig-002-20240120   clang
powerpc               randconfig-003-20240120   clang
powerpc64             randconfig-001-20240120   clang
powerpc64             randconfig-002-20240120   clang
powerpc64             randconfig-003-20240120   clang
riscv                 randconfig-001-20240120   clang
riscv                 randconfig-002-20240120   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240120   gcc  
s390                  randconfig-002-20240120   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240120   gcc  
sh                    randconfig-002-20240120   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240120   gcc  
sparc64               randconfig-002-20240120   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20240120   clang
um                    randconfig-002-20240120   clang
x86_64       buildonly-randconfig-001-20240120   clang
x86_64       buildonly-randconfig-002-20240120   clang
x86_64       buildonly-randconfig-003-20240120   clang
x86_64       buildonly-randconfig-004-20240120   clang
x86_64       buildonly-randconfig-005-20240120   clang
x86_64       buildonly-randconfig-006-20240120   clang
x86_64                randconfig-001-20240120   gcc  
x86_64                randconfig-002-20240120   gcc  
x86_64                randconfig-003-20240120   gcc  
x86_64                randconfig-004-20240120   gcc  
x86_64                randconfig-005-20240120   gcc  
x86_64                randconfig-006-20240120   gcc  
x86_64                randconfig-011-20240120   clang
x86_64                randconfig-012-20240120   clang
x86_64                randconfig-013-20240120   clang
x86_64                randconfig-014-20240120   clang
x86_64                randconfig-015-20240120   clang
x86_64                randconfig-016-20240120   clang
x86_64                randconfig-071-20240120   clang
x86_64                randconfig-072-20240120   clang
x86_64                randconfig-073-20240120   clang
x86_64                randconfig-074-20240120   clang
x86_64                randconfig-075-20240120   clang
x86_64                randconfig-076-20240120   clang
xtensa                randconfig-001-20240120   gcc  
xtensa                randconfig-002-20240120   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

