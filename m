Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74140C00A5A
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 00:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1PjJHv6ihFp5YOpiINqZbXfvugAKlHvqYR/OfUjgSc=; b=XIXUR/sWxUyTSU
	QE/zzoBVS8RoSCIci8FkKGqcjP3C7561ziqjVsLK0fVpy1r416jQbinv5/y1DGMuxfrTbCgMtpkU8
	REpqhOTluS1+YcDU/G6QF7J94mW31gTZGi2Cob5f0xQbvdjjp0TtGZcbkmObINM1YkDWgkYb87VT3
	xBtyU3rD+mpN5LyWTmKnrjV1e2eZJm7og84f9oHZnEtRsleTiycTR25t+jUmdQkqXfMmim9HJ12Xw
	UmJ/njAYb/sRBR2DCmvT6NyEyvTMYhOmpxB5gw4SvJNiK7Y4c/xpdXgkNMelLtC/c3qYXyzSTYSAn
	KlIflbJVULUE3F5cI3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHwDe-00GKaB-HC; Wed, 18 Jan 2023 00:22:22 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHwDb-00GKZ4-B0
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 00:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674001339; x=1705537339;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=psgwk8zg46dy5i6CtVH+qfeGEryZQBxr1mo3kw/2X3E=;
  b=NXrOcXGXqOgAA0YKdT1b+hbEMkz9qrDF03Dx/YwmRMTb22ICaDNwRTCO
   bCm13jmwsM56pk0dISKPn7DpurHklGrpoUtoovzSdspZJbLeqNT1pTES6
   cRQaAIiwBAeXOckoA61SdVnaQRxe1FfoBz9wL4A3N8I5WPQYsbJHlUudf
   PTh9lcH3fTqjrAt0cEG6EUzMHejSWn7jBVH19YB694x7z8kKZnWcJRWp6
   6DqBpLK2HJiUX9b42JHa4EIYUGyPGW9f6InN9DTZAeYHuQSBgb2RZW/XH
   OoRtf6X58cdecT/xecLHYSxxRuq7CaXc3w7VD4KWZVHukTmRpBv5yDZVP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="387206033"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="387206033"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 16:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="659568198"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="659568198"
Received: from lkp-server02.sh.intel.com (HELO f57cd993bc73) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Jan 2023 16:22:14 -0800
Received: from kbuild by f57cd993bc73 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pHwDW-0001UZ-0d;
	Wed, 18 Jan 2023 00:22:14 +0000
Date: Wed, 18 Jan 2023 08:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 179340dd4b39932a16f7db59998942494046b5a1
Message-ID: <63c73b8c.4iQNKCrwBwgzE4Gr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_162219_444422_D410C5D0 
X-CRM114-Status: UNSURE (   6.06  )
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
branch HEAD: 179340dd4b39932a16f7db59998942494046b5a1  wifi: ath10k: Remove the unused function ath10k_ce_shadow_src_ring_write_index_set()

elapsed time: 725m

configs tested: 131
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                            allnoconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
sh                               allmodconfig
ia64                             allmodconfig
x86_64               randconfig-a011-20230116
i386                          randconfig-a014
x86_64               randconfig-a013-20230116
arc                                 defconfig
x86_64               randconfig-a012-20230116
arm                                 defconfig
i386                          randconfig-a012
x86_64               randconfig-a014-20230116
mips                             allyesconfig
i386                          randconfig-a016
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                           allyesconfig
x86_64               randconfig-a016-20230116
x86_64                           rhel-8.3-syz
alpha                               defconfig
x86_64               randconfig-a015-20230116
powerpc                          allmodconfig
s390                                defconfig
x86_64                         rhel-8.3-kunit
arm                  randconfig-r046-20230117
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20230117
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
s390                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
m68k                         apollo_defconfig
um                               alldefconfig
mips                         db1xxx_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                 kfr2r09-romimage_defconfig
m68k                             allyesconfig
i386                 randconfig-a013-20230116
i386                 randconfig-a012-20230116
i386                 randconfig-a016-20230116
i386                 randconfig-a014-20230116
i386                 randconfig-a015-20230116
i386                 randconfig-a011-20230116
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                 randconfig-c001-20230116
riscv                randconfig-r042-20230116
arm                  randconfig-r046-20230115
s390                 randconfig-r044-20230116
arc                  randconfig-r043-20230116
arc                  randconfig-r043-20230115
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
arc                  randconfig-r043-20230118
sh                     sh7710voipgw_defconfig
arm                      jornada720_defconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
xtensa                  cadence_csp_defconfig
sh                             shx3_defconfig
sh                          kfr2r09_defconfig
sh                     magicpanelr2_defconfig
m68k                            q40_defconfig
ia64                      gensparse_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20230117
i386                          randconfig-a011
hexagon              randconfig-r041-20230117
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
riscv                randconfig-r042-20230117
i386                 randconfig-a003-20230116
s390                 randconfig-r044-20230117
i386                 randconfig-a005-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a006-20230116
x86_64                        randconfig-k001
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a006-20230116
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
powerpc                  iss476-smp_defconfig
arm                          sp7021_defconfig
powerpc                     ppa8548_defconfig
powerpc                        fsp2_defconfig
mips                           rs90_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     sequoia_defconfig
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                      acadia_defconfig
arm                        magician_defconfig
riscv                             allnoconfig
arm                         hackkit_defconfig
mips                          malta_defconfig
mips                        qi_lb60_defconfig
powerpc                     tqm8560_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     kmeter1_defconfig
mips                       lemote2f_defconfig
arm                            mmp2_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
