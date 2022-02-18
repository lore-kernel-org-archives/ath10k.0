Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4840EC433F5
	for <ath10k@archiver.kernel.org>; Fri, 18 Feb 2022 03:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bOMhauJB2hgoWJKGmeO/NeEzZ30acbUhmYPeALhf0wE=; b=bewFM7IJqaCQuS
	gYvYbNH8hyOZwgYMI14kmao9L8xP20RcYOPsp1OCYdmTupWitjcuUZuhMtd8ouGx6jnaokEi9bcJ7
	KyyHYDv8K+m9BYFVpxemtx9t6Vn/Rgqr1oEoeq0GsUdUTkCYQ42MyVNG/zfDJyUlaTnETVxb4UH7V
	6w5tGf5a9IJNscLPgHwyLG0bc7WkwCQx7ifWRfzR7y43ZOYIXidNs7+Xjd7Ob+j2JhFxo89d3ZKoF
	w66ZxUxyPiN0eFgzqKxQUyq6gTrIxv1vYSG5g83kV7KZdhXV2IxpYiFPtfW+4otnJrWKQ4IZEHxkQ
	DnAJaknh3hHSq2F9QKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKtqa-00CmpY-NI; Fri, 18 Feb 2022 03:22:16 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKtqX-00CmpC-S6
 for ath10k@lists.infradead.org; Fri, 18 Feb 2022 03:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645154533; x=1676690533;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=QAiJMY6r/lc24SXAOJlCm8suwglstdFeGttAunPhzjU=;
 b=G3WOkZXaItwyTpzq9Bs1UJKsNgjO4kgKkrBlcFB9ySyctPTlUdWZuWpC
 3/YnTLkUl4aAkH/Fjyd4GOI0wza2yJZ5PCgKhzpUnN2kIbk1t87ShIwYi
 9/NcDR2ib897BvZ8soT8Vjv4kr+RfazoKMJvPTrHzlSf2BpXyg+yw6SVH
 alCqYd1BUyeiDWu8ZNuOIvZUdFn8iS+pVpj/3b7kWebVbPsPtd0IhU2rk
 cIjIt0OrbBmEmHGNEBnt++U6LRporFOmFgk2TD8wbwv0yRmtvSMNQvKyw
 +8t5RfqgS9ktw9yLHERjLfkQ5/e8zzldxnWozRDLkHX0Q/mfL38p5OLHO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="249875096"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="249875096"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 19:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="590043002"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2022 19:22:11 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKtqU-0000tO-C4; Fri, 18 Feb 2022 03:22:10 +0000
Date: Fri, 18 Feb 2022 11:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 122fb5dd2fc6c3c467c72a92499a3b178ca82a81
Message-ID: <620f10aa.AW7pNi/FNpXYO1Cv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_192213_968128_94624432 
X-CRM114-Status: UNSURE (   4.81  )
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
branch HEAD: 122fb5dd2fc6c3c467c72a92499a3b178ca82a81  Merge branch 'pending' into master-pending

elapsed time: 750m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
i386                          randconfig-c001
powerpc                       maple_defconfig
arc                                 defconfig
sh                         microdev_defconfig
mips                  decstation_64_defconfig
parisc                generic-32bit_defconfig
m68k                            mac_defconfig
ia64                         bigsur_defconfig
powerpc                        cell_defconfig
riscv                            allyesconfig
xtensa                  nommu_kc705_defconfig
arc                          axs101_defconfig
arc                        vdk_hs38_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                       m5475evb_defconfig
arm                        spear6xx_defconfig
arm                            lart_defconfig
sh                            titan_defconfig
h8300                            alldefconfig
nios2                         3c120_defconfig
m68k                         apollo_defconfig
sh                           se7343_defconfig
sh                     sh7710voipgw_defconfig
powerpc                      pasemi_defconfig
x86_64                           alldefconfig
arc                         haps_hs_defconfig
xtensa                           alldefconfig
m68k                        m5272c3_defconfig
powerpc                       eiger_defconfig
arm                           corgi_defconfig
sh                          sdk7780_defconfig
arm                           h5000_defconfig
arm                          pxa3xx_defconfig
ia64                          tiger_defconfig
m68k                           sun3_defconfig
powerpc                      makalu_defconfig
m68k                       m5208evb_defconfig
arm                             ezx_defconfig
sparc                       sparc32_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20220217
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                     davinci_all_defconfig
powerpc                       ebony_defconfig
arm                      tct_hammer_defconfig
riscv                            alldefconfig
powerpc                     pseries_defconfig
powerpc                     tqm5200_defconfig
arm                        magician_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220217
hexagon              randconfig-r041-20220217
riscv                randconfig-r042-20220217

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
