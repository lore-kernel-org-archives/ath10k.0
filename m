Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49CAC433EF
	for <ath10k@archiver.kernel.org>; Fri, 10 Dec 2021 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t6sBMVzCW4XePcaxb7QIdIdBcnm7KWaUtA1GvksV/kM=; b=a+GPExLPtXr1sH
	EalElr5U/tQxIC8HLiTMS9+w7SC4Z443u4rNM3pzvyAXV9cTJcQdn3ldY84MAE4D9XkMYVfNwLmN8
	h0GjfPKLLcENbaRF3n17SN4ZNP8KBfkJT4rBTLwBi9oWlozTCtPwupaHEwnrDykdPr/Wu/FBhNXQd
	DRmeoSyWC6Z2yfHiLFpqI7cRNu8P7/r9AvL70/4qv+1MBkS0iqjmmYd/IaE6HovW02DVhIa6UJ9wR
	ufAxPX4+ZYp4GYQavBHHUqB51FKc450nvmhanWZjPUC/BRiBrn0Ayp09rGELhIrKpD5bEqECRdKEo
	LjsHIuOzYZvBWI61ZPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvcBJ-001LnV-OA; Fri, 10 Dec 2021 09:27:09 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvcBG-001Llb-14
 for ath10k@lists.infradead.org; Fri, 10 Dec 2021 09:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639128426; x=1670664426;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=tUfB02DjOHd5wPl0AKxPx7EwPkE6kLaE3FcsEhyb+yc=;
 b=E6QU0ViRTuC7p7przu9J6nTMIHIfes67RLugzXh0GeaiVwRmk6F1CotD
 ElEONQPvvIL7rBzDlAts5t6CKZEVAZYnOFOhTNk7/F3+1PO172xh0E4VH
 2gP3rC8dSSpRifOsfpLh5RMJpUu96IfOqz7AnIBTodB5hukes2286G8N2
 YxUOx3f3Tmm5bczACIqDQfJjFYOGPW/RXtqMv1iL+6VDeck0vQbD4czqM
 PAYvHi/ClXXgQg7c4JHvu5aUUV7f7crOvqCpj3SxtzCTcOkZpjLjmyIRb
 POk2RyzewOgFDN6Z6pxNbDaLc1HmoH38Pdzw5Js0HadgAiK8JRZIVP7Eb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225181766"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="225181766"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 01:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="463609531"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 10 Dec 2021 01:27:00 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mvcB9-000314-Rh; Fri, 10 Dec 2021 09:26:59 +0000
Date: Fri, 10 Dec 2021 17:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 34cbb4043dca455fca888e1ced323e588912b6a2
Message-ID: <61b31d4e.rzhuA58pr+Zw0/r5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_012706_163006_4B7B52C9 
X-CRM114-Status: UNSURE (   5.60  )
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
branch HEAD: 34cbb4043dca455fca888e1ced323e588912b6a2  ath11k: Fix deleting uninitialized kernel timer during fragment cache flush

elapsed time: 881m

configs tested: 166
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211210
powerpc                    socrates_defconfig
sh                          r7780mp_defconfig
m68k                       m5208evb_defconfig
sh                          sdk7780_defconfig
mips                        qi_lb60_defconfig
powerpc                      chrp32_defconfig
powerpc                     pq2fads_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           u8500_defconfig
xtensa                  cadence_csp_defconfig
m68k                          amiga_defconfig
powerpc                           allnoconfig
sh                          polaris_defconfig
arm                           corgi_defconfig
arm                         assabet_defconfig
sh                        sh7785lcr_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                           ip28_defconfig
nios2                         10m50_defconfig
powerpc                     asp8347_defconfig
mips                        vocore2_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     kilauea_defconfig
powerpc                      makalu_defconfig
sh                          lboxre2_defconfig
x86_64                           alldefconfig
powerpc                      ppc6xx_defconfig
xtensa                  audio_kc705_defconfig
ia64                         bigsur_defconfig
sh                           se7712_defconfig
arm                             rpc_defconfig
sparc                       sparc32_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                           se7705_defconfig
powerpc                      mgcoge_defconfig
sh                          sdk7786_defconfig
arm                           sama7_defconfig
mips                         cobalt_defconfig
sh                          rsk7201_defconfig
arm                        multi_v5_defconfig
nds32                               defconfig
m68k                         apollo_defconfig
sh                        sh7763rdp_defconfig
arm                     am200epdkit_defconfig
mips                         mpc30x_defconfig
powerpc                 canyonlands_defconfig
powerpc                      pcm030_defconfig
arm                        keystone_defconfig
xtensa                              defconfig
powerpc                     ppa8548_defconfig
um                             i386_defconfig
h8300                            alldefconfig
m68k                        stmark2_defconfig
mips                        bcm63xx_defconfig
powerpc                  iss476-smp_defconfig
arm                             pxa_defconfig
m68k                        m5407c3_defconfig
powerpc                        warp_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                           tegra_defconfig
powerpc                 mpc836x_mds_defconfig
arm                     davinci_all_defconfig
powerpc                     taishan_defconfig
sh                             shx3_defconfig
m68k                        m5307c3_defconfig
mips                     loongson1b_defconfig
sh                             sh03_defconfig
mips                         db1xxx_defconfig
arm                      integrator_defconfig
arm                  randconfig-c002-20211210
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a006-20211210
x86_64               randconfig-a005-20211210
x86_64               randconfig-a001-20211210
x86_64               randconfig-a002-20211210
x86_64               randconfig-a003-20211210
x86_64               randconfig-a004-20211210
i386                 randconfig-a001-20211209
i386                 randconfig-a005-20211209
i386                 randconfig-a003-20211209
i386                 randconfig-a002-20211209
i386                 randconfig-a006-20211209
i386                 randconfig-a004-20211209
i386                 randconfig-a001-20211210
i386                 randconfig-a002-20211210
i386                 randconfig-a005-20211210
i386                 randconfig-a003-20211210
i386                 randconfig-a006-20211210
i386                 randconfig-a004-20211210
x86_64               randconfig-a006-20211209
x86_64               randconfig-a005-20211209
x86_64               randconfig-a001-20211209
x86_64               randconfig-a002-20211209
x86_64               randconfig-a004-20211209
x86_64               randconfig-a003-20211209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20211210
x86_64               randconfig-a012-20211210
x86_64               randconfig-a014-20211210
x86_64               randconfig-a013-20211210
x86_64               randconfig-a016-20211210
x86_64               randconfig-a015-20211210
i386                 randconfig-a013-20211210
i386                 randconfig-a011-20211210
i386                 randconfig-a016-20211210
i386                 randconfig-a014-20211210
i386                 randconfig-a015-20211210
i386                 randconfig-a012-20211210
hexagon              randconfig-r045-20211210
riscv                randconfig-r042-20211210
s390                 randconfig-r044-20211210
hexagon              randconfig-r041-20211210
hexagon              randconfig-r045-20211209
s390                 randconfig-r044-20211209
hexagon              randconfig-r041-20211209
riscv                randconfig-r042-20211209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
