Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87F3C47258
	for <ath10k@archiver.kernel.org>; Sat, 20 Jan 2024 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sOPPTSRbs4NmiCOXFlqAoPmeiBeEnMHBah9C95Hi068=; b=kwe37Tj4ALz5OcfCsdeO8ho1/8
	t6lxNNamX48Y1jWA8ivUbJXuB5cH9RAERZpXC7N1n+j7ruOTQP9hayhKUyWeE+6nHdz5mUlAB5IDf
	R5vqnb0vPSZdfdeGuJqpsWShXaWxHtDGV6uOT29EM1rjpvA1RXLno/hjt0AXaWE4+ueZvF72nHsWy
	sfLjkhQkvKahc2fjTCFNlkCaCobZHSrrtIHDm/TtYD2OxtvnV5XnVA19k5CDR6iYYK+IjIuFN88+S
	3I8FjTdRGJWK++MHMmztFquPZDbD7G47phcYDGpKOCjujQKosdHY/cNBa3+b+tqHkqF1zpP2Vy17P
	ofCfMm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKsm-008cyc-0a;
	Sat, 20 Jan 2024 23:36:12 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKsg-008cwz-1l
	for ath10k@lists.infradead.org;
	Sat, 20 Jan 2024 23:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705793766; x=1737329766;
  h=date:from:to:cc:subject:message-id;
  bh=bcdJpMDZRFKlKYnnR47dM7/UN4oa/dNYrNu/HFtzaKE=;
  b=K2DXo9tYlSfhfyeYm1SdRUw2CrssRWeTNRyoeOnk+KvcP8vAk4Ocm4i1
   DkcbHk6bTRcxTl4Xy+LCTWIvgBrkHm1n3j1r61RYPo6ADqrKZKXX5mK+k
   uFqKpiSJg9fklvNQsbGueHKKMcN9xH6aYToQ2NKmCfTdjyoXOXAl1N/iK
   m4L4Dw/fGbO+GrARCq/aozGi6UYjXW7g3csIaeAmWV1ylbkiwdrWGl10T
   AsMYg74bPvPMxt0+Z0DR0s4fQqFfscm44QXMqluGSTiQum7/kKWKRg6Me
   U2hSoi+1JeMnP87VN495FOD5N3r9UdnCD/Q02kYbzdPrZRIIPFcx8WIBO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="487121218"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="487121218"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 15:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="904484680"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="904484680"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2024 15:35:56 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRKsU-0005Wi-1a;
	Sat, 20 Jan 2024 23:35:54 +0000
Date: Sun, 21 Jan 2024 07:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 f020c30299323c206b9041dd478ac040dd828ec0
Message-ID: <202401210753.MEPXwyCS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_153606_648962_91770897 
X-CRM114-Status: UNSURE (   5.22  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: f020c30299323c206b9041dd478ac040dd828ec0  wifi: ath10k: Fix enum ath10k_fw_crash_dump_type kernel-doc

elapsed time: 1779m

configs tested: 79
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20240120   gcc  
arc                   randconfig-002-20240120   gcc  
arm                   randconfig-001-20240120   clang
arm                   randconfig-002-20240120   clang
arm                   randconfig-003-20240120   clang
arm                   randconfig-004-20240120   clang
arm64                 randconfig-001-20240120   clang
arm64                 randconfig-002-20240120   clang
arm64                 randconfig-003-20240120   clang
arm64                 randconfig-004-20240120   clang
csky                  randconfig-001-20240120   gcc  
csky                  randconfig-002-20240120   gcc  
hexagon               randconfig-001-20240120   clang
hexagon               randconfig-002-20240120   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240120   clang
i386         buildonly-randconfig-002-20240120   clang
i386         buildonly-randconfig-003-20240120   clang
i386         buildonly-randconfig-004-20240120   clang
i386         buildonly-randconfig-005-20240120   clang
i386         buildonly-randconfig-006-20240120   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240120   clang
i386                  randconfig-002-20240120   clang
i386                  randconfig-003-20240120   clang
i386                  randconfig-004-20240120   clang
i386                  randconfig-005-20240120   clang
i386                  randconfig-006-20240120   clang
i386                  randconfig-011-20240120   gcc  
i386                  randconfig-012-20240120   gcc  
i386                  randconfig-013-20240120   gcc  
i386                  randconfig-014-20240120   gcc  
i386                  randconfig-015-20240120   gcc  
i386                  randconfig-016-20240120   gcc  
loongarch             randconfig-001-20240120   gcc  
loongarch             randconfig-002-20240120   gcc  
nios2                 randconfig-001-20240120   gcc  
nios2                 randconfig-002-20240120   gcc  
parisc                randconfig-001-20240120   gcc  
parisc                randconfig-002-20240120   gcc  
powerpc               randconfig-001-20240120   clang
powerpc               randconfig-002-20240120   clang
powerpc               randconfig-003-20240120   clang
powerpc64             randconfig-001-20240120   clang
powerpc64             randconfig-002-20240120   clang
powerpc64             randconfig-003-20240120   clang
riscv                 randconfig-001-20240120   clang
riscv                 randconfig-002-20240120   clang
s390                  randconfig-001-20240120   gcc  
s390                  randconfig-002-20240120   gcc  
sh                    randconfig-001-20240120   gcc  
sh                    randconfig-002-20240120   gcc  
sparc64               randconfig-001-20240120   gcc  
sparc64               randconfig-002-20240120   gcc  
um                    randconfig-001-20240120   clang
um                    randconfig-002-20240120   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240121   gcc  
x86_64       buildonly-randconfig-002-20240121   gcc  
x86_64       buildonly-randconfig-003-20240121   gcc  
x86_64       buildonly-randconfig-004-20240121   gcc  
x86_64       buildonly-randconfig-005-20240121   gcc  
x86_64       buildonly-randconfig-006-20240121   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240121   clang
x86_64                randconfig-002-20240121   clang
x86_64                randconfig-003-20240121   clang
x86_64                randconfig-004-20240121   clang
x86_64                randconfig-005-20240121   clang
x86_64                randconfig-006-20240121   clang
x86_64                randconfig-011-20240121   gcc  
x86_64                randconfig-012-20240121   gcc  
x86_64                randconfig-013-20240121   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240120   gcc  
xtensa                randconfig-002-20240120   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

