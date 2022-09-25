Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B25C32771
	for <ath10k@archiver.kernel.org>; Sun, 25 Sep 2022 02:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BObWIwBdPsvGdEOcI4e5wcJJOivH2p/0b9Un2KAwIDc=; b=JA+KKvq8zSUoFJ
	NTR33VPOyEXMtZSRH5Z3RYmJSnGescZ1sVi1IfC7HlZhX+umrCyEPNLUVEjbPjKoVr4X6m0HXFZGm
	F68ZmBo8aaFHQMcwrMmXpfP1eYMC4ZkNlorWqF1rXlgSIMwskVLLvc/BCXOYEpwLj0f4WuVa3QkFy
	BCobR1i65E9whJWy6O9qpxRRoHq/My3uSI0Efy6NjU/zp14Fu+WZr5WDWkAClBHlq49SCd5uXWIBj
	jisaq1uz10ZZskLKDdic8sUCU4Z7Fyc5udzGU4QKRAMV46MgGkx/wI2tfW/1P5fvdlTRWJ/gnI5Hy
	Zdl9Q+RrgGEi0cnyo6/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHmy-00AX3D-3E; Sun, 25 Sep 2022 02:54:40 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocHmv-00AWzY-8n
	for ath10k@lists.infradead.org; Sun, 25 Sep 2022 02:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664074476; x=1695610476;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yHi3F5pCCt1bMVMEFWxCoWx6v4NQLe5FEO3hYrMQNnw=;
  b=GiG6cdN/tYaSRd2Vd6hFJEnm2OkSXg0ngFjinP362VWkSiCwxC7KsCh9
   Li08dLDEAH5QFFhlTPT4PPovArQiKhc0Q3lqTYUj55y8Hn1xF5xz2tPT0
   Fk6ARB+afpfmMnm8CBzz7V8txDv85FW1rdmB5SdbrRcdph7+NU2P28BLD
   fto4668/fAVVQyIeMV+3mSzIAxb5qZql2rI/jxF3Ll7ZIC1Hl61AIi4IM
   212BJV2AKsptFUYjBcJGZPCVw0f4OqpQh8w7E5Q4J/s+IJ0/X4W/C7CeC
   4tsaKrKLyqKw7sD0xHQYJN7MSkusEmibC276HULPxyGmpIAkvQdgy3q8e
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="364857221"
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="364857221"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2022 19:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,343,1654585200"; 
   d="scan'208";a="651403237"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Sep 2022 19:54:23 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ocHmh-0007J0-0Z;
	Sun, 25 Sep 2022 02:54:23 +0000
Date: Sun, 25 Sep 2022 10:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 3272ba37f14f9cc5c5f3caddd9d827e4348c80f9
Message-ID: <632fc2d3.WP8ZvHjxFAagzRWT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_195437_419805_897B0935 
X-CRM114-Status: UNSURE (   4.46  )
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
branch HEAD: 3272ba37f14f9cc5c5f3caddd9d827e4348c80f9  Merge branch 'ath-next' into ath-qca

elapsed time: 756m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                              defconfig
i386                                defconfig
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
arm                                 defconfig
ia64                             allmodconfig
powerpc                          allmodconfig
i386                          randconfig-a001
x86_64                               rhel-8.3
i386                          randconfig-a003
m68k                             allyesconfig
x86_64                        randconfig-a015
arm64                            allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20220923
arm                              allyesconfig
i386                          randconfig-a014
s390                             allmodconfig
m68k                             allmodconfig
i386                          randconfig-a005
arc                              allyesconfig
x86_64                           allyesconfig
alpha                               defconfig
s390                 randconfig-r044-20220923
s390                                defconfig
i386                             allyesconfig
sh                               allmodconfig
i386                          randconfig-a012
alpha                            allyesconfig
i386                          randconfig-a016
mips                             allyesconfig
x86_64                        randconfig-a013
riscv                randconfig-r042-20220923
x86_64                        randconfig-a011
s390                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20220925
s390                 randconfig-r044-20220925
riscv                randconfig-r042-20220925

clang tested configs:
i386                          randconfig-a013
hexagon              randconfig-r045-20220923
i386                          randconfig-a015
i386                          randconfig-a002
hexagon              randconfig-r041-20220923
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220925

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
