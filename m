Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73C0C4332F
	for <ath10k@archiver.kernel.org>; Sat,  8 Oct 2022 01:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ierMEMGBN4/ZmzuBCx26Lpg8elwi5NSWn8wWfdLZnLs=; b=ocyotAO/iVRoGj
	CjSNR8RuEh3MvwBcc+EP1F+Qhyswu5K4dzAjvUTMPKqO6lFyMq+LV2BLjCzXrU5CtbnkJqX4PZtDl
	Rn3hqeJWJLwGpNx5fSt6YFF1v2TKZb8t8RT56wvCjCiNAD/5XisM8ja3UYSCPu+CZGfHF8QSYp2Vf
	980c/G3GnmosObR8sqYA9CTBDW7WjN6TvLx+UUgCSUrS76OkZEafkHp5E6hMzi3t298etrHpPUKiS
	XD3xZ2iJUf1A7TQBQAp52P28vQ7w37N99DpNEprGX5hL1vF1BZn1aAZ+NIq/uRWRpDgAZi7yow9Tl
	Dyc3i7s3pqtCz08Ug5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogymK-00BIT6-6C; Sat, 08 Oct 2022 01:37:24 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogymG-00BISW-MU
	for ath10k@lists.infradead.org; Sat, 08 Oct 2022 01:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665193040; x=1696729040;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vQQeJ6N1r8BijDUVLecPQ9Un4YxPDnQ6Z3+zW6/axkE=;
  b=cCj87FN5ucuMPXPV6uF81DsrnOOxkrD/8OqvQMIH9FWn4KnkSxknEXjP
   WE7gYJi+nGObab7jaPeG+CMJ1KJYU2vwULF4ElocVsMYy7a5j/22ln+6t
   qb3FAPF+BFa1SIb6X7vM+5+d3ZVmDSj1eL6VTZDzHs5vMj1dq6AhEBAku
   G/z3Pb++gv57a+/HH2CzqiCmTS/7h15KKBgh0rVgG6rYmyQ0slf8a0/U4
   e9LOHiirqwN/xAKlEilYm/EcbBJ6foJm02fpiX5t5LUsVnMr7cGnhi1tV
   kAG75BpPnMrf+3rxSAT5Hj4rC7tyH6rTWcanF9sYCxZTzRYOqERf+DPs4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="365825865"
X-IronPort-AV: E=Sophos;i="5.95,168,1661842800"; 
   d="scan'208";a="365825865"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2022 18:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="954270750"
X-IronPort-AV: E=Sophos;i="5.95,168,1661842800"; 
   d="scan'208";a="954270750"
Received: from lkp-server01.sh.intel.com (HELO 3c15167049b7) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Oct 2022 18:37:18 -0700
Received: from kbuild by 3c15167049b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ogymD-0001j5-2C;
	Sat, 08 Oct 2022 01:37:17 +0000
Date: Sat, 08 Oct 2022 09:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 aba162f65e91634ebb4cf7ea42b2aa6ff1c33a2a
Message-ID: <6340d448.NGQtYirR1tsIFvFV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_183720_847867_67632FB2 
X-CRM114-Status: UNSURE (   4.35  )
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
branch HEAD: aba162f65e91634ebb4cf7ea42b2aa6ff1c33a2a  Merge branch 'pending' into master-pending

elapsed time: 727m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
alpha                               defconfig
s390                                defconfig
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
s390                             allyesconfig
alpha                            allyesconfig
mips                             allyesconfig
arm                                 defconfig
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
arc                               allnoconfig
arm64                            allyesconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
riscv                randconfig-r042-20221007
arm                              allyesconfig
arc                  randconfig-r043-20221007
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm                        clps711x_defconfig
arm                      integrator_defconfig
powerpc                     sequoia_defconfig
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221007
s390                 randconfig-r044-20221003
ia64                             allmodconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a016-20221003
i386                 randconfig-a012-20221003
i386                 randconfig-a014-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a013-20221003
x86_64               randconfig-a011-20221003
x86_64               randconfig-a016-20221003
x86_64               randconfig-a014-20221003
x86_64               randconfig-a013-20221003
x86_64               randconfig-a012-20221003
x86_64               randconfig-a015-20221003
i386                          randconfig-c001
powerpc                     ep8248e_defconfig
sh                  sh7785lcr_32bit_defconfig
sparc64                          alldefconfig
sh                        dreamcast_defconfig
s390                          debug_defconfig
powerpc                     asp8347_defconfig
nios2                            alldefconfig
um                               alldefconfig
sh                          kfr2r09_defconfig
sh                           se7751_defconfig
mips                         db1xxx_defconfig
arm                       imx_v6_v7_defconfig
powerpc                         wii_defconfig
powerpc                     taishan_defconfig
sh                          landisk_defconfig
powerpc                    klondike_defconfig
arm                        oxnas_v6_defconfig
powerpc                        warp_defconfig
arm                           viper_defconfig
arm                  randconfig-c002-20221002
x86_64                        randconfig-c001
arm                        realview_defconfig
sh                          polaris_defconfig
sh                     magicpanelr2_defconfig
powerpc                       maple_defconfig
arm                           sunxi_defconfig
sparc                       sparc64_defconfig
parisc                generic-64bit_defconfig
arm                             ezx_defconfig
m68k                          multi_defconfig
riscv                randconfig-r042-20221005
arc                  randconfig-r043-20221005
s390                 randconfig-r044-20221005
arc                        nsim_700_defconfig
powerpc                    sam440ep_defconfig
sh                          rsk7269_defconfig
parisc                           alldefconfig
sh                        sh7757lcr_defconfig
arm                           imxrt_defconfig
arm                            zeus_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
mips                 randconfig-c004-20221002
arm                             pxa_defconfig
arc                        vdk_hs38_defconfig
powerpc                     redwood_defconfig
nios2                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3

clang tested configs:
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
hexagon              randconfig-r041-20221003
x86_64               randconfig-a006-20221003
riscv                randconfig-r042-20221002
x86_64               randconfig-a003-20221003
x86_64               randconfig-a005-20221003
hexagon              randconfig-r041-20221002
s390                 randconfig-r044-20221002
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221007
hexagon              randconfig-r041-20221007
hexagon              randconfig-r045-20221003
powerpc                        fsp2_defconfig
powerpc                     tqm8560_defconfig
arm                          pxa168_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                 mpc832x_mds_defconfig
i386                 randconfig-a001-20221003
i386                 randconfig-a006-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a004-20221003
mips                          ath25_defconfig
arm                        mvebu_v5_defconfig
s390                             alldefconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
