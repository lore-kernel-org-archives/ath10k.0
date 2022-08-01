Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AB6C00144
	for <ath10k@archiver.kernel.org>; Mon,  1 Aug 2022 23:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3YaScnDRu3/MFaXwCjfrp/S7JvX48LMLb042UpTU668=; b=aj0/BT5EJZP/Yv
	/ay0Mymi5yEpqhubvdrc6uMJC+pkTgcmClfWBzCqAClyakOQ56pOqK4cdthr5YUr8WdyqWumZJe9D
	CvI852RgS8Ux++dfHPI8UOJM/weAXb8KFFNoxZs8o8dYYK7F0MawQxVGaDWDMyP61VjE0MySTi3Uw
	1ZZOpPsPlxn+TkG2rB67bWnVyRoHAKNE2RbLL9Xh4NTyahk+GqCWZF8TALMjfwvWwTVydtF2nYETV
	mPzwXTaPQMebquwMoRof4g1vKWciP58CXvFNSQs3b0B5GAQIVD87KaCCv2eOoZOG58/U9nEyNtI7G
	IsFo3rAphNtKbTdjDp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIf1x-00D4OX-Q8; Mon, 01 Aug 2022 23:41:01 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIf1u-00D4IW-RI
	for ath10k@lists.infradead.org; Mon, 01 Aug 2022 23:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659397258; x=1690933258;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ce+PW+lHUHnu6rEatPXoFdHwbppV7RJ9in1F0MNT1xA=;
  b=SwxJnF22Spt/AwP3dWpvv4AeSGwzEWTd5yedgu46aJDY2p4atHFGQ1ZQ
   nK6FNT3Y1U43jhB51ICGZjCNrxFsDQBX8Z+BSTBvUKzmSrXrud63ZtnJr
   eEsAshnnjce7gjwN0oU0bxd4fIwXatZBfkgoPVeBN15kRJM9v7bezlo5h
   8PBsNP22rA4TxME/JPFsz3BAWVCWe9tlPgOnGJr9dpaVxtYJNvlRYc/eB
   d+Wy7k06f9iB2tChxg6fxJfq1aANpNpiYfy3F2WOSDFDixmQhznNPK/VV
   1mkaaM5FqnsX3F/9lJhNZ8J1XUQLaosDtL1J/WB3Rx5oA4ACmSHoEwIvH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="315110976"
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="315110976"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 16:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="630461470"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Aug 2022 16:40:56 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIf1r-000FUZ-1C;
	Mon, 01 Aug 2022 23:40:55 +0000
Date: Tue, 02 Aug 2022 07:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS
 a680596fef110a63d01d5b09d7cc44cdd7f6e872
Message-ID: <62e86453.PSC89WXJ6pjM8d5T%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_164058_970240_4EC4DB46 
X-CRM114-Status: UNSURE (   6.16  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: a680596fef110a63d01d5b09d7cc44cdd7f6e872  wifi: ath12k: rename ATH11k_HW_RATECODE_CCK_SHORT_PREAM_MASK

elapsed time: 721m

configs tested: 104
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                  randconfig-r043-20220801
s390                 randconfig-r044-20220801
riscv                randconfig-r042-20220801
x86_64                              defconfig
m68k                             allmodconfig
arc                              allyesconfig
arm                                 defconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                           allyesconfig
sh                               allmodconfig
mips                             allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig
arm                              allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
i386                 randconfig-a012-20220801
i386                 randconfig-a013-20220801
i386                 randconfig-a011-20220801
i386                 randconfig-a015-20220801
i386                 randconfig-a014-20220801
i386                 randconfig-a016-20220801
x86_64               randconfig-a011-20220801
x86_64               randconfig-a012-20220801
x86_64               randconfig-a013-20220801
x86_64               randconfig-a015-20220801
x86_64               randconfig-a014-20220801
x86_64               randconfig-a016-20220801
mips                     loongson1b_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
xtensa                           alldefconfig
sh                          rsk7203_defconfig
nios2                         10m50_defconfig
sh                      rts7751r2d1_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
i386                 randconfig-c001-20220801
m68k                          amiga_defconfig
powerpc                     tqm8555_defconfig
sh                          urquell_defconfig
loongarch                        alldefconfig
loongarch                 loongson3_defconfig
powerpc                     taishan_defconfig
sh                        dreamcast_defconfig
arm                         cm_x300_defconfig
mips                    maltaup_xpa_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
x86_64               randconfig-k001-20220801
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                      ep88xc_defconfig
sh                           se7721_defconfig
powerpc                     tqm8541_defconfig
sh                           sh2007_defconfig
powerpc                   motionpro_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
mips                           xway_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                       m5249evb_defconfig
nios2                            allyesconfig
mips                            ar7_defconfig
arm                            mps2_defconfig
sh                           se7780_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
arm                           viper_defconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig

clang tested configs:
hexagon              randconfig-r045-20220801
hexagon              randconfig-r041-20220801
i386                 randconfig-a001-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a003-20220801
i386                 randconfig-a004-20220801
i386                 randconfig-a006-20220801
x86_64               randconfig-a002-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a003-20220801
x86_64               randconfig-a004-20220801
x86_64               randconfig-a005-20220801
x86_64               randconfig-a006-20220801
i386                 randconfig-a005-20220801
mips                  cavium_octeon_defconfig
powerpc                 mpc836x_mds_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
