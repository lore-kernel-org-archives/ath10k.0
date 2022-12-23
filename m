Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA449C4332F
	for <ath10k@archiver.kernel.org>; Fri, 23 Dec 2022 05:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FnRb6iz6mC3CcgSEhXYwjwz2LCqwlvsNwZuPezw0Wpg=; b=KcNYnjtam6NKdr
	6/mSPFJMZOpfCuind7kgSaoO0G8lbeUIZZ/7yDUn7cYCSuEuLFmSqXgzP+hs7yhmmMbVLxS96Fbw6
	HVNN1HTDvHYpxTLr6axgK6PZg8BV+rBVx9ZoBWuZVF+LYQdyduXzziArrljzWFjRSi0AXBhW9vZUD
	sFkg3hNDfCOrDaSTo1vOxLi/wPQYoBMrl2gTqiumom8VvfzzrPrBvXdhDTPczD2Qo+IdQ3NuWkhO3
	FBCsazKMPifm2Lex6RdWnPdaKC0gVHxSuGQUtdO8rtaOoPz5alXoD4Kkd/0FlZBwtEsHNelx1JUlx
	080a1suWHfnMU4MSdrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8ajF-003xRu-Bq; Fri, 23 Dec 2022 05:36:21 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8aj6-003xLe-9g
	for ath10k@lists.infradead.org; Fri, 23 Dec 2022 05:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671773772; x=1703309772;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XJanwAA6uPtAnPt1pk8Qn0TwdOqeRitGQ0ApgMIY45g=;
  b=Uiz56OMTxK788CskqP78seU98SfOzhd93bW4AftHfwLvOSDwScgFm/1Q
   ip0XrV/65kEIqBUs8FpojYllFYA4CUsAjqzFI8vL1p4V9ttGf0NLPZn0f
   qYgfrJyU08UawH86TpNw8N3JQx7+kMI8t1DOxJmr9PUoFPyV9QRBCqmXt
   A93HWrLyyuzDcPz6COoxLCTQ8th5jNI3NBMzvgLfVixJEEVziFfaQZoa2
   QmgX1aj2sehgjTDgs5tecwgewh7fY3xF8QXeRF/B+0O3C6rTz6O3/82fS
   iSlrPup+CuRyb75dBTYM15BNNRYXoydpjO4y0A4i68GuOlMrc4DxFLHtQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="382536965"
X-IronPort-AV: E=Sophos;i="5.96,267,1665471600"; 
   d="scan'208";a="382536965"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 21:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="720533750"
X-IronPort-AV: E=Sophos;i="5.96,267,1665471600"; 
   d="scan'208";a="720533750"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Dec 2022 21:36:02 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8aiw-000CSG-08;
	Fri, 23 Dec 2022 05:36:02 +0000
Date: Fri, 23 Dec 2022 13:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 dad36722705f6fa5944fed48374f963906c47d49
Message-ID: <63a53e13.vjVRBrVdv1WEGPhQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_213612_441774_628515FF 
X-CRM114-Status: UNSURE (   4.85  )
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
branch HEAD: dad36722705f6fa5944fed48374f963906c47d49  Merge branch 'ath-next' into ath-qca

elapsed time: 728m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
i386                                defconfig
x86_64               randconfig-a002-20221219
s390                             allmodconfig
x86_64               randconfig-a003-20221219
s390                                defconfig
x86_64               randconfig-a001-20221219
x86_64               randconfig-a004-20221219
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a001
x86_64                           rhel-8.3-bpf
i386                          randconfig-a003
i386                             allyesconfig
x86_64               randconfig-a005-20221219
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
x86_64               randconfig-a006-20221219
ia64                             allmodconfig
i386                          randconfig-a005
arm64                            allyesconfig
arc                  randconfig-r043-20221219
arm                              allyesconfig
arm                  randconfig-r046-20221219
arc                  randconfig-r043-20221218
s390                 randconfig-r044-20221218
riscv                randconfig-r042-20221218
i386                 randconfig-a001-20221219
i386                 randconfig-a003-20221219
i386                 randconfig-a002-20221219
i386                 randconfig-a004-20221219
i386                 randconfig-a005-20221219
i386                 randconfig-a006-20221219
powerpc                          allmodconfig
x86_64                            allnoconfig

clang tested configs:
arm                  randconfig-r046-20221218
hexagon              randconfig-r041-20221218
x86_64                          rhel-8.3-rust
x86_64               randconfig-a012-20221219
x86_64               randconfig-a014-20221219
hexagon              randconfig-r045-20221219
i386                 randconfig-a014-20221219
x86_64               randconfig-a013-20221219
i386                 randconfig-a012-20221219
x86_64               randconfig-a016-20221219
i386                 randconfig-a013-20221219
x86_64               randconfig-a015-20221219
i386                          randconfig-a002
s390                 randconfig-r044-20221219
i386                 randconfig-a015-20221219
hexagon              randconfig-r041-20221219
i386                          randconfig-a006
hexagon              randconfig-r045-20221218
x86_64               randconfig-a011-20221219
i386                 randconfig-a016-20221219
i386                 randconfig-a011-20221219
i386                          randconfig-a004
riscv                randconfig-r042-20221219

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
