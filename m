Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AE1C433EF
	for <ath10k@archiver.kernel.org>; Tue, 31 May 2022 03:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LvXtXE3mwHcJyHvo2vrnWg5Nl9k3H7fJlihpQ1jHNxo=; b=BiKjRSxpYqZ9IF
	TAhwBMZVp0GetSaLKz+5OAI5IVEwAEcq3NaGudi36jvoGSVONIRV7jI2j3LZdEVfvcMWx3smmxF/2
	EMlRnx98VBFLsSQCKTCaJKN6e80YnWdyA1opWCOBzurqDMoPY0pjd5lVbr9coBTHj/biuvxn2cEYZ
	IA+EAUaYqZwyXqixqv324c/62nucev7RomBUu8bdkmPB7B1Xrv11Ayqa4XvhYQlel1O/Y+1kFP49/
	nq4V4z2/sZR9sgWEshFrfmnxJKR+hwz/FzzI3llwovhAWBnNEbG4c7fCNNl/5sWmh/b5TAIng+xL9
	6aumZxG0kH7ZT6RtCWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvsQI-00941T-6b; Tue, 31 May 2022 03:19:58 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvsQF-00940p-Kj
	for ath10k@lists.infradead.org; Tue, 31 May 2022 03:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653967195; x=1685503195;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iqNLW6Q/GIxLG+G1nTFTKfFKtcFPIXGneAQG6cvyDkg=;
  b=QjDFqCB3xFMog5bVqTgZuVgqWxOrWZizuQoaFB0vsOCW5y5aAv5fhoiJ
   jLVvZ6i4AUnzkukrK0EhHa35Q0jJp/chhZgC9KXHkMfcPyDE30BTfyjkx
   9Pc5cgvnhef2BAYdtf6mEF2Binl9G903rrm8jEbXimcR6yW7lVpvOhh7g
   7qhQLjyMoS2EBclMuHv0a69i04xlLQn4Musrzm57ghCDQx+UgtaS25qUn
   rzFp9eaSSmIO+MqdVYJzIFxTqrbBjgYb/TqtXTZrbw/ovvDK0eYfDQB+f
   +Crgez1ob5jwoxTyp0WUaGNqFkfrIfZWgASmJd0Bn1pNQyS0yCUFMxcCh
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="254999225"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="254999225"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 20:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="753803080"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 May 2022 20:19:53 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvsQC-0002GH-Cg;
	Tue, 31 May 2022 03:19:52 +0000
Date: Tue, 31 May 2022 11:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 076804d943e271e7c615a8e3c04ab518553b028a
Message-ID: <6295893a.EBNP+6TnwrWCVBOq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_201955_744360_4BDFAB85 
X-CRM114-Status: UNSURE (   4.82  )
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
branch HEAD: 076804d943e271e7c615a8e3c04ab518553b028a  ath11k: fix missing skb drop on htc_tx_completion error

elapsed time: 926m

configs tested: 106
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allyesconfig
mips                      maltasmvp_defconfig
sh                        apsh4ad0a_defconfig
sh                        sh7757lcr_defconfig
arm                     eseries_pxa_defconfig
sh                            migor_defconfig
arm                           viper_defconfig
sh                           se7751_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220530
x86_64               randconfig-a006-20220530
x86_64               randconfig-a004-20220530
x86_64               randconfig-a001-20220530
x86_64               randconfig-a002-20220530
x86_64               randconfig-a005-20220530
i386                 randconfig-a002-20220530
i386                 randconfig-a003-20220530
i386                 randconfig-a004-20220530
i386                 randconfig-a005-20220530
i386                 randconfig-a001-20220530
i386                 randconfig-a006-20220530
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220530
arc                  randconfig-r043-20220531
s390                 randconfig-r044-20220531
riscv                randconfig-r042-20220531
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func

clang tested configs:
powerpc               mpc834x_itxgp_defconfig
powerpc                    ge_imp3a_defconfig
mips                      pic32mzda_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64               randconfig-a011-20220530
x86_64               randconfig-a013-20220530
x86_64               randconfig-a012-20220530
x86_64               randconfig-a014-20220530
x86_64               randconfig-a015-20220530
x86_64               randconfig-a016-20220530
i386                 randconfig-a012-20220530
i386                 randconfig-a011-20220530
i386                 randconfig-a014-20220530
i386                 randconfig-a016-20220530
i386                 randconfig-a013-20220530
i386                 randconfig-a015-20220530
hexagon              randconfig-r045-20220530
riscv                randconfig-r042-20220530
s390                 randconfig-r044-20220530
hexagon              randconfig-r041-20220530

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
