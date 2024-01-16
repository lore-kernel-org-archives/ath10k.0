Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E069C47077
	for <ath10k@archiver.kernel.org>; Tue, 16 Jan 2024 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G7L8z1zMI/b3yP84Gms1+EbYYkpMA1MPn33W0ATLwA4=; b=2bc+1kidj9b3vgHYiO1XJ5y4Qg
	q26ODUeCflPnJHEXDsyIqllhB0YEcf1DbqZJwEn1ZEei9OvgqeimCZqEYSg1XsjVLUjF1uZfYxSgJ
	ecnv6F24C8K7vKi4pBSNaaiPW7ggncJlc4DjEAGb5eXLtSM1yqdDR28q2dipEH9DO+6lrAsBav+ls
	0xox+CH2FaPZc/h1NCgiZuxGw8LEOSMXnwqnqqgggijz5RVnbaGPD9z9KWqHgr9bmO+2OZEILwTxR
	MxcicWsZOPAQr7uwgm/2PENFnaqCfIFRq8apIGsoBRu/RKv+hf0RA2Z6CxaBbjbTnj3hI8/Sl11lF
	aNzgkc+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPhHn-00BkO9-1A;
	Tue, 16 Jan 2024 11:07:15 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPhHj-00BkMs-2z
	for ath10k@lists.infradead.org;
	Tue, 16 Jan 2024 11:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705403231; x=1736939231;
  h=date:from:to:cc:subject:message-id;
  bh=XVNGViLabVbWn1cvPWWXkbxIZjQdAf0qdHvD2zy1mX0=;
  b=LECYzYgrhqgCYyEHKwJRuorkjFrKgr4P/lAnuXIIQDQ4+kvw7hH4KQCw
   9OfaouQQPOPFmuw39trG9sBSmxTKsM0jNm7lkwQ67Da/HBb1G3v4F644k
   bWBlXM5AlihaQ2PtOKxSkPyo6DOFvG9ieFjAKwpygAOw8u7VpgJnuXEsi
   jKUb5rJJFegzNPHGkIJ/940UsslPz6dKs8mbvD0l53tPP74TKk+IjXolw
   KghsTBwExZLLwo5rp5vIk6GRlLlwWnSWFbAiPiBR+0cmJlLQhscyvhAOw
   +K/oqf0yJNJhbGb7D8W/uzsNdkx5rWG5OF4Io83YJq1fiQUgl5Ag91JbG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="403582207"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="403582207"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 03:07:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="733584804"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="733584804"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Jan 2024 03:07:02 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPhHX-0000bE-39;
	Tue, 16 Jan 2024 11:06:59 +0000
Date: Tue, 16 Jan 2024 19:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 8f9b07776fa51bed1b9b75b9bf052f495f1e58c1
Message-ID: <202401161909.OtTYMxEd-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_030712_048940_1ABC206E 
X-CRM114-Status: UNSURE (   5.26  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 8f9b07776fa51bed1b9b75b9bf052f495f1e58c1  Merge branch 'ath-next' into ath-qca

elapsed time: 2621m

configs tested: 86
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240116   gcc  
arc                   randconfig-002-20240116   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240116   clang
arm                   randconfig-002-20240116   clang
arm                   randconfig-003-20240116   clang
arm                   randconfig-004-20240116   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240116   clang
arm64                 randconfig-002-20240116   clang
arm64                 randconfig-004-20240116   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240115   gcc  
i386         buildonly-randconfig-002-20240115   gcc  
i386         buildonly-randconfig-003-20240115   gcc  
i386         buildonly-randconfig-004-20240115   gcc  
i386         buildonly-randconfig-005-20240115   gcc  
i386         buildonly-randconfig-006-20240115   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240115   gcc  
i386                  randconfig-002-20240115   gcc  
i386                  randconfig-003-20240115   gcc  
i386                  randconfig-004-20240115   gcc  
i386                  randconfig-005-20240115   gcc  
i386                  randconfig-006-20240115   gcc  
i386                  randconfig-011-20240115   clang
i386                  randconfig-012-20240115   clang
i386                  randconfig-013-20240115   clang
i386                  randconfig-014-20240115   clang
i386                  randconfig-015-20240115   clang
i386                  randconfig-016-20240115   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                                defconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240116   clang
x86_64       buildonly-randconfig-002-20240116   clang
x86_64       buildonly-randconfig-003-20240116   clang
x86_64       buildonly-randconfig-004-20240116   clang
x86_64       buildonly-randconfig-005-20240116   clang
x86_64       buildonly-randconfig-006-20240116   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240116   gcc  
x86_64                randconfig-002-20240116   gcc  
x86_64                randconfig-003-20240116   gcc  
x86_64                randconfig-004-20240116   gcc  
x86_64                randconfig-005-20240116   gcc  
x86_64                randconfig-006-20240116   gcc  
x86_64                randconfig-011-20240116   clang
x86_64                randconfig-012-20240116   clang
x86_64                randconfig-013-20240116   clang
x86_64                randconfig-014-20240116   clang
x86_64                randconfig-015-20240116   clang
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

