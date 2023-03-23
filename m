Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CE7C6FD1D
	for <ath10k@archiver.kernel.org>; Thu, 23 Mar 2023 06:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TQwQ+AAm56v2cRMYV8MkShrwQsf67K4KsvIrbrjn0Js=; b=ZHJi6p7GtXkuzm
	R8PUB8jbJ6EDJ6mrKJp9sE+iBzSD0jexIzfVNXyxNiYAFTvDykr02wxliTxf5Of8z3qkbqaI+7ZI9
	Iq5vrOZQVSFEHM7STJjQ2hChT4+/fqmehPWY98aCe96JSHPVVqmgSAjm5JwWk2yfU4DZh8B+Ec9dc
	ksx3qqPZ6rMGLWzAHebYVNJAVaFfMEFrnTi+L8k0WFM040/V3alV+CphlggmReypVo/8UUhtVOPZ3
	k5IbvpBiy6sTrrBUljqIFmLvetdoQFX0JYYhSs7qMAgjzJ/nUi+CzYPuL6x5H8v9dSnvnGGakq3GO
	nqdee7FqhnwbfiL+obTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfERs-000zbJ-33;
	Thu, 23 Mar 2023 06:29:20 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfERq-000zZw-1k
	for ath10k@lists.infradead.org;
	Thu, 23 Mar 2023 06:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679552958; x=1711088958;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d8dAalWLn/M2Zpj+myIl4VOPn/eOARIrmrvhOeNaP/Y=;
  b=g/VMH6j3p40CFLkui45uVD2kRMepYmaK+EiueaNOOndbD4z+Mu0DZfkc
   w6jAVT0XjimseAfvyiRnLbX742/pndsLQcUjOR5rGsvDftFJK7vBHoNN4
   1EuKAlq9e7XrdTYyOrudxktwmod+D+OU0tWzcv+njYZ4iLlOJobBYWTWL
   1kkmBNtquh29grrF31yj1rsWc6Sw+cOOJa4lbUPGTdUHXS02eAT1v7nDv
   l8mwzVoHVC7yD6ABuy4S5ztjASMxljmqv9BqglJlIGFacetaWbLXmtmLm
   ZcuNGIVmrfYQvSBAf11pkzzOLnbCXBO2jekEyNQgFfOSicx36BF8IKfIx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340946962"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="340946962"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 23:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714680963"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="714680963"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Mar 2023 23:29:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfERk-000E3y-30;
	Thu, 23 Mar 2023 06:29:12 +0000
Date: Thu, 23 Mar 2023 14:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 e240b49ac61124ffc5b421a8cf0594490815505e
Message-ID: <641bf1b4.r/P6wLkzEMM7jFK/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_232918_671909_E3EBB676 
X-CRM114-Status: UNSURE (   6.41  )
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
branch HEAD: e240b49ac61124ffc5b421a8cf0594490815505e  Merge branch 'pending' into master-pending

elapsed time: 731m

configs tested: 97
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230322   gcc  
arc                  randconfig-r033-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230322   clang
arm                  randconfig-r023-20230322   clang
arm                  randconfig-r025-20230322   clang
arm                  randconfig-r046-20230322   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230322   clang
arm64                randconfig-r004-20230322   clang
csky         buildonly-randconfig-r001-20230322   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r015-20230322   clang
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
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
loongarch            randconfig-r032-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r004-20230322   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r006-20230322   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r026-20230322   gcc  
openrisc             randconfig-r012-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230322   gcc  
parisc               randconfig-r034-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230322   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230322   gcc  
s390                 randconfig-r035-20230322   clang
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r006-20230322   gcc  
sh                   randconfig-r024-20230322   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r001-20230322   gcc  
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
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
