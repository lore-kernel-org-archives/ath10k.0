Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A4CC77B7A
	for <ath10k@archiver.kernel.org>; Sat, 10 Jun 2023 04:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9O6EN9Ttw6x+wlwpQ/MVo5DwCYOtS3pgVkm2bi3Iw4s=; b=i9RSG8lfBQvPie
	pzdgeohQjCX2ipNXti30yQyHPMytQ7e2SCyrvQwcjQl+9P7QEzQyQl7Cvtk0eHj+3fAUEHIuPXWMQ
	zXXEg0tJuh/VLSkkCCyEtiFLAQYw5lQWT1ScpSKvu72FiM8+mZDETeqiXhKicTsctrGjxEZBl3QkQ
	bTutpux5w2ogbkdQUb+IMuw7Tk22/zP+9N+QAFBoN+7rG1XJGYxLr19vHBEafWqbKqxW7O/U9WlZE
	R2H3Y6GfanMjVpoEtHVCbgtNL2K2TTndSfNvqbfPba5RYbwo/1WDZgvPysYJ3Rp/C9mVlW5l6ttlq
	jLZKspLCujeOKtjpl9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7pnv-00F8TT-1F;
	Sat, 10 Jun 2023 04:02:19 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7pns-00F8SB-26
	for ath10k@lists.infradead.org;
	Sat, 10 Jun 2023 04:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686369736; x=1717905736;
  h=date:from:to:cc:subject:message-id;
  bh=II9AxqqSbOR8mCbG8+6BATI+bsb/srWnhA5wPRv+Ylc=;
  b=lcSFHhS8+as9QsODO63cqFSw6SF70TNd5Z/uoNezYv5TQq+WizCWNAQZ
   RhOipok08tbpt49k+0iUSqpd+Yiig8KuwSkCWBvmiBVNgelbVV5JA0VCF
   NF+BPs4TDO5nad2DCDTzJXs95aT2hzRmsnbP/CeMl08B5vfdu6DOTWLUz
   +ksys0BcQ7V0zOp+vTl3/lm4KseTvs3oZWG0JBKt2m/rJpwu+Sczosq+C
   84D6DXzv4YzZ+F4MeAi+oPMwKf2J1aflGn3wi8d+XHWr98htEF6Al6kfK
   GbfNHU+oNsrNUnxc70Y6nh61tVkG8Xze17c8DfprgAPhcYfCB9XzBamjj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="444098812"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="444098812"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 21:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="775721765"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="775721765"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Jun 2023 21:02:10 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7pnl-0009gz-2R;
	Sat, 10 Jun 2023 04:02:09 +0000
Date: Sat, 10 Jun 2023 12:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 a20e1111eba7e4d98f22c03abb95da699ee9d4c7
Message-ID: <202306101209.T58dkHYv-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_210216_698276_24D898C0 
X-CRM114-Status: UNSURE (   4.19  )
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
branch HEAD: a20e1111eba7e4d98f22c03abb95da699ee9d4c7  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 124
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r032-20230609   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r005-20230608   gcc  
arc                  randconfig-r012-20230608   gcc  
arc                  randconfig-r015-20230608   gcc  
arc                  randconfig-r021-20230608   gcc  
arc                  randconfig-r043-20230608   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230608   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230608   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230608   gcc  
hexagon      buildonly-randconfig-r001-20230608   clang
hexagon              randconfig-r016-20230608   clang
hexagon              randconfig-r034-20230609   clang
hexagon              randconfig-r041-20230608   clang
hexagon              randconfig-r045-20230608   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230608   gcc  
i386                 randconfig-i002-20230608   gcc  
i386                 randconfig-i003-20230608   gcc  
i386                 randconfig-i004-20230608   gcc  
i386                 randconfig-i005-20230608   gcc  
i386                 randconfig-i006-20230608   gcc  
i386                 randconfig-i011-20230609   gcc  
i386                 randconfig-i012-20230609   gcc  
i386                 randconfig-i013-20230609   gcc  
i386                 randconfig-i014-20230609   gcc  
i386                 randconfig-i015-20230609   gcc  
i386                 randconfig-i016-20230609   gcc  
i386                 randconfig-i051-20230608   gcc  
i386                 randconfig-i052-20230608   gcc  
i386                 randconfig-i053-20230608   gcc  
i386                 randconfig-i054-20230608   gcc  
i386                 randconfig-i055-20230608   gcc  
i386                 randconfig-i056-20230608   gcc  
i386                 randconfig-i061-20230608   gcc  
i386                 randconfig-i062-20230608   gcc  
i386                 randconfig-i063-20230608   gcc  
i386                 randconfig-i064-20230608   gcc  
i386                 randconfig-i065-20230608   gcc  
i386                 randconfig-i066-20230608   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r002-20230608   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r026-20230608   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230608   gcc  
m68k                 randconfig-r036-20230609   gcc  
microblaze           randconfig-r031-20230609   gcc  
microblaze           randconfig-r033-20230609   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r023-20230608   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r006-20230608   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r006-20230608   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230608   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230608   clang
sh                               allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc        buildonly-randconfig-r003-20230608   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230608   gcc  
sparc64      buildonly-randconfig-r005-20230608   gcc  
sparc64              randconfig-r001-20230608   gcc  
sparc64              randconfig-r002-20230608   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230608   gcc  
x86_64               randconfig-a002-20230608   gcc  
x86_64               randconfig-a003-20230608   gcc  
x86_64               randconfig-a004-20230608   gcc  
x86_64               randconfig-a005-20230608   gcc  
x86_64               randconfig-a006-20230608   gcc  
x86_64               randconfig-a011-20230608   clang
x86_64               randconfig-a012-20230608   clang
x86_64               randconfig-a013-20230608   clang
x86_64               randconfig-a014-20230608   clang
x86_64               randconfig-a015-20230608   clang
x86_64               randconfig-a016-20230608   clang
x86_64               randconfig-r022-20230608   clang
x86_64               randconfig-x051-20230609   gcc  
x86_64               randconfig-x052-20230609   gcc  
x86_64               randconfig-x053-20230609   gcc  
x86_64               randconfig-x054-20230609   gcc  
x86_64               randconfig-x055-20230609   gcc  
x86_64               randconfig-x056-20230609   gcc  
x86_64               randconfig-x061-20230608   clang
x86_64               randconfig-x062-20230608   clang
x86_64               randconfig-x063-20230608   clang
x86_64               randconfig-x064-20230608   clang
x86_64               randconfig-x065-20230608   clang
x86_64               randconfig-x066-20230608   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
