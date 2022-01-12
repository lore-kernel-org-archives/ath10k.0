Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E307FC433EF
	for <ath10k@archiver.kernel.org>; Wed, 12 Jan 2022 05:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TUJUevoFIVPETqmvk+1py9trOcO6GD6+vD5IFI0C978=; b=V+8tmbR+FEB65y
	tkxKFrWkiFEkzqZQ+t20OzZ1lvKb7DkLbGgzfPdDCzYV3zDPZ5taSA934M9Yc3AOr4pBME+Nvo5nK
	JuKu2rDdHgp40y5cImQBZBzY7ZEEuIfbJc7d33OLQMx1z3hWLJ44ikJSRNBFv+v/LBY7k3g+sYBr2
	SNevvTMqztapXmTb8oVxMw5qbg9YWoRJRhZTQbwTQ/IuxJQMnAtMRxrN9iLyXKpRNlmtUUnMo4unp
	2TVObM4yvs4hdMs7Ki5qfhCpti2Z9leQLwY3tXGkB6Qh4AQN9wmhuOqDMqa8GkcXx4/qFVSOLFYE/
	+VMHgb8bLqHWXQzpMQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7WJJ-001BZa-B5; Wed, 12 Jan 2022 05:36:37 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7WJ7-001BXv-7x
 for ath10k@lists.infradead.org; Wed, 12 Jan 2022 05:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641965785; x=1673501785;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=nnf0MPSN+oyTgz4fpgGQoCCB48HuyX1meaKR0ukU1hs=;
 b=PlyHIfrhBWCxdDN88+wcibC3L1OZA0JU5wGO+7roLe3jnFsJbIHG9+2M
 SLYQACkIdlazb3Yl4ucOAwbu22SDisAlkwHlhBzOhega9jSaLUwiaySn0
 bJBAhv2UFO1W2VDoNmPa6VFETvrMERaKdIWijBLkSfJFSvAi5bKbHl5FL
 asB8yGyzrg3Z5kC3Lcmt0TjYeV7qN1Kt5PNZ/LsTdMapC3GAf2BbK08PO
 GSSA52hkq+H5O1aoRowzJLbnhoE26Hz9moH7rvhZwRsaSOAP6hEU4VTge
 Q9kQp8HhQDx6u6EOJUksPOvmMDJhHTRYjbP/EfSVDAsZ9y/FH989LmfmQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="241215965"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="241215965"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 21:36:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="474795167"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2022 21:36:22 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7WJ3-0005XY-Vp; Wed, 12 Jan 2022 05:36:21 +0000
Date: Wed, 12 Jan 2022 13:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 fbed57d897f6ea065c45806959337a6f28d2a94d
Message-ID: <61de68d0.Pwv9TB9xNV3sak8B%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_213625_364826_2AE7ADA4 
X-CRM114-Status: UNSURE (   6.68  )
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
branch HEAD: fbed57d897f6ea065c45806959337a6f28d2a94d  ath11k: Refactor the fallback routine when peer create fails

elapsed time: 731m

configs tested: 141
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
m68k                       m5249evb_defconfig
sh                             espt_defconfig
sh                             shx3_defconfig
powerpc                     rainier_defconfig
sh                            shmin_defconfig
sh                            hp6xx_defconfig
h8300                       h8s-sim_defconfig
sh                           se7751_defconfig
arm                         assabet_defconfig
microblaze                          defconfig
sh                 kfr2r09-romimage_defconfig
sh                          landisk_defconfig
powerpc                  storcenter_defconfig
sh                           se7722_defconfig
sh                           se7712_defconfig
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
m68k                            q40_defconfig
sh                        edosk7760_defconfig
mips                        jmr3927_defconfig
xtensa                           alldefconfig
arm                  randconfig-c002-20220111
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
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
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
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
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
