Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A0DECAAA1
	for <ath10k@archiver.kernel.org>; Fri, 16 Sep 2022 22:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nbsUHfwxeMkQDZoB1Goe7RtMtkR8020ihXWXkoaLtZs=; b=TK70DkT4B8oYoI
	JIGV7WueOQdM4/Qybd2ypnrfSy6FvNangljL4kRE20nknEcPjvOKcOYEc7Po1PNTJmVRFCF8A6wRu
	CDwrMWST38Ox7bykhkCMuzN9wgP23mITCh4jPnJ6OKs5SZDnp+KQGcVAHflNOcsKynl9jip96eIcu
	aLlQTrZYI1v7w/KKecbd8ym/4KdqiMf3tFf9TBvF6IfvEXRYmeq8sk8QMsNp8CBK/vToHvQxObn36
	SU6497GuMQEIWgKxOSWTKZTg5t4SFvyIK/9W6/ygQ+/suOHPRD+h2Xe3pXuXGxrw9GPQu3IcyMhzV
	IhVMoIPAgf3+WHsojmow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJRA-00HRhe-JW; Fri, 16 Sep 2022 22:03:52 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJR4-00HRd2-9D
	for ath10k@lists.infradead.org; Fri, 16 Sep 2022 22:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663365826; x=1694901826;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hIX3P0OiwfVcpNqr1DdeujsQ1jENBqYO3ITNEy2UgJE=;
  b=UZmj0NlKiSIZMGNIHArQaVlOK25lzfw+/JosMSUIjClVQ87Yc0tjKt88
   mE/m6m2n9RLixE7jRtF8IMFie6wyVs9ATyviZIMTVUwFNd3WDLLmB3hx1
   tdWC3yh+r/YSn8fvhpYqY8f1nBdY3V2ewdli1lpsJ+IA2oAFTkvFFMlMc
   omXws2zMpmOiM8AFKrjeYlgERArZ2lZljAYqGZ1cMxuoIoffzYP4G0e+z
   iAQGkLjODD7l3xn5vj9fh6CiqcEHh8PsUmux6kHY7+kbwUmGxAT5uhF/I
   VbbrNuKdIRUr2ljbgVrb5zhQplLuRsqpYQANLplFPlvBnD9CeMBxx1frO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="299078901"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="299078901"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 15:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="706907430"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2022 15:03:40 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZJQx-0002Aw-2l;
	Fri, 16 Sep 2022 22:03:39 +0000
Date: Sat, 17 Sep 2022 06:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 3f505a30ea6b0fdfa4bf214b5383e8d4e6a2832e
Message-ID: <6324f2ac.cMai6iXB4bHBruly%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_150346_372402_741EF6BE 
X-CRM114-Status: UNSURE (   5.44  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 3f505a30ea6b0fdfa4bf214b5383e8d4e6a2832e  wifi: ath11k: Fix kernel-doc issues

elapsed time: 727m

configs tested: 126
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
alpha                            allyesconfig
s390                             allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
s390                                defconfig
x86_64                              defconfig
m68k                             allyesconfig
arc                  randconfig-r043-20220916
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
s390                             allyesconfig
arm                                 defconfig
powerpc                           allnoconfig
x86_64                        randconfig-a004
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a001
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a005
arm                              allyesconfig
ia64                             allmodconfig
i386                             allyesconfig
arm64                            allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
arc                 nsimosci_hs_smp_defconfig
mips                  decstation_64_defconfig
s390                          debug_defconfig
powerpc                     rainier_defconfig
x86_64                        randconfig-c001
i386                          randconfig-c001
arm                  randconfig-c002-20220916
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arc                              alldefconfig
powerpc                     stx_gp3_defconfig
m68k                       m5475evb_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                    amigaone_defconfig
arm                        oxnas_v6_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
mips                        bcm47xx_defconfig
arc                           tb10x_defconfig
arc                          axs101_defconfig
openrisc                       virt_defconfig
mips                      maltasmvp_defconfig
loongarch                           defconfig
sh                         ecovec24_defconfig
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
arc                        nsimosci_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                            hp6xx_defconfig
powerpc                   currituck_defconfig
mips                     loongson1b_defconfig
powerpc                      bamboo_defconfig
powerpc                      pcm030_defconfig
powerpc                      pasemi_defconfig
arm                       omap2plus_defconfig
powerpc                      chrp32_defconfig
openrisc                 simple_smp_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
hexagon              randconfig-r041-20220916
riscv                randconfig-r042-20220916
hexagon              randconfig-r045-20220916
s390                 randconfig-r044-20220916
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-k001
arm                          sp7021_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     mpc512x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
