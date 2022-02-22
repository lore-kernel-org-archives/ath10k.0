Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED550C433EF
	for <ath10k@archiver.kernel.org>; Tue, 22 Feb 2022 00:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9WpBsYPcos6IS3kg/NQu799aOXeplBT8TOCCYXujE14=; b=ymIuFGtTswFIuA
	pW2RCRG9mYBz1C20Z6UoMowOoUiizTwxTdOxzrJYimP7eq35B8tBaMU013Wka8WkJDAWlSby34PQE
	ldJxWUye7NrxQoMaz8WyPBUJzU7sITfzu7jlH3gmQyuI2+jHhGPkzd1z8cM+N9EQlrtxHgsAbVptw
	y7rWgXxNV0ZhuTUUFcbYEbKj215MeTLds/iUjYaS13s8imfkfyzUVbPkXjbdkN5BwvzeE0nTUmwMH
	pST679uwvtkIUbPy3Tlb2Oqd1qz2Wp6+nIS51Iu76EH0/EDXSaBWEO4FsJHaf2e3s1HE6RvAE0HbG
	nYRJgNdhNBHv86wpdmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMJRD-007Y7W-AF; Tue, 22 Feb 2022 00:53:55 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMJRA-007Y7E-CH
 for ath10k@lists.infradead.org; Tue, 22 Feb 2022 00:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645491232; x=1677027232;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=AJKEPq4ypS5V5+C7ndLbA5yjzAOeiuBUR6RtZ09TpS8=;
 b=ExQswg9QHNOCXwhGTios9n3lYFlj/W7AKVPyeQ0PWr22HeH6DyTkaIKL
 gviR1fy9qPYjTFEofXnq3BK4i19kq54u8jAM+CJHEId3bdbNZ4OYldoyd
 K9CLouuofabNlNEEnO6ETjIsjBh7Gjw2CY2X0P/anw4go+ZZMs2KX/mLu
 y/DDgGtEEJVSVnlL7+iqI7JP5oA/ygI4Ie/LJmhd2f3F6PKkPRvXWdVGT
 7E8s3mLjRTzYFRI5IfRPXn1l2pEojeGqEq0zBB/RWYriPhJFPx9RGDB6w
 E+3Zty0JogmlcaDhPyGmFmFCCHnRqhaMKc22eBucNypIFmsL4okBs3TqW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="235126033"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="235126033"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 16:53:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="606510582"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2022 16:53:47 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMJR4-0002AI-Qd; Tue, 22 Feb 2022 00:53:46 +0000
Date: Tue, 22 Feb 2022 08:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 ea18fff5ad42bb6b21174cbea891560b48d7c8be
Message-ID: <621433f3.dDZu5NZCqZz3JTzG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_165352_513375_F40EF28C 
X-CRM114-Status: UNSURE (   7.55  )
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
branch HEAD: ea18fff5ad42bb6b21174cbea891560b48d7c8be  Merge branch 'ath-next' into ath-qca

elapsed time: 774m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220221
powerpc                   currituck_defconfig
mips                    maltaup_xpa_defconfig
alpha                            alldefconfig
sh                           se7724_defconfig
sh                               allmodconfig
powerpc                  storcenter_defconfig
mips                         tb0226_defconfig
mips                           ip32_defconfig
sh                            hp6xx_defconfig
sh                           se7721_defconfig
powerpc                 linkstation_defconfig
microblaze                      mmu_defconfig
mips                             allmodconfig
sh                        sh7763rdp_defconfig
mips                           jazz_defconfig
powerpc                         ps3_defconfig
mips                        jmr3927_defconfig
sh                           sh2007_defconfig
powerpc                      makalu_defconfig
xtensa                         virt_defconfig
csky                             alldefconfig
sh                          rsk7203_defconfig
s390                                defconfig
arm                  randconfig-c002-20220221
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
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20220221
x86_64               randconfig-a002-20220221
x86_64               randconfig-a005-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a004-20220221
i386                 randconfig-a002-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a006-20220221
i386                 randconfig-a004-20220221
arc                  randconfig-r043-20220221
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
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func

clang tested configs:
x86_64               randconfig-c007-20220221
powerpc              randconfig-c003-20220221
i386                 randconfig-c001-20220221
arm                  randconfig-c002-20220221
mips                 randconfig-c004-20220221
s390                 randconfig-c005-20220221
riscv                randconfig-c006-20220221
powerpc                 mpc8272_ads_defconfig
arm                        vexpress_defconfig
arm                          collie_defconfig
arm                  colibri_pxa270_defconfig
riscv                          rv32_defconfig
powerpc                  mpc866_ads_defconfig
arm                            dove_defconfig
powerpc                     ksi8560_defconfig
hexagon                             defconfig
x86_64               randconfig-a011-20220221
x86_64               randconfig-a015-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221
s390                 randconfig-r044-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
