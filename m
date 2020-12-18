Return-Path: <SRS0=/SRF=FW=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3666C4361B
	for <ath10k@archiver.kernel.org>; Fri, 18 Dec 2020 04:46:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E2C623A23
	for <ath10k@archiver.kernel.org>; Fri, 18 Dec 2020 04:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E2C623A23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+fx5pPoDPVkV9NHlM2KvUDLdqf7IjMXVlP8v0RNdLZM=; b=2EB9R0QyNmynQiX+CWbDI3QqCo
	EGcUBPURzV7sV4p/Y5ivD8N6oPvyIKqqcmABvG0F3cvJA+PHV7pNzoI7ZY36d0XfoixHN63aTLrvq
	FjyGA/wi1d6ARyQyKYG6I4/nC8Tkpslt53qDTfH4rksCnixsjct5HablL14DRe8SRqvllBWi4maCs
	sUzUgY/X73G2ZYWZTo2yWn3lyRE/3fWoHiAGHuam0BCHFXPATX9/tr245XV0Nd+uzY9MNPry19zhi
	lygZuL+tu6pitpRplFj7e2zgI6VAdNMXRxqbdvbU9dc7I0UBfdNBJlSD69r6mYPC88nWZfxoBtPnW
	iDFntfsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq7dg-0002M1-Tx; Fri, 18 Dec 2020 04:45:12 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq7dd-0002LP-Ib
 for ath10k@lists.infradead.org; Fri, 18 Dec 2020 04:45:11 +0000
IronPort-SDR: 2408jRdBwIfzS7lkG5fTuydu1fBgt8TgDF7x5C/BdSDfbhpAw+WRo7yIGIVDv2N1x+AJC/Q3Lx
 H5nibmymCIKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9838"; a="163114499"
X-IronPort-AV: E=Sophos;i="5.78,429,1599548400"; d="scan'208";a="163114499"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 20:45:05 -0800
IronPort-SDR: 6k1b0EQrOkCcIOEmZN4IeVCW9/i+lI8HfP8zp4gl0SFnkcCvzP6FMWswnvoE5hJSmkrT8OeAPi
 dvWBqdLBTmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,429,1599548400"; d="scan'208";a="370342968"
Received: from lkp-server02.sh.intel.com (HELO c4fb2a2464e8) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 17 Dec 2020 20:45:04 -0800
Received: from kbuild by c4fb2a2464e8 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kq7dX-00000S-F4; Fri, 18 Dec 2020 04:45:03 +0000
Date: Fri, 18 Dec 2020 12:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:master-pending] BUILD SUCCESS
 8088258f0a671fcf37be3b08183dcf2d2451b2bf
Message-ID: <5fdc33af.wFbYtvmTYbKV8YqC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_234509_852213_E625AFB1 
X-CRM114-Status: UNSURE (   6.51  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  master-pending
branch HEAD: 8088258f0a671fcf37be3b08183dcf2d2451b2bf  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 174
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                          hp300_defconfig
s390                          debug_defconfig
xtensa                    smp_lx200_defconfig
arm                         palmz72_defconfig
mips                        nlm_xlp_defconfig
arm                         cm_x300_defconfig
powerpc                      pasemi_defconfig
powerpc                      mgcoge_defconfig
powerpc                    mvme5100_defconfig
powerpc                     rainier_defconfig
powerpc                  mpc885_ads_defconfig
sh                          landisk_defconfig
arm                        shmobile_defconfig
m68k                          sun3x_defconfig
powerpc                     tqm8541_defconfig
mips                           gcw0_defconfig
powerpc                      ppc64e_defconfig
arm                  colibri_pxa270_defconfig
s390                       zfcpdump_defconfig
arm                            mps2_defconfig
xtensa                         virt_defconfig
arm                        realview_defconfig
powerpc                    gamecube_defconfig
s390                             alldefconfig
sh                           se7721_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          kfr2r09_defconfig
mips                      malta_kvm_defconfig
m68k                        mvme147_defconfig
arm                         nhk8815_defconfig
sh                         ap325rxa_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                     taishan_defconfig
arm                         assabet_defconfig
c6x                              alldefconfig
powerpc                         ps3_defconfig
mips                malta_kvm_guest_defconfig
mips                  cavium_octeon_defconfig
mips                      bmips_stb_defconfig
mips                       capcella_defconfig
sh                          r7780mp_defconfig
mips                         db1xxx_defconfig
mips                        maltaup_defconfig
mips                         tb0226_defconfig
sh                           se7750_defconfig
arc                      axs103_smp_defconfig
arc                         haps_hs_defconfig
powerpc                      ppc6xx_defconfig
mips                        nlm_xlr_defconfig
arm                          collie_defconfig
openrisc                         alldefconfig
arm                          imote2_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                           h3600_defconfig
powerpc                     redwood_defconfig
c6x                        evmc6678_defconfig
c6x                         dsk6455_defconfig
arm                           viper_defconfig
powerpc                    amigaone_defconfig
sh                          rsk7269_defconfig
h8300                               defconfig
arm                      jornada720_defconfig
powerpc                           allnoconfig
m68k                       m5475evb_defconfig
mips                           mtx1_defconfig
sh                          sdk7786_defconfig
arm                         lpc32xx_defconfig
arm                          moxart_defconfig
powerpc                    socrates_defconfig
arm                          ep93xx_defconfig
h8300                       h8s-sim_defconfig
nios2                            alldefconfig
sh                            hp6xx_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
mips                         bigsur_defconfig
microblaze                          defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         hackkit_defconfig
arm64                            alldefconfig
mips                        jmr3927_defconfig
powerpc                     tqm8548_defconfig
um                            kunit_defconfig
powerpc                 mpc8313_rdb_defconfig
xtensa                           alldefconfig
arm                  colibri_pxa300_defconfig
mips                        qi_lb60_defconfig
powerpc64                        alldefconfig
powerpc                      bamboo_defconfig
arm                        mvebu_v7_defconfig
powerpc                     ksi8560_defconfig
ia64                             alldefconfig
sh                     magicpanelr2_defconfig
sh                          urquell_defconfig
sparc64                             defconfig
arm                        magician_defconfig
powerpc                     kmeter1_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
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
riscv                    nommu_virt_defconfig
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
