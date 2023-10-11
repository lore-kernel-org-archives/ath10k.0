Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AB0CD98FC
	for <ath10k@archiver.kernel.org>; Wed, 11 Oct 2023 08:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BbTlBlaGAfLJK0ypN1NpuMy94XbRcwsNxNrDTgm+eoQ=; b=EYiGp8eAuyxsbK
	6Q04nFdE1PtpKZqNBgIvuYKhr1LfaMmDdREYxFK/3AN7iuBdUyURZQGTsfvs3UnYeN6PwXI9Uo/+2
	4TAPBTIi0QfmU59CcXphbbZ3r0f1D6Pcnuh+83wvLCxsuXc0W0ryE6IQsyTcHIudImJEC0SqeGbY4
	LlrDw2t29n7EbWDkrVT0zHbiaB8LIerBXV3F1x6ePSP8Jby9OnF8DydloQ49dOmleArmcj/iyL12Z
	TrsOKZ7Pn8m5JJaDZaw3JXVUNQeRlPzBLzVYk1TqyFCGScDCiN8cepx+AqZiwZPw0V7oSi3D2Uki0
	P2LQQjFgfNn8rSQw3Vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqUHZ-00FCDp-0Y;
	Wed, 11 Oct 2023 08:09:29 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqUHV-00FCCU-2f
	for ath10k@lists.infradead.org;
	Wed, 11 Oct 2023 08:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697011765; x=1728547765;
  h=date:from:to:cc:subject:message-id;
  bh=L2YvhDXrIPkyy1kvxVhCTg2wJBJtUSxMnYppK84ULuo=;
  b=L0pONgdmGzOgN0m9R0N1Ub2yk6I5L1LSgKKYBscQCYjVcrCmSIT9to1o
   aDF4TTGrJ1CL62Qc5tNXzknqTsz+D+hwJDHa6bB4swuRTL+AQrwx5xmmV
   5b6aLHrYYnd3XhEZeOjwEfyTiGmOW+acAmXujIZCU9GAp8jD80tZJCnvy
   A2R6A0M1252MIqy18ASVeWtFOTcWo3R8LqhiaLrsiCnYPKi3wS98xvTrW
   fpLOxw80KOXe1hrIKLTEvT3NbYarltyP4pQDcUb65HCS/MCZ2soXmZv48
   aH/2WwIj6188fZDqv/GLy39BYNXkiwyDENH19GI6/7dJhsfTyxWISvbPi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470869733"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="470869733"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 01:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="783167739"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="783167739"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2023 01:09:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqUHP-0001yj-1V;
	Wed, 11 Oct 2023 08:09:19 +0000
