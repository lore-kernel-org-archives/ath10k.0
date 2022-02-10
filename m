Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B6BC433EF
	for <ath10k@archiver.kernel.org>; Thu, 10 Feb 2022 22:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D1T0mycSbucrdbLPuuUJHfJztAkMCVQT/Km5xikMQaE=; b=EFa3Kpvh2lwri/
	ziEkXeP3h0mAQWn3P5pDrdHrdiIlC33dMwGVpPgzOdUj+yhpOIu4fTlx/nMEZSMyjSWrniSmtm4eT
	gUhzQ37bS355ZMdttnoV6wG28dWLmVzMdhqi9OjKvR1cJsA76yXBAqQm68Av/Gh+7e4rKHv5GCiSw
	NWv4jRHynBMiRDR/ZXlSXINhsKERzE6arqxQLZWtsiHqKbnc+rygARpYuBk1uarXUyC5AF664xXxR
	TL8+9WwnsqtwwzPjw3I8Jq3Jc7Qgakm3Pqxr/l4oudJJvcaWx5j0NzouMRT1+qv8g3bOzMAk2Wfr5
	kSXZs2EIyBL90sTVYfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIHxF-0052RP-J1; Thu, 10 Feb 2022 22:30:21 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIHxD-0052Qy-1x
 for ath10k@lists.infradead.org; Thu, 10 Feb 2022 22:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644532219; x=1676068219;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=QwrWot1dMzBls65y47I69OWhNNIvtpmkXNEK1ND97EQ=;
 b=PU9mN1rLoJmkmey62NRIgIybgisl7Bye8bTQ/sT6VxwZ2mlLjyMEC92I
 N4IyXJ7+7kAzL1rfLbVcv52IR9P4d8v3kMPcfsvK81xZ4k78kU/EcePBe
 ZG9qDY3WSA0W2rw4de406JscoMwG/I1sKkmaDThOQpw3SgIgR2oSjEgxC
 b2rVGSN3X29XXY9I7BOnf0/mfhzXYYaQc7FczoLCcgK7Jk6ZsKM1/qzXF
 U1/T0UD1uMtjRa8l15GsAmhZ9fPhDxJujqfOfkjCm4Bp5DIPmht6Q44wT
 exBcq6SyRyXQKhxtAVQ9WemX3s5V2qU3eYjASAMuHEC5CK01+6F12WXg4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="310344882"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="310344882"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 14:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="602189103"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2022 14:30:16 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nIHx9-0003qC-Tz; Thu, 10 Feb 2022 22:30:15 +0000
Date: Fri, 11 Feb 2022 06:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 a723e2d2d716dae05cc2506868441f8fc48facd2
Message-ID: <620591e9.BpXFRKc/LhUghAMu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_143019_219796_61E22A20 
X-CRM114-Status: UNSURE (   5.45  )
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
branch HEAD: a723e2d2d716dae05cc2506868441f8fc48facd2  Add localversion-wireless-testing-ath

elapsed time: 725m

configs tested: 143
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220210
i386                          randconfig-c001
arm                         lpc18xx_defconfig
arm                           u8500_defconfig
ia64                            zx1_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7722_defconfig
sh                         ecovec24_defconfig
powerpc                       ppc64_defconfig
arm                        mini2440_defconfig
arm                       multi_v4t_defconfig
openrisc                 simple_smp_defconfig
s390                          debug_defconfig
sh                          sdk7780_defconfig
sh                        edosk7760_defconfig
arm                        mvebu_v7_defconfig
arm                         vf610m4_defconfig
sh                          r7780mp_defconfig
arm                         assabet_defconfig
sh                            shmin_defconfig
sh                              ul2_defconfig
nios2                            alldefconfig
sh                          urquell_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                       m5249evb_defconfig
arm                         s3c6400_defconfig
csky                             alldefconfig
m68k                       m5475evb_defconfig
sh                             sh03_defconfig
powerpc                      chrp32_defconfig
powerpc                      ep88xc_defconfig
ia64                         bigsur_defconfig
sh                        dreamcast_defconfig
arc                     nsimosci_hs_defconfig
arm                        cerfcube_defconfig
powerpc64                        alldefconfig
powerpc                    adder875_defconfig
mips                     decstation_defconfig
powerpc64                           defconfig
m68k                        mvme16x_defconfig
sh                                  defconfig
m68k                        m5407c3_defconfig
sh                   sh7770_generic_defconfig
arm                             pxa_defconfig
csky                                defconfig
sh                           se7750_defconfig
m68k                          amiga_defconfig
alpha                            alldefconfig
powerpc                      arches_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20220210
arm                  randconfig-c002-20220209
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                 randconfig-r044-20220209
arc                  randconfig-r043-20220208
arc                  randconfig-r043-20220209
riscv                randconfig-r042-20220210
riscv                randconfig-r042-20220209
arc                  randconfig-r043-20220210
s390                 randconfig-r044-20220210
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220209
riscv                randconfig-c006-20220210
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220209
powerpc              randconfig-c003-20220210
arm                  randconfig-c002-20220210
i386                          randconfig-c001
mips                 randconfig-c004-20220209
mips                 randconfig-c004-20220210
arm                  randconfig-c002-20220209
powerpc                  mpc885_ads_defconfig
mips                         tb0287_defconfig
powerpc                      ppc64e_defconfig
arm                          collie_defconfig
mips                        workpad_defconfig
powerpc                    ge_imp3a_defconfig
arm                        multi_v5_defconfig
powerpc                      ppc44x_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220210
hexagon              randconfig-r045-20220210
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
