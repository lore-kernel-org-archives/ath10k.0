Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD78DC433F5
	for <ath10k@archiver.kernel.org>; Wed,  6 Apr 2022 22:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+npTbNFqxOT7ogaOdUbhxucGacWyLcfHULb20K5wzyE=; b=jklW8JYEElFrzN
	0wC/EAg5MZjvHFBpvd59UmqKv/scDDzNMvGIdeFTQEjrGzonhr57jkZZC2rYY5++kiBjZu0lOD+sU
	WXo5TIVz0fHegJDJLJz4l0kiExCBAnirDV6b9aF5pbX1P7JJjgd9jNcaF8XVl19d6nRJy2neOn2kW
	KlKwBYiHsxSvf9UuwAJF1qwiX/gSHsiyZfqoBZxeUyr+hURfIM1oDHIIcJ7WovqaOXpPAGCvhK+II
	8HpXjeT8lnRjlB6qcRJvtUsapr59BUEIEtv1gCqrnaQSG6OtdDA/m0d102Iy8pYnlFpU4AX94H9tn
	N2IUFvFTy2EEdwzvcKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncEAC-0088hh-Ix; Wed, 06 Apr 2022 22:30:08 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncEA9-0088hL-8s
 for ath10k@lists.infradead.org; Wed, 06 Apr 2022 22:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649284205; x=1680820205;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=WsYE8WjoWGg3LYo5sYArKW/f43r/1N+p/DSHpKpxIdg=;
 b=dMAlh6pYEJBOK7KqStQqADTTvknGVCBLGLOxrhlvhaDVc9uEUH4i1JOk
 UB6GJ82ihwocXFoc3IEdbFx2BaQm5wDCIJZaLZJv3tNRgedKwiP70Yhpp
 HGSVZzP3RGb72bjUwzl3an/ROjaaDkylnpWFqNewvjXPsjWvRF2i91ocy
 q5lkLnjgIZxeG4827mWZxrRon0cNCc8Rpd/az6jSUV0GMcKJE0YEhrOGE
 Bg4n0ZWDynniR9p4AanExIPj6rqQX6zguP5IDbc6vZ/psSMuKtrY7M4Xt
 8vbngLb2F6facKP9myeX7USYTjnQSPZaAQfRjdaDVZ6qwZ57HA90q7KrJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="260004692"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="260004692"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 15:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570766696"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 06 Apr 2022 15:30:01 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ncEA4-0004ol-NE;
 Wed, 06 Apr 2022 22:30:00 +0000
Date: Thu, 07 Apr 2022 06:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 0275fe083b56b3e4b86aa4a589e7c88b4fa0b8e4
Message-ID: <624e144f.3UiP5DvupMIwGWPX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_153005_381098_B23AF403 
X-CRM114-Status: UNSURE (   4.69  )
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
branch HEAD: 0275fe083b56b3e4b86aa4a589e7c88b4fa0b8e4  Merge branch 'ath-next' into ath-qca

elapsed time: 819m

configs tested: 124
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm64                               defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
arc                        nsim_700_defconfig
powerpc                        warp_defconfig
mips                           ci20_defconfig
arm                             rpc_defconfig
powerpc                 linkstation_defconfig
m68k                         apollo_defconfig
mips                      loongson3_defconfig
xtensa                           alldefconfig
arc                     haps_hs_smp_defconfig
sh                           se7343_defconfig
openrisc                            defconfig
openrisc                         alldefconfig
sh                        edosk7705_defconfig
m68k                          atari_defconfig
arm                           stm32_defconfig
powerpc                     stx_gp3_defconfig
parisc                              defconfig
powerpc                      cm5200_defconfig
arc                    vdk_hs38_smp_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7763rdp_defconfig
sh                               j2_defconfig
um                           x86_64_defconfig
powerpc                       eiger_defconfig
sh                         ap325rxa_defconfig
powerpc                   currituck_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            qcom_defconfig
ia64                             alldefconfig
sh                        sh7785lcr_defconfig
ia64                         bigsur_defconfig
powerpc                      mgcoge_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220406
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
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
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
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
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220406
s390                 randconfig-r044-20220406
riscv                randconfig-r042-20220406
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
arm                       mainstone_defconfig
mips                     cu1830-neo_defconfig
arm                        multi_v5_defconfig
arm                       versatile_defconfig
powerpc                      walnut_defconfig
arm                       spear13xx_defconfig
mips                           ip22_defconfig
powerpc                   microwatt_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220406
hexagon              randconfig-r045-20220406

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
