Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC5FC433FE
	for <ath10k@archiver.kernel.org>; Fri, 18 Nov 2022 02:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UCKvTxWxQw/AvxId6W1rdsbKbHvanAgExDZw1/JKEfI=; b=DED5n3rh6WDPvC
	qcMXB4g+GMUSn8ZSoPbgWepySAFo5pneXNmCsyVtwYudW2nEoTjE7RG6zBEOMXVOyMtJtdmwBMDXA
	nieOd+OiKOlGqUfCpRbiaWPI+cYxDgbfqVq6gsaFRdGfAWSi1m4hhfdw0velbqG0/Nwr0dV2pzo92
	zJIAxVOCA0KM9XbaOokuqM88p5JTK9h0QlfcYUerH7OFSrOskpXlvv6SIzhAdT+FUAonggXBphoxV
	ciepyKFhARhfOqVOufQCL3B3dUBLFZmHna2/F87+X0goJmHbJN2LLCwvdTlIvZyAx+AQJUaFws84n
	63TtxtDIShfPnUgLDrag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovqny-001ONA-4Y; Fri, 18 Nov 2022 02:08:34 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovqnu-001OM2-Fs
	for ath10k@lists.infradead.org; Fri, 18 Nov 2022 02:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668737310; x=1700273310;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aEGNEmZ+H3YU6kJqmCc5pnp83cSTTdbGrpBtfTNb9a4=;
  b=I3dDV/LmY0iAmJSqH5APVEpBR0a3dYtISWrIbObFg1xZX9oD2kiArw6+
   3bOOk7cCFcozL1q0V4MXXeo53zXtCUr+IszeIAEcc+ZYvERoUUBQHl+kT
   yGS9+UgwbdJ3P5OcLilU7+m/tjal9eRZzZz2A6ubCTWArqxIvmWqnWnrt
   oMLiR5Megt++5PK7MRULgvoqmEPDmZPld7I8ftRb+l/dzP8OO3lUo1MLM
   PDtga0Xtsa9l71qcBENEXAr6oY/ssnndejJ0XZwWfl2Z9sz+uM+TDJbNe
   u+zhifHE4lnN3fJ4YHtc9oznR83P9ajBU6KEJqiRUx0fRcH4skRG6n2nw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311733428"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="311733428"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 18:08:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="640043567"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; 
   d="scan'208";a="640043567"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Nov 2022 18:08:26 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovqnq-0000vP-11;
	Fri, 18 Nov 2022 02:08:26 +0000
Date: Fri, 18 Nov 2022 10:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 332db588c76a15e7c29f11e8f8e0d893fa297187
Message-ID: <6376e915.rsC0xOy9JpY/PWpd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_180830_580086_4E09FC1A 
X-CRM114-Status: UNSURE (   6.03  )
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
branch HEAD: 332db588c76a15e7c29f11e8f8e0d893fa297187  Merge branch 'ath-next' into ath-qca

elapsed time: 12644m

configs tested: 162
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                      mgcoge_defconfig
arm                        cerfcube_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     rainier_defconfig
x86_64                            allnoconfig
i386                          randconfig-c001
arc                                 defconfig
arc                     nsimosci_hs_defconfig
sh                      rts7751r2d1_defconfig
mips                 decstation_r4k_defconfig
alpha                               defconfig
mips                         rt305x_defconfig
sh                          rsk7269_defconfig
powerpc                     taishan_defconfig
mips                         bigsur_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a001
i386                          randconfig-a003
arc                  randconfig-r043-20221110
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a005
x86_64                              defconfig
x86_64                        randconfig-a015
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
i386                          randconfig-a012
arc                              allyesconfig
i386                          randconfig-a014
alpha                            allyesconfig
i386                          randconfig-a016
s390                                defconfig
m68k                             allyesconfig
s390                             allmodconfig
m68k                             allmodconfig
s390                             allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                 randconfig-r044-20221111
riscv                randconfig-r042-20221111
arc                  randconfig-r043-20221111
arm                        realview_defconfig
m68k                            q40_defconfig
arm                          gemini_defconfig
arm                         axm55xx_defconfig
parisc                           alldefconfig
parisc64                            defconfig
openrisc                            defconfig
openrisc                  or1klitex_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    sam440ep_defconfig
loongarch                 loongson3_defconfig
mips                      fuloong2e_defconfig
powerpc                    adder875_defconfig
powerpc                  storcenter_defconfig
mips                           ip32_defconfig
nios2                               defconfig
arc                 nsimosci_hs_smp_defconfig
mips                  decstation_64_defconfig
powerpc                 mpc834x_mds_defconfig
arm                        multi_v7_defconfig
mips                    maltaup_xpa_defconfig
loongarch                        allmodconfig
m68k                          hp300_defconfig
ia64                             alldefconfig
powerpc                      pcm030_defconfig
sh                   sh7770_generic_defconfig
m68k                           sun3_defconfig
sparc64                          alldefconfig
powerpc                    amigaone_defconfig
arm                          pxa3xx_defconfig
microblaze                          defconfig
arc                         haps_hs_defconfig
m68k                        m5407c3_defconfig
arm64                            alldefconfig
powerpc                     pq2fads_defconfig
loongarch                           defconfig
openrisc                    or1ksim_defconfig
sh                         apsh4a3a_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7619_defconfig
arc                        nsim_700_defconfig
arm                          simpad_defconfig
mips                     loongson1b_defconfig
sparc                            allyesconfig
ia64                        generic_defconfig
mips                           ci20_defconfig
parisc                              defconfig
ia64                          tiger_defconfig
powerpc                     sequoia_defconfig
sh                          rsk7201_defconfig
nios2                            allyesconfig
parisc                           allyesconfig
arc                  randconfig-r043-20221114
x86_64               randconfig-a003-20221114
x86_64               randconfig-a005-20221114
x86_64               randconfig-a004-20221114
x86_64               randconfig-a002-20221114
x86_64               randconfig-a001-20221114
x86_64               randconfig-a006-20221114
i386                 randconfig-a002-20221114
i386                 randconfig-a004-20221114
i386                 randconfig-a003-20221114
i386                 randconfig-a005-20221114
i386                 randconfig-a006-20221114
i386                 randconfig-a001-20221114

clang tested configs:
hexagon                          alldefconfig
powerpc                 mpc8313_rdb_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221110
i386                          randconfig-a002
riscv                randconfig-r042-20221110
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a006
hexagon              randconfig-r045-20221110
s390                 randconfig-r044-20221110
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
powerpc                    ge_imp3a_defconfig
mips                     loongson2k_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                          g5_defconfig
powerpc                      ppc44x_defconfig
powerpc                 xes_mpc85xx_defconfig
hexagon                             defconfig
mips                          malta_defconfig
riscv                             allnoconfig
i386                 randconfig-a015-20221114
i386                 randconfig-a013-20221114
i386                 randconfig-a011-20221114
i386                 randconfig-a016-20221114
i386                 randconfig-a012-20221114
i386                 randconfig-a014-20221114
hexagon              randconfig-r041-20221115
hexagon              randconfig-r045-20221115
powerpc                     akebono_defconfig
powerpc                    mvme5100_defconfig
arm                         orion5x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
