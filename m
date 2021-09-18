Return-Path: <SRS0=SK/k=OI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468F8C433F5
	for <ath10k@archiver.kernel.org>; Sat, 18 Sep 2021 10:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09DF9610FD
	for <ath10k@archiver.kernel.org>; Sat, 18 Sep 2021 10:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09DF9610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TsOHrBbgQX1LmZcUS3r7x37SEoDYJOpLfvmybUkHmUQ=; b=rvK9nORerxE3wZ
	wJMndraih21aCT04xPVogcccLv1dOBVNPhwSG0jajrClQg0GYLWGivP1yr/pOoAzrysVLv3blbkYi
	QieU3c9BllQ2GAKXJ4/u9x0hIWTSbiPy7Cu62bmVXhc5I0LLl8o1ZgoqZoGFn3oqDkpOBlGHnT51X
	Ja/6mkBboAseU06qGHkg7aPEtaeEsN45w26mvV6axQo0QX/N96WxtaSCUqtPXrTSOXKhzGMXmU2Ql
	klVIUgfqBOh+56kuF52XlXQ1pV5LI73k0sRGGTKAt1YhK8JSTDY7k+T1sU8GSWhr6FM91I7/DRUqu
	IwDttpdlhtFrfiUa0PRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRXbO-00FlX4-2N; Sat, 18 Sep 2021 10:29:46 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRXbK-00FlVv-7F
 for ath10k@lists.infradead.org; Sat, 18 Sep 2021 10:29:44 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="221056284"
X-IronPort-AV: E=Sophos;i="5.85,304,1624345200"; d="scan'208";a="221056284"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2021 03:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,304,1624345200"; d="scan'208";a="510308451"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2021 03:29:34 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mRXbC-0004pI-3I; Sat, 18 Sep 2021 10:29:34 +0000
Date: Sat, 18 Sep 2021 18:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 02a893315b0aa6c3cee7c5e632288c742df6b79b
Message-ID: <6145bf74.vpxEpMPUFs9Apo1x%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_032942_336524_E2A77865 
X-CRM114-Status: UNSURE (   5.00  )
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
branch HEAD: 02a893315b0aa6c3cee7c5e632288c742df6b79b  Merge branch 'pending' into master-pending

elapsed time: 2428m

