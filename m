Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403A5C433F5
	for <ath10k@archiver.kernel.org>; Thu, 17 Mar 2022 06:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FYAQuPGMzg9+ib0sF9Xnioh07l7ui1vFZ/HbL+VC0L4=; b=tuxlyFL5bAWsOP
	TtNyrL34UcTILGT6pQplpwLU53CGLdO/7qjXy980yTCTg9Bd1PNnMyOwQMiMg6Qb4t1udNAlHj/r8
	qeD8S9L0uEujvi6cp2NRdwJNMdoZjUpZgzp3OZglxljqMQmWUs2ZPhV4MfCjeUYYglqVvcQz86Txg
	qbpYCxZy4tr8dRWGGkIJFuLL3Y6eYKuUTQrxI6KDK19qWZABX+JYin4fTzto3L7b5iDo16SiAFenW
	SvS2iOSnMOljAG4whPz2qgYXV1CHB2b4xBMfiMMRAdFEEXKbUtQkVv7/DAmihKib3dgVVo81ys9ot
	mGIoxpPZ6ZLCJVO2KDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUjlF-00F591-CO; Thu, 17 Mar 2022 06:37:25 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUjlC-00F58a-24
 for ath10k@lists.infradead.org; Thu, 17 Mar 2022 06:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647499042; x=1679035042;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=hNvcp4++EgTFy8e5/QqxKaqrK3WYcvo+rEJ5cxuQl78=;
 b=V3CK/MBRwHNw7cN4Fg7CpkBj9UviSM9tSEK4vMNv0pI9AqbHV60NBlD2
 KYaA/eiXYs4GMg8fFm7NcvptwWD+Ve7VlrF/JhJV1W6bBRAQB5zYuxtMb
 bJWONsiNQG3+kqWGOL+dCf/FeWVE61E4zB5QYsmqnf+PXpwm08yiYcNul
 KW/P21SUsRsGSrCjH2cDBMJKRCxN82kOWNsCWgBNgR1aSVY6GT5Gw8KzV
 P3Cl/fxcChtsSM4l4pkjPYvA3yF2CL/grSOnrhcqAqfpRWh9xBJ2+ncq2
 BXNTDko7xF9Fx4mMXp1Lgg3HI6hxpbuGtEmFcvnblUE6NgoV06FJ/lzj/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="238958870"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="238958870"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 23:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="714917826"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 16 Mar 2022 23:37:18 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUjl8-000DO9-5s; Thu, 17 Mar 2022 06:37:18 +0000
Date: Thu, 17 Mar 2022 14:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD REGRESSION
 6c2fb559e838b6db186bfb5d0b66f8f2f3fae4d7
Message-ID: <6232d6e5.E09Pr6J4alZJq2wG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_233722_198923_7730AE3B 
X-CRM114-Status: UNSURE (   4.75  )
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
branch HEAD: 6c2fb559e838b6db186bfb5d0b66f8f2f3fae4d7  Merge branch 'ath-next' into ath-qca

Unverified Error/Warning (likely false positive, please contact us if interested):

(.text+0x4a0e): undefined reference to `ieee80211_sta_restart'
ERROR: modpost: "ieee80211_sta_restart" [net/mac80211/mac80211.ko] undefined!
util.c:(.text+0x4c3c): undefined reference to `ieee80211_sta_restart'
util.c:(.text+0xa7b2): undefined reference to `ieee80211_sta_restart'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- ia64-randconfig-r024-20220316
|   `-- util.c:(.text):undefined-reference-to-ieee80211_sta_restart
|-- m68k-allmodconfig
|   `-- ERROR:ieee80211_sta_restart-net-mac80211-mac80211.ko-undefined
|-- m68k-allyesconfig
|   `-- (.text):undefined-reference-to-ieee80211_sta_restart
`-- mips-bcm47xx_defconfig
    `-- util.c:(.text):undefined-reference-to-ieee80211_sta_restart

elapsed time: 799m

configs tested: 177
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20220313
m68k                         apollo_defconfig
powerpc                      tqm8xx_defconfig
sh                        edosk7760_defconfig
arm                         at91_dt_defconfig
arc                      axs103_smp_defconfig
arm                      footbridge_defconfig
mips                       bmips_be_defconfig
sh                         ecovec24_defconfig
arm                        oxnas_v6_defconfig
mips                           ci20_defconfig
powerpc                  storcenter_defconfig
sh                           sh2007_defconfig
h8300                       h8s-sim_defconfig
sh                               alldefconfig
powerpc                      arches_defconfig
sh                           se7343_defconfig
powerpc                     stx_gp3_defconfig
sh                         ap325rxa_defconfig
arm                           h3600_defconfig
arm                            lart_defconfig
arm                         nhk8815_defconfig
h8300                            alldefconfig
powerpc                         wii_defconfig
ia64                         bigsur_defconfig
powerpc                       eiger_defconfig
sh                          rsk7264_defconfig
powerpc                     pq2fads_defconfig
sh                             sh03_defconfig
powerpc                     ep8248e_defconfig
parisc                generic-64bit_defconfig
xtensa                           alldefconfig
sh                              ul2_defconfig
powerpc                     tqm8541_defconfig
powerpc                     tqm8555_defconfig
h8300                               defconfig
sh                          urquell_defconfig
powerpc                      ppc40x_defconfig
sh                          sdk7780_defconfig
arm                            xcep_defconfig
mips                           ip32_defconfig
sh                        edosk7705_defconfig
nds32                             allnoconfig
alpha                            alldefconfig
arm                           stm32_defconfig
arm                        cerfcube_defconfig
sh                        dreamcast_defconfig
arm                      jornada720_defconfig
arc                                 defconfig
powerpc                     taishan_defconfig
sh                        sh7757lcr_defconfig
arm                  randconfig-c002-20220317
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
parisc64                            defconfig
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
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a003-20220314
i386                 randconfig-a004-20220314
i386                 randconfig-a001-20220314
i386                 randconfig-a006-20220314
i386                 randconfig-a002-20220314
i386                 randconfig-a005-20220314
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a006-20220314
x86_64               randconfig-a001-20220314
arc                  randconfig-r043-20220313
arc                  randconfig-r043-20220314
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
arc                  randconfig-r043-20220317
riscv                randconfig-r042-20220317
s390                 randconfig-r044-20220317
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                         rhel-8.3-kunit

clang tested configs:
hexagon                          alldefconfig
mips                            e55_defconfig
arm                          ep93xx_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                     pseries_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc8272_ads_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314
hexagon              randconfig-r045-20220313
hexagon              randconfig-r045-20220314
hexagon              randconfig-r041-20220313
s390                 randconfig-r044-20220314
hexagon              randconfig-r041-20220314
riscv                randconfig-r042-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
