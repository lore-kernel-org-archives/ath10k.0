Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC886C3A5A7
	for <ath10k@archiver.kernel.org>; Thu,  8 Dec 2022 05:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qiL15bRNp7L9bUMI0Gj1wuLwRpR33sYZX986XcNSaKY=; b=1t+z+gf7IF/IOW
	2MevLWHN6RF/BfEAAisGsU/iGipK0wZ5NnoQJNE0d4iyTPD9xhFdVsTDuZKPfRlgazTbVHxm2iyjs
	k112xo8MuvT3gKgG6tk5hk4a0L7rsTtSc29HplMVQxXT3tTatUC9/ItYTZpJQoFgweA1Rm7z6gRYB
	GrpPHeHPwF0EO3ih22fguIBkd1cZgSDGCLfc08pz//1B7FiRFdJZfya1MzfHRlGUASe//DMVawHbV
	6zP5e6ZDGW1vixi+lGksH/pspz0IqkHxtyuze9taDCU3biHtPO3oBJJuYJ7rw1BluLPbpO744RWd1
	W4hk36gfsKwIgR89TOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p39SZ-002EWD-M9; Thu, 08 Dec 2022 05:28:39 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p39SW-002ERK-U5
	for ath10k@lists.infradead.org; Thu, 08 Dec 2022 05:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670477316; x=1702013316;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0ZL4wwptfLZdQzQxBdZ5ekSesnmX5tKxhqL20AIDhdM=;
  b=M17hqd3jGp0GOOY0nuN3+WGXfaKyFARjE/YSY9FVuXiuLoSA5QYkaq7H
   IS6d33MRCU9v6+YANbYG/tXFzUQ+uQbBUwYrmvVcGLwmBZBFXUQxGIyi/
   3jGI/JnV9vRQ5XubrX1cpfgqBix7AFtZ2DGChIlYJb+q/cSAY6o7l9JFd
   PYbE/FRMwhVUj7qqyvVulOSIAP8P5xnCyJKqk4V9xzSDSo7Rgm5/Vxu0W
   xixEfhwOqgPzDCFvE7wMN/9sttAgySg42QTL/V4L4TjP05k1RbIH+RAN+
   zowR1hP4dxdgba1y8/fE3raEAygeisQLmJ5/43clT0rzWUwvUl2uGgNO3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="315796624"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; 
   d="scan'208";a="315796624"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 21:27:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="821208380"
X-IronPort-AV: E=Sophos;i="5.96,226,1665471600"; 
   d="scan'208";a="821208380"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Dec 2022 21:27:33 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p39RV-0000sH-0E;
	Thu, 08 Dec 2022 05:27:33 +0000
Date: Thu, 08 Dec 2022 13:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 25edca7bb18a2a40cc7e54c6f522e9b3c917e2c5
Message-ID: <63917589.NTDKURGUhUNwTEQu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_212837_029706_43E10F58 
X-CRM114-Status: UNSURE (   4.25  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 25edca7bb18a2a40cc7e54c6f522e9b3c917e2c5  wifi: ath11k: add ipq5018 device support

elapsed time: 720m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
arc                  randconfig-r043-20221207
i386                                defconfig
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
s390                                defconfig
i386                          randconfig-a014
x86_64                           rhel-8.3-syz
i386                          randconfig-a012
x86_64                        randconfig-a004
i386                          randconfig-a016
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a002
ia64                             allmodconfig
s390                             allyesconfig
mips                             allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
x86_64                        randconfig-a006
powerpc                          allmodconfig
x86_64                        randconfig-a013
i386                             allyesconfig
i386                          randconfig-a003
x86_64                        randconfig-a011
x86_64                           allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a005
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                            allnoconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
x86_64                        randconfig-a016
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
