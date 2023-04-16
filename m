Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D5BC77B73
	for <ath10k@archiver.kernel.org>; Sun, 16 Apr 2023 00:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENLwRRWz/bDVvzC3FQOxWjo3zb3OtqYmTmpI2p2J5Yw=; b=cS/DZ1JDIJe3rP
	NWSVoxpQ1OlgiePsjMGwaEV7TFU3+m89OOJhcfFLD/MY3hDQ2ZPoZTDgtbg4HOEyGW+2va0DJIYLc
	inc2VYvQf5oD2eemsKbHs5L3SOH1CoKX0hYR+Nmls9hlyBKpaOy857ngpz+MXkFbD6GTzODGUK8hw
	I2zSc7rfZ29NGINQN+TYJHISUFJc/kCVdLaH3oi2uLVTPiVWk7rqX9I6WmzrlknJ2EK54Kq9i7hRm
	+Z/SSA3lS03Qtz+JbgzHx2lNvPw35qnTTKq5qvkOt4+pUp4fk3Uf49eZsX5ocY9Sk4jR5/+31asHc
	mYT6XksmRiZTGyeWzx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnqHP-00Cufk-0g;
	Sun, 16 Apr 2023 00:30:07 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnqHM-00Cuen-16
	for ath10k@lists.infradead.org;
	Sun, 16 Apr 2023 00:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681605004; x=1713141004;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=B1V4tx4T3QLzsvFB8PvR0V6pz0RaGgfjaz2qZGU2Qpk=;
  b=bBepjMSzhONudEtioOceYoLJ2MLFcrmxZDfkrdqASxQSbNM5vygSx+S3
   ulatwMsg6YM9AVzSd1XXbS7RuCJRU8itrdyEPJww0CH4sGSPydfWUNe/7
   O+ZCEaK4RsZvCFmUq/HO0d3gfF8JlXSlJEflkEK/fhxEuDGFJFJFS0gvC
   wFxkKNRlR1/vxZ7xz1mAJGMRnzyMq7+ONXKucaLDALZWj3UQb9yLaE1Z3
   0nfDP1J74Rr3S3UXWD9uL+ksRBiFMu78lS4aLdrpivAodqEfpb3Rw/tvn
   12xL6TljklgUT83iKm8Jvc7SJpFhVZ/oK/h664OJWOijsr8F0B68ASZIy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="372565793"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="372565793"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 17:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="814345297"
X-IronPort-AV: E=Sophos;i="5.99,201,1677571200"; 
   d="scan'208";a="814345297"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2023 17:29:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnqHF-000bRJ-18;
	Sun, 16 Apr 2023 00:29:57 +0000
Date: Sun, 16 Apr 2023 08:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 c7e12f75d8658003ca0c28da82909ec4011dd4df
Message-ID: <643b4176.b9vrXhP9e50n0HZ2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_173004_397876_82E6652A 
X-CRM114-Status: UNSURE (   5.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: c7e12f75d8658003ca0c28da82909ec4011dd4df  Merge branch 'pending' into master-pending

elapsed time: 725m

configs tested: 84
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arc                  randconfig-r043-20230412   gcc  
arc                  randconfig-r043-20230413   gcc  
arc                  randconfig-r043-20230415   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm                  randconfig-r046-20230412   clang
arm                  randconfig-r046-20230413   gcc  
arm                  randconfig-r046-20230415   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r041-20230412   clang
hexagon              randconfig-r041-20230413   clang
hexagon              randconfig-r041-20230415   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
hexagon              randconfig-r045-20230412   clang
hexagon              randconfig-r045-20230413   clang
hexagon              randconfig-r045-20230415   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                randconfig-r042-20230412   gcc  
riscv                randconfig-r042-20230413   clang
riscv                randconfig-r042-20230415   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
s390                 randconfig-r044-20230412   gcc  
s390                 randconfig-r044-20230413   clang
s390                 randconfig-r044-20230415   clang
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
