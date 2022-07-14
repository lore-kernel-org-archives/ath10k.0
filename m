Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9922CC433EF
	for <ath10k@archiver.kernel.org>; Thu, 14 Jul 2022 02:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pUHebozylGLVCVyzsJN4M6l06g7orikLHcjD/fVTyrQ=; b=FEqM3CY2zQEJsq
	cUrM64JN+eQLp22LDotjiwtOBB0tD3l+Jk9F6WNSvLRTwM7ndQ7Qy41cWRCwU3zb2RzG/wKBkqgJG
	DhOBgYkBNNVZOaDV4sWru5McuCDnipgUCqq+c4oDHX8c/f8MBim7u7fyB7h638xx8DBt9K6m0GmVN
	QyZosiffJ3FWIfS3fcTlMTMpjNnfX6Lv+ddKFSJEwTc/hblNjNqaGBCu5tzA9Eli1JHl33sYGCxcz
	WWGPftoWThvuDR1zfxgTDBsppbcVep5gDbux/VbKfqQw+YIKCMCxBfDm6OvsM2suZvmXzS80v+902
	iVX8QsEWJtpcyQBDPOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoKz-009yHk-UN; Thu, 14 Jul 2022 02:12:21 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoKw-009yBK-DH
	for ath10k@lists.infradead.org; Thu, 14 Jul 2022 02:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657764738; x=1689300738;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NjmuuopmZlW3cZ3r7nFA3+/HaN2yKnvVLW4C5zEVOdU=;
  b=QEVeCzuegiPE+HTE3vO1uT4Fi7Gwfp3/qdIK34gRUVTO1Zmi4OjjWc1a
   iFp6XcSXM8lnvxOSoyKVIbaKjF2bJWRQWCrV39iZQSs/zIGEVoaAx0KBg
   JA/s5tILyoauSRRMQHjI8SC90lhxEqdefNNaMfglDgZDxKCiA9gmJ5kx+
   8MgZdX21vpe+kLqr7R2iXbFftqibmmaoM+ZmEfmtHN2T/Kil3HtMx9uOu
   Lw+dzLCHzKPcnfuB5thphhKmdb+JL6v+4nAcv5xxMgDz6w7hqJr57ik7I
   d3PTCL9PtX5BpBB7Lml1nhxJaKflyJTtYqzPs9S3VCEMVksVI2+JqEqvC
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="265803755"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="265803755"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 19:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="922881246"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jul 2022 19:11:53 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBoKX-00003G-07;
	Thu, 14 Jul 2022 02:11:53 +0000
Date: Thu, 14 Jul 2022 10:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 1688ad523a824d8a0a633615d9228a103d5e09bd
Message-ID: <62cf7b5b./v+KergtpDc7ykcc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_191218_702928_C3441EA4 
X-CRM114-Status: UNSURE (   4.31  )
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
branch HEAD: 1688ad523a824d8a0a633615d9228a103d5e09bd  wifi: ath5k: fix repeated words in comments

elapsed time: 2547m

configs tested: 49
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20220710
arc                  randconfig-r043-20220710
s390                 randconfig-r044-20220710
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220710
hexagon              randconfig-r045-20220710

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
