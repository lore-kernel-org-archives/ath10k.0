Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA49CC3065C
	for <ath10k@archiver.kernel.org>; Wed,  3 Jul 2024 00:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8kIL3bO8wcwrDW8j6fX4Xck3/Y05Hn3dTmXgOTNhb2w=; b=2BDjPrlsuXyrstL6xMeMH6bfml
	2PpAzKrFAStQgERwJBVJ1Ld6JzyeSmR3jCfdksRK+jg76C8amGzB20mshz8ZxbYBlJWLnAcqnadOp
	Q+smcGdz8/ZAqOa8BT7KQ66tWjEJPMcY1TQLCrrJ9MbhVt20xZV/Sa2v0LV139rMSh2R/uQpCNdss
	G+4QMTJKjXlR5tso0/NDq7BLCIK+/CmxqtnBBo6WOXTD0Mq+5gP71p10t8YUIC9AYVrMbI5uVw/Zd
	00saPq3Ebs0XTN00jpsVIjye9nnUtrV2Gty3nwnNkZfSqwmIOTrYATUxtoYuLBo72vIGvLFH/u2k3
	nUgD9nAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOnkR-00000008OZq-1fnA;
	Wed, 03 Jul 2024 00:21:23 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOnkO-00000008OZ2-1wNP
	for ath10k@lists.infradead.org;
	Wed, 03 Jul 2024 00:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719966080; x=1751502080;
  h=date:from:to:cc:subject:message-id;
  bh=Jh1QMh+nV6JpzllyVTy5rYvWxsfa6Ff4onGL/Zxhhv4=;
  b=l5lEzHLFppGa02BPmBxFDAv6Hi+H4+42kMxzsufIEa2T0DwUekx4yKc/
   p0Ga0hrILMDsodlEoD6YrkSdwFddZpy4yrUCB54Jh3H4jhT2ey3sauTaz
   /tHjmJ/Yr7o2Yjl6jPLXMIyk7QKIPYRDBGq4nLNK2FAg1RlsyH0zZ+nOd
   y8RVOp0nSTnCSay9KtwuAPfXqJcqpddjicvex2rOnYA7Aip5veNMdTfsF
   k+tCDtdSTnkOX0pSaBgSrWn0sVp8KTcdCShZcaZTV7NqnzwtXkSRkwSE2
   +N8tafvBG7d+L82pvI3alJB/BUHPbXIHpeZ7HY2j+eoCSHJ0+/ZE/78jP
   g==;
X-CSE-ConnectionGUID: vlJrPDfQR9aakHQkdlNj7A==
X-CSE-MsgGUID: cYM0xDBsQxukjHlPpITWMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17304686"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17304686"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 17:21:19 -0700
X-CSE-ConnectionGUID: M6esZhleQsGO7Ghx7yiOrw==
X-CSE-MsgGUID: mmk3NSpYRj6l76Mgp5MhWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="51247726"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2024 17:21:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOnkK-000P0P-0o;
	Wed, 03 Jul 2024 00:21:16 +0000
