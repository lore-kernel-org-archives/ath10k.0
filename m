Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9064C4332F
	for <ath10k@archiver.kernel.org>; Sat, 26 Nov 2022 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MokOOZDA7Lpc4jSsneDOy3vdA3dt5qAWvL/w+3aaiqA=; b=VRG1gzvRONZzt0
	w4hcZeXF5nXYR48Pndf7SY7XT3cbXGs8pKE1eR2QFjeQGd1d+pNHC93H5eMm0+qKcMbfrSvekVJzb
	lSXeQfpOPxxmr9tdmFhvxLbZxpg+0+fdr2BlbmOrBmFKn1UBPAXRMxrR7Urp8Cu+W/CIjRL0Ty//t
	nu5sGRsTFWRO/CsvR7FTnA9o6pJgeMCRDUK9d0L7OQbTRvm+hvSorR3CUfEeFpLHQBFuA7CGyTUE4
	rlpaRv2Y7ANaWUZQRHeJNDq0g4vlhFXDHqu20F07DnEy3SpI1OnZOca8x+QWYjYyUjCQLXUrOiQvo
	brPmasjVlt9hSWbCUfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyrvL-005PXc-KY; Sat, 26 Nov 2022 09:56:39 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyrv4-005PWX-Kr
	for ath10k@lists.infradead.org; Sat, 26 Nov 2022 09:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669456582; x=1700992582;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M2OruqGWTUEMWzB5j9CAJ2HDbkCgogKmRyJyWRInpRo=;
  b=Qcpha1zVmft32t08SwfymU3/lEi1DkxptHFMiSFFSCdu01rBhSNrWfUH
   zOMVffvvI8Q4widB2ooi7N/ZPgWFf1oARThLXtl9fgoKez95NtleKWgRY
   nmbZuHZF7jnlBScbi5+cfQ5S/H6VGl2maaaeYO6oW4F1LOVoOXLTD+kWe
   zGFNfYNTPBjEFBW1NHJRgnPlNRQmgPaEwTB+9lggAjGFSCkUSHNDtlzCp
   O7UPGpmLiWHdj3c2+PLGdob5VKbc0CBnoTxmh81xLjt4cp5MJNqb8xXTU
   ruS76GPBrkhDr+QAKJqX5Pp5fc2blzQ16Xk+XUcJBaK5Rpc1v+wZhotzI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="302159133"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="302159133"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 01:56:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="887893583"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
   d="scan'208";a="887893583"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Nov 2022 01:56:20 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyrv1-0006B9-1K;
	Sat, 26 Nov 2022 09:56:19 +0000
Date: Sat, 26 Nov 2022 17:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 f494a2ca152506cc9edf82439027c1faad562fe7
Message-ID: <6381e2a8.RHMvo9YLsiHsxZ10%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_015622_814290_A91457A1 
X-CRM114-Status: UNSURE (   5.88  )
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
branch HEAD: f494a2ca152506cc9edf82439027c1faad562fe7  Merge branch 'ath-next' into ath-qca

elapsed time: 1326m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
um                             i386_defconfig
arc                  randconfig-r043-20221124
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
alpha                               defconfig
ia64                             allmodconfig
s390                                defconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
s390                             allmodconfig
s390                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                               rhel-8.3
m68k                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                             allyesconfig
m68k                             allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
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
