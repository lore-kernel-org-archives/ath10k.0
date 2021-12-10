Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90ECC433F5
	for <ath10k@archiver.kernel.org>; Fri, 10 Dec 2021 01:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z2JUFjwhHCJeIulfa2sTHsN71RR/jpvJ1PZudNxqNmo=; b=NSKXbItqEpWMvA
	G4J0NvDGCOzKmyu8/W4l2fkbupJ7R4Rxt9M84tz1id+I7rz4tCOL/T3P5vaIHc2O3vi1Ma0Y69u2u
	uUedf7+u1npiqrz3B45wOPB9bkgZwNjEq72FhcnxgU/fWDsoKEGeLxr+EI47kTYMcEPaVwSS87cZg
	Bc6PCfzCfekq51shMjRcxPDmImtKWlylIztlKhmTamH7AVQ7UpamKAJ6LUInLshtwEnAt6hLeyviX
	6BIVmzBKLiRAAntvLN7uVckto5nHlk555+qxO+TNzr/tcF75PbGB3vv2j+U81XTOgqZBmQT7VqJpA
	q5hH3husCRvqlejZEh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvV8d-000chl-S5; Fri, 10 Dec 2021 01:55:55 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvV8b-000cgr-Kc
 for ath10k@lists.infradead.org; Fri, 10 Dec 2021 01:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639101353; x=1670637353;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Ky96/0PVppodkwY5J78mDGG5dCOUsYaaFw5IFXnwqNM=;
 b=gh3mLFTBjrRFuSPaJ7jMt7Q4hKBvugKvZ/20eQlyTjWXL6qa9RLcVKzN
 wzbZwbV2WXCYeaLDKrQ7xGDCOp98E8VBVJUVXVuU1wO2+lSgLRGMBoc5N
 1cWGHnpt+Fel1jS8EovZWTq4UC4eoUQjwjpUFrirsrj573Ca/HUKXrDmh
 aqbQC0x5ZT+h1INRJBBaRuvsHc2dcbZQWKoBe5e7kKX2uNERtKzZsldiX
 I9QqNPgpvWJEGVn36pwaj2CxHbj+mpQZq60QV+UPHhu+1MTvx+WfkjBIL
 BuUuCJw1gey6wAOmN7RJK6zhXAslSxZcdu3+AzKVpk4CiQAG0/55gJOrN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="301633568"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="301633568"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 17:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="680571529"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 09 Dec 2021 17:55:50 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mvV8X-0002cf-FK; Fri, 10 Dec 2021 01:55:49 +0000
Date: Fri, 10 Dec 2021 09:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 642f55943a2c93d9afa702afd48df4e09e72fa7d
Message-ID: <61b2b382.1wmOFOiX4PwD26mK%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_175553_762258_7D8A2E0F 
X-CRM114-Status: UNSURE (   4.33  )
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
branch HEAD: 642f55943a2c93d9afa702afd48df4e09e72fa7d  Merge branch 'ath-next' into ath-qca

elapsed time: 1041m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
mips                           ip28_defconfig
nios2                         10m50_defconfig
powerpc                     asp8347_defconfig
mips                        vocore2_defconfig
sh                          polaris_defconfig
powerpc                     redwood_defconfig
sh                          rsk7269_defconfig
arm                           sama5_defconfig
sh                        sh7763rdp_defconfig
powerpc                     rainier_defconfig
arm                            dove_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                           se7712_defconfig
sh                   secureedge5410_defconfig
sparc64                             defconfig
mips                         cobalt_defconfig
xtensa                generic_kc705_defconfig
arm                  randconfig-c002-20211209
ia64                                defconfig
ia64                             allmodconfig
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
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211209
x86_64               randconfig-a005-20211209
x86_64               randconfig-a001-20211209
x86_64               randconfig-a002-20211209
x86_64               randconfig-a004-20211209
x86_64               randconfig-a003-20211209
i386                 randconfig-a001-20211209
i386                 randconfig-a005-20211209
i386                 randconfig-a003-20211209
i386                 randconfig-a002-20211209
i386                 randconfig-a006-20211209
i386                 randconfig-a004-20211209
arc                  randconfig-r043-20211209
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                  randconfig-c002-20211209
x86_64               randconfig-c007-20211209
riscv                randconfig-c006-20211209
i386                 randconfig-c001-20211209
mips                 randconfig-c004-20211209
powerpc              randconfig-c003-20211209
s390                 randconfig-c005-20211209
x86_64               randconfig-a011-20211209
x86_64               randconfig-a013-20211209
x86_64               randconfig-a015-20211209
x86_64               randconfig-a012-20211209
x86_64               randconfig-a014-20211209
x86_64               randconfig-a016-20211209
i386                 randconfig-a013-20211209
i386                 randconfig-a016-20211209
i386                 randconfig-a011-20211209
i386                 randconfig-a014-20211209
i386                 randconfig-a012-20211209
i386                 randconfig-a015-20211209
hexagon              randconfig-r045-20211209
s390                 randconfig-r044-20211209
hexagon              randconfig-r041-20211209
riscv                randconfig-r042-20211209

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
