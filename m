Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032DCC433F5
	for <ath10k@archiver.kernel.org>; Wed,  2 Feb 2022 02:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vnMi2m5YMRI4QEMKHz/BO6LAdm0ua8D/ZDQMoC61t9w=; b=vnCyPhiWVk9xX8
	BvH8cK6e4quXDV9ImR2vl98+9Jqzzww7rzlwAA3dg3muw02nV+i22Jpy2owsqiRzfX07Va9Okdjy0
	jrnX1k+UPwC5m8uzEZflNfn1iio1oq0nHnVf/omlCmh+ZnbBhZxTe/VAw6eLNPu4qQKd6fa8sCFwx
	Wq9a3wU26ds2w1YHowXxLhAoVphQcUxEgmwJDKNKYBBuQ3UawFpU4re7XRMCcSQLpWI/AJouiIcp6
	GlYKf7r37/XU/esNQkhj3Akro5nIiDc5yxglOOSijwh6Uo44egKP9jSyBAiJOdtCKUNUQ1kzlBbOJ
	CQncRhVgR5CWYBpBOTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF5nv-00E2VJ-Ls; Wed, 02 Feb 2022 02:55:31 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF5ns-00E2TF-5i
 for ath10k@lists.infradead.org; Wed, 02 Feb 2022 02:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643770528; x=1675306528;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NM6rg37gQKDyqAyElLmnveOd/KdEbabcPLJWjaLYPSk=;
 b=dOoizkFTjuAcZ3KBBOH+Xp0kfEmZ9dFGRslgBVnGYB+bMPgTCJmgfwsE
 zD+Xq2xfGXPUR0Cuui3ZzW0QwmoMs5ZwSNfKp7Qh+/O3uVt7BUG/74Gk0
 3fjt0JormNIR9GmSOA9ytSBmd3jNhNC3QhBTlMU9qOZRZ/HcoqGDOrkgN
 TRCnHlbWxXZvD5jl8JedWaoKWWkbUtuSwSi0QSogNwG0SKSAOSjRmkLMQ
 n0UhJSjTAcpPzgtDP6fg+o+6nSQ5TqnbfIoOxv9ap7vaz5b2wEpMP6J4G
 v55tA+7fkf5fE+TtPpixydiG/sLho1X9KC2otKZgnBasVI6vUUc8qsaAJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="228495130"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="228495130"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 18:55:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="523294778"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 01 Feb 2022 18:55:26 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nF5np-000U2s-LF; Wed, 02 Feb 2022 02:55:25 +0000
Date: Wed, 02 Feb 2022 10:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 7c258213a143039ee43120884190cc8804445107
Message-ID: <61f9f28d.12cR6lPCaLnJq2vW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_185528_277538_4992093A 
X-CRM114-Status: UNSURE (   4.86  )
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
branch HEAD: 7c258213a143039ee43120884190cc8804445107  Merge branch 'pending' into master-pending

elapsed time: 729m

configs tested: 148
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220131
powerpc              randconfig-c003-20220131
i386                          randconfig-c001
arc                              alldefconfig
powerpc                    amigaone_defconfig
powerpc                      ppc6xx_defconfig
arc                     nsimosci_hs_defconfig
arm                        trizeps4_defconfig
arm                        mvebu_v7_defconfig
xtensa                    xip_kc705_defconfig
mips                        jmr3927_defconfig
sh                           se7721_defconfig
sh                        apsh4ad0a_defconfig
sh                        dreamcast_defconfig
arm                      jornada720_defconfig
arm                           h3600_defconfig
openrisc                 simple_smp_defconfig
sh                           se7705_defconfig
sh                                  defconfig
mips                        vocore2_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                      gensparse_defconfig
riscv                    nommu_k210_defconfig
arm                           corgi_defconfig
arm                         s3c6400_defconfig
sparc64                             defconfig
mips                         db1xxx_defconfig
m68k                           sun3_defconfig
powerpc                  iss476-smp_defconfig
mips                         mpc30x_defconfig
m68k                             allmodconfig
sh                          rsk7203_defconfig
sh                        edosk7760_defconfig
powerpc                     stx_gp3_defconfig
sh                         ecovec24_defconfig
mips                         rt305x_defconfig
powerpc                      pasemi_defconfig
powerpc                     taishan_defconfig
xtensa                              defconfig
h8300                     edosk2674_defconfig
arm                         axm55xx_defconfig
sh                             espt_defconfig
s390                       zfcpdump_defconfig
m68k                       m5475evb_defconfig
sh                          sdk7786_defconfig
arm                        oxnas_v6_defconfig
m68k                       m5208evb_defconfig
arc                           tb10x_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8541_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220201
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
arc                  randconfig-r043-20220131
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                          collie_defconfig
arm                       mainstone_defconfig
powerpc                   microwatt_defconfig
arm                     davinci_all_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      maltaaprp_defconfig
arm                        multi_v5_defconfig
mips                          ath25_defconfig
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220130
hexagon              randconfig-r041-20220131
s390                 randconfig-r044-20220131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
