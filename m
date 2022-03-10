Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387D3C433F5
	for <ath10k@archiver.kernel.org>; Thu, 10 Mar 2022 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5mgIJmtNnf/2QTCO7zj9NaxeUS+7oFXy8L/dzXvIHRQ=; b=KCXWp8AIC0b/3W
	2fsCZiVymmmFk6fa3OSz5EXjLRhC6wsmx78pAeyP7pcDsFxUzBkIiCkXnw4bEH0L8XdS+tQ4UOmDc
	P/ehkrW/PKyJYAyWh29p3wummvg8vXDc6k/rlTBp24ijmBE4A3wiwsmJwbUzogMj0k0kMPeABxk3R
	gc4Cm1DpqqhAYiqdK9pUp8W0sJzIpwtRCgxrxjcDKE17P75RQBVdErQR/7Bi+OqVaKeTNJoroZUZh
	0a/aPGIaN05hB/i3CTUkfjMdNB+XFWFXT07bkWVcH6T+31Q793Vmi3j1UviRFzzvbzKflRYWpylTX
	CgPSc04TG3pKxtRYfUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSDWR-00BnYv-R7; Thu, 10 Mar 2022 07:47:43 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSDWO-00BnYJ-Gb
 for ath10k@lists.infradead.org; Thu, 10 Mar 2022 07:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646898460; x=1678434460;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=KSxTppNmDe6nBUt1hRYp9dPw1btwXfunmDFtPEDfY5o=;
 b=Yh646hNCs30iwkAgna5Cx0DryRC5/sQCHGp6JUbS7FIHZVnn08Xes4Nu
 68aODUXwfeWvaZUVhw3auc7laMGEg8mXYGrQZCLAu6XMfaCSMohsLv9mf
 1t+sP4DnOmvzHVyBBQQdOrwF11d4S7cMh5CNpCtUZrgO9NeW1UhduzYB/
 uhyNYn1u060s4m4GOxoP8E8GMBRrSWxG6b8VD+XEL+y/wTg9RLQ3asgc8
 5O8JhfOWKMj44oJ/ciJQW5wkleLJ8bNeiUw5CDUcBHalqtzZkqNebtB5C
 KhcXFIs6OsYrvXzNacaNkpFiWFZY+4R1eGD8j/uXn9mjrc2I8Yzof89f6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="279920382"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="279920382"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 23:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="538347898"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2022 23:47:38 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSDWL-0004aG-Ce; Thu, 10 Mar 2022 07:47:37 +0000
Date: Thu, 10 Mar 2022 15:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 44d445c02388c47f8da9fbbeb639f3bbe552356c
Message-ID: <6229ace8.mWLbZIUTkz2Vmmsc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_234740_603708_DD7A2065 
X-CRM114-Status: UNSURE (   6.51  )
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
branch HEAD: 44d445c02388c47f8da9fbbeb639f3bbe552356c  ath9k: make array voice_priority static const

elapsed time: 919m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220310
arm                            lart_defconfig
sh                               j2_defconfig
sh                        apsh4ad0a_defconfig
sparc                            alldefconfig
m68k                          atari_defconfig
h8300                       h8s-sim_defconfig
mips                            gpr_defconfig
mips                 decstation_r4k_defconfig
sh                        dreamcast_defconfig
mips                     loongson1b_defconfig
m68k                        mvme16x_defconfig
arm                           h5000_defconfig
um                               alldefconfig
arm                         lubbock_defconfig
ia64                      gensparse_defconfig
openrisc                 simple_smp_defconfig
arm                  randconfig-c002-20220309
arm                  randconfig-c002-20220310
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220309
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                      ppc44x_defconfig
arm                        neponset_defconfig
arm                       versatile_defconfig
mips                           ip22_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                          rm200_defconfig
riscv                    nommu_virt_defconfig
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
hexagon              randconfig-r045-20220310
hexagon              randconfig-r041-20220310
riscv                randconfig-r042-20220310
s390                 randconfig-r044-20220309

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
