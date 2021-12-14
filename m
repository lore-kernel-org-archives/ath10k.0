Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85C9C433EF
	for <ath10k@archiver.kernel.org>; Tue, 14 Dec 2021 02:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CS2VojXt1MH/p3jUQAFF8slZVhbEap2FZf3XBWi+HpI=; b=3gunDuLICD8fw/
	uBbcCqA3sCdaCnWHvItRKf9vsCs971DrmcNZ1ip/ItEeo6XCjMrXRd04vEiLbE0ZIDzZLDuk05bqq
	alhxuS7BRihHjU5q0bhyh37lgI6AHyDzFobe1RRqY7pLvP9Wpp88Dl/dPOl8BGYQk6Yq/qwnMnmDf
	JiPY3qAtuj7KYTsW20icwlc3suVPxD4ZYvnEMfkVSH4iwL4kfnUjle3r++xkLBF8PI3jYzxSJtykk
	tQg7/h5ct8aAexuQeOGW+t/OCIpuCSMonh2i6Vbe744ojUPIwOmIkCMqbV1sjPeF2XU7Yj+Ro+Oec
	X/Xhcb5+eIIVd6HELZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwxY0-00CHWE-UO; Tue, 14 Dec 2021 02:28:08 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwxXw-00CHVE-Db
 for ath10k@lists.infradead.org; Tue, 14 Dec 2021 02:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639448884; x=1670984884;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=jzHSEziE4zzpFeRThQhyqY19Sa/LBhA9TTSaWlYO9ks=;
 b=TEHPoj3riCWZZHYB+JCkFKyIKw1/P3Rk3S4okl//We8BTy/okn/OEe9v
 n3V9sbYu6lqJBJCKYRj/24NXM4qgsMjqNAfLDksDT80iFjhko0siQkhOU
 4azrZ44WrB3dxi+Nc4TgVSFjzf0Oh+IXwTKKDHyQzwFNPJzhbgTMhuGht
 w5MKOtiOt9AVIoQhoYIRJwGnbS+R9kSbN5aGjbQKc7qiowzZBHptugGla
 Dh922w6Uz2MnzyyFVe9pmx2elWQ0PUn7a7JNdx6XYVPbg4W8flii+/7zO
 JyhU94vBUzrOAb88TfnSgJ2wbPwwn7AufeUbw7koMskjfxJcuBUvqi1oh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="226156527"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="226156527"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 18:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="464886458"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 18:28:02 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mwxXt-0007Jh-PL; Tue, 14 Dec 2021 02:28:01 +0000
Date: Tue, 14 Dec 2021 10:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 6cce4964a399f7eb43e75e57de0def72561a162c
Message-ID: <61b80116.p9ASREgcay0TCwfD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_182804_535457_27890F9E 
X-CRM114-Status: UNSURE (   5.84  )
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
branch HEAD: 6cce4964a399f7eb43e75e57de0def72561a162c  ath11k: report tx bitrate for iw wlan station dump

elapsed time: 872m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211213
arc                        vdk_hs38_defconfig
powerpc                     pq2fads_defconfig
arm                           h5000_defconfig
powerpc                 mpc837x_mds_defconfig
openrisc                 simple_smp_defconfig
powerpc                   motionpro_defconfig
arm                       imx_v6_v7_defconfig
arm                         s5pv210_defconfig
powerpc                     taishan_defconfig
powerpc                      acadia_defconfig
powerpc                   bluestone_defconfig
mips                           mtx1_defconfig
s390                             allyesconfig
m68k                       m5249evb_defconfig
mips                         tb0219_defconfig
powerpc                       ebony_defconfig
arm                        trizeps4_defconfig
m68k                          hp300_defconfig
mips                           gcw0_defconfig
mips                          malta_defconfig
powerpc                     ksi8560_defconfig
arm                            qcom_defconfig
sh                           se7724_defconfig
mips                      bmips_stb_defconfig
arm                  randconfig-c002-20211213
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a016-20211213
x86_64               randconfig-a015-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a016-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
arc                  randconfig-r043-20211213
s390                 randconfig-r044-20211213
riscv                randconfig-r042-20211213
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211213
arm                  randconfig-c002-20211213
riscv                randconfig-c006-20211213
mips                 randconfig-c004-20211213
i386                 randconfig-c001-20211213
s390                 randconfig-c005-20211213
powerpc              randconfig-c003-20211213
i386                 randconfig-a001-20211213
i386                 randconfig-a002-20211213
i386                 randconfig-a005-20211213
i386                 randconfig-a003-20211213
i386                 randconfig-a006-20211213
i386                 randconfig-a004-20211213
hexagon              randconfig-r045-20211213
hexagon              randconfig-r041-20211213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
