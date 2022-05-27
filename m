Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAB1C433F5
	for <ath10k@archiver.kernel.org>; Fri, 27 May 2022 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=egZ5CbIcsw29vnyTCvIm+bYdC6TXtc4m9/zj/2KkNUo=; b=PWs20F15tAynFR
	Lqzk/1f/p3TGIZjrKG/eIwMyRDR/jDjX0m9fGfQkmEcn/OIbYRStkit1w5nLMXhTOzgFZdgYr0lIi
	GGmM9BUV/f9caftLCaLffuK5TeT970yNssCdMHIaM9euwzQwqDkeMekzXkYMi5ZtDJe027D2tThEi
	484+rhUvOTnLm8YQKUNBhZ0jLdM/LcfXiCyDf2yjQsSNCeu2bJjDKmw2aBstq6RfV2REUvZhSdzCk
	vO9by4RuP6qvxavfZGlF64A4wBUEua//hA4u89sHqwKTyPIfhtnvcQI5amqdx7XNGLjj/V5XdnYe4
	9EoKFgMl4LAfTMUooQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuiOv-0013m6-CF; Fri, 27 May 2022 22:25:45 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuiOr-0013jY-Vs
	for ath10k@lists.infradead.org; Fri, 27 May 2022 22:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653690341; x=1685226341;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eRYgbcgNQV/qervKbcpIO8IzZj8h4F6QgJlzUYwT86Y=;
  b=Tul9qS4cSV9m8B7cyxfzOJF949g9FJespg9p8ZD0OtDoihKxTULed5gS
   XwVi8DsZnz7lw5xWxdcP8iE3hR7vrdSwNCB2p+fI5eWzRys6UjQ0FTVBv
   Me3NhPV2GJOlIAEzyMnS58AM//LDqry7f74RKdchuHo5BlQ9ZpRasSQsN
   JbNCM23SokskA+9hSUONJ06oRvePoiepNUxJ8762amvsD/3UyrolyrdWd
   8n+Eklb0yKg4ywUfzJlXGa1H9/f9KZlExmKbIw/J9KZCK3BzG/iISsL0Y
   hCS1c9x34lJwQ2BE7Uq+jjU/xMHQzIWpYv85zRVtPKMcMfzMoDmBTmdck
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="274689257"
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; 
   d="scan'208";a="274689257"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 15:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,256,1647327600"; 
   d="scan'208";a="719087843"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 May 2022 15:25:33 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nuiOj-0005BC-BF;
	Fri, 27 May 2022 22:25:33 +0000
Date: Sat, 28 May 2022 06:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 5fcfc57daf644fb028f8d0ef839b5202357a5d9a
Message-ID: <62914fb4.daVtNfvYE89HHirU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_152542_095297_953EA27D 
X-CRM114-Status: UNSURE (   5.56  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 5fcfc57daf644fb028f8d0ef839b5202357a5d9a  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 175
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
powerpc                      pcm030_defconfig
mips                         db1xxx_defconfig
sh                          polaris_defconfig
arm                         assabet_defconfig
arm                            mps2_defconfig
m68k                          sun3x_defconfig
powerpc                      ppc6xx_defconfig
arm                       multi_v4t_defconfig
powerpc64                           defconfig
um                                  defconfig
sh                               alldefconfig
arm                           sama5_defconfig
arm                           imxrt_defconfig
parisc                           alldefconfig
arm                         vf610m4_defconfig
sh                             sh03_defconfig
xtensa                           alldefconfig
arc                     haps_hs_smp_defconfig
powerpc                 mpc8540_ads_defconfig
sh                            hp6xx_defconfig
mips                 decstation_r4k_defconfig
sh                            titan_defconfig
sh                           sh2007_defconfig
openrisc                         alldefconfig
arm                          pxa3xx_defconfig
sh                ecovec24-romimage_defconfig
mips                         bigsur_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm8555_defconfig
sh                            shmin_defconfig
arm                           u8500_defconfig
sh                           se7712_defconfig
powerpc                     ep8248e_defconfig
sh                          sdk7786_defconfig
xtensa                  cadence_csp_defconfig
sh                          kfr2r09_defconfig
ia64                                defconfig
sparc                       sparc32_defconfig
arm                            pleb_defconfig
powerpc                     asp8347_defconfig
powerpc                    adder875_defconfig
sh                          r7780mp_defconfig
m68k                          atari_defconfig
arm                     eseries_pxa_defconfig
sparc                       sparc64_defconfig
sh                        apsh4ad0a_defconfig
sh                           se7343_defconfig
microblaze                          defconfig
m68k                          multi_defconfig
arm                          pxa910_defconfig
arc                      axs103_smp_defconfig
sh                           se7780_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                     magicpanelr2_defconfig
sh                   sh7724_generic_defconfig
arm                      footbridge_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                         microdev_defconfig
s390                       zfcpdump_defconfig
arm                        trizeps4_defconfig
m68k                        m5407c3_defconfig
arc                            hsdk_defconfig
arm                        shmobile_defconfig
nios2                         10m50_defconfig
arm                          lpd270_defconfig
arm                  randconfig-c002-20220526
arm                  randconfig-c002-20220524
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
riscv                             allnoconfig
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
arc                  randconfig-r043-20220524
s390                 randconfig-r044-20220524
riscv                randconfig-r042-20220524
arc                  randconfig-r043-20220527
arc                  randconfig-r043-20220526
s390                 randconfig-r044-20220526
riscv                randconfig-r042-20220526
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                  randconfig-c002-20220524
x86_64                        randconfig-c007
s390                 randconfig-c005-20220524
i386                          randconfig-c001
powerpc              randconfig-c003-20220524
riscv                randconfig-c006-20220524
mips                 randconfig-c004-20220524
mips                     loongson2k_defconfig
mips                          malta_defconfig
mips                      pic32mzda_defconfig
powerpc                       ebony_defconfig
mips                           ip28_defconfig
mips                         tb0287_defconfig
powerpc                      obs600_defconfig
arm                        mvebu_v5_defconfig
mips                  cavium_octeon_defconfig
mips                           ip22_defconfig
arm                     am200epdkit_defconfig
powerpc                          allyesconfig
powerpc                    mvme5100_defconfig
arm                      pxa255-idp_defconfig
arm                       aspeed_g4_defconfig
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
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220527
hexagon              randconfig-r041-20220527
s390                 randconfig-r044-20220527
riscv                randconfig-r042-20220527

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
