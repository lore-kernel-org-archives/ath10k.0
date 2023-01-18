Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132A3C38147
	for <ath10k@archiver.kernel.org>; Wed, 18 Jan 2023 19:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=78/BIUrNah5wPT4MOFz/2mgyjXw/SAPSNRGAKKkvAUM=; b=GxmtMsvv5zMjMC
	ehfmMEWE6kscYANHmlxnNjPQfggVWyhehBrHvYy2GK+nIpZWik/CmsYF68srcFqFdbLgNqvYtGAzY
	y02FkTq6uZdGsExsa2AO6nETiOqQFNEMo/f7gz8rwFYxpiwpvZHCGb0fLxDtHa5DsFD30Yy4D8CyK
	Gal/qNgcmeDHzsxw1PIpiXl+SipD6yxiTuThG0hNeUwfypCvhk+irFoDf2Fg86fWwV2hzpmUnRC2G
	Ge4ll9ngGLVOtkR9HVgDDNU860BNOxCEzsMeOdaJo3AwwCMLFllcZMGhQ2KHsyK1LT539jLGFay4A
	PaFh5/scDBD3fegVjErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDfa-002O53-7l; Wed, 18 Jan 2023 19:00:22 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIDfV-002O2i-Dm
	for ath10k@lists.infradead.org; Wed, 18 Jan 2023 19:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674068417; x=1705604417;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JxX4fnjmOH4g4b3OWZ+HAGa5Y2y92/H0Z2iwagzQBW8=;
  b=T56vAqHDasN8l7jxU6QayXLgovklcpukRYqeJpOPPu70yMp0IY10zNBW
   rzmkLLKjI/5po3cqJYurEibkOls0ChYWxLULVRWhag0TTwvICbH39uCz1
   fr9Mf39ec8DAdvJg/tw4VYpVmradDK5iErxSUez8WMTso2lRmnoBA6ZIh
   9eYiCGBfDVn288T7BdKIr7HvkkyYqO1ExJSu/STfeFG3OkTfuaSoiyR2U
   i0H7ZFZmq98L1jI3powI2OqaKdWnnt6lg9lWiALMqWg8z9DoaAqKKKJQO
   M2yScvYCPHXCf8d4YN7OT65r18B9/RXmEQUcheHzaLwwdtnyBJSjy7Lxl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322762447"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="322762447"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 11:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609756644"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="609756644"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 11:00:10 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIDfO-0000dj-0U;
	Wed, 18 Jan 2023 19:00:10 +0000
Date: Thu, 19 Jan 2023 02:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-next] BUILD SUCCESS
 801fc159e30d3588b0fece351e1e8bdf375590d6
Message-ID: <63c84199.gerIJxVobSmliVyf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_110017_507682_F607618A 
X-CRM114-Status: UNSURE (   7.43  )
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
branch HEAD: 801fc159e30d3588b0fece351e1e8bdf375590d6  wifi: ath12k: Add support to read EEPROM caldata

elapsed time: 730m

configs tested: 142
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
powerpc                           allnoconfig
x86_64                               rhel-8.3
arc                                 defconfig
s390                             allmodconfig
x86_64                            allnoconfig
alpha                               defconfig
x86_64                           allyesconfig
sh                               allmodconfig
i386                                defconfig
s390                                defconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-bpf
x86_64                           rhel-8.3-syz
s390                             allyesconfig
i386                 randconfig-a014-20230116
x86_64                         rhel-8.3-kunit
i386                 randconfig-a013-20230116
x86_64                           rhel-8.3-kvm
i386                 randconfig-a012-20230116
i386                 randconfig-a015-20230116
i386                 randconfig-a011-20230116
i386                 randconfig-a016-20230116
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                             allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a011-20230116
x86_64               randconfig-a013-20230116
x86_64               randconfig-a012-20230116
x86_64               randconfig-a015-20230116
x86_64               randconfig-a014-20230116
x86_64               randconfig-a016-20230116
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
m68k                            q40_defconfig
powerpc                     taishan_defconfig
sh                            titan_defconfig
powerpc                 mpc837x_mds_defconfig
mips                      maltasmvp_defconfig
riscv                randconfig-r042-20230118
s390                 randconfig-r044-20230118
arc                  randconfig-r043-20230118
powerpc                       eiger_defconfig
arc                     nsimosci_hs_defconfig
i386                          randconfig-c001
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                       m5208evb_defconfig
arm                         s3c6400_defconfig
sh                        dreamcast_defconfig
xtensa                              defconfig
mips                       bmips_be_defconfig
arm64                            alldefconfig
sh                 kfr2r09-romimage_defconfig
sh                             sh03_defconfig
powerpc                     ep8248e_defconfig
powerpc                      ppc6xx_defconfig
m68k                        m5307c3_defconfig
powerpc                      cm5200_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002

clang tested configs:
x86_64                          rhel-8.3-rust
i386                 randconfig-a002-20230116
i386                 randconfig-a004-20230116
i386                 randconfig-a003-20230116
i386                 randconfig-a001-20230116
i386                 randconfig-a006-20230116
i386                 randconfig-a005-20230116
x86_64               randconfig-a001-20230116
x86_64               randconfig-a003-20230116
x86_64               randconfig-a002-20230116
x86_64               randconfig-a004-20230116
x86_64               randconfig-a005-20230116
x86_64               randconfig-a006-20230116
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
arm                        mvebu_v5_defconfig
mips                      malta_kvm_defconfig
arm                      tct_hammer_defconfig
arm                       spear13xx_defconfig
mips                     loongson2k_defconfig
mips                  cavium_octeon_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
mips                          ath25_defconfig
powerpc                     ppa8548_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                          allyesconfig
powerpc                      ppc64e_defconfig
powerpc                    socrates_defconfig
riscv                             allnoconfig
arm                         orion5x_defconfig
arm                         hackkit_defconfig
mips                           ip22_defconfig
mips                        omega2p_defconfig
arm                          collie_defconfig
mips                          rm200_defconfig
powerpc                     skiroot_defconfig
powerpc                  mpc885_ads_defconfig
arm                          ep93xx_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                              alldefconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
