Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B141C433EF
	for <ath10k@archiver.kernel.org>; Tue, 22 Mar 2022 02:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RcWEE9re1iXRJOtSzjscxJtONDFvPAOV9naJDY9Cj1o=; b=Ym8KSxnEFF1pou
	wKDk1gEyGwY5Hdw+nCGY+W9iNqwpF56RRuCafYRAPrtFX7pptrmlVroUF+2X/wrqepJsXBl+MZnLh
	IP5Rdpa6wEsWwlwY7Fmqo7zZkRk/09whI4LXvlxF09j6CC/Goditwn2cuRNcXgPekd6tMweDgD3D6
	N5InBs3ZZRHqKBvjVSUjYS8/6p23IyTUcyQqIyqtkK+ieZGsJDW7xyehjGsu2LfiNs/5DTVHUB1v/
	ox3hLOSweWCWy58Ome0GbNXCKMuNXAOn9BJ3WHOnpDdmn3tL41Q3ptda1pg9zVH9Y1xSOoRHqiger
	5Oxkl01K9uyUtc5N3/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWUiT-009nqB-Bw; Tue, 22 Mar 2022 02:57:49 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWUiP-009npU-9V
 for ath10k@lists.infradead.org; Tue, 22 Mar 2022 02:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647917865; x=1679453865;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=qz9Kt3XOnatRtO3T6sIbWZiw8vqP1jsfa4MuyHdhl9A=;
 b=jM1ivetFFaN9p+PIsVfWCAAmodMu4PZNLe0DeQ2t7seEm/5rZROv4fNL
 xqqfZ7nRyLF+ZtgU3jHgJLLH3LJE945xJjs9gdWmt5bCmVgRQKBmKlRAR
 jNUlj6XKq6cLSU/TmY0k9Ib+GTN3202wjAOA5zPlnNo88ARKe18YL0NYt
 x/Ifh2BW4wYAMgd0q7f212mGE1aftfEMJIBFHG2qG0a8ixFaidDpCLurU
 dtzs9tPYSpL7JUT1gq/crK/KOrh8QOuc27dGe3SDLaIjoYki1aT0aNTIL
 oEMLPuIVSQV7BGMoYmpRLxXpwjsCkCmbVmYGUj9k2esHyYxKFTpTSjqhO A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="237650170"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="237650170"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 19:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="785220010"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 21 Mar 2022 19:57:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWUiM-000IOR-Ll; Tue, 22 Mar 2022 02:57:42 +0000
Date: Tue, 22 Mar 2022 10:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 8b4978d04fe6444900ed97b28a759a475458788b
Message-ID: <62393b18.+xMcCokQByuanRMs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_195745_401941_15400DA8 
X-CRM114-Status: UNSURE (   4.50  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git master-pending
branch HEAD: 8b4978d04fe6444900ed97b28a759a475458788b  Merge branch 'pending' into master-pending

elapsed time: 721m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220321
mips                 randconfig-c004-20220320
m68k                          amiga_defconfig
mips                            gpr_defconfig
um                                  defconfig
arc                        vdk_hs38_defconfig
m68k                         apollo_defconfig
m68k                       m5475evb_defconfig
parisc                generic-64bit_defconfig
m68k                          sun3x_defconfig
sh                        apsh4ad0a_defconfig
arm                  randconfig-c002-20220320
arm                  randconfig-c002-20220321
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
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
i386                 randconfig-a014-20220321
i386                 randconfig-a013-20220321
i386                 randconfig-a016-20220321
i386                 randconfig-a015-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a012-20220321
arc                  randconfig-r043-20220322
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
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
mips                      bmips_stb_defconfig
powerpc                          allmodconfig
arm                          moxart_defconfig
arm                        neponset_defconfig
arm                       spear13xx_defconfig
powerpc                     tqm8540_defconfig
mips                  cavium_octeon_defconfig
arm                          ixp4xx_defconfig
i386                 randconfig-a003-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a006-20220321
i386                 randconfig-a002-20220321
riscv                randconfig-r042-20220322
s390                 randconfig-r044-20220322
hexagon              randconfig-r045-20220322
hexagon              randconfig-r041-20220322
x86_64               randconfig-a002-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a006-20220321
x86_64               randconfig-a005-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a001-20220321

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
