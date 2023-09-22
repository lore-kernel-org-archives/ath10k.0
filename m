Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607F8E7D0CD
	for <ath10k@archiver.kernel.org>; Fri, 22 Sep 2023 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GydDYsLyrQucUWPo6hmmewDLzdB+Wq4bW62ZbroC09A=; b=jZ33AO2GoHKOH9
	j8+OaKNIuv7s1XX860QogDnHjEqjPMMsi94JTj37KKv2YfusRnv1LOfAPW7rPI2PEGJhQBNsGz5Sj
	FsMQ6WTWHFfNVc62QJtZTaKuEU+8QqFZmSEy2FpEEzd8ayZmgINxQEf75A3JWKIzkpY6sGhWuqN4C
	C4zYM17ZGx8U+xFTAS0gonyj5Wapil0o2ECAQfYqXYsYL9+7HtXgNZR54SUwiBro5CCzoy2w/z/XS
	IS03zxVcO7uTtT1nqSU3Romss2E/pAM6455olYrEnpfKZPblFiHaCaoOzFlmQlRtWU9cIsUHjn5QG
	Xugap1JgngAp9Qj29iuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZJ4-0080VU-2e;
	Fri, 22 Sep 2023 06:06:26 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZJ1-0080Ue-22
	for ath10k@lists.infradead.org;
	Fri, 22 Sep 2023 06:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695362783; x=1726898783;
  h=date:from:to:cc:subject:message-id;
  bh=R9fyLlL1T7ORb428UrmVDby5CHf+M9AAovCv9GqReI4=;
  b=AgxBTWpQ9aU1TKjjUv326A8NV+VlUUn7AlhZUeLUuPS83/DvsItWMXyy
   9DoRAo0/WBgDgxfPjbjRHjthkG53I+WnxwawfCsH8Jb9Oq8QxpEAingXN
   Hiq04uXbpoQSHiHZSTnFGWjIETa2kz2/OLGwPQ357HhbQmO7+ME2WKADM
   UZ/w/epHETjL/h4KdVjeMuQB5YpnYpdcOeGwVO4pbgG46+n5ZFSkrJBsd
   Df7RuPzs1J0P3b+vTCydQUS6dAUNBgSCbae4NAvAcKO2zPv4G7FjXk+aI
   Gjy0YijNf9m/NdzXmCrQBFUHxbO6Q2KZhsrhHxXMsRj00+LzDbmQaPsmx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="467054031"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="467054031"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 23:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="747419160"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="747419160"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Sep 2023 23:06:20 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjZIw-0000BJ-0a;
	Fri, 22 Sep 2023 06:06:18 +0000
Date: Fri, 22 Sep 2023 14:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 9066794113c4813b6ce4a66ed6ce14ecdf35625d
Message-ID: <202309221428.1xkzbtrJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_230623_684255_8826D1EC 
X-CRM114-Status: UNSURE (   6.05  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 9066794113c4813b6ce4a66ed6ce14ecdf35625d  wifi: ath11k: remove unused members of 'struct ath11k_base'

elapsed time: 1291m

configs tested: 177
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
arc                   randconfig-001-20230921   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230921   gcc  
arm                   randconfig-001-20230922   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230921   gcc  
i386         buildonly-randconfig-001-20230922   gcc  
i386         buildonly-randconfig-002-20230921   gcc  
i386         buildonly-randconfig-002-20230922   gcc  
i386         buildonly-randconfig-003-20230921   gcc  
i386         buildonly-randconfig-003-20230922   gcc  
i386         buildonly-randconfig-004-20230921   gcc  
i386         buildonly-randconfig-004-20230922   gcc  
i386         buildonly-randconfig-005-20230921   gcc  
i386         buildonly-randconfig-005-20230922   gcc  
i386         buildonly-randconfig-006-20230921   gcc  
i386         buildonly-randconfig-006-20230922   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230921   gcc  
i386                  randconfig-001-20230922   gcc  
i386                  randconfig-002-20230921   gcc  
i386                  randconfig-002-20230922   gcc  
i386                  randconfig-003-20230921   gcc  
i386                  randconfig-003-20230922   gcc  
i386                  randconfig-004-20230921   gcc  
i386                  randconfig-004-20230922   gcc  
i386                  randconfig-005-20230921   gcc  
i386                  randconfig-005-20230922   gcc  
i386                  randconfig-006-20230921   gcc  
i386                  randconfig-006-20230922   gcc  
i386                  randconfig-011-20230921   gcc  
i386                  randconfig-011-20230922   gcc  
i386                  randconfig-012-20230921   gcc  
i386                  randconfig-012-20230922   gcc  
i386                  randconfig-013-20230921   gcc  
i386                  randconfig-013-20230922   gcc  
i386                  randconfig-014-20230921   gcc  
i386                  randconfig-014-20230922   gcc  
i386                  randconfig-015-20230921   gcc  
i386                  randconfig-015-20230922   gcc  
i386                  randconfig-016-20230921   gcc  
i386                  randconfig-016-20230922   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230921   gcc  
loongarch             randconfig-001-20230922   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
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
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230921   gcc  
riscv                 randconfig-001-20230922   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230921   gcc  
s390                  randconfig-001-20230922   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230921   gcc  
sparc                 randconfig-001-20230922   gcc  
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
x86_64       buildonly-randconfig-001-20230921   gcc  
x86_64       buildonly-randconfig-001-20230922   gcc  
x86_64       buildonly-randconfig-002-20230921   gcc  
x86_64       buildonly-randconfig-002-20230922   gcc  
x86_64       buildonly-randconfig-003-20230921   gcc  
x86_64       buildonly-randconfig-003-20230922   gcc  
x86_64       buildonly-randconfig-004-20230921   gcc  
x86_64       buildonly-randconfig-004-20230922   gcc  
x86_64       buildonly-randconfig-005-20230921   gcc  
x86_64       buildonly-randconfig-005-20230922   gcc  
x86_64       buildonly-randconfig-006-20230921   gcc  
x86_64       buildonly-randconfig-006-20230922   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230921   gcc  
x86_64                randconfig-001-20230922   gcc  
x86_64                randconfig-002-20230921   gcc  
x86_64                randconfig-002-20230922   gcc  
x86_64                randconfig-003-20230921   gcc  
x86_64                randconfig-003-20230922   gcc  
x86_64                randconfig-004-20230921   gcc  
x86_64                randconfig-004-20230922   gcc  
x86_64                randconfig-005-20230921   gcc  
x86_64                randconfig-005-20230922   gcc  
x86_64                randconfig-006-20230921   gcc  
x86_64                randconfig-006-20230922   gcc  
x86_64                randconfig-011-20230921   gcc  
x86_64                randconfig-011-20230922   gcc  
x86_64                randconfig-012-20230921   gcc  
x86_64                randconfig-012-20230922   gcc  
x86_64                randconfig-013-20230921   gcc  
x86_64                randconfig-013-20230922   gcc  
x86_64                randconfig-014-20230921   gcc  
x86_64                randconfig-014-20230922   gcc  
x86_64                randconfig-015-20230921   gcc  
x86_64                randconfig-015-20230922   gcc  
x86_64                randconfig-016-20230921   gcc  
x86_64                randconfig-016-20230922   gcc  
x86_64                randconfig-071-20230921   gcc  
x86_64                randconfig-072-20230921   gcc  
x86_64                randconfig-073-20230921   gcc  
x86_64                randconfig-074-20230921   gcc  
x86_64                randconfig-075-20230921   gcc  
x86_64                randconfig-076-20230921   gcc  
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
