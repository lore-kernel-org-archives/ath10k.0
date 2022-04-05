Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A435C433EF
	for <ath10k@archiver.kernel.org>; Tue,  5 Apr 2022 22:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cycYTd1dKqFmaqxMCxH/Y9CCAvQcYMoLGvdNVfRgW4k=; b=S+EDuLulZ1PPbp
	5uYchZ91S6MaT9p0jkoCmIvCVTdPBkEdTZqgZ6OmoiNqLRZB8KcGHaNsKXHIlLWJFHl3u2i682rY/
	MjafP4QyC9wzM8NRwg5Vr0Ka0l4EEqeXQw53r11z4SM9z9jpDXVlyLk8whabsWKvpoyE6nnWKHKi2
	JEY6JrBpx9fr/3PHxEsz3kwE2F1Sxys4CgPwOFummiPehKFh/pR3Y4mPxsAeKJrHsI/1GPrhyE5CJ
	q9pN4Sosyhsg6d+8l1F9zln2b9jzKsiH6N//NitBwkFYLkhvCe9YtU+V9v0nmaq11nyKkfskgBKtv
	ZE8jru4yQKRY1e+nWA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbrGD-002pjU-OS; Tue, 05 Apr 2022 22:02:49 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbrGA-002piK-8h
 for ath10k@lists.infradead.org; Tue, 05 Apr 2022 22:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649196166; x=1680732166;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=wJ19IM/R4hTdkepovsxR0YmMh+9GU4KU2ETrQp8WBQg=;
 b=RM9ORyRlFNHH8QF1Kty7REOXVggUpZ/DlCmc+kbMMfMp/lPkrXa3sJQ2
 ErSVYUxgyFXWWN2nlEm+kTHgoHC3lksj2CIRB7tJN8S65OQOQUCARDv0l
 wn9xIqEN47BIq43PoP12l2U21jcG9GxMm5hvEzVoeyHUiadhmvFN88PTn
 d1iT0ffFwknkQS/G4lrw6Tf+xdsMI5kruY7L7ZfZ6ViRowe4w3z6/+ojF
 9t8xL1CDA5EGWPNeaqnpOAlz+puY0XMLGz0Phzk3Ga3uzu2rMwNhccb6X
 CBmhS04x7/N98f0cyLuIvnT5/IxfHZ8QFhzUweG0SPWcYsNWAFKxByL9o A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="240807276"
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; d="scan'208";a="240807276"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 15:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; d="scan'208";a="524179947"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 05 Apr 2022 15:01:36 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nbrF2-0003o1-55;
 Tue, 05 Apr 2022 22:01:36 +0000
Date: Wed, 06 Apr 2022 06:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 807650132bc6e21e94b0223f5157d5158ef2276a
Message-ID: <624cbc16.7vWcs1Oqaja4NJbh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_150246_420629_48180898 
X-CRM114-Status: UNSURE (   3.99  )
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
branch HEAD: 807650132bc6e21e94b0223f5157d5158ef2276a  ath11k: mhi: remove unnecessary goto from ath11k_mhi_start()

elapsed time: 733m

configs tested: 148
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
arm                         s3c6400_defconfig
mips                         db1xxx_defconfig
openrisc                 simple_smp_defconfig
arm                         at91_dt_defconfig
m68k                        m5407c3_defconfig
powerpc                     pq2fads_defconfig
sparc64                          alldefconfig
sparc                       sparc32_defconfig
powerpc                  storcenter_defconfig
arc                            hsdk_defconfig
riscv                    nommu_k210_defconfig
arm                      jornada720_defconfig
arm                       imx_v6_v7_defconfig
sh                     magicpanelr2_defconfig
openrisc                  or1klitex_defconfig
mips                        vocore2_defconfig
mips                         cobalt_defconfig
arc                      axs103_smp_defconfig
ia64                            zx1_defconfig
arm                         lpc18xx_defconfig
sh                           se7343_defconfig
sh                         ap325rxa_defconfig
sh                           se7722_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     tqm8548_defconfig
sh                             sh03_defconfig
powerpc                         wii_defconfig
arm                             ezx_defconfig
mips                  maltasmvp_eva_defconfig
m68k                       m5249evb_defconfig
ia64                        generic_defconfig
arm                           viper_defconfig
arm                           stm32_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     tqm8541_defconfig
xtensa                    smp_lx200_defconfig
arm                          exynos_defconfig
openrisc                            defconfig
h8300                            allyesconfig
powerpc                     stx_gp3_defconfig
nios2                         10m50_defconfig
arm                            hisi_defconfig
arm                        keystone_defconfig
powerpc                         ps3_defconfig
arm                        realview_defconfig
m68k                          multi_defconfig
xtensa                       common_defconfig
sh                        edosk7760_defconfig
sparc                       sparc64_defconfig
arm                          iop32x_defconfig
riscv             nommu_k210_sdcard_defconfig
s390                                defconfig
ia64                          tiger_defconfig
arm                       multi_v4t_defconfig
powerpc                        warp_defconfig
xtensa                          iss_defconfig
arm                            qcom_defconfig
m68k                        mvme147_defconfig
ia64                             allyesconfig
arm                             pxa_defconfig
mips                  decstation_64_defconfig
h8300                       h8s-sim_defconfig
arm                           sama5_defconfig
mips                           xway_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220405
ia64                             allmodconfig
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
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
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
powerpc              randconfig-c003-20220405
riscv                randconfig-c006-20220405
mips                 randconfig-c004-20220405
arm                  randconfig-c002-20220405
arm                          moxart_defconfig
powerpc                        icon_defconfig
powerpc                   bluestone_defconfig
arm                      tct_hammer_defconfig
powerpc                  mpc885_ads_defconfig
arm                     am200epdkit_defconfig
arm                       aspeed_g4_defconfig
arm                            mmp2_defconfig
arm                              alldefconfig
riscv                    nommu_virt_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r045-20220405
riscv                randconfig-r042-20220405
hexagon              randconfig-r041-20220405

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
