Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633FFC48260
	for <ath10k@archiver.kernel.org>; Thu, 25 Jan 2024 14:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qIk7O4ODVEpKcoKWJrHfmdGgjRMluMiu+rjbeD5InHE=; b=HW2J2r/RdNpS2eM/xwdACL+fjL
	wjTgxEYc4eqECqzSvYonL7VJWXTaLo+5dK39Fre1pnzVk2ufVj5fOxsruQzpKlyfAeAHnQ3RqGWU9
	BQc0FH9NXcjmK2k3I5slmgL+Y4LubxE2dKkCwUPeHQwKDxDTHQMV6Cw1sbEgs091v8tdpBS8AIgl1
	UHThqoykak64ZG3OU5EGmcF2NF8VhEBY81YnN4SKXhaNvN33GQtKEGnorl8VxE2VZQm9VgU2sK+1+
	6uUqbPLmap/Jj6zgRRyMy7lAM9jG7/wk43AqHEz+lyPrpsFyWKt5j8ZCnM65v3smdXBwGXCCs9ovH
	8opvOuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0YG-00000000KFg-1yM1;
	Thu, 25 Jan 2024 14:17:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0YF-00000000KFF-1ym0
	for ath10k@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=qIk7O4ODVEpKcoKWJrHfmdGgjRMluMiu+rjbeD5InHE=; b=aIKB4G1jOit9hMEQTuXKBrY3u0
	51GE1peXe65pUboM+1/uGdOTRvIihdOSS/4VHTI7kn8gBHIvCTmCpCs8GOv2Y4kZTqjKSJ+sXQcOS
	j4WMrBPvHTSUNl6WOrRA18IYQkGhvIIAnAfrh8AFtNICuo99QOXOawCweWcHtHgCLHQNR/JeyCfC3
	GgPH8oBxO5Yc05oNoNxj8BgLcgJfhpJxSTYVmDEEIgBUPaBbv56g8vs4u86CTXERojniIj3xRUtVu
	HTWIU1EKU8uZabhjTQJMbbSm+3IQ83zB42+ChnqMDd1ElLLb9b6DM6siLLveTp6F5hux5pl+NXUXg
	ICCmQomw==;
Received: from mgamail.intel.com ([192.198.163.10])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSxml-00000005B4I-26JU
	for ath10k@lists.infradead.org;
	Thu, 25 Jan 2024 11:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706181643; x=1737717643;
  h=date:from:to:cc:subject:message-id;
  bh=YT5UU/QasWa2YmWuQYw1XqF0TaxCNhgcHEkSnhXvDa8=;
  b=f6IQDCYI+pJvNdeQ78cdIYuGcIlr8EDeZ4xIH4KMEmSXjlrE0xtSvr4s
   5zcVcjW6tktYIHWviSpFjlV/fHbkeUycM8EYi3jNXSodSFJAbPm+HaOl4
   bC0EXM2A1ekrq5YE/HmXJrIDO0vJRJlunFIevqfyrplWV6EUBdWWtGXLN
   Ohm1wv5R/CJtopiPqiGhFArXHqKkuG5adNT735FBtzXPHm0wg5ts/JCV4
   zR+Xey21+gSV1KTO2O1n1f3YQy/d/aSyYbMIU15ji+cGeK7ybEsFU5bsY
   nirqGukHnOBwQFQtMeYn8VArDMfLOCRxySswJbQXr5rEazEGNPYI939gg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9514682"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9514682"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 03:19:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2332898"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jan 2024 03:19:33 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSxlb-0008vx-0Y;
	Thu, 25 Jan 2024 11:19:31 +0000
Date: Thu, 25 Jan 2024 19:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 41af05916f35370da687daafdb2946e9718ff8e0
Message-ID: <202401251916.nO0K8QUc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_112044_445871_3782CAE7 
X-CRM114-Status: UNSURE (   4.63  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 41af05916f35370da687daafdb2946e9718ff8e0  Merge branch 'ath-next' into ath-qca

elapsed time: 1494m

configs tested: 144
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240125   gcc  
arc                   randconfig-002-20240125   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      jornada720_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240125   gcc  
arm                   randconfig-002-20240125   gcc  
arm                   randconfig-003-20240125   gcc  
arm                   randconfig-004-20240125   gcc  
arm                         s5pv210_defconfig   clang
arm                           sama7_defconfig   clang
arm                           tegra_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240125   gcc  
arm64                 randconfig-002-20240125   gcc  
arm64                 randconfig-003-20240125   gcc  
arm64                 randconfig-004-20240125   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240125   gcc  
csky                  randconfig-002-20240125   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240125   clang
hexagon               randconfig-002-20240125   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240124   clang
i386         buildonly-randconfig-002-20240124   clang
i386         buildonly-randconfig-003-20240124   clang
i386         buildonly-randconfig-004-20240124   clang
i386         buildonly-randconfig-005-20240124   clang
i386         buildonly-randconfig-006-20240124   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240124   clang
i386                  randconfig-002-20240124   clang
i386                  randconfig-003-20240124   clang
i386                  randconfig-004-20240124   clang
i386                  randconfig-005-20240124   clang
i386                  randconfig-006-20240124   clang
i386                  randconfig-011-20240124   gcc  
i386                  randconfig-012-20240124   gcc  
i386                  randconfig-013-20240124   gcc  
i386                  randconfig-014-20240124   gcc  
i386                  randconfig-015-20240124   gcc  
i386                  randconfig-016-20240124   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240125   gcc  
loongarch             randconfig-002-20240125   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                     cu1000-neo_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240125   gcc  
nios2                 randconfig-002-20240125   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240125   gcc  
parisc                randconfig-002-20240125   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240125   gcc  
powerpc               randconfig-002-20240125   gcc  
powerpc               randconfig-003-20240125   gcc  
powerpc64             randconfig-001-20240125   gcc  
powerpc64             randconfig-002-20240125   gcc  
powerpc64             randconfig-003-20240125   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20240125   gcc  
riscv                 randconfig-002-20240125   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240125   clang
s390                  randconfig-002-20240125   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240125   gcc  
sh                    randconfig-002-20240125   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240125   gcc  
sparc64               randconfig-002-20240125   gcc  
um                    randconfig-001-20240125   gcc  
um                    randconfig-002-20240125   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240125   gcc  
x86_64       buildonly-randconfig-002-20240125   gcc  
x86_64       buildonly-randconfig-003-20240125   gcc  
x86_64       buildonly-randconfig-004-20240125   gcc  
x86_64       buildonly-randconfig-005-20240125   gcc  
x86_64       buildonly-randconfig-006-20240125   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240125   clang
x86_64                randconfig-002-20240125   clang
x86_64                randconfig-003-20240125   clang
x86_64                randconfig-004-20240125   clang
x86_64                randconfig-005-20240125   clang
x86_64                randconfig-006-20240125   clang
x86_64                randconfig-011-20240125   gcc  
x86_64                randconfig-012-20240125   gcc  
x86_64                randconfig-013-20240125   gcc  
x86_64                randconfig-014-20240125   gcc  
x86_64                randconfig-015-20240125   gcc  
x86_64                randconfig-016-20240125   gcc  
x86_64                randconfig-071-20240125   gcc  
x86_64                randconfig-072-20240125   gcc  
x86_64                randconfig-073-20240125   gcc  
x86_64                randconfig-074-20240125   gcc  
x86_64                randconfig-075-20240125   gcc  
x86_64                randconfig-076-20240125   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240125   gcc  
xtensa                randconfig-002-20240125   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

