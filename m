Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029C2C433F5
	for <ath10k@archiver.kernel.org>; Wed, 12 Jan 2022 05:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/65ZhPv/66Utsku8ZvGphK/JtSf+RFlwD4NLrm57wFM=; b=YOXmFNBBo4xcG0
	GMpexeCde6cBJvZsChlIGXjicYn3mlg8T1KBa0qbIOuaaxWomKBgwbuWuHwG6gs3z16ewKeAqvHsl
	AKbe0AmF1Q8iME+/toYMXXAZMNKHBSKzWusrvxmr4hnzVBjOrmamJDjczFkz3MqG1hrEeHUVnfDTX
	PExEse/qDMMeopyhzRNXo1ShCnUXWvoKNbScqQJGMiZXAKR9jCdWXB/9AwLCGP3YS7g0l237zbR7B
	if/ZhkCVD3neoHllDvkZKxlSffe44V57isgvQ/era6NTFGlVE3AUj8GmmxF0X0ly8DgMsTeweWSlB
	K+z/WV7dN9Ha3NTYv0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7WKC-001Bni-6Y; Wed, 12 Jan 2022 05:37:32 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7WK5-001Bjx-Rp
 for ath10k@lists.infradead.org; Wed, 12 Jan 2022 05:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641965845; x=1673501845;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=SZM05cOy/LnR9NY/pw3jgbnQD3OPiA55hvthAbp0T8M=;
 b=EE3YgpzVB5FBpe0u0v0GSYtkJqeRgWmLHZObO2oJsdRWGkCphVKdwcZZ
 f1Ov9HmkwlEAgUNt2rxoIkrXjZxEqdrzUYKq+4WOo9qTYTGPjV9gnSM60
 mV4pZ2yc1OEtwqQmHNhTyOfuXCSsoxlYFPHGHTUyxgkPNvXpaoO2dLyiu
 OUNEMiqmwh1TbpsRZ01jyVGEqpuL6Yghg41gYT6//j2w7MLruhn5H2Qh+
 ruQu8cjAV5kUwCtH02brhnW7xAvSrgzo9sBljKf5LzOCcsWb1woYSuD6i
 as5EEvt00iCNHYYZ0sVrKLOHE3BznUOMwLU3uyuhA3DFrJ6rNBg/Qc73N g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="241216058"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="241216058"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 21:37:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="474795408"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2022 21:37:22 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7WK2-0005Xi-2m; Wed, 12 Jan 2022 05:37:22 +0000
Date: Wed, 12 Jan 2022 13:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 5459a2fefd06bd5bedc19fa29ff10fffd612102d
Message-ID: <61de68f1.ava6nXw6Iv0f3qMO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_213725_987215_D298A46A 
X-CRM114-Status: UNSURE (   6.61  )
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
branch HEAD: 5459a2fefd06bd5bedc19fa29ff10fffd612102d  Merge branch 'pending' into master-pending

elapsed time: 728m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arc                                 defconfig
s390                             allmodconfig
sh                          sdk7780_defconfig
m68k                        mvme16x_defconfig
arm                        cerfcube_defconfig
arm                            pleb_defconfig
sh                          r7785rp_defconfig
arc                    vdk_hs38_smp_defconfig
h8300                               defconfig
s390                          debug_defconfig
arc                              allyesconfig
arm                       multi_v4t_defconfig
arm                           viper_defconfig
nios2                         3c120_defconfig
powerpc                      bamboo_defconfig
arm                      footbridge_defconfig
ia64                         bigsur_defconfig
arm                        multi_v7_defconfig
sh                          rsk7203_defconfig
sparc                            alldefconfig
m68k                       m5275evb_defconfig
sh                        edosk7705_defconfig
sh                             espt_defconfig
sh                             shx3_defconfig
m68k                       m5249evb_defconfig
powerpc                     rainier_defconfig
sh                            shmin_defconfig
sh                            hp6xx_defconfig
h8300                       h8s-sim_defconfig
sh                           se7751_defconfig
arm                         assabet_defconfig
microblaze                          defconfig
sh                           se7722_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          landisk_defconfig
sh                           se7712_defconfig
powerpc                  storcenter_defconfig
xtensa                generic_kc705_defconfig
powerpc                     tqm8548_defconfig
ia64                             allyesconfig
s390                                defconfig
sh                     magicpanelr2_defconfig
powerpc                     pq2fads_defconfig
parisc                              defconfig
mips                           xway_defconfig
m68k                         amcore_defconfig
arm                            mps2_defconfig
mips                      maltasmvp_defconfig
m68k                        stmark2_defconfig
powerpc                    adder875_defconfig
arm                        trizeps4_defconfig
sh                        edosk7760_defconfig
mips                        jmr3927_defconfig
xtensa                           alldefconfig
m68k                            q40_defconfig
arm                  randconfig-c002-20220111
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
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
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
riscv                randconfig-r042-20220111
arc                  randconfig-r043-20220111
s390                 randconfig-r044-20220111
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
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
arm                  randconfig-c002-20220111
x86_64                        randconfig-c007
riscv                randconfig-c006-20220111
powerpc              randconfig-c003-20220111
i386                          randconfig-c001
mips                 randconfig-c004-20220111
arm                      tct_hammer_defconfig
mips                        workpad_defconfig
mips                          ath79_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           ip27_defconfig
powerpc                          allmodconfig
powerpc                     kmeter1_defconfig
powerpc                          allyesconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 mpc836x_mds_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220111
hexagon              randconfig-r041-20220111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
