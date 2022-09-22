Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F421C32771
	for <ath10k@archiver.kernel.org>; Thu, 22 Sep 2022 02:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KG5KD/pdJY/JIrDAl9CDD5tboUpH4LRCvnspGRLWUaM=; b=USH/6rzuP4S1tm
	IqqhX2Lvpr/3IdT45EhTkIN7RMVxPnU4Ih9OlD6d8Cpz9YNsY6xPpvPLElcqsMdVZUkxMoo9oprnG
	tNugFysz4kT6632+u/Or97mKNPMGmt+/VAQB3+Y7wnWzvHDRGQsYn+BiNLmxxLwgZUkXPe454aZpT
	0HdSmh5gttec8hd/qh6h/KCx684Lg8MO5sPiPAZyvEbYoYqqdO5rqXfh+8XttAR43qb7onm6J9igE
	c5N1CjAGyIlkGChImYGGusilYO6X0d9+LXpRz2bx2KXFOdYe/hmlOu2NEcKUBT6Yk4LU3W5gM18IL
	1ygLFML20G9NXit7hmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCD2-00DAle-GX; Thu, 22 Sep 2022 02:45:04 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCCy-00DAkF-Ds
	for ath10k@lists.infradead.org; Thu, 22 Sep 2022 02:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663814700; x=1695350700;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pRaSl4FSm6tHu3tQVQ0th+nnxMrfzLafyfA4xffDspE=;
  b=FTC+n7ojlBTG6VlfXP2G2KD3t465eiapMvA1Sdi8Ji4gzwqosgtBg5wf
   On3gTKGXSt6rT8ZJUmrTWtnffI4hf4TkLt0Z+Sauz940RxXUABCVL7GyT
   OYM6htU2dfXg/Hg1KSX8rxk2PSWkAHpTaRI+6pQtryFDP1IG3kvj6zlqI
   imSzyzZ4W/2sqXbxbfcA4xPUJdotWzBJNCQnlpcVA4TlLiddNf7GZxcF2
   4csw+XY5OrHmLDXd9Fqc1YcLQT8Tklrfz0RbOZ1Gnk7sE9DSzG0FvTLOV
   ibDZycQFuZHiqXD+XOf3ilZFdyWVmfyaAXWs5fJsvrGg932+eQojq8goB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="301584532"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="301584532"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 19:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="762006929"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2022 19:44:56 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obCCu-0004DQ-0d;
	Thu, 22 Sep 2022 02:44:56 +0000
Date: Thu, 22 Sep 2022 10:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending-deferred] BUILD SUCCESS
 2796be97f93dc8f30bf8b3de3f6dca11a8fb9763
Message-ID: <632bcbfc.zcKfbr+fsQuPjM5K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_194500_533066_D0F888D8 
X-CRM114-Status: UNSURE (   6.15  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending-deferred
branch HEAD: 2796be97f93dc8f30bf8b3de3f6dca11a8fb9763  wifi: ath10k: Delay the unmapping of the buffer

elapsed time: 723m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
s390                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
powerpc                          allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
x86_64                        randconfig-a013
powerpc                           allnoconfig
x86_64                        randconfig-a011
i386                          randconfig-a005
s390                             allyesconfig
x86_64                        randconfig-a015
arc                  randconfig-r043-20220921
x86_64                        randconfig-a004
sh                               allmodconfig
x86_64                              defconfig
riscv                randconfig-r042-20220921
i386                          randconfig-a014
x86_64                        randconfig-a002
arm                                 defconfig
s390                 randconfig-r044-20220921
i386                                defconfig
x86_64                               rhel-8.3
i386                          randconfig-a012
ia64                             allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a016
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
powerpc                      bamboo_defconfig
arm                           h5000_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
sparc64                          alldefconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220922
i386                          randconfig-c001
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
m68k                       m5208evb_defconfig
arm                        multi_v7_defconfig
powerpc                      makalu_defconfig
powerpc                     stx_gp3_defconfig
arm                          exynos_defconfig
m68k                                defconfig
sh                 kfr2r09-romimage_defconfig
i386                             alldefconfig
powerpc                      ppc6xx_defconfig
powerpc                    adder875_defconfig
sh                               j2_defconfig
sh                             espt_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
i386                          randconfig-a006
x86_64                        randconfig-a016
i386                          randconfig-a013
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220921
i386                          randconfig-a011
hexagon              randconfig-r045-20220921
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a003
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