Date: Wed, 03 Jul 2024 08:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 5344fc76f8944249026884157f846f88489edfc0
Message-ID: <202407030855.FqlBVj71-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_172120_573180_8C6407FF 
X-CRM114-Status: UNSURE (   3.91  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 5344fc76f8944249026884157f846f88489edfc0  wifi: ath12k: Support TQM stats

elapsed time: 1751m

configs tested: 116
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                   randconfig-001-20240703   gcc-13.2.0
arc                   randconfig-002-20240703   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                   randconfig-001-20240703   gcc-13.2.0
arm                   randconfig-002-20240703   gcc-13.2.0
arm                   randconfig-003-20240703   gcc-13.2.0
arm                   randconfig-004-20240703   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                 randconfig-001-20240703   gcc-13.2.0
arm64                 randconfig-002-20240703   gcc-13.2.0
arm64                 randconfig-003-20240703   gcc-13.2.0
arm64                 randconfig-004-20240703   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240703   gcc-13.2.0
csky                  randconfig-002-20240703   gcc-13.2.0
hexagon                           allnoconfig   clang-19
i386         buildonly-randconfig-001-20240702   gcc-13
i386         buildonly-randconfig-001-20240703   clang-18
i386         buildonly-randconfig-002-20240702   gcc-13
i386         buildonly-randconfig-002-20240703   clang-18
i386         buildonly-randconfig-003-20240702   gcc-13
i386         buildonly-randconfig-003-20240703   clang-18
i386         buildonly-randconfig-004-20240702   gcc-13
i386         buildonly-randconfig-004-20240703   clang-18
i386         buildonly-randconfig-005-20240702   gcc-13
i386         buildonly-randconfig-005-20240703   clang-18
i386         buildonly-randconfig-006-20240702   gcc-13
i386         buildonly-randconfig-006-20240703   clang-18
i386                  randconfig-001-20240702   gcc-13
i386                  randconfig-001-20240703   clang-18
i386                  randconfig-002-20240702   gcc-13
i386                  randconfig-002-20240703   clang-18
i386                  randconfig-003-20240702   gcc-13
i386                  randconfig-003-20240703   clang-18
i386                  randconfig-004-20240702   gcc-13
i386                  randconfig-004-20240703   clang-18
i386                  randconfig-005-20240702   gcc-13
i386                  randconfig-005-20240703   clang-18
i386                  randconfig-006-20240702   gcc-13
i386                  randconfig-006-20240703   clang-18
i386                  randconfig-011-20240702   gcc-13
i386                  randconfig-011-20240703   clang-18
i386                  randconfig-012-20240702   gcc-13
i386                  randconfig-012-20240703   clang-18
i386                  randconfig-013-20240702   gcc-13
i386                  randconfig-013-20240703   clang-18
i386                  randconfig-014-20240702   gcc-13
i386                  randconfig-014-20240703   clang-18
i386                  randconfig-015-20240702   gcc-13
i386                  randconfig-015-20240703   clang-18
i386                  randconfig-016-20240702   gcc-13
i386                  randconfig-016-20240703   clang-18
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240703   gcc-13.2.0
loongarch             randconfig-002-20240703   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                 randconfig-001-20240703   gcc-13.2.0
nios2                 randconfig-002-20240703   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                randconfig-001-20240703   gcc-13.2.0
parisc                randconfig-002-20240703   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240703   gcc-13.2.0
powerpc               randconfig-002-20240703   gcc-13.2.0
powerpc               randconfig-003-20240703   gcc-13.2.0
powerpc64             randconfig-001-20240703   gcc-13.2.0
powerpc64             randconfig-002-20240703   gcc-13.2.0
powerpc64             randconfig-003-20240703   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-001-20240703   gcc-13.2.0
riscv                 randconfig-002-20240703   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-001-20240703   gcc-13.2.0
s390                  randconfig-002-20240703   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                    randconfig-001-20240703   gcc-13.2.0
sh                    randconfig-002-20240703   gcc-13.2.0
sparc64               randconfig-001-20240703   gcc-13.2.0
sparc64               randconfig-002-20240703   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                    randconfig-001-20240703   gcc-13.2.0
um                    randconfig-002-20240703   gcc-13.2.0
x86_64       buildonly-randconfig-001-20240703   clang-18
x86_64       buildonly-randconfig-002-20240703   clang-18
x86_64       buildonly-randconfig-003-20240703   clang-18
x86_64       buildonly-randconfig-004-20240703   clang-18
x86_64       buildonly-randconfig-005-20240703   clang-18
x86_64       buildonly-randconfig-006-20240703   clang-18
x86_64                randconfig-001-20240703   clang-18
x86_64                randconfig-002-20240703   clang-18
x86_64                randconfig-003-20240703   clang-18
x86_64                randconfig-004-20240703   clang-18
x86_64                randconfig-005-20240703   clang-18
x86_64                randconfig-006-20240703   clang-18
x86_64                randconfig-011-20240703   clang-18
x86_64                randconfig-012-20240703   clang-18
x86_64                randconfig-013-20240703   clang-18
x86_64                randconfig-014-20240703   clang-18
x86_64                randconfig-015-20240703   clang-18
x86_64                randconfig-016-20240703   clang-18
x86_64                randconfig-071-20240703   clang-18
x86_64                randconfig-072-20240703   clang-18
x86_64                randconfig-073-20240703   clang-18
x86_64                randconfig-074-20240703   clang-18
x86_64                randconfig-075-20240703   clang-18
x86_64                randconfig-076-20240703   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240703   gcc-13.2.0
xtensa                randconfig-002-20240703   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

