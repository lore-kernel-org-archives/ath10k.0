Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C22C38145
	for <ath10k@archiver.kernel.org>; Thu,  8 Sep 2022 03:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nd06n4WmI9BuQ+NYtkJnYu7oSGnFONLPuFvV3z/a778=; b=xozM11mQ5GE5tT
	PkFK2SEI8OBeb5pnGa0T2CI/8uWWs/2bwZ55W9qsrb81Q53RjlQsAS6cQp5ZudprZL/divvTLj0G1
	coeC/RH9ttJr5OZdM+YEW6iohT22hnMXHFL8ZFJt0pAdDQok7P0o2VDZ981mgiSXzqAClpB3AjQuc
	e43sboEAIKHE+wduvJbJF7w/woWNjkdZ1XM5eqCBH5loriob/Ke3pMGtjL4hfW23YzUQoN/ic8rUO
	RiNkyetvVQTvfzKXfob58x2Tg2EaORwB9y6PuHCeM1HC46/46v7r7SZCIBlawZRv/fVRfDdWNmdPe
	+W8GKLCDYyVea4QzFeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7rY-00EybQ-TH; Thu, 08 Sep 2022 03:05:56 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7rV-00EyYE-NK
	for ath10k@lists.infradead.org; Thu, 08 Sep 2022 03:05:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662606353; x=1694142353;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zeuGAuQrK051pA/n33U0dTwjWBUigicduEti8rjcVkw=;
  b=QSpZughaso5JxxT2b/G2G7gHoZHSti17yXFpKY+PjnsBt2W49tUmhr6n
   1jBKmlnzgoCaWL7j/4bFnG4fea9k59z/tDzWd7fnp/XFoF8dQ0qPbPpjx
   Rp+1keutX9CLaNaCrPirpdi02SrGN9xC7jj2lgeOq2TupXwt0utDumgx8
   p6ByuP60WpmDOeDbZVO8JxBdAjuLrMffiIUI31pcu6f+w6HJ4D3Lzu/pr
   OgZY9bTyYzr9iQ1xEajyU2jKZ1Agd4X95X0mH3cFr6pfNqq3Y88/nnT94
   6S7urHLVPfqUsdO110HoeZTIUHsCslZWCPc1fMTky8UN/YpCXdSiglv10
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="298387608"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="298387608"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 20:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; 
   d="scan'208";a="740513864"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 07 Sep 2022 20:05:48 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oW7rQ-0007J0-0I;
	Thu, 08 Sep 2022 03:05:48 +0000
Date: Thu, 08 Sep 2022 11:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 d5609645e1a3f9971b4259f5b52f97abe4214c5b
Message-ID: <63195bd8.3uqNAyF1+3OSP0S6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_200553_867993_67FD06C9 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: d5609645e1a3f9971b4259f5b52f97abe4214c5b  wifi: ath11k: Increase TCL data ring size for WCN6750

elapsed time: 1075m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20220906
riscv                randconfig-r042-20220906
s390                 randconfig-r044-20220906
x86_64                           allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
sh                               allmodconfig
i386                                defconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
alpha                            allyesconfig
m68k                             allmodconfig
i386                          randconfig-a001
arc                              allyesconfig
i386                          randconfig-a003
i386                          randconfig-a005
i386                             allyesconfig
arm                                 defconfig
m68k                             allyesconfig
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a004
x86_64                        randconfig-a002
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220906
hexagon              randconfig-r045-20220906
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
riscv                randconfig-r042-20220907
hexagon              randconfig-r041-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
