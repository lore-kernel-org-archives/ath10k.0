Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB20C54EBC
	for <ath10k@archiver.kernel.org>; Wed, 11 Jan 2023 03:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6FRNhtohlLCDNrvdsiuKDlxSeF22ZMhnfEhS4X5LPl4=; b=YTlF8hkatnZwEe
	QOGi9zDBAnze/m5YJR9lXB9ODDdGEbupIk4/nctZGP/dVN16G8UH1gO6ZiwK0a8/32cd/yn38v8hL
	KDBDTN0znHxElbRlMR0HN7F72HMAas3R3YOKjhGofKrbiQoN+/iWXt1nmxxoXCU7TE48wikdZjcE4
	OW2k/92LHkk20i3fpTLaMV1yMiMGYkJct7kPxZNXG0gr/GifllO5R22bgms2s7Y0c8tQwtCmrGhiI
	TH9Sbp1+H9udnEYndWYstF09TxHG+By1715cbwusiA3jXdetf6trhplaXreW7mGLpVdBneQtM/gnq
	pJXILjDpArdnY7UdwQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFRiT-009OsT-7P; Wed, 11 Jan 2023 03:23:53 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFRiQ-009Orr-A0
	for ath10k@lists.infradead.org; Wed, 11 Jan 2023 03:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673407430; x=1704943430;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=N93YB9RkRKtO1ZRpx8z2UOrhajeSNCVEaaQEhp2+CEo=;
  b=kQ5fxokdGQ66CyGnjbVNlwYH6a9n9x5OHBSlTGMVvpL2Lfd9M8opDBUz
   /uVkjUZSWzejjDRxgyenPbsUmpZyx+UtEVbOV5BezlDfZk6ElUQ4GpL47
   u3FpphXG0/Td7D4lavWj5Lyb7yASNqFN1/trPXJPhW1l1rqgrfeVEUMO8
   h9KmHJaGK31HFKQ+0nTOzJDsFK+Ns+l5qbu3nQjXk8hP0zTzqUipP4UuU
   cWSW5FD0HP7L0MjWcmABah3mZ76R1dHtALsv+fIt/9eg0W7pInFQu8nB9
   PPhgT3pk078uljQNunDipxM4s+6Lt4wCoy4J1sL5bL+c0P1gxsM1KCJd6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303689114"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="303689114"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 19:23:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607207745"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="607207745"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2023 19:23:45 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFRiK-0008h8-21;
	Wed, 11 Jan 2023 03:23:44 +0000
Date: Wed, 11 Jan 2023 11:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 9982271b4b9d158407a49feede385a68b72e24c6
Message-ID: <63be2ba9.iz5r+7pHJUtaxBew%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_192350_392693_D256491F 
X-CRM114-Status: UNSURE (   5.45  )
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
branch HEAD: 9982271b4b9d158407a49feede385a68b72e24c6  Merge branch 'ath-next' into ath-qca

elapsed time: 820m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
powerpc                           allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
i386                          randconfig-a001
x86_64                           rhel-8.3-syz
i386                          randconfig-a003
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
i386                          randconfig-a005
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arm                                 defconfig
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arc                  randconfig-r043-20230110
i386                          randconfig-a014
x86_64                        randconfig-a006
x86_64                        randconfig-a015
arm64                            allyesconfig
arm                              allyesconfig
s390                 randconfig-r044-20230110
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20230110
i386                             allyesconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
ia64                             allmodconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20230110
i386                          randconfig-a013
x86_64                        randconfig-a012
arm                  randconfig-r046-20230110
i386                          randconfig-a011
x86_64                        randconfig-a014
hexagon              randconfig-r045-20230110
x86_64                        randconfig-a016
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
