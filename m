Return-Path: <SRS0=pCY9=O5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00E1C433EF
	for <ath10k@archiver.kernel.org>; Sat,  9 Oct 2021 03:19:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E0060F38
	for <ath10k@archiver.kernel.org>; Sat,  9 Oct 2021 03:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69E0060F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uqZ3PvH9YpUMrYMty6JTrI7Gf0j582+CCvjElVBAe68=; b=HZiaU1jOmGBT86
	5wRjOzzyM2kPqXMJiCUfb/wkHe8rElxTEnImVDGI3tfY+jaUtwQCk7LAmQhvgtULbl/8Je23Hrdq7
	jr1OZa4QDUxlqaNpgnCnzz3x+tuuD67jv3k2PWRjP6GU6umkk/D1kMLtmkrTzaLNn9rLTvrzZXHAj
	bg6kJSePKsW96sPaZdeGVcrKZ3wDRdtEraP96Lk0k0D/Qt6ybWll7lwm9CxAHFrWXfZvVIBvGEk+S
	bt+DlDw8CnZTAvHK2KRIBQ4TZ+dzpurfjCU8rWICwpKOLhFWBJytNXIxKv3Bmf7ppT91KKhY9dG9x
	bjSUHmxRqls/09p4mHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ2t9-004uRj-RK; Sat, 09 Oct 2021 03:19:08 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ2C6-004dC0-K9
 for ath10k@lists.infradead.org; Sat, 09 Oct 2021 02:34:40 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="226523383"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="226523383"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 19:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="523171353"
Received: from lkp-server02.sh.intel.com (HELO 1950922c5479) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 08 Oct 2021 19:34:36 -0700
Received: from kbuild by 1950922c5479 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mZ2C3-00011W-Ji; Sat, 09 Oct 2021 02:34:35 +0000
Date: Sat, 09 Oct 2021 10:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 2625ea37559a0d0e4042bf24d8c4a728910acd4d
Message-ID: <6160ffa2.mIhBfuKXRVZLNMeP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_193438_765502_34E92582 
X-CRM114-Status: UNSURE (   6.19  )
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
branch HEAD: 2625ea37559a0d0e4042bf24d8c4a728910acd4d  ath11k: Use kcalloc() instead of kzalloc()

elapsed time: 2071m

