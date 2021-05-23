Return-Path: <SRS0=HTCl=KT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658A3C2B9F7
	for <ath10k@archiver.kernel.org>; Mon, 24 May 2021 23:05:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 272EA6140B
	for <ath10k@archiver.kernel.org>; Mon, 24 May 2021 23:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 272EA6140B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hnISZybqGT6oyNekfG2qFfTrp/o+6ZEGUAX8fYxRols=; b=zq0tm/fwo3ER3E
	HWMmVdv25QjGNO4heWUuXfpzIp9OWXVdlGSKqgTCxpstl/kj/lPUfgZOOibDg4Wz9hGn9OaGnrVjF
	LfrgfVkeCFv+glAvKaJnx/W2dec4Chr4VLkvFIDkpF6tXNWI3mT6d8dRY+QzR81grj107wqacI6Hj
	KKdUSpv1mX1459pEWn4TERk7J5ZCgkvTT0vtGEEDkU+8LJq8LwKDKNUE21+uyZLRjxvNY1TDPnVnS
	MY+aZpQl9yg6WRtHAsgrpQHCthhtSB9FHpUXIUIZQkSNHjbOQ02ZG4VdxxFJwq12wlXaBpeq0cNJ/
	wDVpTAgnjFuxzIkot0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llJdT-002Gi0-K4; Mon, 24 May 2021 23:05:23 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkxxp-000cM9-Ry
 for ath10k@lists.infradead.org; Sun, 23 May 2021 23:56:59 +0000
IronPort-SDR: EPeNuI5+e+Iq/KT3BvAHEDnHQ8BGRMVjf3YTP+zksJeJGPA7+PfqLwnyf5keUtcria/ock3n0P
 EzbZPVrjbG6Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="287387610"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="287387610"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2021 16:56:53 -0700
IronPort-SDR: 3y8SJ0DlT/v8kFLmaMZLIHim3kuEALIMaLzU5vEh9oC+52Q28Aph0/+6IBIkoOouIx64tSeucu
 dlR7Gqtd8hng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="407518591"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 23 May 2021 16:56:52 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lkxxj-00010p-Fs; Sun, 23 May 2021 23:56:51 +0000
Date: Mon, 24 May 2021 07:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [ath6kl:master-pending] BUILD SUCCESS
 837c7030f21f33f995308f5248b4d97684a43a5b
Message-ID: <60aaeb95.a6PhGdW2XupOwN+N%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_165657_967379_1F7C6300 
X-CRM114-Status: UNSURE (   3.67  )
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
branch HEAD: 837c7030f21f33f995308f5248b4d97684a43a5b  Merge branch 'pending' into master-pending

elapsed time: 722m

configs tested: 178
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         rt305x_defconfig
m68k                       m5249evb_defconfig
mips                     loongson1c_defconfig
arm                        mini2440_defconfig
powerpc                         wii_defconfig
microblaze                          defconfig
sh                               j2_defconfig
arm                            pleb_defconfig
arm                         lubbock_defconfig
arm                        mvebu_v7_defconfig
sh                           se7619_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      mgcoge_defconfig
ia64                        generic_defconfig
arm                         s5pv210_defconfig
arm                          pxa168_defconfig
powerpc                  iss476-smp_defconfig
h8300                            allyesconfig
powerpc                      chrp32_defconfig
arm                         hackkit_defconfig
openrisc                            defconfig
openrisc                 simple_smp_defconfig
arm                            lart_defconfig
sh                         microdev_defconfig
mips                       capcella_defconfig
arm                          lpd270_defconfig
powerpc                      ppc64e_defconfig
riscv                    nommu_virt_defconfig
sh                            shmin_defconfig
xtensa                           alldefconfig
mips                      loongson3_defconfig
arm                         orion5x_defconfig
arc                          axs101_defconfig
riscv                    nommu_k210_defconfig
arm                           stm32_defconfig
powerpc                       ppc64_defconfig
arm                           h5000_defconfig
sh                              ul2_defconfig
nios2                         3c120_defconfig
mips                     loongson2k_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc836x_mds_defconfig
sh                                  defconfig
m68k                       m5475evb_defconfig
arm                        spear6xx_defconfig
um                             i386_defconfig
xtensa                              defconfig
sh                        edosk7705_defconfig
sh                          landisk_defconfig
arm                      footbridge_defconfig
xtensa                       common_defconfig
arm                          collie_defconfig
sh                          rsk7201_defconfig
arm                       cns3420vb_defconfig
m68k                          sun3x_defconfig
arm                           viper_defconfig
powerpc                 mpc8560_ads_defconfig
sh                           sh2007_defconfig
um                            kunit_defconfig
powerpc                     powernv_defconfig
sh                          r7780mp_defconfig
i386                                defconfig
sh                        sh7757lcr_defconfig
arc                         haps_hs_defconfig
sh                   sh7770_generic_defconfig
mips                        vocore2_defconfig
arm                         nhk8815_defconfig
arm                    vt8500_v6_v7_defconfig
mips                   sb1250_swarm_defconfig
arc                     haps_hs_smp_defconfig
x86_64                           alldefconfig
arm                         vf610m4_defconfig
h8300                               defconfig
h8300                     edosk2674_defconfig
powerpc                      pcm030_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                          atari_defconfig
powerpc                      katmai_defconfig
sh                     sh7710voipgw_defconfig
sh                          rsk7203_defconfig
ia64                          tiger_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                          ath25_defconfig
x86_64                            allnoconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210524
i386                 randconfig-a002-20210524
i386                 randconfig-a005-20210524
i386                 randconfig-a006-20210524
i386                 randconfig-a004-20210524
i386                 randconfig-a003-20210524
i386                 randconfig-a001-20210523
i386                 randconfig-a005-20210523
i386                 randconfig-a002-20210523
i386                 randconfig-a003-20210523
i386                 randconfig-a004-20210523
i386                 randconfig-a006-20210523
x86_64               randconfig-a013-20210523
x86_64               randconfig-a014-20210523
x86_64               randconfig-a012-20210523
x86_64               randconfig-a016-20210523
x86_64               randconfig-a015-20210523
x86_64               randconfig-a011-20210523
i386                 randconfig-a016-20210523
i386                 randconfig-a011-20210523
i386                 randconfig-a015-20210523
i386                 randconfig-a012-20210523
i386                 randconfig-a014-20210523
i386                 randconfig-a013-20210523
x86_64               randconfig-a005-20210524
x86_64               randconfig-a001-20210524
x86_64               randconfig-a006-20210524
x86_64               randconfig-a003-20210524
x86_64               randconfig-a004-20210524
x86_64               randconfig-a002-20210524
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210524
x86_64               randconfig-b001-20210523
x86_64               randconfig-a006-20210523
x86_64               randconfig-a001-20210523
x86_64               randconfig-a005-20210523
x86_64               randconfig-a003-20210523
x86_64               randconfig-a004-20210523
x86_64               randconfig-a002-20210523
x86_64               randconfig-a013-20210524
x86_64               randconfig-a012-20210524
x86_64               randconfig-a014-20210524
x86_64               randconfig-a016-20210524
x86_64               randconfig-a015-20210524
x86_64               randconfig-a011-20210524

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
