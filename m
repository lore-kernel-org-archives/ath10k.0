Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10478C6FA82
	for <ath10k@archiver.kernel.org>; Wed, 21 Sep 2022 05:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cN6b4SSMkhdnGhzR5jchtCRpBvcNE7GHGL8jAs9QImk=; b=XbewZPRcARQ09p
	DxanaPLAUI0fKkVYi8HZt7mLEfJm6jsfnZpQqrUlJX3sW4ia61RQQnCegylBOkeBvLcatIFDA3ymX
	+WPlzP2WOMtQNPHKlAXPRFIPKCIUXieTeOXJLS6DUKsvRhdabSCLmuL/zmQ9CBsHkPVNvn82pXLeY
	2fmbNS2X2usErCM785paW1M1EiY70BpMXttK9gj1VG6v+a2a/e41q4COG13aJhqwfvN7aTS0FJHYr
	I0Uv5w0tZHRQGTC8ovCugoj2usALGwf3h7a6A15XWZN8cql41E0Kqw2m0AHTBjab1cC+COywgoIwg
	UIqBsDG7SMlAI/xOdofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oasT3-00959d-5F; Wed, 21 Sep 2022 05:40:17 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oasSx-009571-KE
	for ath10k@lists.infradead.org; Wed, 21 Sep 2022 05:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663738811; x=1695274811;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/n7E0S7k9aZybSTIY2tbuRw0tm+EmhMygFb4L/62Fio=;
  b=LHgfC8sTM7JMlH/HH5i5b8ckfi87qCxO7yGfDPJLuse2ObPQTZV4piAU
   9rYjx5o/fOGQOWWeBbwMS9Qest3B/FJcYfU+bBepjvYHLNNLHwG6Rpehr
   iVQEx1ltRCgeRFP0KnY/q4kz8lDuY1A8emw9ir8PInTkDU0mF8R8RSTRu
   /afoBQeszJiJspg0PFWpAechBMYGsClFk7+eFb4RK8WPhJjBZMmD04eIg
   hlBP23Wtrf3cFi4O1A9MWj1/Qcqhpt7zJRsYAw1GKKtbvSRRJSCj69VsF
   TmgB5PfyyB6owGVR54lnKyFQFeefU7AWHf1PCkY0RcmYWLZ7acDgVneL9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="299893208"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="299893208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 22:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="652391652"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Sep 2022 22:40:07 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oasSq-0003HR-3D;
	Wed, 21 Sep 2022 05:40:04 +0000
Date: Wed, 21 Sep 2022 13:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 250fbdcd1e6fdd0f11289fa66b427d782bccbb2d
Message-ID: <632aa38e.bYXeUsjk8Qee095e%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_224011_755915_9DE6211B 
X-CRM114-Status: UNSURE (   6.31  )
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
branch HEAD: 250fbdcd1e6fdd0f11289fa66b427d782bccbb2d  wifi: ath11k: retrieve MAC address from system firmware if provided

elapsed time: 721m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
s390                             allyesconfig
sh                               allmodconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
s390                 randconfig-r044-20220921
i386                                defconfig
x86_64                        randconfig-a002
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a006
i386                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                               rhel-8.3
x86_64                        randconfig-a011
ia64                             allmodconfig
x86_64                        randconfig-a015
x86_64                           allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
