Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54824C433F5
	for <ath10k@archiver.kernel.org>; Thu,  7 Apr 2022 07:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=njVGQQlYsAlbcFzpmzGLrn4UJTZ5uWiDJerUd+lWvy8=; b=nm0vWi1fzYryhK
	MQBgxan53fEYlzyIVX6/26/og1ooXQ29vXRBe9iGQaRqdgvwkgH4UL1nMrnYENVU7mEGDUc3Jke/z
	TWJ8powwtr46dCkhYWT7+TUzroKj0WYo8msMiihJ5+nHhncTXKCL0dGEMfDNMkZ481h4cTyYBypm4
	Kuk27baStkIQINGd/HPWr69h6zRhqGU+ShEwgG7Wo6Tc3RVHjB/DnRjPh51PGxlEAbhj5mO79yo/x
	Fs5sXxc9tXdJsi6Rb1oZtmAnPY+QvWpKAhXlb6xNzproVUKI8WOAbAbCKF8Mt3ISsIdraH3ZoYmQZ
	85wAiOOvsVgsWpFxz+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMFy-009pBl-7G; Thu, 07 Apr 2022 07:08:38 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMFv-009pAa-Bd
 for ath10k@lists.infradead.org; Thu, 07 Apr 2022 07:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649315315; x=1680851315;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=VeFC+Rr57LnFlASE3GKvu4EnJ7tg+YNziF+Rliu2PTI=;
 b=d+mv+bB4CrpZ1ZV1i7EJRO9uwT1BqHP/zgC0dbBqAc3P7T7PDtSpxNI9
 gKm2JEmOz3E3FaaU7YnN6qGxhzaIW2xK54n4/i8tIjtj00TE/D4UEaGyE
 GwknptnbalxSXiB+yLLbVVoQZOFpc3a33OzzVAMze1XuSzqYjb60eLPpX
 R+gek1+otL/ugIbNB+DsQkiKmi/f5Nb/FjZpHf6ZiO1FpXhLvDhkz3sxL
 PCRz4QxD4FBsQ+VN4c10QTCjKMeix//BpoiL4/O/FErnECDc50Vh/LIsB
 Uat9Q5OKzWUrcHC2o5+XTpvi+QO556AgMaTNWTQyUhllBu2xptToYAkNk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347688855"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="347688855"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 00:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="588698342"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 07 Apr 2022 00:08:32 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ncMFs-0005BV-3A;
 Thu, 07 Apr 2022 07:08:32 +0000
Date: Thu, 07 Apr 2022 15:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS WITH WARNING
 e1bd1e32fab0c91cf7a87e96fee9270e98e79351
Message-ID: <624e8dc7.gxEw5ZewwyIHolCs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_000835_464929_C5E64362 
X-CRM114-Status: UNSURE (   4.37  )
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
branch HEAD: e1bd1e32fab0c91cf7a87e96fee9270e98e79351  carl9170: tx: fix an incorrect use of list iterator

Warning reports:

https://lore.kernel.org/llvm/202204071343.R89skHKl-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/net/wireless/realtek/rtw89/ser.c:319:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]

Warning ids grouped by kconfigs:

clang_recent_errors
`-- arm64-allmodconfig
    `-- drivers-net-wireless-realtek-rtw89-ser.c:warning:unannotated-fall-through-between-switch-labels

elapsed time: 729m

configs tested: 109
configs skipped: 3

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
mips                           ci20_defconfig
powerpc                        warp_defconfig
arm                             rpc_defconfig
powerpc                 linkstation_defconfig
arc                        nsim_700_defconfig
m68k                         apollo_defconfig
sparc                               defconfig
mips                      loongson3_defconfig
xtensa                           alldefconfig
arc                     haps_hs_smp_defconfig
sh                           se7343_defconfig
openrisc                            defconfig
openrisc                         alldefconfig
sh                        edosk7705_defconfig
m68k                        m5407c3_defconfig
powerpc                         wii_defconfig
arc                        vdk_hs38_defconfig
arm                            pleb_defconfig
arm                         s3c6400_defconfig
powerpc                         ps3_defconfig
h8300                       h8s-sim_defconfig
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20220406
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
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
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220406
arc                  randconfig-r043-20220406
s390                 randconfig-r044-20220406
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
arm                       mainstone_defconfig
arm                        multi_v5_defconfig
mips                     cu1830-neo_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
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