Date: Wed, 11 Oct 2023 16:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 1424328125660281e749480357c7eeda839c144e
Message-ID: <202310111635.LB9VdbT7-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_010925_875948_A76A7313 
X-CRM114-Status: UNSURE (   4.16  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 1424328125660281e749480357c7eeda839c144e  Merge branch 'pending' into master-pending

elapsed time: 1450m

configs tested: 197
configs skipped: 2

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
arc                   randconfig-001-20231010   gcc  
arc                   randconfig-001-20231011   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                   randconfig-001-20231010   gcc  
arm                   randconfig-001-20231011   gcc  
arm                        vexpress_defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231010   gcc  
i386         buildonly-randconfig-001-20231011   gcc  
i386         buildonly-randconfig-002-20231010   gcc  
i386         buildonly-randconfig-002-20231011   gcc  
i386         buildonly-randconfig-003-20231010   gcc  
i386         buildonly-randconfig-003-20231011   gcc  
i386         buildonly-randconfig-004-20231010   gcc  
i386         buildonly-randconfig-004-20231011   gcc  
i386         buildonly-randconfig-005-20231010   gcc  
i386         buildonly-randconfig-005-20231011   gcc  
i386         buildonly-randconfig-006-20231010   gcc  
i386         buildonly-randconfig-006-20231011   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231010   gcc  
i386                  randconfig-001-20231011   gcc  
i386                  randconfig-002-20231010   gcc  
i386                  randconfig-002-20231011   gcc  
i386                  randconfig-003-20231010   gcc  
i386                  randconfig-003-20231011   gcc  
i386                  randconfig-004-20231010   gcc  
i386                  randconfig-004-20231011   gcc  
i386                  randconfig-005-20231010   gcc  
i386                  randconfig-005-20231011   gcc  
i386                  randconfig-006-20231010   gcc  
i386                  randconfig-006-20231011   gcc  
i386                  randconfig-011-20231010   gcc  
i386                  randconfig-011-20231011   gcc  
i386                  randconfig-012-20231010   gcc  
i386                  randconfig-012-20231011   gcc  
i386                  randconfig-013-20231010   gcc  
i386                  randconfig-013-20231011   gcc  
i386                  randconfig-014-20231010   gcc  
i386                  randconfig-014-20231011   gcc  
i386                  randconfig-015-20231010   gcc  
i386                  randconfig-015-20231011   gcc  
i386                  randconfig-016-20231010   gcc  
i386                  randconfig-016-20231011   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231010   gcc  
loongarch             randconfig-001-20231011   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                          malta_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
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
powerpc                          allyesconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                    socrates_defconfig   clang
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231010   gcc  
riscv                 randconfig-001-20231011   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231010   gcc  
s390                  randconfig-001-20231011   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231010   gcc  
sparc                 randconfig-001-20231011   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231010   gcc  
x86_64       buildonly-randconfig-001-20231011   gcc  
x86_64       buildonly-randconfig-002-20231010   gcc  
x86_64       buildonly-randconfig-002-20231011   gcc  
x86_64       buildonly-randconfig-003-20231010   gcc  
x86_64       buildonly-randconfig-003-20231011   gcc  
x86_64       buildonly-randconfig-004-20231010   gcc  
x86_64       buildonly-randconfig-004-20231011   gcc  
x86_64       buildonly-randconfig-005-20231010   gcc  
x86_64       buildonly-randconfig-005-20231011   gcc  
x86_64       buildonly-randconfig-006-20231010   gcc  
x86_64       buildonly-randconfig-006-20231011   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231010   gcc  
x86_64                randconfig-001-20231011   gcc  
x86_64                randconfig-002-20231010   gcc  
x86_64                randconfig-002-20231011   gcc  
x86_64                randconfig-003-20231010   gcc  
x86_64                randconfig-003-20231011   gcc  
x86_64                randconfig-004-20231010   gcc  
x86_64                randconfig-004-20231011   gcc  
x86_64                randconfig-005-20231010   gcc  
x86_64                randconfig-005-20231011   gcc  
x86_64                randconfig-006-20231010   gcc  
x86_64                randconfig-006-20231011   gcc  
x86_64                randconfig-011-20231010   gcc  
x86_64                randconfig-011-20231011   gcc  
x86_64                randconfig-012-20231010   gcc  
x86_64                randconfig-012-20231011   gcc  
x86_64                randconfig-013-20231010   gcc  
x86_64                randconfig-013-20231011   gcc  
x86_64                randconfig-014-20231010   gcc  
x86_64                randconfig-014-20231011   gcc  
x86_64                randconfig-015-20231010   gcc  
x86_64                randconfig-015-20231011   gcc  
x86_64                randconfig-016-20231010   gcc  
x86_64                randconfig-016-20231011   gcc  
x86_64                randconfig-071-20231010   gcc  
x86_64                randconfig-071-20231011   gcc  
x86_64                randconfig-072-20231010   gcc  
x86_64                randconfig-072-20231011   gcc  
x86_64                randconfig-073-20231010   gcc  
x86_64                randconfig-073-20231011   gcc  
x86_64                randconfig-074-20231010   gcc  
x86_64                randconfig-074-20231011   gcc  
x86_64                randconfig-075-20231010   gcc  
x86_64                randconfig-075-20231011   gcc  
x86_64                randconfig-076-20231010   gcc  
x86_64                randconfig-076-20231011   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
