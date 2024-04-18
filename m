Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE7BC4345F
	for <ath10k@archiver.kernel.org>; Thu, 18 Apr 2024 02:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XERbiiW/k6hnTBaJEFnKRKNeL8L+g1TJYsJaf9mz44g=; b=E7coLoGS239Rpj5vf/0IhGYt33
	6XJ3vjTgKLYL//LFoFJgp+kENMDJcHmjo2fbh4yVsvOkS/LAcWR2UuHXTM8lo/y+DWz+D/jkDJv5w
	/F1L0ZOCcxqUg3f7RUffPYgU4XkOSxJraOK8lhdr6NJN8Z5aA4YT0hBg/btATgkofp3oBqfUZ/cIX
	dFdqEZ5d4faYEMVMTAGRiiSDCdsjriMvJbHjpyyYci97K67dImVHk5/byp6rRK8AU8kc/8ci0WaXi
	bpE/oys0LugcSi9jsp3FRYEtue6zVXp7HFfgq9RTQWTrSgCwtjuYcsaqwcgBqJndmDsQOGfXr49tD
	kSdsprDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxHnQ-00000000jFV-0Nah;
	Thu, 18 Apr 2024 02:46:44 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxHnN-00000000jEj-1iUN
	for ath10k@lists.infradead.org;
	Thu, 18 Apr 2024 02:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713408402; x=1744944402;
  h=date:from:to:cc:subject:message-id;
  bh=+QE2x2Udlw8pRrYr6/14IlEmJfuENZ4F88iwbg2lbdU=;
  b=HTN+kWC6XyW6Nqvfdm4gc1d5xxGhehq3RzySJO85i1a7UIKOX1AsIr7i
   arQhbw9hZ9hPGk6360mW+gXNaqOa0qcyjrtDhC1kZEUznfQ5dktNCf7Bt
   V3RHCplEQ3s+Mpt6vHzdTc99vAFaLDnxtJoByZ57lMEE22NpA9eFqGVXf
   hxL2KhrhEYg6Tw0AQqI0ekWeoIWjDp868CH/IWfUMGD7ehMxexMVdvtTE
   yNGXTN2MpI5mErr2QE+eOSQJuLReQhAGI3EBghJXcw/S/dBXx29f01Y0p
   HCHB642dNJhFKM/Fr62r6G3nPdn4Q/EZU1wsV3my4DrAf4XALDWjNmEYZ
   g==;
X-CSE-ConnectionGUID: B3u2+OD2QNuD2vygQKKRiA==
X-CSE-MsgGUID: nKJ52GB7RMWARJ2sqdxLUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12713830"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="12713830"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 19:46:38 -0700
X-CSE-ConnectionGUID: 03/ISL7+TNC/NQSWLLPmbw==
X-CSE-MsgGUID: 55QeBBqxTLWvn7QmakFn5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="22909930"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Apr 2024 19:46:37 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxHnG-0007EL-1a;
	Thu, 18 Apr 2024 02:46:34 +0000
Date: Thu, 18 Apr 2024 10:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 2996ced9d610c3ed3a87b16b99242852dbc84f75
Message-ID: <202404181024.wZBUONkI-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_194641_564109_E7633F1E 
X-CRM114-Status: UNSURE (   3.61  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 2996ced9d610c3ed3a87b16b99242852dbc84f75  wifi: ath12k: fix out-of-bound access of qmi_invoke_handler()

elapsed time: 724m

configs tested: 104
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
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240418   gcc  
i386         buildonly-randconfig-002-20240418   gcc  
i386         buildonly-randconfig-003-20240418   clang
i386         buildonly-randconfig-004-20240418   gcc  
i386         buildonly-randconfig-005-20240418   clang
i386         buildonly-randconfig-006-20240418   clang
i386                                defconfig   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
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
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240418   clang
x86_64       buildonly-randconfig-002-20240418   clang
x86_64       buildonly-randconfig-003-20240418   clang
x86_64       buildonly-randconfig-004-20240418   clang
x86_64       buildonly-randconfig-005-20240418   gcc  
x86_64       buildonly-randconfig-006-20240418   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240418   gcc  
x86_64                randconfig-002-20240418   clang
x86_64                randconfig-003-20240418   gcc  
x86_64                randconfig-004-20240418   clang
x86_64                randconfig-005-20240418   gcc  
x86_64                randconfig-006-20240418   gcc  
x86_64                randconfig-011-20240418   clang
x86_64                randconfig-012-20240418   gcc  
x86_64                randconfig-013-20240418   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

