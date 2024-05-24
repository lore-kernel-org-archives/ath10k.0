Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F07CC25B74
	for <ath10k@archiver.kernel.org>; Fri, 24 May 2024 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7mHSzvodv7tpZ7OCinVXsc8R+1naAtzrqm9d1jJI32Q=; b=ykG1R/zKewETQFRgkVCIo1+3Wc
	uSVjVZHTfRT7Ixx20FLk/dstvj1wYwMzGr5OZB6rEWBhXzMeFx4fuRU89qmAE6gVAVJ3QrU71ekK7
	oaow+OoqUEixW2TZ0sTc+6lPqmwykssHhsKpxQyFmwIXBVV9elG6I1hkyVrrHs9v3tSm/bvh1zGum
	TXrC7415mWh+rX7jpBhqSMp/YJ9YJLZPeWfb4/GsugcKOCGEKTj1v9K9jSgurlD6dwlCs8sCOyvCt
	iFLP6hJcI3TUqWIpMF5XlEFO+4aq2uMII6vODQb7PO2BwgSpxuxmDxxOD77zVpIHDjdUWExz1xINf
	4/7/dKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAVUC-000000093dZ-0t0w;
	Fri, 24 May 2024 14:01:32 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAVU7-000000093cu-2E8q
	for ath10k@lists.infradead.org;
	Fri, 24 May 2024 14:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716559287; x=1748095287;
  h=date:from:to:cc:subject:message-id;
  bh=d8dlxRGhMibWAEHJMUjt86XhzFGfLt3ljeBe/qwibMY=;
  b=grTa0Xtk6jT+BwcsH9TLyfowdCmF4UAY8M6Pix68jdeYBAc1LuvrSmcE
   ZJz9meAQateXytdKrmTHu+2D6hWCGfdhNY+6SuOQhVGEf2HbRF3V8mvTi
   pSIei+BlzOSBsVEhhcIAxgy/H0geCbkmofSe16xRQS5gSmV1938bclGcA
   7XKOnva4VmyhgwsHQ41xQNYAv+vYZZFuRCe3eHX1UcQD+Z6P8WH1zUXA0
   zGwVrU/ZK9GcqdgrUxDlIUsr26Z3Ay+Qtm7X1fHhCkrBmqYEU9DToD8V4
   MEKsvsQehsm+ytnOvlCvekV7RTZZXuQJHnNmHclzFQRIH3EtX5lPWvWOD
   g==;
X-CSE-ConnectionGUID: cxfforIDRQGoLIW4Mr7dsg==
X-CSE-MsgGUID: KNf4kVWlRu+IBPqBOqyltQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13121870"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="13121870"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 07:01:20 -0700
X-CSE-ConnectionGUID: /HMXYA6GSvy6mxYRx+CgPA==
X-CSE-MsgGUID: aavRuco7RYi559/61eNNig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="34142539"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 May 2024 07:01:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAVTx-0005T3-2R;
	Fri, 24 May 2024 14:01:17 +0000
Date: Fri, 24 May 2024 22:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 7c44ae3e65e59f6003454d942642328ea10919a5
Message-ID: <202405242253.lgg5aKOO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_070127_720366_E259892A 
X-CRM114-Status: UNSURE (   3.63  )
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
branch HEAD: 7c44ae3e65e59f6003454d942642328ea10919a5  Merge branch 'ath-current' into ath-qca

elapsed time: 1467m

configs tested: 161
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
arc                   randconfig-001-20240524   gcc  
arc                   randconfig-002-20240524   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240524   clang
arm                   randconfig-002-20240524   gcc  
arm                   randconfig-003-20240524   gcc  
arm                   randconfig-004-20240524   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240524   clang
arm64                 randconfig-002-20240524   clang
arm64                 randconfig-003-20240524   gcc  
arm64                 randconfig-004-20240524   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240524   gcc  
csky                  randconfig-002-20240524   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240524   clang
hexagon               randconfig-002-20240524   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240524   clang
i386         buildonly-randconfig-002-20240524   clang
i386         buildonly-randconfig-003-20240524   gcc  
i386         buildonly-randconfig-004-20240524   clang
i386         buildonly-randconfig-005-20240524   clang
i386         buildonly-randconfig-006-20240524   clang
i386                                defconfig   clang
i386                  randconfig-001-20240524   clang
i386                  randconfig-002-20240524   clang
i386                  randconfig-003-20240524   clang
i386                  randconfig-004-20240524   clang
i386                  randconfig-005-20240524   gcc  
i386                  randconfig-006-20240524   clang
i386                  randconfig-011-20240524   clang
i386                  randconfig-012-20240524   gcc  
i386                  randconfig-013-20240524   gcc  
i386                  randconfig-014-20240524   clang
i386                  randconfig-015-20240524   clang
i386                  randconfig-016-20240524   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240524   gcc  
loongarch             randconfig-002-20240524   gcc  
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
nios2                 randconfig-001-20240524   gcc  
nios2                 randconfig-002-20240524   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240524   gcc  
parisc                randconfig-002-20240524   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240524   gcc  
powerpc               randconfig-002-20240524   gcc  
powerpc               randconfig-003-20240524   clang
powerpc64             randconfig-001-20240524   gcc  
powerpc64             randconfig-002-20240524   gcc  
powerpc64             randconfig-003-20240524   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240524   gcc  
riscv                 randconfig-002-20240524   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240524   gcc  
s390                  randconfig-002-20240524   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240524   gcc  
sh                    randconfig-002-20240524   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240524   gcc  
sparc64               randconfig-002-20240524   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240524   gcc  
um                    randconfig-002-20240524   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240524   gcc  
x86_64       buildonly-randconfig-002-20240524   gcc  
x86_64       buildonly-randconfig-003-20240524   clang
x86_64       buildonly-randconfig-004-20240524   gcc  
x86_64       buildonly-randconfig-005-20240524   gcc  
x86_64       buildonly-randconfig-006-20240524   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240524   gcc  
x86_64                randconfig-002-20240524   clang
x86_64                randconfig-003-20240524   clang
x86_64                randconfig-004-20240524   clang
x86_64                randconfig-005-20240524   clang
x86_64                randconfig-006-20240524   gcc  
x86_64                randconfig-011-20240524   gcc  
x86_64                randconfig-012-20240524   clang
x86_64                randconfig-013-20240524   clang
x86_64                randconfig-014-20240524   gcc  
x86_64                randconfig-015-20240524   gcc  
x86_64                randconfig-016-20240524   clang
x86_64                randconfig-071-20240524   gcc  
x86_64                randconfig-072-20240524   clang
x86_64                randconfig-073-20240524   gcc  
x86_64                randconfig-074-20240524   gcc  
x86_64                randconfig-075-20240524   clang
x86_64                randconfig-076-20240524   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240524   gcc  
xtensa                randconfig-002-20240524   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

