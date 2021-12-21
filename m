Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16004C433EF
	for <ath10k@archiver.kernel.org>; Tue, 21 Dec 2021 23:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kxpxNiBbKMJXqvk4vgHujztMHUYtzqfJSp97iAxus6o=; b=IczkneeE/C3DNm
	6ub0mdaMHsKpitH6mXbmoA9zVbjVtM85JREfEevRNsX6N3iIcm1gZfTx+ej9LOcAs0dltTtwJoIRv
	ctRBz2Fo8l3WqsFl0gfpViMaSOEqUbwanM0XRyLh7BbK5Suz4K4zfdentHLgAgPoUNFkzyt3WN5O0
	MBhOmJ2R4XsGUmJ0EVVHKkMXkKEO6AzcY2rc2Mm4Tppqqkm1g0CYJqA70ugNKJh6Jy8x7V6ybs4cI
	weHsbYR7XnaE2PQtbW5eD3oDQUDPu44RrGHOhV6+Nw7p5BIY/LqqOzmCTBAfslXSFSNJ9bg+eUiaA
	Pdrzz1z26UNvKqitGL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzo7N-008hrG-SQ; Tue, 21 Dec 2021 23:00:25 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzo7L-008hqZ-84
 for ath10k@lists.infradead.org; Tue, 21 Dec 2021 23:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640127623; x=1671663623;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HUsJNpoGo1eJzRO2zxEGPD38VGtssJAqd8WVZkrHxMw=;
 b=B2wuQMOSDMc6oKkAkufz2pcwpes3A/in9mFKzjqB2e6HRI+9EFAp3msd
 cm62kOrVzI3jTlGtYYZM6spC6+y+olelNpQ8ZH66RwD7JzC/g2zHXcQXB
 F7zQy74zgBeUqWBYYbc3LiZYcftIpQWR58kBZwg9ezjNN3fuOBxoXVd6h
 wRNfbyRbWpZ0Hnm+qdZRpf7DwXnlKCgBBlUn7RsZ0jRpLmZSFWamTbfF5
 MgzD/e7pDQLBsIGRkGIXjgqx+ee2ZF//vWrHBZQeksu4aMrLPRj4l+RmR
 7VvdHCeAy08heHpCMcJYp3+6UuSXuesMrYpgRLS+xPfrdAN1i5RWMtj0D A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="221182155"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="221182155"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 15:00:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="508258767"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 21 Dec 2021 15:00:20 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mzo7H-0009df-Do; Tue, 21 Dec 2021 23:00:19 +0000
Date: Wed, 22 Dec 2021 06:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 e3c574cc54b726c9573b7862a8bf3571ca806411
Message-ID: <61c25c46.549spCOnBH+c52mW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_150023_346607_476D52B9 
X-CRM114-Status: UNSURE (   4.51  )
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
branch HEAD: e3c574cc54b726c9573b7862a8bf3571ca806411  Merge branch 'ath-next' into ath-qca

elapsed time: 722m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      chrp32_defconfig
arm                          moxart_defconfig
mips                      pic32mzda_defconfig
powerpc                      ppc40x_defconfig
mips                         rt305x_defconfig
mips                           gcw0_defconfig
mips                       bmips_be_defconfig
powerpc                     skiroot_defconfig
mips                      maltaaprp_defconfig
sh                   sh7724_generic_defconfig
arm                            lart_defconfig
powerpc                      ep88xc_defconfig
mips                      malta_kvm_defconfig
xtensa                    xip_kc705_defconfig
sh                         microdev_defconfig
arm                            mps2_defconfig
sh                         ecovec24_defconfig
arm                      jornada720_defconfig
sh                          urquell_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allyesconfig
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
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a004-20211220
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a002-20211220
x86_64               randconfig-a005-20211220
x86_64               randconfig-a006-20211220
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a016-20211220
x86_64               randconfig-a013-20211220
x86_64               randconfig-a015-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a013-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a014-20211220
i386                 randconfig-a015-20211220
i386                 randconfig-a016-20211220
hexagon              randconfig-r041-20211220
hexagon              randconfig-r045-20211220
s390                 randconfig-r044-20211220
riscv                randconfig-r042-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
