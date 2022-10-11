Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB09C433F5
	for <ath10k@archiver.kernel.org>; Tue, 11 Oct 2022 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cUzJzFqQXWdz+oQkmygjwy9e9+fU27nJDU+MZz8l2VI=; b=TvcncbEC5UhD6A
	0Z52QwyGjjAwmDvgoZvOGoh78FfxWXnsBS9ud00899KjO6woSp/WWzbtuwnt6Uh2GYmu+o7iDRi4p
	5Iqv9fvzUfNj9hE9aObRlQwO5g3JGBuK4X+i6aLvqR0JC+pS/DByNU/7U2Kk69SC/Jd/D2FMhnpYb
	CrIH47NzhWQL+wxI8noLZHhGCF77OOCMKEJ3kKMCeKNaGcqOGHh1gS4xcuYdGHJ3X+gO4/yowi3z2
	EaIhnYZKYADk8LNuUYafgfBiWuFR10O9cymn+C+70RjJfvxLzapCWmkIcWC8uGw19Ux4TOW3wOeDj
	DIqMbsO1xhp9Y6w/SAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiItq-005KXO-77; Tue, 11 Oct 2022 17:18:38 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiItm-005KWu-Kg
	for ath10k@lists.infradead.org; Tue, 11 Oct 2022 17:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665508714; x=1697044714;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kZda3Kes+4UpVnRCkMfaHRmeZJTKAChDFGddbbXnky0=;
  b=AzdLMN2k2buMMBe9+K64nsWvT8sfH+UF7rEwQ68REv/KeCEml3PHCBPl
   EjN/thpfNHeQark1ZKBaS+9n7qY0fccqufZlUJdyw8U82Xp6vAbs9kt5P
   BZPh3bxGRA4Q0XgLW+gHdRiywvJZLsd3/n5sfbRSkPgGbJumjHIB8caHc
   7A/ridI5ORfd2FBuaJ3SXLoAjvyNgqg3CBJKplvMCQka/k31u6C0lL4k3
   cmKIAQ81ZFzjNa9nXSn95hEIFqNitOQILv1W18Z7sUBq9ZTlhjXWNnCWZ
   YCfT1DN1TKNHOjnbUOpmgI+XeVB6wubDlNJ30HEExRSYakVK34T3wZP2W
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="284300527"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="284300527"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 10:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="657434354"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="657434354"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2022 10:18:30 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oiIth-00032b-36;
	Tue, 11 Oct 2022 17:18:29 +0000
Date: Wed, 12 Oct 2022 01:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 16ef02bad239f11f322df8425d302be62f0443ce
Message-ID: <6345a549.J7H3Oovhm1fYYImM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_101834_723247_1BC0A408 
X-CRM114-Status: UNSURE (   4.30  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
branch HEAD: 16ef02bad239f11f322df8425d302be62f0443ce  wifi: ath9k: verify the expected usb_endpoints are present

elapsed time: 724m

configs tested: 131
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
arc                  randconfig-r043-20221010
riscv                randconfig-r042-20221010
x86_64                          rhel-8.3-func
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
i386                 randconfig-a012-20221010
s390                 randconfig-r044-20221010
alpha                            allyesconfig
i386                 randconfig-a011-20221010
m68k                             allyesconfig
i386                 randconfig-a013-20221010
i386                 randconfig-a015-20221010
arm                                 defconfig
i386                 randconfig-a014-20221010
i386                 randconfig-a016-20221010
powerpc                           allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a011-20221010
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
mips                             allyesconfig
x86_64               randconfig-a014-20221010
arm                              allyesconfig
arm64                            allyesconfig
x86_64               randconfig-a015-20221010
powerpc                          allmodconfig
x86_64               randconfig-a012-20221010
x86_64               randconfig-a013-20221010
x86_64               randconfig-a016-20221010
sh                               allmodconfig
i386                                defconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                             allyesconfig
i386                 randconfig-c001-20221010
arm                      integrator_defconfig
sh                           se7750_defconfig
sh                             shx3_defconfig
mips                      maltasmvp_defconfig
arm                         s3c6400_defconfig
arm                         lubbock_defconfig
m68k                        m5272c3_defconfig
sh                           se7206_defconfig
sh                        edosk7760_defconfig
ia64                          tiger_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     asp8347_defconfig
m68k                        stmark2_defconfig
arm                        trizeps4_defconfig
arm                           stm32_defconfig
arm                            pleb_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                            lart_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                      fuloong2e_defconfig
x86_64               randconfig-k001-20221010
mips                           jazz_defconfig
powerpc                      pcm030_defconfig
mips                         rt305x_defconfig
openrisc                    or1ksim_defconfig
arm                           h5000_defconfig
powerpc                    sam440ep_defconfig
mips                          rb532_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                        m5407c3_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     pq2fads_defconfig
powerpc                   currituck_defconfig
arc                           tb10x_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
m68k                             alldefconfig
arc                      axs103_smp_defconfig
powerpc                      ep88xc_defconfig
um                               alldefconfig
sh                           se7780_defconfig
xtensa                           alldefconfig
arm                            zeus_defconfig
arm                           sama5_defconfig
openrisc                       virt_defconfig
powerpc                     taishan_defconfig
arm                         lpc18xx_defconfig
parisc                generic-64bit_defconfig
arc                         haps_hs_defconfig

clang tested configs:
hexagon              randconfig-r045-20221010
hexagon              randconfig-r041-20221010
i386                 randconfig-a003-20221010
x86_64               randconfig-a004-20221010
x86_64               randconfig-a001-20221010
x86_64               randconfig-a002-20221010
x86_64               randconfig-a006-20221010
x86_64               randconfig-a003-20221010
x86_64               randconfig-a005-20221010
i386                 randconfig-a004-20221010
i386                 randconfig-a002-20221010
i386                 randconfig-a005-20221010
i386                 randconfig-a001-20221010
i386                 randconfig-a006-20221010
arm                       imx_v4_v5_defconfig
mips                     cu1000-neo_defconfig
arm                          ixp4xx_defconfig
x86_64                        randconfig-k001
powerpc                      walnut_defconfig
powerpc                 mpc836x_rdk_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
