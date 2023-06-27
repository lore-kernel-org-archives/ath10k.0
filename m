Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5CFEB64D9
	for <ath10k@archiver.kernel.org>; Tue, 27 Jun 2023 01:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FqESA8PtpSjwoo7oXQxAd0mXV0YtLkD6bAWsgs0OnTE=; b=f26YxRR82/5CHx
	brSOEIT7Ury0ZdM6OwBcJm4sbvkTL1gHD52p089l1FqrShdu3jlB2CxFBdPL3kBd3anSQYv2ONtSD
	yuinngnkUHAx61r4a9HMXSMnwVeUMJEy7BUYFqN4oOeGF9/Qe9Vr3gp0JJpSqaLhq3SfBoI+OdQ/5
	f5Dem/mgWpPB62v+PuQnapgnRLnRL59C+Kt6dkEaP0o/akjwY1jDYUJD7B/jnXNef/tUSBo0lim7L
	QjNKsguq636h6ZT4GPlD5yWS3DctqpDlgQgZS3fNg3NKMeBO7QlQ/si1ZLSB/G2gRewqCnRCmcqF9
	bTct8ocOGIhnq9ybEhFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxVk-00BNWT-0R;
	Tue, 27 Jun 2023 01:28:52 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxVh-00BNVT-0R
	for ath10k@lists.infradead.org;
	Tue, 27 Jun 2023 01:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687829329; x=1719365329;
  h=date:from:to:cc:subject:message-id;
  bh=pkNUw8U7Sy3VemPOFRy9cwz0bk94XrM0ek2iytxiyDc=;
  b=RLTBeagGQj3iPDPVLA5LZCmd6N9PUjMWlFximy1ZEpJ+VoDYNNNOvVRh
   hn4Om6GI9b/y+22EVHXOhytDKaBVjBtP3r412UALpr3ZTww5Zo6AE7WPc
   gR/OIq96gYpYgtLMm0SzYmfLXEIOLNxC5kxuNQjRTdtBXp51BGRU18gUv
   pkj0fGJqwUDI+n1fQmwv2ldL+gH+kCK8R2vJVF2THzYv6jvvStf+/Z1nN
   2JnFXsHKa2Zvu1/K88n1MmVIo/J/K7ukcZcEUcd3FkLwUy4vQ/Ba/+qwq
   5Ek1mNDg3m/UFoXANx4PYv1QMnqzzjnqojUHKYLoyTRC+GsXVwSrBDG3Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341779980"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="341779980"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="710433407"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="710433407"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Jun 2023 18:28:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDxVd-000BXC-31;
	Tue, 27 Jun 2023 01:28:45 +0000
Date: Tue, 27 Jun 2023 09:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 debceb36da40be09e0b6a19395a31c2408c4a645
Message-ID: <202306270902.3Cy229dP-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_182849_186783_0C855DE2 
X-CRM114-Status: UNSURE (   4.27  )
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
branch HEAD: debceb36da40be09e0b6a19395a31c2408c4a645  Merge branch 'pending' into master-pending

elapsed time: 7459m

configs tested: 135
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r031-20230621   gcc  
arc                  randconfig-r043-20230621   gcc  
arc                  randconfig-r043-20230626   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                  randconfig-r004-20230622   gcc  
arm                  randconfig-r006-20230622   gcc  
arm                  randconfig-r046-20230621   gcc  
arm                  randconfig-r046-20230626   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r034-20230621   gcc  
hexagon              randconfig-r005-20230622   clang
hexagon              randconfig-r041-20230621   clang
hexagon              randconfig-r041-20230626   clang
hexagon              randconfig-r045-20230621   clang
hexagon              randconfig-r045-20230626   clang
i386                             alldefconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230621   gcc  
i386         buildonly-randconfig-r004-20230626   clang
i386         buildonly-randconfig-r005-20230621   gcc  
i386         buildonly-randconfig-r005-20230626   clang
i386         buildonly-randconfig-r006-20230621   gcc  
i386         buildonly-randconfig-r006-20230626   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230621   gcc  
i386                 randconfig-i001-20230626   clang
i386                 randconfig-i002-20230621   gcc  
i386                 randconfig-i002-20230626   clang
i386                 randconfig-i003-20230621   gcc  
i386                 randconfig-i003-20230626   clang
i386                 randconfig-i004-20230621   gcc  
i386                 randconfig-i004-20230626   clang
i386                 randconfig-i005-20230621   gcc  
i386                 randconfig-i005-20230626   clang
i386                 randconfig-i006-20230621   gcc  
i386                 randconfig-i006-20230626   clang
i386                 randconfig-i011-20230621   clang
i386                 randconfig-i012-20230621   clang
i386                 randconfig-i013-20230621   clang
i386                 randconfig-i014-20230621   clang
i386                 randconfig-i015-20230621   clang
i386                 randconfig-i016-20230621   clang
i386                 randconfig-r026-20230621   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r023-20230621   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r003-20230622   gcc  
microblaze           randconfig-r013-20230621   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip22_defconfig   clang
mips                malta_qemu_32r6_defconfig   clang
nios2                         3c120_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r024-20230621   gcc  
nios2                randconfig-r025-20230621   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230622   gcc  
parisc               randconfig-r012-20230621   gcc  
parisc               randconfig-r016-20230621   gcc  
parisc               randconfig-r032-20230621   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc              randconfig-r011-20230621   clang
powerpc              randconfig-r021-20230621   clang
powerpc                     tqm8540_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230621   clang
riscv                randconfig-r042-20230621   clang
riscv                randconfig-r042-20230626   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r036-20230621   gcc  
s390                 randconfig-r044-20230621   clang
s390                 randconfig-r044-20230626   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230622   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r033-20230621   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r035-20230621   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230621   gcc  
x86_64       buildonly-randconfig-r001-20230626   clang
x86_64       buildonly-randconfig-r002-20230621   gcc  
x86_64       buildonly-randconfig-r002-20230626   clang
x86_64       buildonly-randconfig-r003-20230621   gcc  
x86_64       buildonly-randconfig-r003-20230626   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
