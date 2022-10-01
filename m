Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D531C433F5
	for <ath10k@archiver.kernel.org>; Sat,  1 Oct 2022 08:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=flN7A3LOHFpXel9a99pYi00cm/u7qmmEgRvb2t4R3oo=; b=CtCIbNikHkQwsK
	ktwgUnghyhH1WDtzuy/pE/ep/J+H2WvX4LPQQ2WTKpyI/IHsPRJLM8sPQOPJGkEmGtpB3al1cM2OK
	ajB0Qv2reMDPv+Zms4VbUntiDCPazKG/8XUKPhi2ZrBP8ZX7uurf2KbzccChkiwiR87AobJhZF9Fg
	S/xmZC3zCpS6IxGtQ6TY7Vp8nlUhAKOTlWE7A2cZmEirhl86mfNbum+cbj/qzHlqm4rpgjTKKhlW0
	GFmlAQgdrAuovsKc2iRxKs+UYBiFPszsakpNYRoB+sGXSLAI1php/EboAhTjtk9xXpj7DFJ/3ehib
	2YdEum0dMxgYdYW8v38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeXb3-00DgeR-D0; Sat, 01 Oct 2022 08:11:41 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeXb0-00Dgcq-A7
	for ath10k@lists.infradead.org; Sat, 01 Oct 2022 08:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664611898; x=1696147898;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jwJjF2VAJHexue9XELJW8UuSLTDYZRF4nQP1JRvfKRI=;
  b=CSnC7/uV27v3Im2zELAMJ6QRd1HhfwgFPjDuLrFXjomXOCaVm+txCTDt
   sC2cCwopjtGZ824vF5Hj6xYtEJHIxwIVvHlAZiBUrh5I8fr0s+aQ4VcFP
   SC5o0y8K1mBFlskHBRjMX5mXvkVBQg2m3ftkVUziBg6LoCsjI3f0exDOk
   OeVDW5KT66OEq9y5uKqDGp5+TiC8fFmgxQbSolJbh3wQ7iz18eQKhn5cO
   lpYfUCmN6Ube/8wCiCkGZNeo6MAxReEbogxZGk25ynDmYqPZWuzedh+rz
   KSGkMi8MNn4b3R2/oNQd5zT4wZ98lCr8eKmfKJrYX2TJ6sRjoXFHaCTpO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="289510846"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="289510846"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2022 01:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="685551159"
X-IronPort-AV: E=Sophos;i="5.93,360,1654585200"; 
   d="scan'208";a="685551159"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Oct 2022 01:11:21 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oeXai-00021n-2W;
	Sat, 01 Oct 2022 08:11:20 +0000
Date: Sat, 01 Oct 2022 16:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:master-pending] BUILD SUCCESS
 06a155b6b6331314c2dc5ba010960c4b9677f6db
Message-ID: <6337f5f5.ZAhWfv05dW0AJTS8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_011138_456764_E937ED3A 
X-CRM114-Status: UNSURE (   6.04  )
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
branch HEAD: 06a155b6b6331314c2dc5ba010960c4b9677f6db  Merge branch 'pending' into master-pending

elapsed time: 1507m

configs tested: 138
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
i386                 randconfig-a001-20220926
x86_64               randconfig-a002-20220926
x86_64                           rhel-8.3-syz
i386                 randconfig-a004-20220926
x86_64                              defconfig
x86_64               randconfig-a001-20220926
i386                                defconfig
i386                 randconfig-a005-20220926
x86_64               randconfig-a003-20220926
x86_64                               rhel-8.3
arm                                 defconfig
m68k                             allmodconfig
x86_64                          rhel-8.3-func
arc                              allyesconfig
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
alpha                            allyesconfig
i386                 randconfig-a006-20220926
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20220925
s390                                defconfig
x86_64                        randconfig-a011
i386                 randconfig-a002-20220926
x86_64                           allyesconfig
s390                             allmodconfig
i386                 randconfig-a003-20220926
x86_64               randconfig-a005-20220926
riscv                randconfig-r042-20220925
m68k                             allyesconfig
x86_64                        randconfig-a015
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
sh                               allmodconfig
s390                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                     ep8248e_defconfig
powerpc                     taishan_defconfig
arm                        shmobile_defconfig
ia64                                defconfig
xtensa                          iss_defconfig
arm                            mps2_defconfig
m68k                       m5249evb_defconfig
riscv                               defconfig
sh                   sh7770_generic_defconfig
mips                           ip32_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
riscv                randconfig-r042-20221001
arc                  randconfig-r043-20221001
s390                 randconfig-r044-20221001
arc                          axs101_defconfig
mips                 decstation_r4k_defconfig
sh                           se7712_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                         lpc18xx_defconfig
sh                         ap325rxa_defconfig
arm                        spear6xx_defconfig
sh                         ecovec24_defconfig
arm                           h5000_defconfig
m68k                          atari_defconfig
powerpc                      chrp32_defconfig
sh                        edosk7705_defconfig
arm                       aspeed_g5_defconfig
mips                  maltasmvp_eva_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
riscv                randconfig-r042-20220927
arc                  randconfig-r043-20220927
s390                 randconfig-r044-20220927
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
ia64                             allmodconfig
powerpc                       ppc64_defconfig
arm                           sunxi_defconfig
powerpc                     rainier_defconfig
sh                 kfr2r09-romimage_defconfig

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
hexagon              randconfig-r045-20220925
x86_64                        randconfig-a012
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
x86_64                        randconfig-a014
hexagon              randconfig-r041-20220925
x86_64                        randconfig-a016
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-k001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a015-20220926
riscv                    nommu_virt_defconfig
powerpc                        icon_defconfig
arm                          pxa168_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          moxart_defconfig
arm                         mv78xx0_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
