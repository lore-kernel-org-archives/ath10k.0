Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F87C43217
	for <ath10k@archiver.kernel.org>; Tue, 22 Mar 2022 02:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vLmrMUK3FFtQXXUYl3ICwVBaaqyFPDks9EYA7diVgm0=; b=3EBZlhznGUsjZN
	D9cpVMUDzz1eR6qRtTS/LrtQeRUzOgCXmn07QNobJWPcoy4iH80YW1Zj6n/+e8qiQ5dR+qbfXvijc
	AoHHjoh+dVDLvvJfxSytFBfwrkELwPoPWEgiJfnTAYGWBmit8T4Mf8cTzmAeYULac2LQKjse/OjUe
	tMofntCTHDwmbXdxh2QFHvCpGxrlSIh5ZCGEq2qNzyus3D0AHxF1hd6rTeDwanZu84X/DsxPO8KoD
	lLoapkmpsTfsbPiU596553iGulxuV0JvZRHULSEGw7By3CClUdppX1jrNCOvSKvvDtuvJudaAfIDL
	DIpn2ZvKx6JJk2OghykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWUiV-009nqd-6H; Tue, 22 Mar 2022 02:57:51 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUiR-009npk-2v
 for ath10k@lists.infradead.org; Tue, 22 Mar 2022 02:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647917867; x=1679453867;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=QGkhlSAUSF63xkIlM5GsQac+7cSP8MTasrdGak5RsPE=;
 b=O/AecaZv4lUmE7oxHybdwD2a989/KI+c3WOvHTuDVJlMi+nlR6Xl14nN
 BBzZD29Rupb4LbA3jj9oOHupHy960TZEolajvxPJ7Fznnd5tNaCAgE626
 KG4rZomPhNJIz6R2PKCGg+cWNHAsUFlSsiOIbRZZwA6TPEBRNq9AeiBd+
 fAOOst2k+NFA9tSNdPl7aKmY0Q3yV2z2cfr4pfdicZimG1cdhBqQk2bkt
 zdVyzptnyJg3Vd24H45gERyPd2nfR72u8q8avRAzqaQNtgjPbqlNaDIUt
 fmDQK6p1PWFjwCRGHVb4Yn9VSDlKeNKdbjSKsH/biAsWIIUaoXOBLfai0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="238312555"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="238312555"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 19:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="646851552"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2022 19:57:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWUiM-000IOZ-O3; Tue, 22 Mar 2022 02:57:42 +0000
Date: Tue, 22 Mar 2022 10:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 72a9bff386545d3f8e9c432cb8e036272ad4e1fa
Message-ID: <62393afe.3ZZUW2mnfI3oIK7+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_195747_178276_A83101E4 
X-CRM114-Status: UNSURE (   5.86  )
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
branch HEAD: 72a9bff386545d3f8e9c432cb8e036272ad4e1fa  ath11k: change fw build id format in driver init log

elapsed time: 724m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20220321
m68k                             alldefconfig
riscv                    nommu_k210_defconfig
m68k                       m5475evb_defconfig
arc                 nsimosci_hs_smp_defconfig
sh                               j2_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                        sh7757lcr_defconfig
powerpc64                           defconfig
arm                        mini2440_defconfig
powerpc                     ep8248e_defconfig
xtensa                          iss_defconfig
arm                  randconfig-c002-20220320
arm                  randconfig-c002-20220321
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a013-20220321
x86_64               randconfig-a012-20220321
x86_64               randconfig-a014-20220321
x86_64               randconfig-a011-20220321
x86_64               randconfig-a016-20220321
x86_64               randconfig-a015-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a014-20220321
i386                 randconfig-a016-20220321
arc                  randconfig-r043-20220322
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
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
arm                     am200epdkit_defconfig
arm                        spear3xx_defconfig
powerpc                     akebono_defconfig
arm                         lpc32xx_defconfig
powerpc                          allyesconfig
powerpc                 mpc8272_ads_defconfig
arm                        neponset_defconfig
x86_64               randconfig-a002-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a006-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a001-20220321
i386                 randconfig-a003-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a002-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a006-20220321
hexagon              randconfig-r041-20220322
riscv                randconfig-r042-20220322
s390                 randconfig-r044-20220322
hexagon              randconfig-r045-20220322

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
