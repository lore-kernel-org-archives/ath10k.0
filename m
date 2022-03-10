Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17EBC433F5
	for <ath10k@archiver.kernel.org>; Thu, 10 Mar 2022 06:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U68l06k+zJUUl6sdHSld1OMIc2NNhKVTfH1Kn7KUApk=; b=1H1aoKmXahXxSW
	3tJWl0KiuHSdmjm96gFgQI8a+LQPLcwAb7bmAhLVHdgiKwnULc5pkZc1H+szAaHsd7hOY3NK9Ix8Q
	1F+Efxs0CUgUKbLd2M2XPZLRSXDynepQRUjSWTioVKuQji3NfOrpBFq48wzxwq3FAohnsRCAWsgdH
	yrDjoG9B/cF33xVDc3u/VL2ZYYViqRg6UmAzUpOGV4kiwqXDUS6z9/NE0q9/LbXAtjEBU448FfiXs
	Zf/vnQ9Uj6kvnkHk7LUI0ttPGbolfvdcqZOxfeN4766K5HOkey/ni/FF9slQebwE09CBQJv8hsjyB
	uUyFj+X+cvcryuoORcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSC7I-00BYG2-UX; Thu, 10 Mar 2022 06:17:40 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSC7F-00BYEy-Lj
 for ath10k@lists.infradead.org; Thu, 10 Mar 2022 06:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646893057; x=1678429057;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=2ExnjZfDzqe6ve+anfLzdGfU1EI9lNeKavzDylW/5dk=;
 b=dOKW95mQLORXuOSV0qVDM3BPWQD7QpmXFomrxrkf+nuBDmcCqlSmGk9C
 V+Xrg2MncKdWxVk8U1JqLuL+g27DjoEQL8r5HVMoq/6EOSpCpBPJhudfJ
 M31X00Kv7gHf4LGaLA/lcI3Hu2KJ1l4MKXBBeojh8tmNXBCSxXSz0ypwr
 oQjvJiBXxUL2fwbOAAcYVOFKKg9sbXsgGKRna10/c4YbJW9b+/Wlt6qmz
 R0PpIx3MQ3CGdO1wMWL5WPpx3OpQW+U2Kmrgntu5TerDHjmM3QN8SrIMv
 j/MuPyE668gTiVLYSbt3rCVZ42wtvVScHjT6UEFQQINxHdoc3OOutOH1U g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="237339532"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="237339532"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 22:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="632878976"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2022 22:17:32 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSC7A-0004Rm-83; Thu, 10 Mar 2022 06:17:32 +0000
Date: Thu, 10 Mar 2022 14:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 d778b067727e6313668852660587417a5c14ea05
Message-ID: <622997c6.vHI1LUYpCxASoWmt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_221737_818881_431B0544 
X-CRM114-Status: UNSURE (   7.11  )
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
branch HEAD: d778b067727e6313668852660587417a5c14ea05  Merge branch 'ath-next' into ath-qca

elapsed time: 826m

configs tested: 107
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                         cm_x300_defconfig
sh                            migor_defconfig
arm                       multi_v4t_defconfig
powerpc                      tqm8xx_defconfig
m68k                        mvme16x_defconfig
nds32                            alldefconfig
arm                            qcom_defconfig
mips                         tb0226_defconfig
m68k                          multi_defconfig
arm                            pleb_defconfig
mips                        vocore2_defconfig
nios2                            alldefconfig
arm                      integrator_defconfig
arm                         nhk8815_defconfig
sh                              ul2_defconfig
arm                  randconfig-c002-20220309
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220309
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                     kilauea_defconfig
mips                        omega2p_defconfig
arm                        neponset_defconfig
powerpc                     tqm8560_defconfig
arm                    vt8500_v6_v7_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220309
hexagon              randconfig-r041-20220309
riscv                randconfig-r042-20220309
s390                 randconfig-r044-20220309

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
