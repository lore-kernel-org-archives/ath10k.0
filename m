Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623D7C4361B
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 20:43:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F35C223A22
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 20:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F35C223A22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bfYBkHDbWkEej6+fQzng9Yj2wRAf5m4624sHr1r8KNA=; b=yq22s4rzUO8aZIfr0/w1TNbkGx
	E7FG4DnN64BV7xYRu6y5kmj4qltLXd6ishkIJlQM9UdSBwto63F3J/eA5kgrhoh//EuwsIRTOcpfR
	vuFLoJCcb4Yq4IYpUNv/EphtJy+pveqOxIMLydL5MBEz5ZFAWOAhUUYDiuMMOSHeRqAKL1M3ogZfh
	aBScEYF1dvcmpM2tEbDMSjvOd8SBXjVpmQDiebp2qtICyrAqlEMvWQ5pHyz50klpL1otYaHzyjLt0
	w6nzzD47oVuOJGLeN1te0dKmgtFS8UL6qv9zb55LwIJEOdyFfUCCfwxyEcytRAFnp2YOzZUCsXyqZ
	MKnrAmag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq078-0001yo-5i; Thu, 17 Dec 2020 20:43:06 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq071-0001wS-Mr
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 20:43:02 +0000
IronPort-SDR: XRlfJUspVmlo6uLqDG4Wy0ajkjcRZUetGb4v6yONPGhnqDINx1m75ZOKys8mxsxzWdEOU8yGjl
 mca6ghkW3eoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9838"; a="154552520"
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; d="scan'208";a="154552520"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 12:42:57 -0800
IronPort-SDR: SNJuic/2QAp+lssvo+Q+3P6luH1D0Lh9OQVcOQcpG9xeJwQmZy3LbgT/N+qfqz9zelFQIiflMT
 hmNLfTzB89Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; d="scan'208";a="338487141"
Received: from lkp-server02.sh.intel.com (HELO 070e1a605002) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 17 Dec 2020 12:42:55 -0800
Received: from kbuild by 070e1a605002 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kq06w-0001MQ-Sx; Thu, 17 Dec 2020 20:42:54 +0000
Date: Fri, 18 Dec 2020 04:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 e2f8b74e58cb1560c1399ba94a470b770e858259
Message-ID: <5fdbc2b8.f5OX3HD7L+bfiPJs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_154259_942870_5E6DE715 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath-next
branch HEAD: e2f8b74e58cb1560c1399ba94a470b770e858259  ath10k: prevent deinitializing NAPI twice

elapsed time: 724m

configs tested: 166
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
arm                        vexpress_defconfig
arm                        cerfcube_defconfig
sh                                  defconfig
h8300                     edosk2674_defconfig
arm                          pxa3xx_defconfig
arm                     eseries_pxa_defconfig
mips                         bigsur_defconfig
mips                          ath25_defconfig
arm                          simpad_defconfig
powerpc                      chrp32_defconfig
sh                          landisk_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     taishan_defconfig
arm                       multi_v4t_defconfig
h8300                               defconfig
c6x                        evmc6457_defconfig
sh                            shmin_defconfig
xtensa                       common_defconfig
arm                           sunxi_defconfig
powerpc                  mpc885_ads_defconfig
m68k                          hp300_defconfig
arm                        shmobile_defconfig
m68k                          sun3x_defconfig
arm                            lart_defconfig
mips                    maltaup_xpa_defconfig
arm                          badge4_defconfig
mips                            e55_defconfig
xtensa                         virt_defconfig
arm                        realview_defconfig
powerpc                    gamecube_defconfig
s390                             alldefconfig
sh                           se7721_defconfig
powerpc                     akebono_defconfig
c6x                        evmc6678_defconfig
microblaze                      mmu_defconfig
powerpc                     skiroot_defconfig
arm                         s3c6400_defconfig
powerpc                     tqm8555_defconfig
arm                        multi_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                          malta_defconfig
arm                         lubbock_defconfig
arm                          iop32x_defconfig
arm                         lpc32xx_defconfig
openrisc                         alldefconfig
powerpc                      ppc64e_defconfig
arm                          imote2_defconfig
h8300                       h8s-sim_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                      bmips_stb_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                           se7750_defconfig
arm                           h3600_defconfig
mips                             allmodconfig
arm                  colibri_pxa300_defconfig
m68k                        m5407c3_defconfig
powerpc                       ppc64_defconfig
arm                         assabet_defconfig
sh                          lboxre2_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                      ppc6xx_defconfig
mips                        nlm_xlr_defconfig
mips                  decstation_64_defconfig
powerpc64                        alldefconfig
arm                            xcep_defconfig
arm                   milbeaut_m10v_defconfig
arm                           spitz_defconfig
xtensa                          iss_defconfig
arm                         cm_x300_defconfig
sh                             espt_defconfig
c6x                        evmc6472_defconfig
ia64                                defconfig
arm                        spear6xx_defconfig
riscv                    nommu_virt_defconfig
arm                      footbridge_defconfig
powerpc                     stx_gp3_defconfig
sh                   rts7751r2dplus_defconfig
arm                         hackkit_defconfig
arm64                            alldefconfig
mips                        jmr3927_defconfig
powerpc                     tqm8548_defconfig
um                            kunit_defconfig
powerpc                     asp8347_defconfig
powerpc                     tqm8540_defconfig
mips                        workpad_defconfig
sparc                       sparc64_defconfig
powerpc                      makalu_defconfig
mips                            ar7_defconfig
sh                        dreamcast_defconfig
powerpc                        icon_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201217
x86_64               randconfig-a006-20201217
x86_64               randconfig-a002-20201217
x86_64               randconfig-a005-20201217
x86_64               randconfig-a004-20201217
x86_64               randconfig-a001-20201217
i386                 randconfig-a001-20201217
i386                 randconfig-a004-20201217
i386                 randconfig-a003-20201217
i386                 randconfig-a002-20201217
i386                 randconfig-a006-20201217
i386                 randconfig-a005-20201217
i386                 randconfig-a014-20201217
i386                 randconfig-a013-20201217
i386                 randconfig-a012-20201217
i386                 randconfig-a011-20201217
i386                 randconfig-a015-20201217
i386                 randconfig-a016-20201217
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201217
x86_64               randconfig-a012-20201217
x86_64               randconfig-a013-20201217
x86_64               randconfig-a015-20201217
x86_64               randconfig-a014-20201217
x86_64               randconfig-a011-20201217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
