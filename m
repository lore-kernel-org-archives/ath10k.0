Return-Path: <SRS0=rHb8=OG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C96C433F5
	for <ath10k@archiver.kernel.org>; Thu, 16 Sep 2021 11:13:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AFA86108F
	for <ath10k@archiver.kernel.org>; Thu, 16 Sep 2021 11:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AFA86108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PBvmu5LkEQZQfDndRUn8j9w6ZlPRF0WNpMBkOfwQIss=; b=qYQ7s15f+DDUhx
	jth/ot0va/mQMzh9s44UfMErWir1+vkgU0pqP7iorJPVS562PJ3/a8SI724oNQGb//+vHgMHw9yZY
	QDtC5J4Tz4EBo7Wito5HQ7UFCR9dk3ZcyyAbtRcFRk4tX8nfd1nybevv3D0LKFDLC2RM00pRyZM1j
	1889r+NpvHrJMqcVRJJqjIdKOwsCKfNUbLSBa1BGruG0G0vdzvqBzN4M3Jbzvj8wioft9duoB9Gyr
	JVY4FzzdjMA8WVp7oi3KAlaNPJ6fcoRUEBMRnqaGjVUv8+RraC/2Ia0Epd1E/YgjQLT8bSyGs9pu9
	OqfgU/ZX31EYh+T7s21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQpJj-00AxGj-UP; Thu, 16 Sep 2021 11:12:36 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQpJg-00AxEl-KN
 for ath10k@lists.infradead.org; Thu, 16 Sep 2021 11:12:34 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="244916429"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="244916429"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 04:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="698823426"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 16 Sep 2021 04:12:20 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mQpJT-0000yt-Lz; Thu, 16 Sep 2021 11:12:19 +0000
