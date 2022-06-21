Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E544DC43334
	for <ath10k@archiver.kernel.org>; Tue, 21 Jun 2022 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V8iJ6kG4KSPNqvvcaLrTTi3hm2jMGlQkL+hfVpITLz8=; b=r1E54eB/26/x8b
	CpS0qlsfdUZeX46r1rt1DqDR7JWxB4snwdS4a7pCgO7AYEmfHBqGkAgvEkzFbRdrNVe8fwt/q9ITB
	gnwuP19/VC/rpvEfGTHn1zLUpJ33ef/y3mmo7BhyhgxbycWNICd3fKk05MH5Y/PsMKA+Eq9AfvIHz
	kkBh3IpXKjyrCQ53EVTk7cRcEijfLOS11WDuSokkXqc9UlVK4ISysSlh/0xMoKjWYr/3zKrVVsxUa
	G87VgQSM+4VZ6SJCdIVH5Sy8aviGVCjbjn4k2BS8aKh7y30R736n5eWH4pYMcmkYDLfYckCii2gN2
	NPiZfOMqcE0D4dsBy1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jdu-006vJ0-8e; Tue, 21 Jun 2022 19:34:30 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jT1-006pGd-CI
	for ath10k@lists.infradead.org; Tue, 21 Jun 2022 19:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655839395; x=1687375395;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fYkeB7jDRdXKxITDtpB6h7lYILHO3P8fqZ7uqlyuRXI=;
  b=PmZFMzdHe4bJ0vL70qTGdR1JjIQ8YuxhGZMuPNDiILld4Ow3i6q4unaR
   7y3Ut1Or2r+z4z6wO8hEa67r+4roiWoFs+n0lAtEDNGlEhRfeHABIWyhI
   T029MYNhFb0mBBcBCoSHkP5bigujTxDKJsDnt2nCpWtYq7snAP7PaInK4
   WOtLKLacMystKp9MZ8C+lHKg5Z0h3a82UER3vBO8JC+/zSuNK34e/VwJj
   oM8h+Z/eE1eCUI3PfxVRfb39bcm7MljeI73I9Mj0Ffye5pkkXcBRO2Bd+
   ryt2yGDKEolI9eNtfRps2Myhnqy0FO1eTPTMSE/EIXQj06JKQzFDTRzXX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="305663822"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="305663822"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 12:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="591796971"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jun 2022 12:23:11 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3jSw-0000Jt-Fe;
	Tue, 21 Jun 2022 19:23:10 +0000
Date: Wed, 22 Jun 2022 03:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 d7af63abde74b43e7739bad2c68055667b7f53a0
Message-ID: <62b21a76.X6rjdJs6sBUaqcP3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_122315_512681_A55F6BA1 
X-CRM114-Status: UNSURE (   6.17  )
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
branch HEAD: d7af63abde74b43e7739bad2c68055667b7f53a0  wcn36xx: Fix typo in comment

elapsed time: 879m

configs tested: 133
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
mips                 randconfig-c004-20220619
i386                          randconfig-c001
arc                              alldefconfig
mips                         rt305x_defconfig
m68k                          hp300_defconfig
arc                        vdk_hs38_defconfig
sh                          landisk_defconfig
m68k                          sun3x_defconfig
m68k                          multi_defconfig
xtensa                       common_defconfig
arm                       imx_v6_v7_defconfig
um                                  defconfig
sh                               j2_defconfig
powerpc                       ppc64_defconfig
xtensa                  audio_kc705_defconfig
arm                        multi_v7_defconfig
sh                           se7705_defconfig
m68k                       m5249evb_defconfig
arm64                            alldefconfig
mips                           ci20_defconfig
xtensa                  nommu_kc705_defconfig
sh                         apsh4a3a_defconfig
arm                           h3600_defconfig
powerpc                 mpc837x_mds_defconfig
arm                         cm_x300_defconfig
m68k                           virt_defconfig
nios2                         10m50_defconfig
parisc                generic-32bit_defconfig
powerpc                   currituck_defconfig
m68k                            q40_defconfig
arm                           stm32_defconfig
sh                          kfr2r09_defconfig
powerpc                 linkstation_defconfig
mips                            gpr_defconfig
xtensa                         virt_defconfig
um                               alldefconfig
openrisc                            defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a004-20220620
x86_64               randconfig-a006-20220620
x86_64               randconfig-a001-20220620
x86_64               randconfig-a005-20220620
x86_64               randconfig-a002-20220620
x86_64               randconfig-a003-20220620
i386                 randconfig-a005-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a006-20220620
i386                 randconfig-a004-20220620
i386                 randconfig-a003-20220620
i386                 randconfig-a002-20220620
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220619
arc                  randconfig-r043-20220620
arc                  randconfig-r043-20220619
s390                 randconfig-r044-20220619
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm64                            allyesconfig
powerpc                       ebony_defconfig
arm                       aspeed_g4_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      malta_kvm_defconfig
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220620
x86_64               randconfig-a012-20220620
x86_64               randconfig-a016-20220620
x86_64               randconfig-a015-20220620
x86_64               randconfig-a011-20220620
x86_64               randconfig-a014-20220620
i386                 randconfig-a014-20220620
i386                 randconfig-a011-20220620
i386                 randconfig-a012-20220620
i386                 randconfig-a015-20220620
i386                 randconfig-a016-20220620
i386                 randconfig-a013-20220620
hexagon              randconfig-r041-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622
hexagon              randconfig-r041-20220621
hexagon              randconfig-r045-20220621

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
