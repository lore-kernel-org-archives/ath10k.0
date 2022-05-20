Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A815C433F5
	for <ath10k@archiver.kernel.org>; Fri, 20 May 2022 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9mqwRabdlm40wGNumy09+7viLnRc63+I+l2QWQLTdc8=; b=muMqkfWA5qICk+
	yDEecT7mrXGhu8jq1sx851WgqHOEJROJCmT0aigb0d/XFxcAJDlzyqZ87GbonmLPr50I7CCG3uszI
	xJTOmgjQ74zRhD53tW8O/RSNWe3TEyyPo2mMsEDj2s4kXt5tcXRTEpduxjAgntIC2OlEGTY9Jsr+q
	FITM2zLsbzs0+pDnPxYdDeusPs7gcxVvJHu4V/2PGYYSiPu467BIrPutFzFvuM6zE7BdByb79nzkM
	ibs2MGkDbddNzh3p6oUc5MtI8nTW7/D/IUrnP8wBgGtBhuDHUctS3qzbUYLTSEp/+c+J6UotCikqI
	MfNk3xARjDU267P1goyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrzsG-00BtNF-CA; Fri, 20 May 2022 10:28:48 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzsC-00BtMe-EG
 for ath10k@lists.infradead.org; Fri, 20 May 2022 10:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653042524; x=1684578524;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=dlFN84nuFErptOL93zPk2Ia3MYrW+CcH0LYAPZdYl3E=;
 b=KEaL1kCsX9tyf1DYuTTcEdjC+RfS0u3IFLVWNK4q6JmjNn5aIU9yhN8c
 WzMVy+2ya6ouL1dRfscwmdrs5sezyD12/WUT9mnjmFp6yPrAlZ+32VQrL
 z57ZmAMfq+uyTIyzB21DlVTBoC15XuYU0xtNhW7OCUPZ8eZ9belHoCpdB
 3TgNVcSCUzp6i/CQ8M4zgkA9Qtd3VokuVfegX/x+udmjzbYItYERYCx1U
 sUmgFptFVym497xYGisTqTRQVjv/3gehkGl6mfJcf2ssydnmkiVYplEUQ
 gdQ+61eEkWLfe+/ZcjhcQMjdh0v0ltY5Ysa6w1JFhBKV5wIhd8H4hALXf w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="358970692"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="358970692"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 03:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="546614496"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 20 May 2022 03:28:41 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrzs9-0004bz-0m;
 Fri, 20 May 2022 10:28:41 +0000
Date: Fri, 20 May 2022 18:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 e9c0577bf4de3149e1afaad7153f06b737eaa2d0
Message-ID: <62876d41.R10vuTEKYUbkoPpW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_032844_844409_3F2AD014 
X-CRM114-Status: UNSURE (   4.26  )
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
branch HEAD: e9c0577bf4de3149e1afaad7153f06b737eaa2d0  Merge branch 'pending' into master-pending

elapsed time: 3050m

configs tested: 128
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
parisc                           alldefconfig
powerpc                 mpc834x_mds_defconfig
mips                            gpr_defconfig
h8300                    h8300h-sim_defconfig
sh                   sh7770_generic_defconfig
powerpc                      pcm030_defconfig
arm                          badge4_defconfig
powerpc                     asp8347_defconfig
mips                           ci20_defconfig
nios2                         10m50_defconfig
sh                     sh7710voipgw_defconfig
ia64                      gensparse_defconfig
xtensa                    smp_lx200_defconfig
arm                        realview_defconfig
xtensa                       common_defconfig
alpha                               defconfig
ia64                             alldefconfig
sh                             shx3_defconfig
arm                      footbridge_defconfig
sh                          sdk7786_defconfig
mips                 decstation_r4k_defconfig
um                             i386_defconfig
m68k                          hp300_defconfig
mips                         mpc30x_defconfig
sh                   secureedge5410_defconfig
sh                   rts7751r2dplus_defconfig
sh                          urquell_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220518
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a001
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220519
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
s390                 randconfig-c005-20220518
powerpc              randconfig-c003-20220518
x86_64                        randconfig-c007
riscv                randconfig-c006-20220518
mips                 randconfig-c004-20220518
i386                          randconfig-c001
arm                  randconfig-c002-20220518
powerpc                      acadia_defconfig
riscv                          rv32_defconfig
powerpc                   microwatt_defconfig
powerpc                   bluestone_defconfig
arm                          ixp4xx_defconfig
powerpc                  mpc866_ads_defconfig
mips                           rs90_defconfig
arm                         socfpga_defconfig
arm                         palmz72_defconfig
mips                            e55_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220519
riscv                randconfig-r042-20220519
hexagon              randconfig-r041-20220519
s390                 randconfig-r044-20220519
hexagon              randconfig-r045-20220518
hexagon              randconfig-r041-20220518

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
