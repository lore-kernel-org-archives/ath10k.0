Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0FDECAAA1
	for <ath10k@archiver.kernel.org>; Sat, 10 Sep 2022 01:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ug8PMzIT0khVABQWeyh8WNlcPYDKQVbIutFfMqEjUwc=; b=yzZGlInsTfe43h
	Irgr/U2avVZegEp8RkNMfXgGb0wwur02sQykU5c+5uJcx/2jV/EqfV93igKca0Zjh2MA0IXWWtWmI
	8AnrQ0ZAJxCYy4p9AJa2IwBw5s7ATyvCa4TItEjgwYlVCFipVjpUItV8A0nKfd/8VJNjU6PIeChIN
	lurlX7Xj2sW3ol/Nh3gPlR0FNZO/nHxc2iyJA4qXsfJ1cHzoSphw18w7jri/t56ivdcAYoBFdXZLK
	DNmG0qdBWKo6K0lp50oWWk7syHzyaM+uLwD7WQGu3CVQi4QneZWiL0j5ZAISlWLjlhNXdzCOEDq1V
	cEpq575G5Uh/yZSpH17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWpSz-004ppA-5X; Sat, 10 Sep 2022 01:39:29 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWpSw-004poU-CZ
	for ath10k@lists.infradead.org; Sat, 10 Sep 2022 01:39:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662773966; x=1694309966;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9G49D+82X+E7iX6aODt7Xt2T+Z7kSDVd0KJnBetpWWM=;
  b=Y8AyFRyXnZuzJ7z6dXIQGnJX51OCx5B5FOrYzD/YivpG5mSH7rv7KlJu
   t8+yBw0R8bp+e3GcQjsclhxCdpf00URI+/BBSjwCEPBcaM/tzXHlLOzic
   l+JOEWIls0J8NFBtHBn1axbYyr7gES96Kqyvsj6NUfYQkzHvQ0Vn0TUtJ
   tLY7IJzwO4Xfgk3RwQUC3rFLdU57uBn7mt+VCwcV8oKAx1deJM4/fHPWt
   9N78d56q8/QDo/kHvD1hU3WNEq/rlL+hmjLPeYfbcKs1F2/3ujYLyGhgY
   6wqiXC5ekWSyTqKgca4zTwEcOP+lpnTseyUBLl07uZNO5C23LOhRWgnnb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="298940938"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="298940938"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 18:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; 
   d="scan'208";a="566563800"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Sep 2022 18:39:21 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWpSr-0001yT-0k;
	Sat, 10 Sep 2022 01:39:21 +0000
Date: Sat, 10 Sep 2022 09:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 1d3b6239c63ff80e82c38c33d4cd650ce45d33db
Message-ID: <631beac2.22PTAMl8iKrRpcdr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_183926_517904_64AFF03B 
X-CRM114-Status: UNSURE (   5.41  )
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
branch HEAD: 1d3b6239c63ff80e82c38c33d4cd650ce45d33db  wifi: ath11k: Increase TCL data ring size for WCN6750

elapsed time: 890m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                           allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                          randconfig-a001
alpha                            allyesconfig
i386                          randconfig-a003
m68k                             allyesconfig
i386                          randconfig-a005
i386                             allyesconfig
arm                                 defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
arm                              allyesconfig
s390                 randconfig-r044-20220908
arm64                            allyesconfig
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20220908
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20220908
mips                             allyesconfig
i386                          randconfig-a014
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220907
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
s390                 randconfig-r044-20220907
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a013
hexagon              randconfig-r041-20220907
hexagon              randconfig-r041-20220908
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220908
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220907
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
