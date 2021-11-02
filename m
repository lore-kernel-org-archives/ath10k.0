Return-Path: <SRS0=TZpM=PV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA4EC433EF
	for <ath10k@archiver.kernel.org>; Tue,  2 Nov 2021 03:07:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1128760041
	for <ath10k@archiver.kernel.org>; Tue,  2 Nov 2021 03:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1128760041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w7H1K9usEjY6VixOqMDONerOSIECHS6LfUtL6gMz4v4=; b=eSSTLNGHQC1Bl8
	8LK9ti2RJcDK28p3pvDzdw+aKq94RsfjEHfOeoX63PrM3dvf12oZ1x3L4FFg6j09QvxRefwHPCd4E
	IvK5NBShLd4ToVvN5mEFRNZ9peB/Hi8yIG2KnOu/deJ7MmZegcc0HCTvWh+alDIkg7v/b34mv/Ad4
	v1U6JpUd7LyQj3S1ojn2MCrXr3OWlWnPdG1p4KkBxrJYidnuj1uPRFZALMuxu7IylNv9NtYlMqehA
	Zu6RjPF/l2u/P310ilcmyJZrOP/TJEyE5vHSD8K8+xVQEpe3LtuYFY2un8vzc2tCsGgMkg7Z6apr1
	pcfti8xGgMRS4YzC6BLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhk86-000PLx-Lm; Tue, 02 Nov 2021 03:06:30 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhk7y-000PIu-5s
 for ath10k@lists.infradead.org; Tue, 02 Nov 2021 03:06:25 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="228626848"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="228626848"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 20:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="449198028"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 01 Nov 2021 20:06:18 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mhk7t-0003wW-TF; Tue, 02 Nov 2021 03:06:17 +0000
Date: Tue, 02 Nov 2021 11:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 64a8cbb03dd3c35f9d2b975ff2edcb170592ae23
Message-ID: <6180ab04.ydDAx/ZkoupQcbbv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_200622_346960_00E08A55 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: 64a8cbb03dd3c35f9d2b975ff2edcb170592ae23  Revert "bus: mhi: Early MHI resume failure in non M3 state"

elapsed time: 729m

configs tested: 167
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211101
xtensa                    xip_kc705_defconfig
sh                         microdev_defconfig
arm                          pcm027_defconfig
mips                            e55_defconfig
s390                                defconfig
i386                             allyesconfig
arm                       aspeed_g5_defconfig
sh                           se7712_defconfig
arm                       netwinder_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                   sb1250_swarm_defconfig
sh                          landisk_defconfig
mips                          malta_defconfig
powerpc                     tqm8555_defconfig
arm                        cerfcube_defconfig
mips                        bcm63xx_defconfig
s390                       zfcpdump_defconfig
arc                        nsim_700_defconfig
powerpc                     sequoia_defconfig
s390                             alldefconfig
mips                           ip32_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                        m5307c3_defconfig
mips                           mtx1_defconfig
mips                malta_qemu_32r6_defconfig
h8300                       h8s-sim_defconfig
powerpc                 mpc8540_ads_defconfig
csky                                defconfig
powerpc                          allmodconfig
arm                       spear13xx_defconfig
powerpc                   bluestone_defconfig
arm                          moxart_defconfig
arc                        vdk_hs38_defconfig
powerpc                 mpc8272_ads_defconfig
mips                           xway_defconfig
sh                        apsh4ad0a_defconfig
xtensa                  audio_kc705_defconfig
m68k                             allmodconfig
mips                           gcw0_defconfig
arm                           corgi_defconfig
sh                            shmin_defconfig
arm                         s3c2410_defconfig
arm                         socfpga_defconfig
mips                     cu1000-neo_defconfig
mips                        omega2p_defconfig
arc                           tb10x_defconfig
xtensa                  cadence_csp_defconfig
mips                      maltaaprp_defconfig
powerpc                      tqm8xx_defconfig
m68k                          hp300_defconfig
parisc                generic-64bit_defconfig
arm                  colibri_pxa270_defconfig
xtensa                           alldefconfig
s390                          debug_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      acadia_defconfig
arm                           h5000_defconfig
arc                              alldefconfig
sh                            hp6xx_defconfig
m68k                            q40_defconfig
sh                            titan_defconfig
mips                       capcella_defconfig
powerpc                     tqm8548_defconfig
arm                         cm_x300_defconfig
powerpc                 linkstation_defconfig
mips                          ath79_defconfig
arm                          pxa3xx_defconfig
nds32                             allnoconfig
mips                         bigsur_defconfig
arm                             rpc_defconfig
sh                           se7705_defconfig
m68k                       m5475evb_defconfig
powerpc                      cm5200_defconfig
arm                        mvebu_v5_defconfig
microblaze                      mmu_defconfig
powerpc                    gamecube_defconfig
powerpc                   currituck_defconfig
ia64                            zx1_defconfig
mips                        vocore2_defconfig
sh                           se7780_defconfig
openrisc                         alldefconfig
arm                         s3c6400_defconfig
powerpc                     ep8248e_defconfig
sh                            migor_defconfig
arm                  randconfig-c002-20211101
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a012-20211101
x86_64               randconfig-a015-20211101
x86_64               randconfig-a016-20211101
x86_64               randconfig-a013-20211101
x86_64               randconfig-a011-20211101
x86_64               randconfig-a014-20211101
i386                 randconfig-a016-20211101
i386                 randconfig-a014-20211101
i386                 randconfig-a015-20211101
i386                 randconfig-a013-20211101
i386                 randconfig-a011-20211101
i386                 randconfig-a012-20211101
arc                  randconfig-r043-20211101
riscv                randconfig-r042-20211101
s390                 randconfig-r044-20211101
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20211101
arm                  randconfig-c002-20211101
i386                 randconfig-c001-20211101
s390                 randconfig-c005-20211101
powerpc              randconfig-c003-20211101
riscv                randconfig-c006-20211101
x86_64               randconfig-c007-20211101
x86_64               randconfig-a004-20211101
x86_64               randconfig-a006-20211101
x86_64               randconfig-a001-20211101
x86_64               randconfig-a002-20211101
x86_64               randconfig-a003-20211101
x86_64               randconfig-a005-20211101
i386                 randconfig-a005-20211101
i386                 randconfig-a001-20211101
i386                 randconfig-a003-20211101
i386                 randconfig-a004-20211101
i386                 randconfig-a006-20211101
i386                 randconfig-a002-20211101
hexagon              randconfig-r041-20211101
hexagon              randconfig-r045-20211101

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
