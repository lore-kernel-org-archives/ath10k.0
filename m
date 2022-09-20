Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6C0C6FA82
	for <ath10k@archiver.kernel.org>; Tue, 20 Sep 2022 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bDx3djuO5gv4Ffr379kjNkjHZ7KasA6Q0e6U9JWRG9I=; b=BrOwZL9Z0PsMJH
	7vjhShU9vmyHF9ohYlRR3vY7dQ1X55PpfK5egzZgng9EGMGErwh4y/yifYR9wzv5F4mo9wR+iWn+a
	yBRxhBarKbuBbDmmyeQmDKJ28ODnVJrG5N9aQwRZEorhPJF42/Dvw2pBNYO+uvKqaWHR0joL96MQV
	AmMJpNTEi8kIFH+wbLTWGjPbn4d9QX031kM3Z1SkIezuuiEs6H16GBplTV6vLZFFSy6JJW+CSDcL8
	azNEwiuBjrZZ/55yFkmh3vt6iDRhYoVdqh7jF3U6H8sLIIL+ZoZj+mRgrWBlZaKNA2Il1xNhOfNlP
	enDZ+oieqlocWKR07H3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSEs-00H3eP-JB; Tue, 20 Sep 2022 01:39:54 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSEo-00H3ca-R9
	for ath10k@lists.infradead.org; Tue, 20 Sep 2022 01:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663637990; x=1695173990;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Gu27XFgToJJx0W28ubUlOYNOL6/+trWkLdpS6EBgBkw=;
  b=TN2uqLBnailDaUWy2NEOS2TzqEmDf9AAc/48o2wk1OHCIWA6HTh15dWe
   rkbXgA7A7YqSgO2rO3Hn6u0LFj2AnAJYdKB+cPq/lg8XX+Dm3RVlhA/Sr
   IKR73Gha8dG7PS3dvXKt0ZkAW6CUj7SLS4MThsvySyBNubhhSpkX4TMsI
   NYP7pQKRQModjL/Oe5XLVjzRxvGCA8Fsu1RAYX/ss+oc8RadfBp2XHnaH
   Mzdwvghdn2oRpVJKPT1ZYpF2AeKh6VfULYp54nZ9qws1EXYprw+hBHcHy
   nwhpJe3WjRJpoJzsslwJ/OEN0XKKyA5P23CBSC6Q3RU8k3Eg0naEwPWt3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="279947368"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="279947368"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 18:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; 
   d="scan'208";a="651901268"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Sep 2022 18:39:45 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaSEj-0002Mz-09;
	Tue, 20 Sep 2022 01:39:45 +0000
Date: Tue, 20 Sep 2022 09:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 1b5012a12e3d82aa94dc8f5609fe2f94f422f768
Message-ID: <632919d5.qOfLImKUz+f/eoOr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_183950_919417_3BC77756 
X-CRM114-Status: UNSURE (   6.03  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 1b5012a12e3d82aa94dc8f5609fe2f94f422f768  Add localversion-wireless-testing-ath

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                  randconfig-r043-20220919
powerpc                           allnoconfig
x86_64                              defconfig
powerpc                          allmodconfig
sh                               allmodconfig
riscv                randconfig-r042-20220919
mips                             allyesconfig
s390                 randconfig-r044-20220919
m68k                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                 randconfig-a013-20220919
i386                 randconfig-a012-20220919
i386                                defconfig
i386                 randconfig-a014-20220919
arc                                 defconfig
i386                 randconfig-a011-20220919
i386                 randconfig-a016-20220919
i386                 randconfig-a015-20220919
x86_64               randconfig-a012-20220919
arm                                 defconfig
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a011-20220919
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
alpha                               defconfig
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a014-20220919
s390                                defconfig
x86_64               randconfig-a015-20220919
arm64                            allyesconfig
s390                             allyesconfig
x86_64               randconfig-a013-20220919
i386                             allyesconfig
arm                              allyesconfig
x86_64               randconfig-a016-20220919
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220919
hexagon              randconfig-r045-20220919
i386                 randconfig-a001-20220919
i386                 randconfig-a002-20220919
x86_64               randconfig-a003-20220919
i386                 randconfig-a003-20220919
x86_64               randconfig-a001-20220919
i386                 randconfig-a004-20220919
i386                 randconfig-a005-20220919
x86_64               randconfig-a002-20220919
i386                 randconfig-a006-20220919
x86_64               randconfig-a004-20220919
x86_64               randconfig-a006-20220919
x86_64               randconfig-a005-20220919

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