configs tested: 219
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210916
i386                 randconfig-c001-20210918
sh                          rsk7269_defconfig
powerpc                     ep8248e_defconfig
riscv                    nommu_virt_defconfig
m68k                       bvme6000_defconfig
powerpc64                        alldefconfig
um                                  defconfig
openrisc                 simple_smp_defconfig
arm                        oxnas_v6_defconfig
mips                     loongson2k_defconfig
arm                      tct_hammer_defconfig
h8300                            alldefconfig
sh                          landisk_defconfig
um                           x86_64_defconfig
arm                        mvebu_v7_defconfig
arc                        nsimosci_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          badge4_defconfig
mips                  decstation_64_defconfig
mips                            e55_defconfig
mips                     loongson1b_defconfig
sh                           se7712_defconfig
powerpc                        warp_defconfig
arm                      integrator_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                                defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      pic32mzda_defconfig
sh                          r7785rp_defconfig
powerpc                      ppc6xx_defconfig
arm                          simpad_defconfig
s390                          debug_defconfig
arm                       mainstone_defconfig
arm                            qcom_defconfig
arm                          pcm027_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     tqm8541_defconfig
powerpc                    klondike_defconfig
powerpc                     tqm8548_defconfig
powerpc                     kmeter1_defconfig
powerpc                  mpc885_ads_defconfig
arm                         cm_x300_defconfig
sh                               alldefconfig
m68k                         amcore_defconfig
ia64                        generic_defconfig
arm                        vexpress_defconfig
m68k                        m5272c3_defconfig
arm                        clps711x_defconfig
arm                     davinci_all_defconfig
openrisc                  or1klitex_defconfig
arm                           viper_defconfig
arm                            zeus_defconfig
powerpc                      tqm8xx_defconfig
arm                        mvebu_v5_defconfig
powerpc                     sequoia_defconfig
arm                        mini2440_defconfig
mips                        workpad_defconfig
arm                     eseries_pxa_defconfig
sh                           se7343_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                       maple_defconfig
arm                             pxa_defconfig
arm                           tegra_defconfig
sh                           se7780_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      acadia_defconfig
arm                          pxa168_defconfig
sh                        sh7785lcr_defconfig
arm                        multi_v7_defconfig
powerpc                      chrp32_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear3xx_defconfig
powerpc                     powernv_defconfig
mips                          rm200_defconfig
mips                     cu1000-neo_defconfig
arm                          ep93xx_defconfig
xtensa                  audio_kc705_defconfig
xtensa                          iss_defconfig
sh                          kfr2r09_defconfig
x86_64                              defconfig
sh                                  defconfig
x86_64                           allyesconfig
powerpc                  storcenter_defconfig
arm                        keystone_defconfig
arm                             ezx_defconfig
arm                       omap2plus_defconfig
powerpc                    adder875_defconfig
m68k                         apollo_defconfig
arm                       multi_v4t_defconfig
powerpc                   motionpro_defconfig
arm                         s3c6400_defconfig
s390                             alldefconfig
powerpc                     tqm8540_defconfig
powerpc                    socrates_defconfig
powerpc                       eiger_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                         cobalt_defconfig
x86_64               randconfig-c001-20210916
arm                  randconfig-c002-20210916
x86_64               randconfig-c001-20210918
arm                  randconfig-c002-20210918
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
x86_64               randconfig-a013-20210918
x86_64               randconfig-a016-20210918
x86_64               randconfig-a012-20210918
x86_64               randconfig-a011-20210918
x86_64               randconfig-a014-20210918
x86_64               randconfig-a015-20210918
x86_64               randconfig-a016-20210916
x86_64               randconfig-a013-20210916
x86_64               randconfig-a012-20210916
x86_64               randconfig-a011-20210916
x86_64               randconfig-a014-20210916
x86_64               randconfig-a015-20210916
i386                 randconfig-a016-20210916
i386                 randconfig-a015-20210916
i386                 randconfig-a011-20210916
i386                 randconfig-a012-20210916
i386                 randconfig-a013-20210916
i386                 randconfig-a014-20210916
i386                 randconfig-a016-20210918
i386                 randconfig-a012-20210918
i386                 randconfig-a011-20210918
i386                 randconfig-a015-20210918
i386                 randconfig-a013-20210918
i386                 randconfig-a014-20210918
riscv                randconfig-r042-20210916
s390                 randconfig-r044-20210916
arc                  randconfig-r043-20210916
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20210916
x86_64               randconfig-c007-20210916
mips                 randconfig-c004-20210916
powerpc              randconfig-c003-20210916
arm                  randconfig-c002-20210916
i386                 randconfig-c001-20210916
s390                 randconfig-c005-20210916
riscv                randconfig-c006-20210917
x86_64               randconfig-c007-20210917
mips                 randconfig-c004-20210917
powerpc              randconfig-c003-20210917
arm                  randconfig-c002-20210917
i386                 randconfig-c001-20210917
s390                 randconfig-c005-20210917
riscv                randconfig-c006-20210918
x86_64               randconfig-c007-20210918
powerpc              randconfig-c003-20210918
mips                 randconfig-c004-20210918
i386                 randconfig-c001-20210918
arm                  randconfig-c002-20210918
s390                 randconfig-c005-20210918
x86_64               randconfig-a002-20210916
x86_64               randconfig-a003-20210916
x86_64               randconfig-a006-20210916
x86_64               randconfig-a004-20210916
x86_64               randconfig-a005-20210916
x86_64               randconfig-a001-20210916
i386                 randconfig-a004-20210916
i386                 randconfig-a005-20210916
i386                 randconfig-a006-20210916
i386                 randconfig-a002-20210916
i386                 randconfig-a003-20210916
i386                 randconfig-a001-20210916
i386                 randconfig-a004-20210918
i386                 randconfig-a005-20210918
i386                 randconfig-a002-20210918
i386                 randconfig-a006-20210918
i386                 randconfig-a001-20210918
i386                 randconfig-a003-20210918
x86_64               randconfig-a002-20210918
x86_64               randconfig-a004-20210918
x86_64               randconfig-a006-20210918
x86_64               randconfig-a003-20210918
x86_64               randconfig-a001-20210918
x86_64               randconfig-a005-20210918
hexagon              randconfig-r045-20210916
hexagon              randconfig-r041-20210916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
