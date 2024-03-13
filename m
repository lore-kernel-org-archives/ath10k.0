Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DC6C54791
	for <ath10k@archiver.kernel.org>; Wed, 13 Mar 2024 04:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9yzacjCanQZl3ER8Bbj+WAa4EAPrgAceNu5vHUVvEQM=; b=n6IcjcRbFEOOtOsBisVmXuNg+j
	2yJ3g8SSzYa/tTKR+nHR0VpdOZ6d/cK9bWH1fL7uRP7HUHbm/y4/VDKu2V42F2q+8H+VrVOeMzGix
	/DbUaJJeqmitQIhW1zPRjxkYKkLNc4LEhsOWJ7lqRFdUaaXEYMjQn9QrofXc9lSeQ3lkAYCN5rNf2
	QdxwXCWCDQBfsEej+bnFLTPUqnK2T5SzkNyIxvdOYCR7gQFFSXd9qCPpm+Whz82Ml3CsU4FXXiu2K
	dUdWMpxYjl1cLhw5nbyhdimxcW8m3RV1jryfTXCF3DgVFPHwF0kwuNcB6VHuF3iT/bCzZZ0zeRlHd
	vSt/myfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkFyo-00000008l9q-1FUF;
	Wed, 13 Mar 2024 04:12:38 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkFyk-00000008l8N-23Ng
	for ath10k@lists.infradead.org;
	Wed, 13 Mar 2024 04:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710303154; x=1741839154;
  h=date:from:to:cc:subject:message-id;
  bh=6BTc2oDfx3NXYCTjXY6aZmXTETdh/NdsKOL+Xg1Hwjk=;
  b=VMhk4Wq/S0hG0n1HgRSpiNM4vkt+e89KZVWrzNWCZykXrIkZTo8g9DdB
   N5nndZlu35GYnVTg3nyXttwqPCClinDKBVyN9nsbDkZto2Cs0D3hsynB3
   pWCWbDwwsypwR/F4cWVTy+iEuErf9uQOdWnVSmsdVVpdEZJTEf5KHBTEJ
   meBgQ0oEAsTFD2PKnkq3W8n+EjU7CMQzlk/KmH4xQEK1QCB2PW5xoiC/B
   fxetvL684itpt/XxGK/KNFVEBRf8FGf4Rk2sKFlmxKY731/M2zcbhoTUf
   sS4n3wBdEECPooGbxH7pvTKWaQnCidhfHGb5qdq3Jwouu4foyDGoclgRC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="15772785"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="15772785"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 21:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16367045"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2024 21:12:33 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkFyg-000Bzh-2s;
	Wed, 13 Mar 2024 04:12:30 +0000
Date: Wed, 13 Mar 2024 12:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 9943eaada6e52dc0508aaad104c11ac6aeb26b7b
Message-ID: <202403131249.vpAlInnN-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_211234_572867_CDF0A495 
X-CRM114-Status: UNSURE (   3.95  )
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
branch HEAD: 9943eaada6e52dc0508aaad104c11ac6aeb26b7b  Merge branch 'ath-next' into ath-qca

elapsed time: 725m

configs tested: 162
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
arc                   randconfig-001-20240313   gcc  
arc                   randconfig-002-20240313   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                        clps711x_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240313   gcc  
arm                   randconfig-002-20240313   clang
arm                   randconfig-003-20240313   gcc  
arm                   randconfig-004-20240313   clang
arm                           stm32_defconfig   gcc  
arm                       versatile_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240313   clang
arm64                 randconfig-002-20240313   clang
arm64                 randconfig-003-20240313   clang
arm64                 randconfig-004-20240313   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240313   gcc  
csky                  randconfig-002-20240313   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240313   clang
hexagon               randconfig-002-20240313   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240313   gcc  
i386         buildonly-randconfig-002-20240313   gcc  
i386         buildonly-randconfig-003-20240313   clang
i386         buildonly-randconfig-004-20240313   clang
i386         buildonly-randconfig-005-20240313   clang
i386         buildonly-randconfig-006-20240313   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240313   clang
i386                  randconfig-002-20240313   clang
i386                  randconfig-003-20240313   clang
i386                  randconfig-004-20240313   gcc  
i386                  randconfig-005-20240313   gcc  
i386                  randconfig-006-20240313   clang
i386                  randconfig-011-20240313   gcc  
i386                  randconfig-012-20240313   clang
i386                  randconfig-013-20240313   gcc  
i386                  randconfig-014-20240313   gcc  
i386                  randconfig-015-20240313   clang
i386                  randconfig-016-20240313   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240313   gcc  
loongarch             randconfig-002-20240313   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
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
nios2                 randconfig-001-20240313   gcc  
nios2                 randconfig-002-20240313   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240313   gcc  
parisc                randconfig-002-20240313   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240313   gcc  
powerpc               randconfig-002-20240313   gcc  
powerpc               randconfig-003-20240313   clang
powerpc64             randconfig-001-20240313   clang
powerpc64             randconfig-002-20240313   gcc  
powerpc64             randconfig-003-20240313   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240313   clang
riscv                 randconfig-002-20240313   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240313   gcc  
s390                  randconfig-002-20240313   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240313   gcc  
sh                    randconfig-002-20240313   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240313   gcc  
sparc64               randconfig-002-20240313   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240313   gcc  
um                    randconfig-002-20240313   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240313   clang
x86_64       buildonly-randconfig-002-20240313   gcc  
x86_64       buildonly-randconfig-003-20240313   clang
x86_64       buildonly-randconfig-004-20240313   clang
x86_64       buildonly-randconfig-005-20240313   gcc  
x86_64       buildonly-randconfig-006-20240313   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240313   clang
x86_64                randconfig-002-20240313   gcc  
x86_64                randconfig-003-20240313   clang
x86_64                randconfig-004-20240313   gcc  
x86_64                randconfig-005-20240313   gcc  
x86_64                randconfig-006-20240313   clang
x86_64                randconfig-011-20240313   clang
x86_64                randconfig-012-20240313   clang
x86_64                randconfig-013-20240313   clang
x86_64                randconfig-015-20240313   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240313   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

