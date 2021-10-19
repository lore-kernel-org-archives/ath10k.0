Return-Path: <SRS0=SjaR=PH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CE3C433F5
	for <ath10k@archiver.kernel.org>; Tue, 19 Oct 2021 02:07:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E063360F46
	for <ath10k@archiver.kernel.org>; Tue, 19 Oct 2021 02:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E063360F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/IY2TL1Vnv5RToHAQd8JTGSrEWQfUT6JpKkLeBn5tFA=; b=dlLUJrkjJ+oJ17
	NxXD3k3W87RVAdMiCtztsOsOT/lSbML8GJPLlIt8UFnFb+OeR6rygiaXcBCUEmHlcX1n5cwa+RqYj
	YguAcLHfsBVJp9IXSJRL3zqJW4Vt4pO6KGpcTOJ9ywfTHI4wGxeoHj/IvkgPCJRtEfzKpIoIC7nRV
	wU+OU6EiIPnu+Py9H3XrMqs456Tas1q9VjbOVbR0x9GefyRvIm4hjP3JxQ5Rp+xtHNGzglrsM4tUz
	EG4vwrzuRJ2razks2IIBq4TIDqdA1m7uS52s/gcCGh4ZK932+ZWF4SScwbCsFtqNITuioLqcMwlUf
	3DSePU0AsCFmMAclPmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mceWk-00HZ4y-1M; Tue, 19 Oct 2021 02:06:54 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mceWf-00HZ45-O2
 for ath10k@lists.infradead.org; Tue, 19 Oct 2021 02:06:52 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="291873099"
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="291873099"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 19:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="444317448"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 18 Oct 2021 19:06:47 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mceWc-000Bvm-CF; Tue, 19 Oct 2021 02:06:46 +0000
Date: Tue, 19 Oct 2021 10:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 5362c1c1b4be8a6d0e84953f67c47cd8860c7f0f
Message-ID: <616e281c.az0vvanaQt0/qP66%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_190649_867102_31BC0A7E 
X-CRM114-Status: UNSURE (   5.77  )
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
branch HEAD: 5362c1c1b4be8a6d0e84953f67c47cd8860c7f0f  Merge branch 'ath-next' into ath-qca

elapsed time: 728m

configs tested: 182
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    adder875_defconfig
powerpc                      walnut_defconfig
arc                        nsim_700_defconfig
sparc                       sparc64_defconfig
powerpc                     tqm8548_defconfig
arm                           corgi_defconfig
mips                           ip28_defconfig
i386                             alldefconfig
mips                         mpc30x_defconfig
arm                             ezx_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         axm55xx_defconfig
arm                            qcom_defconfig
arm64                            alldefconfig
arm                        multi_v5_defconfig
mips                          ath79_defconfig
powerpc                     powernv_defconfig
openrisc                            defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
arm                         palmz72_defconfig
arm                         nhk8815_defconfig
sh                          urquell_defconfig
sh                          sdk7780_defconfig
x86_64                              defconfig
openrisc                    or1ksim_defconfig
arm                        spear3xx_defconfig
powerpc                     pseries_defconfig
mips                       capcella_defconfig
arm                         assabet_defconfig
powerpc                     kilauea_defconfig
sparc                               defconfig
arm                         vf610m4_defconfig
m68k                        mvme147_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            dove_defconfig
sh                     magicpanelr2_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                         ps3_defconfig
arm                    vt8500_v6_v7_defconfig
sh                         apsh4a3a_defconfig
powerpc                 mpc8560_ads_defconfig
s390                       zfcpdump_defconfig
arc                        vdk_hs38_defconfig
m68k                            q40_defconfig
powerpc                 linkstation_defconfig
arm                        keystone_defconfig
sh                         ap325rxa_defconfig
sh                          r7780mp_defconfig
m68k                          sun3x_defconfig
m68k                       bvme6000_defconfig
h8300                               defconfig
arm                         orion5x_defconfig
mips                      maltaaprp_defconfig
sh                          rsk7264_defconfig
powerpc                      mgcoge_defconfig
arm                           u8500_defconfig
powerpc64                        alldefconfig
mips                           rs90_defconfig
h8300                            alldefconfig
mips                            e55_defconfig
powerpc                      pasemi_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                      acadia_defconfig
ia64                            zx1_defconfig
sh                         microdev_defconfig
powerpc                     taishan_defconfig
powerpc                     mpc512x_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                        m5307c3_defconfig
m68k                        m5407c3_defconfig
arm                           sunxi_defconfig
arm                       imx_v4_v5_defconfig
powerpc                      ep88xc_defconfig
arm                            hisi_defconfig
xtensa                  nommu_kc705_defconfig
arm                        realview_defconfig
powerpc                  storcenter_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                      tqm8xx_defconfig
arm                       mainstone_defconfig
sh                          r7785rp_defconfig
m68k                         amcore_defconfig
powerpc                     kmeter1_defconfig
arm                  randconfig-c002-20211017
i386                 randconfig-c001-20211017
x86_64               randconfig-c001-20211017
arm                  randconfig-c002-20211019
i386                 randconfig-c001-20211019
x86_64               randconfig-c001-20211019
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nios2                            allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc                              defconfig
sparc                            allyesconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20211018
i386                 randconfig-a003-20211018
i386                 randconfig-a004-20211018
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
arc                  randconfig-r043-20211018
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211019
mips                 randconfig-c004-20211019
i386                 randconfig-c001-20211019
s390                 randconfig-c005-20211019
x86_64               randconfig-c007-20211019
riscv                randconfig-c006-20211019
powerpc              randconfig-c003-20211019
x86_64               randconfig-a004-20211019
x86_64               randconfig-a006-20211019
x86_64               randconfig-a005-20211019
x86_64               randconfig-a001-20211019
x86_64               randconfig-a002-20211019
x86_64               randconfig-a003-20211019
i386                 randconfig-a001-20211019
i386                 randconfig-a003-20211019
i386                 randconfig-a004-20211019
i386                 randconfig-a005-20211019
i386                 randconfig-a002-20211019
i386                 randconfig-a006-20211019
x86_64               randconfig-a015-20211018
i386                 randconfig-a014-20211018
i386                 randconfig-a016-20211018
hexagon              randconfig-r041-20211018
s390                 randconfig-r044-20211018
riscv                randconfig-r042-20211018
hexagon              randconfig-r045-20211018
hexagon              randconfig-r041-20211019
hexagon              randconfig-r045-20211019

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
