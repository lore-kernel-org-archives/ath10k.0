Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A4FC00144
	for <ath10k@archiver.kernel.org>; Tue, 26 Jul 2022 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cfzBlR+F9ZXuL7EcX6V/gy5KLL1phu4YXABIFEwJzAs=; b=NkQl2VFOldajt1
	osogs25GCVJNRglqvIfpJNx9OIZRMjy22WrJqslc879/WbXKPSNcu1yO1arvwc7blQEvG9+QkbCiG
	+Kb2FUASqHUZ3pme7TlBNeOSog+glP8rnWK+RRcokGyYi/ZEnc72s31yns9G0gGcVZdHePVFUh8ut
	U1c1zg6p9tJDx+JDZace9mc3pbPxR82iAudxt+rthtb8CAPetDHVvr+tipPBhLBNCSgQt+S9DIguJ
	C04PfWE7CP5KP9ZlvBMKKpkq3Gsw8Hq0UbQmHIgX5c1HK0x7Z06MOP6O26yy0BFQxtgkiapfEOOXG
	XtyvF7Zaw5BwRmR0an9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGSTC-004O9W-Df; Tue, 26 Jul 2022 21:52:02 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGST9-004O5i-Ac
	for ath10k@lists.infradead.org; Tue, 26 Jul 2022 21:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658872319; x=1690408319;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rxpMv862GZA2jkewHv0YOzKBVYFBE3H3XjwHW46f7Qc=;
  b=HRQCkN31obbL7p49u4RaJ1MdGP1RKhx6wTO4nUpHQn9jdtEBfit6BjpA
   q9agrtEkk2cJoXSsgSnkoApJmL10GWcpFmo/wt65v9bhLMgHvqVqteGQv
   8huZCsfiPI8rbiaNR/+YUKDg0NckWeQAtXbslftulcVAVAxLYKJMptVHT
   RGfizFmBO6Uj6OdG1MhsLsG8YZQW7ynG+XZIy53tC8lnYD/RO1uDOAGIs
   92oZS+nlkE9Ep+L73wBFf90vHwa8tIo+jtHj3HJiGQJluPOi0iITXRyx0
   zdVs3bOASaVMeAb31txMKjSpg8D6bGgESbACx+r3tpUXPi3PWokZjJelW
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="289270926"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="289270926"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 14:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="575684879"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jul 2022 14:46:16 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGSNb-0007qw-2q;
	Tue, 26 Jul 2022 21:46:15 +0000
Date: Wed, 27 Jul 2022 05:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 cc9b2d6690c7da503180615b875a88adfbb95ff9
Message-ID: <62e0608b.BHu4XUaYJsHsZDee%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_145159_521113_B17CF0FC 
X-CRM114-Status: UNSURE (   4.83  )
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
branch HEAD: cc9b2d6690c7da503180615b875a88adfbb95ff9  Merge branch 'pending' into master-pending

elapsed time: 758m

configs tested: 133
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
m68k                          multi_defconfig
xtensa                          iss_defconfig
arc                      axs103_smp_defconfig
m68k                            mac_defconfig
sh                            shmin_defconfig
powerpc                       eiger_defconfig
parisc                generic-32bit_defconfig
mips                         rt305x_defconfig
arc                        nsimosci_defconfig
s390                             allmodconfig
sh                          rsk7264_defconfig
m68k                        m5272c3_defconfig
ia64                      gensparse_defconfig
alpha                            alldefconfig
arc                     nsimosci_hs_defconfig
xtensa                         virt_defconfig
arm                           h5000_defconfig
arm                           sama5_defconfig
arm                         vf610m4_defconfig
powerpc                 mpc834x_mds_defconfig
sh                               j2_defconfig
powerpc                  iss476-smp_defconfig
mips                       capcella_defconfig
powerpc                         ps3_defconfig
arm                        keystone_defconfig
powerpc                     rainier_defconfig
m68k                           virt_defconfig
arm                     eseries_pxa_defconfig
powerpc                  storcenter_defconfig
sh                           se7705_defconfig
sh                             espt_defconfig
m68k                                defconfig
mips                           gcw0_defconfig
mips                         tb0226_defconfig
sh                     sh7710voipgw_defconfig
m68k                       m5275evb_defconfig
arm                        shmobile_defconfig
mips                         mpc30x_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                    adder875_defconfig
arm                           sunxi_defconfig
arm                       aspeed_g5_defconfig
sh                          sdk7780_defconfig
arm                         nhk8815_defconfig
sh                         microdev_defconfig
nios2                            allyesconfig
arc                          axs103_defconfig
nios2                               defconfig
microblaze                      mmu_defconfig
xtensa                  cadence_csp_defconfig
mips                             allmodconfig
sparc                               defconfig
m68k                         amcore_defconfig
nios2                         10m50_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-c001
arm                  randconfig-c002-20220724
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220724
riscv                randconfig-r042-20220724
s390                 randconfig-r044-20220724
s390                 randconfig-r044-20220726
riscv                randconfig-r042-20220726
arc                  randconfig-r043-20220726
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                      walnut_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          moxart_defconfig
mips                           rs90_defconfig
arm                  colibri_pxa300_defconfig
powerpc                     powernv_defconfig
powerpc                  mpc885_ads_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220724
hexagon              randconfig-r045-20220724

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
