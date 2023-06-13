Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EC9EB64DA
	for <ath10k@archiver.kernel.org>; Tue, 13 Jun 2023 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=egWsCWa3m+D7NbIxmK4GVOP9VJyvXuAEH/Lf62W4Teg=; b=uMAzJCs8/K99XC
	xTUdpIlAxjUps7ozJVAz0qh76+Jv7Qha7iIGDmd5YMlFwd9+6K/jKRjp/V2xxwwyV3VT/jaQjJRa3
	3UyafJFQXONfIKg0DGU5WGgYO47HgvUFOFY9TuUdyrylZlAa5UZSBQpwS5JtZ3RObEpNSHgaEvFof
	Rxly3vgBjLzkUWlb5x3lik+OSc/V47PaRH9b7c5bgE996QEnQaEDg5LJPAIHxGCIfFlSYCorZ2E2L
	ReLI9FIsJ6dWoVsBiIr37I4lRVbwXpBIv7bCs+Dq4z523hzi6LOHBMp3+VKyeaD5nGrvboEfVmm6b
	CI4fihJm6b7n8fTAjmTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9C39-009HkD-0L;
	Tue, 13 Jun 2023 21:59:39 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9C31-009Hhn-1G
	for ath10k@lists.infradead.org;
	Tue, 13 Jun 2023 21:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686693571; x=1718229571;
  h=date:from:to:cc:subject:message-id;
  bh=cHd52bkbdbA/zn+W6O7ca22WdlR73xGDlnS1u/58ODA=;
  b=imraLFDHX3nvfJw7hlnNflzufvlLQPmApUB4U7UHC70Gp1j0sPzeiLbA
   ym+q+Fpxfps7GHLTARkz38Ssbz3oYCoqZTYXIjUsYLJRx53h0hAu0iuRC
   xWqId2m5bw5sqrJxw2UXfxC/PYsAVMlXKnfRzWNk/XNFLvqGgyzNTFv9y
   lnV9RzvLzaV4YxGgwqeCXgXmgGFblVcJyA/5dJEfHZ4n0Ovc897okAdhY
   DO7G5lEep9yEd9ZSEHvMSlKjF3RYekbehFnwjDmjOBY7Uzj+l9GklM5vL
   5mRUkNMAo13Zngo7f8c3VIv221atR68gaHHfkrK+s+oETmWgvvv8yB8/u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="338815105"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="338815105"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 14:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958558790"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="958558790"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2023 14:59:25 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9C2u-0001pQ-1d;
	Tue, 13 Jun 2023 21:59:24 +0000
Date: Wed, 14 Jun 2023 05:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 38765f952b9975f44924f3efe6270f1c00c0c53d
Message-ID: <202306140549.wJGEtd5Y-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_145931_440201_D5020352 
X-CRM114-Status: UNSURE (   4.17  )
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
branch HEAD: 38765f952b9975f44924f3efe6270f1c00c0c53d  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 103
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230612   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r025-20230612   gcc  
arc                  randconfig-r043-20230612   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r016-20230612   clang
arm                  randconfig-r036-20230612   gcc  
arm                  randconfig-r046-20230612   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230612   gcc  
hexagon              randconfig-r041-20230612   clang
hexagon              randconfig-r045-20230612   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r006-20230612   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230612   clang
i386                 randconfig-i002-20230612   clang
i386                 randconfig-i003-20230612   clang
i386                 randconfig-i004-20230612   clang
i386                 randconfig-i005-20230612   clang
i386                 randconfig-i006-20230612   clang
i386                 randconfig-i011-20230612   gcc  
i386                 randconfig-i012-20230612   gcc  
i386                 randconfig-i013-20230612   gcc  
i386                 randconfig-i014-20230612   gcc  
i386                 randconfig-i015-20230612   gcc  
i386                 randconfig-i016-20230612   gcc  
i386                 randconfig-r035-20230612   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r023-20230612   gcc  
m68k                 randconfig-r033-20230612   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r002-20230612   gcc  
mips                 randconfig-r001-20230612   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230612   gcc  
openrisc     buildonly-randconfig-r003-20230612   gcc  
openrisc             randconfig-r012-20230612   gcc  
openrisc             randconfig-r024-20230612   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230612   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r032-20230612   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230612   clang
riscv                randconfig-r015-20230612   gcc  
riscv                randconfig-r042-20230612   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r026-20230612   gcc  
s390                 randconfig-r044-20230612   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230612   gcc  
sh                   randconfig-r002-20230612   gcc  
sh                   randconfig-r011-20230612   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r021-20230612   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230612   clang
x86_64               randconfig-a002-20230612   clang
x86_64               randconfig-a003-20230612   clang
x86_64               randconfig-a004-20230612   clang
x86_64               randconfig-a005-20230612   clang
x86_64               randconfig-a006-20230612   clang
x86_64               randconfig-a011-20230612   gcc  
x86_64               randconfig-a012-20230612   gcc  
x86_64               randconfig-a013-20230612   gcc  
x86_64               randconfig-a014-20230612   gcc  
x86_64               randconfig-a015-20230612   gcc  
x86_64               randconfig-a016-20230612   gcc  
x86_64               randconfig-r005-20230612   clang
x86_64               randconfig-r014-20230612   gcc  
x86_64               randconfig-r034-20230612   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230612   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
