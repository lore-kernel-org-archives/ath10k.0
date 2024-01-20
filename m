Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAA4C47258
	for <ath10k@archiver.kernel.org>; Sat, 20 Jan 2024 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iYYpG3ZgH+EcuT1/5kvOmTq6ikBhnaHwVTJ6Kp9c5jc=; b=tfK7VmPrg+i1+cNmr19Wt2tCv/
	3aC4WNTCXxIQeTFohLoNF1cHbuL8wjWMm1B8fbBbr8FC/FT2/Vqek5240CN1ey/GB/HpMqXhgI5A0
	IsSjfnaV6aZQJWOuGVC5qnZog2qoAF9MI3flSEMqZOrbmq3dvYrPNWUe6TvtNuHWILg4iLLncOpU1
	PHkdT5IQEB/8ZgTEI7z6qgW65EUbsRvQti85e1/UxDLVgw8zwuVLEkDTbvNSir3Cv2N4eXJw6kIuO
	d15+8o1PoYP1MqOqdUj/l//9SsHA4JG2AUNDYxXE+CHHrkwifnlD+nJxT59L6rsMdfv6bnzmH5X6p
	0yGgfBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJKs-008U7n-1L;
	Sat, 20 Jan 2024 21:57:06 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJKn-008U77-04
	for ath10k@lists.infradead.org;
	Sat, 20 Jan 2024 21:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705787820; x=1737323820;
  h=date:from:to:cc:subject:message-id;
  bh=Mr10w+0tQQlnfxjgAf6Xab6bVJtgxU7VygmsKjIzkxw=;
  b=DEjoFk90yaQlVn89DYfhiMbG9TBJlupN5aXX0a+nQXLrWDnuKkRVLjrv
   LUdGt1+IOF7jyocv/wbiC2Pi9YmaXPIP2QLDRSVK/cfMI27eozDC5SBSl
   wNQggvFH6a6WFWmrHkGKhPCLPmK9yT0lJc+2QrzSdSq2G3jiZXBOlJY6F
   j3m9k/k7d7vKhBUf6q/XIOteHAtZ/ruqcfiMZwDPceKpOPmIExy5UruZt
   zzPziOc77EXisqygCrOL9XnmOQzXCzVppO0lTJY50TrvciwPKHkPbhfRt
   sPRuprUoHqJkaN5YhEa6eMSJjVbUtJdtYi9pRBahzoitsHjH8F3PkZJjP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="391415698"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="391415698"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 13:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="958392657"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="958392657"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2024 13:56:55 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRJKf-0005Ti-0L;
	Sat, 20 Jan 2024 21:56:53 +0000
Date: Sun, 21 Jan 2024 05:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 cf33a73d377338419ac825b83aad1564b28d6f27
Message-ID: <202401210525.Rb9icq1g-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_135701_151129_6E10B13F 
X-CRM114-Status: UNSURE (   4.79  )
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
branch HEAD: cf33a73d377338419ac825b83aad1564b28d6f27  Merge branch 'ath-next' into ath-qca

elapsed time: 1680m

configs tested: 97
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
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20240120   gcc  
loongarch             randconfig-002-20240120   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
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