configs tested: 204
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211008
s390                          debug_defconfig
parisc                generic-32bit_defconfig
m68k                       bvme6000_defconfig
arm                            hisi_defconfig
sh                            hp6xx_defconfig
m68k                        mvme16x_defconfig
mips                         tb0226_defconfig
arm                          pxa168_defconfig
powerpc                     akebono_defconfig
mips                  cavium_octeon_defconfig
sh                          rsk7269_defconfig
sh                               alldefconfig
arm                        oxnas_v6_defconfig
arm                         orion5x_defconfig
mips                         rt305x_defconfig
arm                            zeus_defconfig
arm                         socfpga_defconfig
arm                           corgi_defconfig
arm                         bcm2835_defconfig
mips                     cu1000-neo_defconfig
powerpc                     pseries_defconfig
riscv                               defconfig
arm                      integrator_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          rsk7264_defconfig
xtensa                    xip_kc705_defconfig
nds32                             allnoconfig
powerpc                 mpc8560_ads_defconfig
mips                       lemote2f_defconfig
m68k                        stmark2_defconfig
sh                          sdk7786_defconfig
powerpc                       holly_defconfig
arm                     am200epdkit_defconfig
sh                            migor_defconfig
openrisc                  or1klitex_defconfig
powerpc                     tqm5200_defconfig
mips                     loongson1b_defconfig
mips                     loongson1c_defconfig
sh                              ul2_defconfig
arm                      jornada720_defconfig
powerpc                  mpc885_ads_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                    socrates_defconfig
arm                          pcm027_defconfig
powerpc                      pasemi_defconfig
mips                       rbtx49xx_defconfig
powerpc                   currituck_defconfig
ia64                             alldefconfig
powerpc                 mpc832x_mds_defconfig
arm                            xcep_defconfig
mips                           rs90_defconfig
mips                        bcm63xx_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                          g5_defconfig
arm                        keystone_defconfig
mips                         tb0219_defconfig
arc                            hsdk_defconfig
sh                        apsh4ad0a_defconfig
mips                  decstation_64_defconfig
sh                        sh7785lcr_defconfig
m68k                         apollo_defconfig
openrisc                            defconfig
powerpc                      arches_defconfig
sh                   secureedge5410_defconfig
m68k                            mac_defconfig
xtensa                       common_defconfig
powerpc                   lite5200b_defconfig
powerpc                      cm5200_defconfig
m68k                         amcore_defconfig
arm                       multi_v4t_defconfig
arm                        multi_v7_defconfig
h8300                       h8s-sim_defconfig
sh                         ecovec24_defconfig
sh                           se7705_defconfig
sh                          r7785rp_defconfig
sparc64                          alldefconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                generic_kc705_defconfig
mips                         db1xxx_defconfig
arm                          ep93xx_defconfig
powerpc                   microwatt_defconfig
powerpc                    klondike_defconfig
mips                           mtx1_defconfig
powerpc                        icon_defconfig
riscv                            alldefconfig
arc                        nsim_700_defconfig
arm                        vexpress_defconfig
sh                     sh7710voipgw_defconfig
arm                         s3c6400_defconfig
arm                        realview_defconfig
powerpc                     tqm8560_defconfig
x86_64               randconfig-c001-20211008
arm                  randconfig-c002-20211008
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                               defconfig
sparc                            allyesconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211008
x86_64               randconfig-a012-20211008
x86_64               randconfig-a016-20211008
x86_64               randconfig-a013-20211008
x86_64               randconfig-a011-20211008
x86_64               randconfig-a014-20211008
x86_64               randconfig-a015-20211004
x86_64               randconfig-a012-20211004
x86_64               randconfig-a016-20211004
x86_64               randconfig-a014-20211004
x86_64               randconfig-a013-20211004
x86_64               randconfig-a011-20211004
i386                 randconfig-a013-20211008
i386                 randconfig-a016-20211008
i386                 randconfig-a014-20211008
i386                 randconfig-a011-20211008
i386                 randconfig-a012-20211008
i386                 randconfig-a015-20211008
i386                 randconfig-a013-20211004
i386                 randconfig-a016-20211004
i386                 randconfig-a014-20211004
i386                 randconfig-a011-20211004
i386                 randconfig-a012-20211004
arc                  randconfig-r043-20211008
s390                 randconfig-r044-20211008
riscv                randconfig-r042-20211008
arc                  randconfig-r043-20211007
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211008
i386                 randconfig-c001-20211008
arm                  randconfig-c002-20211008
s390                 randconfig-c005-20211008
powerpc              randconfig-c003-20211008
riscv                randconfig-c006-20211008
mips                 randconfig-c004-20211008
x86_64               randconfig-a003-20211008
x86_64               randconfig-a005-20211008
x86_64               randconfig-a001-20211008
x86_64               randconfig-a002-20211008
x86_64               randconfig-a004-20211008
x86_64               randconfig-a006-20211008
x86_64               randconfig-a003-20211004
x86_64               randconfig-a005-20211004
x86_64               randconfig-a001-20211004
x86_64               randconfig-a002-20211004
x86_64               randconfig-a004-20211004
x86_64               randconfig-a006-20211004
i386                 randconfig-a001-20211008
i386                 randconfig-a003-20211008
i386                 randconfig-a005-20211008
i386                 randconfig-a004-20211008
i386                 randconfig-a002-20211008
i386                 randconfig-a006-20211008
i386                 randconfig-a001-20211004
i386                 randconfig-a003-20211004
i386                 randconfig-a005-20211004
i386                 randconfig-a002-20211004
i386                 randconfig-a004-20211004
i386                 randconfig-a006-20211004
hexagon              randconfig-r045-20211007
hexagon              randconfig-r041-20211007
s390                 randconfig-r044-20211007
riscv                randconfig-r042-20211007

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
