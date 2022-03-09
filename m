Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FDFC433F5
	for <ath10k@archiver.kernel.org>; Wed,  9 Mar 2022 06:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yIVAu88RmTNoZp0XECuaIR91Y7/NZNknhW8J2cBFWTY=; b=VQOleWEmz0M93e
	1mtE1Kkt8I5C3xkhBePlmGSDGchLxgrxzqtXKdTceqc5w8Suk7xvGrgxfQzOzuFkjKwOyyBQDFNq2
	LbYWAGRm3LI1vIQ05YvLW/gs/zO+jiupIgciPiI6eW1dGMFbxv+4KV7xSRJNJJo1XfWbQzNJNkOS4
	avJhld/pfz7wwIHGZOfxSgP+prDnXqIgozUPHpLc1Rt3JXYqq7O+8NVj8GYrsQxxVad2Dh792G5Hr
	AnLaSxVbpET27oj8saaXXMNnrrHT3nnfmUmDGlFljJBuZ6fux1sGvx9uKHiDPx7Q8Oobvxs9EgMOm
	pFnBXmmBcxgkoWrg5CQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRq0L-007X3S-Ll; Wed, 09 Mar 2022 06:41:01 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRq0I-007X39-Gx
 for ath10k@lists.infradead.org; Wed, 09 Mar 2022 06:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646808058; x=1678344058;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Aul3tZSF/eHIHjvXh+wpUbt1dF9/gMdkwpvtADrIPp8=;
 b=EjlBdXM4UZ/i56GJ7pXXkTFqeA6swtdKHtocUXcV5ZcUD4Sc7hHR69Bc
 0TKi0mhgQHKfU8atzkkJtK05zSwL7Y76cHBmm8LA9uQuR9MStCH7/pYbS
 zR9LnJDTipi6eY7w0Ayt0vIHE0OqFKoifOUqM58KkVjefFQVkdCUoJ05v
 FI7rwaSK1yJyxfzayYef/7PgZIOn8At6uUulbLTbrerE8Wa43m0E7GXSw
 KRsHjiMRFNDyNMWO019+AH0Gi8tcVE6yirCdXEu96hOEMPqBUt35/ABl7
 33znM3V5gfJTXnfvPl7wX7wQlTqzn2Vd8HO57YQPtv/6xmqK8g48E8Sh9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="279626341"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="279626341"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 22:40:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="814618576"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2022 22:40:56 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRq0F-0002lK-Hd; Wed, 09 Mar 2022 06:40:55 +0000
Date: Wed, 09 Mar 2022 14:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 e63dea207b778f7f968d8fddb3727835f9ddb0b3
Message-ID: <62284bbe.ZB3paxHa7/42Pbb1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_224058_643789_4F6800B7 
X-CRM114-Status: UNSURE (   5.83  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: e63dea207b778f7f968d8fddb3727835f9ddb0b3  Add localversion-wireless-testing-ath

elapsed time: 2017m

configs tested: 165
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
i386                 randconfig-c001-20220307
alpha                            alldefconfig
arm                      footbridge_defconfig
m68k                           sun3_defconfig
powerpc                    klondike_defconfig
sh                   secureedge5410_defconfig
openrisc                 simple_smp_defconfig
m68k                          multi_defconfig
sh                          landisk_defconfig
sh                          urquell_defconfig
mips                           ip32_defconfig
sh                          rsk7269_defconfig
mips                             allyesconfig
powerpc                       ppc64_defconfig
sh                              ul2_defconfig
m68k                          sun3x_defconfig
csky                                defconfig
mips                       bmips_be_defconfig
ia64                            zx1_defconfig
sh                           se7750_defconfig
xtensa                  cadence_csp_defconfig
arc                          axs101_defconfig
mips                        bcm47xx_defconfig
m68k                        stmark2_defconfig
sh                        edosk7705_defconfig
nios2                         3c120_defconfig
sh                          r7785rp_defconfig
parisc                generic-64bit_defconfig
powerpc                     rainier_defconfig
arm                          pxa3xx_defconfig
arm                           sama5_defconfig
arc                            hsdk_defconfig
sh                ecovec24-romimage_defconfig
mips                      fuloong2e_defconfig
m68k                          atari_defconfig
mips                    maltaup_xpa_defconfig
ia64                             allmodconfig
powerpc                     asp8347_defconfig
ia64                          tiger_defconfig
xtensa                       common_defconfig
arm                           viper_defconfig
sh                           se7343_defconfig
h8300                       h8s-sim_defconfig
um                               alldefconfig
powerpc                 mpc834x_itx_defconfig
m68k                       m5249evb_defconfig
arm                            hisi_defconfig
riscv                               defconfig
sh                           se7206_defconfig
xtensa                          iss_defconfig
powerpc                     sequoia_defconfig
arm                        mvebu_v7_defconfig
arm                             ezx_defconfig
parisc64                            defconfig
parisc                           allyesconfig
mips                      maltasmvp_defconfig
sh                           se7751_defconfig
sparc                            allyesconfig
arm                           h3600_defconfig
x86_64                           alldefconfig
sh                  sh7785lcr_32bit_defconfig
arm                  randconfig-c002-20220308
arm                  randconfig-c002-20220307
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a002-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a006-20220307
x86_64               randconfig-a005-20220307
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a005-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a003-20220307
i386                 randconfig-a006-20220307
i386                 randconfig-a002-20220307
i386                 randconfig-a001-20220307
i386                          randconfig-a016
arc                  randconfig-r043-20220308
riscv                randconfig-r042-20220308
s390                 randconfig-r044-20220308
arc                  randconfig-r043-20220307
riscv                            allyesconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
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
x86_64                        randconfig-c007
riscv                randconfig-c006-20220308
powerpc              randconfig-c003-20220308
i386                          randconfig-c001
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
powerpc                    ge_imp3a_defconfig
mips                         tb0219_defconfig
arm                           spitz_defconfig
mips                           mtx1_defconfig
arm                         bcm2835_defconfig
mips                     loongson2k_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                       cns3420vb_defconfig
arm                          imote2_defconfig
arm                             mxs_defconfig
powerpc                 mpc8560_ads_defconfig
arm                            mmp2_defconfig
arm                                 defconfig
arm                     am200epdkit_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220308
hexagon              randconfig-r041-20220308
hexagon              randconfig-r041-20220307
riscv                randconfig-r042-20220307
hexagon              randconfig-r045-20220307
s390                 randconfig-r044-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
