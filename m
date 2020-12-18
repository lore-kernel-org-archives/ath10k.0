Return-Path: <SRS0=/SRF=FW=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA04C4361B
	for <ath10k@archiver.kernel.org>; Fri, 18 Dec 2020 04:45:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7254723A1E
	for <ath10k@archiver.kernel.org>; Fri, 18 Dec 2020 04:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7254723A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KkwRoOAe/cgFsvk03l6YkChWvE8He7zPBQbETlG0jOE=; b=tBPOA2A2de7V0t4L1D/Kn0vYAF
	oMUF37PCD/LMpPaXrjF0c+EkKvGjQ8Sh0xaehKMaBK8pKKIr4wXEfh6P+xpwAZhCCAc5igcGo2TCm
	K0PLDYSg0zkUNQp2cqXyXIjFZ4X3nsvEWx2z2J3ZDSxUzfmJPLU7I6aLewWn8OzzWlsClRgY6Cq6E
	D/cd9HbgXk62graYC4El1HQhaT9oMoVr2zHHCBnWI2b9+MmGPO5nTBm7CZ8/X0zr0bsLpVrHVqEUx
	USAA8bF9UCkZqfaOFnXuUztxOS5x+QNcbL7KDiZtybxxM47VbVC2cG+yAW1jmZEsqFFbk3s8zlDfP
	qRPTTIjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq7dh-0002MC-N6; Fri, 18 Dec 2020 04:45:13 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq7dd-0002LQ-Ht
 for ath10k@lists.infradead.org; Fri, 18 Dec 2020 04:45:11 +0000
IronPort-SDR: FCGz4q5Gd8jwUxrS7Su4YJ14ea0gSstHg34Rp/zZ1AIVbPXqgzQWxXEj+QXasN/a7Eeikc8Flo
 ShLqFV87XniQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9838"; a="162428214"
X-IronPort-AV: E=Sophos;i="5.78,429,1599548400"; d="scan'208";a="162428214"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 20:45:05 -0800
IronPort-SDR: FgqoZSewOowddf48aUJcKlqt6/1L7EH1dchzFcptWa1FHcvCoXlCZZC8zv3QU3ciQzWgS6D8gy
 Zi57Qj9Ry/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,429,1599548400"; d="scan'208";a="353754210"
Received: from lkp-server02.sh.intel.com (HELO c4fb2a2464e8) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 17 Dec 2020 20:45:04 -0800
Received: from kbuild by c4fb2a2464e8 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kq7dX-00000V-SW; Fri, 18 Dec 2020 04:45:03 +0000
Date: Fri, 18 Dec 2020 12:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:pending] BUILD SUCCESS
 cbbbf4f251e012280705090bfb0d9b034826babd
Message-ID: <5fdc33b1.lk2Fa33Bzu3rAI15%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_234509_765756_516CDBF6 
X-CRM114-Status: UNSURE (   8.93  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  pending
branch HEAD: cbbbf4f251e012280705090bfb0d9b034826babd  ath11k: pci: disable ASPM L0sLs before downloading firmware

elapsed time: 722m

configs tested: 172
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
arm                       mainstone_defconfig
arm                          prima2_defconfig
mips                    maltaup_xpa_defconfig
powerpc                     mpc512x_defconfig
s390                       zfcpdump_defconfig
arm                            mps2_defconfig
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
powerpc                      ppc64e_defconfig
arm                          imote2_defconfig
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
powerpc                     tqm8541_defconfig
powerpc                 mpc8313_rdb_defconfig
xtensa                           alldefconfig
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
x86_64               randconfig-a016-20201218
x86_64               randconfig-a013-20201218
x86_64               randconfig-a012-20201218
x86_64               randconfig-a015-20201218
x86_64               randconfig-a014-20201218
x86_64               randconfig-a011-20201218
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
