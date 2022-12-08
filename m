Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EF7C4332F
	for <ath10k@archiver.kernel.org>; Thu,  8 Dec 2022 05:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3h4fG4vzjDuPg0DkxdmiMjtfK6Uf4KJgHcj5EK8s/4U=; b=B4lp3mgmKnd6If
	ub0aKObixi/YvceVeITwmsbf0BrTqIK/NkJFEScBq/IbBmq3azB9Mnlb07PDbXGtOxV+Eydr+bTB3
	qNcovkpkC/AkwbyjGmljRrPJKUbRlh8OqlcHVdYuhD81Flgp5Km2+vhpUsLuR3bE9hySrY70rIbFu
	2Ahp/eT9Heh8j4I8ISvNo66tpA8NZPqp3kdMcwrmgvxNuxK3oyu6pKEGV/JKR8Tmdy+y0yh09dH1g
	+H1PQAeP1NHnzecqtWpNGoMaYRzrHe1xP8sb8bRInfV2karHXY9gnc3Sm9nqXakbkL2CXhaVFC9P9
	P3y/qLX9IyylxHxOFD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p39ZO-002K5u-30; Thu, 08 Dec 2022 05:35:42 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p39ZL-002K0g-7g
	for ath10k@lists.infradead.org; Thu, 08 Dec 2022 05:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670477739; x=1702013739;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AlgYPe1/dgnQXydyPoxAR94Q1Mgks33jQ3P7nk8TwCM=;
  b=mzLZSDdWLVqmy5XrS/okSiyOONqltYATM/OxljAI3YxcnOmI3mXbQwtY
   4z7inoMOlIa7ntuPFGNCsmSz9Ti/4ZM55CLSgHNI3vtJQVW5jFpyMvC55
   gjPDirFBQc7KekGE4064JZur+MPq5mW3prrFopa9LiwQsisP9L/As1U93
   6RLRQFNA0rC8B9wErlPmsvkLkqFM1tyNR+UinAA+tJcE/fTwpuLlX4+ry
   JC3trOJACP7KgyeQti20fyr1/Bo6GGub0MEnLto09IdLIq7XqwUwg2hKM
   bF0paMM+LXI98zC0NKgiR+VNRsNPQDqQs+lAVOTosP/5+ii8uNFbBbGZf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="318932682"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; 
   d="scan'208";a="318932682"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 21:35:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="892083520"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; 
   d="scan'208";a="892083520"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2022 21:35:34 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p39ZF-0000st-16;
	Thu, 08 Dec 2022 05:35:33 +0000
Date: Thu, 08 Dec 2022 13:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 0f1cdc0fd000876a181d19398f61a2914f825fc6
Message-ID: <6391779a.DRp4ql++RNyc2OZG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_213539_354521_6FA5509D 
X-CRM114-Status: UNSURE (   3.92  )
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
branch HEAD: 0f1cdc0fd000876a181d19398f61a2914f825fc6  Add localversion-wireless-testing-ath

elapsed time: 728m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
arc                  randconfig-r043-20221207
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
s390                             allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                          rhel-8.3-rust
x86_64                              defconfig
i386                          randconfig-a005
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
sh                               allmodconfig
ia64                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                               rhel-8.3
x86_64                        randconfig-a006
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                           allyesconfig
i386                          randconfig-a016
i386                             allyesconfig
mips                             allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a011
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a015
arm                                 defconfig
x86_64                            allnoconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
