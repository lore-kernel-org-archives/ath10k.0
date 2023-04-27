Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D35C77B61
	for <ath10k@archiver.kernel.org>; Thu, 27 Apr 2023 03:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fYlILR1LUC61433OVyyv3DN5Rac4fWbv7Dc3cRk584s=; b=AnS/hkPfYLHBpt
	Wjh9WRlNVxw00rBlk7EXRDsp4dHIYyB2DgWLfR85IuqDdvQZVT/lBwqAR6q+wNjZcLFGVBBuFiBOh
	sTk+23sAk2Cd/IWLXkBnRMCxNWwsdrLTEtA0PRAN4FYcmaXQTWYj5GrlPqzKkxWwvITO/Mri9MHwi
	1FIkEww5FuBp9QW97yrvApkfUkLpDsIkwOqaiP4Po0tHpTFJeKrEUEOV847otjdR6NpsB3T8bwHGF
	WXkZLgsy+INyU4rVHGiilCdnnqo97FyEvChLInx/1ovaiC2qabKxhhrsluNFP+UcwOje7xWBeJiCO
	xMEQxv0+RLPXteNmJ0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prs2G-005Ka7-36;
	Thu, 27 Apr 2023 03:11:08 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prs2E-005KZS-1F
	for ath10k@lists.infradead.org;
	Thu, 27 Apr 2023 03:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682565066; x=1714101066;
  h=date:from:to:cc:subject:message-id;
  bh=YnvSwajEflYNLm2K4NiYx8AHRyCdx1fWWERoTKEqols=;
  b=IA0KBd+5hukhuFdWpPFEWzo+FQlLxyoG7ZXycpggLFoz6ftzd2F92Bmy
   iYEkn7r+7xqEFGBs9n99CizRqRxH8uhOgpr5oQbST8sAhA8r/Be7SFYiV
   I4+YSlcMcfEfiv2c8ITuHZ0uXeOTz8PG9iGDkrEwFlsSkrMxJiYiFlWa1
   kt+Wg2GP4HhOyjD//TPUFQLdV89g+wFkcJd944lMo0kvmc6hID3gb9pdZ
   JTbbbShrTRk3d0LfJmrmbp5IhmDGckXZs4+z1vcIf2mDYaW1cjtes8dbn
   h062vRWZ/QHb0ICdFegLf1dJcDf9NJmF8Wb0ufPNHbXo14VAD5rOrdSky
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="412635054"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="412635054"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 20:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="758890682"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="758890682"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2023 20:11:00 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prs28-0000gd-0u;
	Thu, 27 Apr 2023 03:11:00 +0000
Date: Thu, 27 Apr 2023 11:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 d276b90ff7f9c51e1f2f8826b7cbb3dff20a4b66
Message-ID: <20230427031000.-TV5p%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_201106_464375_26CCEE45 
X-CRM114-Status: UNSURE (   3.94  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: d276b90ff7f9c51e1f2f8826b7cbb3dff20a4b66  Add localversion-wireless-testing-ath

elapsed time: 722m

configs tested: 98
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r034-20230426   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r012-20230426   gcc  
arc                  randconfig-r013-20230426   gcc  
arc                  randconfig-r033-20230426   gcc  
arc                  randconfig-r043-20230426   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230426   gcc  
arm                  randconfig-r032-20230426   gcc  
arm                  randconfig-r046-20230426   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky         buildonly-randconfig-r001-20230426   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230426   gcc  
hexagon              randconfig-r031-20230426   clang
hexagon              randconfig-r041-20230426   clang
hexagon              randconfig-r045-20230426   clang
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
ia64                 randconfig-r006-20230426   gcc  
ia64                 randconfig-r022-20230426   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230426   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230426   gcc  
m68k                 randconfig-r023-20230426   gcc  
microblaze           randconfig-r005-20230426   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
nios2        buildonly-randconfig-r006-20230426   gcc  
nios2                               defconfig   gcc  
parisc       buildonly-randconfig-r004-20230426   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r024-20230426   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230426   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230426   clang
s390                 randconfig-r011-20230426   gcc  
s390                 randconfig-r044-20230426   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r005-20230426   gcc  
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
xtensa       buildonly-randconfig-r003-20230426   gcc  
xtensa               randconfig-r001-20230426   gcc  
xtensa               randconfig-r016-20230426   gcc  
xtensa               randconfig-r026-20230426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
