Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F16C433F5
	for <ath10k@archiver.kernel.org>; Tue, 31 May 2022 00:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iw8RmHZgToLXxzKEU55I9q01JAu7Lzoxc2N5/Wknw8A=; b=UjiyqLTv4ULXIi
	qVXasqvFI8Wh27lTlft9+QlFbYjsOHVl0YCGjQKTvvkCBiuETJJmR0lFGKQTAK/qhbZ8M0GpI5PeI
	ZbR/VOTdVfGKT3Of8kNVr66ik9u1kzt2DKVllsw0zZhk73OHp5JEuXcplPCej9dyBQUjskV74SfvO
	xtixe2yGlFEIvaf2EwJLhBOrtQoDTmKEwfFi5yr6//viXSjfx7UvZhFAE3IAcycR6RIRz+JrbsSrQ
	gEEVDX54x+ibiWejWakzw9z9eUKGL/23/yov8awLgAPONg0DCXY/2+4juqcHjnw92kD/dVONrOpjU
	KptJOs2b4GT8z2eyPNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvpMV-008ehc-J7; Tue, 31 May 2022 00:03:51 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvpMS-008ehI-P2
	for ath10k@lists.infradead.org; Tue, 31 May 2022 00:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653955428; x=1685491428;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pPwRJUmGNOQnisoUhvOvCbU2RcDuuhW5wI8WgtU2Q/Q=;
  b=hAFPvpfDl5LpjTCWbuiW0O6fW46ZDeogKmhjITLpBoGxZVsoLaEGcjH1
   JDEMNl3W7Qi9kn+LfHlzoYzMzAuZ0/cDEGf456vUSCDy9zVvasnbsM5Mw
   2EHvjt7RqUyf3Y57QM85rJH9U9qgP44O4S0yaJGgAmMhdVxmcmwLQ4+Jc
   PRi4YwlFoS5LQgorFML+NYXA2aDTS6X9b/Qz9PQpV4eqaEVoxubnwMV9e
   /u4jiYe70262Ln18rLma38ogEc+hugssloMqbZSUWtdp3xK06DJDbQy5L
   VfIdPe5HfaGaiAKVql5XqEF3dXyJLbIjVyFE36V2/FKRizVyL1Xca3wCO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="274817865"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="274817865"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 17:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="679323758"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 May 2022 17:03:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvpMQ-00027b-28;
	Tue, 31 May 2022 00:03:46 +0000
Date: Tue, 31 May 2022 08:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 022897fb32ae25f7e299c649b4de74d6dbc3ee34
Message-ID: <62955b61.zRAqvz4OAs+qXfmR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_170348_912001_F338CD9B 
X-CRM114-Status: UNSURE (   6.70  )
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
branch HEAD: 022897fb32ae25f7e299c649b4de74d6dbc3ee34  Merge branch 'ath-next' into ath-qca

elapsed time: 732m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
i386                 randconfig-c001-20220530
m68k                       bvme6000_defconfig
nios2                         3c120_defconfig
arm                        keystone_defconfig
sh                          landisk_defconfig
powerpc                         ps3_defconfig
powerpc                     mpc83xx_defconfig
powerpc                        cell_defconfig
arc                           tb10x_defconfig
m68k                       m5249evb_defconfig
ia64                             alldefconfig
arm                  randconfig-c002-20220530
x86_64               randconfig-c001-20220530
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
arc                                 defconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a003-20220530
x86_64               randconfig-a001-20220530
x86_64               randconfig-a002-20220530
x86_64               randconfig-a005-20220530
x86_64               randconfig-a006-20220530
x86_64               randconfig-a004-20220530
i386                 randconfig-a002-20220530
i386                 randconfig-a006-20220530
i386                 randconfig-a003-20220530
i386                 randconfig-a004-20220530
i386                 randconfig-a005-20220530
i386                 randconfig-a001-20220530
arc                  randconfig-r043-20220530
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
riscv                    nommu_virt_defconfig
mips                        workpad_defconfig
arm                                 defconfig
arm                        multi_v5_defconfig
powerpc                   lite5200b_defconfig
powerpc                    ge_imp3a_defconfig
mips                     loongson2k_defconfig
x86_64               randconfig-a011-20220530
x86_64               randconfig-a016-20220530
x86_64               randconfig-a013-20220530
x86_64               randconfig-a012-20220530
x86_64               randconfig-a014-20220530
x86_64               randconfig-a015-20220530
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
