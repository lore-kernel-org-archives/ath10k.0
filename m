Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C29C77B60
	for <ath10k@archiver.kernel.org>; Sat, 29 Apr 2023 05:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/vZ9SYG6osZ1bSI4aJl7r9Eo2Si/sHrInZgRXMFFdXM=; b=tBuEYChyYk0e1F
	VODG0+0a4tZraqb4w0a8jqRX3msHRwQ4ryR9SbYqJE18/5r7BD8+CDUmUoD6lqLpSc6SocKoibu06
	tgQe2wjy1G+bwdLZygWGS0KATKsQn8hc0uM2zxkpYkFYFAVEHS+k1dmI2x+5rO5fA7LBoRd2gtlCe
	knpVkWkpU0CIyojsmr6iauqncwfAgqyCCts3dfSDEi0NX4I4JdI7f6mi4KDRWW+od/13VGFSBhsaW
	gCzQKmNexMsQ5hUXXEE+QuuLfOE49vI8t3l1vHIaw1/5tOLSRwJPiURz7zt2df/o/0dGXPt/x8P37
	XzeAppzG3hA6Ic0nGRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psd7u-00CGSC-0z;
	Sat, 29 Apr 2023 05:28:06 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psd7q-00CGRV-31
	for ath10k@lists.infradead.org;
	Sat, 29 Apr 2023 05:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682746082; x=1714282082;
  h=date:from:to:cc:subject:message-id;
  bh=CIG7xF5/UjFXDGRWORifCNskBkmKj+0hsifiNUxCzuA=;
  b=OvDDdHt2E6pJJ9sjO9AqkXt75XWAkkTKfCUesQlcxGao4Q8ws8q1rDxL
   XXJaz5gmXcKGdrKB3hrQXPm9QaIBSLVQ6QfBH4B/jTQFx5Rn4CaVxedj4
   Fn6kOjXL02IzhnwKAvHagoSgIoLaluE5OJ814QaRLyWhmS0N4rwO6jiiT
   aiSaOI0TbWkAj0LHfeGK97St2+77P0ac2R54VjRkfMEP+QIyh0Gxy6sm3
   Mddk7XVs7KzPEtL9r2wgfFCQgR1TFyQOATY3m40YeXeNHwOqg+pCSVM94
   mqdx7V/0M/BkWfiaS+FyBfn0gYWd4c35kVfWig80sB2CCHIRTFkYvse8l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="337003588"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="337003588"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 22:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="764582982"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="764582982"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2023 22:27:54 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psd7h-0000vH-39;
	Sat, 29 Apr 2023 05:27:53 +0000
Date: Sat, 29 Apr 2023 13:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 11efce67a49aa5dfd6066dbd529df3362f60e8c6
Message-ID: <20230429052751.SIJfM%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_222803_039908_CDA5ABE9 
X-CRM114-Status: UNSURE (   6.69  )
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
branch HEAD: 11efce67a49aa5dfd6066dbd529df3362f60e8c6  Merge branch 'ath-next' into ath-qca

elapsed time: 722m

configs tested: 103
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230428   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r005-20230428   gcc  
arc                  randconfig-r031-20230428   gcc  
arc                  randconfig-r043-20230428   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230428   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r032-20230428   clang
csky         buildonly-randconfig-r003-20230428   gcc  
csky         buildonly-randconfig-r006-20230428   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r036-20230428   gcc  
hexagon                          alldefconfig   clang
hexagon              randconfig-r002-20230428   clang
hexagon              randconfig-r041-20230428   clang
hexagon              randconfig-r045-20230428   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r012-20230428   gcc  
loongarch            randconfig-r025-20230428   gcc  
loongarch            randconfig-r034-20230428   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230428   gcc  
microblaze   buildonly-randconfig-r001-20230428   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                 randconfig-r016-20230428   clang
nios2                               defconfig   gcc  
nios2                randconfig-r033-20230428   gcc  
nios2                randconfig-r035-20230428   gcc  
openrisc             randconfig-r001-20230428   gcc  
openrisc             randconfig-r004-20230428   gcc  
openrisc             randconfig-r011-20230428   gcc  
parisc       buildonly-randconfig-r004-20230428   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 mpc837x_rdb_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r003-20230428   clang
riscv                randconfig-r042-20230428   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230428   gcc  
s390                 randconfig-r024-20230428   gcc  
s390                 randconfig-r044-20230428   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r021-20230428   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230428   gcc  
xtensa               randconfig-r026-20230428   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
