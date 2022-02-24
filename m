Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84114C433F5
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 23:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PO4xqvG1ROlQz0B7JXDVoFFpUoIYwS7cOtQUq5b3QkU=; b=IMKA7cJiwc1vGZ
	zRYbeMFEVkGXB5/PEltI4Tor//CxfLEoFXX+3cPLzFEmGoORZ/NL3GuG9q2+29KfcMsmuiBlExdzM
	H9X7M/ow4VlSiEa43ZRCpPxzXeWWT+M/hfZu52GNc1fEJDolmdihY32rcJgzs3I5ELL+VtaeDLuwR
	NEBV9hV9ULbp9tHKt2zlWS43PBbG/PUw3VDaZrxBPcRrafjU5PhgfTkfPoa4mqzuGFQDv1Z4belqF
	h+1C8xvq4Of2D6U/Z/1oHmPxigCQK2OnDEKJv4eaN23TMas3DOJJBtU8DV0h1Wo14tl6ZNRjeOg2U
	MkZAGQJMWfzP5Yy8yeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNNUY-002hGU-Az; Thu, 24 Feb 2022 23:25:46 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNNUS-002hD9-Qt
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 23:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645745140; x=1677281140;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=e07nB5Gfx6p+6SmYsxZVV4sXH7WJ4GXnZ2XHDcmfg/g=;
 b=QBLyRvSbTTX5Szj0AwZ6iHlToCQLO2gvkqVgefAzG0+SN9ihQCWun5gv
 La3wRYiH/CNoAb13uq+O4sk0V0YFTCQPR7z5ZrhGrY0yK9VLxq5FBkkAi
 jWIroyzIQ1iXn+PFpm65oSQR7szTXliZzZb95ZEmN//IEHt9WLhRdoHD8
 8DO/r68DDnIeb1cg7PM+1lauPdyE1VawNYEnvJAZ3vJnFQEwOixBvR7L9
 rgsbCffHms7bSUcojSpkvPC+O27WIErIXJfrZZQp6O6RX+OIUJnL/Mndy
 cUv0nu3ZiP/IwZPHYcgqMnobeOkbTKyjOUhIHtD9WNqNbkCAzc+w75vFD A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="235882600"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="235882600"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 15:25:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="788712820"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2022 15:25:36 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nNNUO-0003Z7-55; Thu, 24 Feb 2022 23:25:36 +0000
Date: Fri, 25 Feb 2022 07:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master] BUILD SUCCESS
 d983066f1ebd8535095b9e3f2651bdbc89529e29
Message-ID: <621813bc.QYgJWloiQnRcWzYf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_152540_969759_9B536273 
X-CRM114-Status: UNSURE (   5.99  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master
branch HEAD: d983066f1ebd8535095b9e3f2651bdbc89529e29  Add localversion-wireless-testing-ath

elapsed time: 734m

configs tested: 179
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                 randconfig-c004-20220223
i386                          randconfig-c001
powerpc                    amigaone_defconfig
powerpc                      cm5200_defconfig
powerpc                 mpc837x_mds_defconfig
arm                            zeus_defconfig
powerpc                       maple_defconfig
s390                          debug_defconfig
mips                             allyesconfig
arm                           stm32_defconfig
arm                        spear6xx_defconfig
powerpc                     sequoia_defconfig
microblaze                      mmu_defconfig
powerpc                  iss476-smp_defconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
m68k                        mvme16x_defconfig
powerpc                     stx_gp3_defconfig
sh                         microdev_defconfig
sh                             espt_defconfig
arc                              alldefconfig
sh                          rsk7201_defconfig
arm                         axm55xx_defconfig
nios2                            allyesconfig
xtensa                          iss_defconfig
powerpc                 mpc8540_ads_defconfig
um                             i386_defconfig
mips                       capcella_defconfig
sh                        sh7785lcr_defconfig
powerpc                      makalu_defconfig
powerpc                     mpc83xx_defconfig
ia64                            zx1_defconfig
sh                   sh7724_generic_defconfig
arc                     haps_hs_smp_defconfig
powerpc                        cell_defconfig
sh                          rsk7269_defconfig
mips                           jazz_defconfig
sh                           se7750_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc834x_mds_defconfig
sh                     magicpanelr2_defconfig
mips                           gcw0_defconfig
arm                         s3c6400_defconfig
h8300                    h8300h-sim_defconfig
sh                           sh2007_defconfig
ia64                             allmodconfig
sh                           se7724_defconfig
arm                         assabet_defconfig
arc                        nsimosci_defconfig
nios2                         10m50_defconfig
sh                            titan_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                           se7712_defconfig
sh                          polaris_defconfig
openrisc                         alldefconfig
powerpc                      pasemi_defconfig
arm                          iop32x_defconfig
powerpc                       eiger_defconfig
sh                          sdk7780_defconfig
mips                       bmips_be_defconfig
xtensa                       common_defconfig
nios2                               defconfig
csky                                defconfig
arm                           tegra_defconfig
ia64                             alldefconfig
arm                          gemini_defconfig
arc                     nsimosci_hs_defconfig
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220224
arc                  randconfig-r043-20220224
arc                  randconfig-r043-20220223
riscv                randconfig-r042-20220224
arc                  randconfig-r043-20220225
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220224
powerpc              randconfig-c003-20220223
x86_64                        randconfig-c007
arm                  randconfig-c002-20220224
arm                  randconfig-c002-20220223
mips                 randconfig-c004-20220224
mips                 randconfig-c004-20220223
i386                          randconfig-c001
riscv                randconfig-c006-20220223
riscv                randconfig-c006-20220224
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                                 defconfig
arm                         hackkit_defconfig
powerpc                     tqm8560_defconfig
arm                         socfpga_defconfig
mips                           ip22_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        neponset_defconfig
arm                      tct_hammer_defconfig
powerpc                   lite5200b_defconfig
arm                          moxart_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20220223
hexagon              randconfig-r041-20220223
riscv                randconfig-r042-20220223
hexagon              randconfig-r045-20220225
s390                 randconfig-r044-20220223
s390                 randconfig-r044-20220225
hexagon              randconfig-r041-20220225
riscv                randconfig-r042-20220225
hexagon              randconfig-r041-20220224
hexagon              randconfig-r045-20220224

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
