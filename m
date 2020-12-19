Return-Path: <SRS0=QvBg=FX=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8D0C2D0E4
	for <ath10k@archiver.kernel.org>; Sat, 19 Dec 2020 00:50:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACDF323BA7
	for <ath10k@archiver.kernel.org>; Sat, 19 Dec 2020 00:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACDF323BA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m2DXQ6nId6wLynoO9EkmCAhGLWi4RBtAdMHcyOgjWJ0=; b=t+oP+ldt7Rv/2XxjxRLlAbX1XX
	PWj2eVfelofdB1JrvuasRUXM0Ra7s+45njUbLqbYl0VeIymFiH5tAPBJZPECxnOeCC9NOcMa811vv
	Zxit97euR8nYOcrNW/XosdvH2xrR0tceVS0S6aBjUdJET5St1swE8+PBti8SxzACm8RG1ZtTbPh0k
	/6mv4r8xGtr10KPf6LJeP5u/ArF3RrA2N8nPRiM8x9V0ppYSn3i6WrOblwl3pqtMlugTvkXEAxjoY
	wWjJ6/zzH4InhrOIOXvdIWemSk8WCxc0ymnU7bf03qiS/hpSosGpHHMt47Rze49SgPKh42XuSg+eb
	tm9Z8S6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqQRF-00053D-EN; Sat, 19 Dec 2020 00:49:37 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqQRA-00052B-Mq
 for ath10k@lists.infradead.org; Sat, 19 Dec 2020 00:49:35 +0000
IronPort-SDR: 6kwGnPnVtuvtPmD/H+i3wKsO1dkalF/OL8Ze2oFrfhT1NHFYnceSgAVcJ93Si1LlinN3RQSR5H
 Ia1mhSneEhEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9839"; a="260259384"
X-IronPort-AV: E=Sophos;i="5.78,432,1599548400"; d="scan'208";a="260259384"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2020 16:49:24 -0800
IronPort-SDR: E+QRyKXfmjHHx9SZYsdBWWYtOT9T69AabzAZHEmxWkiBhyh+qKoHh4nV/xndk2cqwICLx4LozR
 SH28SK2M5Ykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,432,1599548400"; d="scan'208";a="490029101"
Received: from lkp-server02.sh.intel.com (HELO c4fb2a2464e8) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 18 Dec 2020 16:49:22 -0800
Received: from kbuild by c4fb2a2464e8 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kqQR0-0000YS-3K; Sat, 19 Dec 2020 00:49:22 +0000
Date: Sat, 19 Dec 2020 08:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: [ath6kl:ath-next] BUILD SUCCESS
 abdcd4cbec42fd3fe7e6c2d076360b0bbf62173f
Message-ID: <5fdd4dd9.I7YQEu0MYO0xmKF/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_194932_911395_D4241988 
X-CRM114-Status: UNSURE (   6.95  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  ath-next
branch HEAD: abdcd4cbec42fd3fe7e6c2d076360b0bbf62173f  ath11k: dp: clean up a variable name

elapsed time: 720m

configs tested: 146
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc8560_ads_defconfig
sh                   secureedge5410_defconfig
powerpc                   motionpro_defconfig
powerpc                      ep88xc_defconfig
parisc                           alldefconfig
arm                           omap1_defconfig
mips                            e55_defconfig
xtensa                    xip_kc705_defconfig
powerpc                      ppc40x_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                        mvme147_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                        icon_defconfig
sh                         ap325rxa_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                     taishan_defconfig
arm                         assabet_defconfig
c6x                              alldefconfig
sh                                  defconfig
sh                           se7724_defconfig
powerpc                      ppc44x_defconfig
sh                          urquell_defconfig
mips                           ci20_defconfig
sh                           se7780_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     tqm8540_defconfig
sh                        sh7757lcr_defconfig
arm                          imote2_defconfig
arm                          pxa3xx_defconfig
arm                         at91_dt_defconfig
mips                     cu1000-neo_defconfig
powerpc                     sequoia_defconfig
s390                                defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     sbc8548_defconfig
mips                    maltaup_xpa_defconfig
powerpc                 canyonlands_defconfig
arm                        spear3xx_defconfig
arm                         shannon_defconfig
m68k                         apollo_defconfig
sh                         apsh4a3a_defconfig
arm                          tango4_defconfig
mips                  decstation_64_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                      ppc6xx_defconfig
xtensa                           alldefconfig
sh                           se7206_defconfig
powerpc                       holly_defconfig
arm                         vf610m4_defconfig
mips                        vocore2_defconfig
i386                             alldefconfig
mips                      fuloong2e_defconfig
riscv                               defconfig
arm                            mps2_defconfig
arm                       cns3420vb_defconfig
powerpc                     kilauea_defconfig
sh                          rsk7201_defconfig
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201217
x86_64               randconfig-a006-20201217
x86_64               randconfig-a002-20201217
x86_64               randconfig-a005-20201217
x86_64               randconfig-a004-20201217
x86_64               randconfig-a001-20201217
i386                 randconfig-a001-20201217
i386                 randconfig-a004-20201217
i386                 randconfig-a003-20201217
i386                 randconfig-a002-20201217
i386                 randconfig-a006-20201217
i386                 randconfig-a005-20201217
x86_64               randconfig-a016-20201218
x86_64               randconfig-a013-20201218
x86_64               randconfig-a012-20201218
x86_64               randconfig-a015-20201218
x86_64               randconfig-a014-20201218
x86_64               randconfig-a011-20201218
i386                 randconfig-a014-20201217
i386                 randconfig-a013-20201217
i386                 randconfig-a012-20201217
i386                 randconfig-a011-20201217
i386                 randconfig-a015-20201217
i386                 randconfig-a016-20201217
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
x86_64               randconfig-a016-20201217
x86_64               randconfig-a012-20201217
x86_64               randconfig-a013-20201217
x86_64               randconfig-a015-20201217
x86_64               randconfig-a014-20201217
x86_64               randconfig-a011-20201217
x86_64               randconfig-a003-20201218
x86_64               randconfig-a006-20201218
x86_64               randconfig-a002-20201218
x86_64               randconfig-a005-20201218
x86_64               randconfig-a001-20201218
x86_64               randconfig-a004-20201218

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
