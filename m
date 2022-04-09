Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5F2C4332F
	for <ath10k@archiver.kernel.org>; Sat,  9 Apr 2022 06:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bey9TdxpTk81Q66G/UvEXZUCbsfDiE9LNau1HUmO0GI=; b=SFnZil18K3c/K8
	Z3Pm+etbryHL6xIBflF8awwuhChl/21c8L7qIXLaCTVDYLv8tY9OBec3Pfuza+EuBAeUtr9f394q6
	jRu0LD8Hqfnc1pDiSJMKQTMvAEARV0X6cYtQLtNt2TefRemH7h96dHh4fu0HMH+BDwi3fjxsojr5z
	4LNLepkIgfW0yBcUSsQ+R03oJNMx/QgfFiwzbdUoH0MBtgMFdVC9AcVmDwPSM5uFcXiABIMp8L/Fe
	ej/NB670F6FE7siTTtcBoL7QALcrD/JQQ92pshdYQ6H5MqpKGjTERsnoqIurU7QxbrCQspcNMkZ76
	9UUuZNJShAXW8HhIf+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd4IN-002OyR-4J; Sat, 09 Apr 2022 06:10:03 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd4IK-002Oww-6M
 for ath10k@lists.infradead.org; Sat, 09 Apr 2022 06:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649484600; x=1681020600;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=g+8VWmPZujzuUR73XChek5HXJYapGCpOvyELUM0MR3w=;
 b=h9UBEgibkK9MZo6ahXxk/NtR70e7+ht/7MA+x4ghSeLguZS21JpKf/U/
 wPXbFpgnY835lGHBI18bJ7xp2qNxV9ptx7R6DJxUZbQr8gAGKLpoqtb3x
 5RUIpLFGkbS4TbywwjoUtP/ExSzupkXLAggqdPAuZx2DW1ePhxIsyxWvD
 dFDAsR/mSaw4xJbyqC7tt8M0mQz68A53YmoYpcZFPOv4DWqG2b3FptXjI
 lkdtEgp9HRY5dO9kh8XqstcyI9W17tP27iQEUqWOnjyxHQiY/obw7ZTKW
 qkLsmr/X7wjwgKXnB3lvJA+OC0kWE77AAtJBs51sAYodhW3zsPBdKhTyz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="242359246"
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; d="scan'208";a="242359246"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 23:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,247,1643702400"; d="scan'208";a="852431352"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 08 Apr 2022 23:09:58 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nd4IH-0000wa-Ey;
 Sat, 09 Apr 2022 06:09:57 +0000
Date: Sat, 09 Apr 2022 14:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 942c67bb44c1573c35ecb5a9a4c894289639bde7
Message-ID: <62512303.cyjVKavvphHxVxB4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_231000_299338_33095481 
X-CRM114-Status: UNSURE (   3.58  )
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
branch HEAD: 942c67bb44c1573c35ecb5a9a4c894289639bde7  ath9k: Remove unnecessary print function dev_err()

elapsed time: 723m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
microblaze                      mmu_defconfig
powerpc                    sam440ep_defconfig
xtensa                              defconfig
m68k                             allyesconfig
m68k                        m5407c3_defconfig
h8300                            alldefconfig
sh                        edosk7760_defconfig
sh                           se7722_defconfig
arc                          axs103_defconfig
m68k                          atari_defconfig
ia64                             alldefconfig
arc                            hsdk_defconfig
powerpc                    adder875_defconfig
arm                           stm32_defconfig
powerpc                       maple_defconfig
openrisc                            defconfig
sh                           se7206_defconfig
arm64                            alldefconfig
nios2                         10m50_defconfig
sh                            migor_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      chrp32_defconfig
arm                            xcep_defconfig
arm                          badge4_defconfig
sh                        sh7785lcr_defconfig
s390                       zfcpdump_defconfig
arm                          exynos_defconfig
powerpc64                           defconfig
ia64                          tiger_defconfig
powerpc                 mpc8540_ads_defconfig
arm                          gemini_defconfig
powerpc                     ep8248e_defconfig
sh                          kfr2r09_defconfig
ia64                             allmodconfig
xtensa                generic_kc705_defconfig
arc                     haps_hs_smp_defconfig
riscv             nommu_k210_sdcard_defconfig
xtensa                  nommu_kc705_defconfig
h8300                       h8s-sim_defconfig
parisc                generic-32bit_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220408
ia64                             allyesconfig
ia64                                defconfig
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
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220408
s390                 randconfig-r044-20220408
riscv                randconfig-r042-20220408
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
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20220408
powerpc              randconfig-c003-20220408
riscv                randconfig-c006-20220408
mips                 randconfig-c004-20220408
arm                  randconfig-c002-20220408
mips                        omega2p_defconfig
s390                             alldefconfig
mips                      pic32mzda_defconfig
powerpc                     pseries_defconfig
powerpc                   bluestone_defconfig
powerpc                      obs600_defconfig
mips                        qi_lb60_defconfig
mips                     cu1000-neo_defconfig
riscv                             allnoconfig
mips                   sb1250_swarm_defconfig
mips                     loongson1c_defconfig
powerpc                       ebony_defconfig
powerpc                     mpc5200_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220408
hexagon              randconfig-r045-20220408

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
