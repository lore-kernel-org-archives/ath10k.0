Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF35C47258
	for <ath10k@archiver.kernel.org>; Sun, 21 Jan 2024 01:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jaIW6F+tGGuQiZI3EFv8WTBRv3Nc2CfPUoTPqBml5KA=; b=m2BrK0tSInjTEDt21PAI6s+6aO
	H3Uh7hLzCsp4f/Z7NAKyFvPF0pKT5VdfJIIkBHtj66vI8TuViDx7mKxcgHQY0sMSZ4mhB27xBZdBt
	u3+17n44bkPtUpVOuwrGB79F3qID+yG5ajQECQpX9ppAXwc5FHxj2xUEI9IJdyzHge4vFXSCZfhDv
	+qBYnzywwGQfOY0mdL14TuwQvWCP1zWAUWPja0Pi1PTo7yza1pzYIw+4nwkJebX6YqGyrT4T3vf93
	2ZkMzSEXvb2dvOO0Fgjsjw6UX1dsU8ntJ8hTwDR9uhB2Sv7kc6VngqxXY4r083q8Ouy+cjUInxnhp
	M25FyAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRMOe-008ifG-0X;
	Sun, 21 Jan 2024 01:13:12 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRMOY-008ieY-1W
	for ath10k@lists.infradead.org;
	Sun, 21 Jan 2024 01:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705799586; x=1737335586;
  h=date:from:to:cc:subject:message-id;
  bh=uqVB/IS7kukEH6Vc+nh3daUiEeB7ftKqjbLB21LrnoA=;
  b=SC5zY37KcvT0fqrHpcp+6eidWz7ZwR3pZfQdj1sRC0Tznjd607hPJ7yC
   8/YDCbvVgLajOaL4JW0vBzweKD+1kkGBUkc3pr5Bjh/Xp1qlJ5VKS7Rt7
   33D5dhwOpTNgTkUSDbVHbGLaHD//cb8kEBeT0r8l+G69SQphaKf1nfeE/
   WvV94LCR/or7LJpLeGdKBPKHTA++pFrdyLEFXHJTZRVOjSSShnFgWYyBC
   jWi19EYmOBamB/MiCnaCUST4AufsINmpONuZrOgsmxuykqKAvSMilE6/h
   M/CYqX8UOdlRxeez4FX9Z8H7AJ4Vxc9i4+pcI1RBZiXJbj+dlK5ScTUyV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="432158240"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="432158240"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 17:12:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="958411550"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="958411550"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2024 17:12:58 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRMON-0005Zc-2k;
	Sun, 21 Jan 2024 01:12:55 +0000
Date: Sun, 21 Jan 2024 09:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 9c3e7305eb7a4cc452fc0d7f45a17a89baf561f7
Message-ID: <202401210917.WZnkSItm-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_171306_560195_3E701960 
X-CRM114-Status: UNSURE (   4.91  )
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
branch HEAD: 9c3e7305eb7a4cc452fc0d7f45a17a89baf561f7  Merge branch 'pending' into master-pending

elapsed time: 1876m

configs tested: 100
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240121   gcc  
arc                   randconfig-002-20240121   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240121   gcc  
arm                   randconfig-002-20240121   gcc  
arm                   randconfig-003-20240121   gcc  
arm                   randconfig-004-20240121   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240121   gcc  
arm64                 randconfig-002-20240121   gcc  
arm64                 randconfig-003-20240121   gcc  
arm64                 randconfig-004-20240121   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240121   gcc  
csky                  randconfig-002-20240121   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240121   clang
hexagon               randconfig-002-20240121   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386         buildonly-randconfig-001-20240120   clang
i386         buildonly-randconfig-002-20240120   clang
i386         buildonly-randconfig-003-20240120   clang
i386         buildonly-randconfig-004-20240120   clang
i386         buildonly-randconfig-005-20240120   clang
i386         buildonly-randconfig-006-20240120   clang
i386                                defconfig   gcc  
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
loongarch                         allnoconfig   gcc  
loongarch             randconfig-001-20240121   gcc  
loongarch             randconfig-002-20240121   gcc  
nios2                 randconfig-001-20240121   gcc  
nios2                 randconfig-002-20240121   gcc  
parisc                randconfig-001-20240121   gcc  
parisc                randconfig-002-20240121   gcc  
powerpc               randconfig-001-20240121   gcc  
powerpc               randconfig-002-20240121   gcc  
powerpc               randconfig-003-20240121   gcc  
powerpc64             randconfig-001-20240121   gcc  
powerpc64             randconfig-002-20240121   gcc  
powerpc64             randconfig-003-20240121   gcc  
riscv                 randconfig-001-20240121   gcc  
riscv                 randconfig-002-20240121   gcc  
s390                  randconfig-001-20240121   clang
s390                  randconfig-002-20240121   clang
sh                    randconfig-001-20240121   gcc  
sh                    randconfig-002-20240121   gcc  
sparc64               randconfig-001-20240121   gcc  
sparc64               randconfig-002-20240121   gcc  
um                    randconfig-001-20240121   gcc  
um                    randconfig-002-20240121   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240121   gcc  
x86_64       buildonly-randconfig-002-20240121   gcc  
x86_64       buildonly-randconfig-003-20240121   gcc  
x86_64       buildonly-randconfig-004-20240121   gcc  
x86_64       buildonly-randconfig-005-20240121   gcc  
x86_64       buildonly-randconfig-006-20240121   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240121   clang
x86_64                randconfig-002-20240121   clang
x86_64                randconfig-003-20240121   clang
x86_64                randconfig-004-20240121   clang
x86_64                randconfig-005-20240121   clang
x86_64                randconfig-006-20240121   clang
x86_64                randconfig-011-20240121   gcc  
x86_64                randconfig-012-20240121   gcc  
x86_64                randconfig-013-20240121   gcc  
x86_64                randconfig-014-20240121   gcc  
x86_64                randconfig-015-20240121   gcc  
x86_64                randconfig-016-20240121   gcc  
x86_64                randconfig-071-20240121   gcc  
x86_64                randconfig-072-20240121   gcc  
x86_64                randconfig-073-20240121   gcc  
x86_64                randconfig-074-20240121   gcc  
x86_64                randconfig-075-20240121   gcc  
x86_64                randconfig-076-20240121   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240121   gcc  
xtensa                randconfig-002-20240121   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

