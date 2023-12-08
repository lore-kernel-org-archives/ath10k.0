Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA9BC4167B
	for <ath10k@archiver.kernel.org>; Fri,  8 Dec 2023 11:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jb86hHXMCZbNRRt38BluMzdhZJUoMnegMyuvHPsozdw=; b=2G9I20t97h0xKmISc4JxfEtczs
	iokFTnkT4hIWKLHI6hp/T4STaxWK3iXWZzlo/6FyB7dg0YthUsM10T+FM3Hi4OirFlfHmkn+2VTsj
	TOlucB5gJREi+VuQsRpaaTD0qh0+uzLBvpXHFtplErfvZADjhzCgUuovfQGGeKcArm0X6pbWMWDwK
	TjK0SS4w3O/bD0goNxoH+43jjang8km9yHy9X2FVmJ3NbBcsLipMItIgUIQT9WgEdrrzu25Ltp5rd
	9WqIHp2UTCpha4b3zjpg3rJ+ZIbF1CR/8UhLI4U/0LtRxsG8rCPQGAttpKcCpch+0sdwT8sYheqKR
	DaYBXJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYr7-00FPyA-1U;
	Fri, 08 Dec 2023 11:17:17 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYr4-00FPuP-2P
	for ath10k@lists.infradead.org;
	Fri, 08 Dec 2023 11:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702034234; x=1733570234;
  h=date:from:to:cc:subject:message-id;
  bh=e+oo6wx15NbSGN5OFaJBP77OZstWJsIJxW9h+PY5aro=;
  b=S8GmUu9EWX24e64dQSGR4J/7E1JNtTGGT7xZ78Ko64H0EpROggf3cB0h
   OEWOCrPUFSjj8BYFSdw3KYc+wrkBYejPrOwc6uXdbQ7jqp1Cc9L3Neak0
   p5UPTPtOPkRbMPAkyxBl2P3564Bgj6iSQEU7GyAl911G6XuUtJqKqYfqW
   B3iKMAd7oIAczJ34BZa/hnc5y5v4qo5rtYwfz0cVtXOilyDvLhoDXOEKn
   RX0seGWwwolJOEZdVn290Bj4CzxptCTZJHCaQqJcCGHH5hQxoQ7+u6F7x
   0bkKWVG78ExjJkPT2bDpk/GLWqx82ZDfpzpOyx4KX1UyS7R2qNqaG7MrU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="384796080"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="384796080"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945387853"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="945387853"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2023 03:17:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBYqx-000Dep-1a;
	Fri, 08 Dec 2023 11:17:07 +0000
Date: Fri, 08 Dec 2023 19:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD REGRESSION
 16652f582f4b8b78e64846c532b28a59f6673629
Message-ID: <202312081934.VLIHIJkw-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_031714_826642_4712F44B 
X-CRM114-Status: UNSURE (   3.26  )
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
branch HEAD: 16652f582f4b8b78e64846c532b28a59f6673629  Merge branch 'ath-next' into ath-qca

Error/Warning ids grouped by kconfigs:

clang_recent_errors
`-- i386-buildonly-randconfig-004-20231208
    |-- drivers-base-platform-msi.c:error:field-has-incomplete-type-msi_alloc_info_t-(aka-struct-irq_alloc_info-)
    |-- include-linux-gpio-driver.h:error:field-has-incomplete-type-msi_alloc_info_t-(aka-struct-irq_alloc_info-)
    |-- kernel-irq-msi.c:error:incomplete-definition-of-type-struct-irq_alloc_info
    |-- kernel-irq-msi.c:error:invalid-application-of-sizeof-to-an-incomplete-type-msi_alloc_info_t-(aka-struct-irq_alloc_info-)
    `-- kernel-irq-msi.c:error:variable-has-incomplete-type-msi_alloc_info_t-(aka-struct-irq_alloc_info-)

elapsed time: 1485m

configs tested: 43
configs skipped: 0

tested configs:
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231208   clang
i386         buildonly-randconfig-002-20231208   clang
i386         buildonly-randconfig-003-20231208   clang
i386         buildonly-randconfig-004-20231208   clang
i386         buildonly-randconfig-005-20231208   clang
i386         buildonly-randconfig-006-20231208   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231208   clang
i386                  randconfig-002-20231208   clang
i386                  randconfig-003-20231208   clang
i386                  randconfig-004-20231208   clang
i386                  randconfig-005-20231208   clang
i386                  randconfig-006-20231208   clang
i386                  randconfig-011-20231208   gcc  
i386                  randconfig-012-20231208   gcc  
i386                  randconfig-013-20231208   gcc  
i386                  randconfig-014-20231208   gcc  
i386                  randconfig-015-20231208   gcc  
i386                  randconfig-016-20231208   gcc  
loongarch                        allmodconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

