Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B82C43334
	for <ath10k@archiver.kernel.org>; Fri, 15 Jul 2022 23:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5H3J7xGc5P7xRrUo9159jTIOgI0SUvCP6YgBPHBXbKU=; b=g1YmnyH7/ByKpl
	zaRkD+QdDAOH7EQnMWjmpe0EYlVI8fn2EFfYpy4rOzkvX71HMmtl72sWSlamYzSmXHAOsL2yWXqcA
	+2xcyUfUYiXCLONFIGfbwoDAuVxj8dyY5MLA+yRB4TgQqFZAXTEeYdv7X5luU6UKBAgmTQXYbOfLJ
	N8BmG1y7goF35h8Hy1qIEJ5wLID8IYY4QKDY4RFhNwx6sIK3OTa12O8PmGlXdS4sZFmmGFVJZ/Uc/
	gMJJDI7iWwnzHywt3Yih8Ay17onla3tFiHi1oFFKy796Xr2a5rxk493LyD3hpdqKTNMFX6yj0nuBt
	2t1vup0m8TwmkoQLdEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUhY-00B8fn-Uw; Fri, 15 Jul 2022 23:26:29 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUNd-00Az8T-O2
	for ath10k@lists.infradead.org; Fri, 15 Jul 2022 23:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657926353; x=1689462353;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=O9f3Y7bXvAvkr+RNgm6oU2tQXL7mvVKyuc4+THqw0/0=;
  b=gU/CJQZop8HKL7ILxvfqpcNYygBzDqgkBURU/+FUe8JfeCADhhpjZh6o
   mW1Z/NxpaBKhBmf/b4WsxSvTCYFB6Lf0Xau+qHPm58OZSIFuaqpBy2U4k
   nEAMaa6qmfY+OCcFPPd4xqA8emmHsqAYORwSs1jbTVkfQ0F1MMFkqVFrd
   IVkoEeN6+x6ic/qP2RYhd3YXBzyczhGviih3WCqyowRRRtANeV8M1h5FW
   /OSHFFiidiT27pQ8WCkYKaEG6y6ZOWhcA8XjUc9Ud5pN621Kjq/FG/3WF
   hNqaHa9te1k/f90d8a3UJ9G0X4mmPeV3NJTnynlNivtl3HoNevs1aqMOB
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="283483686"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="283483686"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 16:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="624047126"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Jul 2022 16:05:48 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCUNX-0000qa-JT;
	Fri, 15 Jul 2022 23:05:47 +0000
Date: Sat, 16 Jul 2022 07:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 65ce559cff93a40dfa486cccb3ff33b9e3572114
Message-ID: <62d1f2a7.QQQ5hzAwtSp+bODV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_160553_908250_008E5CBD 
X-CRM114-Status: UNSURE (   5.72  )
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
branch HEAD: 65ce559cff93a40dfa486cccb3ff33b9e3572114  wifi: ath5k: fix repeated words in comments

elapsed time: 724m

configs tested: 51
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220715
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220715
hexagon              randconfig-r041-20220715
riscv                randconfig-r042-20220715
s390                 randconfig-r044-20220715

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
