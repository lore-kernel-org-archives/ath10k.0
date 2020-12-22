Return-Path: <SRS0=CzWf=F2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26F4C433DB
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 07:18:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F09023124
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 07:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F09023124
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h853EVHU86jTefREH9o4Q1a4VSKFHdQgJZ+zPMze6eo=; b=o4t5siZ3fZTlXoq7G8m6loesGh
	Sf6ML7KY8niaFROA+zw2Yv0BYcdb3hRkJWIDS6i3mK7nX3FSS/Bv5S576JioR6XtqM6GaQ1JGJ9UY
	S+MsbknuQgmvo9K4Jj0FquHSKMDxUz1ER/14nNz0mq41fsakYTHarPJc14ZfxOYK5CTuj4pt8RZ+y
	Dsv+TirGduZQwxGZsAYgvUK5MMFy+5t5OhFTrHn1IxjsZNU8bSnucX/8n0WxBPkWQhIX22KV13PHU
	4S0hFjTDDW57CHyWqmLASHVanx5ylH3qE8xwdfI9j0+9Ua9oDjhBtEiDSqm3U44k60lj+hFy44VnN
	U1WLwGkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krbvU-0000Ox-5f; Tue, 22 Dec 2020 07:17:44 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krbp9-0001NG-On
 for ath10k@lists.infradead.org; Tue, 22 Dec 2020 07:11:13 +0000
IronPort-SDR: WfF49thB8BCHmbH78bAMoMUdGYJr1n4+4/GguzOtw6ZZ0yZQGaeLdTYQHxBiGo/esBQIwQbLfD
 YfMi0DdivFMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="237392951"
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; d="scan'208";a="237392951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 23:11:07 -0800
IronPort-SDR: W94UXFedYZMZy+4w+PuAOAHEnSWjApdgZk9MaiktggKC/ifuYDjuhRKeBPx9njdTSn4397kMXm
 AEQ6ln0IXc6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,438,1599548400"; d="scan'208";a="345432322"
Received: from lkp-server01.sh.intel.com (HELO 65587561063d) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 21 Dec 2020 23:11:05 -0800
Received: from kbuild by 65587561063d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1krbp2-0001Rt-Tx; Tue, 22 Dec 2020 07:11:04 +0000
Date: Tue, 22 Dec 2020 15:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:pending] BUILD SUCCESS
 ada580f28cfed6ae92b8d92f785b1ffe8226aa9f
Message-ID: <5fe19bee.xEjncRH5HjlVS4kH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_021111_996887_A723CA56 
X-CRM114-Status: UNSURE (   6.89  )
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
branch HEAD: ada580f28cfed6ae92b8d92f785b1ffe8226aa9f  ath10k: remove unused struct ath10k::dev_type

elapsed time: 722m

configs tested: 154
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                malta_kvm_guest_defconfig
mips                      fuloong2e_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                      ppc6xx_defconfig
powerpc                       eiger_defconfig
mips                           gcw0_defconfig
arc                        nsim_700_defconfig
arm                            xcep_defconfig
arm                   milbeaut_m10v_defconfig
arm                            hisi_defconfig
powerpc                        icon_defconfig
mips                     cu1000-neo_defconfig
sh                            titan_defconfig
mips                        bcm47xx_defconfig
sh                        dreamcast_defconfig
arm                           viper_defconfig
sh                         ap325rxa_defconfig
openrisc                            defconfig
mips                        qi_lb60_defconfig
powerpc                      pmac32_defconfig
arm                        clps711x_defconfig
arm                         s3c6400_defconfig
sh                         microdev_defconfig
ia64                          tiger_defconfig
sh                   sh7724_generic_defconfig
c6x                                 defconfig
xtensa                  audio_kc705_defconfig
mips                        nlm_xlr_defconfig
arm                        neponset_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                            lart_defconfig
powerpc                       holly_defconfig
powerpc                 canyonlands_defconfig
arm                      integrator_defconfig
h8300                     edosk2674_defconfig
arc                                 defconfig
mips                             allyesconfig
openrisc                 simple_smp_defconfig
powerpc                     kilauea_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    sam440ep_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                        mvme16x_defconfig
powerpc                  storcenter_defconfig
mips                  cavium_octeon_defconfig
mips                     loongson1c_defconfig
um                             i386_defconfig
powerpc                     tqm8540_defconfig
nds32                            alldefconfig
sh                           se7751_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     kmeter1_defconfig
powerpc                     ppa8548_defconfig
powerpc                    ge_imp3a_defconfig
m68k                            q40_defconfig
powerpc                 mpc8313_rdb_defconfig
parisc                           allyesconfig
powerpc                   motionpro_defconfig
nios2                         10m50_defconfig
mips                         bigsur_defconfig
arm                         s5pv210_defconfig
sh                          rsk7201_defconfig
arm                          imote2_defconfig
powerpc                     akebono_defconfig
mips                        maltaup_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
arc                              alldefconfig
mips                     loongson1b_defconfig
powerpc                          g5_defconfig
arm                           h5000_defconfig
sh                          rsk7269_defconfig
powerpc                 linkstation_defconfig
riscv                               defconfig
powerpc64                        alldefconfig
arm                          lpd270_defconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201221
x86_64               randconfig-a006-20201221
x86_64               randconfig-a002-20201221
x86_64               randconfig-a004-20201221
x86_64               randconfig-a003-20201221
x86_64               randconfig-a005-20201221
i386                 randconfig-a005-20201222
i386                 randconfig-a002-20201222
i386                 randconfig-a006-20201222
i386                 randconfig-a004-20201222
i386                 randconfig-a003-20201222
i386                 randconfig-a001-20201222
i386                 randconfig-a002-20201221
i386                 randconfig-a005-20201221
i386                 randconfig-a006-20201221
i386                 randconfig-a004-20201221
i386                 randconfig-a003-20201221
i386                 randconfig-a001-20201221
i386                 randconfig-a011-20201221
i386                 randconfig-a016-20201221
i386                 randconfig-a014-20201221
i386                 randconfig-a012-20201221
i386                 randconfig-a015-20201221
i386                 randconfig-a013-20201221
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-a015-20201221
x86_64               randconfig-a014-20201221
x86_64               randconfig-a016-20201221
x86_64               randconfig-a012-20201221
x86_64               randconfig-a013-20201221
x86_64               randconfig-a011-20201221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
