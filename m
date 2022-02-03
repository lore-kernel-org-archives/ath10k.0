Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D34C433FE
	for <ath10k@archiver.kernel.org>; Thu,  3 Feb 2022 23:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iIV//lwWlTmXG4f74VF+/Majqkji9PRBB4SFSr6+OSg=; b=xnPSjV/EWkWcv5
	5CulzyT2HepCY9LOIXe5j8HcAEXBvdkcY+BViKL37HmuvpQaRY9h8l2++x9OCcGoo8Io1ih3aavBe
	8VGveMmGOx3B3YMrRYDlpEX4dWNYD2bWBNuv7N+UTVDh+lzQC4Vf8/OeW7wuc5ImNSxq0jKFlGr26
	jZ6R0VIaNZWPDl2m8rL4KPXJeOysfb3B0lTh5mx5Mq6M+Oub2q3+5hDq4wcUHVwlwqu55amrVRnwK
	HvhMQWTJ7NqaiiY/X++7WmxCnrHXpGPtDdueg2t/5MvdF+Hm01GxvIG5nI8Xc/RFXjA1NYtp0pnz1
	naSzlgvhQn16+ku/60Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFlU0-0034hC-6C; Thu, 03 Feb 2022 23:25:44 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFlTx-0034gD-3V
 for ath10k@lists.infradead.org; Thu, 03 Feb 2022 23:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643930741; x=1675466741;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=jQZpSseGGdk4B2HOH3RM/37VTV3drl+IE9VBbDNx3LE=;
 b=NxrbtG1D63GkUcCHYIoKAxZhYiVFALnsz4xPioSl80KsibGSX0RNqUBG
 Xc7J7QBH98JUgyqyB/K14r5iAVu3w1kveVBMAQUlQZ9iUNCu7JwLdbelq
 ISuK2u2g3aQ1mVKz80BVsoE62bfQzO1Ld3hmXRLigLq2uXK28PP5/go2j
 6yHLC6FGxKctFJlQpngQq20Xjn5u5LzghkKKjKbZ2ODtaHv6z9GrrYESp
 RxzItX30wnFaeTXXg1L2sBc+u0ykASSjwLtgU/REOMe0KyNO4D21tI/93
 RQ1XlSXapHcFrh+Y/vN2od0nNloQvLchTH1UI68tSzFrsIdFDfI4QYlmU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="235675533"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="235675533"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 15:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="771948335"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2022 15:25:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFlTu-000Wl7-7p; Thu, 03 Feb 2022 23:25:38 +0000
Date: Fri, 04 Feb 2022 07:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 c2681f5ea8b0fcbd5e0eb5c0d98510e70e877398
Message-ID: <61fc646c.vguko0v7qrcmXKtD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_152541_237284_C111B0B2 
X-CRM114-Status: UNSURE (   5.98  )
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
branch HEAD: c2681f5ea8b0fcbd5e0eb5c0d98510e70e877398  wcn36xx: Uninitialized variable in wcn36xx_change_opchannel()

elapsed time: 736m

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
i386                 randconfig-c001-20220131
i386                          randconfig-c001
m68k                          hp300_defconfig
sh                   sh7724_generic_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        clps711x_defconfig
powerpc                 linkstation_defconfig
mips                            ar7_defconfig
powerpc                     rainier_defconfig
arm                           h5000_defconfig
arm                           corgi_defconfig
powerpc                     sequoia_defconfig
sh                   secureedge5410_defconfig
arc                        nsim_700_defconfig
mips                           ci20_defconfig
powerpc                     taishan_defconfig
powerpc                      ep88xc_defconfig
arm                         lubbock_defconfig
mips                          rb532_defconfig
powerpc                      ppc40x_defconfig
parisc                           allyesconfig
sh                   rts7751r2dplus_defconfig
sh                           se7206_defconfig
arm                            qcom_defconfig
powerpc                     pq2fads_defconfig
m68k                            q40_defconfig
sh                              ul2_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                ecovec24-romimage_defconfig
m68k                       m5249evb_defconfig
arm                             rpc_defconfig
arm                           stm32_defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
m68k                          sun3x_defconfig
microblaze                      mmu_defconfig
nios2                         10m50_defconfig
h8300                     edosk2674_defconfig
arm                           viper_defconfig
arm                          simpad_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220202
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
x86_64               randconfig-a004-20220131
x86_64               randconfig-a006-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
arc                  randconfig-r043-20220131
s390                 randconfig-r044-20220130
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220201
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220201
mips                 randconfig-c004-20220201
i386                          randconfig-c001
arm                  randconfig-c002-20220201
arm                       imx_v4_v5_defconfig
powerpc                     ppa8548_defconfig
arm                  colibri_pxa300_defconfig
i386                             allyesconfig
riscv                             allnoconfig
x86_64                           allyesconfig
mips                          rm200_defconfig
arm                             mxs_defconfig
powerpc                   lite5200b_defconfig
arm                       cns3420vb_defconfig
arm                         shannon_defconfig
powerpc                        icon_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                         socfpga_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          pcm027_defconfig
arm                           spitz_defconfig
powerpc                       ebony_defconfig
mips                malta_qemu_32r6_defconfig
mips                      bmips_stb_defconfig
arm                         lpc32xx_defconfig
arm                       aspeed_g4_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220131
s390                 randconfig-r044-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r041-20220130
hexagon              randconfig-r045-20220203
hexagon              randconfig-r041-20220203

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
