Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0B8C2BBCD
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 20:44:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 531812388E
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 20:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 531812388E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9VsytLTNwzqFQpNBF76oHtxuPu5XgyvrcnB8pScnzOk=; b=eDxhO9QvvISGRCn1ChJqnHH2Uu
	mo9PQSdiQEy79uuVEVIQ/xL5QHuRXEYXrcUOU2rgk4yHM21d/FtU/Hzczj7RaxG0ipCmtpZb7fmfq
	R9ZLUT5qHaECL0vcGIpcURcXjK31Xx/iiwZpp7kgiyKf+JPDN32oYpgthttVu7tY8IPMb7TOp66zm
	8rJjqT4y+uJFm5IpSEPzR1LEnMZ7VTVaUU0+/X42rJwlvmF3HeSqU5ovsygTJg2ahWdLVZZbSSW7Q
	UVpg5BnrC4hBAz9mrZojFwuZg/YJvUuwLiXYrWedEA/RnTYsZpr6OaiwavI7YedYcvLBFtKt8kYJT
	thY02sjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq078-0001yz-RH; Thu, 17 Dec 2020 20:43:06 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq071-0001wV-Q6
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 20:43:02 +0000
IronPort-SDR: nAViGWX5O3ANM4aBU3yHnYqsfmAhWLiDAc5K5Jm5KkPwwaCpp7Ed73oaMOkqg2xk6s/I5YWe9g
 k4UrProCPbVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9838"; a="162375996"
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; d="scan'208";a="162375996"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 12:42:57 -0800
IronPort-SDR: JDe1O+3Dx7gQuyZhOBflZ4HTKPTtWJwRX1hcdKARcHT9y1pa7bN0iPrqwWZ6Ty+e+GeCzUCwwo
 /BfCEV8q93pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; d="scan'208";a="393017103"
Received: from lkp-server02.sh.intel.com (HELO 070e1a605002) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2020 12:42:55 -0800
Received: from kbuild by 070e1a605002 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kq06x-0001MU-4H; Thu, 17 Dec 2020 20:42:55 +0000
Date: Fri, 18 Dec 2020 04:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-current] BUILD SUCCESS
 30d085039314fcad2c2e33a2dfc8e79765ddf408
Message-ID: <5fdbc2c4.DaOQjiJdGkmRwCcP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_154300_125212_A171F7D2 
X-CRM114-Status: UNSURE (   8.67  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath-current
branch HEAD: 30d085039314fcad2c2e33a2dfc8e79765ddf408  ath11k: Fix ath11k_pci_fix_l1ss()

elapsed time: 724m

configs tested: 147
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
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
arm                            lart_defconfig
mips                    maltaup_xpa_defconfig
arm                          badge4_defconfig
mips                            e55_defconfig
xtensa                         virt_defconfig
arm                        realview_defconfig
powerpc                    gamecube_defconfig
s390                             alldefconfig
sh                           se7721_defconfig
powerpc                         ps3_defconfig
sh                         apsh4a3a_defconfig
mips                malta_qemu_32r6_defconfig
arm                          pcm027_defconfig
powerpc                     akebono_defconfig
c6x                        evmc6678_defconfig
microblaze                      mmu_defconfig
powerpc                     skiroot_defconfig
sh                                  defconfig
arm                         s3c6400_defconfig
powerpc                     tqm8555_defconfig
arm                        multi_v5_defconfig
powerpc                 mpc8315_rdb_defconfig
nios2                               defconfig
powerpc                    adder875_defconfig
sh                             espt_defconfig
sparc                       sparc32_defconfig
m68k                        stmark2_defconfig
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
arm                         cm_x300_defconfig
c6x                        evmc6472_defconfig
ia64                                defconfig
arm                        spear6xx_defconfig
riscv                    nommu_virt_defconfig
arm                      footbridge_defconfig
powerpc                     stx_gp3_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     asp8347_defconfig
powerpc                     tqm8540_defconfig
mips                        workpad_defconfig
sparc                       sparc64_defconfig
powerpc                      makalu_defconfig
arm                       aspeed_g4_defconfig
sh                         ap325rxa_defconfig
mips                     decstation_defconfig
h8300                    h8300h-sim_defconfig
mips                   sb1250_swarm_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
x86_64               randconfig-a003-20201217
x86_64               randconfig-a006-20201217
x86_64               randconfig-a002-20201217
x86_64               randconfig-a005-20201217
x86_64               randconfig-a004-20201217
x86_64               randconfig-a001-20201217
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
