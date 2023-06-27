Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60F5EB64D7
	for <ath10k@archiver.kernel.org>; Tue, 27 Jun 2023 01:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OSRCb2ZM8Coj1cHQ3RUdBFk2i3wEGtmcWFaMmt9OSNM=; b=POhKNhKdvz7A1F
	061iY4TsKSdJ73f+IPZA2aLGIL+DzYSYngWF3mCcIQMUu3enzkjX51hwudkxPFVDIEw14jt5JuUVJ
	U0ya4A5Y86csfycofF1VvOE+N/Sqik9x9cVlBI424lVmXf8bYf8wypY9btCNhYIiU5czNJYkY9Cv/
	y0nAeFWGNcUpZnK7laCNJTErl1XsKrBihMpC8/NlyWzc4EqpCQRujFtW8tIcaLgUiFn7vOK/3+mvH
	K9/pCvjAMAS70t+9Dkr3HaanBkgehG3llHhdFrnPpP/29zFdBBqfjxPBKFlnXYWK97ZqhRrlZ29Og
	su5+bRRw7V36JwJDJWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxNs-00BMNL-2X;
	Tue, 27 Jun 2023 01:20:44 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxNq-00BMMo-1B
	for ath10k@lists.infradead.org;
	Tue, 27 Jun 2023 01:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687828842; x=1719364842;
  h=date:from:to:cc:subject:message-id;
  bh=AQijMZuKVW+bJ7u7/lYS9T/ue7FKvn3ZMQ48yTVumCA=;
  b=TmBEqgbakssk5rRublJCyCIpy1Q73icHHyqLiGq/YyB32XqDvjOBem2g
   P2jhO5D/Rva+m444NdcbZ/mcTi6FPqB6fYOP5tGaEuLl4aaeupMx6Oo9c
   0RmGs7pcBOYB6+LFiFdJjXlb5hJ9Q1uToOlaVgf+tVSMpSe/xeEGPs/8E
   9QWZiyJCmaH585tJe1OEt8dc1WgC7GF8i4fRAj7gUX81r++kVQPLtN23Y
   SkKjosBQUwpGwzZ3o/V/4kU+/8bLdlEGpkCwpPQjA+hxr/GMOjIS1tXEn
   FUD88qpZGYEP8u5ASt9B7K+Uzj9fejPLpXJtoR8/JARGnsiXA6gVrlNAQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="391879250"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="391879250"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="719592935"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="719592935"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jun 2023 18:20:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDxNo-000BNB-1T;
	Tue, 27 Jun 2023 01:20:40 +0000
Date: Tue, 27 Jun 2023 09:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 4ee70a46e9f9ea0f5e970c89f17fad093eb191f5
Message-ID: <202306270957.6RsGpRMI-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_182042_422368_7A2825B7 
X-CRM114-Status: UNSURE (   5.92  )
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
branch HEAD: 4ee70a46e9f9ea0f5e970c89f17fad093eb191f5  Merge branch 'ath-next' into ath-qca

elapsed time: 7451m

configs tested: 101
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230621   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230622   gcc  
arm                  randconfig-r016-20230621   gcc  
arm                  randconfig-r046-20230621   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230622   clang
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230621   clang
hexagon              randconfig-r045-20230621   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230621   gcc  
i386         buildonly-randconfig-r005-20230621   gcc  
i386         buildonly-randconfig-r006-20230621   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230621   gcc  
i386                 randconfig-i002-20230621   gcc  
i386                 randconfig-i003-20230621   gcc  
i386                 randconfig-i004-20230621   gcc  
i386                 randconfig-i005-20230621   gcc  
i386                 randconfig-i006-20230621   gcc  
i386                 randconfig-i011-20230621   clang
i386                 randconfig-i012-20230621   clang
i386                 randconfig-i013-20230621   clang
i386                 randconfig-i014-20230621   clang
i386                 randconfig-i015-20230621   clang
i386                 randconfig-i016-20230621   clang
i386                 randconfig-r001-20230622   clang
i386                 randconfig-r036-20230622   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r015-20230621   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r013-20230621   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r006-20230622   gcc  
mips                 randconfig-r012-20230621   gcc  
mips                 randconfig-r022-20230621   gcc  
mips                 randconfig-r026-20230621   gcc  
mips                 randconfig-r033-20230622   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r031-20230622   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230622   gcc  
parisc               randconfig-r024-20230621   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                     mpc512x_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc              randconfig-r011-20230621   clang
powerpc              randconfig-r034-20230622   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230621   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r032-20230622   clang
s390                 randconfig-r035-20230622   clang
s390                 randconfig-r044-20230621   clang
sh                               allmodconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r025-20230621   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230621   gcc  
x86_64       buildonly-randconfig-r002-20230621   gcc  
x86_64       buildonly-randconfig-r003-20230621   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa               randconfig-r014-20230621   gcc  
xtensa               randconfig-r021-20230621   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
