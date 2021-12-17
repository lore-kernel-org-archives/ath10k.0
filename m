Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41CCC433EF
	for <ath10k@archiver.kernel.org>; Fri, 17 Dec 2021 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ObOj7sjHKMdmpA8cBzAHdND6W1altATYtxwLkCwoBA=; b=upUnzY+s7Mwi8U
	TX3SMXULMEizW+bIU+j+PFPf+KY4rlEZrnGAeNymf4Wz+iyBFsT999U0pSByIKKCiPggtz5wDrjV5
	yrz2vj9oxpkfWOcbtEQvFeG/Xb/S8MxSCOQ99koTWgvH1vbb6/eW8gFjSAAhFUiB6DvtE4jKkLGnc
	BbX6aWDN8ZvOZV+R1oU/apj6NzpOebRMy75+4JFqZJTJl4TQ64Ng5P8TUZMO3dvA8drIF48tVBD58
	RlOjMFWvLZwRuXXTl3vvoLSlBijP+BpXTvblyLM5cwr7CdPOxw9sM5lFMGe+Ij2szOXe1EWf2514O
	NYa9pM7EbZP8vpbdM64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myBSN-009pM6-Ng; Fri, 17 Dec 2021 11:31:23 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myBLR-009miS-G8
 for ath10k@lists.infradead.org; Fri, 17 Dec 2021 11:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639740253; x=1671276253;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=iMENIeXkqkb4V5dnTmM8L8BKtt7Zf+gwpuVV+GEsilM=;
 b=iKgw/0J7Mig5z2plnpQGqV+1bcCoz9C+KI9qffOmXbZkRbK8aukiSqbq
 GGyHFac4zSlFMJnKlORhXu80iJwClYRlBo7PLVbWEu11JVt4wfteqYOgP
 0Cfg23kGy+MGpkpDcOsmqwFQ8/9L3O6LGMXe8Xi2LqfbhrCWB0cpzMDJi
 KzVrcVD1anXuW1UxNh/MqTarKc3/KuWbiFQJqab+Vg3LIss9IR/tAprcx
 /AbdkFgga3Ci8O2zJF/4HiAD4Fq7lJ/iXT6MlCavdA7DzVv3SWH+jfnzA
 Fz0UzxLprDYHb7DSFb5wFPgklJ9B4z9RW3d7GswyiSBEV11fP87kaI+b1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="303111245"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="303111245"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 03:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="465093757"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 17 Dec 2021 03:24:10 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1myBLO-0004eM-3s; Fri, 17 Dec 2021 11:24:10 +0000
Date: Fri, 17 Dec 2021 19:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 51500e39dac4aa737a6cbd517d01ab800ef02c41
Message-ID: <61bc7333.7EDnzt9eXq9wL55F%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_032413_679001_7C422D2A 
X-CRM114-Status: UNSURE (   4.81  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 51500e39dac4aa737a6cbd517d01ab800ef02c41  Merge branch 'ath-next' into ath-qca

elapsed time: 1053m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211216
arm                          pcm027_defconfig
sh                   secureedge5410_defconfig
arm                             rpc_defconfig
arm                         lpc32xx_defconfig
powerpc                      makalu_defconfig
sh                          landisk_defconfig
nds32                             allnoconfig
mips                     loongson1b_defconfig
m68k                          atari_defconfig
h8300                    h8300h-sim_defconfig
sh                        dreamcast_defconfig
arm                           sunxi_defconfig
arm                         at91_dt_defconfig
sh                        sh7763rdp_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc64e_defconfig
xtensa                  audio_kc705_defconfig
h8300                     edosk2674_defconfig
arm                       mainstone_defconfig
arm                          ixp4xx_defconfig
mips                           ip22_defconfig
arm                        trizeps4_defconfig
sh                          lboxre2_defconfig
ia64                        generic_defconfig
mips                          malta_defconfig
mips                    maltaup_xpa_defconfig
microblaze                      mmu_defconfig
sh                     magicpanelr2_defconfig
sparc                            allyesconfig
h8300                            allyesconfig
arm                       omap2plus_defconfig
powerpc                    adder875_defconfig
parisc                generic-32bit_defconfig
arm                        magician_defconfig
arm                  randconfig-c002-20211216
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211216
x86_64               randconfig-a005-20211216
x86_64               randconfig-a001-20211216
x86_64               randconfig-a002-20211216
x86_64               randconfig-a003-20211216
x86_64               randconfig-a004-20211216
i386                 randconfig-a001-20211216
i386                 randconfig-a002-20211216
i386                 randconfig-a005-20211216
i386                 randconfig-a003-20211216
i386                 randconfig-a006-20211216
i386                 randconfig-a004-20211216
arc                  randconfig-r043-20211216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a011-20211216
x86_64               randconfig-a014-20211216
x86_64               randconfig-a012-20211216
x86_64               randconfig-a013-20211216
x86_64               randconfig-a015-20211216
x86_64               randconfig-a016-20211216
i386                 randconfig-a011-20211216
i386                 randconfig-a014-20211216
i386                 randconfig-a015-20211216
i386                 randconfig-a012-20211216
i386                 randconfig-a013-20211216
i386                 randconfig-a016-20211216
hexagon              randconfig-r045-20211216
s390                 randconfig-r044-20211216
riscv                randconfig-r042-20211216
hexagon              randconfig-r041-20211216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
