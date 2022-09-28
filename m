Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E5C6FA92
	for <ath10k@archiver.kernel.org>; Wed, 28 Sep 2022 06:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CEpUfI2TDXXa8Lca3jvCeBIHHO7R6hfGMlZqF2SBkgQ=; b=w+5nNRYLgyl/m6
	VR0Z3u+uhU8m3v60pSBiyMwUscIj8FZLrD5bMspzPG97e9nDPvglKAI9Rut3MlutKFgg98Iz0EU6O
	dXWbAogtrpbM6tdmz7eFxsjtg64W9EEfxLe+FHq0y37y11KnHYDWOeAoOeer8BTW3gEPmFnp+qi6S
	lgQ4nHLWWeFHHUGfNze4RPmEpZXVd5gYAUTM/SVegNuCbWi3+9PakXdJ0DJ34/ienQtewj1gM3iID
	vGttJs64BpxFxJklFR1azbMA6vj2CInPDu5QpfQVqmyV8uUxWLBEgVoNrSZpkUVmx5uE/999CTRNX
	NJk8mQ4QcNqYmftWzwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odQL7-00EDTs-Ax; Wed, 28 Sep 2022 06:14:37 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odQL4-00EDSf-L7
	for ath10k@lists.infradead.org; Wed, 28 Sep 2022 06:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664345674; x=1695881674;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z49h9vcyK3/2o38irdkyOVHy7cJupamw9nfOjEfDNd8=;
  b=QnH6SSL0gyZARGKJ3w4a3BqgkYAS1aRmvo4o298xZLp/VAsbxDh865Dk
   3CW0/9/W6jViojHmdNafdyFnh/htYQxu15oZSU0V3knh2khOLwOp3MN8t
   Djuw1TceT36Bd0yfQVGg396PhGx50k5y0BOlXpl2S7qhwjQE7KaL3HD0m
   oIJBZfAgxd7bWPjoOXvO9atYIxZH/YqJRbnSnhjT1Skwj/NmRFCtyxmp/
   KOFNz336XPBFBt8rbt1cf9sgC7FQCLCIYincP0HQ5XL4qzHnVl92CG/hL
   t7QywUzuwbsuO6BtaL0YALIU5XHmFhzvGD4c/XqAY0EtbZV76mChBUwKK
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281234164"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="281234164"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 23:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="950572592"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; 
   d="scan'208";a="950572592"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2022 23:13:10 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1odQJi-00025T-17;
	Wed, 28 Sep 2022 06:13:10 +0000
Date: Wed, 28 Sep 2022 14:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 229acc4f9febdc9b5d8ebb0713253df833138dce
Message-ID: <6333e5f4.bI73pih1SJKvJ0jT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_231434_789799_37CC9E24 
X-CRM114-Status: UNSURE (   4.37  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: 229acc4f9febdc9b5d8ebb0713253df833138dce  wifi: ath12k: Declare structure member as constant

elapsed time: 725m

configs tested: 103
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
s390                             allyesconfig
mips                             allyesconfig
alpha                            allyesconfig
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
m68k                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
x86_64                           allyesconfig
x86_64               randconfig-a003-20220926
i386                                defconfig
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                             allyesconfig
i386                 randconfig-a004-20220926
i386                 randconfig-a002-20220926
x86_64                        randconfig-a015
i386                 randconfig-a003-20220926
arc                  randconfig-r043-20220925
i386                 randconfig-a001-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
s390                       zfcpdump_defconfig
powerpc                      tqm8xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220925
i386                          randconfig-c001
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
i386                             alldefconfig
mips                        bcm47xx_defconfig
sh                          urquell_defconfig
arc                      axs103_smp_defconfig
arm                         s3c6400_defconfig
m68k                        m5272c3_defconfig
arm                           stm32_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig

clang tested configs:
x86_64                        randconfig-a012
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a011-20220926
hexagon              randconfig-r045-20220925
x86_64                        randconfig-a016
i386                 randconfig-a016-20220926
hexagon              randconfig-r041-20220926
i386                 randconfig-a015-20220926
x86_64                        randconfig-a014
i386                 randconfig-a014-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
