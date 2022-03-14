Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF385C433EF
	for <ath10k@archiver.kernel.org>; Mon, 14 Mar 2022 18:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zXfRPhlBRyr+7sn7ZaRmDC8fweke5vqATQJq239FEA4=; b=SWZZ85GDVueQEG
	4FKUb7tPPtCPTA7BgFlwqwl/PrtuoB6zt7ShJ+6xQk9ylRm0JVk7LCI/X9oRmdjLzm7bjKb35rnmr
	NOsZpwpDc9laiiDC7UoARRgKlHEWF6bpFPlX40lVEf1BY/1FJ1nyvh/Iwp7DWQIUzBIowWd3dA3qi
	69+2epApsXFEf6rMPfL2W5BEZXnbiy9PTrhcNYz8t9iRFTnC9QZetEjfie5sQKDXQoR/EdJ4HELS2
	8atDsRB5+p0q9dybFxY1/wo5wtoKr/kJUhLm6+OTlZrvXO34xULwkv8LJ/wgP00rq4ac8gZh5CaRk
	OzYWtejAf+RdXl4yEEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTp7C-006Ssh-H5; Mon, 14 Mar 2022 18:08:18 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTp79-006SsB-NT
 for ath10k@lists.infradead.org; Mon, 14 Mar 2022 18:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647281295; x=1678817295;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Aj7tWoYMhNx5qbHD4kxBK6gRsAnYx98UhZoShlIjsyE=;
 b=Ah4XozADDE/35PvFoY69TiRGtCI0fjza8+XmyzdI63Pk+8VCmF0tdBlx
 +S2X/IglAvPvOKwf/AMJJQAJS7BAQNaVDP152chLdUWz/pvPub9Lzk063
 DIHAx9pdINqtOUl4Z3JRo7OmpDgoTPckPwSTjph/DlKdsXhuRiDj0oafM
 9jL4Oh78Zem5SFliKk0Ej/9YzeXM84llyz/8R7jwnJs36zqPKDq5wxE81
 AkZ7vRPaDyMGmPppuzOYgqoNiLfXt3tvO8wXNnFn4iuv9mmzI1DU61sFW
 3CK11iL3TgXAnaN4OJWIGTeEgBW//VFmRbYpogOSlXkkAPo348B6uwgtf A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="316827236"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="316827236"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 11:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="580210120"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 14 Mar 2022 11:08:12 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nTp76-000A75-4t; Mon, 14 Mar 2022 18:08:12 +0000
Date: Tue, 15 Mar 2022 02:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 b7bdc72ea01526cb919d4421b1f767574b0bd468
Message-ID: <622f845e.bYP08EKUK6cdtFzW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_110815_875767_515566C7 
X-CRM114-Status: UNSURE (   5.29  )
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
branch HEAD: b7bdc72ea01526cb919d4421b1f767574b0bd468  Merge branch 'pending' into master-pending

elapsed time: 726m

configs tested: 149
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220313
i386                          randconfig-c001
arm                            zeus_defconfig
sh                                  defconfig
mips                           xway_defconfig
arm                          pxa910_defconfig
m68k                          multi_defconfig
powerpc                         ps3_defconfig
sh                   sh7724_generic_defconfig
sh                          rsk7269_defconfig
powerpc                      mgcoge_defconfig
arm                       omap2plus_defconfig
powerpc                     ep8248e_defconfig
um                           x86_64_defconfig
alpha                            allyesconfig
ia64                         bigsur_defconfig
arm                           corgi_defconfig
mips                     decstation_defconfig
powerpc                 mpc834x_mds_defconfig
um                               alldefconfig
sh                          kfr2r09_defconfig
mips                      fuloong2e_defconfig
sparc                            alldefconfig
sh                   sh7770_generic_defconfig
s390                                defconfig
powerpc                      makalu_defconfig
powerpc                       maple_defconfig
arc                           tb10x_defconfig
powerpc                     tqm8555_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                             ezx_defconfig
arm                             rpc_defconfig
powerpc                   motionpro_defconfig
sh                            titan_defconfig
xtensa                  audio_kc705_defconfig
m68k                            q40_defconfig
m68k                        stmark2_defconfig
i386                             alldefconfig
nds32                               defconfig
arc                         haps_hs_defconfig
x86_64                              defconfig
sh                        sh7785lcr_defconfig
arm                         s3c6400_defconfig
arm                  randconfig-c002-20220313
arm                  randconfig-c002-20220314
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
sparc                            allyesconfig
i386                             allyesconfig
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
x86_64               randconfig-a006-20220314
x86_64               randconfig-a002-20220314
x86_64               randconfig-a001-20220314
x86_64               randconfig-a003-20220314
x86_64               randconfig-a004-20220314
x86_64               randconfig-a005-20220314
arc                  randconfig-r043-20220313
riscv                randconfig-r042-20220313
s390                 randconfig-r044-20220313
arc                  randconfig-r043-20220314
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
mips                 randconfig-c004-20220313
arm                  randconfig-c002-20220313
i386                          randconfig-c001
powerpc              randconfig-c003-20220313
s390                 randconfig-c005-20220313
riscv                randconfig-c006-20220313
hexagon                             defconfig
powerpc                    socrates_defconfig
powerpc                     ksi8560_defconfig
arm                         lpc32xx_defconfig
mips                          ath25_defconfig
powerpc                     kilauea_defconfig
powerpc                     mpc512x_defconfig
arm                          pxa168_defconfig
mips                      malta_kvm_defconfig
x86_64               randconfig-a014-20220314
x86_64               randconfig-a015-20220314
x86_64               randconfig-a016-20220314
x86_64               randconfig-a012-20220314
x86_64               randconfig-a013-20220314
x86_64               randconfig-a011-20220314
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
i386                 randconfig-a013-20220314
i386                 randconfig-a015-20220314
i386                 randconfig-a014-20220314
i386                 randconfig-a011-20220314
i386                 randconfig-a016-20220314
i386                 randconfig-a012-20220314
hexagon              randconfig-r045-20220314
hexagon              randconfig-r045-20220313
riscv                randconfig-r042-20220314
hexagon              randconfig-r041-20220313
hexagon              randconfig-r041-20220314
s390                 randconfig-r044-20220314

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
