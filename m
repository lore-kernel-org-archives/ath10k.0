Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3F4C433F5
	for <ath10k@archiver.kernel.org>; Sat,  2 Apr 2022 05:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/w47xOtfTCUz1K/t6l1Z8dzMtytNIbq1Nm0/h+v5pU4=; b=J+amkgQafVhwPw
	Sq6iQqbcXpG0uYcrShcxG1rF2CL+ol4pm/Ap9oH/U80DuYc85VLUMClMtlWQDAHpoBvBAJ+YNWB3p
	HqypA1GVx+b89pmAAAcNGaSxZXO3NQq2r4OxY1741HMFdmRZmEbKmRJzVmfvq429tBmk3fkzR7gnZ
	zEto7rY1bEMh7XakVBrYGGach0qD4yX75gLsbKa7QFAEMK23KpCSIgxrlb6PZFZxQVxYgV+wPBGev
	YEhj2ytyzZnMDRnuqiU3oat7riSKcpx/zTGmyjgR9Tfq1rmwWZ8GubIn9TkZpt4zHU2vjytDlxu00
	uMtWrNHAuXYwqL5s70dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naWQR-0086z1-Du; Sat, 02 Apr 2022 05:35:51 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naWQN-0086y1-6Z
 for ath10k@lists.infradead.org; Sat, 02 Apr 2022 05:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648877747; x=1680413747;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=8Lby0dbXE+fjcjB0lZ042DAimAMjwnfcf50m8bH4//U=;
 b=GravkZ3SJayAAi8+sNcc7Fqngk7+cA3Fl2KHYRpt9MV6eB+9Rn3yKSs+
 7n1VgmKZM7mPYFDBAm8G2qGR/a5Xu4Cs2XX5MNfssl9dyuUUnBlIqMLU/
 vkt8MfS/H9BrZPWaB2nH0c45R3ShptQVxxpupGDjPSH9WcIuXyH1lXtrU
 j953BT6KvSHMDjXhXl4JZqCLcM1ZvZFZhfXroYB+73FGOyS8GBrsp5JSu
 Z+1au0i2Tz3z+v/Y/AEr/voHLq8dOSKHpwGIhWlBoNuy6fCuILrDXfuqc
 MIyJ9Ajqgmfy/sdJ3k8N+yrKL5AbVuTrxuwcc3+q7mTK789hnNuC7ilUa Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="259978532"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="259978532"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 22:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; d="scan'208";a="523014984"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2022 22:35:35 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1naWQA-0001lW-9y;
 Sat, 02 Apr 2022 05:35:34 +0000
Date: Sat, 02 Apr 2022 13:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 780834d203de34972689c294eab66ccd6dc1529e
Message-ID: <6247e082.46spS8u4IkE6D/5D%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_223547_358408_DF923A6E 
X-CRM114-Status: UNSURE (   5.27  )
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
branch HEAD: 780834d203de34972689c294eab66ccd6dc1529e  ath11k: Add support for SAR

elapsed time: 927m

configs tested: 117
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
arm                         lubbock_defconfig
m68k                          atari_defconfig
m68k                        m5407c3_defconfig
arm                          pxa3xx_defconfig
microblaze                      mmu_defconfig
arm                             pxa_defconfig
arm                          simpad_defconfig
mips                  decstation_64_defconfig
arm                            qcom_defconfig
arm                            pleb_defconfig
sh                   sh7724_generic_defconfig
um                               alldefconfig
powerpc                      pasemi_defconfig
sparc64                             defconfig
powerpc                      mgcoge_defconfig
openrisc                  or1klitex_defconfig
powerpc                     redwood_defconfig
mips                      loongson3_defconfig
sh                                  defconfig
arc                     haps_hs_smp_defconfig
m68k                          multi_defconfig
openrisc                 simple_smp_defconfig
arm                  randconfig-c002-20220331
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220331
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220331
x86_64                        randconfig-c007
s390                 randconfig-c005-20220331
arm                  randconfig-c002-20220331
riscv                randconfig-c006-20220331
mips                 randconfig-c004-20220331
i386                          randconfig-c001
arm                         mv78xx0_defconfig
arm                         palmz72_defconfig
arm                            dove_defconfig
arm                           omap1_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220331
riscv                randconfig-r042-20220331
s390                 randconfig-r044-20220331
hexagon              randconfig-r041-20220331

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
