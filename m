Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CED9ECAAD8
	for <ath10k@archiver.kernel.org>; Fri, 16 Sep 2022 22:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ntZesVXiF7WUEJOuXqFdTnZBc1RNEyBBbXjsSiKeY4=; b=Cw2oqDknhjWwQ9
	8LQ0DQeumzBumkimqkC07WWDbzuNlqeIraWahpcotaQNThCDTuqd67GQOgwdYO5xG97dpPvdNGHQU
	/W6id0I57tJbcJpUgI/yE4m1YOPOSVqZTya8xX5SiwFMxcODAtxqGsOg999kZmSNeY4ROQOaNXN3a
	hvdjMI143U8kPpXQvbZ/R5y1ugfYADriovJHrqXWNGMic9/4RR2zgIerhgeWUzJ2/Qpkr7b0G04M7
	4S63L3eGlWppyPZIeEQROO9cEuUMRSzbQBz7gmshAXeLLI1Mn5JaZCpISz/4W4eMPowxXNBLkgqnU
	bXFX5w2gNSFOfgCmmc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJR5-00HRes-W2; Fri, 16 Sep 2022 22:03:48 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJR2-00HRcI-FU
	for ath10k@lists.infradead.org; Fri, 16 Sep 2022 22:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663365824; x=1694901824;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=x0pIXqfSQNpPSzVwCiGNIvCvMDY6jJa+Bxnt5UO+wbM=;
  b=OrcJLIRLYi+vLCdJndr2ErFDL8sSBm/5/5j+7R6uMe5qfWxMtKcTNXqP
   qiCGFuKpLfPdaGWLgPQ1mAaRwa7Ufk46i0jx1MlQGR9EfOwE9iRvaIRn0
   tcMiAgT93JOyXwixQKB0p4ahsa0AADNSF8+kgeKSgA8/4p19mZRVlvmxD
   i9PTd6KjlPwbAdndVWo+Z2urTJ+f1Dy8CDttiNI7PSKjX2dxYBvyUvsvB
   wZNu6eVJ4baM0V5fsOPZjXR/LVenpRdL8MNy5wDRD3DpLJ4/CG6JoD1xx
   HCGnBUeoeWTVp3WhtE3ShmQHgnfVggMNDMggp+/DuYi9yoILOINUyo1HW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="325365748"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="325365748"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 15:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="568977406"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Sep 2022 15:03:40 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZJQx-0002Ay-2q;
	Fri, 16 Sep 2022 22:03:39 +0000
Date: Sat, 17 Sep 2022 06:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 85aa1815f5acdf0cf2fedba022a4944db83cd720
Message-ID: <6324f2b3.fuZpinlsLbLvBD0B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_150344_679890_920D2DD8 
X-CRM114-Status: UNSURE (   6.72  )
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
branch HEAD: 85aa1815f5acdf0cf2fedba022a4944db83cd720  wifi: ath11k: Include STA_KEEPALIVE_ARP_RESPONSE TLV header by default

elapsed time: 726m

configs tested: 111
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
arc                  randconfig-r043-20220916
x86_64                           allyesconfig
arc                                 defconfig
alpha                               defconfig
i386                                defconfig
s390                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a001
x86_64                        randconfig-a015
s390                                defconfig
i386                          randconfig-a003
arm                                 defconfig
i386                          randconfig-a005
s390                             allyesconfig
mips                             allyesconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
x86_64                           rhel-8.3-kvm
i386                          randconfig-a016
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-a014
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220916
mips                        bcm47xx_defconfig
arc                           tb10x_defconfig
arc                          axs101_defconfig
openrisc                       virt_defconfig
mips                      maltasmvp_defconfig
arc                 nsimosci_hs_smp_defconfig
loongarch                           defconfig
sh                         ecovec24_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
arc                        nsimosci_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            hp6xx_defconfig
powerpc                   currituck_defconfig
mips                     loongson1b_defconfig
powerpc                      bamboo_defconfig
arm64                               defconfig
powerpc                      pcm030_defconfig
sparc                               defconfig
powerpc                      pasemi_defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
arm                       omap2plus_defconfig
powerpc                      chrp32_defconfig
openrisc                 simple_smp_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
hexagon              randconfig-r041-20220916
riscv                randconfig-r042-20220916
hexagon              randconfig-r045-20220916
s390                 randconfig-r044-20220916
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
arm                          sp7021_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     mpc512x_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
