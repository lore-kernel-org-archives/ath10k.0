Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92A4C433EF
	for <ath10k@archiver.kernel.org>; Wed, 13 Apr 2022 12:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aj3A2oGTp8GFvadsBaeoArs4FcU+D1uvQP+/HyxaLck=; b=e/oaJve6bdOyzL
	iN8HPwJAttMuKc+bgh4LvP00KtGMCOBgza1UqJjua4ZnVd86b14dCrKAhx5zXMTB8ZziNSAcBxNSf
	SDaKCXhhxQkqjpZpKZIviJU8vLpnzNguHL+ubU26jEoOpvrONJ6iTSh3NAKyzilQXlg01kj6TanCB
	DXvG6TBi14rFP77Zcut5skxHbySgDDhRDbQixDN624MDAkNP1vlUrIbKlMD7PB1R/prM42SpHsZq5
	weeGvkxKujZWBTORue7GQ8FSN3nDQdDA2QuH9QAj6ltvVYmgSGRNfG2rTa2m5eFSmFDE5XV8UC/Up
	6t/XTNl9uAeSmtx7nc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nebqE-000wBY-Sc; Wed, 13 Apr 2022 12:11:22 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nebq9-000w98-Uk
 for ath10k@lists.infradead.org; Wed, 13 Apr 2022 12:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649851877; x=1681387877;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HnMU8kvNk3cTdtYX0G60XR3dR7vqU/Sq1zlGM9gWoxw=;
 b=XD40S08JakMLpRQP+e0kWI7ru44JQvIQe4JtZG0bx48CTQVk9vLIlEJk
 f4xsfyEIBKiGMowCUUJ3OnvUFicEhxY6x557GgZiuYDZBNNGnfNDYkhMl
 1g3cxS1lVpxRu4hiMIJ/BmdEIJskZvj6VNbecxbPTVGVpl1D9Nau9NRVE
 o4HTuKtBb6byvUBO9i9E/wUw6le7jKE4UjmjKZwQZHFCHa2TevNAnGvlP
 tf+4+PBYoi5IKwkN5Nf78agwuIJ3VEKKLApMpQifYJxp5Ewyp+4XIUun4
 AvEBI+Gex3R5kOJeF/gOxozmdGFx5J2oA0RKrT36GnJn4JP1eIgHKrvWv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="242583192"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="242583192"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 05:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="559725979"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2022 05:11:14 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nebq6-0000Gn-9L;
 Wed, 13 Apr 2022 12:11:14 +0000
Date: Wed, 13 Apr 2022 20:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 c9a8efc35304a89fc0751649945909caf03eeb29
Message-ID: <6256bdbf.kJdfO0ebS/WSjAuW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_051118_059993_4F96E730 
X-CRM114-Status: UNSURE (   4.35  )
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
branch HEAD: c9a8efc35304a89fc0751649945909caf03eeb29  wil6210: use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()

elapsed time: 1130m

configs tested: 142
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                           ci20_defconfig
arm                        cerfcube_defconfig
sh                   sh7770_generic_defconfig
powerpc                       maple_defconfig
arc                    vdk_hs38_smp_defconfig
sh                           se7750_defconfig
powerpc                      makalu_defconfig
powerpc                       eiger_defconfig
powerpc                       holly_defconfig
s390                       zfcpdump_defconfig
h8300                       h8s-sim_defconfig
s390                          debug_defconfig
arm                          badge4_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      ppc40x_defconfig
arm                          pxa3xx_defconfig
sh                           se7721_defconfig
um                           x86_64_defconfig
arc                            hsdk_defconfig
arc                     nsimosci_hs_defconfig
riscv                            allmodconfig
xtensa                           allyesconfig
sh                        dreamcast_defconfig
ia64                      gensparse_defconfig
sparc                               defconfig
powerpc                   motionpro_defconfig
arc                     haps_hs_smp_defconfig
parisc                           alldefconfig
arm                            zeus_defconfig
arc                        vdk_hs38_defconfig
arm                       aspeed_g5_defconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc834x_mds_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220413
i386                 randconfig-c001-20220411
x86_64               randconfig-c001-20220411
arm                  randconfig-c002-20220411
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
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
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                 randconfig-a015-20220411
i386                 randconfig-a011-20220411
i386                 randconfig-a014-20220411
i386                 randconfig-a016-20220411
i386                 randconfig-a012-20220411
i386                 randconfig-a013-20220411
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220413
arc                  randconfig-r043-20220413
s390                 randconfig-r044-20220413
arc                  randconfig-r043-20220411
riscv                randconfig-r042-20220411
s390                 randconfig-r044-20220411
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220413
arm                  randconfig-c002-20220413
i386                          randconfig-c001
riscv                randconfig-c006-20220413
mips                 randconfig-c004-20220413
mips                      pic32mzda_defconfig
hexagon                             defconfig
powerpc                      ppc44x_defconfig
powerpc                        icon_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                      obs600_defconfig
arm                      pxa255-idp_defconfig
powerpc                      walnut_defconfig
x86_64               randconfig-a001-20220411
x86_64               randconfig-a002-20220411
x86_64               randconfig-a005-20220411
x86_64               randconfig-a003-20220411
x86_64               randconfig-a004-20220411
x86_64               randconfig-a006-20220411
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a003-20220411
i386                 randconfig-a005-20220411
i386                 randconfig-a001-20220411
i386                 randconfig-a004-20220411
i386                 randconfig-a002-20220411
i386                 randconfig-a006-20220411
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220411
hexagon              randconfig-r045-20220411

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
