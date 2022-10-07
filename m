Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F0FC433FE
	for <ath10k@archiver.kernel.org>; Fri,  7 Oct 2022 07:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BKhYZ9Utp/aPCyH04kZzkYoOVBB1kZYivLpHYO9djpk=; b=CYUdUpAOkzleUY
	weexXhec8m8/dfi8YOVLQZl0w0WDz97XGFEVc3OtWgwpcDMi+s+KeDGFObrQrh23WOcJJAC59q8eh
	9VerX4JJrnLqQ1R2MJIbBB3TDqNcfBGCr9Yog829QG/pNE84gf67RYbFHrGfVevgSGtcIxkI5XrWW
	q6q6P39KwROrd/Tm7sbpBGgJpcys6EedTN1Gt6hBkPzcDyAihOw1dQL76RdmpDOv3rrGngrmFonA7
	zyKx/RuEnivX21a5QVk+orKQ6Yf8jJvDo5K41YjACRdqy4OjYBy6SaxAJYCjtbcXPuImhXsO7FDb9
	B5hoBEYi2guCVri3mTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghMD-007m9j-PA; Fri, 07 Oct 2022 07:01:17 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oghMA-007m8P-T0
	for ath10k@lists.infradead.org; Fri, 07 Oct 2022 07:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665126074; x=1696662074;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RCPS6pfo98gMfSTql1afyvHrxNmu1T9iS3xomOOgvSo=;
  b=EIoLpqp85p0KzGqWGBvnhJBwYHBFnHY27z89wlA1eDEkrd3OVVkh6Y6y
   JhHKmM93Uy9oO4lSQZrKJwa9GVMRhSBpOe0NzsnR85PRz82W1iihM0Kdp
   xkKOzqoGa5fVhLdd4Y9ExdxpqQstBbqrDgt0tWJxtYkfi+wm8/b/ndyoA
   upLOkaF+T7mt0ua/JyH0Yu3XTzA2g9N26qH4HIK2sqhgqymGvdIsIIy5b
   +eJvAOsYL7iBny5Gp5JJJjlGhhb2zOwB2OUtW38JEX7yHc78MWOBCeaGB
   7OTdzT0Y2jI+RhdqE47NntrGeuIXWq0cVHgdNsZRwfNBF9ilKJiTj+yTF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="301265578"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="301265578"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2022 00:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="576124774"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="576124774"
Received: from lkp-server01.sh.intel.com (HELO 3c15167049b7) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Oct 2022 00:01:12 -0700
Received: from kbuild by 3c15167049b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oghM7-0000sF-17;
	Fri, 07 Oct 2022 07:01:11 +0000
Date: Fri, 07 Oct 2022 15:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 c5bec638aa3e88ae1e9a90bc8bfdedbc82beb1fe
Message-ID: <633fceb5.exISXBKIFLkIbsti%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_000115_038535_7C79F92B 
X-CRM114-Status: UNSURE (   6.63  )
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
branch HEAD: c5bec638aa3e88ae1e9a90bc8bfdedbc82beb1fe  wifi: ath9k: Make arrays prof_prio and channelmap static const

elapsed time: 722m

configs tested: 120
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
arm                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64               randconfig-a011-20221003
x86_64               randconfig-a012-20221003
m68k                             allyesconfig
x86_64               randconfig-a013-20221003
x86_64               randconfig-a015-20221003
x86_64               randconfig-a014-20221003
s390                                defconfig
x86_64                           allyesconfig
x86_64               randconfig-a016-20221003
s390                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
m68k                             allmodconfig
powerpc                          allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
mips                             allyesconfig
i386                 randconfig-a011-20221003
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
arm64                            allyesconfig
sh                               allmodconfig
arm                              allyesconfig
s390                             allyesconfig
i386                 randconfig-a012-20221003
i386                 randconfig-a013-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a016-20221003
i386                 randconfig-a014-20221003
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                         s3c6400_defconfig
mips                     loongson1b_defconfig
powerpc                     asp8347_defconfig
powerpc                  iss476-smp_defconfig
sparc                            alldefconfig
m68k                        stmark2_defconfig
m68k                          hp300_defconfig
arm                        keystone_defconfig
sh                           se7751_defconfig
sh                         ap325rxa_defconfig
powerpc                      tqm8xx_defconfig
powerpc                  storcenter_defconfig
powerpc                     mpc83xx_defconfig
mips                  maltasmvp_eva_defconfig
i386                          randconfig-c001
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
ia64                             allmodconfig
mips                        bcm47xx_defconfig
sparc64                             defconfig
mips                      loongson3_defconfig
microblaze                          defconfig
arm64                            alldefconfig
openrisc                    or1ksim_defconfig
powerpc                        warp_defconfig
powerpc                      makalu_defconfig
csky                             alldefconfig
arc                      axs103_smp_defconfig
mips                            gpr_defconfig
powerpc                       eiger_defconfig
powerpc                     tqm8555_defconfig
sh                           se7619_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
xtensa                         virt_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                    adder875_defconfig
powerpc                      pcm030_defconfig
riscv                            allmodconfig
mips                       bmips_be_defconfig
sh                              ul2_defconfig
arc                          axs101_defconfig
xtensa                              defconfig
openrisc                 simple_smp_defconfig

clang tested configs:
i386                 randconfig-a004-20221003
i386                 randconfig-a003-20221003
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a005-20221003
x86_64               randconfig-a005-20221003
i386                 randconfig-a006-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a006-20221003
hexagon              randconfig-r041-20221003
hexagon              randconfig-r045-20221003
powerpc                 xes_mpc85xx_defconfig
riscv                randconfig-r042-20221006
hexagon              randconfig-r041-20221006
s390                 randconfig-r044-20221006
hexagon              randconfig-r045-20221006
x86_64                        randconfig-k001
powerpc                   microwatt_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      obs600_defconfig
arm                       cns3420vb_defconfig
arm                          collie_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
