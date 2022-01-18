Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C22C433F5
	for <ath10k@archiver.kernel.org>; Tue, 18 Jan 2022 03:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TzjPayhYJUK8lqlE7fDVsDH1e05x1BgOx6AJ1OrCPdI=; b=XglKizrjwJMlKN
	4YF47FuETghNu6AkXg0zfV2fHvTar6Ftw9VrEBZcvzSXTtQKdOF84fdwQmYljRl8EIhLrUojZMVlq
	O/6i+/rQzLI06CRz8qebQ9AM0W6kK28xfkyAtn5y5vXSyJ71up8alwgcF/Oq0GxMG1vCwNHM1m3sT
	p827MEpML35+U+aan8L5HZhXdFNkOWe0DJiEZPFGESgrTez3TL0V0FcKwejqp2t0ROeP2rwUb2Yhy
	YMq9l3tL4n5QhQ5EmBlu3Hb/1KA4u49Q/GHMcONRbrSb57x2R3Sr+KZgzobfQXMEhLpi7mbUmPBUF
	sClP92nQamJx3rODzDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9fYi-0002AL-2e; Tue, 18 Jan 2022 03:53:24 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9f6K-00HQfK-4E
 for ath10k@lists.infradead.org; Tue, 18 Jan 2022 03:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642476244; x=1674012244;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=eupWTxI1yXMdXEuhn+7RW7Uho8xFtUClXFbXFgxz4yw=;
 b=fw9zeEyOIa/7rdGGy8zlwwasxk014LfHWyK2Sh17550zu2/vEiASonbi
 sKz0wxO7g/fqAC5pQdvZ0zRFSKJybVpSWwqLowvku8hTdHsUYe7r3xJSL
 UKogKIoiYiFO9L0Dsu35Wf160mkRvTeMnx5U3/Hbc7DL9/apsPiSd109F
 jrptlGEmDBbxWaGelYm9wR/egc/ouiuoaa33lkNG9KUbMByTYnOj149yT
 nR5dJXT68LkkcYmN2iMSl6ni087VGgNRuE+jhjpikt1cFpKtiTYwokGfU
 AT+xk0cnbcI5XEqpxhhQ2zaJnP1KMbT6toxI/1wb+0rUM2qSOHkMDnqBF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="269108178"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="269108178"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 19:24:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; d="scan'208";a="578263372"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jan 2022 19:24:00 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n9f6F-000C6r-D0; Tue, 18 Jan 2022 03:23:59 +0000
Date: Tue, 18 Jan 2022 11:23:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 c6d9ccfbeda0dc3f040b8fa81df2538e008d47be
Message-ID: <61e632be.DPduNRaYPjt58ny6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_192404_364670_56FAF706 
X-CRM114-Status: UNSURE (   6.50  )
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
branch HEAD: c6d9ccfbeda0dc3f040b8fa81df2538e008d47be  Merge branch 'pending' into master-pending

elapsed time: 724m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220118
i386                 randconfig-c001-20220117
powerpc                     redwood_defconfig
arm64                            alldefconfig
arm                      integrator_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm8548_defconfig
arm                        oxnas_v6_defconfig
arm                         lubbock_defconfig
powerpc                 mpc837x_mds_defconfig
mips                 decstation_r4k_defconfig
powerpc                      makalu_defconfig
powerpc                      pasemi_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                        mini2440_defconfig
arc                        nsimosci_defconfig
powerpc                  iss476-smp_defconfig
arm                      jornada720_defconfig
s390                       zfcpdump_defconfig
xtensa                generic_kc705_defconfig
sh                               j2_defconfig
m68k                        m5272c3_defconfig
xtensa                         virt_defconfig
arm                      footbridge_defconfig
m68k                       m5275evb_defconfig
arm                             ezx_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                             allmodconfig
arm                             pxa_defconfig
m68k                       m5208evb_defconfig
arm                        spear6xx_defconfig
arm                  randconfig-c002-20220116
arm                  randconfig-c002-20220117
arm                  randconfig-c002-20220118
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
xtensa                           allyesconfig
h8300                            allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a016-20220117
x86_64               randconfig-a012-20220117
x86_64               randconfig-a013-20220117
x86_64               randconfig-a011-20220117
x86_64               randconfig-a014-20220117
x86_64               randconfig-a015-20220117
i386                 randconfig-a014-20220117
i386                 randconfig-a011-20220117
i386                 randconfig-a013-20220117
i386                 randconfig-a012-20220117
i386                 randconfig-a016-20220117
i386                 randconfig-a015-20220117
riscv                randconfig-r042-20220117
arc                  randconfig-r043-20220116
arc                  randconfig-r043-20220117
s390                 randconfig-r044-20220117
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
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                         hackkit_defconfig
mips                     cu1830-neo_defconfig
mips                       lemote2f_defconfig
mips                        omega2p_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    gamecube_defconfig
powerpc                     pseries_defconfig
x86_64               randconfig-a005-20220117
x86_64               randconfig-a004-20220117
x86_64               randconfig-a001-20220117
x86_64               randconfig-a006-20220117
x86_64               randconfig-a002-20220117
x86_64               randconfig-a003-20220117
i386                 randconfig-a001-20220117
i386                 randconfig-a002-20220117
i386                 randconfig-a003-20220117
i386                 randconfig-a005-20220117
i386                 randconfig-a006-20220117
i386                 randconfig-a004-20220117
riscv                randconfig-r042-20220118
hexagon              randconfig-r045-20220116
hexagon              randconfig-r045-20220117
hexagon              randconfig-r045-20220118
riscv                randconfig-r042-20220116
hexagon              randconfig-r041-20220118
hexagon              randconfig-r041-20220116
hexagon              randconfig-r041-20220117
s390                 randconfig-r044-20220116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
