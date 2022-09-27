Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5F1C54EE9
	for <ath10k@archiver.kernel.org>; Tue, 27 Sep 2022 19:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zz9VNzpXAEyKLGL43n6827B2LnkRYxgfc2fYUp3fFFc=; b=qFTqzCGE8ooR5X
	IY3kGny/QOyFff4NITCdfg59Sk4xICVJ3Ch4oTIAxX5G2zRx7RSwQgZTB4woMSc8JKyKRCOi+ieP7
	heDVLm07swh0PkPIwdY6ICFTClpZuvetPlStUkYfjfCnpnXzLOX+9GOb/lUHigbFrjst0yrfrIxmH
	b0997R0Z/HDxvdh2eOvBq9BRPl96Ym26CgiochTqeAl7BkPLmrBb6n3r+MAU7JmJj5LjDMWLMFr5f
	cey8Miy0S1mySF1cjKSLpBG4sjyznrosGD/cobLIitNMxs0YgD0YqBPFE9UX55bIK5qcD0LLdicM8
	xxDu40sp5n10vnPCWE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odFvy-00CMfC-L3; Tue, 27 Sep 2022 19:07:58 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odFvv-00CMeX-SD
	for ath10k@lists.infradead.org; Tue, 27 Sep 2022 19:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664305675; x=1695841675;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8nJOEdx4HCC8I/+fBj2trebbux+lFW1VDrkLvSE55EU=;
  b=mdC8+aj6SSFri6vEZBZWt+ntXkvxRuLez+9BM9+qSpWOWG0hIHW8oCTw
   M9eZth6cWRJr6d/O5LKPo2zoAxTQv8noYhIagoOV6brTz1JEVDECbv3JL
   zGA42NON5+bAWXZZyD1a/7gz8je6SYFRImwEvSyupndLlbYkv8qmJ1cP9
   6Wz33a8PWDWW65hUJ0QUYhIfApbMPYlLisM+oeyvmDBpzOmwVLlxwK4Ix
   h4KOyTWkN1f7ffztwFwTO/dFkyKxHEdQIheh9q6iNGxHzHbYCIr+buDNv
   Nj3jytK24Mq3srwSUA563qUC8K6iYtQbC1f35Qvn83Orj/EeVcLqkA2rW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="302887229"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="302887229"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 12:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="690104242"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="690104242"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2022 12:07:51 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1odFvq-0001U4-1f;
	Tue, 27 Sep 2022 19:07:50 +0000
Date: Wed, 28 Sep 2022 03:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 a85df1267bc08de42c1b2f62778c6c9f7156215c
Message-ID: <633349d9.xbPaltCTy6AIpOfr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_120755_986357_B99CB346 
X-CRM114-Status: UNSURE (   5.65  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: a85df1267bc08de42c1b2f62778c6c9f7156215c  Merge branch 'pending' into master-pending

elapsed time: 730m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
x86_64                         rhel-8.3-kunit
alpha                               defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                 randconfig-a001-20220926
s390                             allmodconfig
i386                 randconfig-a002-20220926
powerpc                           allnoconfig
s390                                defconfig
i386                 randconfig-a003-20220926
powerpc                          allmodconfig
i386                 randconfig-a006-20220926
mips                             allyesconfig
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
sh                               allmodconfig
arc                  randconfig-r043-20220926
s390                             allyesconfig
x86_64                              defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                                defconfig
x86_64                               rhel-8.3
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
m68k                             allyesconfig
x86_64               randconfig-a001-20220926
arm                                 defconfig
x86_64               randconfig-a003-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a006-20220926
arm64                            allyesconfig
x86_64                           allyesconfig
arm                              allyesconfig
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220926
riscv                randconfig-r042-20220926
hexagon              randconfig-r041-20220926
s390                 randconfig-r044-20220926
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
x86_64               randconfig-a016-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
