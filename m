Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052A0C433FE
	for <ath10k@archiver.kernel.org>; Tue, 11 Oct 2022 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UGcRfbjEGSEBDalBzvzcK7JE4Gzb9V0T/7pghXlHYR4=; b=oxPRhbltnHxZOo
	FwMT8Tb063NUL4ox5OX5i6XrvAt6/Nhnw0j5XPHhfJD0ojb2v64IhEH6G6NkicSZOM77I2Vlw8HoO
	3kRLUCVwFigWA2jyQR+K2CMiSSqrWJvRogFdzt/42iJb1Fkj7e2iA8vopu5m/p5x8EKWSX5s/O3Ph
	yyoVOSyjlMdkFi7HWIPrwq9yoHDbB+EjZgNDxR11XYMhLWMeBnJAHNj7Qe0gunye4m/oKtBxeps3r
	kc0CXsguvTBKUYXU2t+vSXKBbC9+6EXeVGgFXgwCfqqKpfTmwMlHgZb0EmJFEgU8F0Hhpv7H6H99i
	Uk/bHtGXQ0pJqyGZDxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiLQy-005iSd-Bm; Tue, 11 Oct 2022 20:01:00 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiLQu-005iRT-HJ
	for ath10k@lists.infradead.org; Tue, 11 Oct 2022 20:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665518456; x=1697054456;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dR53nVGj4luAxHHR+n3e/GbkWwxJTmozkqO+cE+tU8I=;
  b=SR6NxzaD0n2bkTySHxfmnHFpoTYqxrO6favt1k+eKCs7yZTBOPkHnvvU
   SZUD1PIseunjJ4kG50YmE69s2wKCvE/f7/Y2Y6UpPDyUwyklw5jCQ9e5v
   LK2VFN5ERSgKvl8Unv8FrvdUgqbr5ihoAWsG1wRKzA9f4TpjT9pimvxZo
   wmayRPfhak6kvTbs+si6JSMyIXWOt//Ls1fPb1atRKGaioYulgR16ffX9
   MZq8gKBToBcB97xRclfQutdSHprVYcqmnrQJ2HIZzXWYGegbNPxegUviE
   yx9+5vvJVsm0RMcafZpeOVksXIUl4XpNAYuO/xFE8lj9cchMeAYJhes6J
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="291934240"
X-IronPort-AV: E=Sophos;i="5.95,177,1661842800"; 
   d="scan'208";a="291934240"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 13:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="695200275"
X-IronPort-AV: E=Sophos;i="5.95,177,1661842800"; 
   d="scan'208";a="695200275"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2022 13:00:37 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oiLQa-00038R-2g;
	Tue, 11 Oct 2022 20:00:36 +0000
Date: Wed, 12 Oct 2022 03:59:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 27653641235cba8fc88f67fa69229b55976d242d
Message-ID: <6345cb39.vEeslSYmhW94/1lX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_130056_645671_23E5EB3D 
X-CRM114-Status: UNSURE (   7.08  )
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
branch HEAD: 27653641235cba8fc88f67fa69229b55976d242d  wifi: ath11k: Send PME message during wakeup from D3cold

elapsed time: 724m

configs tested: 142
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                              defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                               rhel-8.3
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
arc                  randconfig-r043-20221010
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
i386                 randconfig-a012-20221010
x86_64               randconfig-a011-20221010
s390                 randconfig-r044-20221010
i386                                defconfig
riscv                randconfig-r042-20221010
i386                 randconfig-a011-20221010
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a013-20221010
x86_64               randconfig-a012-20221010
arm                                 defconfig
i386                 randconfig-a015-20221010
alpha                            allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a013-20221010
x86_64               randconfig-a016-20221010
sh                               allmodconfig
i386                 randconfig-a014-20221010
x86_64               randconfig-a014-20221010
m68k                             allmodconfig
x86_64               randconfig-a015-20221010
i386                 randconfig-a016-20221010
arc                              allyesconfig
i386                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                         s3c6400_defconfig
arm                         lubbock_defconfig
m68k                        m5272c3_defconfig
arm                      integrator_defconfig
sh                           se7750_defconfig
sh                             shx3_defconfig
mips                      maltasmvp_defconfig
x86_64               randconfig-k001-20221010
mips                           jazz_defconfig
powerpc                      pcm030_defconfig
mips                         rt305x_defconfig
openrisc                    or1ksim_defconfig
arm                        trizeps4_defconfig
arm                           stm32_defconfig
arm                            pleb_defconfig
sh                           se7206_defconfig
sh                        edosk7760_defconfig
i386                 randconfig-c001-20221010
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
ia64                          tiger_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     asp8347_defconfig
m68k                        stmark2_defconfig
m68k                        m5407c3_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     pq2fads_defconfig
powerpc                   currituck_defconfig
arc                           tb10x_defconfig
powerpc                    sam440ep_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                             alldefconfig
arc                      axs103_smp_defconfig
powerpc                     taishan_defconfig
arm                         lpc18xx_defconfig
parisc                generic-64bit_defconfig
arc                         haps_hs_defconfig
powerpc                      ep88xc_defconfig
um                               alldefconfig
sh                           se7780_defconfig
xtensa                           alldefconfig
arm                            zeus_defconfig
arm                           sama5_defconfig
openrisc                       virt_defconfig
arm                            lart_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      fuloong2e_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
arm                        mini2440_defconfig
powerpc                     rainier_defconfig
ia64                        generic_defconfig
nios2                         3c120_defconfig
sh                        sh7763rdp_defconfig
m68k                           sun3_defconfig
arm                        realview_defconfig
mips                 decstation_r4k_defconfig
mips                            gpr_defconfig

clang tested configs:
i386                 randconfig-a003-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a005-20221010
hexagon              randconfig-r045-20221010
i386                 randconfig-a006-20221010
hexagon              randconfig-r041-20221010
i386                 randconfig-a004-20221010
x86_64               randconfig-a002-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a005-20221010
x86_64                        randconfig-k001
arm                       imx_v4_v5_defconfig
mips                     cu1000-neo_defconfig
arm                          ixp4xx_defconfig
powerpc                      walnut_defconfig
powerpc                 mpc836x_rdk_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
riscv                    nommu_virt_defconfig
arm                         orion5x_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
