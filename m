Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950AEC54EBC
	for <ath10k@archiver.kernel.org>; Wed, 11 Jan 2023 02:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ugc4zeVeN+H5zSqEKBETfFgYbxhqcQoN783oHngySXg=; b=qEGSUams4Y86t1
	SwgVHmmzlBgADczXM9+BHuMwGr6rz5sokaI9JZ8JOxsARLaEBPBvJ1gPWrIBjsH1wi4KQwdsZptM9
	l0+l8YJPyvWF7khd81jEtjXTMOt90jUjnMN5FOcqVcFm1uXeCfyM4b7QNMV2rmUJTp7VbEAqSncO3
	foWZvm5G1iy3dRJDRq0FTLIdFp5sB/Ng0ZuROoGUgOHghWkEKuocvPqm4/qg69e7Xq4qsKesEzrtA
	TrTD8iPhvemVpPWkuykBlKu+v2PUYEWVzL9kuTaxqMOnWjR7QFj4ABQIfvAd83WpvLv9enKBW4oAA
	EG5Vu0oiT5NVZvu6tHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFQgR-009Fh3-Gp; Wed, 11 Jan 2023 02:17:43 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFQgP-009FgT-5R
	for ath10k@lists.infradead.org; Wed, 11 Jan 2023 02:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673403461; x=1704939461;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=32U3Ps6b35seEqRsIFXuzYqygZ3jcShcgkchfVajmRA=;
  b=XfD+bTcuuVFyzhg7BNsz47TE5GqLdsuJM3ikckml2xhQNTMvKZtrRusN
   t7GsCmr4UEvmXHPF/bHm8OG848mjhH2ke+L55zJK2nGj/OrDpRR672F30
   NZEsYNIUUH+vgEx+/NSpURTepN7n3WylxOweh0Ygs4A974Ks767S9kSuC
   8WiTEMWX9b5qC6oBlvMMNVne8PYUfUbzuxZh9KA+lzq5/tQOhLdnTyrfP
   YAJmZLpBskUIirYHURAW3gg7DdM/fknx61gRxE0PwQXKFMGyldDZl1jaY
   KwxJrJ/pJaPZy5pQmOhhT5O7desAjuiUg0FmJYB0kYAYyeSd3g/9Upr26
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="409547131"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="409547131"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 18:17:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="725753537"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="725753537"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jan 2023 18:17:38 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFQgL-0008cG-23;
	Wed, 11 Jan 2023 02:17:37 +0000
Date: Wed, 11 Jan 2023 10:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 e51980bf88c65f6ad4916baf720ad1234de01791
Message-ID: <63be1c2e.9JO9H0U/S3AUGgIP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_181741_249726_3EFF6980 
X-CRM114-Status: UNSURE (   5.75  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: e51980bf88c65f6ad4916baf720ad1234de01791  Add localversion-wireless-testing-ath

elapsed time: 754m

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
arc                              allyesconfig
i386                                defconfig
alpha                            allyesconfig
arc                  randconfig-r043-20230110
s390                 randconfig-r044-20230110
riscv                randconfig-r042-20230110
i386                          randconfig-a001
i386                          randconfig-a003
ia64                             allmodconfig
sh                               allmodconfig
i386                          randconfig-a005
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                             allyesconfig
mips                             allyesconfig
x86_64                        randconfig-a015
x86_64                           allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
hexagon              randconfig-r041-20230110
arm                  randconfig-r046-20230110
hexagon              randconfig-r045-20230110
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                          rhel-8.3-rust
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
