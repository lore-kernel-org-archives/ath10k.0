Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F014FC7EE23
	for <ath10k@archiver.kernel.org>; Thu,  2 Mar 2023 02:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aiz97OP82IQ9YilZq46PzJMhIPJPEtFn+SsFifFk54s=; b=XZuVuiCrHtEphi
	399MdivJ9iTjeisiSzXFg6bP2ogpE2DRMKcc2uuxe1gpO+DwxOiBTQQMEmv7ENLiVSoUs1nbo3gDW
	Ha3KqmMTJMdRGH7VyrWo2f7ySgZY9OrHaSLK7/9XzHWJzWyosTQsCO2C3JOP6bjnlhv3UCEW0Xs1G
	Fm9inPj7iP/LL/wOnlmKgaL/UHC/QWMAh/0PHlJ0b2nusM4vhceqNpxtvRpsi/HLqD5m4El/9Av0O
	dMnJehRgBBA106fVmguZJOnWrKWAbbxowQj0o42/lciIxNuY19xCfPkhdN0qeGDbOzlPInOWgMyss
	xVHQX/v6YDzGSHo6+/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXYqY-000Zxo-5P; Thu, 02 Mar 2023 02:39:06 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXYqV-000ZwF-3a
	for ath10k@lists.infradead.org; Thu, 02 Mar 2023 02:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677724743; x=1709260743;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WzSK9ifU0l54j+KjLLazwChdxekVSRlkiZySdhHCsLE=;
  b=jKaGiErIhZPwXJaJRLr3ELTTYuVEp0xpZ5Uwz37eHV94vGtgu0TS+qEV
   k4n7lXUDXCxOD/wnh4tGpOXrGWnGVBAe1A3Tu05hoWPHDU5dlegm7S2i5
   V8GKXrVA7r7CtN4TFXVj+LGHkgNFIH0edMfcFcJbue6Yrg/udovAszK+s
   8QzI5Yrpc/YI5OiLOG1OM1JDePJYhdvM5GUxVQLATU22Iyc4efwftrzay
   19yOVwXASFRMhfaT2b1LoWMmPe4gWhbRVTQcJWUFuq7oJsNFb2xeaMO/+
   nCZy2usD8UZvTjmw0bgQsxDnBAetx+mWqrSxAPckNj1SQPqNbxyLvFbU5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332075695"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332075695"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 18:38:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="817811692"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="817811692"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2023 18:38:56 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXYqN-00005o-2l;
	Thu, 02 Mar 2023 02:38:55 +0000
Date: Thu, 02 Mar 2023 10:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 4a19761d41727a3057dbfd9e431a89bc183308eb
Message-ID: <64000c3c.ZLYmPGDe50N48jlB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_183903_213458_4F6E1C90 
X-CRM114-Status: UNSURE (   7.55  )
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
branch HEAD: 4a19761d41727a3057dbfd9e431a89bc183308eb  Merge branch 'pending' into master-pending

elapsed time: 727m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r006-20230226   gcc  
alpha                randconfig-r011-20230227   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230227   gcc  
arc                  randconfig-r043-20230302   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r004-20230302   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r024-20230302   gcc  
arm                  randconfig-r036-20230302   clang
arm                  randconfig-r046-20230302   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r015-20230302   gcc  
csky                 randconfig-r021-20230302   gcc  
csky                 randconfig-r022-20230302   gcc  
hexagon      buildonly-randconfig-r001-20230302   clang
hexagon              randconfig-r003-20230302   clang
hexagon              randconfig-r012-20230302   clang
hexagon              randconfig-r015-20230227   clang
hexagon              randconfig-r041-20230302   clang
hexagon              randconfig-r045-20230302   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a006   clang
i386                 randconfig-a011-20230227   gcc  
i386                 randconfig-a012-20230227   gcc  
i386                 randconfig-a013-20230227   gcc  
i386                 randconfig-a014-20230227   gcc  
i386                 randconfig-a015-20230227   gcc  
i386                 randconfig-a016-20230227   gcc  
i386                 randconfig-r032-20230227   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230302   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230227   gcc  
m68k                 randconfig-r004-20230302   gcc  
m68k                 randconfig-r011-20230226   gcc  
microblaze   buildonly-randconfig-r002-20230302   gcc  
microblaze           randconfig-r023-20230302   gcc  
microblaze           randconfig-r032-20230302   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r005-20230302   clang
mips                 randconfig-r011-20230302   gcc  
nios2        buildonly-randconfig-r006-20230302   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230302   gcc  
nios2                randconfig-r034-20230302   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r014-20230302   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r003-20230302   clang
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230302   gcc  
riscv                randconfig-r042-20230302   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r031-20230302   gcc  
s390                 randconfig-r044-20230302   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230302   gcc  
sh                   randconfig-r035-20230302   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230302   gcc  
sparc64              randconfig-r033-20230302   gcc  
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
x86_64               randconfig-a011-20230227   gcc  
x86_64               randconfig-a012-20230227   gcc  
x86_64               randconfig-a013-20230227   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64               randconfig-a015-20230227   gcc  
x86_64               randconfig-a016-20230227   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230302   gcc  
xtensa               randconfig-r005-20230302   gcc  
xtensa               randconfig-r025-20230302   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
