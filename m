Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB130C433F5
	for <ath10k@archiver.kernel.org>; Tue, 21 Dec 2021 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C0X8Ta8PFDeWnmKTit/6BKm29S3Jew09wPsKPwKwSek=; b=NLMwz9BUhuNyn2
	VvHqOEud/iz2m/lrU6Cdw3LSp5CdbkJb6O83fGzDDlhcvI4H7SxEX1hcSAbT01DTyE/l7ktMfSJ8H
	pbKba/vor7n2QRgZEZryhJNhz5yG4Z1E8F2uS8+4GGmdqNw03x9Aqzbqirx4qWhsCRJEUHiL+EWuR
	uIPTeWwfQdWEhhxyVgq04oPWJim8X4rezB6s/tf/FU1sPQj5hdfWEKw0oUkb3rSpf7ye/BN1r/wlc
	kUbF6kCLPHwKjsEaho0vV3K1/kz6p9Op9rxzDfDvvRWjvZFB1WCtNM5jn6EoSBHR+sSO11/BjeCoi
	XRExLsqIvfO1wwq9OHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzbKh-0066To-IH; Tue, 21 Dec 2021 09:21:19 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzbKZ-0066Q7-3l
 for ath10k@lists.infradead.org; Tue, 21 Dec 2021 09:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640078471; x=1671614471;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=tDYhEchZxcC+jgrY7YZm4VZNjKNBq9VIYf0uBVIuH3M=;
 b=NYXIuwFc19FErkqrav+rSBRKrq3oE8oiOCuZcOmOOa79dvqqGlIIi7BD
 SYHOJ4nEMfDiVoInZduYtG8ujZBap9V2Ng6ycmaz/2MMkCNovHhVgYI/1
 sOqdHQR2nfUH7GEAqQ0g4HL2xTx/v9JPzYjeyhpbxY8sODJ1Dw+jE0skk
 3/7VEj+d7zgahtntcydn083g0e+Ukc6QlhdY1ajdGpqoNTn2xPY2Pmj95
 SL9+cq18KgqmkMt2Tpo3JAONURIXGka19fmReJhB6Pn1KAiw3E8VDIHx1
 RNIjMe5oggLEUb9QTXHg5hEdRSgbxh6v9Axbyv9HQs/gKFOnpK4s2FrnZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="237897363"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="237897363"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 01:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; d="scan'208";a="663892871"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2021 01:20:50 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mzbKD-0008uN-OI; Tue, 21 Dec 2021 09:20:49 +0000
Date: Tue, 21 Dec 2021 17:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 ec038c6127fa772d2c5604e329f22371830d5fa6
Message-ID: <61c19c63.5guf3mIK9rE1f4Vd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_012111_244552_D625FC98 
X-CRM114-Status: UNSURE (   7.37  )
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
branch HEAD: ec038c6127fa772d2c5604e329f22371830d5fa6  ath11k: add support for hardware rfkill for QCA6390

elapsed time: 727m

configs tested: 95
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
arm                       imx_v4_v5_defconfig
arm                        vexpress_defconfig
mips                       bmips_be_defconfig
powerpc                       maple_defconfig
sh                           se7712_defconfig
mips                      pic32mzda_defconfig
powerpc                      ppc40x_defconfig
arm                          moxart_defconfig
arm                       versatile_defconfig
arm                        neponset_defconfig
powerpc                      ep88xc_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a002-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a005-20211220
x86_64               randconfig-a006-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a006-20211220
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a013-20211220
x86_64               randconfig-a015-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a014-20211220
x86_64               randconfig-a016-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a014-20211220
i386                 randconfig-a016-20211220
i386                 randconfig-a015-20211220
i386                 randconfig-a013-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220
s390                 randconfig-r044-20211220
hexagon              randconfig-r041-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
