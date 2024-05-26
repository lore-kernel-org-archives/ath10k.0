Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445D3C25B78
	for <ath10k@archiver.kernel.org>; Sun, 26 May 2024 01:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rmhfMw+1kN20Tso8JgSAqyROTaDtHMj2S/OVrvQ5UfM=; b=moQjvVKI7rKGWYz2MJjNCyk7kN
	01JyqizzXl4u6D9/2B+Wn6zhvr9t8o3g6EudDsskE/5sLwcfF31HEc4XLZqgYYtexQVzjVAqv7X9Z
	8NuaXGOb28ujtiu0bZ8KpJaU0JJo3kKGGLA69yvBi9Flo7zFHeMWxIJCQTrLhYgaUnD6WH/4wYqCm
	ZdMT1FyMokBJI4m6moILonpjZ3i++86GMa0A1D7SeqvpPpvLaJPgGBNzJYuUVrHAHluD7zYwsw9nL
	A7sQLPdV4KEcwWGtwTU28YJTW8M0WLj3tPSRkurELaue6LH9Pc+Emxcxf+PwF9lkZ7V1pBuW6AZ7v
	TOoX3Wag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB2qT-0000000C0Yk-0X4g;
	Sun, 26 May 2024 01:38:45 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB2qP-0000000C0Xy-3fT0
	for ath10k@lists.infradead.org;
	Sun, 26 May 2024 01:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716687522; x=1748223522;
  h=date:from:to:cc:subject:message-id;
  bh=VIUFwq9WOpaN1v2a2NqXm5Uvl88jufRozlegoaB4AXI=;
  b=QGpolp8UIzLPZWa5j4Hj+Ri1k7rLql8dFOdx0eRBrVEVs+1IT/sTlRCB
   PtwaVFx8HHphxFsb4QdKBkBXPupTWwFXqYyM48stwxMsVa3WgIMzaAVDL
   gLqBGDY7IlYszjE9O3HVIp3iOoqg50kScUJlK+35pXNPpFTFhZXlQlb13
   GkfFDYjsTGSvf2QO4SHB0u5H1ADN7lmrIkM5pY1fOzOvRaUBY9LDWXw2X
   eyH7XIlQOok6w4fy92gbVB6vqz4fLiRJ5fafc5QH+VC0+Sdeluv1XvAm9
   ZTY656jsbXll0oxTcSNCL8Td0Z21b/iTZBG1DFygLU1PL3kxleHgM4s8w
   g==;
X-CSE-ConnectionGUID: hG7786vOSxadxrZ1QBonVg==
X-CSE-MsgGUID: uMf+uZ8JQPGppNP+VJ/OuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="12900311"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="12900311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 18:38:33 -0700
X-CSE-ConnectionGUID: cRT+FnGRTzanOJIZhx31Dw==
X-CSE-MsgGUID: v5be+sIQT9m+52xvdkn85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34483765"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 May 2024 18:38:31 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB2qD-0007c7-0I;
	Sun, 26 May 2024 01:38:29 +0000
Date: Sun, 26 May 2024 09:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 a5ddfd4dbbdde69dc77f01d3dbde1253265d55c7
Message-ID: <202405260925.WfS5t1nO-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_183842_064533_FCF6F6FD 
X-CRM114-Status: UNSURE (   3.96  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: a5ddfd4dbbdde69dc77f01d3dbde1253265d55c7  Merge branch 'pending' into master-pending

elapsed time: 955m

configs tested: 180
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240526   gcc  
arc                   randconfig-002-20240526   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-002-20240526   gcc  
arm                   randconfig-004-20240526   gcc  
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240526   gcc  
arm64                 randconfig-003-20240526   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240526   gcc  
csky                  randconfig-002-20240526   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240525   gcc  
i386         buildonly-randconfig-002-20240525   gcc  
i386         buildonly-randconfig-002-20240526   gcc  
i386         buildonly-randconfig-003-20240525   gcc  
i386         buildonly-randconfig-003-20240526   gcc  
i386         buildonly-randconfig-004-20240525   clang
i386         buildonly-randconfig-005-20240525   gcc  
i386         buildonly-randconfig-006-20240525   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240525   clang
i386                  randconfig-002-20240525   gcc  
i386                  randconfig-003-20240525   clang
i386                  randconfig-004-20240525   clang
i386                  randconfig-005-20240525   gcc  
i386                  randconfig-005-20240526   gcc  
i386                  randconfig-006-20240525   gcc  
i386                  randconfig-011-20240525   clang
i386                  randconfig-012-20240525   clang
i386                  randconfig-012-20240526   gcc  
i386                  randconfig-013-20240525   clang
i386                  randconfig-013-20240526   gcc  
i386                  randconfig-014-20240525   gcc  
i386                  randconfig-014-20240526   gcc  
i386                  randconfig-015-20240525   clang
i386                  randconfig-015-20240526   gcc  
i386                  randconfig-016-20240525   gcc  
i386                  randconfig-016-20240526   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240526   gcc  
loongarch             randconfig-002-20240526   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240526   gcc  
nios2                 randconfig-002-20240526   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240526   gcc  
parisc                randconfig-002-20240526   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-003-20240526   gcc  
powerpc64             randconfig-002-20240526   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240526   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240526   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240526   gcc  
sh                    randconfig-002-20240526   gcc  
sh                           se7722_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240526   gcc  
sparc64               randconfig-002-20240526   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240525   clang
x86_64       buildonly-randconfig-002-20240525   gcc  
x86_64       buildonly-randconfig-003-20240525   gcc  
x86_64       buildonly-randconfig-003-20240526   gcc  
x86_64       buildonly-randconfig-004-20240525   gcc  
x86_64       buildonly-randconfig-005-20240525   gcc  
x86_64       buildonly-randconfig-006-20240525   gcc  
x86_64       buildonly-randconfig-006-20240526   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240525   clang
x86_64                randconfig-002-20240525   clang
x86_64                randconfig-003-20240525   clang
x86_64                randconfig-004-20240525   clang
x86_64                randconfig-004-20240526   gcc  
x86_64                randconfig-005-20240525   clang
x86_64                randconfig-005-20240526   gcc  
x86_64                randconfig-006-20240525   clang
x86_64                randconfig-011-20240525   clang
x86_64                randconfig-011-20240526   gcc  
x86_64                randconfig-012-20240525   clang
x86_64                randconfig-012-20240526   gcc  
x86_64                randconfig-013-20240525   gcc  
x86_64                randconfig-013-20240526   gcc  
x86_64                randconfig-014-20240525   clang
x86_64                randconfig-014-20240526   gcc  
x86_64                randconfig-015-20240525   gcc  
x86_64                randconfig-015-20240526   gcc  
x86_64                randconfig-016-20240525   clang
x86_64                randconfig-071-20240525   gcc  
x86_64                randconfig-071-20240526   gcc  
x86_64                randconfig-072-20240525   clang
x86_64                randconfig-073-20240525   clang
x86_64                randconfig-074-20240525   gcc  
x86_64                randconfig-075-20240525   gcc  
x86_64                randconfig-076-20240525   clang
x86_64                randconfig-076-20240526   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240526   gcc  
xtensa                randconfig-002-20240526   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

