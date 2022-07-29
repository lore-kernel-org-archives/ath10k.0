Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB322C00140
	for <ath10k@archiver.kernel.org>; Fri, 29 Jul 2022 00:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7uJ4bjB7IJ8C+Qqk55ughg5JamBOJjE8b/8wmGpZysc=; b=qLs4oBABtiYZ7r
	3Qk4FLUIz3AMjRDOksSNQ6jr2sk7HnoIT47j+yB5YLm7m0C4yqujClYuER8bEShz+GadPbcVhoXhF
	4Inpdq4HsdTll07B+Av2z+fWFzqYiQjk1liOgSnWucmAgyZZmxgd5y24zFnGA3diQwKDL6EK83YyB
	SnwAuI9stVNMJ5j4EzS+mfh8YLxAPvhTxePTvPi4OQV8Thgru8tmzYD5CW7vVIaiSSWgZi9YNfU+j
	BAPPkCKmRzxuHXuPSzCPb/983f+fk0M35oJMJ6CvXiflt5Ok0CiXFCfadadSS0bdYUwsNpzEoBT5/
	TqEWQUFipjeKQWhhdpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHEIT-00GeWZ-Px; Fri, 29 Jul 2022 00:56:09 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHEIQ-00GeVL-1P
	for ath10k@lists.infradead.org; Fri, 29 Jul 2022 00:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659056166; x=1690592166;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q2rVWkP8+B1ZT3WJ/8gXasyHO3EvoalGoSsb7vdb74Y=;
  b=kN25HBwbcmx1SotYaHrrT7Ucrr4jg8+LMXJQ7jcXgqe0tzw25Fmuvk98
   m0pPDAW8GIMRXVUolJYeDwMQDAfct9xiKEqGEr99+PUgZnEKRV/UMLRBG
   mws9T9sVKbkqjQpIQ+iWpIEzj4+7T0zeEFX6D+u0zHc8lqKFjMg3ejgsD
   K/HAQhkcxj5+2j683hKmIl42aV8prT72l9j6Mk4XKIjozEuFK5hGBxDmm
   +xan2C7p9iCrtYuaSX+fbRJzR46nIGJi5ni9M8vjNWdHc59fmQztwE5FS
   mIKBHYYwRW52gYjNAi+Gn5V1yOVoy+M7w/MMZeyoyb8h3iCQvyS0l7xMT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="374963622"
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="374963622"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 17:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,199,1654585200"; 
   d="scan'208";a="633951244"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jul 2022 17:56:02 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHEIL-000AoA-1H;
	Fri, 29 Jul 2022 00:56:01 +0000
Date: Fri, 29 Jul 2022 08:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 d70a25b99c09cecdf64bbfa92fdc57132de8ea6e
Message-ID: <62e3300e.qe9G1OeAs6BUvH8w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_175606_164945_AB87C890 
X-CRM114-Status: UNSURE (   5.92  )
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
branch HEAD: d70a25b99c09cecdf64bbfa92fdc57132de8ea6e  wifi: ath11k: Add spectral scan support for 160 MHz

elapsed time: 798m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
powerpc                           allnoconfig
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                                defconfig
i386                          randconfig-a016
i386                          randconfig-a001
x86_64                        randconfig-a015
i386                          randconfig-a003
i386                          randconfig-a005
i386                             allyesconfig
arc                  randconfig-r043-20220728
riscv                randconfig-r042-20220728
s390                 randconfig-r044-20220728
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a004
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a006
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
i386                          randconfig-c001
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
ia64                        generic_defconfig
sh                           se7343_defconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
xtensa                  cadence_csp_defconfig
mips                           ip32_defconfig
arc                            hsdk_defconfig
sh                 kfr2r09-romimage_defconfig
sh                     sh7710voipgw_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
m68k                        m5407c3_defconfig
powerpc                     taishan_defconfig
sh                         ap325rxa_defconfig
powerpc                      tqm8xx_defconfig
arm                          lpd270_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                 randconfig-c004-20220728
powerpc              randconfig-c003-20220728
nios2                               defconfig
m68k                            mac_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a015
x86_64                        randconfig-a014
i386                          randconfig-a004
x86_64                        randconfig-a016
i386                          randconfig-a006
hexagon              randconfig-r045-20220728
hexagon              randconfig-r041-20220728
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
powerpc                 mpc836x_mds_defconfig
riscv                             allnoconfig
x86_64                        randconfig-k001
powerpc                     tqm5200_defconfig
powerpc                        fsp2_defconfig
powerpc                      katmai_defconfig
powerpc                   microwatt_defconfig
powerpc                      ppc64e_defconfig
mips                          rm200_defconfig
arm                  colibri_pxa270_defconfig
arm                      pxa255-idp_defconfig
powerpc                  mpc885_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
