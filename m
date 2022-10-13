Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCA8C433FE
	for <ath10k@archiver.kernel.org>; Thu, 13 Oct 2022 18:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W6ydbDiTxxv4r6te0SR8L/t3WRYYehSB//SbOjefglo=; b=W2lSskKjyFZ0s9
	88gcyafdvsqjJG8/MJvaEfAe+6B8HvILLaTSuRGLBfsMBC+047aY0j8CooL4VVaUTRwQgdis1zOR6
	jiDKzrYm0rDFcZMNgsTqOfPMRvPGGW5gw5NcbNgH3QI3P/j1pi4as/7PzQ+Lf6w/E1NTGeZzHb6EF
	AE5eejIcdZBE3aZjoPHcQdS57L4TrYkqFt5qQQ1BDNRMMp4rgypqEZrbD3Fs0GjZtFIxdh5FGHZCQ
	jOoQ+7HSumnUO+oOxoZ880oKHZbvhwpS5zdSy14zkhQFIhvCG9oW61e+PQYItfIZ8Qw0/SKC7n2PT
	e9BbtangvVwW7tRTvpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3Ma-00Clsq-Ow; Thu, 13 Oct 2022 18:55:24 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3MV-00Clqy-Nk
	for ath10k@lists.infradead.org; Thu, 13 Oct 2022 18:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665687319; x=1697223319;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D2ftXkPbaOXetQU43z2u7DG7vZG1E6y6HDiL93A7SzQ=;
  b=AhSEgSEDusRewujjkq0VCLSa0eqzE5CsWNn8uHa61mxo8ej/0N2DVPHX
   Nauy2AxANl1nAvfxTfY8+dxsr+CqTeYAMy5BYYbZGJ4BAOMwztGVnWPZl
   JWGLEqUcxG9VDXjPJanOQ2FL3OteT8e9aqM14b5pTBcwBxkrjFWZqx1PD
   LOmqBAjadco6V16Qq3RZLKp8eqJmRuy+eYsLBb4wYkM8BlsJtGEvXq5sk
   RxP5+2jTiRN3jDAjhB5Rvatn4SVpinnY57e07C4w+yo+fnCEfQTmLWdXT
   2s/zbCXAApihh+R8jQSvgSMWRVdHVOenqf1U5Wip1TgWY8LlpWxYfjoHG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="391484989"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="391484989"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 11:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="605095054"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="605095054"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2022 11:55:16 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oj3MS-0005Ta-0k;
	Thu, 13 Oct 2022 18:55:16 +0000
Date: Fri, 14 Oct 2022 02:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 596157454b2e1846fde65eb4e10f16a781931ff8
Message-ID: <63485edc.Y9qNAX2hpPCR22/3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_115519_855892_C8B14EF6 
X-CRM114-Status: UNSURE (   3.92  )
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
branch HEAD: 596157454b2e1846fde65eb4e10f16a781931ff8  Merge branch 'pending' into master-pending

elapsed time: 723m

configs tested: 96
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-syz
arc                                 defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
alpha                               defconfig
i386                                defconfig
riscv                randconfig-r042-20221012
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arm                                 defconfig
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                        randconfig-a015
arc                  randconfig-r043-20221012
x86_64                    rhel-8.3-kselftests
s390                 randconfig-r044-20221012
arm64                            allyesconfig
s390                                defconfig
arm                              allyesconfig
x86_64                        randconfig-a002
s390                             allmodconfig
i386                          randconfig-a014
i386                          randconfig-a001
x86_64                        randconfig-a006
i386                          randconfig-a012
x86_64                           allyesconfig
i386                             allyesconfig
i386                          randconfig-a016
s390                             allyesconfig
x86_64                        randconfig-a004
i386                          randconfig-a003
alpha                            allyesconfig
powerpc                           allnoconfig
i386                          randconfig-a005
arc                              allyesconfig
mips                             allyesconfig
m68k                             allmodconfig
powerpc                          allmodconfig
sh                               allmodconfig
m68k                             allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                        multi_v7_defconfig
arc                     haps_hs_smp_defconfig
sh                          kfr2r09_defconfig
nios2                               defconfig
loongarch                 loongson3_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_mds_defconfig
mips                         bigsur_defconfig
sh                           se7780_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
powerpc                      ppc40x_defconfig
sh                            shmin_defconfig
sh                        apsh4ad0a_defconfig
powerpc                       maple_defconfig
powerpc                  iss476-smp_defconfig
xtensa                           allyesconfig
arm                         lpc18xx_defconfig
mips                 decstation_r4k_defconfig
xtensa                    xip_kc705_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
s390                       zfcpdump_defconfig
alpha                            alldefconfig
powerpc                 mpc834x_mds_defconfig

clang tested configs:
hexagon              randconfig-r041-20221012
hexagon              randconfig-r045-20221012
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
i386                          randconfig-a015
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
arm                        mvebu_v5_defconfig
arm                           omap1_defconfig
powerpc                     tqm8540_defconfig
x86_64                        randconfig-k001
arm                       aspeed_g4_defconfig
powerpc                      ppc44x_defconfig
mips                        qi_lb60_defconfig
mips                     cu1000-neo_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
