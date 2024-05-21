Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC0FC25B79
	for <ath10k@archiver.kernel.org>; Tue, 21 May 2024 01:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E7LJ1LllZARj/93l9AnARdipyp5M8bSzWYEaOEG+UK0=; b=FBoZuF2f7a/4gZnp0bH1601li/
	drBSdivm3JcxoS742UBSx730kJR2M/Z72EFT915W3mdZP5Iokwksm8y6i64nc1VtB/fkqZffx5W9z
	E/IM0aR9IsnAMIC4ILS5xkxKArM2AbnuekStnrmzRlLZj5OVhM7qQJtulO3KV0YHiLWKzThvOeKTJ
	mw+Ln4pPeHQlJmV8lueVm8D/sPvP+zzWHbanb8CBIscTY7z2XtzU5EYFoxl5jG6LAMI4PuBrMTHYm
	JuHXlsdRPwePL3CQT7j/h0jkB56W5gCTgO7k4HJ/iddpKeQPg3JktL3oDg/4IQygJwusasFad7SNw
	va1JsVMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9EG8-0000000Fz9Q-0MHK;
	Tue, 21 May 2024 01:25:44 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9EG4-0000000Fz7i-2wvN
	for ath10k@lists.infradead.org;
	Tue, 21 May 2024 01:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716254740; x=1747790740;
  h=date:from:to:cc:subject:message-id;
  bh=4C1zvvUwSRc0zdRHlr24RC8UnGEMEK3byzL2Od4xDKw=;
  b=UcHXGbCKWeiVcM85zId6hzowzDvsb829E/gFamS6rKOBiD6GTQZomnAc
   WdfDDKTKgsF2V8v0s4EaDyrIqplQIri98l2vMeV891AV6fpGydmorYhya
   bMG+Q7Mx8iDDG2z+ggaSWasuqzrqtjtjHSvXl/yg9f+3+zLWAwHqFrDy0
   hy0CRkHbZQf0BdsbqzwsR8FeKIg4vTzxibZdG1aspth8gdap3A2X0lYR0
   QNratiNg1mIyQDYtkrmFqMo/4mkTv5Kl+ZRg+9JCR0be5qrH6MG8mEBhr
   fbsPedbi4J8RkTqpIr3j2L7euk94r+zIIM0QImRaAYYcOuzskU3iDXHJz
   w==;
X-CSE-ConnectionGUID: dQmot4mnRa+hPW+1LnCUUw==
X-CSE-MsgGUID: 7o71BXH0ST+Gmhzcwqffng==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12261379"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="12261379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 18:25:39 -0700
X-CSE-ConnectionGUID: 4HNA0jvsTJSZDjli8VHlqw==
X-CSE-MsgGUID: UATSDPoBSn+yiN8Wfqm/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000"; 
   d="scan'208";a="37114088"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2024 18:25:38 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9EG0-0005MP-01;
	Tue, 21 May 2024 01:25:36 +0000
Date: Tue, 21 May 2024 09:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 26dd8ccdba4d492d00e35c410bc4314e043bdf73
Message-ID: <202405210906.Mmo04c67-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_182540_868789_754736A9 
X-CRM114-Status: UNSURE (   3.79  )
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
branch HEAD: 26dd8ccdba4d492d00e35c410bc4314e043bdf73  wifi: ath12k: dynamic VLAN support

elapsed time: 778m

configs tested: 139
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240520   gcc  
arc                   randconfig-002-20240520   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240520   clang
arm                   randconfig-002-20240520   clang
arm                   randconfig-003-20240520   gcc  
arm                   randconfig-004-20240520   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240520   clang
arm64                 randconfig-002-20240520   clang
arm64                 randconfig-003-20240520   clang
arm64                 randconfig-004-20240520   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240520   gcc  
csky                  randconfig-002-20240520   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240520   clang
hexagon               randconfig-002-20240520   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240520   clang
i386         buildonly-randconfig-002-20240520   clang
i386         buildonly-randconfig-003-20240520   clang
i386         buildonly-randconfig-004-20240520   clang
i386         buildonly-randconfig-005-20240520   clang
i386         buildonly-randconfig-006-20240520   clang
i386                                defconfig   clang
i386                  randconfig-001-20240520   clang
i386                  randconfig-002-20240520   clang
i386                  randconfig-003-20240520   gcc  
i386                  randconfig-004-20240520   gcc  
i386                  randconfig-005-20240520   clang
i386                  randconfig-006-20240520   gcc  
i386                  randconfig-011-20240520   gcc  
i386                  randconfig-012-20240520   gcc  
i386                  randconfig-013-20240520   clang
i386                  randconfig-014-20240520   gcc  
i386                  randconfig-015-20240520   clang
i386                  randconfig-016-20240520   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240520   gcc  
loongarch             randconfig-002-20240520   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240520   gcc  
nios2                 randconfig-002-20240520   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240520   gcc  
parisc                randconfig-002-20240520   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240520   gcc  
powerpc               randconfig-002-20240520   clang
powerpc               randconfig-003-20240520   clang
powerpc64             randconfig-001-20240520   clang
powerpc64             randconfig-002-20240520   gcc  
powerpc64             randconfig-003-20240520   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240520   gcc  
riscv                 randconfig-002-20240520   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240520   gcc  
s390                  randconfig-002-20240520   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240520   gcc  
sh                    randconfig-002-20240520   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240520   gcc  
sparc64               randconfig-002-20240520   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240520   clang
um                    randconfig-002-20240520   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240520   gcc  
xtensa                randconfig-002-20240520   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

