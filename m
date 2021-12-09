Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE95EC433EF
	for <ath10k@archiver.kernel.org>; Thu,  9 Dec 2021 07:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6QmHnszAHxs/6+WHkBBAdAKoJWtU0+uZYuIHu0bpVNA=; b=hiGywns1kZKfWw
	OWdUYcs0S9RgwIjzLYF8EPkvK77sCrZtKC0yPRc1b4jj9eGSirv6QYy9WlwFhm02qoEhH8kNB2VVB
	uIdF5R94ihdUaWHqMGphJM3bk+2RPecBnd2wQefmBK4PJf/fIYvahiNf0Yhv5E5M6zN7Sa8YlbqYk
	f4j067mMiLX//W53ONRXHzuXduhBhda8m3ItF09CB+calNXIAIHn/nt/fRAAQD0gXli1BtgoYBMM7
	/1Jg+RT6rzZtmj1O0AoDtK32fsyuuTO/BMN/Xsq0VrKZxTNZ2je+mNsdn8Zhivc38AjSKZSG3ja4J
	MSOtlGcELcYvRAPV0jJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvDtd-00F9gE-3k; Thu, 09 Dec 2021 07:31:17 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvDtZ-00F9fp-R4
 for ath10k@lists.infradead.org; Thu, 09 Dec 2021 07:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639035073; x=1670571073;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=wQksYJXeTdnUffbomBWB7HDJeaW4Sp0GmXAQoWTJtd8=;
 b=UJx3Z9xBrnThSVxc/M2QIYh/S7kRG9/mVX5HpFIXztDvhJ3T5bCfqxo3
 RH4KaQD5yWSZpDtbpw76x2plnFIJafPXnObK+FOwsFKb81960UTG2Fnuc
 7Q9pvniSlxpg/dD9Tvlchm4PdXVQmd5gsXv2TL/35NvxbrUWgAXEqACMG
 OrR/5yVP+bu+vhiK8XiZD0Z11pGtF4r7JxBBoxLFpWfl9l9wqALIzVVDP
 iIfL5d5hb3Qh4JBW5r3Or3NZ94bWzqn7MlaJref/IbSqHgWcazmPTJVYw
 3WFqLyJxmbAwNBXSXk62lV3+Vw1c96ZkgZNcucb/nYVVGKAj5PS1hCU6X A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="225299449"
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; d="scan'208";a="225299449"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 23:31:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; d="scan'208";a="612404459"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 08 Dec 2021 23:31:11 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mvDtX-0001d1-06; Thu, 09 Dec 2021 07:31:11 +0000
Date: Thu, 09 Dec 2021 15:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 d752d9fe52bd6ae30b61b001c85becfe4882e5a0
Message-ID: <61b1b0a9.2Y3I71WLlfQbttU0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_233114_171666_694ACE56 
X-CRM114-Status: UNSURE (   5.65  )
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
branch HEAD: d752d9fe52bd6ae30b61b001c85becfe4882e5a0  Merge branch 'ath-next' into ath-qca

elapsed time: 1282m

configs tested: 113
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20211207
sh                           se7750_defconfig
arm                        shmobile_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                           xway_defconfig
mips                        jmr3927_defconfig
sh                        edosk7760_defconfig
sh                        sh7763rdp_defconfig
csky                             alldefconfig
arc                        nsim_700_defconfig
arm                         axm55xx_defconfig
sh                                  defconfig
nios2                         3c120_defconfig
powerpc                      walnut_defconfig
sh                            hp6xx_defconfig
arm                           sunxi_defconfig
mips                         tb0219_defconfig
mips                     loongson1c_defconfig
arm                        magician_defconfig
powerpc                     tqm8540_defconfig
sparc64                          alldefconfig
arm                         hackkit_defconfig
mips                           rs90_defconfig
powerpc                      acadia_defconfig
arm                          badge4_defconfig
mips                       lemote2f_defconfig
powerpc                  iss476-smp_defconfig
arm                  randconfig-c002-20211207
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
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a006-20211207
x86_64               randconfig-a005-20211207
x86_64               randconfig-a001-20211207
x86_64               randconfig-a002-20211207
x86_64               randconfig-a004-20211207
x86_64               randconfig-a003-20211207
i386                 randconfig-a001-20211207
i386                 randconfig-a002-20211207
i386                 randconfig-a003-20211207
i386                 randconfig-a004-20211207
i386                 randconfig-a006-20211207
i386                 randconfig-a005-20211207
arc                  randconfig-r043-20211207
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func

clang tested configs:
x86_64               randconfig-a011-20211207
x86_64               randconfig-a013-20211207
x86_64               randconfig-a014-20211207
x86_64               randconfig-a012-20211207
x86_64               randconfig-a016-20211207
x86_64               randconfig-a015-20211207
i386                 randconfig-a013-20211207
i386                 randconfig-a011-20211207
i386                 randconfig-a012-20211207
i386                 randconfig-a015-20211207
i386                 randconfig-a016-20211207
i386                 randconfig-a014-20211207
hexagon              randconfig-r045-20211208
hexagon              randconfig-r041-20211208
hexagon              randconfig-r045-20211207
s390                 randconfig-r044-20211207
riscv                randconfig-r042-20211207
hexagon              randconfig-r041-20211207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
