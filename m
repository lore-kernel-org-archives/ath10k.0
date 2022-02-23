Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFB5C433F5
	for <ath10k@archiver.kernel.org>; Wed, 23 Feb 2022 04:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=shd0cxXjkg2nyDh8KrC1W+NpLww2eGcBsAmSXQvWshg=; b=SxzOZ/+oV5w5AC
	/7tlLh0H5gKY2+yF1GQs5jHWSjX3MBFINUG9Z3BFeVtPa7J1T6YPs0P/ZG1siuHpc3vlTGUB8V01p
	XJtQpyzIZje2jh9QsWTxRLje+NEUMVJJwBlfYEbKuL0FPB+uhLB9eSJPCU77Nh1kIr6zC4hC5BygO
	taBcCP4ZjXPvmhuWVX2n1tFkmsEJwDKl3W1UX0hSNP+11a+DJime14IyQQXx2JuVr8I0XkdwBQzjg
	tMjJDZbU9OHAv3ZUwMs9XIzjNCm/OopvsnB0FrSnPMjZNsxeQEhPpUrdlfpl44Hy+hz7sSj4xI2re
	+CkAPvcB9z8/k5gyfXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMizs-00ClBn-1p; Wed, 23 Feb 2022 04:11:24 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMizl-00Cl8W-Lu
 for ath10k@lists.infradead.org; Wed, 23 Feb 2022 04:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645589477; x=1677125477;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=oWUCFbvyRZf7PZFplqPUAMQoXoX6ukaKI8NCFXG6Yts=;
 b=KbzarYezJ7fQxfoUKngakWUNDMs/wp2CsHrf0lbYULzevlv0VWf86T32
 Va8G70p7CT61ix3+htMkhfYGDson6RtZV/t5knD42Wlb4E3RSDf0EdfSN
 6rfcuzFGuYFLSyCkR6Ea2ejXUFDLPQrj6JQojKf81qyJ/u4xco9Z6FO1L
 Vcc9FR0bduRYYWqXHn6ZIJanJA9dBlg70hggBLtnjwI+f7inrGF6EDAeG
 aRJo9dZZtGl7k7Elf/roH0qbNO5XF8SqdY/1Uav/8FEsFPJkOEGimj7qT
 3U3XacnuM3BVNvqnmKf/9OsjpJRiWMyTrp9J8momsnfnPTkxgeSeUldEF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="251616054"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="251616054"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 20:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="508272244"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 22 Feb 2022 20:11:14 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMizh-0000xI-TE; Wed, 23 Feb 2022 04:11:13 +0000
Date: Wed, 23 Feb 2022 12:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 9904ebcc849ccd87f346d5241a8ec44ff0c38672
Message-ID: <6215b3a7./Xes0pvkY9ZT7ITG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_201117_962626_F77C3F03 
X-CRM114-Status: UNSURE (   5.00  )
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
branch HEAD: 9904ebcc849ccd87f346d5241a8ec44ff0c38672  Merge branch 'pending' into master-pending

elapsed time: 806m

configs tested: 132
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
sh                             espt_defconfig
mips                            ar7_defconfig
sh                   sh7770_generic_defconfig
m68k                            q40_defconfig
mips                      loongson3_defconfig
powerpc                 linkstation_defconfig
powerpc                     pq2fads_defconfig
ia64                         bigsur_defconfig
h8300                    h8300h-sim_defconfig
powerpc                         ps3_defconfig
m68k                        m5307c3_defconfig
mips                         db1xxx_defconfig
sparc                               defconfig
arm                          pxa910_defconfig
arm                          gemini_defconfig
arm                       imx_v6_v7_defconfig
powerpc                       ppc64_defconfig
ia64                            zx1_defconfig
arm                        multi_v7_defconfig
arc                     haps_hs_smp_defconfig
arm                           stm32_defconfig
um                                  defconfig
arm                           sunxi_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      makalu_defconfig
powerpc                     redwood_defconfig
x86_64                           alldefconfig
arm                        shmobile_defconfig
m68k                       bvme6000_defconfig
powerpc                   currituck_defconfig
mips                           ci20_defconfig
arm                  randconfig-c002-20220221
arm                  randconfig-c002-20220222
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
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a003-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a004-20220221
x86_64               randconfig-a005-20220221
i386                 randconfig-a002-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a004-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a006-20220221
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220221
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
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                          imote2_defconfig
mips                          ath79_defconfig
mips                       lemote2f_defconfig
mips                      bmips_stb_defconfig
arm                                 defconfig
powerpc                     tqm8560_defconfig
arm                          moxart_defconfig
arm                       cns3420vb_defconfig
arm                         shannon_defconfig
hexagon                             defconfig
arm                        multi_v5_defconfig
mips                        omega2p_defconfig
mips                      pic32mzda_defconfig
mips                      malta_kvm_defconfig
x86_64               randconfig-a011-20220221
x86_64               randconfig-a015-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221
s390                 randconfig-r044-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