Date: Thu, 16 Sep 2021 19:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 a44366b8d882850d07788c395d4ccec018bdd9d4
Message-ID: <61432668.fLXK17yMKLkFufGE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_041232_751820_6A7CA7DC 
X-CRM114-Status: UNSURE (   6.14  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: a44366b8d882850d07788c395d4ccec018bdd9d4  Merge branch 'ath-next' into ath-qca

elapsed time: 4107m

configs tested: 199
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210916
i386                 randconfig-c001-20210915
powerpc                   motionpro_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        m5307c3_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7724_generic_defconfig
sh                          kfr2r09_defconfig
sh                     sh7710voipgw_defconfig
mips                 decstation_r4k_defconfig
arm                         mv78xx0_defconfig
arm                       spear13xx_defconfig
powerpc                     skiroot_defconfig
sh                     magicpanelr2_defconfig
powerpc                  mpc885_ads_defconfig
mips                         rt305x_defconfig
mips                     loongson1b_defconfig
powerpc                   lite5200b_defconfig
powerpc                      acadia_defconfig
powerpc                 xes_mpc85xx_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                             mxs_defconfig
powerpc                  mpc866_ads_defconfig
arm                         vf610m4_defconfig
powerpc                 mpc834x_mds_defconfig
arm                         hackkit_defconfig
arc                        vdk_hs38_defconfig
arm                          moxart_defconfig
powerpc                     redwood_defconfig
arc                           tb10x_defconfig
h8300                    h8300h-sim_defconfig
powerpc                  iss476-smp_defconfig
mips                        workpad_defconfig
arc                      axs103_smp_defconfig
x86_64                           alldefconfig
m68k                        m5272c3_defconfig
sh                           se7206_defconfig
arm                            qcom_defconfig
arc                         haps_hs_defconfig
m68k                          sun3x_defconfig
arm                        neponset_defconfig
sh                          urquell_defconfig
arm                         s5pv210_defconfig
arm                         palmz72_defconfig
arm                        multi_v7_defconfig
sh                   sh7770_generic_defconfig
sh                        apsh4ad0a_defconfig
ia64                         bigsur_defconfig
sh                         ecovec24_defconfig
arm                        spear6xx_defconfig
mips                           xway_defconfig
arm                            mmp2_defconfig
powerpc                        fsp2_defconfig
arc                              alldefconfig
sh                           se7721_defconfig
arm                  colibri_pxa300_defconfig
powerpc                      obs600_defconfig
mips                            ar7_defconfig
arm                        trizeps4_defconfig
x86_64               randconfig-c001-20210915
arm                  randconfig-c002-20210915
x86_64               randconfig-c001-20210914
x86_64               randconfig-c001-20210916
arm                  randconfig-c002-20210916
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
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
s390                                defconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210913
x86_64               randconfig-a003-20210913
x86_64               randconfig-a006-20210913
x86_64               randconfig-a004-20210913
x86_64               randconfig-a005-20210913
x86_64               randconfig-a001-20210913
i386                 randconfig-a004-20210913
i386                 randconfig-a005-20210913
i386                 randconfig-a002-20210913
i386                 randconfig-a006-20210913
i386                 randconfig-a003-20210913
i386                 randconfig-a001-20210913
x86_64               randconfig-a016-20210916
x86_64               randconfig-a013-20210916
x86_64               randconfig-a012-20210916
x86_64               randconfig-a011-20210916
x86_64               randconfig-a014-20210916
x86_64               randconfig-a015-20210916
i386                 randconfig-a016-20210914
i386                 randconfig-a015-20210914
i386                 randconfig-a011-20210914
i386                 randconfig-a012-20210914
i386                 randconfig-a013-20210914
i386                 randconfig-a014-20210914
i386                 randconfig-a016-20210916
i386                 randconfig-a015-20210916
i386                 randconfig-a011-20210916
i386                 randconfig-a012-20210916
i386                 randconfig-a013-20210916
i386                 randconfig-a014-20210916
arc                  randconfig-r043-20210913
riscv                randconfig-r042-20210916
s390                 randconfig-r044-20210916
arc                  randconfig-r043-20210916
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20210914
powerpc              randconfig-c003-20210914
s390                 randconfig-c005-20210914
riscv                randconfig-c006-20210916
powerpc              randconfig-c003-20210916
s390                 randconfig-c005-20210916
i386                 randconfig-a004-20210914
i386                 randconfig-a005-20210914
i386                 randconfig-a006-20210914
i386                 randconfig-a002-20210914
i386                 randconfig-a001-20210914
i386                 randconfig-a003-20210914
i386                 randconfig-a004-20210916
i386                 randconfig-a005-20210916
i386                 randconfig-a006-20210916
i386                 randconfig-a002-20210916
i386                 randconfig-a003-20210916
i386                 randconfig-a001-20210916
x86_64               randconfig-a002-20210914
x86_64               randconfig-a003-20210914
x86_64               randconfig-a004-20210914
x86_64               randconfig-a006-20210914
x86_64               randconfig-a005-20210914
x86_64               randconfig-a001-20210914
x86_64               randconfig-a016-20210913
x86_64               randconfig-a013-20210913
x86_64               randconfig-a012-20210913
x86_64               randconfig-a011-20210913
x86_64               randconfig-a014-20210913
x86_64               randconfig-a015-20210913
i386                 randconfig-a016-20210913
i386                 randconfig-a011-20210913
i386                 randconfig-a015-20210913
i386                 randconfig-a012-20210913
i386                 randconfig-a013-20210913
i386                 randconfig-a014-20210913
x86_64               randconfig-a002-20210916
x86_64               randconfig-a003-20210916
x86_64               randconfig-a006-20210916
x86_64               randconfig-a004-20210916
x86_64               randconfig-a005-20210916
x86_64               randconfig-a001-20210916
riscv                randconfig-r042-20210913
hexagon              randconfig-r045-20210913
s390                 randconfig-r044-20210913
hexagon              randconfig-r041-20210913
hexagon              randconfig-r045-20210916
hexagon              randconfig-r041-20210916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
