Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13F4C4332F
	for <ath10k@archiver.kernel.org>; Tue,  8 Nov 2022 02:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xJ2gPOYopKi0dw3g1PHy0PgYuHgv8fp+PjQQOCTopLk=; b=ays4ZJ1EK5bdwU
	0uoLOvf4TUy+vuVq9W3Et6/zi9QlYsrmsMQT4Fo+7XCOBS7Th7CUJ72DrakW8WCMARJVzfnPJm5fM
	wuU+ODcSm7eUvJz8F8bb1+pi6Kz9HzGw/7x5iMPkPQtenMFiMxd6vU2N/RqIMevu21g1UqSsKFif9
	fjItyOfdZKkULy8G0oR6Thsl319xQz5Y/yzme9CTU7Yo2/z8eFfFWYyBgMrC8K2KQgfw683MsUZA8
	RRgkOLGGsCOAfhQhrmm15XVIsuMfnUmm/kyse++wY9icArySs/XN5dOZYp9P6EiUhSNji9k4WGfbV
	/c5p3ZpFPaYxl7hIdnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osEIK-00207L-Py; Tue, 08 Nov 2022 02:24:56 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osEG6-001zNs-PL
	for ath10k@lists.infradead.org; Tue, 08 Nov 2022 02:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667874158; x=1699410158;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bRk+BeDaioh+HdAoF9as9zDZgqYzDgZJeUfvWiMKvEM=;
  b=ZaHuzXfBOIKHFVVNIzQVXuzGGSBum90CoC6gkJBdfMQ9YYo9I/YhRs6g
   5t5gmrGujoPmiSXvG4Y+ZlI4l6oEjdViuNBLsKw/qQclygLzovUDAdFa4
   g5CxDkkaAZzNjijN4nR6mD6iQ/XULGHdSHki4Psz27Fh3u/z4DEgCNspD
   FHOC/V7XOpNhhuB6m36Rt2+Swe0AYEnkHY1nBRzaV92Lv7HhXuDTa3cpg
   E5lT6DVj5IxXfyRxgchBRcrI14SorHfCaJsjDwv4MptvJrskCDhGhnoE2
   W0euBMglBtSquBVQuCzy5ozwUHw4H9a4hMEf3QzB93Dy4Ti0uHd1N+z2J
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="396878075"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="396878075"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 18:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="667411779"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="667411779"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Nov 2022 18:22:36 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1osEG3-0001V9-1Y;
	Tue, 08 Nov 2022 02:22:35 +0000
Date: Tue, 08 Nov 2022 10:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup-extras] BUILD SUCCESS
 f9b3b6aa0317dc4f6cffa5a7f6a6da693d93725e
Message-ID: <6369bd65.SJ307uGg6QFBj+aL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_182238_893989_34BDE60C 
X-CRM114-Status: UNSURE (   4.67  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup-extras
branch HEAD: f9b3b6aa0317dc4f6cffa5a7f6a6da693d93725e  Merge ath-next into ath12k-bringup

elapsed time: 727m

configs tested: 119
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                             allnoconfig
arc                               allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20221107
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                              defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
powerpc                       ppc64_defconfig
loongarch                           defconfig
parisc64                         alldefconfig
sh                   sh7724_generic_defconfig
x86_64                           alldefconfig
x86_64               randconfig-a006-20221107
x86_64               randconfig-a001-20221107
x86_64               randconfig-a004-20221107
x86_64               randconfig-a003-20221107
x86_64               randconfig-a005-20221107
x86_64               randconfig-a002-20221107
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a002-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
i386                 randconfig-c001-20221107
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
powerpc                      bamboo_defconfig
sh                           se7721_defconfig
sh                           se7705_defconfig
sh                     sh7710voipgw_defconfig
powerpc                        warp_defconfig
microblaze                          defconfig
m68k                        stmark2_defconfig
powerpc                      pasemi_defconfig
m68k                         apollo_defconfig
sh                            shmin_defconfig
riscv                            allmodconfig
powerpc                       holly_defconfig
arm                      footbridge_defconfig
arm                           tegra_defconfig
sh                           sh2007_defconfig
arc                    vdk_hs38_smp_defconfig
sparc                            alldefconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                    adder875_defconfig
parisc                              defconfig
arm                            hisi_defconfig
mips                        bcm47xx_defconfig
sh                        edosk7760_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc64                            defconfig
parisc                           allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221107
s390                 randconfig-r044-20221107
riscv                randconfig-r042-20221107
hexagon              randconfig-r045-20221107
x86_64               randconfig-a014-20221107
x86_64               randconfig-a015-20221107
x86_64               randconfig-a013-20221107
x86_64               randconfig-a012-20221107
x86_64               randconfig-a011-20221107
x86_64               randconfig-a016-20221107
mips                        omega2p_defconfig
hexagon              randconfig-r041-20221108
hexagon              randconfig-r045-20221108
i386                 randconfig-a013-20221107
i386                 randconfig-a015-20221107
i386                 randconfig-a016-20221107
i386                 randconfig-a011-20221107
i386                 randconfig-a014-20221107
i386                 randconfig-a012-20221107
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64               randconfig-k001-20221107
powerpc                        fsp2_defconfig
arm                           omap1_defconfig
arm                       netwinder_defconfig
arm                         palmz72_defconfig
powerpc                 mpc832x_mds_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
mips                      malta_kvm_defconfig
powerpc                     mpc512x_defconfig
mips                   sb1250_swarm_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                    gamecube_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
