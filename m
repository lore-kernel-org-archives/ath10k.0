Return-Path: <SRS0=uCW8=PA=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE746C433EF
	for <ath10k@archiver.kernel.org>; Tue, 12 Oct 2021 10:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9792161050
	for <ath10k@archiver.kernel.org>; Tue, 12 Oct 2021 10:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9792161050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WKXnFvgGCUCTls/KZMLpi4T+JmDvsYx8aKfvzt3chHc=; b=TTZrwesxTsXs63
	MrA2tAhnPc+mMmJWT4tG1+e4wAu0cZ/5L4pg+G8LJ0kIucmA9M0YYafQaGd5eZ05JbeOn2rdA1E5r
	4L7B5LDRg/T69utjtePVj6AVZkvatnIU2rrLQV8WymONDAeK+4CO6y+Mg1gutjOect1iXbpCTUIMx
	8KcqKW7oRCXB2uhbG3xrJJQ1HCiwh//r64ePCL7sKoNRIlzflNPciDX4Iu0Pienl7yx5Mw61gGgav
	xfCJW3yuhitnfHyl9uPA/08oHcIRg1xLYXo2fmR6bTnZhOxw3sdrcRgLAFN+un8v4cH9BVkdtNuPh
	9rKT8cdNgr821dGmhu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maFPT-00CUld-Ia; Tue, 12 Oct 2021 10:53:27 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maFPQ-00CUl4-Ii
 for ath10k@lists.infradead.org; Tue, 12 Oct 2021 10:53:26 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="290600141"
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="290600141"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 03:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,367,1624345200"; d="scan'208";a="524176813"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 12 Oct 2021 03:53:22 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1maFPO-0003N6-1H; Tue, 12 Oct 2021 10:53:22 +0000
Date: Tue, 12 Oct 2021 18:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 4da4805e8de9380230090be59113a39ffa0654f6
Message-ID: <61656905.IbaDaeufG1lKiK57%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_035324_701616_61D572A6 
X-CRM114-Status: UNSURE (   6.15  )
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
branch HEAD: 4da4805e8de9380230090be59113a39ffa0654f6  Revert "bus: mhi: Early MHI resume failure in non M3 state"

elapsed time: 1143m

configs tested: 182
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211011
i386                 randconfig-c001-20211012
mips                         tb0219_defconfig
arm                        mvebu_v7_defconfig
xtensa                  audio_kc705_defconfig
ia64                            zx1_defconfig
powerpc                     tqm8560_defconfig
sh                           se7705_defconfig
m68k                             alldefconfig
sh                              ul2_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                   sb1250_swarm_defconfig
powerpc                    amigaone_defconfig
arm                       aspeed_g5_defconfig
arc                            hsdk_defconfig
sparc                       sparc64_defconfig
s390                                defconfig
xtensa                  cadence_csp_defconfig
powerpc                      obs600_defconfig
powerpc                    gamecube_defconfig
mips                       bmips_be_defconfig
sh                           se7619_defconfig
arm                            mps2_defconfig
arm                           tegra_defconfig
mips                       lemote2f_defconfig
powerpc                   microwatt_defconfig
mips                           ci20_defconfig
openrisc                    or1ksim_defconfig
sh                          r7785rp_defconfig
ia64                          tiger_defconfig
sparc64                             defconfig
sh                   rts7751r2dplus_defconfig
arm                         orion5x_defconfig
arm                           sunxi_defconfig
arm                          moxart_defconfig
mips                malta_qemu_32r6_defconfig
sh                          sdk7786_defconfig
csky                             alldefconfig
mips                          ath25_defconfig
powerpc                         ps3_defconfig
powerpc64                           defconfig
powerpc                        fsp2_defconfig
mips                           rs90_defconfig
sh                           se7343_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      cm5200_defconfig
m68k                        m5272c3_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 linkstation_defconfig
arc                         haps_hs_defconfig
m68k                       m5249evb_defconfig
mips                        vocore2_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                       m5208evb_defconfig
ia64                         bigsur_defconfig
arc                     nsimosci_hs_defconfig
arm                      tct_hammer_defconfig
mips                       rbtx49xx_defconfig
powerpc                      pmac32_defconfig
sh                          lboxre2_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                            mmp2_defconfig
arm                        mvebu_v5_defconfig
um                                  defconfig
arm                         shannon_defconfig
arm                         s3c6400_defconfig
arm                        magician_defconfig
arm                          simpad_defconfig
riscv                    nommu_k210_defconfig
m68k                            q40_defconfig
mips                         mpc30x_defconfig
powerpc                      ppc44x_defconfig
arm                            qcom_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     tqm5200_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                   motionpro_defconfig
arm                          gemini_defconfig
arm                          pxa168_defconfig
powerpc                     skiroot_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      chrp32_defconfig
arm                           spitz_defconfig
mips                        qi_lb60_defconfig
arm                           omap1_defconfig
m68k                           sun3_defconfig
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
arm                  randconfig-c002-20211012
x86_64               randconfig-c001-20211012
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
arc                  randconfig-r043-20211011
s390                 randconfig-r044-20211011
riscv                randconfig-r042-20211011
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
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211012
mips                 randconfig-c004-20211012
i386                 randconfig-c001-20211012
s390                 randconfig-c005-20211012
x86_64               randconfig-c007-20211012
powerpc              randconfig-c003-20211012
riscv                randconfig-c006-20211012
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
i386                 randconfig-a016-20211012
i386                 randconfig-a014-20211012
i386                 randconfig-a011-20211012
i386                 randconfig-a015-20211012
i386                 randconfig-a012-20211012
i386                 randconfig-a013-20211012
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
