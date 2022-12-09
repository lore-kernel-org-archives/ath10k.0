Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B14C4167B
	for <ath10k@archiver.kernel.org>; Fri,  9 Dec 2022 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0CZwqCmfhT0Wg4vxLCo4nJw7peQJArWNXpfty/483c0=; b=vAbud4ieRXglvA
	XN80oDds1J7yoBmuYX1u75wbq829rXoYYH41kxaGx0qpjiMtRkb8jxsVYBM249ujxbsWt4z484tEJ
	3RBoiVfYU7ULDZpMWB7EF03uTOOXtuL7GMu6/bGSasT7Oun5mCakmc6e5pEBHBzNe1Bi+Gb6+dnoo
	HSQVHa7KmdVfdXmomvoNc1t7qZlfPQ4CAhyHrc4FX1kc4W3jWOoGE6xc6PFY8KNzoEi0qnaEA5V2V
	GBfazhCvxtGPoqW9H3dOCtgcoO202ZiVbJApM9N6TR4jPKEvqW0WyDWlTsdYkYrYgumekzjYxQVNn
	ckLwwlQPTDTru4DvaVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Wwa-004cEC-43; Fri, 09 Dec 2022 06:33:12 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3WwX-004cCK-Ev
	for ath10k@lists.infradead.org; Fri, 09 Dec 2022 06:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670567589; x=1702103589;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rBjLQdMAZbponFaIe77gfbc7H3Yuv6W5lxkQtUwAcZg=;
  b=bpTxUvD6uyFbKJ+/LYW3dw7dgSJIukgIzrOcEJzmxqr/ZKF0nh9P/5uY
   Z9OkcBoZZ9pOBVkv1Hq4lk1Nuu5WtngAInweRv+xgQq1iwTxLd5ahnREc
   7rNRL42w7MDK5RyyPDLGbo9Hn/TKvo1JP7mBiPNSntaLxxmj8JmsTrcH1
   boMbfYpVO2uBaupkMMliR+W6fEjIrcUJolXfBvsdDIKCp+bDYJgeqCcer
   pIZjp9UrUGnJ7aQ/76lmv+oKWFmQdmwWcsjagF3NxdSor+7Hi/hEsLQ0z
   lEbsWGwjRfii4HTqSR6LUyiFq/mpSyr8OYGRDvK6EJRlFyc0YGeA1wiaV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="318548472"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="318548472"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 22:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="679832588"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="679832588"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Dec 2022 22:33:07 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3WwU-0001h5-1W;
	Fri, 09 Dec 2022 06:33:06 +0000
Date: Fri, 09 Dec 2022 14:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 f3efda80f682d1230f8bbf35efb3091e8245801c
Message-ID: <6392d686.WgWZ0mu2cMpEHL3r%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_223309_575232_5A4932EC 
X-CRM114-Status: UNSURE (   5.15  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: f3efda80f682d1230f8bbf35efb3091e8245801c  Merge branch 'ath-next' into ath-qca

elapsed time: 727m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
powerpc                           allnoconfig
alpha                               defconfig
s390                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
s390                             allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
i386                          randconfig-a001
x86_64                         rhel-8.3-kunit
i386                                defconfig
arc                  randconfig-r043-20221207
x86_64                           rhel-8.3-kvm
i386                          randconfig-a003
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a005
x86_64                               rhel-8.3
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
x86_64                           allyesconfig
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                        randconfig-a011
i386                          randconfig-a014
x86_64                        randconfig-a004
i386                             allyesconfig
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                        randconfig-a006
arm                                 defconfig
x86_64                            allnoconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
arm                  randconfig-r046-20221207
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
