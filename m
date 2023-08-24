Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DDFC3DA6F
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qUvfqH5s3iyVNsX2ce5ECo6q3Bp4fV54l+y4FSVcbdU=; b=43tZ8V/gD8SK0U
	gMftNTkfUiZfVp6ZpkonWR6LA4lYukmIXIOzqeyMg52qx18+MwrFfQ5b73pRshxdirQqwkNEnmSfw
	WDre3S9dE9Eg6u85p6k1PoQ+worh+kz8VykvwsZumbiHGWecaZwR/83cqVKv8ZcEwRgFrZTS4Mwp7
	m5utT9rs2boMzWssyII32PO8y9A6Py27YsKb3YfLYoQUanT/UnpQgNEcH0+hBnHrxrPDHvIvLUJOH
	XRJaRuDDV12bvS3Kdx4DeifHb/nCbUzDsSJvE0A1+K9XTzb6ywHL4bQeVnpA8bp/EhZuuE1BeY5Tq
	fcTnA+ZHIdmx8BYtS06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZC74-003Lp0-32;
	Thu, 24 Aug 2023 15:19:10 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZC72-003Lns-0a
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 15:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692890348; x=1724426348;
  h=date:from:to:cc:subject:message-id;
  bh=mzPIGocYsE69SK4ITtFihvWkllfxkIvzdlISy6cK7oQ=;
  b=dQLBJWzSbLbWbPL01vW28MDEGZlDXMx/z9TWEJxrH3lfjz083/JvMwgz
   Xzalvxz0k+KYCjL3+tAifx0xxhQ+d0eIxzLzKllQvZ//RTsmbJuVVpdYU
   eggrf6qMWXbA2ymojCoX844DXC/1hmnU3uE8Q+J0q+FfmpEgAmREa1QG6
   +ya8I2/Pm25S3jm2QAiju/4YkBw68sGvtg5vZPumghYb8wcOXmBMUA5hK
   /ZVapqqKI7RNjLjRIvllQrMG9tuLSipBwrdBoqKGSme/TJ0sjBUIWsHWR
   w8zGO6MKeTkrYG8bHWOTjhRLYQA2CUn+zbfQ7YPsD+7JCtZ+YByScsS9j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354798318"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354798318"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 08:19:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="860755193"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="860755193"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 08:19:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZC6v-0002mx-2V;
	Thu, 24 Aug 2023 15:19:01 +0000
Date: Thu, 24 Aug 2023 23:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 41c16c0259ed11d34f0d40b9f203f81d8bcceb07
Message-ID: <202308242306.GOGG4sF6-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_081908_250267_39465ED2 
X-CRM114-Status: UNSURE (   4.15  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 41c16c0259ed11d34f0d40b9f203f81d8bcceb07  Merge branch 'ath-next' into ath-qca

elapsed time: 1447m

configs tested: 171
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
arc                   randconfig-001-20230824   gcc  
arc                  randconfig-r004-20230824   gcc  
arc                  randconfig-r024-20230824   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230824   gcc  
arm                  randconfig-r003-20230824   clang
arm                  randconfig-r035-20230824   clang
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r034-20230824   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r015-20230824   gcc  
hexagon               randconfig-001-20230824   clang
hexagon               randconfig-002-20230824   clang
hexagon              randconfig-r011-20230824   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230824   gcc  
i386         buildonly-randconfig-002-20230824   gcc  
i386         buildonly-randconfig-003-20230824   gcc  
i386         buildonly-randconfig-004-20230824   gcc  
i386         buildonly-randconfig-005-20230824   gcc  
i386         buildonly-randconfig-006-20230824   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230824   gcc  
i386                  randconfig-002-20230824   gcc  
i386                  randconfig-003-20230824   gcc  
i386                  randconfig-004-20230824   gcc  
i386                  randconfig-005-20230824   gcc  
i386                  randconfig-006-20230824   gcc  
i386                  randconfig-011-20230824   clang
i386                  randconfig-012-20230824   clang
i386                  randconfig-013-20230824   clang
i386                  randconfig-014-20230824   clang
i386                  randconfig-015-20230824   clang
i386                  randconfig-016-20230824   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230824   gcc  
loongarch            randconfig-r002-20230824   gcc  
loongarch            randconfig-r026-20230824   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r016-20230824   gcc  
m68k                 randconfig-r032-20230824   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   clang
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230824   gcc  
nios2                randconfig-r036-20230824   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230824   gcc  
parisc               randconfig-r025-20230824   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                          allyesconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc              randconfig-r033-20230824   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230824   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230824   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230824   gcc  
sparc                randconfig-r022-20230824   gcc  
sparc                randconfig-r031-20230824   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r006-20230824   gcc  
sparc64              randconfig-r021-20230824   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230824   gcc  
x86_64       buildonly-randconfig-002-20230824   gcc  
x86_64       buildonly-randconfig-003-20230824   gcc  
x86_64       buildonly-randconfig-004-20230824   gcc  
x86_64       buildonly-randconfig-005-20230824   gcc  
x86_64       buildonly-randconfig-006-20230824   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230824   clang
x86_64                randconfig-002-20230824   clang
x86_64                randconfig-003-20230824   clang
x86_64                randconfig-004-20230824   clang
x86_64                randconfig-005-20230824   clang
x86_64                randconfig-006-20230824   clang
x86_64                randconfig-011-20230824   gcc  
x86_64                randconfig-012-20230824   gcc  
x86_64                randconfig-013-20230824   gcc  
x86_64                randconfig-014-20230824   gcc  
x86_64                randconfig-015-20230824   gcc  
x86_64                randconfig-016-20230824   gcc  
x86_64                randconfig-071-20230824   gcc  
x86_64                randconfig-072-20230824   gcc  
x86_64                randconfig-073-20230824   gcc  
x86_64                randconfig-074-20230824   gcc  
x86_64                randconfig-075-20230824   gcc  
x86_64                randconfig-076-20230824   gcc  
x86_64               randconfig-r005-20230824   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa               randconfig-r001-20230824   gcc  
xtensa               randconfig-r023-20230824   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
