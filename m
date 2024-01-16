Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DEEC4706C
	for <ath10k@archiver.kernel.org>; Tue, 16 Jan 2024 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pjqa9dzabtvpMJsvyrlsQ0Mr1y1Y6ulo2yq3zEdeDBA=; b=QYbUFS0A18YlqxNtO0bnBX5h6Q
	F9/gwXDLl4UHGzoR00eNUsrxiopBgKO2CCLgEReNXY1NI9CkGJBnUFsMdcrpZb8FT+GuVfBue0M3R
	PCgo+jAhxjzCgCPkflF+adzmrgN7YLZoVk04+TI6MCbKhsTFJTUOm++5aAPLT6nKYUg0pjTDMxgQM
	lnTJfZ7bD/EJB8vMMKChbjTK1gujVK36j/V2L2fMV88UbtwaZtqjoVpDFFiY43gTKWfXCvbUBxUFm
	XpSVoOmOGqmkw9R28ZOEhmxD3f+SLg/LQdXBh1PVCx/p42uQESEYUew3NKsVUQCq6pa2Y2n39aiO6
	G6ylN0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPj1F-00C7An-0T;
	Tue, 16 Jan 2024 12:58:17 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPj1B-00C79j-2g
	for ath10k@lists.infradead.org;
	Tue, 16 Jan 2024 12:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705409893; x=1736945893;
  h=date:from:to:cc:subject:message-id;
  bh=Mvfm/mULE4jWLI58q3YUQxvQURvojXjplEbF32pHemg=;
  b=mJ8K4VbTdODC2sNwcQuF62MbQwt2ISAJtmjRpAYc6yFVPRwfrxIEixfw
   xMd4OZS6yAmUUW3KnFFaBWyuE/m/dwRjuagu6/GdvkJ1/dGBEPdjJXOgg
   3Ji3nxyFszA9S+0Wj4H+iwDAf+l6enXwcSgaPAF3BJpnc//JW+FIVN+bY
   sJNXJYSQZ/cNAIyLX8W0/ScxnFNu9EsFjhAgQ12zDo1epI7AiiTJrfqn4
   gX9sUfbpDX0FUGC1SwzmPAdUm64tlmAfZr9ibm0vy/kCE4y5ZgV1TE/rU
   ta45Rg2pi2PYQeyZRNshsIVjq945A0mCZ59EkUG080UzddGbDYinOLBwz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="486009091"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="486009091"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 04:58:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="818170648"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="818170648"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Jan 2024 04:58:07 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPj13-0000i0-16;
	Tue, 16 Jan 2024 12:58:05 +0000
Date: Tue, 16 Jan 2024 20:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 b7e181d8d8483ade26ce3b15b957ca5bf9653b72
Message-ID: <202401162035.fdhDiQ7j-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_045813_875273_854AA65F 
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: b7e181d8d8483ade26ce3b15b957ca5bf9653b72  Add localversion-wireless-testing-ath

elapsed time: 2732m

configs tested: 80
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240116   gcc  
arc                   randconfig-002-20240116   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240116   clang
arm                   randconfig-002-20240116   clang
arm                   randconfig-003-20240116   clang
arm                   randconfig-004-20240116   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240116   clang
arm64                 randconfig-002-20240116   clang
arm64                 randconfig-003-20240116   clang
arm64                 randconfig-004-20240116   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240116   gcc  
csky                  randconfig-002-20240116   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240116   clang
hexagon               randconfig-002-20240116   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240115   gcc  
i386         buildonly-randconfig-002-20240115   gcc  
i386         buildonly-randconfig-003-20240115   gcc  
i386         buildonly-randconfig-004-20240115   gcc  
i386         buildonly-randconfig-005-20240115   gcc  
i386         buildonly-randconfig-006-20240115   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240115   gcc  
i386                  randconfig-002-20240115   gcc  
i386                  randconfig-003-20240115   gcc  
i386                  randconfig-004-20240115   gcc  
i386                  randconfig-005-20240115   gcc  
i386                  randconfig-006-20240115   gcc  
i386                  randconfig-011-20240115   clang
i386                  randconfig-012-20240115   clang
i386                  randconfig-013-20240115   clang
i386                  randconfig-014-20240115   clang
i386                  randconfig-015-20240115   clang
i386                  randconfig-016-20240115   clang
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240116   gcc  
loongarch             randconfig-002-20240116   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
nios2                             allnoconfig   gcc  
nios2                 randconfig-001-20240116   gcc  
nios2                 randconfig-002-20240116   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240116   gcc  
parisc                randconfig-002-20240116   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
riscv                            allmodconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

