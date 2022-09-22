Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEB1C32771
	for <ath10k@archiver.kernel.org>; Thu, 22 Sep 2022 02:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TT/2SnsOL8a86AIGQohr+uuTFDgFy+FEASN2/thetnA=; b=b1ydyVNS5gQYbD
	LHRXV4GKHW1MA28bfvABo/NrxlB4J5VTRxihYSy8gNfPkB5OPgwjFCihX4bIOA7+pQ00TKI5eQCzT
	/Aj6ZwP4zSKrRRH0DVahgPyJ5a4RotzMZENrITKbYlEUin6DlnX6Y8TO5oeUjK9EJ8Tyy4NTmagqn
	zWF0nxajfbaPZQ5cPzRPm4DtA7Q9/ep4TM8rFjxif6v4zPpP8GLTDUc2NLykHw0ts28RNeK+Lz7IK
	vr8avahO5Zt99u1Tz6H60fmIyT7kGoQ+pXY+NJuW0IG0YcmYaf1IrskPHXKKJZohLGBlh1Mz3lEJV
	WkJGsGnM+UDiaz9VZq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCD1-00DAlS-0N; Thu, 22 Sep 2022 02:45:03 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCCy-00DAkE-2A
	for ath10k@lists.infradead.org; Thu, 22 Sep 2022 02:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663814700; x=1695350700;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IGvLaLrWlMGU7BDRBa+3xT87x/Nf3RzLvJtSnfFifv0=;
  b=dWv3Z0s5EWz9OolmYRBz5SZtGF6I7DTna6f3qMVOB2B0v1kYhORHOYsy
   tXlbcJf5lAjUxsrCWqXkXnQCwECP04864kAoxWaXJ2IEBBcjqLcyWnvII
   2J1Bi91eis+4TRB0Lvl3GrJF6aHU8WNv38bJsgZ1zXfa5+xEnvn5gGBq9
   gwh94h+UmrRsTeJvJ4eIZR0b3Fdy3ZUPzuEf5+8L4UObrJbFxOqBVCLlS
   tocEsNOCnFNVXL5BwIKZni/5zfxfRglnybWuR7KAfwLiQzbffzfthxtHV
   R3ba5+kb5m+lXixR9GJDREukPsYMSb7ESqQV9j3WHYuylMtEIxMfRrAUM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="287256215"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="287256215"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 19:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="745209345"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Sep 2022 19:44:57 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obCCu-0004Di-1L;
	Thu, 22 Sep 2022 02:44:56 +0000
Date: Thu, 22 Sep 2022 10:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 25fdf3ddbf5b10fa63ed2d52c138c5642ccc7199
Message-ID: <632bcbf5.DTm3uQdOHCKYtEb5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_194500_204460_C425A795 
X-CRM114-Status: UNSURE (   6.67  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 25fdf3ddbf5b10fa63ed2d52c138c5642ccc7199  wifi: ath9k: fix repeated the words in a comment

elapsed time: 724m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
x86_64                        randconfig-a013
x86_64                        randconfig-a011
powerpc                           allnoconfig
s390                 randconfig-r044-20220921
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a015
x86_64                         rhel-8.3-kunit
i386                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
i386                          randconfig-a014
m68k                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a016
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
x86_64                              defconfig
arm                                 defconfig
m68k                             allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a005
ia64                             allmodconfig
x86_64                        randconfig-a006
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220922
i386                          randconfig-c001
powerpc                      bamboo_defconfig
arm                           h5000_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
sparc64                          alldefconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
powerpc              randconfig-c003-20220921
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
powerpc                     stx_gp3_defconfig
arm                          exynos_defconfig
m68k                                defconfig
sh                 kfr2r09-romimage_defconfig
m68k                       m5208evb_defconfig
arm                        multi_v7_defconfig
powerpc                      makalu_defconfig
i386                             alldefconfig
powerpc                      ppc6xx_defconfig
powerpc                    adder875_defconfig
sh                               j2_defconfig
sh                             espt_defconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a006
x86_64                        randconfig-k001
powerpc                    gamecube_defconfig
arm                         orion5x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
