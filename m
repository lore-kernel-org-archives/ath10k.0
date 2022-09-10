Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A45ECAAD3
	for <ath10k@archiver.kernel.org>; Sat, 10 Sep 2022 19:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9coZ6sB/GoaRwLueitolFflEOTdJ6rXIZiaFqouPO2w=; b=McsFqMSmtqf29l
	xSDiciMYqtp6v+IW31mK3r2FCRCZbFnfsUUlORfEXVvPjXh4kuLeDulFYf6gurnfYdOLbxhpZHVUH
	YgHVKnHsx6EtzM3B2Pt/1SFzNHFPlr8SuBEVadebZ1ys3Y+iyglcyQryLhEimoSmNxRgezkKDPNmf
	PjaF9h8QGcDXPXRp4/lxabOF9bfei/iJ4vHrptClijm+sC2FB6YbN3luTaSQWi4CqSnijrzGfLvCD
	k7XBqH8eUEk67/UXLSH2etDVpZDLoP5QTbip4VuzH3lbQr/h84p6gwiNTElKT/Vk+1B8uDoW+IbMl
	FlGZYdcqE5h7aeg9aGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX6BW-00CbvK-0Y; Sat, 10 Sep 2022 19:30:34 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX6BT-00Cbrz-9W
	for ath10k@lists.infradead.org; Sat, 10 Sep 2022 19:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662838231; x=1694374231;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hLBQgZak6PVX0wmgqxt/LgKQCNad1krnj7IAmE50lbw=;
  b=AotRZp4neHKqa++ehZQ+3NUp2IfPglI/CLQkqFZ5Etr4xjqli1DaC60r
   CcAnO9pI8MBh4/MEwojWDdi8o8HQci/dlL8tSI2lngEuAebNgRfOoy2HK
   c3SZlHDGu0FD3plKEToYVJ2rrPnHzuYT3vuyIBuukVG4y465ugzeGjy7P
   gRYSYGKQThhNEesPlu686H++I32kUbflWKXYRy4sLn200nQVPft5U98oz
   4Dn/pM14wdMm28uUdQeqSNcZ0Xe8dkCXS6qxYCWtmBvce6PgDshfakNcd
   mLAc1AkCVM7t6v+m4AdE4KVw0WWKS8qk3mclmJoIUAQ6nxno9RzSptQXA
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="296405310"
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="296405310"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 12:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,306,1654585200"; 
   d="scan'208";a="593003213"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Sep 2022 12:30:16 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oX6BD-0000Pb-1m;
	Sat, 10 Sep 2022 19:30:15 +0000
Date: Sun, 11 Sep 2022 03:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 1dc3fefd1ffeedfd0a43425bed19a219159ceb6c
Message-ID: <631ce58b.mP7YkH2weUOyV6BN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_123031_373308_BFBC4656 
X-CRM114-Status: UNSURE (   4.94  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: 1dc3fefd1ffeedfd0a43425bed19a219159ceb6c  wifi: ath11k: Add support to get power save duration for each client

elapsed time: 727m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a002
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a006
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arc                  randconfig-r043-20220907
arm                                 defconfig
x86_64                        randconfig-a004
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
i386                          randconfig-a012
arm64                            allyesconfig
i386                          randconfig-a016
ia64                             allmodconfig
arc                  randconfig-r043-20220909

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220907
x86_64                        randconfig-a016
i386                          randconfig-a013
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
riscv                randconfig-r042-20220909
s390                 randconfig-r044-20220909

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
