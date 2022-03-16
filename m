Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F7AC433F5
	for <ath10k@archiver.kernel.org>; Wed, 16 Mar 2022 05:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m95SPII/NIiPBhmvOejKVeRfl9MblhZp2//wwrRX8p4=; b=sEd6blfTm8MOmG
	WqvrO+nUdtvTrAqTnEO72DGZn0Qfq2ualaYcX/FW2b+z1ev/L9UsJg69ZcRqgG/PC3Yyhcgga58Qb
	H4Yn3e0Pa9WdfcWwrPqWwgf/gXGxX3oybSSRsIFrRjCs7qobKplNWoYbp9vt+k87Z6rUe2lSpkJlF
	8ogfaqYiPVlr4mTvgVXchiblFuP8SYAdNZwLfx1KS4/yaUEL/+7QbaT2gJ8LykI5k6iPROpJF8/J8
	Y8yJhoBJJV/tP5AIFr9qg4B2hiRs4Ykc3LRoGS5k1Z/UetxkZILnphh7LfYXDg0gZE/YoZpkYB7Rq
	eiJDPID7VSSO1Y3pjrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUM4J-00BTba-Kl; Wed, 16 Mar 2022 05:19:31 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUM4H-00BTao-3D
 for ath10k@lists.infradead.org; Wed, 16 Mar 2022 05:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647407969; x=1678943969;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=ZTrnrd5YGty5c0b6+TMdKIkjF3hI8/ZHfui4zlp+BOI=;
 b=I3O5EYCmx9nhds7w0ie/yykht/6fuhIYzW4UoI6ybplNO4zvHZ/pujTf
 okp0JfbcniCs6cdZyjGCTwBReELs33kmtLRco+0KvKIC8hE+LcbwUMzTb
 5T6zGJD4FhhYKsEFjOsYSRxLc992ruYO3isfkg7gm4QOlv+mm1vZ3WC5j
 HdYq0d6ryJ4+7DuoQMAKSpKFM+iwVbUUhTFjqV9w/OSisKWyHh/uNOdSO
 vGAdDVGpkc+0D3y0jtfhpDatY9HGSdPCTske/Wldlo+fnX/zx+mqN7iI1
 g8sPiyMocpjIlCpkqWV9vjvGJhToZOv5udpdkYgnHmqfi5ORBn+ecCF6Z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238662053"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="238662053"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 22:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="540758605"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 15 Mar 2022 22:19:26 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUM4D-000C1Y-FS; Wed, 16 Mar 2022 05:19:25 +0000
Date: Wed, 16 Mar 2022 13:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 5f0b8ad18e605cbd5ed6c12dc1f3c973463b1a78
Message-ID: <6231734c.6jdrDmcU1WqCylEr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_221929_301411_1667AF9E 
X-CRM114-Status: UNSURE (   5.65  )
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
branch HEAD: 5f0b8ad18e605cbd5ed6c12dc1f3c973463b1a78  Revert "ath10k: drop beacon and probe response which leak from other channel"

elapsed time: 770m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                 mpc834x_itx_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
mips                        vocore2_defconfig
arm                         vf610m4_defconfig
mips                        jmr3927_defconfig
xtensa                         virt_defconfig
sh                           se7206_defconfig
sh                          landisk_defconfig
powerpc                    amigaone_defconfig
h8300                            alldefconfig
sh                          rsk7201_defconfig
s390                          debug_defconfig
arm                         lubbock_defconfig
powerpc                 canyonlands_defconfig
xtensa                  cadence_csp_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          rsk7269_defconfig
arm                        realview_defconfig
mips                         mpc30x_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
arm                        shmobile_defconfig
arm                          pxa910_defconfig
nios2                         3c120_defconfig
sh                          polaris_defconfig
arm                  randconfig-c002-20220314
arm                  randconfig-c002-20220313
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220313
arc                  randconfig-r043-20220314
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220313
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220313
riscv                randconfig-c006-20220313
i386                          randconfig-c001
powerpc                      acadia_defconfig
arm                         s3c2410_defconfig
mips                        omega2p_defconfig
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
i386                 randconfig-a012-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a013-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a015-20220314
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220313
hexagon              randconfig-r045-20220314
hexagon              randconfig-r041-20220313
s390                 randconfig-r044-20220314
hexagon              randconfig-r041-20220314
riscv                randconfig-r042-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
