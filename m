Return-Path: <SRS0=a9IF=L3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A95C07E95
	for <ath10k@archiver.kernel.org>; Sat,  3 Jul 2021 03:05:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B39C36108B
	for <ath10k@archiver.kernel.org>; Sat,  3 Jul 2021 03:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B39C36108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qyF9EEVNtvc/0FA2c+TqqQYen5NTTVIinWM0mgvTB+E=; b=cU2SP/9hxYQm+U
	9jDsFtu5Ij/1IhYS9gWGokLE6qc6EmFPeA1lHiMtMJ6BZwLY8xrW22YKMpD17/8IsLRT0bzgQBtyn
	7B5Jzk1nyVCGM2JwB0DhZytKsB/zdV7pEAri3tImIo9W74s8UPGOfYVyAWuvcBSbwQ1pkb1OfDeDs
	cHmkQU4zU7Ar7zRO8jlVyLYoBYHM2bmfZhFBUfXYykapGe9fFJ9SPiWFBzOEWvCfgxnTZauddX1Cm
	SeDanZFqUPHuTpjvm+wxAZeyEQq97y82uZBvJhk/4lQFLjgLW3Mm+2nKKYqp6kMw/IfjKtPUqeWiP
	vbxfZl/2HSDvYwgkP7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzVxt-004Rgo-M1; Sat, 03 Jul 2021 03:05:09 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzVxq-004RgU-Or
 for ath10k@lists.infradead.org; Sat, 03 Jul 2021 03:05:08 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="205793771"
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="205793771"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 20:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="483081250"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2021 20:04:59 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lzVxj-000BLu-5T; Sat, 03 Jul 2021 03:04:59 +0000
Date: Sat, 03 Jul 2021 11:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:ath-qca] BUILD SUCCESS
 cfa385651dea080209fdc5f747171ad257ca0337
Message-ID: <60dfd3d2.21UjVXnbHJxqY06Z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_200506_884186_EBC88CF9 
X-CRM114-Status: UNSURE (   6.22  )
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
branch HEAD: cfa385651dea080209fdc5f747171ad257ca0337  Merge branch 'ath-next' into ath-qca

elapsed time: 855m

configs tested: 146
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     rainier_defconfig
arm                  colibri_pxa270_defconfig
powerpc                        cell_defconfig
arm                        neponset_defconfig
arm                        oxnas_v6_defconfig
sh                          landisk_defconfig
powerpc                     redwood_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                        nlm_xlr_defconfig
sh                              ul2_defconfig
powerpc                     mpc512x_defconfig
powerpc                   motionpro_defconfig
sh                            titan_defconfig
mips                           rs90_defconfig
arc                         haps_hs_defconfig
mips                     loongson1c_defconfig
riscv                             allnoconfig
powerpc                     skiroot_defconfig
sh                        sh7757lcr_defconfig
arm                       omap2plus_defconfig
sh                           se7712_defconfig
arm                         vf610m4_defconfig
mips                      pistachio_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                          r7780mp_defconfig
m68k                          amiga_defconfig
powerpc                        fsp2_defconfig
sh                        dreamcast_defconfig
mips                          ath79_defconfig
arm                         axm55xx_defconfig
powerpc                      walnut_defconfig
m68k                        mvme16x_defconfig
arm                           omap1_defconfig
powerpc                     stx_gp3_defconfig
mips                           gcw0_defconfig
arm                            hisi_defconfig
xtensa                          iss_defconfig
arm                        multi_v5_defconfig
sh                           se7750_defconfig
m68k                          atari_defconfig
h8300                               defconfig
powerpc                     kmeter1_defconfig
mips                           ci20_defconfig
sh                        edosk7760_defconfig
mips                           jazz_defconfig
m68k                            mac_defconfig
x86_64                            allnoconfig
arm                       spear13xx_defconfig
mips                 decstation_r4k_defconfig
sh                   sh7724_generic_defconfig
arc                     haps_hs_smp_defconfig
mips                      malta_kvm_defconfig
openrisc                            defconfig
powerpc                     pseries_defconfig
openrisc                 simple_smp_defconfig
arm                             pxa_defconfig
arm                         bcm2835_defconfig
arm                        spear6xx_defconfig
arm                           tegra_defconfig
powerpc                 mpc834x_mds_defconfig
mips                        vocore2_defconfig
m68k                       m5208evb_defconfig
powerpc                     sbc8548_defconfig
powerpc                    gamecube_defconfig
arm                      integrator_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     mpc5200_defconfig
sh                           se7206_defconfig
powerpc                     tqm5200_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210702
i386                 randconfig-a006-20210702
i386                 randconfig-a001-20210702
i386                 randconfig-a003-20210702
i386                 randconfig-a005-20210702
i386                 randconfig-a002-20210702
x86_64               randconfig-a015-20210702
x86_64               randconfig-a012-20210702
x86_64               randconfig-a014-20210702
x86_64               randconfig-a011-20210702
x86_64               randconfig-a016-20210702
x86_64               randconfig-a013-20210702
i386                 randconfig-a015-20210702
i386                 randconfig-a016-20210702
i386                 randconfig-a011-20210702
i386                 randconfig-a012-20210702
i386                 randconfig-a013-20210702
i386                 randconfig-a014-20210702
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210702
x86_64               randconfig-a004-20210702
x86_64               randconfig-a005-20210702
x86_64               randconfig-a002-20210702
x86_64               randconfig-a006-20210702
x86_64               randconfig-a003-20210702
x86_64               randconfig-a001-20210702

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
