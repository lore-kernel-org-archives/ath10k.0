Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BBEC433F5
	for <ath10k@archiver.kernel.org>; Thu, 21 Apr 2022 04:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xqCvLB6Kud+GXIIsVAMaQSevJt2tfsEBDavbEr0a4is=; b=NuLqVfK/zmsNAN
	CplBYtrNPfZ+tegQbYw7TiYn8y94FfiLnlnCN7uSKooyYgUG3fGq6Niy8+RzLwuu/x13px4ZYfnFq
	/xS9Ypt1+E0tarpY8X4OVk1QjHrVdxtZ4NsgnC490BN2j3467wtUUJQN3wv9QkWVJ2WsckryePmyy
	KkFaDQPbZs8XYlht0t1euBSOpCFM0j1Ve2lKW13Wewua5Bh7g0Q3RkF9OFDYIkFJ4zxV2SGBX0twl
	RsGFFgCm1ayeQBJr2gwSDh0ZYF/EipuGbMAPWe4PrB5Jb6ZBpmn5ThUTGWUxmE9TrPwI9/uUtH4tV
	pgZcm1toMaA3eRixejSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhOl4-00BTXz-4S; Thu, 21 Apr 2022 04:49:34 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhOkz-00BTU3-Rm
 for ath10k@lists.infradead.org; Thu, 21 Apr 2022 04:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650516569; x=1682052569;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=klWVhSzI7h0DASG72vtZOX+qAfI7XjaUMjXvLSQr+1g=;
 b=DhMmzxsV0owxHn9Jk2KVPZdQ4aXP1WXpCJYGunWNROxQU4JcYcafzUBx
 lMPHa1qPRxNG4gzIa8hscEnKzs+2MdukZlK1mao7MfUDxCPiV2mPQp4qs
 ar0/dCJDkCls72e1xEIz5qlvRzAIR4t4K0NEkGKp2tArtD1uSp6tJrqwH
 0lWEfuv8+is1/YIox7Rn4dcBknPcNSKOpEizVL4DfW4fdFc7Al1aQtZMd
 THd3bgoA9aBHMQP+0gVBu1WOipRdzxJd5S4TCWPxwO9LmfgObJsi5Lfak
 qwT/Ahn/N3xy0FR5rNHMK8vpf8y/J496Kz1rxN9zxfbmiN8vyRq3rsm+U w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="251549723"
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; d="scan'208";a="251549723"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 21:49:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,277,1643702400"; d="scan'208";a="865215768"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2022 21:49:25 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nhOku-0007s0-QE;
 Thu, 21 Apr 2022 04:49:24 +0000
Date: Thu, 21 Apr 2022 12:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 2fa054189bcfcb71fdb8073da4671e275c0ddfc8
Message-ID: <6260e237.U3BwIyVx+ce7EHDQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_214930_038491_9166895D 
X-CRM114-Status: UNSURE (   5.65  )
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
branch HEAD: 2fa054189bcfcb71fdb8073da4671e275c0ddfc8  ath9k: fix QCA9561 PA bias level

elapsed time: 724m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
m68k                       m5208evb_defconfig
m68k                          hp300_defconfig
powerpc                      ppc6xx_defconfig
powerpc                      pcm030_defconfig
mips                     loongson1b_defconfig
arm                          lpd270_defconfig
arm                         lpc18xx_defconfig
powerpc                 canyonlands_defconfig
mips                       bmips_be_defconfig
arm                      jornada720_defconfig
xtensa                         virt_defconfig
powerpc                      chrp32_defconfig
ia64                      gensparse_defconfig
sh                        apsh4ad0a_defconfig
mips                         cobalt_defconfig
arm                            qcom_defconfig
xtensa                           allyesconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 mpc837x_rdb_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc834x_itx_defconfig
xtensa                    xip_kc705_defconfig
m68k                       bvme6000_defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
arm64                            alldefconfig
sh                          polaris_defconfig
sh                   rts7751r2dplus_defconfig
h8300                       h8s-sim_defconfig
arm                          pxa910_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7269_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220420
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220420
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                              defconfig

clang tested configs:
riscv                randconfig-c006-20220420
mips                 randconfig-c004-20220420
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220420
powerpc              randconfig-c003-20220420
powerpc                      walnut_defconfig
arm                        vexpress_defconfig
arm                    vt8500_v6_v7_defconfig
arm                         socfpga_defconfig
arm                           omap1_defconfig
powerpc                      ppc44x_defconfig
powerpc                     pseries_defconfig
powerpc                     skiroot_defconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
arm                        neponset_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220420
riscv                randconfig-r042-20220420
hexagon              randconfig-r045-20220420
s390                 randconfig-r044-20220420

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
