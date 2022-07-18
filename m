Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D47EC43334
	for <ath10k@archiver.kernel.org>; Mon, 18 Jul 2022 22:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sjjCaK24xr0l2pP6yM1X3Yl6M2JCw+HS50lj6fhJEy0=; b=mFp5vARC/lHiiv
	AeRo0tZn/60jpe5FwNZaA9tROmUv1v0xBNeJ2xYQ75O6wPVU6z1br+fdUOjVrn3XW2wMDQjN9hF+Q
	B+VvYiGt4HKUhjR5WVAvU28xpcy6WkLO9or3tgVxqheZg9ZjPRhE9AzZb/uumebubS8EQIM+U1LVO
	6ve3P+DAm4cTnXWR25n1UIOJ0obwB/rcslHEon1EdLkK3xCNGtPNku8rfIXDnnqQ46mopEqVQ3OU/
	VxTIRUN/jbPTnKf1ltKeLobQ1IBHo5wIVSqpxyQrx8/LUtlzM2SP2zcmSaFQD/rz5sqSAWr4nnu3f
	ZKwfG7+uA5U4rI27IulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDZ3l-0022N6-Hy; Mon, 18 Jul 2022 22:17:49 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDZ3i-0022Cl-Ck
	for ath10k@lists.infradead.org; Mon, 18 Jul 2022 22:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658182666; x=1689718666;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Pf5pFr7ijBxDUrA3v9jd6FvxL234LK2O1/JxeuVfwyU=;
  b=S7bvHEtKQQkdjddwoG/4Ea5XTzWMHPhr9nWxJWMTIHYyR7zRdu5q53IJ
   tk8KpQr3MGMwcUlD3t+l4gduNNYHAPuRq7OtAKDzgj97LX2Tck2C7jxBf
   sF+9YFmZtA3G7YPAWir68cMP8BecMQ9cfMeRvgLiJCalYizHGL+pH1vtz
   NbVdS0WCfc9iA7KqfHe1AK4DzD9uXUFN182OV+UWhve9h+5AbNYKkMYC+
   4tk2hHUBn7EInP1j1YhfuAZ1RaaVjrr7fPMPfLIvYKjGmS67cOZKnEjB+
   X5qwKRxHbbw7yaFDpBE3B2bOmvkib+WpU6BK3TFqnls0sG3YaqB+tspdK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="287482071"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="287482071"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 15:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="700193176"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2022 15:17:42 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDZ3e-0004o8-7c;
	Mon, 18 Jul 2022 22:17:42 +0000
Date: Tue, 19 Jul 2022 06:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 18bdb5dea0163d58bc5a18cf94fa2a0202a66acf
Message-ID: <62d5dbee.oxmMHKRAsLAmR1cC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_151746_532086_1855F050 
X-CRM114-Status: UNSURE (   5.94  )
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
branch HEAD: 18bdb5dea0163d58bc5a18cf94fa2a0202a66acf  Merge branch 'pending' into master-pending

elapsed time: 721m

configs tested: 105
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220718
m68k                       m5249evb_defconfig
nios2                            allyesconfig
arm                           corgi_defconfig
powerpc                 mpc834x_mds_defconfig
arc                                 defconfig
arm                        spear6xx_defconfig
parisc                generic-32bit_defconfig
sh                   sh7770_generic_defconfig
xtensa                    xip_kc705_defconfig
ia64                      gensparse_defconfig
arm                            pleb_defconfig
arm                             pxa_defconfig
sh                   secureedge5410_defconfig
xtensa                  audio_kc705_defconfig
arm                           tegra_defconfig
nios2                               defconfig
powerpc                 mpc834x_itx_defconfig
sh                           se7619_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
alpha                               defconfig
s390                             allyesconfig
loongarch                           defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64               randconfig-k001-20220718
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a013-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a011-20220718
i386                 randconfig-a015-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a013-20220718
i386                          randconfig-a014
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
arc                  randconfig-r043-20220717
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                        qi_lb60_defconfig
arm                         bcm2835_defconfig
powerpc                    ge_imp3a_defconfig
arm                       aspeed_g4_defconfig
mips                     loongson1c_defconfig
mips                      bmips_stb_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                 randconfig-a004-20220718
i386                 randconfig-a003-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a006-20220718
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
hexagon              randconfig-r041-20220717
hexagon              randconfig-r045-20220717
riscv                randconfig-r042-20220717
s390                 randconfig-r044-20220717

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
