Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A6BC433F5
	for <ath10k@archiver.kernel.org>; Tue, 14 Dec 2021 02:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5RdqLAoMDYeX4GEr6KdqEQZFm4nt6Qx7rf1j/3et0pY=; b=u876428egA5sXE
	pS6UKPjbGQNHppLAW8yisaG8MTfwV6wvFCbvj9DmvrEiNBQ3YS1Hja0CamhDnsUbqVhoUtE+TjuG2
	gJFBZl5SeHLhlPfTNqvIg292DZS7GOUCexY+38mlzOSWCt7erEltnUZXFH0z0rveRPLkXr+A4ctmn
	ffzPT5KfsufDY5DfXtBlADPf66bqMgjphRx0vBuLi5nPzaBz/jVWDEwM+g13ggo2GnbSnJ3bxHgDR
	VJWouAxCTS8I+8Y4/+tIOSQdpJ+WK0XpOXr3k7wJvU8DCWwlAX8lVl/PNyKYeajQiWxuexKxF+4Oz
	PlD7fpQRwD6pmUp1Znxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwxXz-00CHW3-7U; Tue, 14 Dec 2021 02:28:07 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwxXw-00CHVF-Dz
 for ath10k@lists.infradead.org; Tue, 14 Dec 2021 02:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639448884; x=1670984884;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=P2SWPKn0gxL1xg4L754K4DtBEbvamjPg/Ux7KDa+REs=;
 b=fXQfu7/e4/WQGivD+uVccqJ49ll9hnilPu6DSF5A9XxaBqZbL1ppAoj/
 iPsi/RCuDXeKNK2JSM36jqhQWPkMx/sAg8kMPyWvpFms7k255n4Ag6bPQ
 KV1qJROffWrNzkNSDx0Q3xRdbNjLcOBuv2BSann73gQ+EbTY8FQZtOzxU
 1Pk9Zb3oNLj+mtjcocyq39RgpsSicw2mHfAW2F/2X8K1kJtrM/CPe4JZn
 KSrHTMAhJ8p7zjnHlHlzYYSVqhxwQyQKOXmw09YU0BqFbiYi1EEZphb0m
 f3k8BNKwzSZZMxadrrbpfPsYE2fEUoVoY6uxIsa69t32zIzb5/dHMq6YI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="237616207"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="237616207"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 18:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="481741172"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 13 Dec 2021 18:28:02 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mwxXt-0007Jk-QZ; Tue, 14 Dec 2021 02:28:01 +0000
Date: Tue, 14 Dec 2021 10:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 ba53ee7f7f38cf0592b8be1dcdabaf8f7535f8c1
Message-ID: <61b80111.zffSAaqoK4kG5/0h%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_182804_532477_EE02D735 
X-CRM114-Status: UNSURE (   6.04  )
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
branch HEAD: ba53ee7f7f38cf0592b8be1dcdabaf8f7535f8c1  ath11k: Fix deleting uninitialized kernel timer during fragment cache flush

elapsed time: 957m

configs tested: 121
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
arm                       imx_v6_v7_defconfig
arm                         s5pv210_defconfig
powerpc                     taishan_defconfig
powerpc                      acadia_defconfig
powerpc                   motionpro_defconfig
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
arc                          axs101_defconfig
m68k                          atari_defconfig
mips                     loongson1c_defconfig
powerpc                      obs600_defconfig
arm                            qcom_defconfig
sh                           se7724_defconfig
mips                      bmips_stb_defconfig
nds32                            alldefconfig
m68k                        mvme147_defconfig
powerpc                     kilauea_defconfig
sh                           se7712_defconfig
arm                  randconfig-c002-20211213
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a016-20211213
x86_64               randconfig-a015-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a012-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a016-20211213
arc                  randconfig-r043-20211213
riscv                randconfig-r042-20211213
s390                 randconfig-r044-20211213
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                          rhel-8.3-func

clang tested configs:
x86_64               randconfig-c007-20211213
arm                  randconfig-c002-20211213
riscv                randconfig-c006-20211213
mips                 randconfig-c004-20211213
i386                 randconfig-c001-20211213
s390                 randconfig-c005-20211213
powerpc              randconfig-c003-20211213
x86_64               randconfig-a001-20211213
x86_64               randconfig-a002-20211213
x86_64               randconfig-a003-20211213
x86_64               randconfig-a004-20211213
x86_64               randconfig-a005-20211213
x86_64               randconfig-a006-20211213
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
