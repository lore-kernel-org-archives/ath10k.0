Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16087EB64DD
	for <ath10k@archiver.kernel.org>; Tue, 25 Jul 2023 03:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IEKWJYPrcOE8xUHwGKUE+D8OrVTFeyp3LR/mJxefCj8=; b=ei5wSmpdo5WKka
	aHrBJxxF8w1ORsIuohUeNmoYQvjWlj+i1DeFrc9yh93fYTZNTUPw56EL9DD+L1f651KC0oAOydmyN
	FG+r85pFOTB12fMDmHc7Ts/Ww81PWrQpIbL7zvhmNkuucGH1Xi5BiKl/K9eodwwf5aCprmawstjUa
	IfK+umw6ofrkrVWoA6+2tfb/pkkLb78MJQqGcH84Jwn9q0phPK+PzvNg/r1wGOi/JwoBiDT22QKK4
	ROUsGshn/eva0T+Uv7qYfh6MZPavlc9EL5eS891OWxSsB9Vx2/ZI/P+T+Ffx7/5eSEK1DrTzWR4XM
	ijc25i03xxGNevjspoww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO8hc-0062IH-11;
	Tue, 25 Jul 2023 03:27:12 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO8hZ-0062HU-0z
	for ath10k@lists.infradead.org;
	Tue, 25 Jul 2023 03:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690255629; x=1721791629;
  h=date:from:to:cc:subject:message-id;
  bh=jdzidXIyIEYUtV4qYoX5RqbVAjv22NiZo+5bSvYQyGY=;
  b=j+EhyTqKPvqjHoN/TcsCMHfQlcJFKoSwWgF1G3AZlPHl48uJ3PiJD07+
   nEMIPCuipyD4ygdB3/5ZdYHgNhlUmizvI+LWKaBG0pkkf8T1+gABFOr+M
   6yPeV0xPZnvY/g1Nxb0HU3ZP54ITSDI1gz5Cp6aSzg/Uqz8kVVyPhQO9p
   EhCmSy+dDTKCpoqrfq3saje9fv3cE4b3uXk/hICh3A3L3VJMRFx+xiDlq
   Fb0oCV7IJ+j3MfoZ9iTJ3iVW0+3VQ8/+FkVt6vUengxECsZBQNDCqrYd+
   fWnwL0otcSmA8BFJM0lcY3vm28TObKXJ3gTbkXfzdxivzT8b0xN9dUdr5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="433857955"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="433857955"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 20:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="703136637"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="703136637"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Jul 2023 20:26:46 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO8hC-000AH3-0o;
	Tue, 25 Jul 2023 03:26:46 +0000
Date: Tue, 25 Jul 2023 11:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 c9ee76c256736d4fcfc19759673ead9fe37a95e5
Message-ID: <202307251109.ddOu9vQM-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_202709_411268_AC7F8120 
X-CRM114-Status: UNSURE (   4.26  )
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
branch HEAD: c9ee76c256736d4fcfc19759673ead9fe37a95e5  Merge branch 'pending' into master-pending

elapsed time: 898m

configs tested: 159
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230724   gcc  
alpha                randconfig-r016-20230724   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                         haps_hs_defconfig   gcc  
arc                  randconfig-r024-20230724   gcc  
arc                  randconfig-r043-20230724   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                  randconfig-r002-20230724   clang
arm                  randconfig-r011-20230724   gcc  
arm                  randconfig-r012-20230724   gcc  
arm                  randconfig-r046-20230724   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230724   clang
arm64                randconfig-r031-20230724   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r002-20230724   clang
hexagon              randconfig-r041-20230724   clang
hexagon              randconfig-r045-20230724   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230723   clang
i386         buildonly-randconfig-r004-20230724   gcc  
i386         buildonly-randconfig-r005-20230723   clang
i386         buildonly-randconfig-r005-20230724   gcc  
i386         buildonly-randconfig-r006-20230723   clang
i386         buildonly-randconfig-r006-20230724   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230724   gcc  
i386                 randconfig-i002-20230724   gcc  
i386                 randconfig-i003-20230724   gcc  
i386                 randconfig-i004-20230724   gcc  
i386                 randconfig-i005-20230724   gcc  
i386                 randconfig-i006-20230724   gcc  
i386                 randconfig-i011-20230724   clang
i386                 randconfig-i012-20230724   clang
i386                 randconfig-i013-20230724   clang
i386                 randconfig-i014-20230724   clang
i386                 randconfig-i015-20230724   clang
i386                 randconfig-i016-20230724   clang
i386                 randconfig-r033-20230724   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch            randconfig-r025-20230724   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                 randconfig-r014-20230724   gcc  
m68k                 randconfig-r023-20230724   gcc  
m68k                 randconfig-r035-20230724   gcc  
microblaze           randconfig-r004-20230724   gcc  
microblaze           randconfig-r015-20230724   gcc  
microblaze           randconfig-r016-20230724   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                 randconfig-r004-20230724   clang
mips                 randconfig-r031-20230724   clang
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230724   gcc  
nios2                randconfig-r011-20230724   gcc  
openrisc             randconfig-r012-20230724   gcc  
openrisc             randconfig-r021-20230724   gcc  
openrisc             randconfig-r026-20230724   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230724   gcc  
parisc               randconfig-r021-20230724   gcc  
parisc               randconfig-r023-20230724   gcc  
parisc               randconfig-r032-20230724   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc              randconfig-r006-20230724   gcc  
powerpc              randconfig-r014-20230724   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230724   gcc  
riscv                randconfig-r042-20230724   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230724   clang
sh                               allmodconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                   randconfig-r004-20230724   gcc  
sh                   randconfig-r012-20230724   gcc  
sh                   randconfig-r013-20230724   gcc  
sh                            titan_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230724   gcc  
sparc                randconfig-r003-20230724   gcc  
sparc                randconfig-r005-20230724   gcc  
sparc                randconfig-r012-20230724   gcc  
sparc                randconfig-r013-20230724   gcc  
sparc                randconfig-r025-20230724   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r003-20230724   clang
um                   randconfig-r006-20230724   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230723   clang
x86_64       buildonly-randconfig-r001-20230724   gcc  
x86_64       buildonly-randconfig-r002-20230723   clang
x86_64       buildonly-randconfig-r002-20230724   gcc  
x86_64       buildonly-randconfig-r003-20230723   clang
x86_64       buildonly-randconfig-r003-20230724   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r003-20230724   gcc  
x86_64               randconfig-r006-20230724   gcc  
x86_64               randconfig-r011-20230724   clang
x86_64               randconfig-r013-20230724   clang
x86_64               randconfig-r035-20230724   gcc  
x86_64               randconfig-x001-20230724   clang
x86_64               randconfig-x002-20230724   clang
x86_64               randconfig-x003-20230724   clang
x86_64               randconfig-x004-20230724   clang
x86_64               randconfig-x005-20230724   clang
x86_64               randconfig-x006-20230724   clang
x86_64               randconfig-x011-20230724   gcc  
x86_64               randconfig-x012-20230724   gcc  
x86_64               randconfig-x013-20230724   gcc  
x86_64               randconfig-x014-20230724   gcc  
x86_64               randconfig-x015-20230724   gcc  
x86_64               randconfig-x016-20230724   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa               randconfig-r003-20230724   gcc  
xtensa               randconfig-r006-20230724   gcc  
xtensa               randconfig-r036-20230724   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
