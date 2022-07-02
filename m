Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8473CC433EF
	for <ath10k@archiver.kernel.org>; Sat,  2 Jul 2022 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cCeesKg00uXq1XKnopyxoRASDVYkYtgp1nIYpksWPtw=; b=GUA3y+vyMBEZ/6
	+KQNYECDnxrx5bnP9Z1WRiJS/i2oUX/rQMAA33NVl/A5NfQXaGjSuIZExJMPZz9fN41FFA4UdlZ74
	x7y54ORHQ7W/a9nYAIpQ5V/Alww3VNgjmWxcl2UHQEJlq41nNUqQVMo7fNh2nnDl/FrLn3NCIDfmd
	/ZEIg0LibtQl00OgIZZeL+TSM5Nk9y1xbGot9SBtFyGD42lwNjSxH+Z8NOLDl6W06BimKZkZajuZ4
	KU1PFofT0pDoJDr1DsYmdQgAk/ebriqM+Ht75KGHW2AhVNNUzGpW67prTGXf5V77uF4NclFHzB1a6
	8vGJKINC4OHM/E2RaygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7dGD-009n81-Bk; Sat, 02 Jul 2022 13:34:09 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7dG9-009n3B-KP
	for ath10k@lists.infradead.org; Sat, 02 Jul 2022 13:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656768845; x=1688304845;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vbFRadxGJWTAQM2RO6MblNditwGlen/i69kdcEdcZqQ=;
  b=AUb2lsidfoX9/hNvuw+nrnjDdbvFlz/C2k5YeSMmkybpq6ZdhOqgQ/5A
   3+tGts20Cb64qnoQj2WOhj5izFerENEOL+fB5pG42OnkaIytGdnyGJTIr
   dZXgKURixWiNzzXKFapYNn1lUyjfRIniNI4bXdRMp/izmmQJE6wLd6L8k
   DECSm+L+iY77HhcCGPzT2BX/8X1dLBeBxbe2pxdiBysuBJJUyte+YRY3I
   ip2SsKc04GoAKwwMkFiDfuLA/RDD2ZRys6g+vu6Of28feQZVcTsMuUAiy
   rg3ch7TU+7AdU6bLT71XCGu6c3wC32zloT70r9m2dyfz9TyNAFXDCPhqB
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="262628818"
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="262628818"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 06:33:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="648733106"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jul 2022 06:33:55 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o7dFy-000FI3-GE;
	Sat, 02 Jul 2022 13:33:54 +0000
Date: Sat, 02 Jul 2022 21:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS WITH WARNING
 0cf4a34c762040fce4480ded01c3f6b917f9ab05
Message-ID: <62c04924.8cp+cmnmMVP8iDcz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_063405_735760_961CB48E 
X-CRM114-Status: UNSURE (   3.47  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: 0cf4a34c762040fce4480ded01c3f6b917f9ab05  ath12k: convert hw_params to a const pointer

Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath12k/dp_rx.c:2698:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_rx.c:2739:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_tx.c:569:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_tx.c:605:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/hal_rx.c:404:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/hal_rx.c:406:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
`-- csky-allmodconfig
    |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
    |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
    `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size

elapsed time: 1751m

configs tested: 117
configs skipped: 3

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                             shx3_defconfig
arc                     haps_hs_smp_defconfig
m68k                          amiga_defconfig
arc                        nsim_700_defconfig
nios2                         3c120_defconfig
arc                     nsimosci_hs_defconfig
arm                        mini2440_defconfig
arm                            xcep_defconfig
arm                         at91_dt_defconfig
sh                        sh7785lcr_defconfig
arm                            mps2_defconfig
arm                          pxa3xx_defconfig
sh                         microdev_defconfig
powerpc                      ppc6xx_defconfig
powerpc                  storcenter_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 canyonlands_defconfig
arm                           imxrt_defconfig
mips                      loongson3_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      ep88xc_defconfig
arm                            lart_defconfig
arm                           u8500_defconfig
m68k                                defconfig
sh                            migor_defconfig
arm                      jornada720_defconfig
arm                         axm55xx_defconfig
xtensa                              defconfig
arm                          iop32x_defconfig
arm                           sama5_defconfig
sh                           se7712_defconfig
arc                        nsimosci_defconfig
powerpc                      cm5200_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
nios2                            allyesconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
nios2                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220629
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                  randconfig-r043-20220629
riscv                randconfig-r042-20220629
s390                 randconfig-r044-20220629
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz

clang tested configs:
mips                        maltaup_defconfig
powerpc                   microwatt_defconfig
powerpc                     akebono_defconfig
powerpc                      pmac32_defconfig
powerpc                     ppa8548_defconfig
x86_64                           allyesconfig
arm                             mxs_defconfig
powerpc                 mpc832x_rdb_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220629
hexagon              randconfig-r045-20220629

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
