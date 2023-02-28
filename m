Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14249C7EE2E
	for <ath10k@archiver.kernel.org>; Tue, 28 Feb 2023 00:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uH+7Ji6qz4vfbl6uIJDw0FXgn5iD7GMSZy3ZKTiTLLI=; b=wMKYwUSqhPqVKk
	5wZAovZH1yTQG7zFnfw2nMGUlB83BqloEMrkAfg9ThGGIRqFD4tHLjl5rUIgrdTf7t7erwnxTWnK7
	6AtR4XrjgJ7nQMXhtvmMvOph7dzXkkDASqMa0lzflBV4BXAKJUReSysFUKgkfZwp8FUiFIzJty8iv
	X6m7yeu0Y3QVk26ngVaJuYn0qG0ugtaJqB0Neuqe1EqSK8zkVLh9sS6OEw1JTQX7+WaFwr9oGdRxm
	YFc19SQzs6Y6YiNnN94U82jK/gGTh1KPHKVQXBiLJPM01jHe5fjg2HV8RMXg11CAUrPxj2/TFFdik
	IQHOtIkIeKBBJKEI3agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoG3-00BgUm-98; Tue, 28 Feb 2023 00:54:19 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWoG0-00BgTv-0u
	for ath10k@lists.infradead.org; Tue, 28 Feb 2023 00:54:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677545655; x=1709081655;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0IA4sBEccMxnghaY7i4OWwRTJwbkaNlI4nNNv3iELdU=;
  b=jX2ECmi5GwVr1gdvKmGbWcFoMvvmd1eVh0QYLwZAOcFF/ulUyJUnZeFP
   PqITCuSbCq10VH9vCdogEwUbNunCtgNzquQidtNyhFULmf1VWJ3FHF7xo
   lY89e1EApO0nqPhQMO6bE2RaWK+PoN4BH4dfkdC7Dq3D5w5YAjnm2WorF
   hRw0Fbt41W680nzHD74sRTaqU5oq1wmSon4YcF/ThFC2ewdrx31p2fIZu
   y9Y36nXhkLLQM/dGYLNDCxbZrs27wDlH1NUK3seONNYbJiwkWQ9YbBPnW
   i0Xx1GW7FMaiovyQh+XONoBs08BUvnVhp3Aohx288Lefvzulh2VGV604r
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="396573908"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="396573908"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 16:54:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="762961906"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="762961906"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Feb 2023 16:54:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWoFu-0004wI-0K;
	Tue, 28 Feb 2023 00:54:10 +0000
Date: Tue, 28 Feb 2023 08:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 48186b535ce3de8ed4bd862842a06eb261f3c1b3
Message-ID: <63fd5084.Qybd7UHFA3jO2YIY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_165416_196646_4F8D1DCF 
X-CRM114-Status: UNSURE (   5.28  )
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
branch HEAD: 48186b535ce3de8ed4bd862842a06eb261f3c1b3  Add localversion-wireless-testing-ath

elapsed time: 721m

configs tested: 133
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230226   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230226   gcc  
arc                  randconfig-r011-20230226   gcc  
arc                  randconfig-r011-20230227   gcc  
arc                  randconfig-r016-20230227   gcc  
arc                  randconfig-r022-20230226   gcc  
arc                  randconfig-r033-20230226   gcc  
arc                  randconfig-r043-20230226   gcc  
arc                  randconfig-r043-20230227   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r002-20230227   clang
arm          buildonly-randconfig-r006-20230227   clang
arm                                 defconfig   gcc  
arm                  randconfig-r006-20230227   gcc  
arm                  randconfig-r033-20230227   gcc  
arm                  randconfig-r046-20230226   gcc  
arm                  randconfig-r046-20230227   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230227   clang
arm64                randconfig-r036-20230227   clang
csky                                defconfig   gcc  
csky                 randconfig-r021-20230226   gcc  
csky                 randconfig-r021-20230227   gcc  
hexagon              randconfig-r014-20230226   clang
hexagon              randconfig-r026-20230226   clang
hexagon              randconfig-r031-20230226   clang
hexagon              randconfig-r041-20230226   clang
hexagon              randconfig-r041-20230227   clang
hexagon              randconfig-r045-20230226   clang
hexagon              randconfig-r045-20230227   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230227   clang
i386                 randconfig-a002-20230227   clang
i386                 randconfig-a003-20230227   clang
i386                 randconfig-a004-20230227   clang
i386                 randconfig-a005-20230227   clang
i386                 randconfig-a006-20230227   clang
i386                 randconfig-a011-20230227   gcc  
i386                 randconfig-a012-20230227   gcc  
i386                 randconfig-a013-20230227   gcc  
i386                 randconfig-a014-20230227   gcc  
i386                 randconfig-a015-20230227   gcc  
i386                 randconfig-a016-20230227   gcc  
i386                 randconfig-r032-20230227   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230227   gcc  
ia64                 randconfig-r016-20230226   gcc  
ia64                 randconfig-r023-20230226   gcc  
ia64                 randconfig-r024-20230226   gcc  
ia64                 randconfig-r031-20230227   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230226   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230226   gcc  
m68k                 randconfig-r034-20230226   gcc  
microblaze           randconfig-r003-20230226   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r034-20230227   gcc  
mips                 randconfig-r035-20230226   clang
nios2        buildonly-randconfig-r003-20230227   gcc  
nios2        buildonly-randconfig-r004-20230226   gcc  
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r001-20230227   gcc  
openrisc             randconfig-r036-20230226   gcc  
parisc       buildonly-randconfig-r006-20230226   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230226   gcc  
parisc               randconfig-r032-20230226   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230226   clang
powerpc              randconfig-r025-20230227   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230226   clang
riscv                randconfig-r042-20230227   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230226   clang
s390                 randconfig-r012-20230227   gcc  
s390                 randconfig-r044-20230226   clang
s390                 randconfig-r044-20230227   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230226   gcc  
sh                   randconfig-r025-20230226   gcc  
sh                   randconfig-r026-20230227   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230227   gcc  
sparc                randconfig-r022-20230227   gcc  
sparc                randconfig-r024-20230227   gcc  
sparc64              randconfig-r001-20230227   gcc  
sparc64              randconfig-r013-20230227   gcc  
sparc64              randconfig-r015-20230226   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r004-20230227   clang
x86_64       buildonly-randconfig-r005-20230227   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230227   clang
x86_64               randconfig-a002-20230227   clang
x86_64               randconfig-a003-20230227   clang
x86_64               randconfig-a004-20230227   clang
x86_64               randconfig-a005-20230227   clang
x86_64               randconfig-a006-20230227   clang
x86_64               randconfig-a011-20230227   gcc  
x86_64               randconfig-a012-20230227   gcc  
x86_64               randconfig-a013-20230227   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64               randconfig-a015-20230227   gcc  
x86_64               randconfig-a016-20230227   gcc  
x86_64               randconfig-r023-20230227   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r014-20230227   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
