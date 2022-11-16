Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE09C4332F
	for <ath10k@archiver.kernel.org>; Wed, 16 Nov 2022 23:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HyPMMX94aqWo5EKPcMjb1Hta6JEszg1zpElknuRFe6Y=; b=angOFkDqFLhRxk
	msnZzKlKfBB1Bp27kHohu/LeO4X8YUBoYw+ePMTK/dTfY99o0lLHqRv+qew/CCUSLKazUVj4CyCyU
	qyRMBG46xsmRMbMkzX82zuFq3nnIMhi28XilpZyJZcFIVxFWL+ktuUFqm4kOBIQeRBmNEWdTkcb0e
	4xmnIh71W0/wlHwER3bMLKBd9LxTwkXo0aY7cSh0ToXpS+I+Adhg6Itx389hrPDCGGgLp/PS88mws
	dV1SBdajfdX0IrYngqTqrmjksGzmZzcHUSu9jMX5eIF9r35ZOa1AOVN8TdTI+rJvikDZBU7hKRe8r
	/MLtguHyeGISkr4MqWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovRUE-008f0h-Cm; Wed, 16 Nov 2022 23:06:30 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovRUB-008ez3-0J
	for ath10k@lists.infradead.org; Wed, 16 Nov 2022 23:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668639986; x=1700175986;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/lMYqKnrdNenLgAmtYg9c78o+jh/1k3pUaxr1nu22zs=;
  b=NHIbWvDH6JCZJad5BCrSrZDLZtPvOK6BCh9BSH/ecvTbpSqgkN7snKPv
   PqW5zs6tToB/cIzMBwJb8sQTYF7PS0qzDqEwtlwIOmWSRLwt37C7o30+P
   IFYzccOZMeWVxxAhF0dvVTKEsoSszmUJ1aZFFj69S7Zo141hk6Tk128VK
   jV+L9fK6fU1XfpAcx2dcyEq9FkLgWD3pmZGJitL/yXYqzLuFWHtxg8vUQ
   r3MbFotkh0xi/C1GPTy6SjVjCl3La1GkZIYFvqda14bNT2uT353Ssgbu6
   Nbpe2DeV/8btXFqjECpf6WdGgK6x1aaKh/2Dseo0t3chVXuuxWZaShVGm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="292398975"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="292398975"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 15:06:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="814268418"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="814268418"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Nov 2022 15:06:22 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovRU5-0002on-1W;
	Wed, 16 Nov 2022 23:06:21 +0000
Date: Thu, 17 Nov 2022 07:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 3d09574121a223e05be9bfd00eb18e5e6a5fd3d7
Message-ID: <63756cb5.Mjn5chcr8WSCFSMq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_150627_090740_9361D959 
X-CRM114-Status: UNSURE (   4.35  )
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
branch HEAD: 3d09574121a223e05be9bfd00eb18e5e6a5fd3d7  wifi: ath10k: Add WLAN firmware image version info into smem

elapsed time: 782m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
mips                             allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
ia64                             allmodconfig
x86_64                              defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
i386                          randconfig-a001
i386                                defconfig
i386                          randconfig-a003
x86_64                           allyesconfig
x86_64                        randconfig-a002
i386                          randconfig-a005
x86_64                        randconfig-a006
x86_64                        randconfig-a004
arm                                 defconfig
i386                             allyesconfig
arc                  randconfig-r043-20221116
x86_64                        randconfig-a013
arm                              allyesconfig
arm64                            allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a011

clang tested configs:
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a006
x86_64                        randconfig-a003
i386                          randconfig-a004
x86_64                        randconfig-a005
hexagon              randconfig-r041-20221116
hexagon              randconfig-r045-20221116
riscv                randconfig-r042-20221116
s390                 randconfig-r044-20221116
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
