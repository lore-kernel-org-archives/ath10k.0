Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E873ECAAD8
	for <ath10k@archiver.kernel.org>; Thu, 22 Sep 2022 21:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7EUvFVWvRw7Gvjat0dVMYSwtq5yjoFe5UHhY66TgrcM=; b=xZ1EbNS4HVoix6
	qPoh3+geYreWiyGoZ3WQqvPjU+qaBfrkNcaSjVF+/VvHRlW2EKo9Y7ADYNp6GSWsg1Vxo6N1qeoDY
	DFfNzgjQ+KrdWk22l8UM9g6uYgMXGheDmM9839ty+f426Otb9x+CDBvN0QgwfKjMWfovHIquGudvy
	tRLhfkYsyBe+D/4iOR+6pRFs6lbVoiclrqJFDSK37WkSjfTnhSRJT8USGKt7mX3CRgabSMUe9oD29
	sqcyyz0KEyOMd7XotJt4pgk8OXziymmTuXyKChpA1VB6YLyXG8z3w//5X7Ts2ukTDwI0/VJ7S0ZaH
	PvRkkSpxQhbecnyvPa3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obTNK-000EdD-9x; Thu, 22 Sep 2022 21:04:50 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obTNG-000EaU-MR
	for ath10k@lists.infradead.org; Thu, 22 Sep 2022 21:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663880686; x=1695416686;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KNk1nygAj/z3SmFctuVA+FKCpbv+lmydrbtQl2m5HWI=;
  b=U2Ea5uvzjvCq0HmfA+hAYYSVGKZjPyEM6I36kEUmuodHk0Nrhv131SmG
   C64wIavSPaZoc35s1mA0wQGP2Xh8XhxlpO6NUbhBqBsO1e62Pie9rZMwc
   Cr4F6h5aj9IfmU3ztOa61GKU+smLbeK63eQaHkmW2QTihhWEWWQuwnQO8
   8up8biJ8y1q5Ezgemgf68G4Gk1dnUL+1onQY6eaQhcYvnQGIIG4mOK+Qu
   Y93obuIR6l1q/+NHrLtq1WsQsiq1UxW7mcPEAfvVTqPRxB3ulc75Uc+cY
   Cqo9OAwfCEDZFymuq8MUgLKKfEjUt+tab6/+3tkxidJgX3lY5WZt4eb4D
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="283525056"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="283525056"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 14:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="597608013"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Sep 2022 14:04:41 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obTNA-0004xY-3D;
	Thu, 22 Sep 2022 21:04:41 +0000
Date: Fri, 23 Sep 2022 05:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 9083badc0481aedc0bef04ba7ec8316496cc2191
Message-ID: <632ccdb8.C0wz9Y8C81yiRo53%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_140446_822714_5E25F230 
X-CRM114-Status: UNSURE (   5.94  )
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
branch HEAD: 9083badc0481aedc0bef04ba7ec8316496cc2191  Merge branch 'ath-next' into ath-qca

elapsed time: 802m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
arm                                 defconfig
powerpc                           allnoconfig
s390                                defconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
s390                 randconfig-r044-20220921
m68k                             allmodconfig
x86_64                        randconfig-a004
alpha                            allyesconfig
x86_64                              defconfig
i386                                defconfig
x86_64                        randconfig-a002
i386                          randconfig-a014
x86_64                        randconfig-a015
i386                          randconfig-a001
arc                              allyesconfig
i386                          randconfig-a003
i386                          randconfig-a012
x86_64                               rhel-8.3
i386                          randconfig-a016
x86_64                          rhel-8.3-func
x86_64                        randconfig-a006
sh                               allmodconfig
x86_64                        randconfig-a013
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                           allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a005
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
x86_64                    rhel-8.3-kselftests
arm                              allyesconfig
s390                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
i386                          randconfig-a002
x86_64                        randconfig-a003
i386                          randconfig-a015
i386                          randconfig-a004
x86_64                        randconfig-a016
i386                          randconfig-a006
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
