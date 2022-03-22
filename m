Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2E2C433F5
	for <ath10k@archiver.kernel.org>; Tue, 22 Mar 2022 03:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/wecFRRw2PZN0QIFErmf4Ap1usvAfoQI3jBnMowTU9Y=; b=l9HKNLgC8kGfuH
	UGOJ33EDon7NgwDF1oPBYhCaEEdPypT9iKVjRXMp0Z9Be7gTgrEzIYoVhOIwJwmrhyxD5MFm5LnGY
	/apyf+rIGoUDotIS+U/xiyeAzIYBJySvCabtHSPE55YK7DGbIM/08kcBblakgePigt0d/NWFShcj0
	4pLrYpFgYAQYcQPxMrGxHH+moa3JEQApqgforCphWKt0cz2vP0Y2+W7NEgqsMA/EdUz7nSgVMeQR0
	Nh2xUlaKdBBvQE547wf8TVipzJjzdjIfMXdeh4ePD4DdacaeigORAd7ASP35CBVN+Xr48sL5ZnRrS
	zKaavXNiokriWB2bRO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWVLN-009tWi-ID; Tue, 22 Mar 2022 03:38:01 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWVLI-009tVx-0Q
 for ath10k@lists.infradead.org; Tue, 22 Mar 2022 03:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647920275; x=1679456275;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HH6UeJ6ZnU2KL8QHulvpoBv4ixKZ5jmzT36S2Cue9kg=;
 b=P6K/qwKgXDUxI4t8w3n/EpqyKRgFKG6EmshwsVVwgwvgSf+d+b8gJRyP
 yLuT8833x081UDRLbalCXYGxZ1RGGkijMC9cufFQCPFGouJ7BD9ELhPoJ
 SiqzusPK0Fb8zTgWAGDmBVcWrhNssrDR9IJRAe8XMuOlbXqKU5gTpWrU2
 2c61v7LZ4jSgUIZ+T9CTvAHNyEb2sa3B6lTy4P5x3YZz4toPOoJKP3xCY
 lwwTB1wvmpWIx9xve3g6Q6mpSj6XecKSA6QPFZaqR0Gx7lBo5H4OhltTj
 qSsMiqNzz5BkcBf9b5ayWmfSr3lTbucaqBQowBnuVK2wGZBZu7GcjTAnu A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="344142317"
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="344142317"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 20:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,200,1643702400"; d="scan'208";a="518704757"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 21 Mar 2022 20:37:44 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nWVL5-000IR2-BI; Tue, 22 Mar 2022 03:37:43 +0000
Date: Tue, 22 Mar 2022 11:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 8f0cd86375ee446a66f0ba379ebc7c3a47d5a10e
Message-ID: <62394474.TNu1CBzb6NVkinMm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_203756_099404_9889D959 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: 8f0cd86375ee446a66f0ba379ebc7c3a47d5a10e  ath11k: Add peer rhash table support

elapsed time: 761m

configs tested: 114
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
mips                 randconfig-c004-20220320
m68k                          hp300_defconfig
m68k                        m5272c3_defconfig
sh                           se7721_defconfig
sh                        edosk7705_defconfig
powerpc                 canyonlands_defconfig
powerpc                 mpc834x_itx_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     sequoia_defconfig
openrisc                  or1klitex_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                        sh7757lcr_defconfig
powerpc64                           defconfig
powerpc                       holly_defconfig
powerpc                      pasemi_defconfig
arm                  randconfig-c002-20220320
arm                  randconfig-c002-20220321
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allmodconfig
mips                             allyesconfig
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
i386                 randconfig-a015-20220321
i386                 randconfig-a011-20220321
i386                 randconfig-a012-20220321
i386                 randconfig-a016-20220321
arc                  randconfig-r043-20220320
riscv                randconfig-r042-20220321
s390                 randconfig-r044-20220321
arc                  randconfig-r043-20220321
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
powerpc                   microwatt_defconfig
arm                         palmz72_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        neponset_defconfig
hexagon                             defconfig
arm                      tct_hammer_defconfig
x86_64               randconfig-a002-20220321
x86_64               randconfig-a003-20220321
x86_64               randconfig-a001-20220321
x86_64               randconfig-a004-20220321
x86_64               randconfig-a006-20220321
x86_64               randconfig-a005-20220321
i386                 randconfig-a003-20220321
i386                 randconfig-a004-20220321
i386                 randconfig-a005-20220321
i386                 randconfig-a001-20220321
i386                 randconfig-a006-20220321
i386                 randconfig-a002-20220321
hexagon              randconfig-r041-20220321
hexagon              randconfig-r045-20220321
hexagon              randconfig-r045-20220320
hexagon              randconfig-r041-20220320
s390                 randconfig-r044-20220320
riscv                randconfig-r042-20220320

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
