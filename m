Return-Path: <SRS0=ohlR=PB=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7929DC433EF
	for <ath10k@archiver.kernel.org>; Wed, 13 Oct 2021 23:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3233660E78
	for <ath10k@archiver.kernel.org>; Wed, 13 Oct 2021 23:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3233660E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0aapv+gGLRnsQcJ86lLW6QWAkFJjqvUfzQFCm9K+Dk8=; b=PhrqausSFq7EIV
	05bYmgCi3k/t4/DYCp5IyDkF7uZhZTnbT/krKYpV4KxvagTsYMEo+f+pqplP8j/DFqv0Km2Ob0NSh
	THVIi3dGredSiPD9w/GFdwmQjnq1HW+zaAN506zatgkf2/C2l+YAXUd7+jxMqIJBHY/rEHjNYULEH
	UFYxHT/lAoi4FWXE4E2j6Up5HSg6Jeo4C2uxiLnG2KK/h7xBKatPjvJiutw/i3sb4UjDncCsxiU2Q
	tmnrfsft5YS6XKgODlfYsIkh50XZPgS0AKRMcL33PKSCDG/g9uNuX9MHM5bCZnpiLWoEbYDIx9Zfq
	7kWEyjhY0pW7dVoeVDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1manNw-000zGW-2A; Wed, 13 Oct 2021 23:10:08 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1manNs-000zBb-UV
 for ath10k@lists.infradead.org; Wed, 13 Oct 2021 23:10:06 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227457831"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227457831"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="441844189"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 13 Oct 2021 16:09:45 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1manNY-0005H0-Vl; Wed, 13 Oct 2021 23:09:44 +0000
Date: Thu, 14 Oct 2021 07:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 fed75e3e11d274c2db0625ee73721795a40d6567
Message-ID: <61676702.wFL26GnT40PHP7LC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_161005_071016_14A03B13 
X-CRM114-Status: UNSURE (   5.45  )
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
branch HEAD: fed75e3e11d274c2db0625ee73721795a40d6567  ath11k: set correct NL80211_FEATURE_DYNAMIC_SMPS for WCN6855

elapsed time: 1017m

configs tested: 155
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211013
powerpc                          allyesconfig
mips                           jazz_defconfig
arm                          iop32x_defconfig
um                                  defconfig
sh                           se7721_defconfig
powerpc                         ps3_defconfig
mips                     cu1000-neo_defconfig
arm                       spear13xx_defconfig
arm                          pxa168_defconfig
arc                     nsimosci_hs_defconfig
arm                            mmp2_defconfig
powerpc                  storcenter_defconfig
arm                         lpc32xx_defconfig
um                               alldefconfig
arm                        multi_v7_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc8560_ads_defconfig
riscv                               defconfig
powerpc                    sam440ep_defconfig
h8300                     edosk2674_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                             ezx_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      mgcoge_defconfig
sh                           se7724_defconfig
powerpc                 mpc832x_mds_defconfig
mips                  decstation_64_defconfig
h8300                            allyesconfig
sh                             sh03_defconfig
powerpc                     asp8347_defconfig
riscv                    nommu_virt_defconfig
powerpc                      ppc6xx_defconfig
xtensa                  audio_kc705_defconfig
arm                       mainstone_defconfig
sh                          urquell_defconfig
arm                        realview_defconfig
arm                          exynos_defconfig
m68k                           sun3_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                          amiga_defconfig
mips                           xway_defconfig
m68k                         amcore_defconfig
arm                        mini2440_defconfig
ia64                          tiger_defconfig
mips                        jmr3927_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm5200_defconfig
powerpc                        icon_defconfig
powerpc                      tqm8xx_defconfig
mips                     cu1830-neo_defconfig
mips                     loongson1b_defconfig
mips                           ip32_defconfig
openrisc                    or1ksim_defconfig
arm                         lpc18xx_defconfig
arc                        vdk_hs38_defconfig
mips                     loongson2k_defconfig
arm                           u8500_defconfig
powerpc                       holly_defconfig
nios2                            alldefconfig
mips                       bmips_be_defconfig
mips                        bcm63xx_defconfig
arm                      jornada720_defconfig
arm                  randconfig-c002-20211013
x86_64               randconfig-c001-20211013
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20211013
x86_64               randconfig-a012-20211013
x86_64               randconfig-a016-20211013
x86_64               randconfig-a014-20211013
x86_64               randconfig-a013-20211013
x86_64               randconfig-a011-20211013
i386                 randconfig-a016-20211013
i386                 randconfig-a014-20211013
i386                 randconfig-a011-20211013
i386                 randconfig-a015-20211013
i386                 randconfig-a012-20211013
i386                 randconfig-a013-20211013
arc                  randconfig-r043-20211012
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211013
mips                 randconfig-c004-20211013
i386                 randconfig-c001-20211013
s390                 randconfig-c005-20211013
x86_64               randconfig-c007-20211013
powerpc              randconfig-c003-20211013
riscv                randconfig-c006-20211013
x86_64               randconfig-a004-20211013
x86_64               randconfig-a006-20211013
x86_64               randconfig-a001-20211013
x86_64               randconfig-a005-20211013
x86_64               randconfig-a002-20211013
x86_64               randconfig-a003-20211013
i386                 randconfig-a001-20211013
i386                 randconfig-a003-20211013
i386                 randconfig-a004-20211013
i386                 randconfig-a005-20211013
i386                 randconfig-a002-20211013
i386                 randconfig-a006-20211013
x86_64               randconfig-a015-20211012
x86_64               randconfig-a012-20211012
x86_64               randconfig-a016-20211012
x86_64               randconfig-a014-20211012
x86_64               randconfig-a013-20211012
x86_64               randconfig-a011-20211012
hexagon              randconfig-r041-20211013
hexagon              randconfig-r045-20211013
hexagon              randconfig-r041-20211012
s390                 randconfig-r044-20211012
riscv                randconfig-r042-20211012
hexagon              randconfig-r045-20211012

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
